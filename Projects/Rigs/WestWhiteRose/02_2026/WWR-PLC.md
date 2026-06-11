



## Draft
### Bisher
- FB5 "LockUnlockControl"
	- prüft alle Konditionen um Bremse zu aktivieren
		- "RT_On"
		- "CHAIR->RTCS".PB_TABLE_LOCK
		- "SpeedZero"
	- setzt Timeout, wenn Endlagen nicht erreicht werden
### Neu
- FB51 "LockUnlockSequence"
	- prüft alle Konditionen um Bremse zu aktivieren
	- prüft ob Bremse in Endlage
	- dreht RT um Endlagen zu erreichen
	- gibt timeout an FB5 weiter
		- wirklich? wann?
		- gibt es noch ein timeout, wenn die seq das Lock durchführt?
			- es gibt kein timeout mehr. FB5 net4, 5, 8, 9 löschen
- FB3 "TorqueControl"
	- Es gibt bereits Logik, die auf "LockCmd" reagiert und die Torque auf 10% einstellt
- FB2 "SpeedControl"
	- asd
### #FxSwitch Replacement
```javascript
var i = {
	bStart: false,
	bActive: false,
	bSwitch: false,
	bFinished: false
};
if (i.bStart) {
	if (!i.bActive) {
		i.bActive = true;
		i.bFinished = false;
	}
	i.bStart = false;
}
if (i.bActive) {
	if (i.bSwitch) {
		i.bFinished = true;
		i.bActive = false;
	}
}
```
- Ich habe eingefügt
	- UDT7500
	- FB7500
	- FB7501
	- FB7502
- UDT7500, bzw der #FxSwitch könnte 
	- eingekürzt werden auf
	```pascal 
	bStart		: BOOL;
	bActive		: BOOL;
	bSwitch		: BOOL;
	bFinished	: BOOL;
	```
	- und dann so behandelt werden
	```pascal
	IF bStart THEN
		IF NOT bActive THEN
			bActive := TRUE;
			bFinished := FALSE;
		END_IF;
		bStart := FALSE;
	END_IF;
	IF bActive AND bSwitch THEN
		bFinished := TRUE;
		bActive := FALSE;
	END_IF;
	```

## Erkenntnisse
- FB5 "LockUnlockControl"
- Network 4/5 (RT C[C]W cylinder lock timeout)
    - variable "LockCmd" scheint der Befehl zu sein den Lock auszuführen
        - wo wird die abgefragt?
    - variablen "94W-ZS-6654[A/B]" scheinen die Rückmeldungen der Lockpins für CW/CCW zu sein
- wo werden die Ausgänge gesetzt?
    - FB5 Net3 macht den Lock
        - "-94W-HY-6656"
    - FB5 Net7 scheint den Unlock auszulösen
        - "-94W-HY-6655"

## Erkenntnisse Beispiel Autolock DeepseaHercules
- In FB6 "LockingDevices"
	- in net1 wird lock nach PLC start ausgeführt
	- in net3 wird "#tbOpenCw" und "#tbOpenCcw" geschrieben, wenn gelockt werden soll
		- wo werden die abgefragt?
		- in net3 wird openCw, openCcw und bVavleEnable verUNDet auf #sIo.sGearLockOpenValve.bValue
			- #sIo.sGearLockOpenValve.bValue ist vom Typ "#IoDoWago750508" und schreibt daher vermutlich direkt auf die Hardware
- In FB5 "LockingDeviceIo"
	- in net3 "Gear Lock Close valve" wird FB7257 aufgerufen
### FB32 "SequenceLocking"
	- Region Autolocking
		- Sequence
			- #sLockingDeviceOpenCw ist ein InOut!
				- lebt in "LockingDeviceDb".sOpenCw.sInterface
				- es werden hiervon mehrere Variablen in dieser Struktur beschrieben.
#### Ablauf Sequence
1. wir starten in iStateIdle
2. der Befehl #sOpen.bOutput kommt
3. Sprung in iStateOpen
4. Locks öffnen
	1. CW Lock-Pin in HP fahren
	2. Wenn Lock-Pin nach Timeout nicht in HP
		Sprung in iStateRotateCcw
	<!-- 2. CCW Lock-Pin in HP fahren

	3. Prüfe ob CW Lock-Pin in HP
		- Wenn erfolgreich, dann 4.4
	4. Prüfe ob CCW Lock-Pin in HP
		- Wenn erfolgreich dann -->
	 
#### iSTATEOPEN:
```pascal
// why
#bMonitorDelay := TRUE;
#sLockingDeviceCloseCw.bReset := TRUE;
#sLockingDeviceCloseCcw.bReset := TRUE;


// ############## CW öffnen ##############
// #### starten, wenn noch nicht aktiv
IF NOT #sLockingDeviceOpenCw.bActive THEN 
	// #### #sLockingDeviceOpenCw wird bei Ausführung in FB33 an FB32 übergeben
	// #### und ist das Interface vom #FxSwitch, der das Setzen des Ventils steuert.
	// #### Der #FxSwitch ist DB9.sOpenCw
	// #### er wird in FB6 net3 ausgeführt. Sein bOutput geht auf FB6.#tbOpenCw
	// #### dass wiederum auf FB6.sIo.sGearLockOpenValve.bValue geht
	// #### (sIo ist die Instanz von FB5)
	// #### sGearLockOpenValve ist ein Struct vom Typ #IoDoWago750508
	// #### im #IoDoWago750508 wird bValue verarbeitet:
	// #### 	:= FALSE wenn NOT bActive
	// #### 	invertiert wenn bInvert_RW
	// ####		etc
	#sLockingDeviceOpenCw.bStart := TRUE;

// #### fährt zum Entlasten des Pins CCW,
// #### wenn die Endlage nicht rechtzeitig erreicht werden konnte
ELSIF NOT #sLockingDeviceOpenCw.bFinished AND #sAutoFunctionStartDelay.bElapsed AND
(NOT #bCcwPrevious OR #sLockingDeviceOpenCcw.bFinished OR #bFreeRotationPrevious) THEN
// wenn OpenCw nicht fertig UND Zeit abgelauf UND zuletzt keine CCW-Rotation aktiv war
	#iState := #iSTATEROTATECCW; //V1.2.3
END_IF;



// ############## CCW öffnen ##############
// #### starten, wenn noch nicht aktiv
IF NOT #sLockingDeviceOpenCcw.bActive THEN //Prefered direction if no direction was active before, therefore needs to be placed behind CCW
	#sLockingDeviceOpenCcw.bStart := TRUE;

// #### fährt zum Entlasten des Pins CW,
// #### wenn die Endlage nicht rechtzeitig erreicht werden konnte
ELSIF NOT #sLockingDeviceOpenCcw.bFinished AND #sAutoFunctionStartDelay.bElapsed AND (NOT #bCwPrevious OR #sLockingDeviceOpenCw.bFinished OR #bFreeRotationPrevious) THEN
	#iState := #iSTATEROTATECW; //V1.2.3
END_IF;

IF #sLockingDeviceOpenCw.bFinished AND #sLockingDeviceOpenCcw.bFinished THEN
	#iState := #iSTATEIDLE;
END_IF;
IF #sClose.bOutput THEN
	#iState := #iSTATECLOSE;
	#bMonitorDelay := FALSE;
END_IF;
```
#### iSTATEROTATECCW:
```pascal
IF #sOpen.bOutput THEN
	IF NOT #sLockingDeviceOpenCw.bFinished THEN //V1.2.3
		IF NOT #sRotationCcw.bFinished THEN
			#sRotationCcw.bStart := true;
		END_IF;
		IF #sRotationCcw.bFinished THEN
			#bAutomaticSetpoint := TRUE;
			#fRotationSpeedControllerSetpoint := #fSpeedSetpointIfOperatorValueIsZero_RW;
			#fRotationTorqueControllerSetpoint := #fTorqueSetpointIfOperatorValueIsZero_RW;
		END_IF;
	ELSIF #sLockingDeviceOpenCw.bFinished THEN //V1.2.3
		#bAutomaticSetpoint := FALSE;
		#fRotationSpeedControllerSetpoint := #fZERO;
		#fRotationTorqueControllerSetpoint := #fZERO;
		#iState := #iSTATERESTOREPREVIOUSROTATIONDIRECTION;
	END_IF;
END_IF;
IF #sClose.bOutput THEN
	IF NOT #sLockingDeviceCloseCw.bFinished THEN //V1.2.3
		IF NOT #sRotationCcw.bFinished THEN
			#sRotationCcw.bStart := true;
		END_IF;
		IF #sRotationCcw.bFinished THEN
			#bAutomaticSetpoint := TRUE;
			#fRotationSpeedControllerSetpoint := #fSpeedSetpointIfOperatorValueIsZero_RW;
			#fRotationTorqueControllerSetpoint := #fTorqueSetpointIfOperatorValueIsZero_RW;
		END_IF;
	ELSIF #sLockingDeviceCloseCw.bFinished THEN //V1.2.3
		#bAutomaticSetpoint := FALSE;
		#fRotationSpeedControllerSetpoint := #fZERO;
		#fRotationTorqueControllerSetpoint := #fZERO;
		#iState := #iSTATERESTOREPREVIOUSROTATIONDIRECTION;
	END_IF;
END_IF;
//Abort sequence for any reason
IF (#sClose.bOutput AND #bOpenPreviousPrevious) OR (#sOpen.bOutput AND #bClosePrevious) THEN
	#bAutomaticSetpoint := FALSE;
	#iState := #iSTATEIDLE;
ELSIF #sAutoFunctionTimeOut.bElapsed THEN
	#iState := #iSTATERESTOREPREVIOUSROTATIONDIRECTION;
END_IF;
```
- Wo wird entschieden ob manual oder auto-lock die Hohheit über die Outputs hat?





## Versuch Simu in Gang zu setzen
### Immer "Warmstart" machen. Dann klappts auf Anhieb!
- Ich kann Aufgrund von Unterschieden FC40 "Cause&Effect" nicht online anschauen
    - Ein Vergleichsversuch des FC zeigt keinenFC auf der PLC an
### Nach Neustart geht nix mehr
- das Togglen von I_xEnable für FB6150 (Simulation) hat den Notaus resettet und alle Sensor-Werte wiederhergestellt
- "RT_ON" ist noch FALSE
- das würde sich ändern, wenn vom Chair "CHAIR->RTCS".PB_TABLE_ON_OFF kommen würde
    - wo kann ich das setzen?
    - kann ich zur Not in der PLC setzen
        - FC13 "MasterModeControl" -> net2
            - Open FB161
### RT läuft jetzt in Simu
- FB5 "LockUnlockControl
    - lock only at zero speed
        - net3 braucht "SpeedZero" = TRUE damit gelockt werden kann.
        - wenn ich das ändere, muss der speed-setpoint auf 0
            - dass passiert bereits in FB2 "SpeedCOntrol" net5
        - net2 braucht "SpeedZero" = TRUE damit autolock seq starten kann
    - no unlock in undefined state
        - net8 timeout wird aktiv, wenn "UnlockCmd" ansteht und der Endschalter nicht innerhalb von 3 Sekunden kommt
        - dieses Timeout wird aber nur in FB701 "DV_Interfaces" abgefragt
### simu läuft jetzt
- torque lässt sich nicht ändern
    - button werte aus dem HMI kommen in der PLC an!
    - torque wird in FB3 "Torque Control" net9 zurückgesetzt weil "QUICK_STOP" TRUE ist
### wie kann ich simulation starten?
    - simu starten: ![alt text](WestWhiteRose_02_26-files/image-1.png)
    - WinCC flex runtime läuft, "Simulation active" ist aktiviert
    - im FB1 "Speed Measurement"
        - ist Net10 aktiv, was die restlichen Netzwerke überspringt
        - es liegt nahe, dass noch ein Teil einer siumlation fehlt...
            - einer der Inputs von FB1 ist "I_xPulse" der die Pulse des Speedsensors entgegen nimmt
                - wo wird der geschrieben?
                - wo wird FB1 aufgerufen?
    - FB6150 "RTCS_SIMU_MAIN" scheint nicht zu laufen
        - Net3 läuft nicht
        - input I_xEnable ist FALSE
        - wo wird FB6150 aufgerufen?
            - 

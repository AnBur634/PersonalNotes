
## Alarms
### Questions
1. [x] Wie kommt die Info von FB_AlarmV4 in FB_AlarmWinCCInterface?
	- Die Aufrufe finden in 03/004/01/MonitoringAlarms(FB145) statt (FB145 lebt in MonitoringDb(DB6))
2. [x] Wo kommt der Kontext her?
	- Es gibt je
		- ein Object von ST_AlarmHmiInterfaceV4
			- Unter "03 Main Program"/"004 Monitoring"/"01 Alarms"
			- AlmDrillViewInterfaceDb(DB20)(.Static).sCommunicationsHongHuaPnPn1(ST_AlarmHmiInterfaceV4)
		- eine Instanz von FB_AlarmV4
			- Unter "03 Main Program"/"004 Monitoring"
			- MonitoringDb(DB6).sAlarms(FB_MonitoringAlarms).sCommunication(FB_MonitoringAlarmsCommunication).sHongHuaPnPn1(FB_AlarmsV4).sHmiPanelInterface.bActive
		- das dient der Gliederung in Ausführung (AlarmV4) und Datenübertragung ans HMI (AlarmHmiInterfaceV4)
3. [x] Wie wird ein Alarm ausgelöst?
	- Beim Aufruf der Instanz von FB AlarmV4 wird im Input bAlarm die Bedingung zum Auslösen übergeben
	- Die Aufrufe finden in 03/004/01/MonitoringAlarms(FB145) und untergeordneten statt
### FB_AlarmWinCCInterface
- wird als "WinCCAlarmWordX" instanziert
- kommuniziert 8 Alarme ans HMI
#### I/O
- Inputs:
	- bAckAllAlarms
	- bActive0-7
	- bUnacked0-7
- InOuts:
	- bAlarmAck0-7
- Static:
	- diverse
#### Logic
- Erkennt ob bActiveUnacknowledgedAlarm vorhanden sind
- Ack Alarme bei rEdge auf Ack von WinCC, PLC oder AckAll

### FB_AlarmV4
- behandelt alle Lebenszyklen des Alarms (Aktiv, Ack, History etc.)
- verarbeitet ein AlarmHmiInterfaceV4 Object
- am Input bAlarm wird die Condition für das Auslösen des Alarms übergeben
#### Logic
- stellt sicher, dass der Alarm für den eingestellten Zeitraum in der Historie auftaucht
	- nur das letzte Auftreten? sonst müsste ja ein Array vorhanden sein, in dem alle Auftritte vermerkt werden
- ermöglicht das Einstellen als untergeordneten Alarm, der nicht ausgelöst wird, wenn der Master-Alarm aktiv ist
- Bursthandling stellt sicher, dass ein Alarm nicht (max 1x alle 100 sekunden) zu oft ein/aus gehen kann und somit zu Überlastung führt
- stellt sicher, dass auch sehr kurze Alarme angezeigt werden
- bearbeitet ACK
- kann als Master-Alarm untergeordnete Alarme unterdrücken

### ST_AlarmHmiInterfaceV4
- struct, dass diverse Variablen bzgl. Aktiv, ACK, Shelved etc beinhaltet

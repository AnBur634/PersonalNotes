

Fürs hebewerk gibt es verschiedene Namen
	DCS = DrawWorks Control System
	DWCS = Draw Works COntrol System mit PLCimple
	DICS = quasi Nachfolger von DCS
Fragen sammeln und dann gerne auch Dennis fragen



# Encourage ZPS Optimization

## Prerequisites
- [x] PLC Software
	- [x] Checkout (Rigs Folder)
	- [x] PLC Software in VM übertragen
- [x] Panel Software
	- [x] Checkout (Rigs Folder)
- [x] Drillview
	- [x] Checkout (DLS Folder)
	- [x] Cimplicity Version in VM installieren
	- [x] Cimp Projekt in VM übertragen
- [ ] Windchill document lesen
	- [ ] 
- [x] Verbindung mit Sim testen
	- [x] VPN6 - optidrill
	- [x] TightVNC to 192.168.24.60 (DrillviewServer1)
	- [x] Proface to Chair1 (192.168.23.70 & 71)
		- [x] use joysticks to control DW
- [ ] CCS lesen
- [x] CCV lesen


## ToDos
- [ ] Umsetzung gegen Quotation-Inhalt vom CCS prüfen
	- [ ] CCV P12: A maintenance user level protected field will be implemented into the Drawworks HMI that will allow a manual input for the offset wraps. 
		- [ ] The input is limited to a tolerance window of the offset wraps which is indicated by two output fields, showing the minimum and maximum number of offset wraps
		- [ ] Additionally, an update of the function block for DDM position calculation will be implemented to achieve a more accurate layer change calculation together with the variable offset wrap implementation
		- [ ] This requires a verification of the correct DDM position indication on site. 
	- [ ] Implementation of a pre-alarm and a visual indication for the ZPS reference sensor monitoring. 
	- [ ] Added DV Alarms
	- [ ] Update advanced sensor monitoring logic - Implementation of new sensor monitoring logic that only checks for faults in case the sensor monitoring window has been passed all the way in one direction (upwards or downwards) without any change to dolly position
	- [ ] Drawworks PLC – 495dw D430:
		- [ ] DICS:
			- [ ] Updated HW Configuration and Blocks
		- [ ] ZPS:
			- [ ] Updated HW Configuration and Blocks
		- [ ] Drawworks Maintenance HMI – 11268951_DW v2.0.30:
			- [ ] Added screen sensor monitoring
		- [ ] Operational DrillView v2.4.97
			- [ ] Added new alarm messages
				- [ ] ZPS 11 (WRN) Drill floor lower ref. sensor actuated inside warning area
				- [ ] ZPS 12 (WRN) Water table upper ref. sensor actuated inside warning area
				- [ ] ZPS 41 (WRN) Drilling line diameter setting low/high




- [ ] PLC Step 7
	- [ ] Download aus Octoplant Rigs
	- [ ] im Sim VPN6 Optidrill testen
	- [ ] Project_CV auf vollständigkeit prüfen
	- [ ] Die Kommentare aller geänderten Netzwerke auf Vollständigkeit prüfen
- [ ] DrillView
	- [ ] Download aus Octoplant DLS
	- [ ] Cimplicity Version von alter Version mit der aktuellen auf Gleichheit prüfen
	- [ ] im Sim VPN6 Optidrill testen
- [ ] Documents Windchill
- [ ] Panel TIA
	- [ ] Download aus Octoplant Rigs
	- [ ] im Sim VPN6 Optidrill testen
- [ ] CCV
	- [ ] Testprozeduren durchfahren
	- [ ] Bei Änderungen
		- In Tabelle "Engineering Revisions" eintragen

## Fragen
- Wo liegt das CCS? Habe ich Zugriff?
	- Frames
- Wie kann ich im Sim das DW steuern? Die Joysticks werden in Proface nicht angezeigt, wenn ich darauf klicke!
- Wo ist die Projekt Topologie-Übersicht?
- Was ist / macht ZPS?
- ZPS Commisioning Screen
	- Changing "Drilling Line Diameter" changes "Variable Offset Wraps - Max" Value. "Variable Offset Wraps - Current" will not be adjusted, even if it is out of range now.
	- MB02 - 3.4.4: The field is not red when > +4% or < -5%
- Ist es korrekt, dass ich das TP1500 nur in meiner VM testen und nicht mit dem Sim verbinden kann?

## Links
[Sharepoint](https://hmhw.sharepoint.com/:f:/r/sites/ProjektHistorie/Shared%20Documents/Vertrag%20Doku/P000956_Songa_Encourage_GH3000_EG_01/10_Dokumentation/01_Dokumente/00_Change_Control/CCN0743%20ZPS%20optimization%20upgrade%20and%20CCN0742?csf=1&web=1&e=OGKVIZ)  
[Windchill (5515899-1)](https://windchill.capdir.net/Windchill/app/#ptc1/tcomp/infoPage?ContainerOid=OR%3Awt.pdmlink.PDMLinkProduct%3A658255444&oid=VR%3Awt.part.WTPart%3A1123714555&u8=1)

## CCS - Cost Calculation Sheet
quotation input: worum geht es?
product team: welche Aufwände gibt es im produkt team?
E&H: unsere Aufwände
	Calculation:
		HRS: Grundaufwand
		Copy: Aufwand für weitere ähnliche / gleiche Rigs
Quotation Input: Ich muss schauen, ob der Kollege das Implementiert hat, was wir dem Kunden verkauft haben

## Software Versions
### PLC
Octoplant - Rigs - DW - 
Octoplant
	rigs
		encourage
			hebewerk
				Version 42
Touchpanel in TIA TB1500

Referenz ist Enabler V47[432]

Drillview liegt im DLS Ordner ab und ist released

Sim ist auf VPN6 optidrill

CCV - Change Control Verification
	"Before downloading new software updates note down the following values" !!!!
	unter 4.x muss ich eintragen, was für die Tests benötigt wird. aber nur als lead dev
	unter 5.1.3 muss ich als peer review Eintragungen machen. auch unter 5.2.x, 5.3.x etc, je CCN
	unter 2.4 muss ich mich eintragen

Software wird diesmal auf jeden Fall als Version 430 freigegeben

Ich muss schauen, ob noch irgendetwas im Dokument fehlt, wenn es um die IBN auf dem Rig geht

Hier gibt es keine test procedures im CCN. nur im CCV

In Windchill bekomme ich die Reviewer Rolle
	Wenn ich was finde, muss ich das zurückschicken. NICHT FERTIG MELDEN!
	5515899-1 CCN 743
		Dokument öffnen. Changelog anschauen. Bei den Changes nachschauen
		Immer direkt im PDF prüfen. Nicht im Word Dokument

Step 7
	ZPS
		FC99
			Net 13
		Project_CV

Drillview Cimplicity Verion 8.10
	Es muss immer die richtige Cimplicity Version verwendet werden!
	am besten läd man eine Vorgänger Version runter
		.cfg-Datei im Editor öffnen. Hier steht die Version und Build Nummer von Cimplicity drin!
		20453 braucht sim 6 + 12
		Dennis hat eine Liste, in der die Nummern übersetzt sind
		Sonst einfach auf dem Simulator nachschauen, welche Version dort installiert ist

## Timeline
19.03.2026
- [x] ToDo:
	- mit VPN7 verbinden
	- mit WWR_KRS_Sim verbinden
	- per TightVNC mit 192.168.35.209 verbinden
	- unter F9 "DW Service" alle RedDot Screens öffnen und prüfen

24.02.2026
- CCN0119 liegt dem unten genannten Anliegen (1) zu Grunde
- [ ] Eine Test Proc muss erstellt werden um alle Änderungen zu verifizieren


16.02.2026
- DrillView liegt im Octoplant DLS Ordner  
	- sollte auch im Labor auf dem PC liegen  
		- 192.168.35.209  
		- ist auch in IPAM zu finden  
		- unter Rig  
- für Red Dot liegt ein CCN (119) vor  
	- "wrong color" ignorieren im CCN  
- Interfaces (spalten) sollen angepasst werden  
- Schwarze "red dots" müssen korrigiert werden  
- defekte red dots müssen erfasst werden  
- wenn red dots ok, dann spalten breiten korrigieren  
- Cimplicity  
	- Open Group  
	- Open Framecontainer  
- Wenn die spalten korrigiert werden, wird das Platz nicht mehr ausreichen.  
	- daher müssen Elemente der 2. Spalten auf eine neue Seite migriert wreden  
- zum verschieben, elemente gruppieren, dann links auf auf neue seite verschieben  
- wenn ich Eingabefelder verschiebe, immer mit gedrückter ALT Taste, damit die Höhe nicht verändert wird  
- Doppelklick auf Gruppe,  
	- in objects den pointsFrameContainerHeader -> properties -> variables -> Variable "Tabs" setzen - auf die anzahl der Seiten (wenn ich eine hinzufüge, +1)  
- Unter den group object "PointsFrame" sehe ich wie viele Seiten. Ausserdem den Seitennamen anpassen  
- Auf meiner VM muss ich Cimplicity HMI 8.2.00001 und 00012 installieren  
	- liegen auf der VM im User folder -> "installation files" 

## Results

### Red Dots fixed for
#### Class
MonDeaLimComMap
MonIntPosSpeSel


- [x] Interface Udp
- [!] Interface
	- Vibration Monitoring
		- [!] Connection
- [ ] Monitoring
	- Interlocks
		- [!] Position
			- Load
				- Limit Drawworks
					- Single Line Load [One/Two/Three/Five] Motor  
						![alt text](attachments/image-1.png)
					- Velocity limited due to mechanical restrictions  
						![alt text](attachments/image-2.png)
				- Limit Hook
					- Deal Max
						![alt text](attachments/image-3.png)
						- Operator Status  
							![alt text](attachments/image-4.png)
					- Deal Min  
						![alt text](attachments/image-5.png)
						- Operator Status  
							![alt text](attachments/image-6.png)
				- Veloctiy limited by...  
					![alt text](attachments/image-7.png)
			- Stop positions
				- Velocity limited behind working point
					![alt text](attachments/image-8.png)
				- Velocity limited behind floor or crown saver
					![alt text](attachments/image-9.png)
				- Movement stopped at... (all three)
					![alt text](attachments/image-10.png)
			- Speed selection
				![alt text](attachments/image-11.png)
			- Auto Driller
				- Limited by Rate Of penetration limit
					- speed is limited...  
					![alt text](attachments/image-12.png)
			- Velocity (all three subs)
				- ![alt text](attachments/image-13.png)
		- Sequence
			- Test
				- Eddy Current Brake
					- Velocity limited...
						![alt text](attachments/image-14.png)
						![alt text](attachments/image-15.png)
	- Shutdown
		- Sequence
			- Motor Stop Ramp
				![alt text](attachments/image-16.png)
			- Disk Brake Stop Ramp
				![alt text](attachments/image-17.png)
	- Anti Collision
		- Position limited by SZMS
			![alt text](attachments/image-18.png)

![alt text](attachments/image-19.png)  
![alt text](attachments/image-20.png)
![alt text](attachments/image-21.png)
![alt text](attachments/image-22.png)
![alt text](attachments/image-23.png)
![alt text](attachments/image-24.png)
![alt text](attachments/image-25.png)
![alt text](attachments/image-26.png)
![alt text](attachments/image-27.png)
![alt text](attachments/image-28.png)
![alt text](attachments/image-29.png)
![alt text](attachments/image-30.png)
![alt text](attachments/image-31.png)
![alt text](attachments/image-32.png)
![alt text](attachments/image-33.png)
![alt text](attachments/image-34.png)
![alt text](attachments/image-35.png)

- System Resources
	Version correct?
	![alt text](attachments/image-36.png)

- Sequence [DONE]
- Position
	![alt text](attachments/image-37.png)  

- Next up: Lubrication Shift









## Vorgehen Arbeitsbeginn
1. VM öffnen
    1. Anyconnect verbinden
        - VPN 7
        - KRS-WWR-Sim
    2. PLC anpingen: 192.168.35.12
    2. Step7 öffnen
        - Options -> 'Set PG/PC Interface...'
            - 'Cisco[...].TCPIP.1' auswählen und 'OK' (!!NICHT '[...]TCPIP.Auto')
            - Diagnostic auswählen und auf Test klicken
                Wenn "access points using this parameter set: -> S7ONLINE", dann gut
2. Auf dem PC
    1. Anyconnect verbinden
        - VPN 7
        - KRS-WWR-Sim
    2. TightVNC öffnen
        - Verbinden mit 192.168.36.110 (DV-Rechner)

## PLC Restart
1. OB1
    - Net 5: set I_xEnable := TRUE

## Button Colors in Char
- Grey: No Communication
- Dark Blue: Not Active
- Light Blue: Active
- Red: Error
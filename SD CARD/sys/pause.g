; pause.g
; called when a print from SD card is paused
;
; generated by RepRapFirmware Configuration Tool on Tue Jun 26 2018 13:03:45 GMT-0400 (EDT)
M83            ; relative extruder moves
G1 E-14 F1500  ; retract 10mm of filament
G91            ; relative positioning
G1 Z5 F360     ; lift Z by 5mm
G90            ; absolute positioning
G1 X0 Y0 F6000 ; go to X=0 Y=0
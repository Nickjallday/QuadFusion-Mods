; cancel.g
; executed when the user cancels their print after pausing it.
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Tue Sep 08 2020 09:53:11 GMT-0500 (Central Daylight Time)
M140 S0                      ; Heated Bed Off
M104 S0                      ; Extruder Off
G91                          ; Relative positioning
G1 E-2 F300                  ; Release Bowden Pressure by 2mm
G1 Z+0.5 E-3 X-20 Y-20 F9000 ; Move Z up, Shift X/Y, Retract Filament
G90                          ; Absolute positioning
G1 X0 Y230                   ; Move Bed Forward for Access
M106 P1 S0	                 ; Fans Off
M84                          ; Steppers Off

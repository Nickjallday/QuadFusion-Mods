; cancel.g
; Called when a print is canceled.

; Configuration file for M3D QuadFusion Duet Maestro (firmware version 2.0.3 or newer)
; Created by PrintM3D
; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 5/8/2020

;This file is executed when the user cancels a print after pausing it.
M140 S0                      ; Heated Bed Off
M104 S0                      ; Extruder Off
G91                          ; Relative positioning
G1 Z+0.5 X-20 Y-20 F9000     ; Move Z up, Shift X/Y,
G90                          ; Absolute positioning
G28 X0 Y0                    ; Move X/Y to min Endstops
G1 Y220                      ; Move Bed Forward for Access
M106 P1 S0                   ; Tool Fans Off
M84                          ; Steppers Off
M117 Print Canceled...
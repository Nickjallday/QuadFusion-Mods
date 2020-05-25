; homey.g
; called to home the Y axis

; Configuration file for M3D QuadFusion Duet Maestro (firmware version 2.0.3 or newer)
; Created by RepRap Configuration Tool
; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 5/8/2020

G91              ; relative positioning
G1 Z5 F6000 S2   ; lift Z relative to current position

G1 S1 Y-505 F3000  ; move quickly to Y axis endstop and stop there (first pass)
G1 S2 Y10 F900     ; go back a few mm
G1 S1 Y-505 F360   ; move slowly to Y axis endstop once more (second pass)
G1 S2 Y52 F900      ; go back a few mm
G1 Z-5 F6000 S2    ; lower Z again
G90                ; absolute positioning
G92 Y0		       ;Y is at 0

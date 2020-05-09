; homex.g
; called to home the X axis

; Configuration file for M3D QuadFusion Duet Maestro (firmware version 2.0.3 or newer)
; Created by PrintM3D
; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 5/8/2020

G91               ; relative positioning
G1 Z5 F600 S2     ; lift Z prior to X Move.

G1 S1 X-305 F3000 ; move quickly to X axis endstop and stop there (first pass)
G1 X10 F900       ; go back a few mm
G1 S1 X-305 F360  ; move normally to X axis endstop once more (second pass)
G1 X15 F900       ; Move to Corner
G92 X0            ; X is at Zero
G1 Z-5 F600 S2    ; lower Z again

G90               ; absolute positioning

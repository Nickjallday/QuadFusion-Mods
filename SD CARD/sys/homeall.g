; homeall.g
; Called to Home All Axes

; Configuration file for M3D QuadFusion Duet Maestro (firmware version 2.0.3 or newer)
; Created by Sindarius
; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 5/8/2020

;XY Homeing
G91                     ; relative positioning
G1 Z10 F600 S2          ; lift Z prior to X Move.
G1 S1 X-305 Y-555 F3000 ; move quickly to X axis endstop and stop there (first pass)
G1 X10 Y10 F900         ; go back a few mm
G1 S1 X-305 Y-555 F360  ; move normally to X axis endstop once more (second pass)
G1 X15 Y52 F900         ; Move to Corner
G92 X0 Y0               ; X/Y is at Zero

;Non-BLTouch Z Home Configuration
G1 Z-450 F1002 S1
G1 Z10 F360 S2
G1 Z-450 F120 S1

;BL Touch Z Home Configuration
;G91                     ; relative positioning
;G1 Z10 F6000 S2         ; lift Z relative to current position
;G90                     ; absolute positioning
;G1 X68.5 Y122.5 F3600   ; Bed Center Probe location, X=117.5 - (X offset from config.g), Y=117.5 - (Y offset from config.g)
;G30                     ; home Z by probing the bed
;G91                     ; relative positioning

G1 Z10 F360         ;lift Z relative to current position
G90                 ; absolute positioning
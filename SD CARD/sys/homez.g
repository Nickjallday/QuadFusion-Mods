; homez.g
; called to home the Z axis
;
; Configuration file for M3D QuadFusion Duet Maestro (firmware version 2.0.3 or newer)
; Created by Sindarius
; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 5/8/2020

;Traditional Z-Endstop Configuration
G91              ; relative positioning
G1 Z10 F1200 S2   ; lift Z relative to current position
G90              ; absolute positioning
G1 X0 Y0 F3600  ; go to first probe point
G1 Z-450 F1200 S1; Quickly go to z min
G1 Z5 F600 S2    ; Lift Z to re-check
G1 Z-450 F120 S1 ; Slowly lower to Z-min
G91              ; relative positioning
G1 Z5 F360 S2    ; lift Z relative to current position

;BL Touch Configuration
;G91                     ; relative positioning
;G1 Z10 F6000 S2         ; lift Z relative to current position
;G90                     ; absolute positioning
;G1 X66 Y105 F3600	; Bed Center Probe location, X=117.5 - (X offset from config.g), Y=117.5 - (Y offset from config.g)
;G30                     ; home Z by probing the bed
;G91                     ; relative positioning
;G1 Z10 F360 S2          ; lift Z relative to current position

G90                      ; absolute positioning
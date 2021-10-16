; homez.g
; called to home the Z axis

G91                     ; relative positioning
G1 S2 Z5 F1000             ; lift Z relative to current position
G90                     ; absolute positioning
G1 X164 Y125 F7200	    ; Bed Center Probe location, X=117.5 - (X offset from config.g), Y=117.5 - (Y offset from config.g)
G30                     ; home Z by probing the bed


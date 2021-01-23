; homey.g
; called to home the Y axis

G91               ; relative positioning
G1 S2 Z5 F1000    ; lift Z relative to current position
G1 S1 Y-505 F1800 ; move quickly to Y axis endstop and stop there (first pass)
G1 S2 Y52 F900    ; go back a few mm
G1 S1 Y-505 F240  ; move slowly to Y axis endstop once more (second pass)
G1 S2 Y52 F3000   ; go back a few mm
G92 Y0		      ; Y is at 0
G1 S2 Z-5 F1000   ; lower Z again
G90               ; absolute positioning

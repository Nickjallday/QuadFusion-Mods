; homez.g
; called to home the Z axis

G91               ; relative positioning
G1 Z5 F1000 S2    ; lift Z relative to current position
G90               ; absolute positioning
G1 X0 Y0 F3600    ; go to first probe point
G1 Z-450 F1200 S1 ; Quickly go to z min
G1 Z5 F600 S2     ; Lift Z to re-check
G1 Z-450 F120 S1  ; Slowly lower to Z-min
G91               ; relative positioning
G1 Z5 F360 S2     ; lift Z relative to current position
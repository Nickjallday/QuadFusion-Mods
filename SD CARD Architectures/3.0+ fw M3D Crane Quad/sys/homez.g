; homez.g
; called to home the Z axis

G91               ; relative positioning
G1 H2 Z5 F1000    ; lift Z relative to current position
G90               ; absolute positioning
G1 X0 Y0 F3600    ; go to first probe point
G1 H1 Z-450 F1200 ; Quickly go to z min
G1 H2 Z5 F600     ; Lift Z to re-check
G1 H1 Z-450 F120  ; Slowly lower to Z-min
G91               ; relative positioning
G1 H2 Z5 F360     ; lift Z relative to current position
G90               ; absolute positioning
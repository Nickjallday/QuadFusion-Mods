; homex.g
; called to home the X axis

G91               ; relative positioning
G1 H2 Z5 F1000    ; lift Z prior to X Move.
G1 H1 X-305 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 H2 X5 F900     ; go back a few mm
G1 H1 X-305 F240  ; move normally to X axis endstop once more (second pass)
G1 X15 F900       ; Move to Corner
G92 X0            ; X is at Zero
G1 H2 Z-5 F600    ; lower Z again
G90               ; absolute positioning

; homeall.g
; called to home all axes

;XY Homeing
G91               	; relative positioning
G1 H2 Z5 F1000      	; lift Z prior to X Move.
G1 H1 X-305 Y-555 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 H2 X5 Y5 F900        ; go back a few mm
G1 H1 X-305 Y-555 F240  ; move normally to X axis endstop once more (second pass)
G1 X1 Y26 F3000    	; Move to Corner
G92 X0 Y0           	; X is at Zero
G90                     ; absolute positioning

;Z homing
G1 X165 Y115 F6000	    ; Bed Center Probe location, X=115 + (X offset from config.g), Y=115 + (Y offset from config.g)
G30                     ; home Z by probing the bed


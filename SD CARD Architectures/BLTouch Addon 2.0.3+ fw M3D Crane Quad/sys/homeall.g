; homeall.g
; called to home all axes

;XY Homeing
G91               	; relative positioning
G1 Z5 F600 S2     	; lift Z prior to X Move.
G1 S1 X-305 Y-555 F6000 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F900 Y5        	; go back a few mm
G1 S1 X-305 Y-555 F240  ; move normally to X axis endstop once more (second pass)
G1 X15 Y52 F3000    	; Move to Corner
G92 X0 Y0           	; X is at Zero
G90                     ; absolute positioning

;Z homing
G1 X164 Y125 F6000	; Bed Center Probe location, X=115 + (X offset from config.g), Y=115 + (Y offset from config.g)
G30                     ; home Z by probing the bed


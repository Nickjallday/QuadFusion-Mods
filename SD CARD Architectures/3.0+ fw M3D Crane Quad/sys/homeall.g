; homeall.g
; Called to Home All Axes

;XY Homeing
G91               	    ; relative positioning
G1 H2 Z5 F1000      	; lift Z prior to X Move.
G1 H1 X-305 Y-555 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 H2 X5 Y5 F900        ; go back a few mm
G1 H1 X-305 Y-555 F240  ; move normally to X axis endstop once more (second pass)
G1 X15 Y52 F3000    	; Move to Corner
G92 X0 Y0           	; X is at Zero


;Z homing
G90                     ; absolute positioning
G1 H1 Z-450 F1200    	; Quickly go to z min
G1 H2 Z5 F600        	; Lift Z to re-check
G1 H1 Z-450 F120     	; Slowly lower to Z-min
G91               	    ; relative positioning
G1 H2 Z5 F360       	; lift Z relative to current position
G90                     ; absolute positioning
G28 X Y ; home X and Y, hope that Z hasn't moved
M116 ; wait for temperatures
M83 ; relative extrusion
G1 Z-3 E5 F1500 ; undo the retraction that was done in the M911 power fail script
M117 Recovering, Set Mix %s Now!
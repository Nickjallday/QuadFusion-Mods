1. Copy and Paste the "sys", "macros", & "menu" folder to the root of your SD Card. They will add nessesary BLTouch files to the SD card.

2. Replace the "; Axis Limits" in your /sys/config.g with the following settings

; Axis Limits
M208 X-15 Y-52 Z-5 S1                              ; set axis minima
M208 X245 Y235 Z250 S0                             ; set axis maxima

3. Replace the "; Endstops" in your /sys/config.g with the following settings

; Endstops
M574 X1 Y1 S1                                      ; set active high endstops
M574 Z1 S2                                         ; set endstops controlled by probe

4. Add the "; Z-Probe" commands below after the "; Endstops" commands in your /sys/config.g

; Z-Probe
M558 P9 H5 F120 T7200                              ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X49 Y10 Z0.0                              ; set Z probe trigger value, offset and trigger height
M557 X35:195 Y35:195 S40                           ; define mesh grid

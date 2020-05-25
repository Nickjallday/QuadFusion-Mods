; Configuration file for M3D QuadFusion Duet Maestro (firmware version 2.0.3 or newer)
; Created by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Created Date: 5/8/2020

NOTE: Macro folder contains macros that are required by the LCD Screen Menu.

1. Update your Duet2 Maestro Firmware to 2.03+ (I'm using 2.0.5.1)
   Power off printer when complete

2. BACKUP YOUR ENTIRE SD CARD!

3. Delete your SD Card

4. Copy the included folders to the empty root directory of your SD Card:
/filaments
/gcodes
/macros
/menu
/sys
/www

5. Open your old /sys/motion.g and copy your M92, EX:X:X:X values on your new /sys/new motion.g M92, EX:X:X:X values.

6. *Optional (For Traditional Z-endstop):
Delete: 
/macros/BLTouch (you will need to redownload this if you ever install a BLTouch).

7. *Optional (For BLTouch Integration):
Notes: 
BLTouch Macros folder is required for LCD screen BLTouch Menu
deployprobe.g, and retractprobe.g in the sys folder are required if you're not copying the entire SD card.

BLTouch Integration File Edits:
/menu/e_main

a. Comment Out:
; w/o BLTouch Menu
button R63 C5 T"Network IP" A"menu networkip"
button R75 C5 T"Powerloss Recovery" A"menu powerRecover"
button R87 C5 T"PRINT" A"menu listFiles"

b. Comment In:
; w/ BLTouch Menu
;button R63 C5 T"BLTouch Controls" A"menu bltouch"
;button R75 C5 T"Network IP" A"menu networkip"
;button R87 C5 T"Powerloss Recovery" A"menu powerRecover"
;button R99 C5 T"PRINT" A"menu listFiles"

/menu/bedleveling

a. Comment In:
;button R51 C5 T"Auto Bed Leveling" A"M98 P#0" L"/macros/Auto_Bed_Leveling"

/sys/config.g

a. Comment In:
;BL Touch Configurations:
; A= # of probes, P Probe Type = 9 (BL Touch) F= Probe Speed mm/min, T= Speed between probe locations mm/min 
;M558 P9 H3 F120 A1 T9000 
;
; X & Y= Min/Max Probeable bed locations, S= X area divided by 4, for 5 probe locations (THESE ARE ACTUAL PROBE LOCATIONS DO NOT INCLUDE OFFSET).
;M557 X35:195 Y10:220 S40 ; define mesh grid and interval for polling
;
;X/Y Probe distance from nozzle (If Nozzle is at the bed's X0/Y0), and Z probe height offset from nozzle at 0mm on bed (offsets set for Nickjallday's Fan shroud).
;G31 X49 Y0 Z0.0 P25 

2. Set your offset for your BLTouch Mount and you distance form the probes activation point to your nozzle in Line: G31 X49 Y0 Z0.0 P25 and your Z-Offset

/sys/homeall.g

a. Comment Out:
;Non-BLTouch Z Home Configuration
G1 Z-450 F1002 S1
G1 Z10 F360 S2
G1 Z-450 F120 S1

b. Comment In:
;BL Touch Z Home Configuration
;G91                     ; relative positioning
;G1 Z10 F6000 S2         ; lift Z relative to current position
;G90                     ; absolute positioning
;G1 X68.5 Y122.5 F3600   ; Bed Center Probe location, X=117.5 - (X offset from config.g), Y=117.5 - (Y offset from config.g)
;G30                     ; home Z by probing the bed
;G91                     ; relative positioning

/sys/homez.g

a. Comment Out:
;Non-BLTouch Z Home Configuration
G91               ; relative positioning
G1 Z10 F1200 S2   ; lift Z relative to current position
G90               ; absolute positioning
G1 X15 Y15 F3600  ; go to first probe point (Comment out for Y-enstop mod for printable bed thumb screws)
;G1 X15 Y9 F3600  ; go to first probe point (Comment in for Y-enstop mod for printable bed thumb screws)
G1 Z-450 F1200 S1 ; Quickly go to z min
G1 Z5 F600 S2     ; Lift Z to re-check
G1 Z-450 F120 S1  ; Slowly lower to Z-min

b. Comment In:
;BL Touch Z Home Configuration
;G91                     ; relative positioning
;G1 Z10 F6000 S2         ; lift Z relative to current position
;G90                     ; absolute positioning
;G1 X68.5 Y122.5 F3600   ; Bed Center Probe location, X=117.5 - (X offset from config.g), Y=117.5 - (Y offset from config.g)
;G30                     ; home Z by probing the bed
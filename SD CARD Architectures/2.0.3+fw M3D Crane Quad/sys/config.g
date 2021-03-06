; config.g
; Main Configuration file that runes on power on.

; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 1/22/2021

; General preferences
G90				; Send absolute coordinates...
M83				; ...but relative extruder moves
M550 PCraneQuad                 ; Set machine name
M555 P1                         ; Set firmware compatibility to look like RepRapFirmare
M918 P1 E4 		        ; Configure LCD Display

; Network
M552 P0.0.0.0 S1               	; Enable network and acquire dynamic address via DHCP
M586 P0 S1                     ; Enable HTTP
M586 P1 S0                     ; Disable FTP
M586 P2 S0                     ; Enable Telnet

; Drivers
M569 P0 S1 D3 V0                                             ; physical drive 0 goes forwards  (Stealthchop2 auto off @ 100.8 mm/s change V0 -> V93) 
M569 P1 S0 D3 V0                                             ; physical drive 1 goes backwards (Stealthchop2 auto off @ 100.8 mm/s change V0 -> V93) 
M569 P2 S0 D3 V0                                             ; physical drive 2 goes backwards (Stealthchop2 auto off @ 3.0 mm/ change V0 -> V620) 
M569 P3 S1 D2 V0                                             ; physical drive 3 goes forwards
M569 P4 S1 D2 V0                                             ; physical drive 4 goes forwards
M569 P5 S1 D2 V0                                             ; physical drive 5 goes forwards
M569 P6 S1 D2 V0                                             ; physical drive 6 goes forwards
M584 X0 Y1 Z2 E3:4:5:6                                       ; set drive mapping
M350 X16 Y16 Z16 E16:16:16:16 I1                             ; configure microstepping with interpolation
M92 X80 Y80 Z400 E2140:2140:2140:2140   		     ; set steps per mm
M566 X600 Y600 Z24 E120 P1   				     ; set maximum instantaneous speed changes (mm/min)
M203 X9000 Y9000 Z1200 E1800 				     ; set maximum speeds (mm/min)
M201 X1200 Y1200 Z100 E240 		     		     ; set accelerations (mm/s^2)
M204 P500 T1200					             ; set acceleration for Print Moves (P) and Travel Moves (T)
M906 X760 Y760 Z760 E460:460:460:460 I50                     ; set motor currents (mA) and motor idle factor in per cent (STOCK MOTORS)
;M906 X760 Y760 Z760 E260:260:260:260 I50                    ; set motor currents (mA) and motor idle factor in per cent (JOHN'S COMMUNITY MOTORS)
M84 S30                                                      ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                             ; set axis minima
M208 X230 Y230 Z250 S0                                       ; set axis maxima

; Endstops
M574 X1 Y1 Z1 S1	     				     ; Set active High Endstops

; Heaters
M305 P0 T100000 B4036		      		             ; Thermistor Config for NTC 100k
M143 H0 S125                   			             ; Set temperature limit for heater 0 to 120C
M140 S0							     ; map heated bed to heater 0
M305 P1 T100000 B5060 C1.890000e-7		             ; Thermistor Config for NTC 100k   Tuned for MK4 nozzles
M143 H1 S260      				             ; Set temperature limit for heater 1 to 260C

; Fans
M106 P0 T45 H1 F50                         		     ; Set Heatsink Fan F0 to Thermostatic
M106 P1 H-1 F50 L51 X255                                     ; Set Part Cooler Fans F1 to Gcode Control (20%Min 100%Max)
M106 P2 S0.8 F50                                             ; Set case fan always on at 100% (P2 Fan) 

; Tools
M563 P0 D0:1:2:3 H1 F1 S"Quad"				     ; Define default tool
M567 P0 E0.25:0.25:0.25:0.25
G10 P0 X0 Y0 Z0
G10 P0 S0

; Custom Settings
M207 S1.0 F1200 Z0.2 					     ; Firmware Retraction S sets retraction in mm.  F sets feed rate.  Z sets Z lift. (only recommended using G10/G11 FWretract commands with John's motors) 
M572 D0:1:2:3 S0.22:0.22:0.22:0.22                           ; Pressure Advance calibration T0:T1:T2:T3
M912 P0 S0.00									   ; MCU Temp Cal, Turn Printer off and let cool for several hours before cal, S=Tr-Tc, Tr=(ColdNozzleTemp+ColdBedTemp)/2, Tc=MCU Temp <10 seconds after boot

; Misc
M911 S21.0 R23.0 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"       ; Powerloss Auto-save Print Recovery
M501                             			     ; Load saved parameters from non-volatile memory
G1 F60 							     ; Set Feedrate of 1mm/s onload
T0
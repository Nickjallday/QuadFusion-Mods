; config.g
; Main Configuration file that runes on power on.

; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 1/22/2021
G90                                                          ; send absolute coordinates...
M83                                                          ; ...but relative extruder moves
M550 P"M3D Quad Crane"                                       ; set printer name
M555 P1                                                      ; Set firmware compatibility to look like RepRapFirmare
M918 P1 E4 F2000000                                          ; configure direct-connect display

; Network
M552 P0.0.0.0 S1                                             ; enable network and acquire dynamic address via DHCP
M586 P0 S1                                                   ; enable HTTP
M586 P1 S0                                                   ; enable FTP
M586 P2 S0                                                   ; enable Telnet

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
M208 X-15 Y-52 Z0 S1                                         ; set axis minima
M208 X245 Y235 Z250 S0                                       ; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                                          ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                                          ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S1 P"zstop"                                          ; configure active-high endstop for low end on Z via pin zstop

; Heaters
M308 S0 P"bedtemp" Y"thermistor" A"Bed" T100000 B4036      	        ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                               	     		; create bed heater output on bedheat and map it to sensor 0   
M307 H0 B0 S1.0 			             	     		; disable bang-bang mode for the bed heater, PWM Limit.
M140 H0                                             	     		; map heated bed to heater 0
M143 H0 S130                                        	     		; set temperature limit for heater 0 to 130C
M308 S1 P"e0temp" Y"thermistor" A"Nozzle" T100000 B5060 C1.890000e-7    ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                         		; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.0 						     	; disable bang-bang mode for heater  and set PWM limit.
M143 H1 S255						     		; set temperature limit for heater 0 to 265C						     

; Fans
M950 F0 C"fan0" Q500                            	     ; create fan 0 on pin fan0 and set its frequency
M106 P0 C"Case Fan" S1 H1 T45                                ; set fan 0 value. Thermostatic control is turned on
M950 F1 C"fan1" Q500                                 	     ; create fan 1 on pin fan1 and set its frequency
M106 P1 C"Nozzle Fan" S1 H-1                                 ; set fan 1 value. Thermostatic control is turned off
M950 F2 C"fan2" Q500                                         ; create fan 2 on pin fan2 and set its frequency
M106 P2 C"Coldend Fan" S0.8 H1:0 T45                         ; set fan 2 value. Thermostatic control is turned on

; Tools
M563 P0 D0:1:2:3 H1 F1 S"Quad"                               ; define tool 0
G10 P0 X0 Y0 Z0                                              ; set tool 0 axis offsets
G10 P0 R0 S0                                                 ; set initial tool 0 active and standby temperatures to 0C
M568 P0 S1                                                   ; enable mixing for tool 0
M567 P0 E0.25:0.25:0.25:0.25   	                             ; set mixing ratios for tool 0

; Custom settings
M207 S1.0 F1200 Z0.2 					     ; Firmware Retraction S sets retraction in mm.  F sets feed rate.  Z sets Z lift. (only recommended using G10/G11 FWretract commands with John's motors) 
M572 D0:1:2:3 S0.22:0.22:0.22:0.22                           ; Pressure Advance calibration T0:T1:T2:T3

; Miscellaneous
G1 F60 							     ; Set Feedrate of 1mm/s onload
M501                                                         ; load saved parameters from non-volatile memory
M911 S21 R23 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"           ; set voltage thresholds and actions to run on power loss
T0							     ; Select Tool at Startup

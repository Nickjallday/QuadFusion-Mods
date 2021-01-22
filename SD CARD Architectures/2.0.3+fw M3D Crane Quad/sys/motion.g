; motion.g

; Configuration file for M3D QuadFusion Duet Maestro (firmware version 2.0.3 or newer)
; Created by PrintM3D
; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 1/22/2020

M569 P0 S1 D3 V0                                             ; physical drive 0 goes forwards
M569 P1 S0 D3 V0                                             ; physical drive 1 goes backwards
M569 P2 S0 D3 V0                                             ; physical drive 2 goes backwards
M569 P3 S1 D2 V0                                             ; physical drive 3 goes forwards
M569 P4 S1 D2 V0                                             ; physical drive 4 goes forwards
M569 P5 S1 D2 V0                                             ; physical drive 5 goes forwards
M569 P6 S1 D2 V0                                             ; physical drive 6 goes forwards
M584 X0 Y1 Z2 E3:4:5:6                                       ; set drive mapping
M350 X16 Y16 Z16 E16:16:16:16 I1                             ; configure microstepping with interpolation
M92 X80 Y80 Z400 E2140:2140:2140:2140   		     ; set steps per mm
M566 X900 Y900 Z90 E120     				     ; set maximum instantaneous speed changes (mm/min)
M203 X9000 Y9000 Z1002 E600 				     ; set maximum speeds (mm/min)
M201 X1200 Y1200 Z90 E240 		     		     ; set accelerations (mm/s^2)
M906 X725 Y725 Z725 E460:460:460:460 I30                     ; set motor currents (mA) and motor idle factor in per cent (STOCK MOTORS)
;M906 X725 Y725 Z725 E260:260:260:260 I30                    ; set motor currents (mA) and motor idle factor in per cent (JOHN'S COMMUNITY MOTORS)
M84 S30                                                      ; Set idle timeout

;Firmware Retraction (Activated in a slicer by sending G10/G11 Commands)
M207 S2.0 R0.0 F300 T300 Z0 				     ;S sets retraction and reprime in mm.  F sets feed rate.  F300 and S2.0 are max recommended.  Ignore this setting in gcode without G10/G11 calls.

;Axis Limits
M208 X0 Y0 Z0 S1				                ; Set axis minima
M208 X230 Y230 Z250 S0				            ; Set axis maxima

;Endstops
M574 X1 Y1 Z1 S1					            ; Set active High Endstops

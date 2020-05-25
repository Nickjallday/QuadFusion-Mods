; config.g
; Main Configuration file that runes on power on.

; Configuration file for M3D QuadFusion Duet Maestro (firmware version 2.0.3 or newer)
; Created by Sindarius
; Edited by Nickjallday (https://github.com/Nickjallday/QuadFusion-Mods)
; Edited Date: 5/8/2020

M98 Pgeneral.g                   ; Call General Configuration Module
M98 Pnetwork.g                   ; Call Network Module
M98 Pmotion.g                    ; Call Kinematics/Motor Module
M98 Pthermal.g                   ; Call Heater/Fan/Sensing Module
M98 Ptools.g                     ; Call Toolhead Module

;Addon Configurations:
;
; Auto-save Print Recovery
M911 S21.0 R23.0 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"

;BL Touch Configurations:
; A= # of probes, P Probe Type = 9 (BL Touch) F= Probe Speed mm/min, T= Speed between probe locations mm/min 
;M558 P9 H3 F120 A1 T9000 
;
; X & Y= Min/Max Probeable bed locations, S= X area divided by 4, for 5 probe locations
;M557 X35:195 Y10:220 S40 ; define mesh grid and interval for polling
;
;X/Y Probe distance from nozzle (If Nozzle is at the bed's X0/Y0), and Z probe height offset from nozzle at 0mm on bed (offsets set for Nickjallday's Fan shroud).
;G31 X49 Y0 Z0.0 P25 
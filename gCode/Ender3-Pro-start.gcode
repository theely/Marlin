; Ender 3 Custom Start G-code
; Heating while homing (BL-Touch)
; Nozzle wipe, remove residual due to filament expansion
; Level-bed
; Re-home (adjust for thermal expansion)
; Prepare nozzle

; Start Pre-heating to avoid Cura heating sequentially bed & extrudeer
M117 Pre-heating.
M140 S{material_bed_temperature}
M104 S{material_print_temperature} ﻿T0

; Do init stuf while heating
G92 E0                ; Reset Extruder
G28                   ; Home all axes
G1 X0 Y0 Z10 F5000    ; Move Z Axis up little to prevent scratching of Heat Bed

; Continue Pre-heating
M190 S{material_bed_temperature}
M109 S{material_print_temperature} ﻿T0

; Nozzle Wipe and Retraction
M117 Nozzle Wipe.
G1 X0 Y5 Z1.6 F5000.0      ;Go to front
G92 E0                     ;Reset extruder
G1  E30 F80                ;Extrude 30mm
G92 E0                     ;Zero the extruded length
G1 X0 Y0 Z5.0 F4000 E-20   ;Quickly wipe away and retract

; Bed Leveling and re-homing
M117 Bed Leveling.
G29 F20 L40 R160 B210 ; Auto bed-level (BL-Touch)
G28                   ; Re-Home all axes due to termal expansion

; Start Pre-print sequence
M117 Nozzle warm up.
G92 E0                        ; Reset Extruder
G1 Z15.0 F3000                ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X20 Y4 Z10.0 F5000         ; Move to start position
G1 E15 Z0.3 F500              ; Pre-extrude a bit
G92 E0                        ; Reset extruder
G1 X180 Y4 Z0.3   F1500.0 E15 ; Draw the first line
G1 X180 Y4.4 Z0.3 F5000.0     ; Move to side a little
G1 X20  Y4.4 Z0.3 F1500.0 E30 ; Draw the second line
G1 X05  Y25  Z5   F5000   E28 ; Quickly move away
G1 Z0.4           F5000       ; Lower Nozzle
G92 E0                        ; Reset Extruder

M117 Printing!

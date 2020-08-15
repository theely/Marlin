G91                     ; Relative positioning
G1 E-5    F3000         ; Retract a bit
G1 E-10 X5 Y5 Z5 F3000  ; Wipe out
G1 Z10                  ;Raise Z more
G90 ;Absolute positionning

G1 X0 Y{machine_depth} ;Present print
M106 S0 ;Turn-off fan
M104 S0 ;Turn-off hotend
M140 S0 ;Turn-off bed

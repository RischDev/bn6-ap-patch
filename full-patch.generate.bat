REM Clear previous artifacts
del combined_g.gba
del combined_f.gba
del patched-combined_g.gba
del patched-combined_f.gba

REM generate the ASM patched rom
armips.exe Gregar/open_mode.asm 
armips.exe Falzar/open_mode.asm 

REM apply the changed text banks
py patch-rom.py

PAUSE
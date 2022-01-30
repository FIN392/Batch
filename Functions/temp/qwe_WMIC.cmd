@echo off

FOR /F "tokens=*" %%A IN ('WMIC LogicalDisk Where "DeviceID='C:'" Get /Format:list ^| FIND "="') DO echo SET _LogicalDisk.C.%%A

ECHO.

FOR /F "tokens=*" %%A IN ('WMIC BIOS Get /Format:list ^| FIND "="') DO echo SET _BIOS.%%A

ECHO.

FOR /F "tokens=*" %%A IN ('WMIC COMPUTERSYSTEM Get /Format:list ^| FIND "="') DO echo SET _COMPUTERSYSTEM.%%A

ECHO.

FOR /F "tokens=*" %%A IN ('WMIC CPU Get /Format:list ^| FIND "="') DO echo SET _CPU.%%A

ECHO.

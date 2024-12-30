 # Get WMIC information
```batchfile
:: Get C: disk info
FOR /F "tokens=*" %%A IN ('WMIC LogicalDisk Where "DeviceID='C:'" Get /Format:list ^| FIND "="') DO @SET _LogicalDisk.C.%%A
SET _LogicalDisk.C.

:: Get BIOS info
FOR /F "tokens=*" %%A IN ('WMIC BIOS Get /Format:list ^| FIND "="') DO @SET _BIOS.%%A
SET _BIOS.

:: Get COMPUTERSYSTEM info
FOR /F "tokens=*" %%A IN ('WMIC COMPUTERSYSTEM Get /Format:list ^| FIND "="') DO @SET _COMPUTERSYSTEM.%%A
SET _COMPUTERSYSTEM.

:: Get CPU info
FOR /F "tokens=*" %%A IN ('WMIC CPU Get /Format:list ^| FIND "="') DO @SET _CPU.%%A
SET _CPU.
```
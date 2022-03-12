# Get last boot time in format 'yyyymmddhhmmss.ffffff+mmm'
```batch
FOR /F "TOKENS=*" %%a IN ('WMIC OS GET LastBootUpTime /VALUE ^| FIND "="') DO @SET "%%a"
ECHO %LastBootUpTime%
```

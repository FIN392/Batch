# Get last boot time in format 'yyyymmddhhmmss.ffffff+mmm'
```batchfile
FOR /F "TOKENS=*" %%a IN ('WMIC OS GET LastBootUpTime /VALUE ^| FIND "="') DO @SET "%%a"
ECHO %LastBootUpTime%
```

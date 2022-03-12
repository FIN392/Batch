# Get local date and time
```batch
FOR /F "TOKENS=*" %%a IN ('WMIC OS GET LocalDateTime /VALUE ^| FIND "="') DO @SET "%%a"
ECHO %LocalDateTime%
```

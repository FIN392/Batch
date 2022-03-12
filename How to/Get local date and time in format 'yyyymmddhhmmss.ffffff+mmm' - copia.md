# Get local date and time in format 'yyyymmddhhmmss.ffffff+mmm'
```batch
FOR /F "TOKENS=*" %%a IN ('WMIC OS GET LocalDateTime /VALUE ^| FIND "="') DO @SET "%%a"
```
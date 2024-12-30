 # Get local date and time in format 'yyyyMMdd-hhmmss'
```batchfile
FOR /F %%a IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss'"') DO @SET "%%a"
ECHO %LocalDateTime%
```

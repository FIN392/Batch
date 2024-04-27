# Close if already running
```batch
SET "TITLE=My command window title"
TITLE Checking if already running...
TASKLIST /V | FINDSTR /C:"%TITLE%"
IF NOT ERRORLEVEL 1 (ECHO '%TITLE%' is already running & EXIT /B 1)
TITLE "%TITLE%"

:: Future version: Using PID saved in a flag file
TITLE uniqueTitle
FOR /F "tokens=2" %%i IN ('TASKLIST /NH /FI "WINDOWTITLE eq uniqueTitle*"') DO ECHO %%i
```

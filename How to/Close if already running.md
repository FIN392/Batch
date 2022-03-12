# Close if already running
```
SET "TITLE=My command window title"
TITLE Checking if already running...
TASKLIST /V | FINDSTR /C:"%TITLE%"
IF NOT ERRORLEVEL 1 (ECHO '%TITLE%' is already running & EXIT /B 1)
TITLE "%TITLE%"
```
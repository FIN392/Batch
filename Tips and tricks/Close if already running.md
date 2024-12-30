 # Close if already running
```batchfile
:: This will be the window title
SET "ScriptTitle=%~n0 (v0.1)"
:: Set the title to something different
TITLE Checking if already running...
:: Check if there is a task running with 'ScriptTitle' as title. If it is, exit
TASKLIST  /FI "WINDOWTITLE eq %ScriptTitle%*" | FINDSTR /C:" PID " > NUL 2>&1 && (ECHO The script is already running & EXIT /B 1)
:: Set the title to choosen one
TITLE %ScriptTitle%
```

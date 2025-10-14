 # Close if already running
```batchfile
@ECHO OFF

:: If the lock file exists, the script is still running or has crashed, so this instance should terminate
IF EXIST "%TEMP%\%~n0.lock" EXIT /B 1

:: Lock file is created
> "%TEMP%\%~n0.heartbeat" ECHO %DATE% %TIME% %~n0 start...

	::
	:: Your code goes here
	::

:: Correct end of the script. Lock file is deleted
DEL "%TEMP%\%~n0.lock" > NUL 2> NUL
EXIT /B 0
```

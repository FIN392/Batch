:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	SET "MyLogFile=%TEMP%\My Log File.txt"

	:: Write lines to log
	CALL :WriteLog "%MyLogFile%" FATAL "Log entry text" /CON
	CALL :WriteLog "%MyLogFile%" ERROR "Just another line to see all the possible Severities" /CON
	CALL :WriteLog "%MyLogFile%" WARN  "Just another line to see all the possible Severities" /CON
	CALL :WriteLog "%MyLogFile%" INFO  "Just another line to see all the possible Severities"
	CALL :WriteLog "%MyLogFile%" DEBUG "Just another line to see all the possible Severities"

	ECHO.
	TYPE "%MyLogFile%"
	DEL "%MyLogFile%" > NUL 2>&1
	ECHO.

	PAUSE

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Write a message in a logfile (and console).
::
:WriteLog {LogFile} {DEBUG | INFO | WARN | ERROR | FATAL} {string} [/CON]
SETLOCAL

	FOR /F "tokens=*" %%t IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyy-MM-dd hh:mm:ss.fff'"') DO SET "Timestamp=%%t"
	SET "Severity=%~2     "
	SET "Message=%~3"

	>> "%~1" ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message%
	IF /I "%~4"=="/CON" ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message%

ENDLOCAL & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

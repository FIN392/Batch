:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	SET "MyLogFile=%TEMP%\My Log File.txt"

	ECHO Entries on console:
	:: Write lines to log
	CALL :WriteLog "%MyLogFile%" FATAL "Fatal entry also displayed on console" /CON
	CALL :WriteLog "%MyLogFile%" ERROR "Just a error line also displayed on console" /CON
	CALL :WriteLog "%MyLogFile%" WARN  "WARNING!! The process is working" /CON
	CALL :WriteLog "%MyLogFile%" INFO  "This is just for your information"
	CALL :WriteLog "%MyLogFile%" DEBUG "Debugging is the process of identifying, analyzing, and resolving bugs"

	ECHO.
	ECHO Entries on file:
	TYPE "%MyLogFile%"
	DEL "%MyLogFile%" > NUL 2> NUL
	ECHO.

	PAUSE

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Write a message in a logfile (and console).
::
:: {LogFile}       : File where the entry will be added. 
:: DEBUG | INFO | WARN | ERROR | FATAL : Log entry severity. Any word of 5 or
::                   less characters, but these are the most common ones.
:: {string}        : Text for the log entry.
:: /CON [Optional] : Number of lines to keep. 
::
:: Repository: https://github.com/FIN392/Batch
::
:WriteLog {LogFile} { DEBUG | INFO | WARN | ERROR | FATAL } {string} [/CON]
SETLOCAL

	FOR /F "tokens=*" %%t IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyy-MM-dd hh:mm:ss.fff'"') DO SET "Timestamp=%%t"
	SET "Severity=%~2     "
	SET "Message=%~3"

	>> "%~1" ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message%
	IF /I "%~4"=="/CON" ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message%

ENDLOCAL & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

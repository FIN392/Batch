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

	FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "Timestamp=%%a %%b"
	SET "Severity=%~2     "
	SET "Message=%~3"

	>> "%~1" ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message%
	IF /I "%~4"=="/CON" ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message%

ENDLOCAL & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

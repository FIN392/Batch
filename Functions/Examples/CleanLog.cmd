:: Example of function usage
@ECHO OFF & SETLOCAL
ECHO.

	SET "MyLogFile=%TEMP%\My Log File.log"

	ECHO --- Before
	TYPE "%MyLogFile%"
	ECHO ---

	:: Clean existing log file keeping only 2 lines
	CALL :CleanLog "%MyLogFile%" 2

	ECHO --- After
	TYPE "%MyLogFile%"
	ECHO ---

	:: Write 4 additional lines to log
	>> "%MyLogFile%" ECHO %DATE% %TIME% FATAL "Just another line to see all the possible Severities"
	>> "%MyLogFile%" ECHO %DATE% %TIME% ERROR "Just another line to see all the possible Severities"
	>> "%MyLogFile%" ECHO %DATE% %TIME% WARN  "Just another line to see all the possible Severities"
	>> "%MyLogFile%" ECHO %DATE% %TIME% INFO  "Just another line to see all the possible Severities"
	>> "%MyLogFile%" ECHO %DATE% %TIME% DEBUG "Just another line to see all the possible Severities"

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Clean a log file keeping only the last 'n' lines.
::
:: NOTE: It is recommended to call this function at the beginning of the main
:: process since if it is done at the end, lines generated during execution can
:: be deleted.
::
:: {LogFile}          : Name of the log file to clean.
:: {Lines} [Optional] : Number of lines to keep. 
::
:: Repository: https://github.com/FIN392/Batch
::
:CleanLog {LogFile} [{Lines}]
SETLOCAL

	IF "%~2"=="" (DEL "%~1" > NUL 2> NUL) & GOTO :ENDIF

		FOR /F "delims=: tokens=1" %%l IN ('FINDSTR /C:" " /N "%~1"') DO SET Lines=%%l
		SET /A "Lines-=%~2"
		IF %Lines% LSS 2 GOTO :ENDIF
			FOR /F "skip=%Lines% tokens=*" %%l IN ('TYPE "%~1"') DO ( ECHO %%l>> "%~1.bak" )
			COPY "%~1.bak" "%~1" > NUL 2> NUL
			DEL "%~1.bak" > NUL 2> NUL

	:ENDIF
	
ENDLOCAL & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

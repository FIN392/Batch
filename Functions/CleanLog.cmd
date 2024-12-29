:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	SET "MyLogFile=%TEMP%\My Log File.log"

	:: Write lines to log
	>> "%MyLogFile%" ECHO %DATE% %TIME% FATAL "Just another line to see all the possible Severities"
	>> "%MyLogFile%" ECHO %DATE% %TIME% ERROR "Just another line to see all the possible Severities"
	>> "%MyLogFile%" ECHO %DATE% %TIME% WARN  "Just another line to see all the possible Severities"
	>> "%MyLogFile%" ECHO %DATE% %TIME% INFO  "Just another line to see all the possible Severities"
	>> "%MyLogFile%" ECHO %DATE% %TIME% DEBUG "Just another line to see all the possible Severities"

	ECHO --- Before
	TYPE "C:\Users\josel\AppData\Local\Temp\My Log File.log"
	ECHO ---

	:: Clean log file
	CALL :CleanLog "%MyLogFile%" 2

	ECHO --- After
	TYPE "C:\Users\josel\AppData\Local\Temp\My Log File.log"
	ECHO ---

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Clean a logfile keeping only 'n' lines.
::
:CleanLog {LogFile} [Lines]
SETLOCAL

	IF "%~2"=="" (DEL "%~1" > NUL 2>&1) & GOTO :ENDIF

		FOR /F "delims=: tokens=1" %%L IN ('FINDSTR /C:" " /N "%~1"') DO SET Lines=%%L
		SET /A Lines-=%~2
		IF %Lines% LSS 2 GOTO :ENDIF
			FOR /F "skip=%Lines% tokens=*" %%L IN ('TYPE "%~1"') DO ( ECHO %%L>> "%~1.bak" )
			COPY "%~1.bak" "%~1" > NUL 2>&1
			DEL "%~1.bak" > NUL 2>&1

	:ENDIF
	
ENDLOCAL & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

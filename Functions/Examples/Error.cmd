:: Example of function usage
@ECHO OFF & SETLOCAL

	CLS
	ECHO EXAMPLE #1: Calling 'Error'
	ECHO NOTE: The error code ('0x1A' in this case ) should be unique within the script
	ECHO.
	ECHO C:\^> CALL :Error 0x1A "This is the error message"
	
	CALL :Error 0x1A "This is the error message"
	
	ECHO Returned ERRORLEVEL=%ERRORLEVEL%
	ECHO.
	PAUSE
	ECHO.

	:::::::::::::::::::::::::::::::::::::::::::::::::

	CLS
	ECHO EXAMPLE #2: Calling 'Error' if command fail
	ECHO.
	ECHO C:\^> DIR OOPS:\ ^|^| (CALL :Error 0x2B "DIR command failed")
	
	DIR OOPS:\ 2> NUL || (CALL :Error 0x2B "DIR command failed")
	
	ECHO Returned ERRORLEVEL=%ERRORLEVEL%
	ECHO.
	PAUSE
	ECHO.

	:::::::::::::::::::::::::::::::::::::::::::::::::

	CLS
	ECHO EXAMPLE #3: Calling 'Error' with /FATAL to finish the script
	ECHO NOTE: CMD windows is going to be closed
	ECHO.
	ECHO C:\^> CALL :Error 0xFF "This is a fatal error" /FATAL
	
	CALL :Error 0xFF "This is a fatal error" /FATAL
	
	ECHO This line is never shown because the script is already cancelled.
	
ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Display an error message and returns an error code.
::
:: If '/FATAL' parameter is present, script is terminated.
::
:: {Unique_error_code} : Error code. It should be unique per error.
:: {Error_description} : Error description.
:: /FATAL [Optional]   : The script ends, otherwise control returns to the line
::                       after the call.
::
:: Repository: https://github.com/FIN392/Batch
::
:Error {Unique_error_code} {Error_description} [/FATAL]
SETLOCAL

	FOR /F "tokens=*" %%t IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyy-MM-dd hh:mm:ss'"') DO SET "_Err.TimeStamp=%%t"

	SET /A "_Err.Code=%~1+0"
	SET "_Err.Fatal=/B"

	FOR /F "Delims=:" %%n IN ('"FINDSTR /N /R "*:Error * %~1 *" "%~f0""') DO SET /A "_Err.Line=%%n+0"

	1>&2 ECHO.
	1>&2 ECHO.    [91m*** ERROR ****************************
	1>&2 ECHO.    %_Err.TimeStamp%
	1>&2 ECHO.    Script: %~f0
	1>&2 ECHO.    Line: %_Err.Line%
	1>&2 ECHO.    Error code: %~1%
	1>&2 ECHO.    Description: %~2
	IF /I "%~3"=="/FATAL" (
		SET "_Err.FATAL="
		1>&2 ECHO.
		1>&2 ECHO.    FATAL ERROR: SCRIPT TERMINATED
		1>&2 ECHO.
		1>&2 ECHO.    **************************************[0m
		TIMEOUT /T 10
	) ELSE (
		1>&2 ECHO.    **************************************[0m
		1>&2 ECHO.
	)

ENDLOCAL & EXIT %_Err.FATAL% %_Err.Code%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

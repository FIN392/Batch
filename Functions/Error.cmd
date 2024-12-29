:: Example of using the function
@ECHO OFF & SETLOCAL

	CLS
	ECHO EXAMPLE #1: Calling 'Error'
	ECHO NOTE: The error code ('0x0A' in this case ) should be unique within the script
	ECHO.
	ECHO C:\^> CALL :Error 0x0A "This is the error message"
	
	CALL :Error 0x0A "This is the error message"
	
	ECHO Returned ERRORLEVEL=%ERRORLEVEL%
	ECHO.
	PAUSE
	ECHO.

	:::::::::::::::::::::::::::::::::::::::::::::::::

	CLS
	ECHO EXAMPLE #2: Calling 'Error' if command fail
	ECHO NOTE: The standard OS error is displayed before
	ECHO.
	ECHO C:\^> DIR OOPS:\ ^|^| (CALL :Error 0xA0 "DIR command failed")
	ECHO.
	
	DIR OOPS:\ || (CALL :Error 0xA0 "DIR command failed")
	
	ECHO Returned ERRORLEVEL=%ERRORLEVEL%
	ECHO.
	PAUSE
	ECHO.

	:::::::::::::::::::::::::::::::::::::::::::::::::

	CLS
	ECHO EXAMPLE #3: Calling 'Error' from a function
	ECHO NOTE: the function return the ERRORLEVEL
	ECHO.
	ECHO C:\^> CALL :TestFunc
	ECHO.
	
	CALL :TestFunc
	
	ECHO Returned ERRORLEVEL=%ERRORLEVEL%
	ECHO.
	PAUSE
	ECHO.

	:::::::::::::::::::::::::::::::::::::::::::::::::

	CLS
	ECHO EXAMPLE #4: Calling 'Error' with /FATAL to finish the script
	ECHO NOTE: CMD windows is going to be closed
	ECHO.
	ECHO C:\^> CALL :Error 0xFF "This is a fatal error" /FATAL
	ECHO.
	
	CALL :Error 0xFF "This is a fatal error" /FATAL
	
	ECHO This line is never shown because the script is already cancelled.
	
ENDLOCAL & EXIT /B 0

:TestFunc
SETLOCAL & SET "_Err=0"

	ECHO.    Inside the function...

	CALL :Error 0x1A "Error in TestFunc"
	SET "_Err=%ERRORLEVEL%"
	
	ECHO.    Still in the function...
	ECHO.

ENDLOCAL & EXIT /B %_Err%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Show a error message and return a error code.
::
:: If '/FATAL' parameter is present, script is terminated.
::
:Error {Unique_error_code} {Error_description} [/FATAL]
SETLOCAL

	FOR /F %%t IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss'"') DO SET "_Err.%%t"
	SET "_Err.TimeStamp=%_Err.LocalDateTime:~0,4%-%_Err.LocalDateTime:~4,2%-%_Err.LocalDateTime:~6,2% %_Err.LocalDateTime:~8,2%:%_Err.LocalDateTime:~10,2%:%_Err.LocalDateTime:~12,2%.%_Err.LocalDateTime:~15,3% (UCT%_Err.LocalDateTime:~21%)"

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

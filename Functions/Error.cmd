:: Example of using the function
@ECHO OFF & SETLOCAL

	:: Calling 'Error' depending on a condition
	IF NOT EXIST "ThisFileDoNotExist.HopeSo" (CALL :Error %~0 0x01 "File doesn't exist")
	ECHO Returned error=%ERRORLEVEL%
	ECHO.

	:: Calling 'Error' when a command fail
	DIR CC:\ || (CALL :Error %~0 0x12 "DIR command failed")
	ECHO Returned error=%ERRORLEVEL%
	ECHO.

	:: Calling 'Error' from a function
	CALL :TEST01

	:: Calling 'Error' from a function with terminating the whole script (/FATAL)
	CALL :TEST02

	ECHO NEVER SHOWN!!!
	
ENDLOCAL & EXIT /B 0

:TEST01
SETLOCAL & SET "_Err=0"

	ECHO.    Inside the function...
	ECHO.

	DIR CC:\ || (CALL :Error %~0 0x21 "DIR command failed")
	SET "_Err=%ERRORLEVEL%"
	ECHO.    Returned error=%_Err%
	ECHO.

	ECHO.    Still in the function...
	ECHO.

ENDLOCAL & EXIT /B %_Err%

:TEST02
SETLOCAL & SET "_Err=0"

	ECHO.    Inside the function...
	ECHO.

	DIR CC:\ || (CALL :Error %~0 0x22 "DIR command failed" /FATAL)

	ECHO.    NEVER SHOWN!!!

ENDLOCAL & EXIT /B %_Err%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Show a error message and return a error code.
::
:: If '/FATAL' parameter is present, script is terminated.
::
:Error {Calling_function} {Unique_error_code} {Error_description} [/FATAL]
SETLOCAL

	FOR /F %%t IN ('WMIC OS GET LocalDateTime /VALUE ^| find "="') DO SET "_Err.%%t"
	SET "_Err.TimeStamp=%_Err.LocalDateTime:~0,4%-%_Err.LocalDateTime:~4,2%-%_Err.LocalDateTime:~6,2% %_Err.LocalDateTime:~8,2%:%_Err.LocalDateTime:~10,2%:%_Err.LocalDateTime:~12,2%.%_Err.LocalDateTime:~15,3% (UCT%_Err.LocalDateTime:~21%)"

	SET /A "_Err.Code=%~2+0"
	SET "_Err.Fatal=/B"

	SET "_Err.Func=%~1"
	IF "%~1"=="%~nx0" SET "_Err.Func=(n/a)"

	FOR /F "Delims=:" %%n IN ('"FINDSTR /N /R "*:Error * %~2 *" "%~f0""') DO SET /A "_Err.Line=%%n+0"

	1>&2 ECHO.
	1>&2 ECHO.    [91m*** ERROR ****************************
	1>&2 ECHO.    %_Err.TimeStamp%
	1>&2 ECHO.    Script: %~f0
	1>&2 ECHO.    Function: %_Err.Func%
	1>&2 ECHO.    Line: %_Err.Line%
	1>&2 ECHO.    Error code: %~2%
	1>&2 ECHO.    Description: %~3
	IF /I "%~4"=="/FATAL" (
		1>&2 ECHO.
		1>&2 ECHO.    FATAL ERROR: SCRIPT TERMINATED
		SET "_Err.FATAL="
	)
	1>&2 ECHO.    **************************************[0m
	1>&2 ECHO.

ENDLOCAL & EXIT %_Err.FATAL% %_Err.Code%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Example of using the function
:Main
@ECHO OFF & SETLOCAL
SET Err=0

:: Calling 'Error' depending on a condition
IF NOT EXIST "ThisFileDoNotExist.HopeSo" (CALL :Error %~0 0x01 "File doesn't exist")
ECHO ERRORLEVEL=%ERRORLEVEL%
ECHO.

:: Calling 'Error' when a command fail
DIR CC:\ || (CALL :Error %~0 0x12 "DIR command failed")
ECHO ERRORLEVEL=%ERRORLEVEL%
ECHO.

:: Calling 'Error' from a function
CALL :TEST01

:: Calling 'Error' from a function with terminating the whole script (/FATAL)
CALL :TEST02

ECHO NEVER SHOWN!!!
	
:End_of_script
ENDLOCAL & EXIT /B %Err%

:TEST01
SETLOCAL

	ECHO.    Inside the function...
	ECHO.

	DIR CC:\ || (CALL :Error %~0 0x21 "DIR command failed")
	ECHO.    ERRORLEVEL=%ERRORLEVEL%
	ECHO.

	ECHO.    Still in the function...
	ECHO.

ENDLOCAL & EXIT /B 0

:TEST02
SETLOCAL

	ECHO.    Inside the function...
	ECHO.

	DIR CC:\ || (CALL :Error %~0 0x21 "DIR command failed" /FATAL)

	ECHO.    NEVER SHOWN!!!

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Show a error message and return a error code.
::
:: If '/FATAL' parameter is present, script is terminated.
::
:Error {Calling_function} {Error_code} {Error_description} [/FATAL]
SETLOCAL

	FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET "_Err.%%t"
	SET "_Err.TimeStamp=%_Err.LocalDateTime:~0,4%-%_Err.LocalDateTime:~4,2%-%_Err.LocalDateTime:~6,2% %_Err.LocalDateTime:~8,2%:%_Err.LocalDateTime:~10,2%:%_Err.LocalDateTime:~12,2%.%_Err.LocalDateTime:~15,3% (UCT%_Err.LocalDateTime:~21%)"

	SET /A "_Err.Code=%~2+0"
	SET "_Err.Fatal=/B"

	1>&2 ECHO.    [91m*** ERROR ****************************
	1>&2 ECHO.    %_Err.TimeStamp%
	1>&2 ECHO.    Function: %~1
	1>&2 ECHO.    Error code: %~2%
	1>&2 ECHO.    Description: %~3
	IF /I "%~4"=="/FATAL" (
		1>&2 ECHO.
		1>&2 ECHO.    FATAL ERROR: SCRIPT TERMINATED
		SET "_Err.FATAL="
	)
	1>&2 ECHO.    **************************************[0m

	REM IF /I "%~4"=="/FATAL" EXIT %_Err.Code%

ENDLOCAL & EXIT %_Err.FATAL% %_Err.Code%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

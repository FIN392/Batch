REM GOTO :Example
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
:: Syntax: ...
::     {Return_variable} : Variable where the result will be returned.
::
:: Requirements: (none)
::
:: Example:
::
::     :: Set here your functions folder ending in '\'
::     @ECHO OFF & SET "Func_=CALL X:\Batch\Functions\"
::
::     ...
::
::     EXIT /B 0
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:Error {Unique_error_code} {Error_description} [/FATAL]
SETLOCAL

	FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET SET "_Err.TimeStamp=%%a %%b"

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

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"


ECHO EXAMPLE #1: Calling 'Error'
ECHO NOTE: The error code ('0x1A' in this case ) should be unique within the script
ECHO.
ECHO C:\^> CALL :Error 0x1A "This is the error message"
	
CALL :Error 0x1A "This is the error message"
	
ECHO Returned ERRORLEVEL=%ERRORLEVEL%
ECHO.

ECHO EXAMPLE #2: Calling 'Error' if command fail
ECHO.
ECHO C:\^> DIR OOPS:\ ^|^| (CALL :Error 0x2B "DIR command failed")
	
DIR OOPS:\ 2> NUL || (CALL :Error 0x2B "DIR command failed")
	
ECHO Returned ERRORLEVEL=%ERRORLEVEL%
ECHO.

ECHO EXAMPLE #3: Calling 'Error' with /FATAL to finish the script
ECHO NOTE: CMD windows is going to be closed
ECHO.
ECHO C:\^> CALL :Error 0xFF "This is a fatal error" /FATAL
	
CALL :Error 0xFF "This is a fatal error" /FATAL
	
ECHO This line is never shown because the script is already cancelled.
	
EXIT /B 0

:: Results:
::
:: EXAMPLE #1: Calling 'Error'
:: NOTE: The error code ('0x1A' in this case ) should be unique within the script
::
:: C:\> CALL :Error 0x1A "This is the error message"
::
::     *** ERROR ****************************
::
::     Script: d:\OneDrive\DEV\GitHub\Batch\Functions\Error.cmd
::     Line: 74
::     Error code: 0x1A
::     Description: This is the error message
::     **************************************
::
:: Returned ERRORLEVEL=26
::
:: EXAMPLE #2: Calling 'Error' if command fail
::
:: C:\> DIR OOPS:\ || (CALL :Error 0x2B "DIR command failed")
::
::     *** ERROR ****************************
::
::     Script: d:\OneDrive\DEV\GitHub\Batch\Functions\Error.cmd
::     Line: 83
::     Error code: 0x2B
::     Description: DIR command failed
::     **************************************
::
:: Returned ERRORLEVEL=43
::
:: EXAMPLE #3: Calling 'Error' with /FATAL to finish the script
:: NOTE: CMD windows is going to be closed
::
:: C:\> CALL :Error 0xFF "This is a fatal error" /FATAL
::
::     *** ERROR ****************************
::
::     Script: d:\OneDrive\DEV\GitHub\Batch\Functions\Error.cmd
::     Line: 93
::     Error code: 0xFF
::     Description: This is a fatal error
::
::     FATAL ERROR: SCRIPT TERMINATED
::
::     **************************************
::
:: Esperando  0 segundos, presione una tecla para continuar ...
::

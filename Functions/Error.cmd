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

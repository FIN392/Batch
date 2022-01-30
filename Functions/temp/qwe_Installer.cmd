@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION


CALL :Installer || ( ECHO *** ERROR # !ERRORLEVEL! & EXIT /B !ERRORLEVEL! )


EXIT /B 0



:Installer
SETLOCAL & SET "_Error=0"

	:: Download files (URL)
	REM curl -OL    https://raw.github.com/FIN392/My-Messy-Junk-drawer/Batch/AppName.zip
	
	
	:: Unzip and save in Programa Files (AppName)
	
	:: Create Icon in menu (IconFile + MainProgramFile)



	CALL :Error %~0 0x01 "File doesn't exist"
	SET _Error=%ERRORLEVEL%

SET _Error

:End_Installer
ENDLOCAL & EXIT /B %_Error%









:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Show a error message and return a error code.
::
:: If '/FATAL' parameter is present, script is terminated.
::
:Error {Calling_function} {Unique_error_code} {Error_description} [/FATAL]
SETLOCAL

	FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET "_Err.%%t"
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

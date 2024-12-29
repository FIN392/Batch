:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	CALL :GetLocalDateTime MyCurrentTime

	ECHO Current date and time is [%MyCurrentTime%]
	ECHO.
	
	PAUSE

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyyMMdd-hhmmss'.
::
:GetLocalDateTime {Return_variable}

	FOR /F %%a IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss'"') DO SET "%~1=%%b"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

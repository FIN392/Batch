:: Example of function usage
@ECHO OFF & SETLOCAL
ECHO.

	CALL :GetLocalDateTime MyCurrentTime

	ECHO Current date and time is [%MyCurrentTime%]
	ECHO.
	
	PAUSE

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyyMMdd-hhmmss.fff'.
::
:: NOTE: PowerShell version 2.0 or higher must be installed.
::
:: {Return_variable} : Name of the variable where the result will be returned.
::
:: Repository: https://github.com/FIN392/Batch
::
:GetLocalDateTime {Return_variable}

	FOR /F %%t IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss.fff'"') DO SET "%~1=%%t"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

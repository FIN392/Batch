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
:: Return local date and time with format 'yyyymmddhhmmss.ffffff+mmm'.
::
:: Rear '+mmm' is the UTC time offsets in minutes.
::
:GetLocalDateTime {Return_variable}

	FOR /F "tokens=1* delims==" %%a IN ('WMIC OS GET LocalDateTime /VALUE ^| FIND "="') DO SET "%~1=%%b"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

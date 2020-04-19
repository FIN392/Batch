:: Example of using the function
:Main
@ECHO OFF & SETLOCAL
SET Err=0

CALL :GetLocalDateTime _CurrentTime

ECHO Current date and time is [%_CurrentTime%]

:End_of_script
ENDLOCAL & EXIT /B %Err%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyymmddhhmmss.ffffff+mmm'.
::
:: Rear '+mmm' is the UTC time offsets in minutes.
::
:GetLocalDateTime {Return_variable}

	FOR /F "tokens=1* delims==" %%a IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET "%~1=%%b"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

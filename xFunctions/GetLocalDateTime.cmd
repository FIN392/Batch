:: Example of using the function

CALL :GetLocalDateTime _CurrentTime

ECHO Current date and time is '%_CurrentTime%'


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyymmddhhmmss.ffffff+mmm'
::
:: Rear '+mmm' is the UTC time offsets in minutes.
::
:GetLocalDateTime {Return_variable}
SETLOCAL

	FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| FIND "="') DO SET _%%t

ENDLOCAL & SET %1=%_LocalDateTime%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

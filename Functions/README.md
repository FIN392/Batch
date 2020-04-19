# Batch functions
This is just a set of functions to be used in your batch scripts.

## How to use them?

Easy, just copy and paste the function in your script. You can see a example of how to use it.

```batch
:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	CALL :GetLocalDateTime _CurrentTime

	ECHO Current date and time is [%_CurrentTime%]

:End_of_script
ENDLOCAL & EXIT /B %_Error%


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
```

ENJOY IT!!! and please contact me for any doubt or improvement proposal.

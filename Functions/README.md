# Batch functions
This is just a set of functions to be used in your batch scripts.

Multiple logs files can be created at the same time in a script, each in a different format. Additionaly to the log file, the entries can be displayed in console (host).

## How to use them?

Easy, 

´´´
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
´´´


ENJOY IT!!! and please contact me for any doubt or improvement proposal.

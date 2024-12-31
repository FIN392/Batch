:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return the length of a string.
::
:: NOTE: For longer than 256 characters, the value 256 is always returned.
::
:: {Return_variable} : Name of the variable where the result will be returned.
:: {String}          : String to be verified.
::
:: Repository: https://github.com/FIN392/Batch
::
:StrLength {Return_variable} {String}
SETLOCAL ENABLEDELAYEDEXPANSION

	SET "String=%~2-"
	FOR /L %%i IN (0,1,256) DO IF NOT "!String:~%%i,1!"=="" SET /A "_Return=%%i"

ENDLOCAL & SET "%~1=%_Return%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

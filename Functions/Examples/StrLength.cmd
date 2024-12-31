:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	:: Return the string length
	SET "MyString=abcdef"
	CALL :StrLength MyStrLength %MyString%
	ECHO Length of "%MyString%" is [%MyStrLength%]
	ECHO.
	
	:: If empty, return 0
	SET "MyString="
	CALL :StrLength MyStrLength %MyString%
	ECHO Length of "%MyString%" is [%MyStrLength%]
	ECHO.

	:: If longer than 256, return 256
	SET "MyString=123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_"
	CALL :StrLength MyStrLength %MyString%
	ECHO Length of "%MyString%" is [%MyStrLength%]
	ECHO.

	PAUSE

ENDLOCAL & EXIT /B 0


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

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
:: Returns the number of characters in the string.
::
:StrLength {Return_variable} {String}
SETLOCAL ENABLEDELAYEDEXPANSION

	SET "String=%~2·"
	FOR /L %%i IN (0,1,257) DO IF NOT "!String:~%%i,1!"=="" SET /A "_Return=%%i-1"

ENDLOCAL & SET "%~1=%_Return%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

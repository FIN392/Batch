:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	:: Return the string length
	CALL :StrLength LEN abcdef
	ECHO Length=%LEN%
	
	:: If it is in quotes, it does not count the quotes
	CALL :StrLength LEN "abc def"
	ECHO Length=%LEN%

	:: If empty, return 0
	CALL :StrLength LEN
	ECHO Length=%LEN%

	:: If longer than 256, return 256
	CALL :StrLength LEN "123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_"
	ECHO Length=%LEN%

:End_of_script
ENDLOCAL & EXIT /B %_Error%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Returns the number of characters in the string.
::
:StrLength {Return_variable} {String}
SETLOCAL ENABLEDELAYEDEXPANSION & SET "_Error=0"

	SET "String=%~2·"
	FOR /L %%i IN (0,1,257) DO IF NOT "!String:~%%i,1!"=="" SET /A "_Return=%%i-1"

:End_StrLength
ENDLOCAL & SET "%~1=%_Return%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

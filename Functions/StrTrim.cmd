:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	SET MyString="   abc def"
	CALL :StrTrim MyStringTrimmed %MyString%
	ECHO [%MyString%] trimmer is [%MyStringTrimmed%]
	ECHO.

	SET MyString="abc   def"
	CALL :StrTrim MyStringTrimmed %MyString%
	ECHO [%MyString%] trimmer is [%MyStringTrimmed%]
	ECHO.

	SET MyString="abc def   "
	CALL :StrTrim MyStringTrimmed %MyString%
	ECHO [%MyString%] trimmer is [%MyStringTrimmed%]
	ECHO.

	SET MyString="   abc   def   "
	CALL :StrTrim MyStringTrimmed %MyString%
	ECHO [%MyString%] trimmer is [%MyStringTrimmed%]
	ECHO.

	SET MyString="abc def"
	CALL :StrTrim MyStringTrimmed %MyString%
	ECHO [%MyString%] trimmer is [%MyStringTrimmed%]
	ECHO.

	PAUSE

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Removes leading, trailing and double spaces from the string.
::
:StrTrim {Return_variable} {String}
SETLOCAL
	
	FOR /F "tokens=*" %%i IN ('ECHO %~2 ') DO SET "_Return=%%i"

ENDLOCAL & SET "%~1=%_Return:~0,-1%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

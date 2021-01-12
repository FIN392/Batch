:: Example of using the function
@ECHO OFF & SETLOCAL

	CALL :StrTrim TRIM "   abc   def   "
	ECHO Trimmed=[%TRIM%]

	CALL :StrTrim TRIM "abc   def   "
	ECHO Trimmed=[%TRIM%]

	CALL :StrTrim TRIM "abc def   "
	ECHO Trimmed=[%TRIM%]

	CALL :StrTrim TRIM "abc   def"
	ECHO Trimmed=[%TRIM%]

	CALL :StrTrim TRIM "abc def"
	ECHO Trimmed=[%TRIM%]

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

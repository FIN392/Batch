:: Example of using the function
@ECHO OFF & SETLOCAL

	CALL :IsNumber IsNumber 123
	ECHO %IsNumber%

	CALL :IsNumber IsNumber "qwe asd"
	ECHO %IsNumber%

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return TRUE if 'value' is a number.
::
:IsNumber {Return_variable} {Value}

	SET "%~1=FALSE"
	SET /A "Number=%~2+0" > NUL 2>&1
	IF "%Number%"=="%2" SET "%~1=TRUE"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	CALL :IsNumber IsNumber 123
	ECHO %IsNumber%

	CALL :IsNumber IsNumber "qwe asd"
	ECHO %IsNumber%

:End_of_script
ENDLOCAL & EXIT /B %_Error%


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

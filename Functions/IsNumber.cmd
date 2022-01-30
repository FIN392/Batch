:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	CALL :IsNumber MyIsNumberResult 123
	ECHO Is 123 a number? [%MyIsNumberResult%]
	ECHO.
	
	CALL :IsNumber MyIsNumberResult "qwe asd"
	ECHO Is "qwe asd" a number? [%MyIsNumberResult%]
	ECHO.
	
	PAUSE
	
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

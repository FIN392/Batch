@ECHO OFF
CLS
SETLOCAL
	
	CALL :FunctionTemplate 1 , "DOS" , "" , 4
	ECHO ERROR: %ERRORLEVEL%
	ECHO Returned value: %FunctionTemplate%

ENDLOCAL

EXIT /B 0






:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Here should go a long description of how the script works and the
:: explanation of each of the parameters. The line length should be adjusted to
:: 80 characters.
::
:FunctionTemplate [/ON | /OFF] [/X] [/F:{filename}]
SETLOCAL & SET "_Error=0"
FOR /F "delims=:" %%f IN ('ECHO %0') DO SET "_ReturnVar=%%f"

echo -%0-%~1-%~2-%~3-%~4-
shift /1
echo -%0-%~1-%~2-%~3-%~4-

	REM *
	REM * YOUR CODE GOES HERE...
	REM *
	
	REM * Set _Return and _Error variables with proper values
	SET _ReturnValue=xxx
	SET _Error=999
	
	REM *
	REM * YOUR CODE GOES HERE...
	REM *

:End_FunctionTemplate
ENDLOCAL & SET "%_ReturnVar%=%_ReturnValue%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

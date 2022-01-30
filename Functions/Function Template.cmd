@ECHO OFF
CLS
:: SETLOCAL
	
	CALL :FuncTemplate 1, "DOS", "", 4
	ECHO Returned error: %ERRORLEVEL%
	ECHO Returned value: %FuncTemplate%

:: ENDLOCAL

EXIT /B 0






:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Here should go a long description of how the script works and the
:: explanation of each of the parameters. The line length should be adjusted to
:: 80 characters.
::
:FuncTemplate
SETLOCAL & SET "_Error=0"
FOR /F "delims=:" %%f IN ('ECHO %0') DO SET "_FuncName=%%f"

echo Param #1: %~1
echo Param #2: %~2
echo Param #3: %~3
echo Param #4: %~4

	REM *
	REM * YOUR CODE GOES HERE...
	REM *
	
	:: Set _Return and _Error variables with proper values
	SET _Return=xxx
	SET _Error=999

ENDLOCAL & SET "%_FuncName%=%_Return%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

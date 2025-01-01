REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return the length of a string.
::
:: Syntax: StrLength <Return_variable> <String>
::     <Return_variable> : Variable where the result will be returned.
::     <String>          : String to be measured.
::
:: Requirements: (none)
::
:: Example:
::
::     :: Set here your functions folder
::     @ECHO OFF & SET "Func_=X:\Batch\Functions"
::
::     SET "MyText=This is a test"
::     CALL %Func_%\StrLength MyTextLength "%MyText%"
::     ECHO [%MyText%] & ECHO [%MyTextLength%]
::
::     EXIT /B 0
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:StrLength <Return_variable> <String>
SETLOCAL ENABLEDELAYEDEXPANSION

	SET "String=%~2-"
	FOR /L %%i IN (0,1,256) DO IF NOT "!String:~%%i,1!"=="" SET /A "_Return=%%i"

ENDLOCAL & SET "%~1=%_Return%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyText=This is a test"
CALL %Func_%StrLength MyTextLen "%MyText%"
ECHO [%MyText%] = [%MyTextLen%]

EXIT /B 0

:: Results:
::
:: [This is a test] = [14]
::
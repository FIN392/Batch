REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Removes leading, trailing and double spaces from the string.
::
:: Syntax: StrTrim <Return_variable> <String>
::     <Return_variable> : Variable where the result will be returned.
::     <String>          : String to be trimmed.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:StrTrim <Return_variable> <String>
SETLOCAL
	
	FOR /F "tokens=*" %%i IN ('ECHO %~2 ') DO SET "_Return=%%i"

ENDLOCAL & SET "%~1=%_Return:~0,-1%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyText=   This   is   a  test      "
CALL %Func_%StrTrim MyTextTrimmed "%MyText%"
ECHO [%MyText%] = [%MyTextTrimmed%]

EXIT /B 0

:: Results:
::
:: [   This   is   a  test      ] = [This is a test]
::
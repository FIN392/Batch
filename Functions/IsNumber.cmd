REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Returns TRUE if 'value' is a number. Otherwise returns FALSE.
::
:: Syntax: IsNumber <Return_variable> <Value>
::     <Return_variable> : Variable where the result will be returned.
::     <Value>           : Value to be checked.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:IsNumber <Return_variable> <Value>

	SET "%~1=FALSE"
	SET /A "Number=%~2+0" > NUL 2> NUL
	IF "%Number%"=="%2" SET "%~1=TRUE"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyValue=123"
CALL %Func_%IsNumber MyResult %MyValue%
ECHO [%MyValue%] = [%MyResult%]

SET MyValue="This is a test"
CALL %Func_%IsNumber MyResult %MyValue%
ECHO [%MyValue%] = [%MyResult%]
	
EXIT /B 0

:: Results:
::
:: [123] = [TRUE]
:: ["This is a test"] = [FALSE]
::
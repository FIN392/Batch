REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Brief description.
::
:: Detailed description of how the function works.
::
:: Syntax: FunctionName <Return_variable> <Parameter1> <Parameter2> <Parameter3> <ParameterN>
::     <Return_variable> : Variable where the result will be returned.
::     <Parameter1>      : Description of the use of the parameter #1.
::     <Parameter2>      : Description of the use of the parameter #2.
::     <Parameter3>      : Description of the use of the parameter #3.
::     <ParameterN>      : Description of the use of the parameter #N.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:FunctionName <Return_variable> <Parameter1> <Parameter2> <Parameter3> <ParameterN>
SETLOCAL

	SET "_Error=0"
	SET "_ReturnValue="

	:: Your code goes here
	SET "_ReturnValue=My correct result"
	IF 'Something_goes_wrong'=='TRUE' SET "_Error=1"
	:: Your code goes here

ENDLOCAL & SET "%~1=%_ReturnValue:~0,-1%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

CALL %Func_%FunctionName Return_variable Parameter1 Parameter2 Parameter3 ParameterN
ECHO [%ERRORLEVEL%]
ECHO [%Return_variable%]

EXIT /B 0

:: Results:
::
:: [0]
:: [My correct resul]
::
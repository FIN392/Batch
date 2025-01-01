REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyy/mm/dd hh:mm:ss'.
::
:: Syntax: GetLocalDateTime <Return_variable>
::     <Return_variable> : Variable where the result will be returned.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:GetLocalDateTime <Return_variable>

	FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "%~1=%%a %%b"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

CALL %Func_%GetLocalDateTime MyDateTime
ECHO [%MyDateTime%]

EXIT /B 0

:: Results:
::
:: [2025/01/01 19:48:58]
::
REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return a GUID with format 'HHHHHHH-HHHH-HHHH-HHHH-HHHHHHHHHHHH'. Being 'H'
:: a hexadecimal digit.
::
:: Syntax: GetGUID <Return_variable>
::     <Return_variable> : Variable where the result will be returned.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:GetGUID <Return_variable>
SETLOCAL

	SET "_HEX="
	FOR /L %%i IN (1,1,8) DO CALL :FOR_GetGIUD_i
	GOTO ENDFOR_GetGIUD_i
	:FOR_GetGIUD_i
		SET /A "_DEC=%RANDOM%*65536/32768"
		CALL CMD /C EXIT /B %_DEC%
		SET "_HEX=%_HEX%%=exitcode:~-4%"
	GOTO :EOF
	:ENDFOR_GetGIUD_i
	SET "_HEX=%_HEX:~0,8%-%_HEX:~8,4%-%_HEX:~12,4%-%_HEX:~16,4%-%_HEX:~20,12%"

ENDLOCAL & SET "%~1=%_HEX%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

CALL :GetGUID MyGUID
ECHO [%MyGUID%]

EXIT /B 0

:: Results:
::
:: [4E562C98-EB18-11B2-ADF4-85DAE188E83E]
::
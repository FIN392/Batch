:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	CALL :GetGUID MyGUID

	ECHO My GUID is [%MyGUID%]
	ECHO.
	
	PAUSE

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return a GUID with format 'HHHHHHH-HHHH-HHHH-HHHH-HHHHHHHHHHHH'.
::
:: Each 'H' is a hexadecimal digit.
::
:: {Return_variable} : Name of the variable where the result will be returned.
::
:: Repository: https://github.com/FIN392/Batch
::
:GetGUID {Return_variable}
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

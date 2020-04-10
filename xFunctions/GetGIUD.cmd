:: Example of using the function
@ECHO OFF

CALL :GetGIUD _MyGUID

ECHO My GUID is '%_MyGUID%'

EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return a GUID with format 'HHHHHHH-HHHH-HHHH-HHHH-HHHHHHHHHHHH'.
::
:: Each 'H' is a hexadecimal digit.
::
:GetGIUD {Return_variable}
SETLOCAL

	SET _HEX=
	SET _i=0
	:GetGIUD_Loop
		SET /A _DEC=(%RANDOM%*256/32768)+0
		CALL cmd /C EXIT /B %_DEC%
		SET _HEX=%_HEX%%=exitcode:~-2%
		SET /A _i=%_i%+1
	IF %_i% NEQ 16 GOTO :GetGIUD_Loop
	SET _HEX=%_HEX:~0,8%-%_HEX:~8,4%-%_HEX:~12,4%-%_HEX:~16,4%-%_HEX:~20,12%
	
ENDLOCAL & SET %1=%_HEX%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

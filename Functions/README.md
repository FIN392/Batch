# Batch functions
This is just a set of functions to be used in your batch scripts.

ENJOY IT!!! and please feel free to check [issues page](https://github.com/FIN392/Batch/issues/).

## How to use them?

Easy, just copy and paste the function in your script. You can see an example of how to use it at the beginning of the file.

```batchfile
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
:GetGUID {Return_variable}
SETLOCAL

	SET "_HEX="
	FOR /L %%i IN (1,1,8) DO CALL :GetGIUD_FOR_i
	GOTO GetGIUD_ENDFOR_i
	:GetGIUD_FOR_i
		SET /A "_DEC=%RANDOM%*65536/32768"
		CALL CMD /C EXIT /B %_DEC%
		SET "_HEX=%_HEX%%=exitcode:~-4%"
	GOTO :EOF
	:GetGIUD_ENDFOR_i
	SET "_HEX=%_HEX:~0,8%-%_HEX:~8,4%-%_HEX:~12,4%-%_HEX:~16,4%-%_HEX:~20,12%"

ENDLOCAL & SET "%~1=%_HEX%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
```

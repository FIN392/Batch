:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	CALL :StrTrim TRIM "   abc    def  "
	ECHO Trimmed=[%TRIM%]

:End_of_script
ENDLOCAL & EXIT /B %_Error%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Removes leading, trailing and double spaces from the string.
::
:StrTrim {Return_variable} {String}
SETLOCAL ENABLEDELAYEDEXPANSION & SET "_Error=0"

	SET "String=%~2"
	SET "_Return="
	FOR %%i IN (%String%) DO SET "_Return=!_Return!%%i "
	SET "_Return=%_Return:~0,-1%"

:End_StrLength
ENDLOCAL & SET "%~1=%_Return%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

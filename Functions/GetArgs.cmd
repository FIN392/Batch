REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Load arguments into variables '_Arg.xxx'.
::
:: Depending on the parameter type, these are the variables created and their
:: values:
::
::   Parameters type       Example              Variable name and value
::   --------------------  -------------------  ------------------------
::   Simple argument       "Text to display"    _Arg.1="Text to display" (*)
::   Switch                /CONSOLE             _Arg.CONSOLE=ON
::   Parameter with value  /File:"C:\file.tmp"  _Arg.File="C:\file.tmp"
::
::   (*) In case of multiple arguments, the variable will be named as '_Arg.1',
::       '_Arg.2', '_Arg.3', etc.
::
:: Syntax: GetArgs
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:GetArgs

	SET "_Arg.=."
	FOR /F "DELIMS==" %%v IN ('SET _Arg.') DO SET "%%v="

	SET "_GetArgs_i=1"
	FOR %%v IN (%*) DO CALL :FOR_GetArgs_EachArg %%v
	GOTO ENDFOR_GetArgs_EachArg
	:FOR_GetArgs_EachArg

		SET "_GetArgs_TmpArg=%~1"
		IF "%_GetArgs_TmpArg:~0,1%"=="/" GOTO ELSE_GetArgs_NoSwitch

			SET "_Arg.%_GetArgs_i%=%_GetArgs_TmpArg%"
			SET /A "_GetArgs_i=%_GetArgs_i%+1"

		GOTO ENDIF_GetArgs_NoSwitch
		:ELSE_GetArgs_NoSwitch

			FOR /F "usebackq tokens=1* delims=: " %%a IN ('%_GetArgs_TmpArg:~1%') DO CALL :FOR_GetArgs_Switch %%a %%b ON
			GOTO :ENDFOR_GetArgs_Switch
			:FOR_GetArgs_Switch

				SET "_Arg.%1=%2"

			GOTO :EOF
			:ENDFOR_GetArgs_Switch

		:ENDIF_GetArgs_NoSwitch

	GOTO :EOF
	:ENDFOR_GetArgs_EachArg

	SET "_GetArgs_i="
	SET "_GetArgs_TmpArg="

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

IF "%~1"=="" (
	CALL :Example "Text to display" /CONSOLE /File:"C:\file.tmp" 1024
	EXIT /B 0	
)

CALL %Func_%GetArgs %*
SET _Arg.

EXIT /B 0

:: Results:
::
:: _Arg.1=Text to display
:: _Arg.2=1024
:: _Arg.CONSOLE=ON
:: _Arg.File="C:\file.tmp"
::
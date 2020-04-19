:: Example of using the function
:Main
@ECHO OFF & SETLOCAL
SET Err=0

CALL :GetArgs "This is a text" /X  VAL02 /F:"C:\Program Files\file.ext"

ECHO Args are:
SET "_Arg."

:End_of_script
ENDLOCAL & EXIT /B %Err%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Load parameters into variables '_Arg.{parameter}'.
::
:: These are the variables created and their values ​​depending on the type of
:: parameter:
::
::     Parameters type    Variable
::     -----------------  ------------------
::     /{switch}          _Arg.{switch}=ON
::     /{switch}:{value}  _Arg.{switch}={value}
::     {value}            _Arg.{n}={value}
::
:: EXAMPLE
::
::     C:\> scriptname.cmd "Text message" /X /F:file.txt "fin392@gmail.com"
::
::     Variables:
::
::     _Arg.1="Text message"
::     _Arg.2="fin392@gmail.com"
::     _Arg.F=file.txt
::     _Arg.X=ON
::
:GetArgs

	:: Clean _Arg variables
	SET "_Arg.=."
	FOR /F "DELIMS==" %%v IN ('SET _Arg.') DO SET "%%v="

	:: Loop for each argument
	SET "_GetArgs_i=1"
	FOR %%v IN (%*) DO CALL :GetArgs_FOR_EachArg %%v
	GOTO GetArgs_ENDFOR_EachArg
	:GetArgs_FOR_EachArg

		SET "_GetArgs_TmpArg=%~1"

		:: If parameter is not a switch, create '_Arg.{i}={parameter}'
		IF "%_GetArgs_TmpArg:~0,1%"=="/" GOTO GetArgs_ELSE_NoSwitch

			SET "_Arg.%_GetArgs_i%=%_GetArgs_TmpArg%"
			SET /A "_GetArgs_i=%_GetArgs_i%+1"

		GOTO GetArgs_ENDIF_NoSwitch
		:GetArgs_ELSE_NoSwitch

			:: Create _Arg.{parameter}={Value} or _Arg.{parameter}=ON
			FOR /F "tokens=1* delims=: " %%A IN ('ECHO %_GetArgs_TmpArg:~1%') DO CALL :GetArgs_FOR_Switch %%A %%B ON
			GOTO :GetArgs_ENDFOR_Switch
			:GetArgs_FOR_Switch

				SET "_Arg.%1=%2"

			GOTO :EOF
			:GetArgs_ENDFOR_Switch

		:GetArgs_ENDIF_NoSwitch

	GOTO :EOF
	:GetArgs_ENDFOR_EachArg

	SET "_GetArgs_i="
	SET "_GetArgs_TmpArg="

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

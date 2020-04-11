:: Example of using the function
@ECHO OFF

CALL :GetArgs %*

ECHO Args are:
SET _Arg.

EXIT /B 0


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
::     Script call:
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
	SET _Arg.=.
	FOR /F "DELIMS==" %%v IN ('SET _Arg.') DO  SET %%v=

	:: Loop for each argument
	SET _i=1
	FOR %%v IN (%*) DO CALL :GetArgs_FOR_EachArg %%v
	GOTO GetArgs_ENDFOR_EachArg
	:GetArgs_FOR_EachArg

		SET _TmpArg=%1

		:: If parameter is not a switch, create '_Arg.{i}={parameter}'
		IF "%_TmpArg:~0,1%"=="/" GOTO GetArgs_ELSE_NoSwitch

			SET _Arg.%_i%=%_TmpArg%
			SET /A _i=%_i%+1

		GOTO GetArgs_ENDIF_NoSwitch
		:GetArgs_ELSE_NoSwitch

			FOR /F "tokens=1* delims=: " %%A IN ('ECHO %_TmpArg:~1%') DO (
				SET _Arg.%%A=%%B
			)

		:GetArgs_ENDIF_NoSwitch

	GOTO :EOF
	:GetArgs_ENDFOR_EachArg

	SET _i=
	SET _TmpArg=

GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

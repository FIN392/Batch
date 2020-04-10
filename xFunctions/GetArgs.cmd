:: Example of using the function
@ECHO OFF

CALL :GetArgs

ECHO Args are:
SET _Args.

EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Load parameters into variables '_Arg.{parameter}'.
::
:GetArgs

	:: Clean _Arg variables
	SET _Arg.=.
	FOR /F "DELIMS==" %%v IN ('SET _Arg.') DO  SET %%v=

	:: Loop for each argument
	SET _i=1
	FOR %%v IN (%*) DO CALL :GetArgs_ForEachArg %%v
	GOTO GetArgs_EndForEachArg
	:GetArgs_ForEachArg


		SET _TmpArg=%1
		SET _TmpSwitch=%_TmpArg:~1%
		
		:: If parameter is like '/xxx:yyy', create '_Arg.xxx=yyy'
		ECHO %_TmpArg%|findstr /R "\/..*:..*" > NUL
		IF NOT ERRORLEVEL 1 SET _Arg.%_TmpSwitch::==%& GOTO GetArgs_NextArg

		:: If parameter is like '/xxx', create '_Arg.xxx=ON'
		ECHO %_TmpArg%|findstr /R "\/..*" > NUL
		IF NOT ERRORLEVEL 1 SET _Arg.%_TmpSwitch%=ON& GOTO GetArgs_NextArg
		
		:: Otherwise, create _Arg.{n}={parameter}
		SET _Arg.%_i%=%_TmpArg%
		SET /A _i=%_i%+1

		:GetArgs_NextArg
	GOTO :EOF
	:GetArgs_EndForEachArg

	SET _i=
	SET _TmpArg=
	SET _TmpSwitch=

GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

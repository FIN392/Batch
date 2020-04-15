@SET _Red=[91m
@SET _Std=[0m



: Main
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

	CALL :Sum %~1 %~2
	IF %ERRORLEVEL% NEQ 0 ECHO "Falló la suma"
	ECHO [%:Sum%]

	ECHO 1
	CALL :Error %~n0 1 "Error y continua"
	ECHO 2
	GOTO :Error %~n0 2 "Error y para"
	ECHO 3

	
ENDLOCAL
EXIT /B 0


:Sum
SETLOCAL

	
	SET /A Return=%~1 + %~2
echo on	
ENDLOCAL & SET "%0=%Return%"
EXIT /B 0



:Error
	ECHO %_Red%FUNCTION: %1%_Std% 1>&2
	ECHO %_Red%ERROR #: %2%_Std% 1>&2
	ECHO %_Red%DESCRIPTION: %3%_Std% 1>&2
EXIT /B %2


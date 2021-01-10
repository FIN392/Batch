:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	CALL :StrUppercase UP AbcDef
	ECHO Uppercase=[%UP%]

	:: Remove surrounding quotes if exist
	CALL :StrUppercase UP "This is "another" test"
	ECHO Uppercase=[%UP%]

	CHCP 65001 > NUL
	CALL :StrUppercase LOWER "'árbol' is tree in Spanish (Español)"
	ECHO Uppercase=[%LOWER%]

:End_of_script
ENDLOCAL & EXIT /B %_Error%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Converts the string to uppercase.
::
:StrUppercase {Return_variable} {String}
SETLOCAL ENABLEDELAYEDEXPANSION & SET "_Error=0"

	SET "_Return=%~2"
	FOR %%a IN ( "a=A" "b=B" "c=C" "d=D" "e=E" "f=F" "g=G" "h=H" "i=I" "j=J" "k=K" "l=L" "m=M"
				 "n=N" "o=O" "p=P" "q=Q" "r=R" "s=S" "t=T" "u=U" "v=V" "w=W" "x=X" "y=Y" "z=Z"
				 "á=Á" "é=É" "í=Í" "ó=Ó" "ú=Ú" "ü=Ü" "ñ=Ñ" ) DO (
		FOR /F "usebackq tokens=1,2 delims==" %%b IN ('%%~a') DO (
			SET _Return=!_Return:%%b=%%c!
		)
	)

:End_StrUppercase
ENDLOCAL & SET "%~1=%_Return%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

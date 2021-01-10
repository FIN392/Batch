:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	CALL :StrLowercase LOWER AbcDef
	ECHO Uppercase=[%LOWER%]

	:: Remove surrounding quotes if exist
	CALL :StrLowercase LOWER "This is "another" test"
	ECHO Uppercase=[%LOWER%]

	CHCP 65001 > NUL
	CALL :StrLowercase LOWER "'Árbol' is tree in Spanish (ESPAÑOL)"
	ECHO Uppercase=[%LOWER%]

:End_of_script
ENDLOCAL & EXIT /B %_Error%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Converts the string to lowercase.
::
:StrLowercase {Return_variable} {String}
SETLOCAL ENABLEDELAYEDEXPANSION & SET "_Error=0"

	SET "_Return=%~2"
	FOR %%a IN ( "A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m"
				 "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z"
				 "Á=á" "É=é" "Í=í" "Ó=ó" "Ú=ú" "Ü=ü" "Ñ=ñ" ) DO (
		FOR /F "usebackq tokens=1,2 delims==" %%b IN ('%%~a') DO (
			SET _Return=!_Return:%%b=%%c!
		)
	)

:End_StrLowercase
ENDLOCAL & SET "%~1=%_Return%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

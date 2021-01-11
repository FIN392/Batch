:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	CALL :StrLowercase LOWER AbcDef
	ECHO Uppercase=[%LOWER%]

	:: Remove surrounding quotes if exist
	CALL :StrLowercase LOWER "This is "another" test"
	ECHO Uppercase=[%LOWER%]

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

	SET _Return=%_Return:A=a%
	SET _Return=%_Return:B=b%
	SET _Return=%_Return:C=c%
	SET _Return=%_Return:D=d%
	SET _Return=%_Return:E=e%
	SET _Return=%_Return:F=f%
	SET _Return=%_Return:G=g%
	SET _Return=%_Return:H=h%
	SET _Return=%_Return:I=i%
	SET _Return=%_Return:J=j%
	SET _Return=%_Return:K=k%
	SET _Return=%_Return:L=l%
	SET _Return=%_Return:M=m%
	SET _Return=%_Return:N=n%
	SET _Return=%_Return:O=o%
	SET _Return=%_Return:P=p%
	SET _Return=%_Return:Q=q%
	SET _Return=%_Return:R=r%
	SET _Return=%_Return:S=s%
	SET _Return=%_Return:T=t%
	SET _Return=%_Return:U=u%
	SET _Return=%_Return:V=v%
	SET _Return=%_Return:W=w%
	SET _Return=%_Return:X=x%
	SET _Return=%_Return:Y=y%
	SET _Return=%_Return:Z=z%

	:: Add your language-specific characters here
	SET _Return=%_Return:Á=á%
	SET _Return=%_Return:É=é%
	SET _Return=%_Return:Í=í%
	SET _Return=%_Return:Ó=ó%
	SET _Return=%_Return:Ú=ú%
	SET _Return=%_Return:Ü=ü%
	SET _Return=%_Return:Ñ=ñ%

ENDLOCAL & SET "%~1=%_Return%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

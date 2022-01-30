:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	:: Return the string in lowercase
	SET "MyString=AbcDef"
	CALL :StrLowercase MyStrLCase %MyString%
	ECHO [%MyString%] in lower case is [%MyStrLCase%]
	ECHO.

	:: Remove surrounding quotes if exist
	CALL :StrLowercase MyStrLCase "This is "another" test"
	ECHO ["This is "another" test"] in lower case is [%MyStrLCase%]
	ECHO.
	
	:: Example for other languajes
	CHCP 65001
	CALL :StrLowercase MyStrLCase "'Árbol' is tree in Spanish (ESPAÑOL)"
	ECHO Lower case=[%MyStrLCase%]
	ECHO.
	
	PAUSE
	
ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Converts the string to lowercase.
::
:StrLowercase {Return_variable} {String}
SETLOCAL

	SET "_Return=%~2"

	SET "_Return=%_Return:A=a%"
	SET "_Return=%_Return:B=b%"
	SET "_Return=%_Return:C=c%"
	SET "_Return=%_Return:D=d%"
	SET "_Return=%_Return:E=e%"
	SET "_Return=%_Return:F=f%"
	SET "_Return=%_Return:G=g%"
	SET "_Return=%_Return:H=h%"
	SET "_Return=%_Return:I=i%"
	SET "_Return=%_Return:J=j%"
	SET "_Return=%_Return:K=k%"
	SET "_Return=%_Return:L=l%"
	SET "_Return=%_Return:M=m%"
	SET "_Return=%_Return:N=n%"
	SET "_Return=%_Return:O=o%"
	SET "_Return=%_Return:P=p%"
	SET "_Return=%_Return:Q=q%"
	SET "_Return=%_Return:R=r%"
	SET "_Return=%_Return:S=s%"
	SET "_Return=%_Return:T=t%"
	SET "_Return=%_Return:U=u%"
	SET "_Return=%_Return:V=v%"
	SET "_Return=%_Return:W=w%"
	SET "_Return=%_Return:X=x%"
	SET "_Return=%_Return:Y=y%"
	SET "_Return=%_Return:Z=z%"

	:: Add your language-specific characters here
	SET "_Return=%_Return:Á=á%"
	SET "_Return=%_Return:É=é%"
	SET "_Return=%_Return:Í=í%"
	SET "_Return=%_Return:Ó=ó%"
	SET "_Return=%_Return:Ú=ú%"
	SET "_Return=%_Return:Ü=ü%"
	SET "_Return=%_Return:Ñ=ñ%"

ENDLOCAL & SET "%~1=%_Return%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

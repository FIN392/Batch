:: Example of function usage
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
	CALL :StrLowercase MyStrLCase "El niño trepó al árbol para ver a la cigüeña (ESPAÑOL)"
	ECHO Lower case=[%MyStrLCase%]
	ECHO.
	CALL :StrLowercase MyStrLCase "L'œuvre de l'architecte est décorée avec une élégance raffinée (FRANÇAIS)"
	ECHO Lower case=[%MyStrLCase%]
	ECHO.
	
	PAUSE
	
ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Convert the string to lowercase.
::
:: {Return_variable} : Name of the variable where the result will be returned.
:: {String}          : String to be converted.
::
:: Repository: https://github.com/FIN392/Batch
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
	:: Spanish
	SET "_Return=%_Return:Á=á%"
	SET "_Return=%_Return:É=é%"
	SET "_Return=%_Return:Í=í%"
	SET "_Return=%_Return:Ó=ó%"
	SET "_Return=%_Return:Ú=ú%"
	SET "_Return=%_Return:Ü=ü%"
	SET "_Return=%_Return:Ñ=ñ%"
	:: French
	SET "_Return=%_Return:À=à%"
	SET "_Return=%_Return:Â=â%"
	SET "_Return=%_Return:Æ=æ%"
	SET "_Return=%_Return:Ç=ç%"
	SET "_Return=%_Return:É=é%"
	SET "_Return=%_Return:È=è%"
	SET "_Return=%_Return:Ê=ê%"
	SET "_Return=%_Return:Ë=ë%"
	SET "_Return=%_Return:Î=î%"
	SET "_Return=%_Return:Ï=ï%"
	SET "_Return=%_Return:Ô=ô%"
	SET "_Return=%_Return:Œ=œ%"
	SET "_Return=%_Return:Ù=ù%"
	SET "_Return=%_Return:Û=û%"
	SET "_Return=%_Return:Ü=ü%"
	SET "_Return=%_Return:Ÿ=ÿ%"

ENDLOCAL & SET "%~1=%_Return%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Convert the string to lowercase.
::
:: Syntax: StrLowercase <Return_variable> <String>
::     <Return_variable> : Variable where the result will be returned.
::     <String>          : String to be converted.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:StrLowercase <Return_variable> <String>
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

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyText=This is a test"
CALL %Func_%StrLowercase MyTextLCase "%MyText%"
ECHO [%MyText%] = [%MyTextLCase%]

CHCP 65001 > NUL 2> NUL

SET "MyText=Español: El niño trepó al árbol para ver a la cigüeña"
CALL %Func_%StrLowercase MyTextLCase "%MyText%"
ECHO [%MyText%] = [%MyTextLCase%]

SET "MyText=Français: L'œuvre de l'architecte est décorée avec une élégance raffinée"
CALL %Func_%StrLowercase MyTextLCase "%MyText%"
ECHO [%MyText%] = [%MyTextLCase%]

EXIT /B 0

:: Results:
::
:: [This is a test] = [this is a test]
:: [Español: El niño trepó al árbol para ver a la cigüeña] = [español: el niño trepó al árbol para ver a la cigüeña]
:: [Français: L'œuvre de l'architecte est décorée avec une élégance raffinée] = [français: l'œuvre de l'architecte est décorée avec une élégance raffinée]
::
REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Converts the string to uppercase.
::
:: Syntax: StrUppercase <Return_variable> <String>
::     <Return_variable> : Variable where the result will be returned.
::     <String>          : String to be converted.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:StrUppercase <Return_variable> <String>
SETLOCAL

	SET "_Return=%~2"

	SET "_Return=%_Return:a=A%"
	SET "_Return=%_Return:b=B%"
	SET "_Return=%_Return:c=C%"
	SET "_Return=%_Return:d=D%"
	SET "_Return=%_Return:e=E%"
	SET "_Return=%_Return:f=F%"
	SET "_Return=%_Return:g=G%"
	SET "_Return=%_Return:h=H%"
	SET "_Return=%_Return:i=I%"
	SET "_Return=%_Return:j=J%"
	SET "_Return=%_Return:k=K%"
	SET "_Return=%_Return:l=L%"
	SET "_Return=%_Return:m=M%"
	SET "_Return=%_Return:n=N%"
	SET "_Return=%_Return:o=O%"
	SET "_Return=%_Return:p=P%"
	SET "_Return=%_Return:q=Q%"
	SET "_Return=%_Return:r=R%"
	SET "_Return=%_Return:s=S%"
	SET "_Return=%_Return:t=T%"
	SET "_Return=%_Return:u=U%"
	SET "_Return=%_Return:v=V%"
	SET "_Return=%_Return:w=W%"
	SET "_Return=%_Return:x=X%"
	SET "_Return=%_Return:y=Y%"
	SET "_Return=%_Return:z=Z%"

	:: Add your language-specific characters here
	:: Spanish
	SET "_Return=%_Return:á=Á%"
	SET "_Return=%_Return:é=É%"
	SET "_Return=%_Return:í=Í%"
	SET "_Return=%_Return:ó=Ó%"
	SET "_Return=%_Return:ú=Ú%"
	SET "_Return=%_Return:ü=Ü%"
	SET "_Return=%_Return:ñ=Ñ%"
	:: French
	SET "_Return=%_Return:à=À%"
	SET "_Return=%_Return:â=Â%"
	SET "_Return=%_Return:æ=Æ%"
	SET "_Return=%_Return:ç=Ç%"
	SET "_Return=%_Return:é=É%"
	SET "_Return=%_Return:è=È%"
	SET "_Return=%_Return:ê=Ê%"
	SET "_Return=%_Return:ë=Ë%"
	SET "_Return=%_Return:î=Î%"
	SET "_Return=%_Return:ï=Ï%"
	SET "_Return=%_Return:ô=Ô%"
	SET "_Return=%_Return:œ=Œ%"
	SET "_Return=%_Return:ù=Ù%"
	SET "_Return=%_Return:û=Û%"
	SET "_Return=%_Return:ü=Ü%"
	SET "_Return=%_Return:ÿ=Ÿ%"
		
ENDLOCAL & SET "%~1=%_Return%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyText=This is a test"
CALL %Func_%StrUppercase MyTextUCase "%MyText%"
ECHO [%MyText%] & ECHO [%MyTextUCase%]

CHCP 65001 > NUL 2> NUL

SET "MyText=Español: El niño trepó al árbol para ver a la cigüeña"
CALL %Func_%StrUppercase MyTextUCase "%MyText%"
ECHO [%MyText%] = [%MyTextUCase%]

SET "MyText=Français: L'œuvre de l'architecte est décorée avec une élégance raffinée"
CALL %Func_%StrUppercase MyTextUCase "%MyText%"
ECHO [%MyText%] = [%MyTextUCase%]

EXIT /B 0

:: Results:
::
:: [This is a test] = [THIS IS A TEST]
:: [Español: El niño trepó al árbol para ver a la cigüeña] = [ESPAÑOL: EL NIÑO TREPÓ AL ÁRBOL PARA VER A LA CIGÜEÑA]
:: [Français: L'œuvre de l'architecte est décorée avec une élégance raffinée] = [FRANÇAIS: L'ŒUVRE DE L'ARCHITECTE EST DÉCORÉE AVEC UNE ÉLÉGANCE RAFFINÉE]
::
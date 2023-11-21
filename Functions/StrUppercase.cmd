:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	:: Return the string in uppercase
	SET "MyString=AbcDef"
	CALL :StrUppercase MyStrUCase %MyString%
	ECHO [%MyString%] in capital letters is [%MyStrUCase%]
	ECHO.

	:: Remove surrounding quotes if exist
	CALL :StrUppercase MyStrUCase "This is "another" test"
	ECHO ["This is "another" test"] in capital letters is [%MyStrUCase%]
	ECHO.
	
	:: Example for other languajes
	CHCP 65001
	CALL :StrUppercase MyStrUCase "'Árbol' is tree in Spanish (ESPAÑOL)"
	ECHO Capital letters=[%MyStrUCase%]
	ECHO.
	
	PAUSE
	
ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Converts the string to uppercase.
::
:StrUppercase {Return_variable} {String}
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
	SET "_Return=%_Return:á=Á%"
	SET "_Return=%_Return:é=É%"
	SET "_Return=%_Return:í=Í%"
	SET "_Return=%_Return:ó=Ó%"
	SET "_Return=%_Return:ú=Ú%"
	SET "_Return=%_Return:ü=Ü%"
	SET "_Return=%_Return:ñ=Ñ%"
		
ENDLOCAL & SET "%~1=%_Return%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

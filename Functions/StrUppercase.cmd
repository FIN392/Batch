:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	CALL :StrUppercase UP AbcDef
	ECHO Uppercase=[%UP%]

	:: Remove surrounding quotes if exist
	CALL :StrUppercase UP "This is "another" test"
	ECHO Uppercase=[%UP%]

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

	SET _Return=%_Return:a=A%
	SET _Return=%_Return:b=B%
	SET _Return=%_Return:c=C%
	SET _Return=%_Return:d=D%
	SET _Return=%_Return:e=E%
	SET _Return=%_Return:f=F%
	SET _Return=%_Return:g=G%
	SET _Return=%_Return:h=H%
	SET _Return=%_Return:i=I%
	SET _Return=%_Return:j=J%
	SET _Return=%_Return:k=K%
	SET _Return=%_Return:l=L%
	SET _Return=%_Return:m=M%
	SET _Return=%_Return:n=N%
	SET _Return=%_Return:o=O%
	SET _Return=%_Return:p=P%
	SET _Return=%_Return:q=Q%
	SET _Return=%_Return:r=R%
	SET _Return=%_Return:s=S%
	SET _Return=%_Return:t=T%
	SET _Return=%_Return:u=U%
	SET _Return=%_Return:v=V%
	SET _Return=%_Return:w=W%
	SET _Return=%_Return:x=X%
	SET _Return=%_Return:y=Y%
	SET _Return=%_Return:z=Z%

	:: Add your language-specific characters here
	SET _Return=%_Return:á=Á%
	SET _Return=%_Return:é=É%
	SET _Return=%_Return:í=Í%
	SET _Return=%_Return:ó=Ó%
	SET _Return=%_Return:ú=Ú%
	SET _Return=%_Return:ü=Ü%
	SET _Return=%_Return:ñ=Ñ%
		
ENDLOCAL & SET "%~1=%_Return%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Example of using the function
:Main
@ECHO OFF & SETLOCAL
SET Err=0

CALL :GetIniValue _IniValue .\GetIniValue_example.ini "My Section" "My Value" || ECHO INI file doesn't exist

ECHO Value value is [%_IniValue%]

:End_of_script
ENDLOCAL & EXIT /B %Err%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Get a value of particular section in a INI file.
::
:: Return a value from one section in a INI file.
:: Return ERRORLEVEL = 1 if INI file doesn't exist.
::
::
:GetIniValue {Return_variable} {INI_file} {Section} {Value}
SETLOCAL

	SET "_Section=%3"
	SET "_Section=%_Section:"=%"
	SET "_Value=%4"
	SET "_Value=%_Value:"=%"

	SET "_ReturnValue="

	:: Does the file exist?
	IF NOT EXIST "%~f2" GOTO GetIniValue_ELSE_Exist

		:: Loop of lines in INI file lines (only section labels and searched value)
		FOR /F "tokens=*" %%L IN ('findstr /I /R /C:"^[ ,]*\[.*\][ ,]*$" /C:"^[ ,]*%_Value%[ ,]*\=" "%~f2"') DO CALL :GetIniValue_FOR_Line %%L
		GOTO :GetIniValue_ENDFOR_Line
		:GetIniValue_FOR_Line

			SET "_Line=%*"
			IF "%_Line:~0,1%"=="[" SET "_WantedSection=0"
			IF "%_Line%"=="[%_Section%]" SET "_WantedSection=1"
			IF "%_WantedSection%"=="1" IF NOT "%_Line:~0,1%"=="[" FOR /F "tokens=1,2 delims==" %%A IN ('ECHO "%_Line%"') DO SET "_ReturnValue=%%B"
			
		GOTO :EOF
		:GetIniValue_ENDFOR_Line

	GOTO GetIniValue_ENDIF_Exist
	:GetIniValue_ELSE_Exist
		SET "_Error=1"
		SET "_ReturnValue=."
	:GetIniValue_ENDIF_Exist

ENDLOCAL & SET "%~1=%_ReturnValue:~0,-1%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

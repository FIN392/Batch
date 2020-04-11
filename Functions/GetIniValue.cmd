:: Example of using the function
@ECHO OFF

CALL :GetIniValue _IniValue .\GetIniValue_example.ini "My Section" MyValue

ECHO 'Value' value is '%_IniValue%'

EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return a value from one section in a INI file.
::
::
:GetIniValue {Return_variable} {INI_file} {Section} {Value}
SETLOCAL

	:: Comments	= findstr /I /N /R /C:"^[ ,	]*\;"
	:: Section	= findstr /I /N /R /C:"^[ ,	]*\[SECTION\][ ,	]*$"
	:: Value    = findstr /I /N /R /C:"^[ ,	]*VALUE[ ,	]*\="

	SET _INIFile=%2
	SET _Section=%3
	SET _Value=%4

	:: Does the file exist?
	IF NOT EXIST %_INIFile% GOTO GetIniValue_ELSE_Exist

		:: Loop of lines in INI file lines (only section labels and searched value)
		FOR /F "tokens=*" %%L IN ('findstr /I /R /C:"^[ ,]*\[.*\][ ,]*$" /C:"^[ ,]*%_Value%[ ,]*\=" %_INIFile%') DO CALL :GetIniValue_FOR_Line %%L
		GOTO :GetIniValue_ENDFOR_Line
		:GetIniValue_FOR_Line

			SET _Line=%*

			IF "%_Line:~0,1%"=="[" SET _WantedSection=0
			IF "%_Line%"=="[%_Section%]" SET _WantedSection=1

			ECHO %_Line% | findstr /I /R /C:"^[ ,	]*%_Value%[ ,	]*\=" > NUL 2> NUL
			IF NOT ERRORLEVEL 1 IF "%_WantedSection%"=="1" SET _%_Line%

		GOTO :EOF
		:GetIniValue_ENDFOR_Line


		SET _

		ECHO SET _TmpValue=!_%_Value%!

	GOTO GetIniValue_ENDIF_Exist
	:GetIniValue_ELSE_Exist
		ECHO [91mERROR: File '%_INIFile%' doesn't exist[0m
		SET _TmpValue=*** ERROR ***
	:GetIniValue_ENDIF_Exist

ENDLOCAL & SET %1=%_TmpValue%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

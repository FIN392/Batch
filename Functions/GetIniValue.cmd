:: Example of using the function
@ECHO OFF

CALL :GetIniValue _IniValue .\GetIniValue_example.ini Section Value

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
	:: Section	= findstr /I /N /R /C:"^[ ,	]*\[SECTION*\][ ,	]*$"
	:: Value    = findstr /I /N /R /C:"^[ ,	]*VALUE[ ,	]*\="

	:: Does the file exist?
	IF NOT EXIST %2 GOTO GetIniValue_ELSE_Exist



		SET _TmpValue=XXXX

	GOTO GetIniValue_ENDIF_Exist
	:GetIniValue_ELSE_Exist
		ECHO [91mERROR: File '%2' doesn't exist[0m
		SET _TmpValue=*** ERROR ***
	:GetIniValue_ENDIF_Exist

ENDLOCAL & SET %1=%_TmpValue%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

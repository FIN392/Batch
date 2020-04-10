:: Example of using the function
@ECHO OFF

CALL :GetIniValue _IniValue C:\xxxx.ini Section Value

ECHO '' value is '%_IniValue%'

EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyymmddhhmmss.ffffff+mmm'
::
:: .
::
:GetIniValue {Return_variable} {INI_file} {Section} {Value}
SETLOCAL

	SET _TmpValue=XXXX

ENDLOCAL & SET %1=%_TmpValue%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Gets values ​​from an INI file.
::
:: Reads an INI file and, given a section name and key, gets the value.
:: Returns ERRORLEVEL = 1 if the INI file does not exist.
::
:: Syntax: GetIniValue <Return_variable> <INI_file> <Section> <Key>
::     <Return_variable> : Variable where the result will be returned.
::     <INI_file>        : INI file from which the value will be read.
::     <Section>         : Section where the key is located.
::     <Key>             : Key whose value is returned.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:GetIniValue <Return_variable> <INI_file> <Section> <Key>
SETLOCAL

	SET "_Error=0"
	SET "_Section=%3"
	SET "_Section=%_Section:"=%"
	SET "_Key=%4"
	SET "_Key=%_Key:"=%"

	SET "_ReturnValue="

	IF NOT EXIST "%~f2" GOTO ELSE_GetIniValue_Exist

		FOR /F "tokens=*" %%l IN ('FINDSTR /I /R /C:"^[ ,]*\[.*\][ ,]*$" /C:"^[ ,]*%_Key%[ ,]*\=" "%~f2"') DO CALL :FOR_GetIniValue_Line %%l
		GOTO :ENDFOR_GetIniValue_Line
		:FOR_GetIniValue_Line

			SET "_Line=%*"
			IF "%_Line:~0,1%"=="[" SET "_WantedSection=0"
			IF "%_Line%"=="[%_Section%]" SET "_WantedSection=1"
			IF "%_WantedSection%"=="1" IF NOT "%_Line:~0,1%"=="[" FOR /F "tokens=1,2 delims==" %%A IN ('ECHO "%_Line%"') DO SET "_ReturnValue=%%B"
			
		GOTO :EOF
		:ENDFOR_GetIniValue_Line

	GOTO ENDIF_GetIniValue_Exist
	:ELSE_GetIniValue_Exist

		SET "_Error=1"
		SET "_ReturnValue="

	:ENDIF_GetIniValue_Exist

ENDLOCAL & SET "%~1=%_ReturnValue:~0,-1%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyINIFile=C:\Windows\system.ini"
SET "MySection=drivers"
SET "MyKey=timer"

CALL :GetIniValue _IniValue "%MyINIFile%" "%MySection%" "%MyKey%" || ECHO INI file doesn't exist
SET "_Err=%ERRORLEVEL%"
ECHO [%_IniValue%]

EXIT /B 0

:: Results:
::
:: [timer.drv]
::
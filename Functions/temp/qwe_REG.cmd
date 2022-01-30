@ECHO OFF

	CALL :GetRegVal WindowSize_RegData "HKEY_CURRENT_USER\AAA Key" "Value EXPAND_SZ"
	IF NOT ERRORLEVEL 1 ( SET WindowSize_RegData & ECHO. ) ELSE ( ECHO ??? & ECHO. )

	CALL :GetRegVal WindowSize_RegData "HKEY_CURRENT_USER\AAA Key" "Value QWORD"
	IF NOT ERRORLEVEL 1 ( SET WindowSize_RegData & ECHO. ) ELSE ( ECHO ??? & ECHO. )

	CALL :GetRegVal WindowSize_RegData "HKEY_CURRENT_USER\AAA Key" "Value DWORD"
	IF NOT ERRORLEVEL 1 ( SET WindowSize_RegData & ECHO. ) ELSE ( ECHO ??? & ECHO. )

	CALL :GetRegVal WindowSize_RegData "HKEY_CURRENT_USER\AAA Key" "Value BINARY"
	IF NOT ERRORLEVEL 1 ( SET WindowSize_RegData & ECHO. ) ELSE ( ECHO ??? & ECHO. )

	CALL :GetRegVal WindowSize_RegData "HKEY_CURRENT_USER\AAA Key" "Value SZ"
	IF NOT ERRORLEVEL 1 ( SET WindowSize_RegData & ECHO. ) ELSE ( ECHO ??? & ECHO. )

	CALL :GetRegVal WindowSize_RegData "HKEY_CURRENT_USER\AAA Key" "Value MULTI_SZ"
	IF NOT ERRORLEVEL 1 ( SET WindowSize_RegData & ECHO. ) ELSE ( ECHO ??? & ECHO. )

	CALL :GetRegVal WindowSize_RegData "HKEY_UNKNOWN\Console" "WindowSize"
	IF NOT ERRORLEVEL 1 ( SET WindowSize_RegData & ECHO. ) ELSE ( ECHO ??? & ECHO. )

	CALL :GetRegVal WindowSize_RegData "HKEY_CURRENT_USER\Console" "UnKnown"
	IF NOT ERRORLEVEL 1 ( SET WindowSize_RegData & ECHO. ) ELSE ( ECHO ??? & ECHO. )

EXIT /B 0



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Get the data of a registry value.
::
:: Return {KeyName}/t{ValueName}/t{Data} on the {Return_variable}.
:: Return ERRORLEVEL = 1 if registry key/value doesn't exist.
::
:GetRegVal {Return_variable} {KeyName} {ValueName}
SETLOCAL ENABLEDELAYEDEXPANSION

	FOR /F "usebackq tokens=*" %%r IN (`REG QUERY %2 /v %3 2^> NUL ^| FINDSTR /C:"%~3"`) DO (

		SET "RegQuery=%%r"
		SET "RegQuery=!RegQuery:    =	!"
		FOR /F "usebackq tokens=1,2* delims=	" %%a IN (`ECHO !RegQuery!`) DO (
			SET "_RegVal=%%a	%%b	%%c"
		)

	)

	IF DEFINED _RegVal (
		SET "_Error=0"
	) ELSE (
		SET "_Error=1"
	)

ENDLOCAL & SET "%~1=%_RegVal%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Create a empty file on folder %TEMP% with name '~yyyymmddhhmmss.tmp'.
::
:: Remember to delete the temporary files at the end of your script.
::
:: Return name of created file on the {Return_variable}.
:: Return ERRORLEVEL = 1 if file can't be created.
::
:SetRegVal {Reg_variable}
SETLOCAL




ENDLOCAL & SET "%~1=%_File%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

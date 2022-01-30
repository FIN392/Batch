:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	:: Create the temp file. If fail then stop
	CALL :CreateTempFile MyTempFile || (
		ECHO *** Temp file creation failed
		EXIT /B 1
	)

	ECHO The file created is [%MyTempFile%]
	ECHO.

	:: Remember to delete temp files at the end
	DEL "%MyTempFile%" > NUL 2>&1
	
	PAUSE

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Create a empty file on folder %TEMP% with name '~yyyymmddhhmmss.tmp'.
::
:: Remember to delete the temporary files at the end of your script.
::
:: Return name of created file on the {Return_variable}.
:: Return ERRORLEVEL = 1 if file can't be created.
::
:CreateTempFile {Return_variable}
SETLOCAL

	:CreateTempFile_Loop
		FOR /F "tokens=2 delims=.=" %%t IN ('WMIC OS GET LocalDateTime /VALUE ^| FIND "="') DO SET "_File=%TEMP%\~%%t.tmp"
	IF EXIST "%_File%" GOTO CreateTempFile_Loop
	
	(TYPE NUL > "%_File%") 2> NUL

	IF EXIST "%_File%" ( SET "_Error=0" ) ELSE ( SET "_File=" & SET "_Error=1" )

ENDLOCAL & SET "%~1=%_File%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

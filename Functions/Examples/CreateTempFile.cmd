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
	DEL "%MyTempFile%" > NUL 2> NUL
	
	PAUSE

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Create an empty file in the %TEMP% folder with name '~yyyymmddhhmmss.tmp'.
::
:: Return the name of the created file or ERRORLEVEL = 1 if the file cannot be
:: created.
::
:: NOTE: Remember to delete temporary files at the end of the script.
::
:: {Return_variable} : Name of the variable where the result will be returned.
::
:: Repository: https://github.com/FIN392/Batch
::
:CreateTempFile {Return_variable}
SETLOCAL

	:CreateTempFile_Loop
		FOR /F %%t IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMddhhmmss'"') DO SET "_File=%TEMP%\~%%t.tmp"
	IF EXIST "%_File%" GOTO CreateTempFile_Loop
	
	(TYPE NUL > "%_File%") 2> NUL

	IF EXIST "%_File%" ( SET "_Error=0" ) ELSE ( SET "_File=" & SET "_Error=1" )

ENDLOCAL & SET "%~1=%_File%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

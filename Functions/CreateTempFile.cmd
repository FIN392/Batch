:: Example of using the function
@ECHO OFF

CALL :CreateTempFile _MyTempFile || ECHO Temp file creation failed

ECHO Temp file is: [%_MyTempFile%]

:: Remember to delete temp files at the end
IF EXIST "%_MyTempFile%" DEL "%_MyTempFile%"

EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Create a empty file on folder %TEMP% with name '~{yyyymmddhhmmss}.tmp'.
::
:: Remember to delete the temporary files at the end of your script.
::
:: Return name of created file on the {Return_variable}.
:: Return ERRORLEVEL = 1 if file can't be created.
::
:CreateTempFile {Return_variable}
SETLOCAL

	:CreateTempFile_Loop
		FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET _%%t
	IF EXIST "%TEMP%\~%_LocalDateTime:~0,14%.tmp" GOTO CreateTempFile_Loop
	(TYPE NUL > "%TEMP%\~%_LocalDateTime:~0,14%.tmp") 2> NUL && (
		SET "_File=%TEMP%\~%_LocalDateTime:~0,14%.tmp"
		SET "_Error=0"
	) || (
		SET "_File="
		SET "_Error=1"
	)

ENDLOCAL & SET "%~1=%_File%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

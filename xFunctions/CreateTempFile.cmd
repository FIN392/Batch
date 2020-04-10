:: Example of using the function
@ECHO OFF

CALL :CreateTempFile _MyTempFile

ECHO Temp file is '%_MyTempFile%'

EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Create a empty temp file on folder %TEMP% with format '{ScriptName}_yyyymmddhhmmss.tmp'.
::
:: Remember to delete the temporary files at the end of your script.
::
:: Return file name.
::
:CreateTempFile {Return_variable}
SETLOCAL

	:CreateTempFile_Loop
		FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET _%%t
		SET _Tempfile=%TEMP%\~%_LocalDateTime:~0,14%.tmp
	IF EXIST "%_TempFile%" GOTO CreateTempFile_Loop
	TYPE NUL > "%_TempFile%" || ( ECHO [91mERROR: File '%_Tempfile%' can't be created[0m & SET _Tempfile=*** ERROR ***)
	
ENDLOCAL & SET %1=%_Tempfile%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

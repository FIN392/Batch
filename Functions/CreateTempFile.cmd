:: Example of using the function
@ECHO OFF

CALL :CreateTempFile _MyTempFile

ECHO Temp file is %_MyTempFile%

:: Remember to delete temp files at the end
IF EXIST %_MyTempFile% DEL %_MyTempFile%

EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Create a empty file with name '~{yyyymmddhhmmss}.tmp' on folder %TEMP%.
::
:: Remember to delete the temporary files at the end of your script.
::
:: Return name of created file.
::
:CreateTempFile {Return_variable}

	:CreateTempFile_Loop
		FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET _%%t
	IF EXIST "cc%TEMP%\~%_LocalDateTime:~0,14%.tmp" GOTO CreateTempFile_Loop
	TYPE NUL > "cc%TEMP%\~%_LocalDateTime:~0,14%.tmp" && (
		SET %1="cc%TEMP%\~%_LocalDateTime:~0,14%.tmp"
	) || (
		ECHO [91mERROR: File "cc%TEMP%\~%_LocalDateTime:~0,14%.tmp" can't be created[0m
		SET %1="*** ERROR ***"
	)

GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

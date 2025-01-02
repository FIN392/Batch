REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Create an empty file in the %TEMP% folder with name '~yyyymmddhhmmss.tmp'.
::
:: Return the name of the created file or ERRORLEVEL = 1 if the file cannot be
:: created.
::
:: NOTE: Remember to delete temporary files at the end of the script.
::
:: Syntax: CreateTempFile <Return_variable>
::     <Return_variable> : Variable where the result will be returned.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:CreateTempFile <Return_variable>
SETLOCAL

	:CreateTempFile_Loop
		FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "DateTime=%%a %%b"
		SET "_File=%TEMP%\~%DateTime:~0,4%%DateTime:~5,2%%DateTime:~8,2%%DateTime:~11,2%%DateTime:~14,2%%DateTime:~17,2%.tmp"
	IF EXIST "%_File%" GOTO CreateTempFile_Loop
	
	(TYPE NUL > "%_File%") 2> NUL

	IF EXIST "%_File%" ( SET "_Error=0" ) ELSE ( SET "_File=" & SET "_Error=1" )

ENDLOCAL & SET "%~1=%_File%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

CALL %Func_%CreateTempFile MyTempFile
ECHO [%MyTempFile%]

DEL "%MyTempFile%" > NUL 2> NUL

EXIT /B 0

:: Results:
::
:: [C:\Users\fin392\AppData\Local\Temp\~20250101211855.tmp]
::
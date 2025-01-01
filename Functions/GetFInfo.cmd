REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Get information about a file or folder.
::
:: Syntax: GetFInfo <Return_variable> <Item_name>
::     <Return_variable> : Root name of variables where the result will be
::                         returned.
::     <Item_name>       : Name of folder or file to analyze.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:GetFInfo <Return_variable> <Item_name>

	FOR /F "tokens=1* delims==" %%v IN ('^(SET %~1.^) 2^> NUL') DO SET "%%v="
	
	IF EXIST "%~f2" GOTO :GetFInfo_Exist
		SET "%~1.Exist=FALSE"
		EXIT /B 0	
	:GetFInfo_Exist

	SET "%~1.Exist=TRUE"
	SET "%~1.FQFilename=%~f2"
	SET "%~1.Drive=%~d2"
	SET "%~1.Path=%~p2"
	SET "%~1.Name=%~n2"
	SET "%~1.Extension=%~x2"
	SET "%~1.ShortName=%~s2"
	SET "%~1.Attributes=%~a2"

	ECHO %~a2 | FIND "d" > NUL
	IF ERRORLEVEL 1 GOTO :ELSE_GetFInfo_isFile
		SET "%~1.Type=FOLDER"
		FOR /F "tokens=1" %%f IN ('DIR "%~f2" /S /A-D /-C ^| FIND /V " 0 "') DO SET "%~1.Files=%%f"
	GOTO :ENDIF_GetFInfo_isFile
	:ELSE_GetFInfo_isFile
		SET "%~1.Type=FILE"
		SET "%~1.Size=%~z2"
	:ENDIF_GetFInfo_isFile

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyFolder=C:\Windows\System32\drivers\etc"
CALL %Func_%GetFInfo MyFolderInfo "%MyFolder%"
SET MyFolderInfo.

SET "MyFile=%0"
CALL %Func_%GetFInfo MyFileInfo "%MyFile%"
SET MyFileInfo.

EXIT /B 0

:: Results:
::
:: MyFolderInfo.Attributes=d----------
:: MyFolderInfo.Drive=C:
:: MyFolderInfo.Exist=TRUE
:: MyFolderInfo.Files=6
:: MyFolderInfo.FQFilename=C:\Windows\System32\drivers\etc
:: MyFolderInfo.Name=etc
:: MyFolderInfo.Path=\Windows\System32\drivers\
:: MyFolderInfo.ShortName=C:\Windows\System32\drivers\etc
:: MyFolderInfo.Type=FOLDER
:: MyFileInfo.Attributes=--a-----l--
:: MyFileInfo.Drive=d:
:: MyFileInfo.Exist=TRUE
:: MyFileInfo.Extension=.cmd
:: MyFileInfo.FQFilename=d:\OneDrive\DEV\GitHub\Batch\Functions\GetFInfo.cmd
:: MyFileInfo.Name=GetFInfo
:: MyFileInfo.Path=\OneDrive\DEV\GitHub\Batch\Functions\
:: MyFileInfo.ShortName=d:\OneDrive\DEV\GitHub\Batch\Functions\GetFInfo.cmd
:: MyFileInfo.Size=1698
:: MyFileInfo.Type=FILE
::
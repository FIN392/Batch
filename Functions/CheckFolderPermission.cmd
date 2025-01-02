REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Check folder permission.
::
:: Returns the permissions of the account running the script on the folder.
::   NA = No access
::   RO = Read only
::   RW = Read & write
::
:: Syntax: CheckFolderPermission <Return_variable> <Folder>
::     <Return_variable> : Variable where the result will be returned.
::     <Folder>          : Folder to check.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:CheckFolderPermission <Return_variable> <Folder>
SETLOCAL

	SET "_Permissions=NA"
	
	IF EXIST "%~2\*.*" SET "_Permissions=RO"
	
	(ECHO "%DATE% %TIME% Checking folder permission..." > "%~2\CheckFolderPermission.tmp") 2> NUL
	IF EXIST "%~2\CheckFolderPermission.tmp" SET "%_Permissions=RW"
	DEL "%~2\CheckFolderPermission.tmp" > NUL 2> NUL

ENDLOCAL & SET "%~1=%_Permissions%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

:: Folder with Read Only access
CALL :CheckFolderPermission MyRights "C:\Windows"
ECHO Permission for "C:\Windows" is [%MyRights%]

:: Folder with Read Write access
CALL :CheckFolderPermission MyRights "%TEMP%"
ECHO Permission for "%TEMP%" is [%MyRights%]

:: Folder with No access
CALL :CheckFolderPermission MyRights "C:\System Volume Information"
ECHO Permission for "C:\System Volume Information" is [%MyRights%]

EXIT /B 0

:: Results:
::
:: Permission for "C:\Windows" is [RO]
:: Permission for "C:\Users\josel\AppData\Local\Temp" is [RW]
:: Permission for "C:\System Volume Information" is [NA]
::
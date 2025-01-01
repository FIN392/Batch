:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Check folder permission.
::
:: Returns the permissions of the account running the script on the folder.
::   NA = No access
::   RO = Read only
::   RW = Read & write
::
:: {Return_variable} : Name of the variable where the result will be returned.
:: {Folder}          : Folder on which permissions are checked.
::
:: Sintax: ...
::     {Return_variable} : Variable where the result will be returned.
::
:: Requirements: (none)
::
:: Example:
::
::     :: Set here your functions folder ending in '\'
::     @ECHO OFF & SET "Func_=CALL X:\Batch\Functions\"
::
::     ...
::
::     EXIT /B 0
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:CheckFolderPermission {Return_variable} {Folder}
SETLOCAL

	SET "_Permissions=NA"
	
	IF EXIST "%~2\*.*" SET "_Permissions=RO"
	
	ECHO "%DATE% %TIME% Checking folder permission..." > "%~2\CheckFolderPermission.tmp" 2> NUL
	IF EXIST "%~2\CheckFolderPermission.tmp" SET "%_Permissions=RW"
	DEL "%~2\CheckFolderPermission.tmp" > NUL 2> NUL

ENDLOCAL & SET "%~1=%_Permissions%" & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

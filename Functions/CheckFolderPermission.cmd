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
:: Repository: https://github.com/FIN392/Batch
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

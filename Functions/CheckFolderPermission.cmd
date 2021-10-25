:: Example of using the function
@ECHO OFF & SETLOCAL

	CALL :CheckFolderPermission %* "C:\Windows"

	ECHO Args are:
	SET "_Arg."

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Check folder permission.
::
:: NA = No access
:: RO = Read only
:: RW = Read & write
::
:CheckFolderPermission {Return_variable} {Folder}

	SET "%~1=NA"
	
	IF EXIST "%~2\*.*" SET "%~1=RO"
	
	(ECHO "%DATE% %TIME% Checking access..." > "%~2\CheckingAccess.tmp") 2> NUL
	IF EXIST "%~2\CheckingAccess.tmp" SET "%~1=RW"
	(DEL "%~2\CheckingAccess.tmp" > NUL) 2> NUL

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

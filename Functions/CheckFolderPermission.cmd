:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	:: Folder with Read Only access
	CALL :CheckFolderPermission MyRights "C:\Windows"
	ECHO Permission for "C:\Windows" is [%MyRights%]
	ECHO.

	:: Folder with Read Write access
	CALL :CheckFolderPermission MyRights "%TEMP%"
	ECHO Permission for "%TEMP%" is [%MyRights%]
	ECHO.

	:: Folder with No access
	CALL :CheckFolderPermission MyRights "C:\System Volume Information"
	ECHO Permission for "C:\System Volume Information" is [%MyRights%]
	ECHO.

	PAUSE

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
	
	ECHO "%DATE% %TIME% Checking folder permission..." > "%~2\CheckFolderPermission.tmp" 2> NUL
	IF EXIST "%~2\CheckFolderPermission.tmp" SET "%~1=RW"
	DEL "%~2\CheckFolderPermission.tmp" > NUL 2> NUL

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

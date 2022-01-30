:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	CLS
	ECHO EXAMPLE #1: Folder with Read Only access
	ECHO.
	ECHO C:\^> CALL :CheckFolderPermission Rights "C:\Windows"
	
	CALL :CheckFolderPermission Rights "C:\Windows"
	
	ECHO.
	ECHO Returned=%Rights%
	ECHO.
	PAUSE
	ECHO.

	:::::::::::::::::::::::::::::::::::::::::::::::::

	CLS
	ECHO EXAMPLE #2: Folder with Read Write access
	ECHO.
	ECHO C:\^> CALL :CheckFolderPermission Rights "%%TEMP%%"
	
	CALL :CheckFolderPermission Rights "%TEMP%"
	
	ECHO.
	ECHO Returned=%Rights%
	ECHO.
	PAUSE
	ECHO.
	
	:::::::::::::::::::::::::::::::::::::::::::::::::

	CLS
	ECHO EXAMPLE #3: Folder with No access
	ECHO.
	ECHO C:\^> CALL :CheckFolderPermission Rights "C:\System Volume Information"
	
	CALL :CheckFolderPermission Rights "C:\System Volume Information"
	
	ECHO.
	ECHO Returned=%Rights%
	ECHO.
	PAUSE
	ECHO.

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

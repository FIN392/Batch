:: Example of using the function
@ECHO OFF & SETLOCAL
ECHO.

	:: Get file info
	CALL :GetFInfo MyFileInfo "C:\Windows\win.ini"
	SET MyFileInfo.
	ECHO.

	:: Get folder info
	CALL :GetFInfo MyFolderInfo C:\Windows
	SET MyFolderInfo.
	ECHO.

	:: Try to get information from a file that does not exist
	CALL :GetFInfo MyNoExistFile C:\No.Exist
	SET MyNoExistFile.
	ECHO.

	PAUSE

ENDLOCAL & EXIT /B 0	


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Get information about a file or folder.
::
:: {Return_variable} : Root of the variable names where the results will be
::                     returned
:: {Item_name}        : Name of folder or file to analyze.
::
:GetFInfo {Return_variable} {Item_name}

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

	ECHO %~a2 | findstr.exe /C:"d" > NUL
	IF ERRORLEVEL 1 GOTO :ELSE_GetFInfo_isFile
		SET "%~1.Type=FOLDER"
		FOR /F "tokens=1" %%f IN ('DIR /S /A-D /-C ^| FINDSTR /V " 0 "') DO SET "%~1.Files=%%f"
	GOTO :ENDIF_GetFInfo_isFile
	:ELSE_GetFInfo_isFile
		SET "%~1.Type=FILE"
		SET "%~1.Size=%~z2"
	:ENDIF_GetFInfo_isFile

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

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
:GetFInfo {Return_variable} {Filename}

	FOR /F "tokens=1* delims==" %%v IN ('^(SET %~1.^) 2^> NUL') DO (SET %%v=)
	
	:: Exist?
	IF EXIST "%~f2" GOTO :GetFInfo_Exist
		(SET %~1.Exist=FALSE)
		EXIT /B 0	
	:GetFInfo_Exist

	(SET %~1.Exist=TRUE)
	(SET %~1.FQFilename=%~f2)
	(SET %~1.Drive=%~d2)
	(SET %~1.Path=%~p2)
	(SET %~1.Name=%~n2)
	(SET %~1.Extension=%~x2)
	(SET %~1.ShortName=%~s2)
	(SET %~1.Attributes=%~a2)

	:: File name for WMIC
	(SET GetFInfo.WMICName=%~f2)
	(SET GetFInfo.WMICName=%GetFInfo.WMICName:\=\\%
	
	:: Is a file or a folder?
	ECHO %~a2 | findstr.exe /C:"d" > NUL
	IF ERRORLEVEL 1 GOTO :GetFInfo_isFile
		(SET %~1.Type=FOLDER)
		(SET GetFInfo.WMICCommand=FSDIR)
	GOTO :GetFInfo_EndFileFolder
	:GetFInfo_isFile
		(SET %~1.Type=FILE)
		(SET %~1.Size=%~z2)
		(SET GetFInfo.WMICCommand=DATAFILE)	
	:GetFInfo_EndFileFolder
	
	:: Get Compressed, Encrypted, CreationDate, LastAccessed and LastModified
	FOR /F "tokens=*" %%A IN ('wmic.exe %GetFInfo.WMICCommand% WHERE ^(Name^=^'%GetFInfo.WMICName%^'^) GET Compressed^,Encrypted^,CreationDate^,LastAccessed^,LastModified /FORMAT:LIST ^| FIND "="') DO @SET %~1.%%A

	:: Clean up
	(SET GetFInfo.WMICName=)
	(SET GetFInfo.WMICCommand=)
	
EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

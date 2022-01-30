@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

SET "_VERBOSE=0"
IF /I "%1"=="/VERBOSE" ( SET "_VERBOSE=1" & SHIFT )
IF /I "%2"=="/VERBOSE" ( SET "_VERBOSE=1" )

PUSHD %1


SET /A "_TotalSize=0"
ECHO.
ECHO Files on '%CD%'
ECHO.
ECHO Attributes  ^| Date and time    ^|            Size ^| File name
ECHO ------------+------------------+-----------------+-------------------^>
FOR /F "tokens=*" %%f IN ('DIR /B') DO (
	SET "_Attributes=%%~af"
	SET "_DateTime=%%~tf"
	IF "!_Attributes:~0,1!"=="d" (
		SET "_Size=               "
	) ELSE (
		SET /A _TotalSize=!_TotalSize!+%%~zf
		SET "_Size=               %%~zf"
		SET "_Size=!_Size:~-15!"
	)
	SET "_Filename=%%~nxf"
	ECHO !_Attributes! ^| !_DateTime! ^| !_Size! ^| !_Filename!
)
SET "_TotalSize=                    %_TotalSize%"
ECHO ------------+------------------+-----------------+-------------------^>
ECHO                           TOTAL: %_TotalSize:~-15%

IF "%_VERBOSE%"=="1" (
	ECHO.
	ECHO d---------- DIRECTORY
	ECHO -r--------- READONLY
	ECHO --a-------- ARCHIVE
	ECHO ---h------- HIDDEN
	ECHO ----s------ SYSTEM
	ECHO -----c----- COMPRESSED
	ECHO ------o---- OFFLINE
	ECHO -------t--- TEMPORARY
	ECHO --------l-- REPARSE_POINT
	ECHO ----------- {no in use}
	ECHO ----------- {no in use}
)







ECHO.

POPD

ENDLOCAL

::   d-------l-- | 2020-05-26 16:25 |         4096 | C:\Users\FERNAJL\OneDrive - Abbott\__ON_GOING\2019-01 Audit


:: 355.386.437.632

:: Attribute                    Expansion 
:: FILE_ATTRIBUTE_DIRECTORY     d-------- 
:: FILE_ATTRIBUTE_READONLY      -r------- 
:: FILE_ATTRIBUTE_ARCHIVE       --a------ 
:: FILE_ATTRIBUTE_HIDDEN        ---h----- 
:: FILE_ATTRIBUTE_SYSTEM        ----s---- 
:: FILE_ATTRIBUTE_COMPRESSED    -----c--- 
:: FILE_ATTRIBUTE_OFFLINE       ------o-- 
:: FILE_ATTRIBUTE_TEMPORARY     -------t- 
:: FILE_ATTRIBUTE_REPARSE_POINT --------l
:: FILE_ATTRIBUTE_NORMAL        --------- 
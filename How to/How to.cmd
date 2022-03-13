:: Load variables from '.ini' file. Variables name will star with a prefix
FOR /F "TOKENS=*" %%a IN ('TYPE "MyIniFile.ini"') DO SET MyPrefix_%%a

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Set DEBUG to ON if /DEBUG is present in the parameters
ECHO " %* " | find.exe /I " /DEBUG " > NUL && SET DEBUG=1==1 || SET DEBUG=1==0

REM DEBUG EXAMPLE
IF %DEBUG% ECHO This line is displayed if DEBUG is ON

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: For each file/folder
FOR /f "tokens=*" %%f IN ('DIR %~dp0*.* /S /B') DO (
	ECHO Fully qualified path name: [%%~ff]
	ECHO Drive letter:              [%%~df]
	ECHO Path:                      [%%~pf]
	ECHO File name:                 [%%~nf]
	ECHO File extension:            [%%~xf]
	ECHO Path with short names:     [%%~sf]
	ECHO Attributes:                [%%~af]
	ECHO Date/time:                 [%%~tf]
	ECHO Size:                      [%%~zf]
	ECHO.
)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
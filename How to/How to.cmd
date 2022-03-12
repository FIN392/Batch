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

:: Create a CSV test file
TYPE NUL > %TEMP%\~.tmp
ECHO."qwe qwe",1234,   "qwe">> %TEMP%\~.tmp
ECHO.asd   asd,123456, "asd">> %TEMP%\~.tmp
ECHO."zxc zxc",0xFF,   "zxc">> %TEMP%\~.tmp

:: For each line in CSV file
FOR /F "tokens=1-30 delims=," %%a IN ('TYPE "%TEMP%\~.tmp"') DO (

	SET "strField01=%%~a"
	SET /A "intField02=%%~b"
	SET "strField03=%%~c"
	
	ECHO Fields: [!strField01!] [!intField02!] [!strField03!]
	ECHO.

)

:: Delete the CSV test file
DEL "%TEMP%\~.tmp" > NUL 2>&1

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
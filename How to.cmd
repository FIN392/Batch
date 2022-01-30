:: Set variable 'LocalDateTime' to current date and time in format 'yyyymmddhhmmss.ffffff+mmm'
FOR /F "TOKENS=*" %%a IN ('WMIC OS GET LocalDateTime /VALUE ^| FIND "="') DO @SET "%%a"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	
:: Close if already running
SET "TITLE=My command window title"
TITLE Checking if already running...
TASKLIST /V | FINDSTR /C:"%TITLE%"
IF NOT ERRORLEVEL 1 (ECHO '%TITLE%' is already running & EXIT /B 1)
TITLE "%TITLE%"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Load variables from '.ini' file. Variables name will star with a prefix
FOR /F "TOKENS=*" %%a IN ('TYPE "MyIniFile.ini"') DO SET MyPrefix_%%a

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Delete files with more than 30 days
FORFILES /M *.* /P "{Folder}" /S /D -30 /C "CMD /C ECHO DEL @path"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Set variable 'LastBootUpTime' to last boot time in format 'yyyymmddhhmmss.ffffff+mmm'
FOR /F "TOKENS=*" %%a IN ('WMIC OS GET LastBootUpTime /VALUE ^| FIND "="') DO @SET "%%a"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Get WMIC information

:: Get info for C: disk 
FOR /F "tokens=*" %%A IN ('WMIC LogicalDisk Where "DeviceID='C:'" Get /Format:list ^| FIND "="') DO @SET _LogicalDisk.C.%%A
SET _LogicalDisk.C.

:: Get BIOS info
FOR /F "tokens=*" %%A IN ('WMIC BIOS Get /Format:list ^| FIND "="') DO @SET _BIOS.%%A
SET _BIOS.

:: Get COMPUTERSYSTEM info
FOR /F "tokens=*" %%A IN ('WMIC COMPUTERSYSTEM Get /Format:list ^| FIND "="') DO @SET _COMPUTERSYSTEM.%%A
SET _COMPUTERSYSTEM.

:: Get CPU info
FOR /F "tokens=*" %%A IN ('WMIC CPU Get /Format:list ^| FIND "="') DO @SET _CPU.%%A
SET _CPU.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Set DEBUG to ON if /DEBUG is present in the parameters
ECHO " %* " | find.exe /I " /DEBUG " > NUL && SET DEBUG=1==1 || SET DEBUG=1==0

REM DEBUG EXAMPLE
IF %DEBUG% ECHO This line is displayed if DEBUG is ON

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Delete all files in a folder except the 3 newest ones
FOR /F "TOKENS=* SKIP=3" %%f IN ('DIR "q w  e" /S /B /O-D') DO @echo DEL "%%f"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Say Hello! (in your local language)
SET "strSay=Hola, ¿como estas?"
START "" mshta "javascript:code(close((v=new ActiveXObject('SAPI.SpVoice')).GetVoices()&&v.Speak('%strSay%')))"

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

:: Look for path name longer than 255 characters
FOR /F "Tokens=*" %%a IN ('DIR C:\ /B /S /A') DO (
	SET PathName=%%a
	IF NIT "!PathName:~255,1!"=="" ECHO Extra long name: "%%a"
)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: View % of progress
SET /A "intTotalElements=23"
FOR /L %%i IN (0, 1, %intTotalElements%) DO (
	SET /A "intPercentage=(%%i*100)/%intTotalElements%"
    ECHO|SET /P="%%i of %intTotalElements% (!intPercentage!%%)"
	
	REM *
	REM * YOUR WORK GOES HERE
	REM *
	
    TIMEOUT /T 1 > NUL 2>&1
)
ECHO.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




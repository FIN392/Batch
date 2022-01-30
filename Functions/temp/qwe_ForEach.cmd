@echo off
setlocal enabledelayedexpansion


:: For each file/folder
for /f "tokens=*" %%f in ('dir C:\Abbott\a*.* /s /b') do (
	echo Fully qualified path name: [%%~ff]
	echo Drive letter:              [%%~df]
	echo Path:                      [%%~pf]
	echo File name:                 [%%~nf]
	echo File extension:            [%%~xf]
	echo Path with short names:     [%%~sf]
	echo Attributes:                [%%~af]
	echo Date/time:                 [%%~tf]
	echo Size:                      [%%~zf]
	echo.
)


:: Create a CSV test file
type nul > %temp%\~.tmp
echo."qwe qwe",1234,   "qwe">> %temp%\~.tmp
echo.asd   asd,123456, "asd">> %temp%\~.tmp
echo."zxc zxc",0xFF,   "zxc">> %temp%\~.tmp

:: For each line in CSV file
for /f "tokens=1-30 delims=," %%a in ('type "%temp%\~.tmp"') do (

	set "strField01=%%~a"
	set /a "intField02=%%~b"
	set "strField03=%%~c"
	
	echo Fields: [!strField01!] [!intField02!] [!strField03!]
	echo.

)

:: Delete the CSV test file
del "%temp%\~.tmp" > nul 2>&1


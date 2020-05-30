:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::! Syntax:
::!     DelayedStartup.cmd
::!
::! Description:
::!     xxx.
::!
::! Requirements:
::!     (none)
::
::  Author: fin392@gmail.com
::
::  License: https://opensource.org/licenses/MIT
::
::  Additional information: https://github.com/FIN392/Batch
::
::  Change Log
::  ----------
::  2020/05/29 - fin392@gmail.com - Initial version
::  2525/01/01 - fin392@gmail.com - Future version:
::                 - New features added.
::                 - Changes in existing functionality.
::                 - Soon-to-be removed features.
::                 - Now removed features.
::                 - Any bug fixes.
::                 - Security vulnerabilities.
::  
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

:: /?
ECHO " %* " | find " /? " > NUL && (
	ECHO. & FOR /F "tokens=1* delims=!" %%A IN ('findstr /B /C:"::!" "%~f0"') DO (ECHO.   %%B)
	GOTO :End_of_script
)


	REM CALL :LaunchProgram SKYPE   "C:\Program Files (x86)\Microsoft Office\root\Office16\lync.exe" .                                                  10
	REM CALL :LaunchProgram EQUINOX "C:\Program Files (x86)\Avaya\Avaya Equinox\Avaya Equinox.exe"   "C:\Program Files (x86)\Avaya\Avaya Equinox\"      10
	REM CALL :LaunchProgram WEBEX   "C:\Program Files (x86)\Webex\Webex\Applications\ptoneclk.exe"   "C:\Program Files (x86)\Webex\Webex\Applications\" 10
	REM CALL :LaunchProgram TEAMS   "C:\Users\FERNAJL\AppData\Local\Microsoft\Teams\Update.exe" --processStart "Teams.exe" "C:\Users\FERNAJL\AppData\Local\Microsoft\Teams" 10
	REM CALL :LaunchProgram ONEDRIVE "C:\Users\FERNAJL\AppData\Local\Microsoft\OneDrive\OneDrive.exe" . 10

	REM *
	REM * Calling a function
	REM *
	CALL :LaunchProgram TEST 2 3  4 || ECHO Function failed
	SET "_Error=%ERRORLEVEL%"
	ECHO Returned error=%_Error%
	ECHO.



:End_of_script
ENDLOCAL & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: LaunchProgram {Aplication Name} {Program} {Path} {TimeOut}
::
:: xxx.
::
:LaunchProgram
SETLOCAL & SET "_Error=0"

	ECHO %1
	PUSHD %3
echo %2
	POPD
	TIMEOUT /T %4

	SET "_Error=0"

ENDLOCAL & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::
:: EOF
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
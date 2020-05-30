:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::! Syntax: DelayedStartup.cmd
::!
::! Description: Launch several program waiting some seconds before each.
::!
::! Requirements:(none)
::!
::! Author: jose.fernandez@abbott.com
::
::  Change Log
::  ----------
::  2020/05/29 - jose.fernandez@abbott.com - Initial version
::  2020/05/29 - jose.fernandez@abbott.com - Version 1.0
:: 		- New features added: none.
:: 		- Changes in existing functionality: none.
:: 		- Soon-to-be removed features: none.
:: 		- Now removed features: none.
:: 		- Any bug fixes: none.
:: 		- Security vulnerabilities: none.
::  
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

:: /?
ECHO " %* " | find " /? " > NUL && (
	ECHO. & FOR /F "tokens=1* delims=!" %%A IN ('findstr /B /C:"::!" "%~f0"') DO (ECHO.   %%B)
	GOTO :End_of_script
)

	MODE CON COLS=120 LINES=10
	COLOR 0A
	TITLE %~n0

	CALL :LaunchProgram 10 SKYPE    .                                                  "C:\Program Files (x86)\Microsoft Office\root\Office16\lync.exe"
	CALL :LaunchProgram 10 EQUINOX  "C:\Program Files (x86)\Avaya\Avaya Equinox\"      "C:\Program Files (x86)\Avaya\Avaya Equinox\Avaya Equinox.exe"
	CALL :LaunchProgram 10 WEBEX    "C:\Program Files (x86)\Webex\Webex\Applications\" "C:\Program Files (x86)\Webex\Webex\Applications\ptoneclk.exe"
	CALL :LaunchProgram 10 TEAMS    "C:\Users\FERNAJL\AppData\Local\Microsoft\Teams"   "C:\Users\FERNAJL\AppData\Local\Microsoft\Teams\Update.exe" --processStart "Teams.exe"
	CALL :LaunchProgram 10 ONEDRIVE .                                                  "C:\Users\FERNAJL\AppData\Local\Microsoft\OneDrive\OneDrive.exe"

:End_of_script
ENDLOCAL & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: LaunchProgram {TimeOut} {Title} {Path} {Program} [{Parameters}...]
::
:: Wait some seconds and then launch the program.
:: 		{TimeOut}:                   Time in seeconds to wait
:: 		{Title}:                     Title of program to launch
:: 		{Path}:                      Path where start the program
:: 		{Program} [{Parameters}...]: Program and parameters
::
:LaunchProgram
SETLOCAL & SET "_Error=0"

	SET _TimeOut=%1
	SET _Title=%2
	SET _Path=%3
	SET _ProgramParam=
	:LoopParam
		SET _ProgramParam=%_ProgramParam% %4
		SHIFT
	IF NOT '%4'=='' GOTO LoopParam

	TIMEOUT /T %_TimeOut%
	ECHO Launching %_Title%...
	PUSHD %_Path%
	START "%_Title%" %_ProgramParam%
	POPD

	SET "_Error=0"

ENDLOCAL & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::
:: EOF
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
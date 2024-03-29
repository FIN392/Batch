:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::?
::? Here should go a detailed description of what the script does. The length
::? of the line must be 80 characters.
::?
::? Syntax:
::?
::?   Script_Template.cmd [/ON | /OFF] [/X] [/F:{filename}]
::?
::?     [ /ON | /OFF ]   Explanation of this parameter. The length of the line
::?                      must be 80 characters.
::?     [/X]             Explanation of this parameter.
::?     [/F:{filename}]  Explanation of this parameter.
::?
::? Requirements:
::?
::?   '(none)' or the list of required files, configurations (e.g., registry
::?   values) or systems (e.g., Internet access).
:: 
::  Author: fin392@gmail.com
:: 
::  License: https://opensource.org/licenses/MIT
:: 
::  Additional information: https://github.com/FIN392/Batch
:: 
::  Change Log
::  ----------
::  2020/04/13 - fin392@gmail.com - Initial version
::  2525/01/01 - fin392@gmail.com - Here should go a long description of the
::                change done, keeping de line length below 80 and including:
::                 - New features added.
::                 - Changes in existing functionality. 	
::                 - Soon-to-be removed features.
::                 - Now removed features.
::                 - Any bug fixes.
::                 - Security vulnerabilities.
::  
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

:: If /? parameter is present, display help lines (starting by '::?') 
ECHO " %* " | FIND " /? " > NUL && ( ( FOR /F "tokens=1* delims=?" %%A IN ('FINDSTR /B /C:"::?" "%~f0"') DO (ECHO.  %%B) ) & GOTO :THE_END )

:: Start debugging if parameter /DEBUG
ECHO " %* " | find.exe /I " /DEBUG " > NUL && (ECHO ON & PROMPT $E[36m----------------------------------------$S$D$S$T$_$P$G$E[0m)

	REM *
	REM * YOUR CODE GOES HERE...
	REM *

	REM Calling a function that return a value
	CALL :FunctionTemplate _Value Param1 Param2 Param3
	ECHO Returned error level=%ERRORLEVEL%
	ECHO Returned value=%_Value%

	REM *
	REM * YOUR CODE GOES HERE...
	REM *

:THE_END
PROMPT & ENDLOCAL & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Here should go a long description of how the script works and the
:: explanation of each of the parameters. The line length should be adjusted to
:: 80 characters.
::
:FunctionTemplate ReturnVar Param1 Param2 Param3
SETLOCAL & SET "_Error=0"

	REM *
	REM * YOUR CODE GOES HERE...
	REM *

	REM * Set _Return and _Error variables with proper values
	SET _Return=xxx
	SET _Error=999

:End_FunctionTemplate
ENDLOCAL & SET "%~1=%_Return%" & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: EOF ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

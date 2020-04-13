:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::! Syntax:
::!     Script_Template.cmd [/ON | /OFF] [/X] [/F:{filename}]
::!
::! Description:
::!     Here should go a long description of how the script works and the
::!     explanation of each of the parameters. The line length should be
::!     adjusted to 80 characters.
::!
::! Requirements:
::!     '(none)' or the list of required files, configurations (e.g., registry
::!     values) or systems (e.g., Internet access).
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
::  2525/01/01 - fin392@gmail.com - Here should go a long description of change
::               done, keeping de line length below 80 and including:
::                 - New features added.
::                 - Changes in existing functionality.
::                 - Soon-to-be removed features.
::                 - Now removed features.
::                 - Any bug fixes.
::                 - Security vulnerabilities.
::  
:Main
@ECHO OFF
SETLOCAL
SET Err=0

:: /?
ECHO " %* " | find " /? " > NUL && (
	ECHO. & FOR /F "tokens=1* delims=!" %%A IN ('findstr /B /C:"::!" "%~f0"') DO (ECHO.   %%B)
	GOTO :End_of_script
)




	REM *
	REM * YOU CODE IS HERE...
	REM *

	REM *
	REM * Error handling
	REM *
 	REM TYPE "ThisFileDoNotExist.HopeSo" 2> NUL || (
	REM 	 ECHO [91mERROR %ERRORLEVEL%: Boom!!![0m
	REM 	 GOTO :End_of_script
	REM )

	REM *
	REM * Calling a function
	REM *
	CALL :FunctionName %1 %2 %3 %4 
	ECHO ERRORLEVEL=%ERRORLEVEL%

	echo %QWE%


:End_of_script
TITLE
ENDLOCAL & EXIT /B %Err%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: FunctionName [/ON | /OFF] [/X] [/F:{filename}]
::
:: Here should go a long description of how the script works and the
:: explanation of each of the parameters. The line length should be adjusted to
:: 80 characters.
::
:FunctionName
SETLOCAL

	REM *
	REM * YOU CODE IS HERE...
	REM *
	SET /A _Value=%2 + %3
	REM *

SET Err=999


ENDLOCAL & SET %1=%_Value%& EXIT /B %Err%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::
:: EOF
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

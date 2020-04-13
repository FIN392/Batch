:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::@ Syntax:
::@     Script_Template.cmd [ /ON ^| /OFF ] [/X] [/F:{filename}]
::@
::@ Description:
::@     Here should go a long description of how the script works and the
::@     explanation of each of the parameters. The line length should be
::@     adjusted to 80 characters.
::@
::@ Requirements:
::@     '(none)' or the list of required files, configurations (e.g., registry
::@     values) or systems (e.g., Internet access).
::
:: Author: fin392@gmail.com
::
:: License: https://opensource.org/licenses/MIT
::
:: Additional information: https://github.com/FIN392/Batch
::
:: Change Log
:: ----------
:: 2020/04/13 - fin392@gmail.com - Initial version
:: 2525/01/01 - fin392@gmail.com - Here should go a long description of change
::              done, keeping de line length below 80 and including:
::                - New features added.
::                - Changes in existing functionality.
::                - Soon-to-be removed features.
::                - Now removed features.
::                - Any bug fixes.
::                - Security vulnerabilities.
::  
:Main
@ECHO OFF & SETLOCAL

:: /?
ECHO " %* " | FIND " /? " > NUL && ( ECHO. & FOR /F "tokens=1* delims=@" %%A IN ('findstr /B /C:"::@" "%~f0"') DO (ECHO.   %%B)
	GOTO :End_of_script )



	ECHO *
	ECHO * YOU CODE IS HERE...
	ECHO *

	ECHO *
	ECHO * Error handling
	ECHO *
 	TYPE "ThisFileDoNotExist.HopeSo" 2> NUL || (ECHO [91mERROR 999: Boom!!![0m&EXIT /B 999)



:: End of script
:End_of_script
ENDLOCAL & EXIT /B 0
::
:: EOF
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

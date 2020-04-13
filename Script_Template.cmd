:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Syntax:
::     Script_Template.cmd [ /ON ^| /OFF ] [/X] [/F:{filename}]
::
:: Description:
::     Here should go a long description of how the script works and the
::     explanation of each of the parameters. The line length should be
::     adjusted to 80 characters.
::
:: Requirements:
::     '(none)' or the list of required files, configurations (e.g., registry
::     values) or systems (e.g., Internet access).
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
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Main
@ECHO OFF
SETLOCAL
PUSHD %~dp0 > NUL 2> NUL

:: Set author and version
SET _Author=FIN392 (fin392@gmail.com)
SET _Version=0.20.04a

:: Set Error to 0
SET _Err.Num=0
SET _Err.Description=Successfully finished

:: /? -> Syntax
ECHO " %* " | FIND " /? " > NUL && GOTO Syntax







:: End of script
:End_of_script
POPD
COLOR
ENDLOCAL
EXIT /B %_Err.Num%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Syntax
::
:Syntax
	ECHO Put a brief description here.
	ECHO.
	ECHO %~n0 [ /ON ^| /OFF ] [/X] [/F:{filename}]
	ECHO.
	ECHO Here should go a long description of how the script works and the explanation of each of the parameters.
	ECHO.
	ECHO Written by %_Author%. Version %_Version%
EXIT /B %_Err.Num%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Error control
::
:ErrorControl
	ECHO [91mERROR %_Err.Num%: %_Err.Description%[0m
EXIT /B %_Err.Num%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::
:: EOF
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

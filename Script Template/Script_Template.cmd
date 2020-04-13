:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Script Template
::
@ECHO OFF
SETLOCAL
PUSHD %~dp0 > NUL 2> NUL

:: Set author and version
SET _Author=FIN392 (fin392@gmail.com)
SET _Version=0.20.04a

:: Set Error to 0
SET _Err.Num=0
SET _Err.Description=.

:: /? -> Syntax
ECHO " %* " | FIND " /? " > NUL && GOTO Syntax

:: Load parameters in _Arg. variables
CALL :GetArgs %*



	:: List or args
	ECHO.
	ECHO Args:
	SET _Arg.

	:: Write to output file
	ECHO Console message...
	>> "%_OutputFile%" ECHO ###############################################################################
	>> "%_OutputFile%" ECHO #
	>> "%_OutputFile%" ECHO #  Script:  %~n0
	>> "%_OutputFile%" ECHO #
	>> "%_OutputFile%" ECHO #  Author:  %_Author%
	>> "%_OutputFile%" ECHO #  Version: %_Version%
	>> "%_OutputFile%" ECHO #
	>> "%_OutputFile%" ECHO #  User:     %USERDOMAIN%\%USERNAME%
	>> "%_OutputFile%" ECHO #  Computer: %COMPUTERNAME%
	>> "%_OutputFile%" ECHO #  Date:     %DATE%
	>> "%_OutputFile%" ECHO #  Time:     %TIME%
	>> "%_OutputFile%" ECHO # 
	>> "%_OutputFile%" ECHO ###############################################################################
	>> "%_OutputFile%" ECHO.
	ECHO.



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
	ECHO Brief description.
	ECHO.
	ECHO %~n0 [ /ON ^| /OFF ] [/X] [/F:{filename}]
	ECHO.
	ECHO Long description and arguments explanation.
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

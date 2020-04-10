:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: ScriptTemplate
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
CALL :LoadArgs %*

ECHO.
SET _Arg.

:: Get a GUID
CALL :GetGIUD _MyGUID

ECHO.
SET _MyGUID

:: Get local date and time
CALL :GetLocalDateTime _MyDateTime

ECHO.
SET _MyDateTime

:: Create a temp files
CALL :CreateTempFile _MyTempFile01
CALL :CreateTempFile _MyTempFile02
CALL :CreateTempFile _MyTempFile03
ECHO temporal text >> "%_MyTempFile01%"
ECHO temporal text >> "%_MyTempFile02%"
ECHO temporal text >> "%_MyTempFile03%"

ECHO.
DIR %TEMP%\%~n0_*.tmp

:: Delete temp files
DEL %TEMP%\%~n0_*.tmp > NUL 2> NUL


goto End_of_script


:: Create output file - DateTime
FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| FIND "="') DO SET _%%t
SET _OutputFile=%~dpn0_%_LocalDateTime:~0,14%.txt
TYPE NUL > "%_OutputFile%" || ( SET _Err.Description=Output file can't be created & GOTO ErrorControl )





:: Write to output file
ECHO Console message...
>> "%_OutputFile%" ECHO ###############################################################################
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

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Load parameters into _Arg. variables
::
:LoadArgs

	:: Clean _Arg variables
	SET _Arg.=.
	FOR /F "DELIMS==" %%v IN ('SET _Arg.') DO  SET %%v=

	:: Loop for each argument
	SET _i=1
	FOR %%v IN (%*) DO CALL :LoadArgs_ForEachArg %%v
	GOTO LoadArgs_EndForEachArg
	:LoadArgs_ForEachArg


		SET _TmpArg=%1
		SET _TmpSwitch=%_TmpArg:~1%
		
		:: If parameter is like '/xxx:yyy', create '_Arg.xxx=yyy'
		ECHO %_TmpArg%|findstr /R "\/..*:..*" > NUL
		IF NOT ERRORLEVEL 1 SET _Arg.%_TmpSwitch::==%& GOTO LoadArgs_NextArg

		:: If parameter is like '/xxx', create '_Arg.xxx=ON'
		ECHO %_TmpArg%|findstr /R "\/..*" > NUL
		IF NOT ERRORLEVEL 1 SET _Arg.%_TmpSwitch%=ON& GOTO LoadArgs_NextArg
		
		:: Otherwise, create _Arg.{n}={parameter}
		SET _Arg.%_i%=%_TmpArg%
		SET /A _i=%_i%+1

		:LoadArgs_NextArg
	GOTO :EOF
	:LoadArgs_EndForEachArg

	SET _i=
	SET _TmpArg=
	SET _TmpSwitch=
	
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyymmddhhmmss.ffffff+mmm'
::
:GetLocalDateTime
SETLOCAL

	FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| FIND "="') DO SET _%%t

ENDLOCAL & SET %1=%_LocalDateTime%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return a GUID with format 'HHHHHHH-HHHH-HHHH-HHHH-HHHHHHHHHHHH'
::
:GetGIUD
SETLOCAL

	SET _HEX=
	SET _i=0
	:GetGIUD_Loop
		SET /A _DEC=(%RANDOM%*256/32768)+0
		CALL CMD /C EXIT /B %_DEC%
		SET _HEX=%_HEX%%=exitcode:~-2%
		SET /A _i=%_i%+1
	IF %_i% NEQ 16 GOTO :GetGIUD_Loop
	SET _HEX=%_HEX:~0,8%-%_HEX:~8,4%-%_HEX:~12,4%-%_HEX:~16,4%-%_HEX:~20,12%
	
ENDLOCAL & SET %1=%_HEX%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Create a empty temp file on %TEMP% with format '{ScriptName}_yyyymmddhhmmss.tmp'
:: and return the file name
::
:CreateTempFile
SETLOCAL

	:CreateTempFile_Loop
		FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET _%%t
		SET _Tempfile=%TEMP%\%~n0_%_LocalDateTime:~0,14%.tmp
	IF EXIST "%_TempFile%" GOTO CreateTempFile_Loop
	TYPE NUL > "%_TempFile%" || ( SET _Err.Num=2&_Err.Description=temp file '%_Tempfile%' can't be created & GOTO ErrorControl )
	
ENDLOCAL & SET %1=%_Tempfile%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::
:: EOF
::

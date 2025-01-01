:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Clean a log file keeping only the last 'n' lines.
::
:: NOTE: It is recommended to call this function at the beginning of the main
:: process since, if done at the end, lines created during the process could
:: be deleted.
::
:: Sintax: CleanLog {LogFile} [{Lines}]
::     {LogFile}          : Name of the log file to clean.
::     {Lines} [Optional] : Number of lines to keep. If this parameter is not
::                          specified, the log is completely deleted.
::
:: Requirements: (none)
::
:: Example:
::
::     :: Set here your functions folder ending in '\'
::     @ECHO OFF & SET "Func_=CALL X:\Batch\Functions\"
::
::     :: Create log
::     TYPE NUL > "%TEMP%\~LogFile.log"
::     FOR /L %%i in (1,1,10) DO (
::         ECHO %DATE% %TIME% Log entry #%%i >> "%TEMP%\~LogFile.log"
::     )
::     ECHO --- Before
::     TYPE "%TEMP%\~LogFile.log"
::     :: Clean log keeping last 2 lines
::     %Func_%CleanLog "%TEMP%\~LogFile.log" 2
::     ECHO --- After
::     TYPE "%TEMP%\~LogFile.log"
::     :: Remove logfile
::     DEL "%TEMP%\~LogFile.log" > NUL 2> NUL
::     EXIT /B 0
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:CleanLog {LogFile} [{Lines}]
SETLOCAL

	IF "%~2"=="" (DEL "%~1" > NUL 2> NUL) & GOTO :ENDIF

		FOR /F "delims=: tokens=1" %%l IN ('FINDSTR /C:" " /N "%~1"') DO SET Lines=%%l
		SET /A "Lines-=%~2"
		IF %Lines% LSS 2 GOTO :ENDIF
			FOR /F "skip=%Lines% tokens=*" %%l IN ('TYPE "%~1"') DO ( ECHO %%l>> "%~1.bak" )
			COPY "%~1.bak" "%~1" > NUL 2> NUL
			DEL "%~1.bak" > NUL 2> NUL

	:ENDIF
	
ENDLOCAL & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

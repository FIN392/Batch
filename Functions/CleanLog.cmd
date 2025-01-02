REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Clean a log file keeping only the last 'n' lines.
::
:: NOTE: It is recommended to call this function at the beginning of the main
:: process since if it is done at the end, lines generated during execution can
:: be deleted.
::
:: Syntax: CleanLog <LogFile> [<Lines>]
::     <LogFile> : File to clean. 
::     <Lines>   : [Optional] Number of lines to keep. If no value is specified
::                 the file will be deleted entirely.
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:CleanLog <LogFile> [<Lines>]
SETLOCAL

	IF "%~2"=="" (DEL "%~1" > NUL 2> NUL) & GOTO :ENDIF

		FOR /F "delims=[] tokens=1" %%l IN ('FIND " " /N "%~1"') DO SET Lines=%%l
		SET /A "Lines-=%~2"
		IF %Lines% LSS 2 GOTO :ENDIF
			FOR /F "skip=%Lines% tokens=*" %%l IN ('TYPE "%~1"') DO ( ECHO %%l>> "%~1.bak" )
			COPY "%~1.bak" "%~1" > NUL 2> NUL
			DEL "%~1.bak" > NUL 2> NUL

	:ENDIF
	
ENDLOCAL & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyLogFile=%TEMP%\My Log File.txt"

:: Create a log with 10 lines
TYPE NUL > "%MyLogFile%"
FOR /L %%i IN (1,1,10) DO ECHO %DATE% %TIME% Log entry #%%i >> "%MyLogFile%"

ECHO --- Before -----------------------------
TYPE "%MyLogFile%"

CALL %Func_%CleanLog "%MyLogFile%" 2

ECHO --- After ------------------------------
TYPE "%MyLogFile%"

DEL "%MyLogFile%" > NUL 2> NUL

EXIT /B 0

:: Results:
::
:: --- Before -----------------------------
:: 2025-01-02 23:37:50,74 Log entry #1 
:: 2025-01-02 23:37:50,74 Log entry #2
:: 2025-01-02 23:37:50,74 Log entry #3
:: 2025-01-02 23:37:50,74 Log entry #4
:: 2025-01-02 23:37:50,74 Log entry #5
:: 2025-01-02 23:37:50,74 Log entry #6
:: 2025-01-02 23:37:50,74 Log entry #7
:: 2025-01-02 23:37:50,74 Log entry #8
:: 2025-01-02 23:37:50,74 Log entry #9
:: 2025-01-02 23:37:50,74 Log entry #10
:: --- After ------------------------------
:: 2025-01-02 23:37:50,74 Log entry #9  
:: 2025-01-02 23:37:50,74 Log entry #10
::
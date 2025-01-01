REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Write a message in a logfile (and optionally in console).
::
:: Syntax: WriteLog <LogFile> { DEBUG | INFO | WARN | ERROR | FATAL } <string> [/CON]
::     <LogFile>       : File where the entry will be added. 
::     DEBUG | INFO | WARN | ERROR | FATAL : Log entry severity. Any word of 5 or
::                       less characters, but these are the most common ones.
::     <string>        : Text for the log entry.
::     /CON            : [Optional] Number of lines to keep. 
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:WriteLog <LogFile> { DEBUG | INFO | WARN | ERROR | FATAL } <string> [/CON]
SETLOCAL

	FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "Timestamp=%%a %%b"
	SET "Severity=%~2     "
	SET "Message=%~3"

	>> "%~1" ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message%
	IF /I "%~4"=="/CON" ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message%

ENDLOCAL & EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

SET "MyLogFile=%TEMP%\My Log File.txt"

:: Write lines to log
CALL %Func_%WriteLog "%MyLogFile%" FATAL "Fatal entry also displayed on console" /CON
CALL %Func_%WriteLog "%MyLogFile%" ERROR "Just a error line also displayed on console" /CON
CALL %Func_%WriteLog "%MyLogFile%" WARN  "WARNING!! The process is working" /CON
CALL %Func_%WriteLog "%MyLogFile%" INFO  "This is just for your information"
CALL %Func_%WriteLog "%MyLogFile%" DEBUG "Debugging is the process of identifying, analyzing, and resolving bugs"

:: Display and delete log
TYPE "%MyLogFile%"
DEL "%MyLogFile%" > NUL 2> NUL

EXIT /B 0

:: Results:
::
:: 2025/01/01 19:08:46 | FATAL | Fatal entry also displayed on console
:: 2025/01/01 19:08:46 | ERROR | Just a error line also displayed on console
:: 2025/01/01 19:08:46 | WARN  | WARNING!! The process is working
:: 2025/01/01 19:08:46 | FATAL | Fatal entry also displayed on console
:: 2025/01/01 19:08:46 | ERROR | Just a error line also displayed on console
:: 2025/01/01 19:08:46 | WARN  | WARNING!! The process is working
:: 2025/01/01 19:08:46 | INFO  | This is just for your information
:: 2025/01/01 19:08:46 | DEBUG | Debugging is the process of identifying, analyzing, and resolving bugs
::
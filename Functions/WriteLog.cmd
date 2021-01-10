:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	SET "MyLogID="%TEMP%\My Log File.txt""
	SET "MyLogID=CON"

	:: Write lines to log
	CALL :WriteLog %MyLogID% FATAL "Log entry text"
	CALL :WriteLog %MyLogID% ERROR "Just another line to see all the possible Severities"
	CALL :WriteLog %MyLogID% WARN  "Just another line to see all the possible Severities"
	CALL :WriteLog %MyLogID% INFO  "Just another line to see all the possible Severities"
	CALL :WriteLog %MyLogID% DEBUG "Just another line to see all the possible Severities"

:End_of_script
ENDLOCAL & EXIT /B %_Error%


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Write a message in a logfile or console (CON).
::
:WriteLog {LogFile} {DEBUG | INFO | WARN | ERROR | FATAL} {string}
SETLOCAL & SET "_Error=0"

	FOR /F "tokens=*" %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET "%%t"

	SET "Timestamp=%LocalDateTime:~0,4%-%LocalDateTime:~4,2%-%LocalDateTime:~6,2% %LocalDateTime:~8,2%:%LocalDateTime:~10,2%:%LocalDateTime:~12,2%.%LocalDateTime:~15,3%"
	SET "Severity=%~2     "
	SET "Message=%~3"

	ECHO %Timestamp% ^| %Severity:~0,5% ^| %Message% >> %1

:End_WriteLog
ENDLOCAL & EXIT /B %_Error%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

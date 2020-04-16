: Main
@ECHO OFF
SETLOCAL


ECHO Normal message

CALL :Error 11 "this is the error message"
ECHO ERRORLEVEL=%ERRORLEVEL%

CALL :TEST

CALL :Error 12 "Texto del "error" fatal" /FATAL
ECHO ERRORLEVEL=%ERRORLEVEL%

ECHO NEVER DISPLAYED!!!

	
ENDLOCAL
EXIT /B 0



:TEST

	CALL :Error 21 "just another error"
	ECHO ERRORLEVEL=%ERRORLEVEL%

EXIT /B 0



:Error
SETLOCAL

	FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET Error.%%t
	SET Error.TimeStamp=%Error.LocalDateTime:~0,4%-%Error.LocalDateTime:~4,2%-%Error.LocalDateTime:~6,2% %Error.LocalDateTime:~8,2%:%Error.LocalDateTime:~10,2%:%Error.LocalDateTime:~12,2%.%Error.LocalDateTime:~15,3% (UCT%Error.LocalDateTime:~21%)

	ECHO [31m%Error.TimeStamp% Error #%~1%: %~2[0m 1>&2

	IF /I "%~3%"=="/FATAL" (
		ECHO [31mFatal error. Script will be terminated![0m 1>&2
		pause
		ENDLOCAL & EXIT %~1
	)

ENDLOCAL & EXIT /B %~1


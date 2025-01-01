:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Clean a log file keeping only the last 'n' lines.
::
:: NOTE: It is recommended to call this function at the beginning of the main
:: process since if it is done at the end, lines generated during execution can
:: be deleted.
::
:: {LogFile}          : Name of the log file to clean.
:: {Lines} [Optional] : Number of lines to keep. 
::
:: Sintax: ...
::     {Return_variable} : Variable where the result will be returned.
::
:: Requirements: (none)
::
:: Example:
::
::     :: Set here your functions folder ending in '\'
::     @ECHO OFF & SET "Func_=CALL X:\Batch\Functions\"
::
::     ...
::
::     EXIT /B 0
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:CleanLog {LogFile} [{Lines}]
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

	
:: Set variable 'LocalDateTime' to current date and time in format 'yyyymmddhhmmss.ffffff+mmm'
FOR /F "TOKENS=*" %%a IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO @SET "%%a"

	
:: Close if already running
SET TITLE={Batch title}
TITLE Checking if already running...
tasklist /V | findstr /C:"%TITLE%"
IF NOT ERRORLEVEL 1 (ECHO '%TITLE%' is already running & EXIT /B 1)
TITLE "%TITLE%"


:: Load variables from '.ini' file. Variables name will star with a prefix
FOR /F "TOKENS=*" %%a IN ('TYPE "{.ini File}"') DO SET {Variables prefix}%%a


:: Delete files with more than 30 days
FORFILES /M *.* /P "{Folder}" /S /D -30 /C "CMD /C echo DEL @path"


:: Set variable 'LastBootUpTime' to last boot time in format 'yyyymmddhhmmss.ffffff+mmm'
FOR /F "TOKENS=*" %%a IN ('wmic OS GET LastBootUpTime /VALUE ^| find "="') DO @SET "%%a"


:: Set DEBUG to ON if /DEBUG is present in the parameters
ECHO " %* " | find.exe /I " /DEBUG " > NUL && SET DEBUG=1==1 || SET DEBUG=1==0

	REM DEBUG EXAMPLE
	IF %DEBUG% ECHO This line is displayed if DEBUG is ON


:: 


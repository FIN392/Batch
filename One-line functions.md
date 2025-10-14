# Simple one-line functions for daily use

## Set 'TempFile' with a temporal file name in format '_~scriptname-nnnnnnnn.tmp_'

```batchfile
SET TempFile=%TEMP%\~%~n0-%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%.tmp
```

## Delete all the temporal files for this script
_(Assuming the file names were created as the previous one)_
```batchfile
DEL "%TEMP%\~%~n0-*.tmp"
```

## Get number of files in a folder 
```batchfile
FOR /F %%f IN ('DIR "%FolderName%" /S /A-D /B 2^>NUL ^| FIND /C /V ""') DO SET /A "Files=%%f+0"
```

## Set 'Timestamp' with current date and time in format '_yyyy/mm/dd hh:mm:ss_'
```batchfile
FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "Timestamp=%%a %%b"
```

## Set Removes leading, trailing and double spaces from a string
```batchfile
FOR /F "tokens=*" %%i IN ('ECHO %YourStringVariable% ') DO ECHO [%%i]
```

## Check if a value is a number
```batchfile
SET /A ("Result=%VarToCheck%+0") > NUL 2>&1 && (IF "%Result%"=="%VarToCheck%" ECHO Is a number) || (ECHO Is NOT a number)
```

## Add a line to a log file
```batchfile
>> "%LogFile%" ECHO %DATE% %TIME% This is the text of the log entry to add
```

## Check if a string match or not a regular expression
```batchfile
ECHO {String of characters} > NUL 2>&1 | FINDSTR /I /R /C:"{Regular Expression}" && ECHO Match || ECHO NOT Match
```

## Check whether or not a string is in a valid email address format
_(Correct regular expressions should be "```^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$```", but FINDSTR is limited)_
```batchfile
ECHO fin-392@gmail.com | FINDSTR /R "[a-zA-Z0-9]@[a-zA-Z0-9]*\.[a-zA-Z]" && ECHO Valid email address || ECHO NOT a email address
```

## Get public IP
```batchfile
FOR /F %i IN ('curl -s checkip.amazonaws.com') DO SET "PublicIP=%i"
```

## Convert from ASCII to UNICODE and viceversa
```batchfile
CMD /U /C TYPE ascii.txt > unicode.txt

TYPE unicode.txt > ascii.txt
```

## Delete all files in a folder except the 3 newest ones
```batchfile
FOR /F "TOKENS=* SKIP=3" %%f IN ('DIR "This filename doens't exist" /S /B /O-D') DO @echo DEL "%%f"
```

## Delete files with more than 30 days
```batchfile
FORFILES /M *.* /P "{Folder}" /S /D -30 /C "CMD /C ECHO DEL @path"
```

## Read variables from INI file
```batchfile
FOR /F "TOKENS=*" %%a IN ('TYPE "MyIniFile.ini" ^| FINDSTR /R "^[^;#[]"') DO SET MyPrefix_%%a
```

## Get path names longer than 255 characters
```batchfile
FOR /F "Tokens=*" %%a IN ('DIR C:\ /B /S /A') DO @( SET PathName=%%a & IF NOT "!PathName:~255,1!"=="" ECHO Extra long name: "%%a" )
```

## Get last boot time in format 'yyyymmddhhmmss.ffffff+mmm'
```batchfile
FOR /F "TOKENS=*" %%a IN ('WMIC OS GET LastBootUpTime /VALUE ^| FIND "="') DO @SET "%%a"
```

## Say Hello
```batchfile
START "" mshta "javascript:code(close((v=new ActiveXObject('SAPI.SpVoice')).GetVoices()&&v.Speak('Hello, how are you?')))"
```
## Get C: disk info
```batchfile
FOR /F "tokens=*" %%A IN ('WMIC LogicalDisk Where "DeviceID='C:'" Get /Format:list ^| FIND "="') DO @SET _LogicalDisk.C.%%A
SET _LogicalDisk.C.
```

## Get BIOS info
```batchfile
FOR /F "tokens=*" %%A IN ('WMIC BIOS Get /Format:list ^| FIND "="') DO @SET _BIOS.%%A
SET _BIOS.
```

## Get COMPUTERSYSTEM info
```batchfile
FOR /F "tokens=*" %%A IN ('WMIC COMPUTERSYSTEM Get /Format:list ^| FIND "="') DO @SET _COMPUTERSYSTEM.%%A
SET _COMPUTERSYSTEM.
```

## Get CPU info
```batchfile
FOR /F "tokens=*" %%A IN ('WMIC CPU Get /Format:list ^| FIND "="') DO @SET _CPU.%%A
SET _CPU.
```

## Minimize the command window
```batchfile
@IF NOT DEFINED _MinimizeMe SET _MinimizeMe=1 && START "" /MIN "%~dpnx0" %* && EXIT /B 0
```

## Start debugging if parameter /DEBUG
```batchfile
ECHO " %* " | find.exe /I " /DEBUG " > NUL && (ECHO ON & PROMPT $E[36m----------------------------------------$S$D$S$T$_$P$G$E[0m)
```




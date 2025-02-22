# One-line functions for simply daily tasks

## Table of Contents <!-- omit in toc -->
- [Set 'TempFile' with a temporal file name in format '_~scriptname-nnnnnnnn.tmp_'](#set-tempfile-with-a-temporal-file-name-in-format-scriptname-nnnnnnnntmp)
- [Delete all the temporal files for this script](#delete-all-the-temporal-files-for-this-script)
- [Get number of files in a folder](#get-number-of-files-in-a-folder)
- [Set 'Timestamp' with current date and time in format '_yyyy/mm/dd hh:mm:ss_'](#set-timestamp-with-current-date-and-time-in-format-yyyymmdd-hhmmss)
- [Set Removes leading, trailing and double spaces from a string](#set-removes-leading-trailing-and-double-spaces-from-a-string)
- [Check if a value is a number](#check-if-a-value-is-a-number)
- [Add a line to a log file](#add-a-line-to-a-log-file)
- [Check if a string match or not a regular expression](#check-if-a-string-match-or-not-a-regular-expression)
- [Check whether or not a string is in a valid email address format](#check-whether-or-not-a-string-is-in-a-valid-email-address-format)
- [Get public IP](#get-public-ip)

---  

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
FOR /F "tokens=1" %%f IN ('DIR "%FolderName%" /S /A-D /-C ^| FIND /V " 0 "') DO SET /A "Files=%%f+0"
```

## Set 'Timestamp' with current date and time in format '_yyyy/mm/dd hh:mm:ss_'
```batchfile
FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "DateTime=%%a %%b"
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
ECHO fin392@gmail.com > NUL 2>&1 | FINDSTR /I /R /C:"[a-zA-Z0-9]@[a-zA-Z0-9].[a-zA-Z]" && ECHO Valid email address || ECHO NOT a email address
```

## Get public IP
```batchfile
curl checkip.amazonaws.com
```



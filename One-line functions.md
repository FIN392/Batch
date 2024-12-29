# One-line functions for simply daily tasks

## Table of Contents <!-- omit in toc -->
- [Set 'TempFile' with a temporal file name in format '_~scriptname-nnnnnnnn.tmp_'](#set-tempfile-with-a-temporal-file-name-in-format-scriptname-nnnnnnnntmp)
- [Delete all the temporal files for this script](#delete-all-the-temporal-files-for-this-script)
- [Set 'Timestamp' with current date and time in format '_yyyyMMdd-hhmmss_'](#set-timestamp-with-current-date-and-time-in-format-yyyymmdd-hhmmss)
- [Set Removes leading, trailing and double spaces from a string](#set-removes-leading-trailing-and-double-spaces-from-a-string)
- [Check if a value is a number](#check-if-a-value-is-a-number)
- [Add a line to a log file](#add-a-line-to-a-log-file)
- [Check if a string match or not a regular expression](#check-if-a-string-match-or-not-a-regular-expression)
- [Check whether or not a string is in a valid email address format](#check-whether-or-not-a-string-is-in-a-valid-email-address-format)

---  

## Set 'TempFile' with a temporal file name in format '_~scriptname-nnnnnnnn.tmp_'

```Batch
SET TempFile=%TEMP%\~%~n0-%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%.tmp
```

## Delete all the temporal files for this script
_(Assuming the file names were created as the previous one)_
```Batch
DEL "%TEMP%\~%~n0-*.tmp"
```

## Set 'Timestamp' with current date and time in format '_yyyyMMdd-hhmmss_'
_(I wouldn't like to use Powershell but I don't know how to do it any other way)_
```Batch
FOR /F %%A IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss'"') DO SET Timestamp=%%A
```

## Set Removes leading, trailing and double spaces from a string
```Batch
FOR /F "tokens=*" %%i IN ('ECHO %YourStringVariable% ') DO ECHO [%%i]
```

## Check if a value is a number
```Batch
SET /A ("Result=%VarToCheck%+0") > NUL 2> NUL && (IF "%Result%"=="%VarToCheck%" ECHO Is a number) || (ECHO Is NOT a number)
```

## Add a line to a log file
```Batch
>> "%LogFile%" ECHO %DATE% %TIME% This is the text of the log entry to add
```

## Check if a string match or not a regular expression
```Batch
ECHO {String of characters} > NUL 2> NUL | FINDSTR /I /R /C:"{Regular Expression}" && ECHO Match || ECHO NOT Match
```

## Check whether or not a string is in a valid email address format
_(Correct regular expressions should be "```^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$```", but FINDSTR is limited)_
```Batch
ECHO fin392@gmail.com > NUL 2> NUL | FINDSTR /I /R /C:"[a-zA-Z0-9]@[a-zA-Z0-9].[a-zA-Z]" && ECHO Valid email address || ECHO NOT a email address
```


# One-line functions for simply daily tasks

Set 'TempFile' with a temporal file name in format '_~scriptname-nnnnnnnn.tmp_'

```SET TempFile=%TEMP%\~%~n0-%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%.tmp```

---

Delete all the temporal files for this script

```DEL "%TEMP%\~%~n0-*.tmp"```

---

Set 'Timestamp' with current date and time in format '_yyyyMMdd-hhmmss_'

```FOR /F %%A IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss'"') DO SET Timestamp=%%A```

---

Set Removes leading, trailing and double spaces from a string

```FOR /F "tokens=*" %%i IN ('ECHO %YourStringVariable% ') DO ECHO [%%i]```

---

Check if a value is a number

```SET /A ("Result=%VarToCheck%+0") > NUL 2> NUL && (IF "%Result%"=="%VarToCheck%" ECHO Number) || (ECHO NOT Number)```

---

Add a line to a log file

```>> "%LogFile%" ECHO %DATE% %TIME% This is the text of the log entry to add```

---

Check if a string match or not a regular expression

```ECHO {String of characters} > NUL 2> NUL | FINDSTR /I /R /C:"{Regular Expression}" && ECHO Match || ECHO NOT Match```

---

Check whether or not a string is in a valid email address format

```ECHO fin392@gmail.com > NUL 2> NUL | FINDSTR /I /R /C:"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" && ECHO Valid email address || ECHO NOT a email address```

---

# Path name longer than 255 characters
```batch
FOR /F "Tokens=*" %%a IN ('DIR C:\ /B /S /A') DO (
    SET PathName=%%a
    IF NOT "!PathName:~255,1!"=="" ECHO Extra long name: "%%a"
)
```

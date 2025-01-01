 # Get local date and time in format 'yyyy/mm/dd hh:mm:ss'
```batchfile
FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "DateTime=%%a %%b"
```

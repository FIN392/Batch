# One-line functions for simply daily tasks

Temporal file name with format '_~scriptname-nnnnnnnn.tmp_'

```SET TempFile=%TEMP%\~%~n0-%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%.tmp```

Delete all the temporal files for this script

```DEL "%TEMP%\~%~n0-*.tmp"```

Get timestamp with format 'yyyyMMdd-hhmmss'

```FOR /F %%A IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss'"') DO SET Timestamp=%%A```

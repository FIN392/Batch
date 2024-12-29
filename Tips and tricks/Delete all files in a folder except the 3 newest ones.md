# Delete all files in a folder except the 3 newest ones
```batch
FOR /F "TOKENS=* SKIP=3" %%f IN ('DIR "This filename doens't exist" /S /B /O-D') DO @echo DEL "%%f"
```

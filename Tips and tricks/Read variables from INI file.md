# Read variables from INI file
```batchfile
FOR /F "TOKENS=*" %%a IN ('TYPE "MyIniFile.ini"') DO SET MyPrefix_%%a
```

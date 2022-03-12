# Read variables from INI file
```batch
FOR /F "TOKENS=*" %%a IN ('TYPE "MyIniFile.ini"') DO SET MyPrefix_%%a
```

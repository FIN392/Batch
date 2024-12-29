# Encode and decode a string
```batchfile
SET PWPlain=Abc123

:: Encode
DEL "%Temp%\pw-org.tmp" "%Temp%\pw-dst.tmp" > NUL 2> NUL
ECHO %PWPlain% > "%Temp%\pw-org.tmp"
certutil -encode "%Temp%\pw-org.tmp" "%Temp%\pw-dst.tmp" > NUL 2> NUL
FOR /F "tokens=*" %%A IN ('FINDSTR /V /C:" CERTIFICATE---" "%Temp%\pw-dst.tmp"') DO SET PWSecret=%%A
DEL "%Temp%\pw-org.tmp" "%Temp%\pw-dst.tmp" > NUL 2> NUL

ECHO [%PWPlain%] -^> [%PWSecret%]

:: Decode
DEL "%Temp%\pw-org.tmp" "%Temp%\pw-dst.tmp" > NUL 2> NUL
ECHO -----BEGIN CERTIFICATE----- > "%Temp%\pw-org.tmp"
ECHO %PWSecret% >> "%Temp%\pw-org.tmp"
ECHO -----END CERTIFICATE----- >> "%Temp%\pw-org.tmp"
certutil -decode "%Temp%\pw-org.tmp" "%Temp%\pw-dst.tmp" > NUL 2> NUL
FOR /F "tokens=* delimn= " %%A IN ('TYPE "%Temp%\pw-dst.tmp"') DO SET PWPlain=%%A
DEL "%Temp%\pw-org.tmp" "%Temp%\pw-dst.tmp" > NUL 2> NUL

ECHO [%PWSecret%] -^> [%PWPlain%]

```

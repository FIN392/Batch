# Debugging
```batch
@ECHO OFF

:: Start debugging if parameter /DEBUG
ECHO " %* " | find.exe /I " /DEBUG " > NUL && (ECHO ON & PROMPT $e[32m----------------------------------------$_$P$G$e[0m)


    :: Your code goes here
    DIR NoWay:\
    TYPE No.Exist


:: End debugging
@PROMPT& @ECHO OFF

EXIT /B
```

 # Debugging
```batchfile
@ECHO OFF

:: Start debugging if parameter /DEBUG
ECHO " %* " | find.exe /I " /DEBUG " > NUL && (ECHO ON & PROMPT $E[36m----------------------------------------$S$D$S$T$_$P$G$E[0m)


    :: Your code goes here
    DIR NoWay:\
    TYPE No.Exist


:: End debugging
@ECHO OFF & PROMPT $P$G

EXIT /B
```

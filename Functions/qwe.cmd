REM @echo off


FOR %%v IN (%*) DO ECHO [%%v]


:LOOP
SET _TMP=%~1
IF "%_TMP:~0,1%"=="" GOTO :END

    ECHO [%_TMP%]
    SHIFT

GOTO :LOOP
:END


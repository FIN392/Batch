@ECHO OFF

COPY beep.snd CON > NUL

SET "_Global=MAIN"

CALL :TEST

EXIT /B 0



:TEST
SETLOCAL

    ECHO.    [%_Global%]

ENDLOCAL & EXIT /B 0


@ECHO OFF & SETLOCAL
PUSHD "%~dp0"
    >> "%~dpn0.log" ECHO %DATE% %TIME% *** START

    :: Your code goes here
    CALL :FunctionTemplate
    :: Your code goes here
    >> "%~dpn0.log" ECHO Log what your code does
    :: Your code goes here


    >> "%~dpn0.log" ECHO %DATE% %TIME% *** STOP
    >> "%~dpn0.log" ECHO.
POPD
ENDLOCAL & EXIT /B 0

:FunctionTemplate
SETLOCAL

    :: Your code goes here

ENDLOCAL & EXIT /B 0

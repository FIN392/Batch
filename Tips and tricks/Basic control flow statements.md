 # Basic control flow statements

Don't think that because it is a simple scripting language there is no possibility of making typical flow control statements.

## Table of Contents <!-- omit in toc -->
- [IF ... THEN ... ELSE ...](#if--then--else-)
- [FOR ... NEXT](#for--next)
- [WHILE ... END](#while--end)
- [DO ... UNTIL](#do--until)
- [FUNCTION](#function)

__{Function}:__ The name of the function where the code embedded (or the word 'Main' for the main stream). Used to avoid redundancies between the similar structures within a script.

__{Descriptor}:__ A word (or words without spaces) describing the use of the structure. Used to avoid redundancies between the similar structures within a function.

---

## IF ... THEN ... ELSE ...
```
IF ... GOTO IF_{UID}
GOTO :ELSE_{UID}
:IF_{UID}
    :: Your code goes here
GOTO :ENDIF_{UID}
:ELSE_{UID}
    :: Your code goes here
:ENDIF_{UID}
```
EXAMPLE
```batchfile
:: If current directory is 'C:\'...
IF "%CD%"=="C:\" GOTO IF_RootDirectory
GOTO :ELSE_RootDirectory
:IF_RootDirectory
    ECHO You are in the root folder
GOTO :ENDIF_RootDirectory
:ELSE_RootDirectory
    ECHO You are NOT in the root folder
:ENDIF_RootDirectory
```

## FOR ... NEXT
```
FOR ... IN (...) DO CALL :FOR_{UID} [{Parameter} ...]
GOTO ENDFOR_{UID}
:FOR_{UID}
    :: Your code goes here
GOTO :EOF
:ENDFOR_{UID}
```
EXAMPLE
```batchfile
:: For each directory in 'C:\'...
FOR /F "tokens=*" %%f IN ('DIR C:\*.* /B /AD') DO CALL :FOR_RootFolders "%%f"
GOTO ENDFOR_RootFolders
:FOR_RootFolders
    ECHO Directory: %1
GOTO :EOF
:ENDFOR_RootFolders
```
```batchfile
:: For i=1 to 10 (step 1)...
FOR /L %%i IN (1,1,10) DO CALL :FOR_i %%i
GOTO FOR_i
:FOR_i
    ECHO Counting 1 to 10: %1
GOTO :EOF
:ENDFOR_i
```

## WHILE ... END
```
:WHILE_{UID}
IF NOT ... GOTO :WEND_{UID}
    :: Your code goes here
GOTO :WHILE_{UID}
:WEND_{UID}
```
EXAMPLE
```batchfile
:: While file doesn't exist, try to create it
:WHILE_NoFile
IF EXIST A:\file.ext GOTO WEND_NoFile
    TYPE NUL > A:\file.ext
GOTO :WHILE_NoFile
:WEND_NoFile
```

## DO ... UNTIL
```
:DO_{UID}
    :: Your code goes here
IF ... GOTO DO_{UID}
```
EXAMPLE
```batchfile
:: Do 10 seconds wait until file exist
:DO_WaitTillFileExist
    TIMEOUT /T 10
IF NOT EXIST A:\file.ext GOTO DO_WaitTillFileExist
```

## FUNCTION
```
:{Function_name}
SETLOCAL
    :: Your code goes here
ENDLOCAL & SET %1={Returned_value}
GOTO :EOF
```
EXAMPLE
```batchfile
CALL :GetLocalDateTime _MyTime
ECHO %_MyTime%
EXIT /B 0

:GetLocalDateTime
SETLOCAL
    FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "_DateTime=%%a %%b"
ENDLOCAL & SET %1=%_DateTime%
GOTO :EOF
```

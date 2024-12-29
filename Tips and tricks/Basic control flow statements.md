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
IF ... GOTO IF_{Function}_{Descriptor}
GOTO :ELSE_{Function}_{Descriptor}
:IF_{Function}_{Descriptor}
    :: Your code goes here
GOTO :ENDIF_{Function}_{Descriptor}
:ELSE_{Function}_{Descriptor}
    :: Your code goes here
:ENDIF_{Function}_{Descriptor}
```
EXAMPLE
```batchfile
:: If current directory is 'C:\'...
IF "%CD%"=="C:\" GOTO IF_Main_RootDirectory
GOTO :ELSE_Main_RootDirectory
:IF_Main_RootDirectory
    ECHO You are in the root folder
GOTO :ERNDIF_Main_RootDirectory
:ELSE_Main_RootDirectory
    ECHO You are NOT in the root folder
:ENDIF_Main_RootDirectory
```

## FOR ... NEXT
```
FOR ... IN (...) DO CALL :FOR_{Function}_{Descriptor} [{Parameter} ...]
GOTO ENDFOR_{Function}_{Descriptor}
:FOR_{Function}_{Descriptor}
    :: Your code goes here
GOTO :EOF
:ENDFOR_{Function}_{Descriptor}
```
EXAMPLE
```batchfile
:: For each directory in 'C:\'...
FOR /F "tokens=*" %%f IN ('DIR C:\*.* /B /AD') DO CALL :FOR_Main_RootFolders "%%f"
GOTO ENDFOR_Main_RootFolders
:FOR_Main_RootFolders
    ECHO Directory: %1
GOTO :EOF
:ENDFOR_Main_RootFolders
```
```batchfile
:: For i=1 to 10 (step 1)...
FOR /L %%i IN (1,1,10) DO CALL :FOR_Main_i %%i
GOTO FOR_Main_i
:FOR_Main_i
    ECHO Counting 1 to 10: %1
GOTO :EOF
:ENDFOR_Main_i
```

## WHILE ... END
```
:WHILE_{Function}_{Descriptor}
IF ... GOTO DO{Function}_{Descriptor}
GOTO :END_{Function}_{Descriptor}
:DO_{Function}_{Descriptor}
    :: Your code goes here
GOTO :WHILE_{Function}_{Descriptor}
:END_{Function}_{Descriptor}
```
EXAMPLE
```batchfile
:: While file doesn't exist, try to create it
:WHILE_Main_NoFile
IF NOT EXIST A:\file.ext GOTO DO_Main_NoFile
GOTO :END_Main_NoFile
:DO_Main_NoFile
    TYPE NUL > A:\file.ext
GOTO :WHILE_Main_NoFile
:END_Main_NoFile
```

## DO ... UNTIL
```
:DO_{Function}_{Descriptor}
    :: Your code goes here
IF ... GOTO DO_{Function}_{Descriptor}
```
EXAMPLE
```batchfile
:: Do 10 seconds wait until file exist
:DO_Main_WaitTillFileExist
    TIMEOUT /T 10
IF NOT EXIST A:\file.ext GOTO DO_Main_WaitTillFileExist
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
	FOR /F %%A IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss'"') DO SET _%%t
ENDLOCAL & SET %1=%_LocalDateTime%
GOTO :EOF
```

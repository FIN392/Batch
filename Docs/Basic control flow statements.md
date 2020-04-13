# Basic control flow statements

__{Function}:__ The name of the function where the code embedded (or the word 'Main' for the main stream). Used to avoid redundancies between the similar structures within a script.

__{Descriptor}:__ A word (or words without spaces) describing the use of the structure. Used to avoid redundancies between the similar structures within a function.

- [IF ... THEN ... ELSE ...](#IF)
- [FOR ... NEXT](#FOR)
- [WHILE ... END WHILE](#WHILE)
- [DO ... UNTIL](#DO)
- [FUNCTION](#FUNCTION)
---
### <a name="IF"></a>IF ... THEN ... ELSE ...
```batch
IF ... GOTO {Function}_IF_{Descriptor}
GOTO :{Function}_ELSE_{Descriptor}
:{Function}_IF_{Descriptor}

    :: ...

GOTO :{Function}_ENDIF_{Descriptor}
:{Function}_ELSE_{Descriptor}

    :: ...

:{Function}_ENDIF_{Descriptor}

:: Using negative condition is shorter

IF NOT "{value-1}"=="{value-2}" GOTO {Function}_ELSE_{Descriptor}

    :: ...

GOTO :{Function}_ENDIF_{Descriptor}
:{Function}_ELSE_{Descriptor}

    :: ...

:{Function}_ENDIF_{Descriptor}
```
EXAMPLE
```batch
:: If current directory is 'C:\'...
IF "%CD%"=="C:\" GOTO Main_IF_RootDirectory
GOTO :Main_ELSE_RootDirectory
:Main_IF_RootDirectory

    ECHO You are in the root folder

GOTO :Main_ENDIF_RootDirectory
:Main_ELSE_RootDirectory

    ECHO You are NOT in the root folder

:Main_ENDIF_RootDirectory

:: Same with negative condition

:: If current directory is 'C:\'...
IF NOT "%CD%"=="C:\" GOTO Main_ELSE_RootDirectory

    ECHO You are in the root folder

GOTO :Main_ENDIF_RootDirectory
:Main_ELSE_RootDirectory

    ECHO You are NOT in the root folder

:Main_ENDIF_RootDirectory
```
---
### <a name="FOR"></a>FOR ... NEXT
```batch
FOR ... IN (...) DO CALL :{Function}_FOR_{Descriptor} [{Parameter} ...]
GOTO {Function}_ENDFOR_{Descriptor}
:{Function}_FOR_{Descriptor}

    :: ...

GOTO :EOF
:{Function}_ENDFOR_{Descriptor}
```
EXAMPLE
```batch
:: For each directory in 'C:\'...
FOR /F "tokens=*" %%f IN ('DIR C:\*.* /B /AD') DO CALL :Main_FOR_RootFolders "%%f"
GOTO Main_ENDFOR_RootFolders
:Main_FOR_RootFolders

    ECHO Directory: %1

GOTO :EOF
:Main_ENDFOR_RootFolders

:: For i=1 to 10 (step 1)...
FOR /L %%i IN (1,1,10) DO CALL :Main_FOR_i %%i
GOTO Main_ENDFOR_i
:Main_FOR_i

    ECHO Counting 1 to 10: %1

GOTO :EOF
:Main_ENDFOR_i
```
---
### <a name="WHILE"></a>WHILE ... END WHILE
```batch
:{Function}_WHILE_{Descriptor}
IF ... GOTO {Function}_DO_WHILE_{Descriptor}
GOTO :{Function}_END_WHILE_{Descriptor}
:{Function}_DO_WHILE_{Descriptor}

    :: ...

GOTO :{Function}_WHILE_{Descriptor}
:{Function}_END_WHILE_{Descriptor}
```
EXAMPLE
```batch
:: While file doesn't exist, try to create it
:Main_WHILE_NoFile
IF NOT EXIST C:\file.ext GOTO Main_DO_WHILE_NoFile
GOTO :Main_END_WHILE_NoFile
:Main_DO_WHILE_NoFile

    TYPE NUL > C:\file.ext

GOTO :Main_WHILE_NoFile
:Main_END_WHILE_NoFile
```
---
### <a name="DO"></a>DO ... UNTIL
```batch
:{Function}_DO_{Descriptor}

    :: ...

IF ... GOTO {Function}_DO_{Descriptor}
```
EXAMPLE
```batch
:: Do 10 seconds wait until file exist
:Main_DO_WaitTillFileExist

    PING 127.0.0.1 -n 10

IF NOT EXIST C:\file.ext GOTO Main_DO_WaitTillFileExist
```
---
### <a name="FUNCTION"></a>FUNCTION
```batch
:{Function_name}
SETLOCAL

	:: ...
	
ENDLOCAL & SET %1={Return_value}
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
```
EXAMPLE
```batch
CALL :GetLocalDateTime _MyTime

ECHO %_MyTime%

EXIT /B 0

:GetLocalDateTime
SETLOCAL

	FOR /F %%t IN ('wmic OS GET LocalDateTime /VALUE ^| find "="') DO SET _%%t

ENDLOCAL & SET %1=%_LocalDateTime%
GOTO :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
```

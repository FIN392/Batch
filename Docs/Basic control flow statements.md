# Basic control flow statements

__{Function}:__ Name of the function where the code embedded (or the word 'Main' for the main stream). Used to avoid redundancies between the similar structures within a script.

__{Descriptor}:__ Word (or words without spaces) describing the structure use. Used to avoid redundancies between the similar structures within a function.

## IF ... THEN ... ELSE ...
```batch
IF "{value-1}"=="{value-2}" GOTO {Function}_IF_{Descriptor}
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

## FOR ... NEXT
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
FOR /L %i IN (1,1,10) DO CALL :Main_FOR_i %i
GOTO Main_ENDFOR_i
:Main_FOR_i

    ECHO Counting 1 to 10: %i

GOTO :EOF
:Main_ENDFOR_i
```

## WHILE ... END WHILE
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
:Main_WHILE_
IF ... GOTO {Function}_DO_WHILE_{DEscriptor}
GOTO :{Function}_END_WHILE_{DEscriptor}
:{Function}_DO_WHILE_{DEscriptor}

    :: ...

GOTO :{Function}_WHILE_{DEscriptor}
:{Function}_END_WHILE_{DEscriptor}
```

## DO ... UNTIL
```batch
:DO

    :: ...

IF ... GOTO DO
```

## FUNCTION
```batch
xxx
```
[IF](.#IF)

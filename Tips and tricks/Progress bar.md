 # Progress bar
```batchfile
REM Backspace ASCII code:
REM Decimal: 8
REM Hexadecimal: 0x08
REM Escape in some languages: \b
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET /A "intTotalElements=23"
FOR /L %%i IN (0, 1, %intTotalElements%) DO (
    SET /A "intPercentage=(%%i*100)/%intTotalElements%"
    :: [ALT]+8
    ECHO|SET /P="◘◘◘◘◘◘◘◘◘◘◘◘◘◘%%i of %intTotalElements% (!intPercentage!%%)"
	
    REM *
    REM * YOUR WORK GOES HERE
    REM *
	
    TIMEOUT /T 1 > NUL 2>&1
)
ECHO.
```

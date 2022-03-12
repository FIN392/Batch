# Progress bar
```batch
SET /A "intTotalElements=23"
FOR /L %%i IN (0, 1, %intTotalElements%) DO (
	SET /A "intPercentage=(%%i*100)/%intTotalElements%"
	ECHO|SET /P="%%i of %intTotalElements% (!intPercentage!%%)"
	
	REM *
	REM * YOUR WORK GOES HERE
	REM *
	
	TIMEOUT /T 1 > NUL 2>&1
)
ECHO.
```

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyyMMdd-hhmmss.fff'.
::
:: NOTE: PowerShell version 2.0 or higher must be installed.
::
:: {Return_variable} : Name of the variable where the result will be returned.
::
:: Repository: https://github.com/FIN392/Batch
::
:GetLocalDateTime {Return_variable}

	FOR /F %%t IN ('powershell -NoProfile -NonInteractive -NoLogo -Command "Get-Date -Format 'yyyyMMdd-hhmmss.fff'"') DO SET "%~1=%%t"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Return local date and time with format 'yyyy/mm/dd hh:mm:ss'.
::
:: {Return_variable} : Name of the variable where the result will be returned.
::
:: Repository: https://github.com/FIN392/Batch
::
:GetLocalDateTime {Return_variable}

	FOR /F "tokens=1-2" %%a IN ('ROBOCOPY "|" . /NJH /L ^| FIND "0x"') DO SET "%~1=%%a %%b"

EXIT /B 0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

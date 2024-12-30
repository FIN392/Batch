 # PowerShell code embedded
```batchfile
<# :
	@ECHO OFF

	ECHO Batch code goes here (1.1)

	powershell -ExecutionPolicy Unrestricted -Command Invoke-Expression ([string](Get-Content -Path '%~f0'))

	ECHO Batch code goes here (1.2)

	EXIT /B	
#>

Write-Output "Powershell code goes here (2.1)"
```





@echo off
cls


For /F "Tokens=*" %%a in ('dir C:\OneDrive /b /s /a') do (
	set name=%%a
	if not "!name:~255,1!"=="" echo Extra long name: "%%a"
)


exit /b 0


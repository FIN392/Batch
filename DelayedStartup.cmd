rem @ECHO OFF


CALL :LaunchProgram SKYPE   "C:\Program Files (x86)\Microsoft Office\root\Office16\lync.exe" .                                                  10
CALL :LaunchProgram EQUINOX "C:\Program Files (x86)\Avaya\Avaya Equinox\Avaya Equinox.exe"   "C:\Program Files (x86)\Avaya\Avaya Equinox\"      10
CALL :LaunchProgram WEBEX   "C:\Program Files (x86)\Webex\Webex\Applications\ptoneclk.exe"   "C:\Program Files (x86)\Webex\Webex\Applications\" 10
CALL :LaunchProgram TEAMS   "C:\Users\FERNAJL\AppData\Local\Microsoft\Teams\Update.exe" --processStart "Teams.exe" "C:\Users\FERNAJL\AppData\Local\Microsoft\Teams" 10
CALL :LaunchProgram ONEDRIVE "C:\Users\FERNAJL\AppData\Local\Microsoft\OneDrive\OneDrive.exe" . 10

EXIT /B 0


:LaunchProgram


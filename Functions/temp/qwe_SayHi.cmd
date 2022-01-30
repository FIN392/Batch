@echo off 
setlocal enableDelayedExpansion

set "strSay=Hi, how are you?"

START "" mshta "javascript:code(close((v=new ActiveXObject('SAPI.SpVoice')).GetVoices()&&v.Speak('!strSay!')))"

endLocal

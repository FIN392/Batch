@echo off 
setlocal enableDelayedExpansion

set "strSay=Hola, ¿como estas?"

START "" mshta "javascript:code(close((v=new ActiveXObject('SAPI.SpVoice')).GetVoices()&&v.Speak('!strSay!')))"

endLocal

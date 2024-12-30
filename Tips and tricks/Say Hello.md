 # Say Hello
```batchfile
SET "strSay=Hello, how are you?"
START "" mshta "javascript:code(close((v=new ActiveXObject('SAPI.SpVoice')).GetVoices()&&v.Speak('%strSay%')))"
```

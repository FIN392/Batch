# Say Hello!
```batch
SET "strSay=Hola, ¿como estas?"
START "" mshta "javascript:code(close((v=new ActiveXObject('SAPI.SpVoice')).GetVoices()&&v.Speak('%strSay%')))"
```batch
# Minimize the command window
```batch
@IF NOT DEFINED _MinimizeMe SET _MinimizeMe=1 && START "" /MIN "%~dpnx0" %* && EXIT

    :: Your code goes here

EXIT
```

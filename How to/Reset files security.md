Setting ownership of files and folders to the administrators group:
```
X:\> takeown /R /A /F X:\
```

Secure files and folders for Everyone = Full Control:
```
X:\> icacls "X:\*.*" /GRANT EVERYONE:(OI)(CI)F /T
```

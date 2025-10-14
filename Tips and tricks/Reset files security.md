# To get full control of files and folders...
First, take the ownership of the files:
```
X:\> takeown /R /A /F X:\
```
Then, secure them for Everyone = Full Control:
```
X:\> icacls "X:\*.*" /GRANT EVERYONE:(OI)(CI)F /T
```
*NOTE: both commands must be run as administrator*

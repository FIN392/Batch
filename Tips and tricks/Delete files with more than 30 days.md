# Delete files with more than 30 days
```batchfile
FORFILES /M *.* /P "{Folder}" /S /D -30 /C "CMD /C ECHO DEL @path"
```
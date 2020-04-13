# Reading INI file information with FINDSTR

### Comments
```batch
findstr /I /N /R /C:"^[ ,	]*\;"
```

### Sections
```batch
findstr /I /N /R /C:"^[ ,	]*\[SECTION\][ ,	]*$"
```

### Values
```batch
findstr /I /N /R /C:"^[ ,	]*VALUE[ ,	]*\="
```

_(NOTE: The challenge is to identify when a 'value' is inside of a particular 'section')_

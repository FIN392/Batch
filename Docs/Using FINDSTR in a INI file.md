# Comments
```batch
findstr /I /N /R /C:"^[ ,	]*\;"
```

# Sections
```batch
findstr /I /N /R /C:"^[ ,	]*\[SECTION*\][ ,	]*$"
```

# Values
```batch
findstr /I /N /R /C:"^[ ,	]*VALUE[ ,	]*\="
```

(*NOTE:* _The challenge is to identify when a 'value' is inside of a particular 'section_')

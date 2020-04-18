::
:: TYPE this file for examples
::
SET _ESC=[

SET _Normal=0m
SET _Bold=1m
SET _Underline=4m
SET _Inverse=7m

SET _fgBlack=30m
SET _fgRed=31m
SET _fgGreen=32m
SET _fgYellow=33m
SET _fgBlue=34m
SET _fgMagenta=35m
SET _fgCyan=36m
SET _fgWhite=37m

SET _fgBlack+=90m
SET _fgRed+=91m
SET _fgGreen+=92m
SET _fgYellow+=93m
SET _fgBlue+=94m
SET _fgMagenta+=95m
SET _fgCyan+=96m
SET _fgWhite+=97m

SET _bgBlack=40m
SET _bgRed=41m
SET _bgGreen=42m
SET _bgYellow=43m
SET _bgBlue=44m
SET _bgMagenta=45m
SET _bgCyan=46m
SET _bgWhite=47m

SET _bgBlack+=100m
SET _bgRed+=101m
SET _bgGreen+=102m
SET _bgYellow+=103m
SET _bgBlue+=104m
SET _bgMagenta+=105m
SET _bgCyan+=106m
SET _bgWhite+=107m

:: Normal   : [0m Normal    [0m
:: Bold     : [1m Bold      [0m
:: Inverse  : [7m Inverse   [0m
:: Underline: [4m Underline [0m
:: 
:: Foreground Black  : [30m Foreground Black   [0m <- Black over black
:: Foreground Red    : [31m Foreground Red     [0m
:: Foreground Green  : [32m Foreground Green   [0m
:: Foreground Yellow : [33m Foreground Yellow  [0m
:: Foreground Blue   : [34m Foreground Blue    [0m
:: Foreground Magenta: [35m Foreground Magenta [0m
:: Foreground Cyan   : [36m Foreground Cyan    [0m
:: Foreground White  : [37m Foreground White   [0m
:: 
:: Foreground Black+  : [90m Foreground Black+   [0m
:: Foreground Red+    : [91m Foreground Red+     [0m
:: Foreground Green+  : [92m Foreground Green+   [0m
:: Foreground Yellow+ : [93m Foreground Yellow+  [0m
:: Foreground Blue+   : [94m Foreground Blue+    [0m
:: Foreground Magenta+: [95m Foreground Magenta+ [0m
:: Foreground Cyan+   : [96m Foreground Cyan+    [0m
:: Foreground White+  : [97m Foreground White+   [0m
:: 
:: Background Black  : [40m Background Black   [0m
:: Background Red    : [41m Background Red     [0m
:: Background Green  : [42m Background Green   [0m
:: Background Yellow : [43m Background Yellow  [0m
:: Background Blue   : [44m Background Blue    [0m
:: Background Magenta: [45m Background Magenta [0m
:: Background Cyan   : [46m Background Cyan    [0m
:: Background White  : [47m Background White   [0m <- White over white
:: 
:: Background Black+  : [100m Background Black+   [0m
:: Background Red+    : [101m Background Red+     [0m
:: Background Green+  : [102m Background Green+   [0m
:: Background Yellow+ : [103m Background Yellow+  [0m
:: Background Blue+   : [104m Background Blue+    [0m
:: Background Magenta+: [105m Background Magenta+ [0m
:: Background Cyan+   : [106m Background Cyan+    [0m
:: Background White+  : [107m Background White+   [0m
::
:: Any combination is possible: [4m[94m[41m Bright blue underline over red [0m
::
:: In code, it should be like: ECHO %_ESC%%_Underline%%_ESC%%_fgBlue+%%_ESC%%_bgRed% Bright blue underline over red %_ESC%%_Normal%
::

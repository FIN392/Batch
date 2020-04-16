::
:: Add /DEBUG to see examples
::
@ECHO OFF

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

IF /I NOT "%1"=="/DEBUG" EXIT /B 0

ECHO _Normal=[%_ESC%%_Normal%_Normal%_ESC%%_Normal%]
ECHO _Bold=[%_ESC%%_Bold%_Bold%_ESC%%_Normal%]
ECHO _Underline=[%_ESC%%_Underline%_Underline%_ESC%%_Normal%]
ECHO _Inverse=[%_ESC%%_Inverse%_Inverse%_ESC%%_Normal%]
ECHO _fgBlack=[%_ESC%%_fgBlack%_fgBlack%_ESC%%_Normal%]
ECHO _fgRed=[%_ESC%%_fgRed%_fgRed%_ESC%%_Normal%]
ECHO _fgGreen=[%_ESC%%_fgGreen%_fgGreen%_ESC%%_Normal%]
ECHO _fgYellow=[%_ESC%%_fgYellow%_fgYellow%_ESC%%_Normal%]
ECHO _fgBlue=[%_ESC%%_fgBlue%_fgBlue%_ESC%%_Normal%]
ECHO _fgMagenta=[%_ESC%%_fgMagenta%_fgMagenta%_ESC%%_Normal%]
ECHO _fgCyan=[%_ESC%%_fgCyan%_fgCyan%_ESC%%_Normal%]
ECHO _fgWhite=[%_ESC%%_fgWhite%_fgWhite%_ESC%%_Normal%]
ECHO _fgBlack+=[%_ESC%%_fgBlack+%_fgBlack+%_ESC%%_Normal%]
ECHO _fgRed+=[%_ESC%%_fgRed+%_fgRed+%_ESC%%_Normal%]
ECHO _fgGreen+=[%_ESC%%_fgGreen+%_fgGreen+%_ESC%%_Normal%]
ECHO _fgYellow+=[%_ESC%%_fgYellow+%_fgYellow+%_ESC%%_Normal%]
ECHO _fgBlue+=[%_ESC%%_fgBlue+%_fgBlue+%_ESC%%_Normal%]
ECHO _fgMagenta+=[%_ESC%%_fgMagenta+%_fgMagenta+%_ESC%%_Normal%]
ECHO _fgCyan+=[%_ESC%%_fgCyan+%_fgCyan+%_ESC%%_Normal%]
ECHO _fgWhite+=[%_ESC%%_fgWhite+%_fgWhite+%_ESC%%_Normal%]
ECHO _bgBlack=[%_ESC%%_bgBlack%_bgBlack%_ESC%%_Normal%]
ECHO _bgRed=[%_ESC%%_bgRed%_bgRed%_ESC%%_Normal%]
ECHO _bgGreen=[%_ESC%%_bgGreen%_bgGreen%_ESC%%_Normal%]
ECHO _bgYellow=[%_ESC%%_bgYellow%_bgYellow%_ESC%%_Normal%]
ECHO _bgBlue=[%_ESC%%_bgBlue%_bgBlue%_ESC%%_Normal%]
ECHO _bgMagenta=[%_ESC%%_bgMagenta%_bgMagenta%_ESC%%_Normal%]
ECHO _bgCyan=[%_ESC%%_bgCyan%_bgCyan%_ESC%%_Normal%]
ECHO _bgWhite=[%_ESC%%_bgWhite%_bgWhite%_ESC%%_Normal%]
ECHO _bgBlack+=[%_ESC%%_bgBlack+%_bgBlack+%_ESC%%_Normal%]
ECHO _bgRed+=[%_ESC%%_bgRed+%_bgRed+%_ESC%%_Normal%]
ECHO _bgGreen+=[%_ESC%%_bgGreen+%_bgGreen+%_ESC%%_Normal%]
ECHO _bgYellow+=[%_ESC%%_bgYellow+%_bgYellow+%_ESC%%_Normal%]
ECHO _bgBlue+=[%_ESC%%_bgBlue+%_bgBlue+%_ESC%%_Normal%]
ECHO _bgMagenta+=[%_ESC%%_bgMagenta+%_bgMagenta+%_ESC%%_Normal%]
ECHO _bgCyan+=[%_ESC%%_bgCyan+%_bgCyan+%_ESC%%_Normal%]
ECHO _bgWhite+=[%_ESC%%_bgWhite+%_bgWhite+%_ESC%%_Normal%]

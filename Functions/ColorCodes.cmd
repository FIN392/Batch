REM GOTO :Example
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: ColorCodes
::
:: Defines a set of variables with the different colors and typographic styles.
::
:: See all possible combinations below.
::
:: Syntax: ColorCodes
::
::     (See an example below)
::
:: Author: fin392@gmail.com
:: License: MIT License
:: Repository: https://github.com/FIN392/Batch/tree/main/Functions
::
:ColorCodes

	SET _Beep=

	SET _Esc=

	SET _FontNormal=%_Esc%[0m
	SET _FontBold=%_Esc%[1m
	SET _FontUnderline=%_Esc%[4m
	SET _FontInverse=%_Esc%[7m

	SET _ColorFgBlack=%_Esc%[30m
	SET _ColorFgRed=%_Esc%[31m
	SET _ColorFgGreen=%_Esc%[32m
	SET _ColorFgYellow=%_Esc%[33m
	SET _ColorFgBlue=%_Esc%[34m
	SET _ColorFgMagenta=%_Esc%[35m
	SET _ColorFgCyan=%_Esc%[36m
	SET _ColorFgWhite=%_Esc%[37m

	SET _ColorFgBlackB=%_Esc%[90m
	SET _ColorFgRedB=%_Esc%[91m
	SET _ColorFgGreenB=%_Esc%[92m
	SET _ColorFgYellowB=%_Esc%[93m
	SET _ColorFgBlueB=%_Esc%[94m
	SET _ColorFgMagentaB=%_Esc%[95m
	SET _ColorFgCyanB=%_Esc%[96m
	SET _ColorFgWhiteB=%_Esc%[97m

	SET _ColorBgBlack=%_Esc%[40m
	SET _ColorBgRed=%_Esc%[41m
	SET _ColorBgGreen=%_Esc%[42m
	SET _ColorBgYellow=%_Esc%[43m
	SET _ColorBgBlue=%_Esc%[44m
	SET _ColorBgMagenta=%_Esc%[45m
	SET _ColorBgCyan=%_Esc%[46m
	SET _ColorBgWhite=%_Esc%[47m

	SET _ColorBgBlackB=%_Esc%[100m
	SET _ColorBgRedB=%_Esc%[101m
	SET _ColorBgGreenB=%_Esc%[102m
	SET _ColorBgYellowB=%_Esc%[103m
	SET _ColorBgBlueB=%_Esc%[104m
	SET _ColorBgMagentaB=%_Esc%[105m
	SET _ColorBgCyanB=%_Esc%[106m
	SET _ColorBgWhiteB=%_Esc%[107m

EXIT /B 0
::
:: 'TYPE' this file to see all the examples:
::
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
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Example

:: Set here your functions folder ending in '\'
@ECHO OFF & SET "Func_=:"

CALL %Func_%ColorCodes

ECHO %_ColorBgRed%%_ColorFgWhiteB%%_FontBold%ERROR%_FontNormal%: This is just a test!!!

EXIT /B 0

:: Results:
::
:: ERROR: This is just a test!!!
::
:: (Word 'ERROR' bold and bright white over red)
::
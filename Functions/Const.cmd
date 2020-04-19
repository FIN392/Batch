:: Example of using the function
:Main
@ECHO OFF & SETLOCAL & SET "_Error=0"

	CALL :Const

	ECHO.
	ECHO.%_EscUnderline%%_EscBgRed%%_EscFgBlueB% Bright blue underline over red %_EscNormal%
	ECHO.
	ECHO.%_Beep%BEEP!

ENDLOCAL & EXIT /B 0


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Consts
::
:Const

	SET _Beep=

	SET _Esc=

	SET _EscNormal=%_Esc%[0m
	SET _EscBold=%_Esc%[1m
	SET _EscUnderline=%_Esc%[4m
	SET _EscInverse=%_Esc%[7m

	SET _EscFgBlack=%_Esc%[30m
	SET _EscFgRed=%_Esc%[31m
	SET _EscFgGreen=%_Esc%[32m
	SET _EscFgYellow=%_Esc%[33m
	SET _EscFgBlue=%_Esc%[34m
	SET _EscFgMagenta=%_Esc%[35m
	SET _EscFgCyan=%_Esc%[36m
	SET _EscFgWhite=%_Esc%[37m

	SET _EscFgBlackB=%_Esc%[90m
	SET _EscFgRedB=%_Esc%[91m
	SET _EscFgGreenB=%_Esc%[92m
	SET _EscFgYellowB=%_Esc%[93m
	SET _EscFgBlueB=%_Esc%[94m
	SET _EscFgMagentaB=%_Esc%[95m
	SET _EscFgCyanB=%_Esc%[96m
	SET _EscFgWhiteB=%_Esc%[97m

	SET _EscBgBlack=%_Esc%[40m
	SET _EscBgRed=%_Esc%[41m
	SET _EscBgGreen=%_Esc%[42m
	SET _EscBgYellow=%_Esc%[43m
	SET _EscBgBlue=%_Esc%[44m
	SET _EscBgMagenta=%_Esc%[45m
	SET _EscBgCyan=%_Esc%[46m
	SET _EscBgWhite=%_Esc%[47m

	SET _EscBgBlackB=%_Esc%[100m
	SET _EscBgRedB=%_Esc%[101m
	SET _EscBgGreenB=%_Esc%[102m
	SET _EscBgYellowB=%_Esc%[103m
	SET _EscBgBlueB=%_Esc%[104m
	SET _EscBgMagentaB=%_Esc%[105m
	SET _EscBgCyanB=%_Esc%[106m
	SET _EscBgWhiteB=%_Esc%[107m

EXIT /B 0
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

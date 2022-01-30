@ECHO OFF
IF "%1"=="/CON" GOTO :Console

SET _REG_FontSize=0x100000
SET _REG_WindowPosition=[NONE]

REG ADD HKEY_CURRENT_USER\Console /v FontSize       /t REG_DWORD /d 0x180000 /f > NUL
REG ADD HKEY_CURRENT_USER\Console /v WindowPosition /t REG_DWORD /d 0x0      /f > NUL

START %0 /CON %*
EXIT /B 0

:Console
SHIFT
IF "%_REG_FontSize%"=="[NONE]" (
	REG DELETE HKEY_CURRENT_USER\Console /v FontSize /f
) ELSE (
	REG ADD HKEY_CURRENT_USER\Console /v FontSize       /t REG_DWORD /d %_REG_FontSize%       /f > NUL
)
IF "%_REG_WindowPosition%"=="[NONE]" (
	REG DELETE HKEY_CURRENT_USER\Console /v WindowPosition /f
) ELSE (
	REG ADD HKEY_CURRENT_USER\Console /v WindowPosition /t REG_DWORD /d %_REG_WindowPosition% /f > NUL
)




	ECHO Args: %1 %2 %3 %4 %5
	SET _REG_
	pause


EXIT


::::::::::::::::::::::::::::
HKEY_CURRENT_USER\Console
    ColorTable00                REG_DWORD    0xc0c0c
    ColorTable01                REG_DWORD    0xda3700
    ColorTable02                REG_DWORD    0xea113
    ColorTable03                REG_DWORD    0xdd963a
    ColorTable04                REG_DWORD    0x1f0fc5
    ColorTable05                REG_DWORD    0x981788
    ColorTable06                REG_DWORD    0x9cc1
    ColorTable07                REG_DWORD    0xcccccc
    ColorTable08                REG_DWORD    0x767676
    ColorTable09                REG_DWORD    0xff783b
    ColorTable10                REG_DWORD    0xcc616
    ColorTable11                REG_DWORD    0xd6d661
    ColorTable12                REG_DWORD    0x5648e7
    ColorTable13                REG_DWORD    0x9e00b4
    ColorTable14                REG_DWORD    0xa5f1f9
    ColorTable15                REG_DWORD    0xf2f2f2
    CtrlKeyShortcutsDisabled    REG_DWORD    0x0
    CursorColor                 REG_DWORD    0xffffffff
    CursorSize                  REG_DWORD    0x19
    DefaultBackground           REG_DWORD    0xffffffff
    DefaultForeground           REG_DWORD    0xffffffff
    EnableColorSelection        REG_DWORD    0x0
    ExtendedEditKey             REG_DWORD    0x1
    ExtendedEditKeyCustom       REG_DWORD    0x0
    FaceName                    REG_SZ       __DefaultTTFont__
    FilterOnPaste               REG_DWORD    0x1
    FontFamily                  REG_DWORD    0x0
    FontSize                    REG_DWORD    0x100000
    FontWeight                  REG_DWORD    0x0
    ForceV2                     REG_DWORD    0x1
    FullScreen                  REG_DWORD    0x0
    HistoryBufferSize           REG_DWORD    0x32
    HistoryNoDup                REG_DWORD    0x0
    InsertMode                  REG_DWORD    0x1
    LineSelection               REG_DWORD    0x1
    LineWrap                    REG_DWORD    0x1
    LoadConIme                  REG_DWORD    0x1
    NumberOfHistoryBuffers      REG_DWORD    0x4
    PopupColors                 REG_DWORD    0xf5
    QuickEdit                   REG_DWORD    0x1
    ScreenBufferSize            REG_DWORD    0x23290078
    ScreenColors                REG_DWORD    0x7
    ScrollScale                 REG_DWORD    0x1
    TerminalScrolling           REG_DWORD    0x0
    TrimLeadingZeros            REG_DWORD    0x0
    WindowAlpha                 REG_DWORD    0xff
    WindowSize                  REG_DWORD    0x1e0078
    WordDelimiters              REG_DWORD    0x0
    CurrentPage                 REG_DWORD    0x2
    CursorType                  REG_DWORD    0x0
    InterceptCopyPaste          REG_DWORD    0x0
::::::::::::::::::::::::::::

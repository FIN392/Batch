@echo off
CLS
SETLOCAL ENABLEDELAYEDEXPANSION

SET "strMagnitudes=B KBMBGBTB"

SET "strNum=%~1"
SET "strNum=%strNum:.=%"

IF NOT "%strNum:~18,1%"=="" ( ECHO TOOOOOOO BIG! & EXIT /B 1 )

SET /A "Magnitude=0"
:Loop_1000
IF "%strNum:~10,1%"=="" GOTO :EndLoop_1000
	SET /A "Magnitude=%Magnitude%+1"
	SET "strNum=%strNum:~0,-3%"
GOTO :Loop_1000
:EndLoop_1000

SET /A "Num=%strNum%+0"

:: :Loop_1024
:: IF %Magnitude% GEQ 4 GOTO :EndLoop_1024
:: IF %NUM% GTR 2048 (
:: 	SET /A "Num=Num/1024"
:: 	SET /A "Magnitude=%Magnitude%+1"
:: )
:: GOTO :Loop_1024
:: :EndLoop_1024



SET /A "Magnitude=%Magnitude%*2"

ECHO Num=%Num%
CALL ECHO Magnitude=%%strMagnitudes:~%Magnitude%,2%%

ENDLOCAL


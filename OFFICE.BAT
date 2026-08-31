@ECHO OFF
SETLOCAL
TITLE LibreNT Office Suite

:MENU
CLS
ECHO.
ECHO  ================================================
ECHO    LibreNT Office Suite 1.0  [Windows NT 4.0]
ECHO  ================================================
ECHO.
ECHO    [1]  Writer     - Word Processor  (WordPad)
ECHO    [2]  Calc       - Spreadsheet     (QBasic)
ECHO    [3]  Notes      - Quick Notes     (Notepad)
ECHO    [4]  Impress    - Slideshow       (Text)
ECHO    [5]  About
ECHO    [6]  Exit
ECHO.
SET /P CHOICE=    Select: 
ECHO.

IF "%CHOICE%"=="1" GOTO WRITER
IF "%CHOICE%"=="2" GOTO CALC
IF "%CHOICE%"=="3" GOTO NOTES
IF "%CHOICE%"=="4" GOTO IMPRESS
IF "%CHOICE%"=="5" GOTO ABOUT
IF "%CHOICE%"=="6" GOTO END

ECHO    Invalid option. Try again.
PAUSE
GOTO MENU

:WRITER
ECHO    Opening LibreNT Writer...
START WORDPAD.EXE
GOTO MENU

:CALC
IF EXIST "%~dp0QBASIC.EXE" (
    "%~dp0QBASIC.EXE" /RUN "%~dp0CALC.BAS"
) ELSE IF EXIST "C:\WINDOWS\SYSTEM32\QBASIC.EXE" (
    C:\WINDOWS\SYSTEM32\QBASIC.EXE /RUN "%~dp0CALC.BAS"
) ELSE (
    ECHO.
    ECHO    QBASIC.EXE not found.
    ECHO    Copy QBASIC.EXE from your MS-DOS 6.x or Win95 media
    ECHO    into C:\LIBRENT\ then try again.
    ECHO.
    PAUSE
)
GOTO MENU

:NOTES
START NOTEPAD.EXE
GOTO MENU

:IMPRESS
IF EXIST "%~dp0IMPRESS.BAT" (
    CALL "%~dp0IMPRESS.BAT"
) ELSE (
    ECHO    IMPRESS.BAT not found.
    PAUSE
)
GOTO MENU

:ABOUT
CLS
ECHO.
ECHO    LibreNT Office Suite 1.0
ECHO    ========================
ECHO    A free, open-source office suite for Windows NT 4.0.
ECHO.
ECHO    Components:
ECHO      Writer  - WordPad word processor
ECHO      Calc    - QBasic grid spreadsheet with CSV export
ECHO      Notes   - Notepad quick notes
ECHO      Impress - Batch text slideshow viewer
ECHO.
ECHO    https://github.com/chambtai-sys/LibreNT
ECHO    MIT License
ECHO.
PAUSE
GOTO MENU

:END
ECHO    Goodbye!
ENDLOCAL
EXIT

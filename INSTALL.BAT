@ECHO OFF
SETLOCAL
TITLE LibreNT Installer
CLS
ECHO.
ECHO  ================================================
ECHO    LibreNT Office Suite 1.0 - Installer
ECHO    Windows NT 4.0
ECHO  ================================================
ECHO.
ECHO  This will install LibreNT to C:\LIBRENT\
ECHO.
SET /P CONFIRM=  Continue? [Y/N]: 
IF /I NOT "%CONFIRM%"=="Y" GOTO CANCEL

ECHO.
ECHO  Creating C:\LIBRENT ...
IF NOT EXIST C:\LIBRENT MKDIR C:\LIBRENT

ECHO  Copying files...
COPY "%~dp0OFFICE.BAT"  C:\LIBRENT\OFFICE.BAT   >NUL
COPY "%~dp0CALC.BAS"    C:\LIBRENT\CALC.BAS      >NUL
COPY "%~dp0IMPRESS.BAT" C:\LIBRENT\IMPRESS.BAT   >NUL
COPY "%~dp0README.TXT"  C:\LIBRENT\README.TXT    >NUL

ECHO  Creating desktop launcher...
(
ECHO @ECHO OFF
ECHO CD /D C:\LIBRENT
ECHO CALL OFFICE.BAT
) > "%USERPROFILE%\Desktop\LibreNT.bat"

ECHO.
ECHO  ================================================
ECHO    Installation complete!
ECHO  ================================================
ECHO.
ECHO    Launch LibreNT anytime:
ECHO      CD C:\LIBRENT
ECHO      OFFICE
ECHO.
PAUSE
GOTO END

:CANCEL
ECHO  Installation cancelled.
PAUSE

:END
ENDLOCAL

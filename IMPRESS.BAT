@ECHO OFF
SETLOCAL
TITLE LibreNT Impress

SET FILE=%1
IF "%FILE%"=="" SET FILE=SLIDES.IMP
IF NOT EXIST "%FILE%" GOTO NOFILE

:LOOP
CLS
ECHO.
ECHO  ============================================================
ECHO.

FOR /F "delims=" %%L IN (%FILE%) DO (
    IF "%%L"=="---" (
        ECHO.
        ECHO  ============================================================
        ECHO  [SPACE] Next slide  [Q] Quit
        PAUSE > NUL
        CLS
        ECHO.
        ECHO  ============================================================
        ECHO.
    ) ELSE (
        ECHO    %%L
    )
)

ECHO.
ECHO  ============================================================
ECHO    End of presentation. Press any key to exit.
PAUSE > NUL
GOTO END

:NOFILE
CLS
ECHO  LibreNT Impress - No slide file found.
ECHO  Usage:  IMPRESS MYSLIDES.IMP
ECHO  Slide file format: text lines, separate slides with ---
PAUSE

:END
ENDLOCAL

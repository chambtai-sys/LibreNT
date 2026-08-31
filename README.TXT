LibreNT Office Suite 1.0
=========================
A free, open-source office suite for Windows NT 4.0.
https://github.com/chambtai-sys/LibreNT

SYSTEM REQUIREMENTS
-------------------
  - Windows NT 4.0 (or Windows 95/98)
  - 8 MB RAM minimum
  - 1 MB disk space
  - QBASIC.EXE for LibreNT Calc (see below)

COMPONENTS
----------
  OFFICE.BAT    Main menu launcher
  CALC.BAS      Spreadsheet (18 rows x 8 cols, CSV export)
  IMPRESS.BAT   Text slideshow viewer
  Writer        WordPad (built into NT 4.0)
  Notes         Notepad (built into NT 4.0)
  INSTALL.BAT   Installer

INSTALLATION (MS-DOS Prompt)
-----------------------------
  1. Open MS-DOS Prompt
       Start > Programs > MS-DOS Prompt
  2. Navigate to the LibreNT folder:
       CD C:\DOWNLOADS\LIBRENT
     or from floppy:
       CD A:\LIBRENT
  3. Run the installer:
       INSTALL
  4. Launch LibreNT:
       CD C:\LIBRENT
       OFFICE

QBASIC SETUP (for LibreNT Calc)
---------------------------------
  QBASIC.EXE is not included.
  Get it from:
    - MS-DOS 6.x disk          -> QBASIC.EXE
    - Windows 95/98 CD         -> \OTHER\OLDMSDOS\QBASIC.EXE
    - NT 4.0 CD (some eds.)    -> \SUPPORT\DEBUG\QBASIC.EXE
  Copy to C:\LIBRENT\ and Calc will find it automatically.

LICENSE
-------
  MIT License. Free to use, modify, and distribute.

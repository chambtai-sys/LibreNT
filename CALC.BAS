' ============================================================
' LibreNT Calc v1.0
' QBASIC Spreadsheet for Windows NT 4.0
' (c) LibreNT Project - MIT License
' ============================================================

DEFINT A-Z
CONST MAXROW = 18
CONST MAXCOL = 8

DIM cell$(MAXROW, MAXCOL)
DIM curR AS INTEGER, curC AS INTEGER, quit AS INTEGER
curR = 1: curC = 1: quit = 0

COLOR 15, 1
CLS

DO WHILE quit = 0
    GOSUB DrawSheet
    GOSUB GetKey
LOOP

COLOR 7, 0: CLS
PRINT "LibreNT Calc closed."
END

' ---- Draw sheet ----------------------------------------
DrawSheet:
    CLS
    ' Title bar
    COLOR 0, 7
    LOCATE 1, 1: PRINT SPACE$(80);
    LOCATE 1, 1
    PRINT " LibreNT Calc 1.0   F1=Help  Arrows=Move  Enter=Edit  Ctrl+S=Save  Esc=Quit";

    ' Column header row
    COLOR 14, 1
    LOCATE 2, 4
    FOR c = 1 TO MAXCOL
        h$ = CHR$(64 + c)
        PRINT h$; SPACE$(9);
    NEXT c

    ' Data rows
    FOR r = 1 TO MAXROW
        IF r = curR THEN COLOR 14, 4 ELSE COLOR 11, 1
        LOCATE r + 2, 1
        PRINT USING "##  "; r;

        FOR c = 1 TO MAXCOL
            IF r = curR AND c = curC THEN
                COLOR 0, 14
            ELSEIF r = curR THEN
                COLOR 15, 4
            ELSE
                COLOR 15, 1
            END IF
            txt$ = LEFT$(cell$(r, c) + SPACE$(10), 10)
            PRINT txt$;
        NEXT c
    NEXT r

    ' Formula / status bar
    COLOR 0, 7
    LOCATE 22, 1: PRINT SPACE$(80);
    LOCATE 22, 1
    addr$ = CHR$(64 + curC) + LTRIM$(STR$(curR))
    PRINT " Cell " + addr$ + ":  " + cell$(curR, curC);

    COLOR 15, 1
    RETURN

' ---- Key handler ----------------------------------------
GetKey:
    DO: k$ = INKEY$: LOOP WHILE k$ = ""
    SELECT CASE k$
        CASE CHR$(27):            quit = 1
        CASE CHR$(13):            GOSUB EditCell
        CASE CHR$(46):            cell$(curR, curC) = ""
        CASE CHR$(9)
            curC = curC + 1
            IF curC > MAXCOL THEN curC = 1: IF curR < MAXROW THEN curR = curR + 1
        CASE CHR$(0) + CHR$(72):  IF curR > 1 THEN curR = curR - 1
        CASE CHR$(0) + CHR$(80):  IF curR < MAXROW THEN curR = curR + 1
        CASE CHR$(0) + CHR$(75):  IF curC > 1 THEN curC = curC - 1
        CASE CHR$(0) + CHR$(77):  IF curC < MAXCOL THEN curC = curC + 1
        CASE CHR$(0) + CHR$(59):  GOSUB ShowHelp
        CASE CHR$(19):            GOSUB SaveCSV
        CASE CHR$(14):            GOSUB NewSheet
    END SELECT
    RETURN

' ---- Edit a cell ----------------------------------------
EditCell:
    LOCATE 22, 1: COLOR 0, 14: PRINT SPACE$(80);
    LOCATE 22, 1
    PRINT " " + CHR$(64 + curC) + LTRIM$(STR$(curR)) + " > ";
    COLOR 15, 0
    LINE INPUT "", v$
    cell$(curR, curC) = v$
    RETURN

' ---- Save to CSV ----------------------------------------
SaveCSV:
    LOCATE 22, 1: COLOR 0, 11: PRINT SPACE$(80);
    LOCATE 22, 1: PRINT " Filename (e.g. DATA.CSV): ";
    COLOR 15, 0: LINE INPUT "", fn$
    IF fn$ = "" THEN fn$ = "SHEET.CSV"

    OPEN fn$ FOR OUTPUT AS #1
    FOR r = 1 TO MAXROW
        FOR c = 1 TO MAXCOL
            IF c > 1 THEN PRINT #1, ",";
            PRINT #1, cell$(r, c);
        NEXT c
        PRINT #1, ""
    NEXT r
    CLOSE #1

    LOCATE 22, 1: COLOR 0, 10: PRINT SPACE$(80);
    LOCATE 22, 1: PRINT " Saved as " + fn$ + "  Press any key...";
    k$ = INPUT$(1)
    RETURN

' ---- Clear sheet ----------------------------------------
NewSheet:
    FOR r = 1 TO MAXROW
        FOR c = 1 TO MAXCOL
            cell$(r, c) = ""
        NEXT c
    NEXT r
    curR = 1: curC = 1
    RETURN

' ---- Help screen ----------------------------------------
ShowHelp:
    CLS
    COLOR 14, 1
    PRINT
    PRINT "  LibreNT Calc - Help"
    PRINT "  ==================="
    PRINT
    COLOR 15, 1
    PRINT "  Arrow keys    Navigate cells"
    PRINT "  Enter         Edit current cell"
    PRINT "  Tab           Move right (wraps to next row)"
    PRINT "  Delete (.)    Clear current cell"
    PRINT "  Ctrl+S        Save spreadsheet to CSV"
    PRINT "  Ctrl+N        New blank sheet"
    PRINT "  F1            This help screen"
    PRINT "  ESC           Quit to menu"
    PRINT
    PRINT "  Cells are plain text. Type numbers or labels freely."
    PRINT
    COLOR 11, 1
    PRINT "  Press any key to return..."
    COLOR 15, 1
    k$ = INPUT$(1)
    RETURN

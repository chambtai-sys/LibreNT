# LibreNT Office Suite 1.0

> A free, open-source office suite for **Windows NT 4.0** — no internet, no installers, just batch files and QBasic.

---

## Components

| App | Tech | What it does |
|-----|------|-------------|
| **Writer** | WordPad (built-in) | Full word processor, RTF / DOC support |
| **Calc** | QBasic | 18x8 grid spreadsheet with CSV export |
| **Notes** | Notepad (built-in) | Quick text notes |
| **Impress** | Batch script | Text-mode slideshow viewer (.IMP files) |

---

## Installation via MS-DOS Prompt

```
1. Open MS-DOS Prompt
   Start > Programs > MS-DOS Prompt

2. Navigate to the LibreNT folder:
   CD C:\DOWNLOADS\LIBRENT
   (or from floppy: CD A:\LIBRENT)

3. Run the installer:
   INSTALL

4. Launch at any time:
   CD C:\LIBRENT
   OFFICE
```

---

## Getting QBASIC.EXE (required for Calc)

QBASIC.EXE is not bundled for licensing reasons. Get it from:

- **MS-DOS 6.x disk** -> `QBASIC.EXE`
- **Windows 95/98 CD** -> `\OTHER\OLDMSDOS\QBASIC.EXE`
- **NT 4.0 CD (some editions)** -> `\SUPPORT\DEBUG\QBASIC.EXE`

Copy it to `C:\LIBRENT\` — Calc will find it automatically.

---

## LibreNT Calc Keys

| Key | Action |
|-----|--------|
| Arrow keys | Navigate cells |
| Enter | Edit cell |
| Tab | Move right / wrap |
| `.` (period) | Clear cell |
| Ctrl+S | Save as CSV |
| Ctrl+N | New blank sheet |
| F1 | Help |
| ESC | Quit to menu |

---

## Requirements

- Windows NT 4.0 (also works on Windows 95/98)
- 8 MB RAM, 1 MB disk
- `QBASIC.EXE` for Calc

---

## License

MIT — free to use, share, and modify.

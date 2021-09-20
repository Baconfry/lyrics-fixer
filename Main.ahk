;====================Compiler directives====================;
;@Ahk2Exe-SetName Lyrics Fixer
;@Ahk2Exe-SetMainIcon Main.ico
;@Ahk2Exe-SetCopyright Copyright @ Baconfry 2021
;@Ahk2Exe-SetCompanyName Furaico
;@Ahk2Exe-SetVersion 1.0.0.0
;===========================================================;

#NoEnv                                          ; Needed for blazing fast performance
#SingleInstance Off                             ; Allows multiple instances of the script to run
SetBatchLines, -1
; This code appears only in the compiled script
/*@Ahk2Exe-Keep
#NoTrayIcon
ListLines Off                                   ; Turns off logging script actions for improved performance
#KeyHistory 0                                   ; Turns off loggins keystrokes for improved performance
*/

APP_VERSION := "Lyrics Fixer"

Gui, New,, % APP_VERSION
Gui, Font, s11, Segoe UI
Gui, Add, Edit, vLyricsField h300 w500
Gui, Add, Button, gSubmitGui w100, Fix Lyrics
Gui, Add, Button, vCopyButton gCopyLyrics w150 x+10, Copy to Clipboard
Gui, Show

return

SubmitGui:
    Gui, Submit, NoHide
    ; Capitalize:
    ; First letter of every line (if the first character if a letter)
    ; First letter after parenthesis, apostrophe, quotation (only if these symbols are the first in every line)
    revisedLyrics := RegExReplace(LyricsField, "m)^\w|^((""|\(|')?\K\w)|\n\K\w|\n((""|\(|')?\K\w)|((?:\.|:)\s+\K\w)|", "$U0")
    ; Replace multiple trailing spaces with single spaces
    while (InStr(revisedLyrics, "  "))
    {
        revisedLyrics := StrReplace(revisedLyrics, "  ", " ")
    }
    ; Delete spaces if they're at the end of a line
    revisedLyrics := StrReplace(revisedLyrics, " `n", "`n")
    GuiControl,, LyricsField, % revisedLyrics
return

CopyLyrics:
    Gui, Submit, NoHide
    Clipboard := LyricsField
    GuiControl,, CopyButton, % "Copied!"
    Sleep, 1000
    GuiControl,, CopyButton, % "Copy to Clipboard"
return

GuiClose:
ExitApp
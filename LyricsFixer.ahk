#Requires AutoHotkey v2.0

;====================Compiler directives====================;
;@Ahk2Exe-SetName Lyrics Fixer
;@Ahk2Exe-SetMainIcon LyricsFixer.ico
;@Ahk2Exe-SetDescription Lyrics Fixer
;@Ahk2Exe-SetCopyright Copyright @ Baconfry 2021-2023
;@Ahk2Exe-SetVersion 2.0.0.0
;===========================================================;
; Global variables
APP_NAME        := "Lyrics Fixer"
, APP_VERSION   := "2.0.0.0"
, APP_DEBUG     := 1
; This code appears only in the compiled script
/*@Ahk2Exe-Keep
#NoTrayIcon
ListLines 0
*/

; Allow multiple instances of the app
#SingleInstance Off

mainGui := Gui("+Resize +MinSize280x140", APP_NAME)
    mainGui.SetFont("s11", "Segoe UI")
oLyricsField := mainGui.AddEdit("x10 y10 w500 h300")
oFixLyrics := mainGui.AddButton("x10 y+5 w100 h35", "Fix Lyrics")
    oFixLyrics.OnEvent("Click", FixLyrics)
oCopyLyrics := mainGui.AddButton("x+10 yp+0 w150 h35", "Copy to Clipboard")
    oCopyLyrics.OnEvent("Click", CopyLyrics)
    mainGui.OnEvent("Size", OnResize)
    mainGui.Show("w520 h360")

if (APP_DEBUG)
{
    oLyricsField.Value := "`n`n`n`n"
        . "lorem ipsum dolor sit amet, consectetur              adipiscing elit.`n"
        . "(enean nec pellentesque odio, quis semper eros.)`n"
        . "`"uspendisse nec commodo arcu.`"`n`n`n"
        . "'integer nibh libero, eleifend in ipsum vitae, convallis laoreet arcu.'`n"
        . "etiam. viverra? quis.                       orci. non. lacinia.`n`n`n"
}

FixLyrics(*)
{
    ; Remove:
    ; (1) The very first whitespaces (before the first character)
    ; (2) Trailing whitespaces at the very end
    revisedLyrics := RegExReplace(oLyricsField.Value, "^\s+", "")                   ; (1)
    revisedLyrics := RegExReplace(revisedLyrics, "\s+$", "")                        ; (2)

    ; Replace:
    ; (3) Multiple trailing spaces with single spaces
    ; (4) Multiple trailing line feeds with single line breaks
    revisedLyrics := RegExReplace(revisedLyrics, " +", " ")                         ; (3)
    ; Three line feeds are written instead of two because the author of the lyrics may
    ; have intended to seperate the two groups into paragraphs (give that extra free line)
    while InStr(revisedLyrics, "`n`n`n") {
        revisedLyrics := StrReplace(revisedLyrics, "`n`n`n", "`n`n")                ; (4)
    }

    ; Capitalize:
    ; (5) The first letter of every line (if the first character if a letter)
    ; (6) The first letter after a parenthesis, apostrophe, or a quotation mark
    ;       (only if these symbols are the first in every line)
    ; (7) The next letter after a question mark or a period (followed by a space)
    revisedLyrics := RegExReplace(revisedLyrics, "m)^\w", "$U0")                    ; (5)
    revisedLyrics := RegExReplace(revisedLyrics, "m)(^\(\w)|(^'\w)|(^`"\w)", "$U0") ; (6)
    revisedLyrics := RegExReplace(revisedLyrics, "(\?\s\w)|(\.\s\w)", "$U0")        ; (7)
    
    oLyricsField.Value := revisedLyrics
}

CopyLyrics(*)
{
    A_Clipboard := oLyricsField.Text
    oCopyLyrics.Text := "Copied!"
    Sleep 1000
    oCopyLyrics.Text := "Copy to Clipboard"
}

OnResize(guiObj, minMax, newWidth, newHeight)
{
    if (minMax = -1)    ; Window is minimized
        return

    oLyricsField.Move(10, 10, newWidth - 20, newHeight - 60)
    oLyricsField.GetPos(, &lyricsFieldY,, &lyricsFieldH)

    buttonsY := lyricsFieldY + lyricsFieldH + 5
    oFixLyrics.Move(10, buttonsY)
    oCopyLyrics.Move(120, buttonsY)
}
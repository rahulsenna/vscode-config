#NoEnv
SendMode Input
SetTitleMatchMode, 2   ; Match part of window title / class if needed

; ------------------------------------------------------------------
; SpaceFN mode flag (like Karabiner variable "spacefn_mode")
; ------------------------------------------------------------------
spacefn_mode := 0

; ------------------------------------------------------------------
; Context: only active in code editors (VSCode, Sublime, etc.)
; Adjust WinTitle / ahk_exe to your setup.
; ------------------------------------------------------------------
#IfWinActive ahk_exe Code.exe              ; VSCode
#IfWinActive ahk_exe Code - Insiders.exe   ; VSCode Insiders
#IfWinActive ahk_exe sublime_text.exe      ; Sublime Text
; (You can also use class or window title instead.)

; ------------------------------------------------------------------
; SpaceFN main hotkey
; ------------------------------------------------------------------

; When space is pressed
~Space::
    KeyWait, Space, T0.3          ; 300 ms "alone vs held" timeout
    if ErrorLevel {
        ; Held down: enter SpaceFN mode and send F19 down
        spacefn_mode := 1
        Send, {F19 Down}
        ; Wait for key up to finish
        KeyWait, Space
        spacefn_mode := 0
        Send, {F19 Up}
    } else {
        ; Tapped (alone): send space then Ctrl+F19 (like to_if_alone)
        Send, {Space}
        Send, ^{F19}
    }
return

#If  ; end context

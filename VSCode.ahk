#IfWinActive ahk_exe Code.exe
#NoEnv
SetBatchLines -1
Process,Priority,,R
ListLines, Off


;--------------------------------------
; Disable Shift Insert
~*$Shift::
if (GetKeyState("Shift", "P"))
{
    Send {f15}
    KeyWait Shift
}
Return
;--------------------------------------



;~*$Shift::
;Send {f15}
;return


~*$Shift Up::
Send {f15}
return

F21::shift


~*$s Up::
Send {f16}
return

~*$d Up::
Send {f17}
return

~*$f Up::
Send {f18}
return

~*$g Up::
Send {f19}
return

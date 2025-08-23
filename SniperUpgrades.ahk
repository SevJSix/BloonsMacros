#SingleInstance Force
CoordMode "Mouse", "Window"

F2::
{
    if !WinExist("Bloons TD 5") {
        MsgBox "Bloons TD 5 window not found!"
        return
    }
    
    WinActivate "Bloons TD 5"
    WinWaitActive "Bloons TD 5"
    
    Send ",,,,{Sleep 50}"
    
    ; 50/50 chance for period
    if (Random(0, 1)) {
        Send "."
        Sleep 25
    }
    
    ControlClick "x233 y640", "Bloons TD 5",, "Left"
}

Esc::ExitApp
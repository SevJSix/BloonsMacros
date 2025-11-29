#Requires AutoHotkey v2.0

roundButtonX := 1989
roundButtonY := 1219

global gameWindow := "Bloons TD5"
global macroRunning := false ; initially set this to false

checkRound() {
    if (!macroRunning OR !WinActive("Bloons TD5")) {
        return
    }

    WinActivate("Bloons TD5")

    color := PixelGetColor(roundButtonX, roundButtonY)
    if (color != 0xFFFFFF) {
        ControlClick("x" . roundButtonX . " y" . roundButtonY, gameWindow, , "Left", 1)
    }
}

SetTimer(checkRound, 1000)


F3:: {
    global macroRunning := !macroRunning
    TrayTip(macroRunning ? "Macro is now running." : "Macro stopped.", "Sniper Stall")
    SetTimer(TrayTip, -3000)
}
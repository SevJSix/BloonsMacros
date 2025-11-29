#Requires AutoHotkey v2.0

roundButtonX := 1994
roundButtonY := 1218

; Sniper variables
ninja := [800, 883]
firstSniper := [900, 883]
secondSniper := [1000, 883]
thirdSniper := [1100, 883]
changeTarget := [1050, 1325]

global gameWindow := "Bloons TD5"
global macroRunning := false ; initially set this to false

executeStall() {
    if (!macroRunning OR !WinActive("Bloons TD5")) {
        return
    }

    color := PixelGetColor(roundButtonX, roundButtonY)
    disableFastForward()
    if (color = 0x000103) {
        Sleep 50
        ControlClick("x" . roundButtonX " y" . roundButtonY, gameWindow)
        Sleep 500
        buildStallSetup()
    }
}

disableFastForward() {
    color := PixelGetColor(roundButtonX, roundButtonY)
    if (color = 0xFFFFFF) { ; check if round is in fast forward
        ControlClick("x" . roundButtonX " y" . roundButtonY, gameWindow)
    }
}

buildStallSetup() {
    sellTower(ninja[1], ninja[2])
    Sleep 100
    sellTower(firstSniper[1], firstSniper[2])
    Sleep 100
    sellTower(secondSniper[1], secondSniper[2])
    Sleep 100
    sellTower(thirdSniper[1], thirdSniper[2])
    Sleep 200
    placeNinja(ninja[1], ninja[2])
    Sleep 100
    useAbility(1)
    Sleep 50
    placeDelay := Random(260, 290)
    placeSniper(firstSniper[1], firstSniper[2], true)
    Sleep(placeDelay)
    placeSniper(secondSniper[1], secondSniper[2], true)
    Sleep(placeDelay)
    placeSniper(thirdSniper[1], thirdSniper[2], true)
}

useAbility(index) {
    ControlSend(index,, gameWindow)
}

sellTower(x, y) {
    ControlClick("x" . x " y" . y, gameWindow)
    Sleep 100
    ControlSend("{BackSpace}",, gameWindow)
}

placeNinja(x, y) {
    ControlSend("t",, gameWindow)
    Sleep 50
    ControlClick("x" . x " y" . y, gameWindow)
    Sleep 50
    Loop 4 {
        Send "."
        Sleep 40
    }
    Sleep 50
}

placeSniper(x, y, doTargetChange) {
    ControlSend("e",, gameWindow)
    Sleep 50
    ControlClick("x" . x " y" . y, gameWindow)
    Sleep 50
    Loop 4 {
        Send ","
        Sleep 40
    }
    Send "."
    Sleep 50
    if (doTargetChange) {
        ControlClick("x" . changeTarget[1] . " y" . changeTarget[2], gameWindow)
    }
}

SetTimer(executeStall, 1000)

F3:: {
    global macroRunning := !macroRunning
    TrayTip(macroRunning ? "Macro is now running." : "Macro stopped.", "Sniper Stall", "Iconi")
    SetTimer(TrayTip, -3000)
}
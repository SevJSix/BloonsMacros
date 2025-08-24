#Requires AutoHotkey v2.0

stackTemple()
{
    global gameWindow := "Bloons TD5"

    if WinExist(gameWindow) {
        WinActivate gameWindow

        wizardCoordinates := [
            [1578, 32],
            [1574, 88],
            [1572, 147]
        ]

        iceCoordinates := [
            [1570, 204],
            [1570, 269],
            [1571, 335]
        ]

        cannonCoordinates := [
            [1633, 335],
            [1634, 258],
            [1636, 180],
            [1637, 105],
            [1707, 324],
            [1707, 238]
        ]

        glueCoordinates := [
            [1777, 325],
            [1773, 258],
            [1803, 200]
        ]

        techTerror := [1715, 45]
        temple := [1794, 1018]
        movePosition := [1743, 145]
        finalPosition := [1428, 621]
        sacrificeButton := [1543, 898]
        firstHeli := [843, 989]
        firstHeliLIP := [549, 881]
        secondHeli := [981, 998]
        secondHeliLIP := [560, 756]
        changeHeliTarget := [1053, 1325]

        ; Place First Heli
        Send "j"
        Sleep 50
        MouseMove(firstHeli[1], firstHeli[2])
        Sleep 50
        Click "Left"
        Sleep 50
        upgrade24()
        Sleep 50
        MouseMove(changeHeliTarget[1], changeHeliTarget[2])
        Sleep 50
        Click "Left"
        Sleep 50
        MouseMove(firstHeliLIP[1], firstHeliLIP[2])
        Sleep 50
        Click "Left"
        Sleep 50

        ; Place Second Heli
        Send "j"
        Sleep 50
        MouseMove(secondHeli[1], secondHeli[2])
        Sleep 50
        Click "Left"
        Sleep 50
        upgrade24()
        Sleep 50
        MouseMove(changeHeliTarget[1], changeHeliTarget[2])
        Sleep 50
        Click "Left"
        Sleep 50
        MouseMove(secondHeliLIP[1], secondHeliLIP[2])
        Sleep 50
        Click "Left"
        Sleep 50

        ; Place Wizards
        for wizard in wizardCoordinates {
            Send "h"
            Sleep 100
            MouseMove(wizard[1], wizard[2])
            Sleep 50
            Click "Left"
            Sleep 50
            upgrade42()
        }

        Sleep 50

        ; Place Ice Towers
        for ice in iceCoordinates {
            Send "a"
            Sleep 100
            MouseMove(ice[1], ice[2])
            Sleep 50
            Click "Left"
            Sleep 50
            upgrade42()
        }

        Sleep 50

        ; Place Cannons
        for cannon in cannonCoordinates {
            Send "y"
            Sleep 100
            MouseMove(cannon[1], cannon[2])
            Sleep 50
            Click "Left"
            Sleep 50
            upgrade42()
        }

        Sleep 50

        ; Place Glue Gunners
        for glue in glueCoordinates {
            Send "s"
            Sleep 100
            MouseMove(glue[1], glue[2])
            Sleep 50
            Click "Left"
            Sleep 50
            upgrade42()
        }

        Sleep 50

        ; Tech Terror
        Send "g"
        Sleep 100
        MouseMove(techTerror[1], techTerror[2])
        Sleep 50
        Click "Left"
        Sleep 50
        upgrade24()
        Sleep 50

        ; Temple Supermonkey
        Send "g"
        Sleep 100
        MouseMove(temple[1], temple[2], 2)
        Sleep 50
        Click "Left"
        Sleep 50

        ; Only upgrade 3-2 first
        Loop 3 {
            Send ","
            Sleep 40
        }

        Loop 2 {
            Send "."
            Sleep 40
        }

        Sleep 100

        ; Activate First Heli Ability
        Send "2"
        MouseClickDrag("Left", temple[1], temple[2], movePosition[1], movePosition[2])
        Sleep 100

        ; Activate Second Heli Ability
        Send "2"
        MouseMove(temple[1], temple[2])
        Sleep 50
        SendInput("{LButton down}")
        Sleep 100
        MouseMove(1775, 960, 100)
        Sleep 2772 ; Wait for the heli to come close by the sun god
        Send "{Escape}"
        Sleep 1000 ; Wait a small time for the menu to show up
        MouseMove(finalPosition[1], finalPosition[2])
        Sleep 50
        SendInput("{LButton up}")
        MouseMove(704, 480, 2)
        Sleep 50
        Click "Left"

        ; Sacrifice Temple
        Sleep 3100 ; Wait for the heli to place the sun god in position
        MouseMove(movePosition[1], movePosition[2])
        Sleep 50
        Click "Left"
        Sleep 50
        Send ","
        Sleep 680 ; Wait a short time for the sacrifice button to appear and be clickable
        MouseMove(sacrificeButton[1], sacrificeButton[2])
        Sleep 50
        Click "Left"
        Sleep 50

        ; Sell Helis
        Sleep 2500
        MouseMove(firstHeli[1], firstHeli[2])
        Sleep 150
        Click "Left"
        Sleep 150
        Send "{Backspace}"
        Sleep 300
        MouseMove(secondHeli[1], secondHeli[2])
        Sleep 150
        Click "Left"
        Sleep 150
        Send "{Backspace}"

        Sleep 300

    } else {
        MsgBox("Bloons TD 5 window is currently closed")
    }
}

upgrade42() {
    Loop 4 {
        Send ","
        Sleep 50
    }

    Loop 2 {
        Send "."
        Sleep 50
    }
}

upgrade24() {
    Loop 4 {
        Send "."
        Sleep 50
    }

    Loop 2 {
        Send ","
        Sleep 50
    }
}

F1::
{
    while True {
        stackTemple()
    }
}

F2::ExitApp
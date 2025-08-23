#Requires AutoHotkey v2.0

; AutoHotkey v2.0 script for placing Super Monkeys in Bloons TD 5
; Press F1 to execute the placement sequence once

F1::
{
    ; Check if Bloons TD 5 window exists and activate it
    if WinExist("Bloons TD 5")
    {
        WinActivate("Bloons TD 5")
        Sleep(100) ; Brief pause to ensure window is active
        
        ; Define the coordinates for Super Monkey placement
        coordinates := [
            [19, 551],
            [19, 410],
            [147, 477],
            [19, 69],
            [19, 233],
            [133, 151],
            [681, 551],
            [540, 551],
            [399, 551],
            [681, 410],
            [681, 210],
            [681, 69],
            [540, 69],
            [399, 69],
            [540, 410],
            [540, 210]
        ]
        
        ; Place Super Monkeys at each coordinate
        for coord in coordinates
        {
            ; Press "g" to select Super Monkey
            Send "g"
            Sleep(100) ; Small delay to ensure key is processed
            
            ; Move mouse to the coordinate
            MouseMove(coord[1], coord[2], 2) ; Speed 2 for smooth movement
            Sleep(50) ; Brief pause for positioning
            
            ; Click to place the Super Monkey
            Click("Left")
            Sleep(200) ; Delay before next placement
        }
        
        MsgBox("Super Monkey placement complete! " . coordinates.Length . " monkeys placed.")
    }
    else
    {
        MsgBox("Bloons TD 5 window not found!")
    }
}

; Press Esc to exit the script
Esc::ExitApp()
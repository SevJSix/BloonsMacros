#Requires AutoHotkey v2.0

; Global variable to track if the loop is running
isRunning := false

F2::
{
    ; Declare global variable within function
    global isRunning
    
    ; Toggle the running state for F2 sequence
    isRunning := !isRunning
    
    if (isRunning)
    {
        ; Check if Bloons TD 5 window exists
        if WinExist("Bloons TD 5")
        {
            
            SetTimer(spikeStormsAndRoundStart, 50000)
            SetTimer(saboAndCTA, 65000)

            ; Also perform the first sequence
            spikeStormsAndRoundStart()
            saboAndCTA()
            
        }
        else
        {
            MsgBox("Bloons TD 5 window not found!")
            isRunning := false
        }
    }
    else
    {
        ; Stop the timer when toggled off
        SetTimer(saboAndCTA, 0)
        SetTimer(spikeStormsAndRoundStart, 0)
    }
}

spikeStormsAndRoundStart()
{

    global isRunning
    
    ; If not running, exit the function
    if (!isRunning)
        return
    
    ; Check if window still exists
    if WinExist("Bloons TD 5")
    {
        ; Toggle Round
        ControlClick("x" . 737 . " y" . 534, "Bloons TD 5", , "Left", 1)
        Sleep 1500

        ; Spike Storm
        ControlClick("x" . 50 . " y" . 550, "Bloons TD 5", , "Left", 25)
        Sleep 400

        ; Toggle Round
        ControlClick("x" . 737 . " y" . 534, "Bloons TD 5", , "Left", 1)
        Sleep 1500

        ; Click in the river to deselect
        ControlClick("x" . 227 . " y" . 543, "Bloons TD 5", , "Left", 1)
        Sleep 150
    }
    else
    {
        ; Stop if window no longer exists
        isRunning := false
        SetTimer(spikeStormsAndRoundStart, 0)
        MsgBox("Bloons TD 5 window closed. Stopping F2 sequence.")
    }
}

saboAndCTA()
{

    global isRunning
    
    ; If not running, exit the function
    if (!isRunning)
        return
    
    ; Check if window still exists
    if WinExist("Bloons TD 5")
    {

        ; Sabo
        ControlClick("x" . 17 . " y" . 550, "Bloons TD 5", , "Left", 1)

        ; Wait for 100ms
        Sleep 100

        ; CTA
        ControlClick("x" . 83 . " y" . 550, "Bloons TD 5", , "Left", 1)

        ; Click in the river to deselect
        ControlClick("x" . 227 . " y" . 543, "Bloons TD 5", , "Left", 1)
        Sleep 150
    }
    else
    {
        ; Stop if window no longer exists
        isRunning := false
        SetTimer(saboAndCTA, 0)
        MsgBox("Bloons TD 5 window closed. Stopping F2 sequence.")
    }
}

; Press Esc to exit the script
Esc::ExitApp()
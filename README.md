#AHKXbox360Lib: OOP Library of Xbox360 Controller for AHK

## Usage:

```ahk
;Include the Library
#Include path/to/XBOX360.ahk

;Instance the Controller Manager
manager := new Xbox360LibControllerManager()

;Initialize Controller (0-3), you can use 4 controllers
player1 := manager.InitializeController(0)


;Make something useful
Loop {

;Update state of controller
    player1.update()

    if (player1.GUIDE) {
        ToolTip, Player One Press Guide
    }

    if (player1.BACK) {
        ToolTip, Player One Press Back
    }

    if (player1.START) {
        ToolTip, Player One Press Start
    }

    if (player1.UP) {
        ToolTip, Player One Press Up
    }

    if (player1.DOWN) {
        ToolTip, Player One Press Down
    }

    if (player1.LEFT) {
        ToolTip, Player One Press Left
    }

    if (player1.RIGHT) {
        ToolTip, Player One Press Right
    }

    if (player1.A) {
        ToolTip, Player One Press A
    }

    if (player1.B) {
        ToolTip, Player One Press B
    }

    if (player1.X) {
        ToolTip, Player One Press X
    }

    if (player1.LB) {
        ToolTip, Player One Press LB
    }

    if (player1.RB) {
        ToolTip, Player One Press RB
    }

    if (value := player1.LT) {
        ToolTip, Player One Press LT, Analog Value : %value% (0-255)
    }

    if (value := player1.RT) {
        ToolTip, Player One Press RT, Analog Value : %value% (0-255)
    }

;Left Stick
    if (player1.LS) {
        ToolTip, Player One Press LS
    }

;Right Stick
    if (player1.RS) {
        ToolTip, Player One Press RS
    }

;Left Stick X Movement
    if (value := player1.LSX) {
	asDigital := player1.LSX > 0 ? "Right" : "Left"
        ToolTip, Player One Move Left Sick In X Axis, Analog Value : %value%, Digital: %asDigital%
    }

;Left Stick Y Movement
    if (value := player1.LSY) {
        asDigital := player1.LSY > 0 ? "Up" : "Down"
        ToolTip, Player One Move Left Sick In Y Axis, Analog Value : %value%, Digital: %asDigital%
    }

;Right Stick X(Left/Right) Movement
    if (value := player1.RSX) {
        asDigital := player1.RSX > 0 ? "Right" : "Left"
        ToolTip, Player One Move Right Sick In X Axis, Analog Value : %value%, Digital: %asDigital%
    }

;Right Stick Y(Left/Right) Movement
    if (value := player1.RSY) {
        asDigital := player1.RSY > 0 ? "Up" : "Down"
        ToolTip, Player One Move Right Sick In Y Axis, Analog Value : %value%, Digital: %asDigital%
    }

    Sleep 5
}
```

See [examples/debug.ahk](examples/debug.ahk) for a detailed example.

#AHKXbox360Lib: OOP Library of Xbox360 Controller for AHK

## Usage:

```ahk
;Include the Library
#Include path/to/XBOX360.ahk

;Instance the Controller Manager
manager := new Xbox360LibControllerManager()

;Initialize Controller (0-3), can be four controllers
player1 := manager.InitializeController(0)


;Make something useful
Loop {

    if (player1.UP) {
        ToolTip, UP
    }

    if(player1.DOWN) {
        ToolTip, DOWN
    }

    Sleep 5
}
```



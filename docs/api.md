#Xbox360Lib API

```
Xbox360LibXInput
    Methods:
        + GetState ( index : UInt,  out stateOutAddress : UPtr) : Int
        + GetKeystroke ( index : UInt,  out keystoreOutAddress : UPtr) : Int
        + GetBatteryInformation ( index : UInt, type: UChar, out keystoreOutAddress : UPtr) : Int
    
Xbox360LibController
    Attributes:
        + GUIDE : Bool
        + BACK : Bool
        + START : Bool
        + LEFT : Bool
        + RIGHT : Bool
        + UP : Bool
        + DOWN : Bool
        + LEFT : Bool
        + RIGHT : Bool
        + A : Bool
        + B : Bool
        + X : Bool
        + Y : Bool
        + LB : Bool
        + RB : Bool
        + LS : Bool
        + RS : Bool
        + LT : Int (0 - 255)
        + RT : Int (0 - 255)
        + LSX : Int (-32768 - 32767)
        + RSX : Int (-32768 - 32767)
    Methods:
        + __New ( index : Int, xinput : Xbox360LibXInput)
        + Update ()
        + IsConnected : Bool

        
Xbox360LibControllerManager
    Methods:
        initializeController ( index: int ) : Xbox360LibController

Xbox360Lib.Enum.Buttons
    Attributes
        + GUIDE : Int
        + BACK : Int
        + START : Int
        + LEFT : Int
        + RIGHT : Int
        + UP : Int
        + DOWN : Int
        + LEFT : Int
        + RIGHT : Int
        + A : Int
        + B : Int
        + X : Int
        + Y : Int
        + LB : Int
        + RB : Int
        + LS : Int
        + RS : Int
        + LT : Int
        + RT : Int
        + LSX : Int
        + RSX : Int

Xbox360Lib.Enum.Buttons
    Attributes
        + Xbox360Lib.Enum.Buttons.UP : Bitmask
        + Xbox360Lib.Enum.Buttons.DOWN : Bitmask
        + Xbox360Lib.Enum.Buttons.LEFT : Bitmask
        + Xbox360Lib.Enum.Buttons.RIGHT : Bitmask
        + Xbox360Lib.Enum.Buttons.START : Bitmask
        + Xbox360Lib.Enum.Buttons.BACK : Bitmask
        + Xbox360Lib.Enum.Buttons.LS : Bitmask
        + Xbox360Lib.Enum.Buttons.RS : Bitmask
        + Xbox360Lib.Enum.Buttons.LB : Bitmask
        + Xbox360Lib.Enum.Buttons.RB : Bitmask
        + Xbox360Lib.Enum.Buttons.GUIDE : Bitmask
        + Xbox360Lib.Enum.Buttons.A : Bitmask
        + Xbox360Lib.Enum.Buttons.B : Bitmask
        + Xbox360Lib.Enum.Buttons.X : Bitmask
        + Xbox360Lib.Enum.Buttons.Y : Bitmask
        
Xbox360Lib.Enum.XInputStateGamepad
    Attributes
        + Xbox360Lib.Enum.Buttons.LT : Object
        + Xbox360Lib.Enum.Buttons.RT : Object
        + Xbox360Lib.Enum.Buttons.LSX : Object
        + Xbox360Lib.Enum.Buttons.LSY : Object
        + Xbox360Lib.Enum.Buttons.RSX : Object
        + Xbox360Lib.Enum.Buttons.RSY : Object

Xbox360Lib.Enum.Threshold
    Attributes
        + Xbox360Lib.Enum.Buttons.LT : Int
        + Xbox360Lib.Enum.Buttons.RT : Int

Xbox360Lib.Enum.Deadzone
    Attributes
        + Xbox360Lib.Enum.Buttons.LSX : Int
        + Xbox360Lib.Enum.Buttons.LSY : Int
        + Xbox360Lib.Enum.Buttons.RSX : Int
        + Xbox360Lib.Enum.Buttons.RSY : Int
```        

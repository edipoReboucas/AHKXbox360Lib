Xbox360Lib := {}

Xbox360Lib.Enum := {}

Xbox360Lib.Enum.Buttons := {}
Xbox360Lib.Enum.Buttons.UP    := 1
Xbox360Lib.Enum.Buttons.DOWN  := 2
Xbox360Lib.Enum.Buttons.LEFT  := 3
Xbox360Lib.Enum.Buttons.RIGHT := 4
Xbox360Lib.Enum.Buttons.START := 5
Xbox360Lib.Enum.Buttons.BACK  := 6
Xbox360Lib.Enum.Buttons.GUIDE := 7
Xbox360Lib.Enum.Buttons.A     := 8
Xbox360Lib.Enum.Buttons.B     := 9
Xbox360Lib.Enum.Buttons.X     := 10
Xbox360Lib.Enum.Buttons.Y     := 11
Xbox360Lib.Enum.Buttons.LS    := 12
Xbox360Lib.Enum.Buttons.RS    := 13
Xbox360Lib.Enum.Buttons.LB    := 14
Xbox360Lib.Enum.Buttons.RB    := 15
Xbox360Lib.Enum.Buttons.LT    := 16
Xbox360Lib.Enum.Buttons.RT    := 17
Xbox360Lib.Enum.Buttons.LSX   := 18
Xbox360Lib.Enum.Buttons.LSY   := 29
Xbox360Lib.Enum.Buttons.RSX   := 20
Xbox360Lib.Enum.Buttons.RSY   := 21

Xbox360Lib.Enum.XInputStateButtons := {}
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.UP]    := 0x0001
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.DOWN]  := 0x0002
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.LEFT]  := 0x0004 
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.RIGHT] := 0x0008
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.START] := 0x0010
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.BACK]  := 0x0020
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.LS]    := 0x0040
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.RS]    := 0x0080
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.LB]    := 0x0100
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.RB]    := 0x0200
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.GUIDE] := 0x0400
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.A]     := 0x1000
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.B]     := 0x2000
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.X]     := 0x4000
Xbox360Lib.Enum.XInputStateButtons[Xbox360Lib.Enum.Buttons.Y]     := 0x8000

Xbox360Lib.Enum.XInputStateGamepad := {}
Xbox360Lib.Enum.XInputStateGamepad[Xbox360Lib.Enum.Buttons.LT]  := {code: 6,  type: "UChar"}
Xbox360Lib.Enum.XInputStateGamepad[Xbox360Lib.Enum.Buttons.RT]  := {code: 7,  type: "UChar"}
Xbox360Lib.Enum.XInputStateGamepad[Xbox360Lib.Enum.Buttons.LSX] := {code: 8,  type: "Short"}
Xbox360Lib.Enum.XInputStateGamepad[Xbox360Lib.Enum.Buttons.LSY] := {code: 10, type: "Short"}
Xbox360Lib.Enum.XInputStateGamepad[Xbox360Lib.Enum.Buttons.RSX] := {code: 12, type: "Short"}
Xbox360Lib.Enum.XInputStateGamepad[Xbox360Lib.Enum.Buttons.RSY] := {code: 14, type: "Short"}

Xbox360Lib.Enum.Threshold[Xbox360Lib.Enum.Buttons.LT] := 30
Xbox360Lib.Enum.Threshold[Xbox360Lib.Enum.Buttons.RT] := 30

Xbox360Lib.Enum.Deadzone[Xbox360Lib.Enum.Buttons.LSX] := 7849
Xbox360Lib.Enum.Deadzone[Xbox360Lib.Enum.Buttons.LSY] := 7849
Xbox360Lib.Enum.Deadzone[Xbox360Lib.Enum.Buttons.RSX] := 8689
Xbox360Lib.Enum.Deadzone[Xbox360Lib.Enum.Buttons.RSY] := 8689

Class Xbox360LibXInput {
	moduleAddress                :=
	getStateAddress              :=
	getKeystrokeAddress          :=
	getBatteryInformationAddress :=
	
	dllNames := ["Xinput1_4", "Xinput1_3", "Xinput_9_1_0"]
	
	__New() {
		this.LoadLibrary()
		this.getStateAddress              := DllCall("GetProcAddress" ,"UPtr", this.moduleAddress ,"UInt", 100, "UPtr")
		this.getKeystrokeAddress          := DllCall("GetProcAddress" ,"UPtr", this.moduleAddress ,"Str", "XInputGetKeystroke", "UPtr")
		this.getBatteryInformationAddress := DllCall("GetProcAddress" ,"UPtr", this.moduleAddress ,"Str", "XInputGetBatteryInformation", "UPtr")
	}
	
	__Delete() {
		DllCall("FreeLibrary", "UPtr", this.moduleAddress)
	}
	
	GetState(index, stateOutAddress) {
		return DllCall(this.getStateAddress, "UInt", index, "UPtr", stateOutAddress)
	}

	GetKeystroke(index, keystoreOutAddress) {
 		return DllCall(this.getKeystrokeAddress, "UInt", index, "UInt", 0, "UPtr", keystoreOutAddress)
	}

	GetBatteryInformation(index, type, batteryOutAddress) {
 		return DllCall(this.getBatteryInformationAddress, , "UInt", index, "UChar", type, "UPtr", batteryOutAddress)
	}
	
	LoadLibrary() {
		For key, dllname in this.dllNames
		{
			this.moduleAddress := DllCall("LoadLibrary", "Str", dllname, "UPtr")
			if(this.moduleAddress) {
				break
			}
		}
		
		if(!this.moduleAddress) {
			throw "not found xinput dll"
		}
	}
}

Class Xbox360LibController {
	
	index     :=
	state     :=
	wbuttons  :=
	keystroke :=
	error     :=
	deadzone  :=
	threshold :=
	xgamepad  :=
	xbuttons  :=
	buttons   :=
	xinput    :=
	
	__New(index, xinput) {
		global Xbox360Lib
		this.index     := index
		this.deadzone  := Xbox360Lib.Enum.Deadzone
		this.threshold := Xbox360Lib.Enum.Threshold
		this.xgamepad  := Xbox360Lib.Enum.XInputStateGamepad
		this.xbuttons  := Xbox360Lib.Enum.XInputStateButtons
		this.buttons   := Xbox360Lib.Enum.Buttons
		this.xinput    := xinput
		this.setCapacity("state", 32)
		this.setCapacity("keystroke", 32)
	}
	
	__Get(attributeName) {
		if (attributeName == "IsConnected") {
			return this.IsConnected()
		}
		
		if(!this.IsConnected()){
			return 0
		}

		if(!this.ButtonExist(attributeName)) {
			return 0
		}

		buttonCode := this.GetButtonCode(attributeName)

		if (this.IsDigitalButton(buttonCode)) {
	        return this.IsDigitalButtonActive(buttonCode)
		}
		
		if (this.IsAnalogButton(buttonCode)) {
	        return this.GetAnalogButtonValue(buttonCode)
		}
	
		return 0
	}
	
	ButtonExist(buttonName) {
	  if (this.buttons[buttonName]) {
		return true
	  } else {
		return false
	  }
	}
	
	GetButtonCode(buttonName) {
		return this.buttons[buttonName]
	}
	
	IsDigitalButton(buttonCode) {
		if (this.xbuttons[buttonCode]) {
			return true
		} else {
			return false
		}
	}
	
	IsDigitalButtonActive(buttonCode) {
		wButtons := NumGet(this.getAddress("state"),  4, "UShort")
		if (wButtons & this.xbuttons[buttonCode]) {
			return true
		} else{
			return false
		}
	}

	IsAnalogButton(buttonCode) {
		if (this.xgamepad[buttonCode]) {
			return true
		} else {
			return false
		}
	}

	GetAnalogButtonValue(buttonCode) {
		config := this.xgamepad[buttonCode]
		deadzoneOrThreshold := this.deadzone[buttonCode] ? this.deadzone[buttonCode] : this.threshold[buttonCode]
		value := NumGet(this.GetAddress("state"),  config.code, config.type)
		if (abs(value) > deadzoneOrThreshold) {
			return value
		} else {
			return 0
		}
	}

	Update() {
		this.error := this.xinput.getState(this.index, this.GetAddress("state"))
	}

	IsConnected() {
		return !this.error
	}
	
	GetError() {
		return this.error
	}
}

Class Xbox360LibControllerManager {
	static instance :=
	controls := []
	xinput   :=

	__New() {
		if(Xbox360LibControllerManager.instance) {
			return this.instance
		} else {
			this.xinput := new Xbox360LibXInput()
			Xbox360LibControllerManager.instance := this
		}
	}
	/*
		@return Xbox360LibController
	*/	
	initializeController(index) {
		if(this.controls[index]) {
			return this.controls[index]
		}
		this.controls[index] := new Xbox360LibController(index, this.xinput)
		return this.controls[index]
	}
}
Scriptname EWM_InputManager extends Quest

Import EasyWheelAPI


State WheelSwaps
	Event OnBeginState()
		RefreshKeys()
	EndEvent

	Event OnKeyDown(int keyCode)
		if !Utility.IsInMenuMode() && keyCode == KeycodeSwap("Show")
			TryOpenWheel(GetCurrentLayout())
		endif
		if isWheelOpen() && keyCode == keyCodeSwap("Next")
			TryOpenWheel(GetNextLayout())
		EndIf
		if isWheelOpen() && keyCode == keyCodeSwap("Prev")
			TryOpenWheel(GetPrevLayout())
		EndIf
	EndEvent

	Function RefreshKeys()
		UnregisterForAllKeys()
		RegisterForKey(KeycodeSwap("Show"))
		RegisterForKey(KeycodeSwap("Next"))
		RegisterForKey(KeycodeSwap("Prev"))
	EndFunction
EndState


State WheelPerKey
	Event OnBeginState()
		RefreshKeys()
	EndEvent

	Event OnKeyDown(int keyCode)
		if !Utility.IsInMenuMode()
			String[] wheelLayout = LayoutFromKeycode(keyCode)
			TryOpenWheel(wheelLayout)
		endif
	EndEvent

	Function RefreshKeys()
		UnregisterForAllKeys()
		int k = 16
		While k > 0
			If isWheel(k)
				RegisterForKey(GetKeycodeWheel(k))
			EndIf
			k -= 1
		EndWhile
	EndFunction

EndState


Function RefreshKeys()
EndFunction

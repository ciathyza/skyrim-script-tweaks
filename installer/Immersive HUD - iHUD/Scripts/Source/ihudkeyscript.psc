Scriptname iHUDKeyScript extends Quest

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

GlobalVariable    Property iHUDEnabled Auto
GlobalVariable    Property iHUDKey     Auto
iHUDControlScript Property iHUDControl Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

bool active


; -------------------------------------------------------------------------------------------------
; Fuctions
; -------------------------------------------------------------------------------------------------

bool Function isActive()
	return iHUDEnabled != none && iHUDEnabled.GetValueInt() == 1
EndFunction


Function reset()
	UnRegisterForUpdate()
	UnregisterForAllKeys()
	if !isActive()
		deactivate()
		return
	endif
	RegisterForKey(iHUDKey.GetValueInt())
EndFunction


Function deactivate()
	UnregisterForAllKeys()
EndFunction


Event OnKeyDown(int keyCode)
	if Utility.IsInMenuMode()
		return
	endif
	if !isActive()
		deactivate()
		return
	endif
	iHUDControl.iHUDKeyPressed()
EndEvent


Event OnKeyUp(int keyCode, float holdTime)
	if Utility.IsInMenuMode()
		return
	endif
	if !isActive()
		deactivate()
		return
	endif
	iHUDControl.iHUDKeyReleased(holdTime)
EndEvent

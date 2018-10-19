Scriptname iHUDMaintainanceScript extends Quest

import iHUDUtilityScript

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

iHUDKeyScript Property iHUDKey auto
iHUDControlScript Property iHUDControl auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

float lastUpdatedVersion


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

float Function getiHUDVersion()
	return 3.002
EndFunction


Function startUp()
	if lastUpdatedVersion < getiHUDVersion()
		lastUpdatedVersion = getiHUDVersion()
		Debug.Notification("Initializing iHUD version 3.0.02")
	endif
	iHUDControl.startUp()
	iHUDKey.reset()
EndFunction

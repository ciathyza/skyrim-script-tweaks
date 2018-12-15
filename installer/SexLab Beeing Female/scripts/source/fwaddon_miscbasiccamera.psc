;/ Decompiled by Champollion V1.0.1
Source   : FWAddOn_MiscBasicCamera.psc
Modified : 2016-12-06 03:53:10
Compiled : 2017-01-18 08:36:11
User     : admin
Computer : PATRICK
/;
scriptName FWAddOn_MiscBasicCamera extends FWAddOn_Misc

;-- Properties --------------------------------------
Float property FreeCamSpeed = 3.50000 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function StopCamera()

	debug.Trace("Free Camera ended", 0)
	Bool InFreeCamera = game.GetCameraState() == 3
	if InFreeCamera
		miscutil.ToggleFreeCamera(false)
	endIf
endFunction

function StartCamera()

	debug.Trace("Free Camera started", 0)
	Bool InFreeCamera = game.GetCameraState() == 3
	if !InFreeCamera
		miscutil.SetFreeCameraSpeed(FreeCamSpeed)
		miscutil.ToggleFreeCamera(false)
	endIf
endFunction

; Skipped compiler generated GetState

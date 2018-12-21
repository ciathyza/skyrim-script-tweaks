Scriptname FWAddOn_MiscBasicCamera extends FWAddOn_Misc

float property FreeCamSpeed = 3.5 Auto

function StartCamera()
Debug.Trace("Free Camera started")
	bool InFreeCamera = Game.GetCameraState() == 3
	if !InFreeCamera
		MiscUtil.SetFreeCameraSpeed(FreeCamSpeed)
		MiscUtil.ToggleFreeCamera()
	endIf
endFunction

function StopCamera()
	Debug.Trace("Free Camera ended")
	bool InFreeCamera = Game.GetCameraState() == 3
	If InFreeCamera
		MiscUtil.ToggleFreeCamera()
	endIf
endFunction
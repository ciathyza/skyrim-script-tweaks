Scriptname EWM_WheelMenu extends Quest

Import EasyWheelAPI


uiwheelmenu easyWheelMenu
int optionFilledCount = 0


Event OnInit()
	RegisterForModEvent("EWM_OptionSetupEvent", "OnOptionFillRequest")
EndEvent


Bool Function Open(String[] wheelLayout)
	If wheelLayout.Length != 8
		Return False
	EndIf
	WheelOpen()
	easyWheelMenu = UIExtensions.GetMenu("UIWheelMenu") as uiwheelmenu
	int i = 0
	optionFilledCount = 0
	While i < 8
		String optionName = wheelLayout[i]
		If optionName != "" && optionName != "EMPTY"
			SendModEvent("EWM_OptionSetupEvent", optionName, i)
		else
			easyWheelMenu.SetPropertyIndexBool("optionEnabled", i, False)
			optionFilledCount += 1
		EndIf
		i = i + 1
	EndWhile
	if GetAPI()._bShowHandlerStatus
		SendModEvent("EWM_ShowHandlerStatusEvent")
		Utility.Wait(0.1)
	endif
	while optionFilledCount <= 7
		Utility.Wait(0.1)
	endwhile
	Int iUserSelection = -1
	if GetAPI()._bShowPlayerStats
		iUserSelection = easyWheelMenu.OpenMenu(Game.GetPlayer())
	else
		iUserSelection = easyWheelMenu.OpenMenu()
	endif
	WheelOpen(false)
	If iUserSelection < 0 || wheelLayout != GetCurrentLayout()
		Return True
	EndIf
	SendEWMEvent(wheelLayout[iUserSelection])
	Return True
EndFunction


Event OnOptionFillRequest(string eventName, string optionName, float optionIndex, Form sender)
	int i = optionIndex as Int
	easyWheelMenu.SetPropertyIndexString("optionText", i, GetCurrentIndex())
	easyWheelMenu.SetPropertyIndexString("optionLabelText", i, "$"+optionName)
	easyWheelMenu.SetPropertyIndexBool("optionEnabled", i, GetFunctionCondition(optionName))
	optionFilledCount += 1
EndEvent

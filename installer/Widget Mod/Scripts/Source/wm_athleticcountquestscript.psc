Scriptname WM_AthleticCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto

Bool SpeedVisible = false
Int	SpeedCount = 0
Int JumpCount = 0
Int FallCount = 0
Int	SpeedSize = 100

Bool Property Visible
	Bool Function Get()
		Return SpeedVisible
	EndFunction

	Function Set(bool a_val)
		SpeedVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", SpeedVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return SpeedCount
	EndFunction

	Function set(int a_val)
		SpeedCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", SpeedCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return JumpCount
	EndFunction

	Function set(int a_val)
		JumpCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", JumpCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count3
	Int Function Get()
		Return FallCount
	EndFunction

	Function set(int a_val)
		FallCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", FallCount) 
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return SpeedSize
	EndFunction

	Function Set(int a_val)
		SpeedSize = a_val
		If (Ready)
			UpdateScale()
		EndIf
	EndFunction
EndProperty

Function SetX(Float afX)
	If (Ready)
		X = afX
	EndIf
EndFunction

Function SetY(Float afY)
	If (Ready)
		Y = afY
	EndIf
EndFunction

Function SetHorizontalAnchor(String asAnchor)
	If (Ready)
		HAnchor = asAnchor
	EndIf
EndFunction

Function SetVerticalAnchor(String asAnchor)
	If (Ready)
		VAnchor = asAnchor
	EndIf
EndFunction

Function SetTransparency(Float afAlpha)
	If (Ready)
		Alpha = afAlpha
	EndIf
EndFunction

Event OnWidgetReset()
	UpdateScale()
	Parent.OnWidgetReset()
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", SpeedVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", SpeedCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", JumpCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", FallCount)
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_SpeedCount.swf"
EndFunction

String Function GetWidgetType()
	Return "WM_AthleticsCountQuestScript"
EndFunction

Function UpdateStatus()
	If (Ready)
		UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", PlayerREF.GetActorValue("SpeedMult"))
		UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", Game.GetGameSettingFloat("fJumpHeightMin") as Int)
		UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount3", Game.GetGameSettingFloat("fJumpFallHeightMin") as Int)
	EndIf
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", SpeedSize) 
EndFunction

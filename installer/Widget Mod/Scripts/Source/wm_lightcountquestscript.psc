Scriptname WM_LightCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto

Bool LightVisible = false
Int	LightCount	= 0
Int	LightSize = 100

Bool Property Visible
	Bool Function Get()
		Return LightVisible
	EndFunction

	Function Set(bool a_val)
		LightVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", LightVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return LightCount
	EndFunction

	Function set(int a_val)
		LightCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", LightCount) 
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return LightSize
	EndFunction

	Function Set(int a_val)
		LightSize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", LightVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", LightCount)			
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_LightCount.swf"
EndFunction

String Function GetWidgetType()
	Return "WM_LightCountQuestScript"
EndFunction

Function UpdateStatus()
	if !LightVisible || !Ready
		Return
	EndIf
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", PlayerREF.GetLightLevel() as Int)	
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", LightSize) 
EndFunction

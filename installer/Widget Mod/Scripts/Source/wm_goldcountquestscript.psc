Scriptname WM_GoldCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto
MiscObject Property Gold001 Auto

Bool GoldVisible = false
Int	GoldCount	= 0
Int	GoldSize = 100

Bool Property Visible
	Bool Function Get()
		Return GoldVisible
	EndFunction

	Function Set(bool a_val)
		GoldVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", GoldVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return GoldCount
	EndFunction

	Function set(int a_val)
		GoldCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", GoldCount) 
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return GoldSize
	EndFunction

	Function Set(int a_val)
		GoldSize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", GoldVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", GoldCount)			
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_GoldCount.swf"
EndFunction

String Function GetWidgetType()
	Return "WM_GoldCountQuestScript"
EndFunction

Function UpdateStatus()
	if !GoldVisible || !Ready
		Return
	EndIf
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", PlayerRef.GetItemCount(Gold001))			
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", GoldSize) 
EndFunction

Scriptname WM_AttributeCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto

Bool AttributeVisible = false
Int	AttributeCount	= 0
Int	AttributeCount2 = 0
Int	AttributeCount3 = 0
Int	AttributeCount4 = 0
Int	AttributeCount5 = 0
Int	AttributeCount6 = 0
Int	AttributeSize = 100

Bool Property Visible
	Bool Function Get()
		Return AttributeVisible
	EndFunction

	Function Set(bool a_val)
		AttributeVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", AttributeVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return AttributeCount
	EndFunction

	Function Set(int a_val)
		AttributeCount = a_val
		If (Ready)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", AttributeCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return AttributeCount2
	EndFunction

	Function Set(int a_val)
		AttributeCount2 = a_val
		If (Ready)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", AttributeCount2) 
		EndIf
	EndFunction
EndProperty

Int Property Count3
	Int Function Get()
		Return AttributeCount3
	EndFunction

	Function Set(int a_val)
		AttributeCount3 = a_val
		If (Ready)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount3", AttributeCount3) 
		EndIf
	EndFunction
EndProperty

Int Property Count4
	Int Function Get()
		Return AttributeCount4
	EndFunction

	Function Set(int a_val)
		AttributeCount4 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount4", AttributeCount4) 
		EndIf
	EndFunction
EndProperty

Int Property Count5
	Int Function Get()
		Return AttributeCount5
	EndFunction

	Function Set(int a_val)
		AttributeCount5 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount5", AttributeCount5) 
		EndIf
	EndFunction
EndProperty

Int Property Count6
	Int Function Get()
		Return AttributeCount6
	EndFunction

	Function Set(int a_val)
		AttributeCount6 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount6", AttributeCount6) 
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return AttributeSize
	EndFunction

	Function Set(int a_val)
		AttributeSize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", AttributeVisible)
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", AttributeCount)
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", AttributeCount2)
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount3", AttributeCount3)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount4", AttributeCount4)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount5", AttributeCount5)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount6", AttributeCount6)	
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_AttributeCount.swf"	
EndFunction

String Function GetWidgetType()
	Return "WM_AttributeCountQuestScript"
EndFunction

Function UpdateStatus()
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", PlayerREF.GetActorValue("HealRate") as Float)
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", PlayerREF.GetActorValue("StaminaRate") as Float)
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount3", PlayerREF.GetActorValue("MagickaRate") as Float)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount4", PlayerREF.GetActorValue("Health") as Int)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount5", PlayerREF.GetActorValue("Stamina") as Int)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount6", PlayerREF.GetActorValue("Magicka") as Int)	
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", AttributeSize)
EndFunction
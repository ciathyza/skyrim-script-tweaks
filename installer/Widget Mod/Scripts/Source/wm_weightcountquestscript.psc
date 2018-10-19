Scriptname WM_WeightCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto

Bool WeightVisible = false
Int	WeightCount = 0
Int InventoryCount = 0
Int	WeightSize = 100

Bool Property Visible
	Bool Function Get()
		Return WeightVisible
	EndFunction

	Function Set(bool a_val)
		WeightVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", WeightVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return WeightCount
	EndFunction

	Function set(int a_val)
		WeightCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", WeightCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return InventoryCount
	EndFunction

	Function set(int a_val)
		InventoryCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", InventoryCount) 
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return WeightSize
	EndFunction

	Function Set(int a_val)
		WeightSize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", WeightVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", WeightCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", InventoryCount)	
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_WeightCount.swf"
EndFunction

String Function GetWidgetType()
	Return "WM_WeightCountQuestScript"
EndFunction

Function UpdateStatus()
	if !WeightVisible || !Ready
		Return
	EndIf

	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", PlayerREF.GetActorValue("CarryWeight") as Int)
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", PlayerREF.GetActorValue("InventoryWeight") as Int)
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", WeightSize) 
EndFunction

Scriptname WM_LockpickCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto
MiscObject Property Lockpick Auto
Light Property Torch01 Auto

Bool LockpickVisible = false
Int	LockpickCount	= 0
Int	LockpickCount2	= 0
Int	LockpickSize = 100

Bool Property Visible
	Bool Function Get()
		Return LockpickVisible
	EndFunction

	Function Set(bool a_val)
		LockpickVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", LockpickVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return LockpickCount
	EndFunction

	Function set(int a_val)
		LockpickCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", LockpickCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return LockpickCount2
	EndFunction

	Function set(int a_val)
		LockpickCount2 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", LockpickCount2) 
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return LockpickSize
	EndFunction

	Function Set(int a_val)
		LockpickSize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", LockpickVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", LockpickCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", LockpickCount2)
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_LockpickCount.swf"
EndFunction

String Function GetWidgetType()
	Return "WM_LockpickCountQuestScript"
EndFunction

Function UpdateStatus()
	If (Ready)
		Form Lantern = Game.GetFormFromFile(0x06087FFB, "SurvivalistIngenuity.esp") as Form
		Int LanternCount = PlayerREF.GetItemCount(Lantern) as Int
		UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", PlayerRef.GetItemCount(Lockpick))
		UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", PlayerREF.GetItemCount(Torch01) + LanternCount)
	EndIf
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", LockpickSize) 
EndFunction


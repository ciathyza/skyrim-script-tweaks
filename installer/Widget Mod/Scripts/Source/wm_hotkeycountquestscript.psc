Scriptname WM_HotkeyCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto

Bool HotkeyVisible = false
String HotkeyBound = ""
String HotkeyBound2 = ""
String HotkeyBound3 = ""
String HotkeyBound4 = ""
String HotkeyBound5 = ""
String HotkeyBound6 = ""
String HotkeyBound7 = ""
String HotkeyBound8 = ""
Int	HotkeySize = 100

Bool Property Visible
	Bool Function Get()
		Return HotkeyVisible
	EndFunction

	Function Set(bool a_val)
		HotkeyVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", HotkeyVisible) 
		EndIf
	EndFunction
EndProperty

String Property MessageText
	String Function Get()
		Return HotkeyBound
	EndFunction

	Function Set(String a_val)
		HotkeyBound = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", HotkeyBound)
		EndIf
	EndFunction
EndProperty

String Property MessageText2
	String Function Get()
		Return HotkeyBound2
	EndFunction

	Function Set(String a_val)
		HotkeyBound2 = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText2", HotkeyBound2)
		EndIf
	EndFunction
EndProperty

String Property MessageText3
	String Function Get()
		Return HotkeyBound3
	EndFunction

	Function Set(String a_val)
		HotkeyBound3 = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText3", HotkeyBound3)
		EndIf
	EndFunction
EndProperty

String Property MessageText4
	String Function Get()
		Return HotkeyBound4
	EndFunction

	Function Set(String a_val)
		HotkeyBound4 = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText4", HotkeyBound4)
		EndIf
	EndFunction
EndProperty

String Property MessageText5
	String Function Get()
		Return HotkeyBound5
	EndFunction

	Function Set(String a_val)
		HotkeyBound5 = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText5", HotkeyBound5)
		EndIf
	EndFunction
EndProperty

String Property MessageText6
	String Function Get()
		Return HotkeyBound6
	EndFunction

	Function Set(String a_val)
		HotkeyBound6 = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText6", HotkeyBound6)
		EndIf
	EndFunction
EndProperty

String Property MessageText7
	String Function Get()
		Return HotkeyBound7
	EndFunction

	Function Set(String a_val)
		HotkeyBound7 = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText7", HotkeyBound7)
		EndIf
	EndFunction
EndProperty

String Property MessageText8
	String Function Get()
		Return HotkeyBound8
	EndFunction

	Function Set(String a_val)
		HotkeyBound8 = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText8", HotkeyBound8)
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return HotkeySize
	EndFunction

	Function Set(int a_val)
		HotkeySize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", HotkeyVisible)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", HotkeyBound)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText2", HotkeyBound2)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText3", HotkeyBound3)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText4", HotkeyBound4)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText5", HotkeyBound5)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText6", HotkeyBound6)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText7", HotkeyBound7)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText8", HotkeyBound8)	
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_HotkeyCount.swf"
EndFunction

String Function GetWidgetType()
	Return "WM_HotkeyCountQuestScript"
EndFunction

Function UpdateStatus()
	if !HotkeyVisible || !Ready
		Return
	EndIf

	Form Hotkey = Game.GetHotkeyBoundObject(0) as Form 
	Form Hotkey2 = Game.GetHotkeyBoundObject(1) as Form 
	Form Hotkey3 = Game.GetHotkeyBoundObject(2) as Form 
	Form Hotkey4 = Game.GetHotkeyBoundObject(3) as Form 
	Form Hotkey5 = Game.GetHotkeyBoundObject(4) as Form 
	Form Hotkey6 = Game.GetHotkeyBoundObject(5) as Form 
	Form Hotkey7 = Game.GetHotkeyBoundObject(6) as Form 
	Form Hotkey8 = Game.GetHotkeyBoundObject(7) as Form

	If Hotkey
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", Hotkey.GetName())
	ElseIf !Hotkey
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", "Empty")
	EndIf
	If Hotkey2
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText2", Hotkey2.GetName())
	ElseIf !Hotkey2
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText2", "Empty")
	EndIf
	If Hotkey3
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText3", Hotkey3.GetName())
	ElseIf !Hotkey3
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText3", "Empty")
	EndIf
	If Hotkey4
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText4", Hotkey4.GetName())
	ElseIf !Hotkey4
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText4", "Empty")
	EndIf
	If Hotkey5
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText5", Hotkey5.GetName())
	ElseIf !Hotkey5
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText5", "Empty")
	EndIf
	If Hotkey6
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText6", Hotkey6.GetName())
	ElseIf !Hotkey6
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText6", "Empty")
	EndIf
	If Hotkey7
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText7", Hotkey7.GetName())
	ElseIf !Hotkey7
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText7", "Empty")
	EndIf
	If Hotkey8
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText8", Hotkey8.GetName())
	ElseIf !Hotkey8
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText8", "Empty")
	EndIf
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", HotkeySize) 
EndFunction

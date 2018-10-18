Scriptname WM_HorseCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto

Bool HorseVisible = false
Int	HorseCount	= 0
Int	HorseCount2 = 0
Int	HorseCount3 = 0
String HorseName = ""
Int	HorseSize = 100

Bool Property Visible
	Bool Function Get()
		Return HorseVisible
	EndFunction

	Function Set(bool a_val)
		HorseVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", HorseVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return HorseCount
	EndFunction

	Function Set(int a_val)
		HorseCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", HorseCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return HorseCount2
	EndFunction

	Function Set(int a_val)
		HorseCount2 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", HorseCount2) 
		EndIf
	EndFunction
EndProperty

Int Property Count3
	Int Function Get()
		Return HorseCount3
	EndFunction

	Function Set(int a_val)
		HorseCount3 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", HorseCount3) 
		EndIf
	EndFunction
EndProperty

String Property MessageText
	String Function Get()
		Return HorseName
	EndFunction

	Function Set(String a_val)
		HorseName = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", HorseName)
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return HorseSize
	EndFunction

	Function Set(int a_val)
		HorseSize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", HorseVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", HorseCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", HorseCount2)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", HorseCount3)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", HorseName)	
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_HorseCount.swf"	
EndFunction

String Function GetWidgetType()
	Return "WM_HorseCountQuestScript"
EndFunction

Function UpdateStatus()
	Actor Horse = Game.GetPlayersLastRiddenHorse() as Actor
	If Horse != none
		Int HorseDistance = (PlayerREF.GetDistance(Horse) / 65) as Int ;fires distance in meters
		HorseName = Horse.GetDisplayName() as String
		If (Ready)
			If Horse.IsBeingRidden()
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", Horse.GetActorValue("Health") as Int)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", Horse.GetActorValue("Stamina") as Int)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", 0)
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", HorseName)
			ElseIf !Horse.IsBeingRidden()
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", Horse.GetActorValue("Health") as Int)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", Horse.GetActorValue("Stamina") as Int)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", HorseDistance as Int)
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", HorseName)
			EndIf
		EndIf
	EndIf
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", HorseSize)
EndFunction
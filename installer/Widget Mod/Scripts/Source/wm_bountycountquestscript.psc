Scriptname WM_BountyCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionFalkreath Auto
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionHjaalmarch Auto
Faction Property CrimeFactionPale Auto
Faction Property CrimeFactionReach Auto
Faction Property CrimeFactionRift Auto
Faction Property CrimeFactionWinterhold Auto
FormList Property WM_EastmarchLocation Auto
FormList Property WM_FalkreathLocation Auto
FormList Property WM_HaafingarLocation Auto
FormList Property WM_HjaalmarchLocation Auto
FormList Property WM_PaleLocation Auto
FormList Property WM_ReachLocation Auto
FormList Property WM_RiftLocation Auto
FormList Property WM_WhiterunLocation Auto
FormList Property WM_WinterholdLocation Auto

Bool BountyVisible = false
Int	BountyCount = 0
Int	BountyCount2 = 0
Int BountySize = 100

Bool Property Visible
	Bool Function Get()
		Return BountyVisible
	EndFunction

	Function Set(bool a_val)
		BountyVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", BountyVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return BountyCount
	EndFunction

	Function set(int a_val)
		BountyCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", BountyCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return BountyCount2
	EndFunction

	Function set(int a_val)
		BountyCount2 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", BountyCount2) 
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return BountySize
	EndFunction

	Function Set(int a_val)
		BountySize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", BountyVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", BountyCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", BountyCount2)	
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_BountyCount.swf"
EndFunction

String Function GetWidgetType()
	Return "WM_BountyCountQuestScript"
EndFunction

Function UpdateStatus()
	Int BountyAll = CrimeFactionWhiterun.GetCrimeGold() + CrimeFactionEastmarch.GetCrimeGold()  + CrimeFactionFalkreath.GetCrimeGold() + CrimeFactionHaafingar.GetCrimeGold() + CrimeFactionHjaalmarch.GetCrimeGold() + CrimeFactionPale.GetCrimeGold() + CrimeFactionReach.GetCrimeGold() + CrimeFactionRift.GetCrimeGold() + CrimeFactionWinterhold.GetCrimeGold() 
	Int BountyWhiterun = CrimeFactionWhiterun.GetCrimeGold() as Int
	Int BountyEastmarch = CrimeFactionEastmarch.GetCrimeGold() as Int
	Int BountyFalkreath = CrimeFactionFalkreath.GetCrimeGold() as Int
	Int BountyHaafingar = CrimeFactionHaafingar.GetCrimeGold() as Int
	Int BountyHjaalmarch = CrimeFactionHjaalmarch.GetCrimeGold() as Int
	Int BountyPale = CrimeFactionPale.GetCrimeGold() as Int
	Int BountyReach = CrimeFactionReach.GetCrimeGold() as Int
	Int BountyRift = CrimeFactionRift.GetCrimeGold() as Int
	Int BountyWinterhold = CrimeFactionWinterhold.GetCrimeGold() as Int
	Form CurrentLocation = PlayerREF.GetCurrentLocation() as Form
	Bool IsWhiterunLoc = WM_WhiterunLocation.HasForm(CurrentLocation) as Bool
	Bool IsEastmarchLoc = WM_EastmarchLocation.HasForm(CurrentLocation) as Bool
	Bool IsFalkreathLoc = WM_FalkreathLocation.HasForm(CurrentLocation) as Bool
	Bool IsHaafingarLoc = WM_HaafingarLocation.HasForm(CurrentLocation) as Bool
	Bool IsHjaalmarchLoc = WM_HjaalmarchLocation.HasForm(CurrentLocation) as Bool
	Bool IsPaleLoc = WM_PaleLocation.HasForm(CurrentLocation) as Bool
	Bool IsReachLoc = WM_ReachLocation.HasForm(CurrentLocation) as Bool
	Bool IsRiftLoc = WM_RiftLocation.HasForm(CurrentLocation) as Bool
	Bool IsWinterholdLoc = WM_WinterholdLocation.HasForm(CurrentLocation) as Bool
	If (Ready)
		UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", BountyAll)
		If IsWhiterunLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyWhiterun)
		ElseIf IsEastmarchLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyEastmarch)
		ElseIf IsFalkreathLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyFalkreath)
		ElseIf IsHaafingarLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyHaafingar)
		ElseIf IsHjaalmarchLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyHjaalmarch)
		ElseIf IsPaleLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyPale)
		ElseIf IsReachLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyReach)
		ElseIf IsRiftLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyRift)
		ElseIf IsWinterholdLoc
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", BountyWinterhold)
		Else
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", 0)
		EndIf			
	EndIf
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", BountySize) 
EndFunction
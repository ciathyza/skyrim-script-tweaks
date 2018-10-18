Scriptname WM_FollowerCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto
FormList Property WM_FollowerFormList Auto
Faction Property CurrentFollowerFaction Auto

Bool FollowerVisible = false
Int	FollowerCount	= 0
Int	FollowerCount2 = 0
Int	FollowerCount3 = 0
Int	FollowerCount4 = 0
Int	FollowerCount5 = 0
Int	FollowerCount6 = 0
Int	FollowerCount7 = 0
String FollowerName = ""
Int	FollowerSize = 100
Float TotalWeight = 0.0
Int TotalCount = 0

Bool Property Visible
	Bool Function Get()
		Return FollowerVisible
	EndFunction

	Function Set(bool a_val)
		FollowerVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", FollowerVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return FollowerCount
	EndFunction

	Function Set(int a_val)
		FollowerCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", FollowerCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return FollowerCount2
	EndFunction

	Function Set(int a_val)
		FollowerCount2 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", FollowerCount2) 
		EndIf
	EndFunction
EndProperty

Int Property Count3
	Int Function Get()
		Return FollowerCount3
	EndFunction

	Function Set(int a_val)
		FollowerCount3 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", FollowerCount3) 
		EndIf
	EndFunction
EndProperty

Int Property Count4
	Int Function Get()
		Return FollowerCount4
	EndFunction

	Function Set(int a_val)
		FollowerCount4 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount4", FollowerCount4) 
		EndIf
	EndFunction
EndProperty

Int Property Count5
	Int Function Get()
		Return FollowerCount5
	EndFunction

	Function Set(int a_val)
		FollowerCount5 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount5", FollowerCount5) 
		EndIf
	EndFunction
EndProperty

Int Property Count6
	Int Function Get()
		Return FollowerCount6
	EndFunction

	Function Set(int a_val)
		FollowerCount6 = a_val
		If (Ready)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount6", FollowerCount6) 
		EndIf
	EndFunction
EndProperty

Int Property Count7
	Int Function Get()
		Return FollowerCount7
	EndFunction

	Function Set(int a_val)
		FollowerCount7 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount7", FollowerCount7) 
		EndIf
	EndFunction
EndProperty

String Property MessageText
	String Function Get()
		Return FollowerName
	EndFunction

	Function Set(String a_val)
		FollowerName = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", FollowerName)
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return FollowerSize
	EndFunction

	Function Set(int a_val)
		FollowerSize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", FollowerVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", FollowerCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", FollowerCount2)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", FollowerCount3)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount4", FollowerCount4)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount5", FollowerCount5)
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount6", FollowerCount6)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount7", FollowerCount7)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", FollowerName)	
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_FollowerCount.swf"	
EndFunction

String Function GetWidgetType()
	Return "WM_FollowerCountQuestScript"
EndFunction

Function UpdateStatus()
	Actor Follower = Game.FindClosestReferenceOfAnyTypeInListFromRef(WM_FollowerFormList, PlayerREF, 1048576.0) as Actor
	If Follower != none
		If Follower.IsInFaction(CurrentFollowerFaction)
			Int FollowerDistance = (PlayerREF.GetDistance(Follower) / 65) as Int ;displays distance in meters
			Int FollowerInvItems = Follower.GetNumItems() as Int
			TotalCount = 0 as Int
			TotalWeight = 0.0 as Float
			If FollowerInvItems != 0
				While(FollowerInvItems)
					FollowerInvItems -= 1
					Form AllItems = Follower.GetNthForm(FollowerInvItems) as Form
					If AllItems != none					
						TotalCount = Follower.GetItemCount(Follower.GetNthForm(FollowerInvItems))
						TotalWeight += Follower.GetNthForm(FollowerInvItems).GetWeight() * TotalCount as Float
					EndIf	
				EndWhile
			EndIf
			Float FollowerInvWeight = TotalWeight as Float
			Int FollowerCarWeight = Follower.GetActorValue("CarryWeight") as Int
			FollowerName = Follower.GetDisplayName() as String
			If (Ready)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", Follower.GetActorValue("Health") as Int)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", Follower.GetActorValue("Stamina") as Int)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", Follower.GetActorValue("Magicka") as Int)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount4", Follower.GetLevel() as Int)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount5", FollowerDistance as Int)
				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount6", FollowerInvWeight as Float)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount7", FollowerCarWeight as Int)
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", FollowerName)
			EndIf
		EndIf
	EndIf
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", FollowerSize)
EndFunction

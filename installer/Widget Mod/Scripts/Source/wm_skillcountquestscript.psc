Scriptname WM_SkillCountQuestScript extends SKI_WidgetBase

Actor Property PlayerREF Auto

Bool SkillVisible = false
Int	SkillCount = 0
Int	SkillCount2 = 0
Int	SkillCount3 = 0
Int	SkillSize = 100

Bool Property Visible
	Bool Function Get()
		Return SkillVisible 
	EndFunction

	Function Set(bool a_val)
		SkillVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", SkillVisible) 
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return SkillCount
	EndFunction

	Function Set(int a_val)
		SkillCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", SkillCount) 
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return SkillCount2
	EndFunction

	Function Set(int a_val)
		SkillCount2 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", SkillCount2) 
		EndIf
	EndFunction
EndProperty

Int Property Count3
	Int Function Get()
		Return SkillCount3
	EndFunction

	Function Set(int a_val)
		SkillCount3 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", SkillCount3) 
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return SkillSize
	EndFunction

	Function Set(int a_val)
		SkillSize = a_val
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
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", SkillVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", SkillCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", SkillCount2)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", SkillCount3)
EndEvent

String Function GetWidgetSource()
	Return "WM/WM_SkillCount.swf"
EndFunction

String Function GetWidgetType()
	Return "WM_SkillCountQuestScript"
EndFunction

Function UpdateStatus()
	If (Ready)
		UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount", Game.GetPlayerExperience())
		UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setCount2", Game.GetExperienceForLevel(PlayerREF.GetLevel()))
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount3", PlayerREF.GetLevel())
	EndIf
EndFunction

Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", SkillSize) 
EndFunction

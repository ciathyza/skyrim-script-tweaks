Scriptname WM_EssentialCountQuestScript extends SKI_WidgetBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

GlobalVariable Property WM_EssentialCounterGlobal Auto
Keyword Property ActorTypeNPC Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Bool EssentialVisible = false
Int	EssentialSize = 100
ActorBase Target


; -------------------------------------------------------------------------------------------------
; Accessors
; -------------------------------------------------------------------------------------------------

Bool Property Visible
	Bool Function Get()
		Return EssentialVisible
	EndFunction
	Function Set(bool a_val)
		EssentialVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", EssentialVisible)
		EndIf
	EndFunction
EndProperty


Int Property Size
	Int Function Get()
		Return EssentialSize
	EndFunction
	Function Set(int a_val)
		EssentialSize = a_val
		If (Ready)
			UpdateScale()
		EndIf
	EndFunction
EndProperty


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

Event OnWidgetReset()
	UpdateScale()
	Parent.OnWidgetReset()
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", !EssentialVisible)
	RegisterforCrosshairRef()
EndEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

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


String Function GetWidgetSource()
	Return "WM/WM_EssentialCount.swf"
EndFunction


String Function GetWidgetType()
	Return "WM_EssentialCountQuestScript"
EndFunction


Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", EssentialSize)
EndFunction


Event OnCrosshairRefChange(ObjectReference ref)
	If ref
		If WM_EssentialCounterGlobal.GetValueInt() == 1
			Target = ref.GetBaseObject() as ActorBase
			If Target
				If (ref.HasKeyword(ActorTypeNPC) && (Target.IsEssential() || Target.IsProtected()))
					UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", EssentialVisible)
				Else
					UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", !EssentialVisible)
				EndIf
			EndIf
		Else
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", EssentialVisible)
		EndIf
	Else
		UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", !EssentialVisible)
	EndIf
EndEvent

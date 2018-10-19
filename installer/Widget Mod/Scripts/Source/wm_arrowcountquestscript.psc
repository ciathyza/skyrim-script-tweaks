Scriptname WM_ArrowCountQuestScript extends SKI_WidgetBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor    Property PlayerREF                     Auto
Ammo     Property boundArrow                    Auto
Ammo     Property DLC1BoltDwarven               Auto
Ammo     Property DLC1BoltDwarvenExplodingFire  Auto
Ammo     Property DLC1BoltDwarvenExplodingIce   Auto
Ammo     Property DLC1BoltDwarvenExplodingShock Auto
Ammo     Property DLC1BoltSteel                 Auto
Ammo     Property DLC1BoltSteelExplodingFire    Auto
Ammo     Property DLC1BoltSteelExplodingIce     Auto
Ammo     Property DLC1BoltSteelExplodingShock   Auto
Ammo     Property DLC1DragonboneArrow           Auto
Ammo     Property DLC2NordicArrow               Auto
Ammo     Property DLC2RieklingSpearThrown       Auto
Ammo     Property DLC2StalhrimArrow             Auto
Ammo     Property DraugrArrow                   Auto
Ammo     Property DwarvenArrow                  Auto
Ammo     Property EbonyArrow                    Auto
Ammo     Property ElvenArrow                    Auto
Ammo     Property FalmerArrow                   Auto
Ammo     Property ForswornArrow                 Auto
Ammo     Property GlassArrow                    Auto
Ammo     Property IronArrow                     Auto
Ammo     Property NordHeroArrow                 Auto
Ammo     Property OrcishArrow                   Auto
Ammo     Property SteelArrow                    Auto
FormList Property WM_ArrowFormList              Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Bool ArrowVisible = false
Int	ArrowCount    = 0
Int	ArrowCount2	  = 0
Int	ArrowSize     = 100
String ArrowName  = ""


; -------------------------------------------------------------------------------------------------
; Computed Properties
; -------------------------------------------------------------------------------------------------

Bool Property Visible
	Bool Function Get()
		Return ArrowVisible
	EndFunction
	Function Set(bool a_val)
		ArrowVisible = a_val
		If (Ready)
			UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", ArrowVisible)
		EndIf
	EndFunction
EndProperty

Int Property Count
	Int Function Get()
		Return ArrowCount
	EndFunction
	Function Set(int a_val)
		ArrowCount = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", ArrowCount)
		EndIf
	EndFunction
EndProperty

Int Property Count2
	Int Function Get()
		Return ArrowCount2
	EndFunction
	Function Set(int a_val)
		ArrowCount2 = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", ArrowCount2)
		EndIf
	EndFunction
EndProperty

String Property MessageText
	String Function Get()
		Return ArrowName
	EndFunction
	Function Set(String a_val)
		ArrowName = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", ArrowName)
		EndIf
	EndFunction
EndProperty

Int Property Size
	Int Function Get()
		Return ArrowSize
	EndFunction
	Function Set(int a_val)
		ArrowSize = a_val
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
	If PlayerREF.IsEquipped(DLC1BoltDwarven)
		ArrowName = DLC1BoltDwarven.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltDwarven)
	ElseIf PlayerREF.IsEquipped(DLC1BoltDwarvenExplodingFire)
		ArrowName = DLC1BoltDwarvenExplodingFire.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltDwarvenExplodingFire)
	ElseIf PlayerREF.IsEquipped(DLC1BoltDwarvenExplodingIce)
		ArrowName = DLC1BoltDwarvenExplodingIce.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltDwarvenExplodingIce)
	ElseIf PlayerREF.IsEquipped(DLC1BoltDwarvenExplodingShock)
		ArrowName = DLC1BoltDwarvenExplodingShock.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltDwarvenExplodingShock)
	ElseIf PlayerREF.IsEquipped(DLC1BoltSteel)
		ArrowName = DLC1BoltSteel.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltSteel)
	ElseIf PlayerREF.IsEquipped(DLC1BoltSteelExplodingFire)
		ArrowName = DLC1BoltSteelExplodingFire.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltSteelExplodingFire)
	ElseIf PlayerREF.IsEquipped(DLC1BoltSteelExplodingIce)
		ArrowName = DLC1BoltSteelExplodingIce.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltSteelExplodingIce)
	ElseIf PlayerREF.IsEquipped(DLC1BoltSteelExplodingShock)
		ArrowName = DLC1BoltSteelExplodingShock.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltSteelExplodingShock)
	ElseIf PlayerREF.IsEquipped(DLC1DragonboneArrow)
		ArrowName = DLC1DragonboneArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1DragonboneArrow)
	ElseIf PlayerREF.IsEquipped(DLC2NordicArrow)
		ArrowName = DLC2NordicArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC2NordicArrow)
	ElseIf PlayerREF.IsEquipped(DLC2RieklingSpearThrown)
		ArrowName = DLC2RieklingSpearThrown.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC2RieklingSpearThrown)
	ElseIf PlayerREF.IsEquipped(DLC2StalhrimArrow)
		ArrowName = DLC2StalhrimArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC2StalhrimArrow)
	ElseIf PlayerREF.IsEquipped(DraugrArrow)
		ArrowName = DraugrArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DraugrArrow)
	ElseIf PlayerREF.IsEquipped(DwarvenArrow)
		ArrowName = DwarvenArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DwarvenArrow)
	ElseIf PlayerREF.IsEquipped(EbonyArrow)
		ArrowName = EbonyArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(EbonyArrow)
	ElseIf PlayerREF.IsEquipped(ElvenArrow)
		ArrowName = ElvenArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(ElvenArrow)
	ElseIf PlayerREF.IsEquipped(FalmerArrow)
		ArrowName = FalmerArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(FalmerArrow)
	ElseIf PlayerREF.IsEquipped(ForswornArrow)
		ArrowName = ForswornArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(ForswornArrow)
	ElseIf PlayerREF.IsEquipped(GlassArrow)
		ArrowName = GlassArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(GlassArrow)
	ElseIf PlayerREF.IsEquipped(IronArrow)
		ArrowName = IronArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(IronArrow)
	ElseIf PlayerREF.IsEquipped(NordHeroArrow)
		ArrowName = NordHeroArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(NordHeroArrow)
	ElseIf PlayerREF.IsEquipped(OrcishArrow)
		ArrowName = OrcishArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(OrcishArrow)
	ElseIf PlayerREF.IsEquipped(SteelArrow)
		ArrowName = SteelArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(SteelArrow)
	Else
		ArrowName = ""
		ArrowCount2 = 0
	EndIf
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", ArrowVisible)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", ArrowCount)
	UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", ArrowCount2)
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", ArrowName)
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
	Return "WM/WM_ArrowCount.swf"
EndFunction


String Function GetWidgetType()
	Return "WM_ArrowCountQuestScript"
EndFunction


Function UpdateScale()
	UI.SetInt(HUD_MENU, WidgetRoot + ".Scale", ArrowSize)
EndFunction


Function UpdateStatus()
	if !ArrowVisible
		Return
	EndIf

	If PlayerREF.IsEquipped(DLC1BoltDwarven)
		ArrowName = DLC1BoltDwarven.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltDwarven)
	ElseIf PlayerREF.IsEquipped(DLC1BoltDwarvenExplodingFire)
		ArrowName = DLC1BoltDwarvenExplodingFire.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltDwarvenExplodingFire)
	ElseIf PlayerREF.IsEquipped(DLC1BoltDwarvenExplodingIce)
		ArrowName = DLC1BoltDwarvenExplodingIce.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltDwarvenExplodingIce)
	ElseIf PlayerREF.IsEquipped(DLC1BoltDwarvenExplodingShock)
		ArrowName = DLC1BoltDwarvenExplodingShock.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltDwarvenExplodingShock)
	ElseIf PlayerREF.IsEquipped(DLC1BoltSteel)
		ArrowName = DLC1BoltSteel.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltSteel)
	ElseIf PlayerREF.IsEquipped(DLC1BoltSteelExplodingFire)
		ArrowName = DLC1BoltSteelExplodingFire.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltSteelExplodingFire)
	ElseIf PlayerREF.IsEquipped(DLC1BoltSteelExplodingIce)
		ArrowName = DLC1BoltSteelExplodingIce.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltSteelExplodingIce)
	ElseIf PlayerREF.IsEquipped(DLC1BoltSteelExplodingShock)
		ArrowName = DLC1BoltSteelExplodingShock.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1BoltSteelExplodingShock)
	ElseIf PlayerREF.IsEquipped(DLC1DragonboneArrow)
		ArrowName = DLC1DragonboneArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC1DragonboneArrow)
	ElseIf PlayerREF.IsEquipped(DLC2NordicArrow)
		ArrowName = DLC2NordicArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC2NordicArrow)
	ElseIf PlayerREF.IsEquipped(DLC2RieklingSpearThrown)
		ArrowName = DLC2RieklingSpearThrown.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC2RieklingSpearThrown)
	ElseIf PlayerREF.IsEquipped(DLC2StalhrimArrow)
		ArrowName = DLC2StalhrimArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DLC2StalhrimArrow)
	ElseIf PlayerREF.IsEquipped(DraugrArrow)
		ArrowName = DraugrArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DraugrArrow)
	ElseIf PlayerREF.IsEquipped(DwarvenArrow)
		ArrowName = DwarvenArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(DwarvenArrow)
	ElseIf PlayerREF.IsEquipped(EbonyArrow)
		ArrowName = EbonyArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(EbonyArrow)
	ElseIf PlayerREF.IsEquipped(ElvenArrow)
		ArrowName = ElvenArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(ElvenArrow)
	ElseIf PlayerREF.IsEquipped(FalmerArrow)
		ArrowName = FalmerArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(FalmerArrow)
	ElseIf PlayerREF.IsEquipped(ForswornArrow)
		ArrowName = ForswornArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(ForswornArrow)
	ElseIf PlayerREF.IsEquipped(GlassArrow)
		ArrowName = GlassArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(GlassArrow)
	ElseIf PlayerREF.IsEquipped(IronArrow)
		ArrowName = IronArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(IronArrow)
	ElseIf PlayerREF.IsEquipped(NordHeroArrow)
		ArrowName = NordHeroArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(NordHeroArrow)
	ElseIf PlayerREF.IsEquipped(OrcishArrow)
		ArrowName = OrcishArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(OrcishArrow)
	ElseIf PlayerREF.IsEquipped(SteelArrow)
		ArrowName = SteelArrow.GetName()
		ArrowCount2 = PlayerRef.GetItemCount(SteelArrow)
	Else
		ArrowName = ""
		ArrowCount2 = 0
	EndIf
	If (Ready)
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount", PlayerRef.GetItemCount(WM_ArrowFormList))
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setLabelText", ArrowName)
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setCount2", ArrowCount2)
	EndIf
	; dynamic widget test working
	;If PlayerREF.IsWeaponDrawn() && PlayerREF.GetEquippedWeapon().IsBow()
	;	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", ArrowVisible)
	;Else
	;	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", !ArrowVisible)
	;EndIf
EndFunction

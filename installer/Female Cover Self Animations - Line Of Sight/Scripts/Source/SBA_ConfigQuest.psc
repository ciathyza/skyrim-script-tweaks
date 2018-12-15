Scriptname SBA_ConfigQuest extends ski_configbase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Bool           Property IsEnabled                        Auto
Bool           Property PowersEnabled                    Auto
Float          Property LOSCloakRate                     Auto
Float          Property LOSMonitorRate                   Auto
Float          Property LOSUpdateRate                    Auto
Float          Property NPCCloakRate                     Auto
GlobalVariable Property SBA_FacialExpressionEnabled      Auto
GlobalVariable Property SBA_FollowerEnabled              Auto
GlobalVariable Property SBA_LOSCloakRadius               Auto
GlobalVariable Property SBA_LOSEnabled                   Auto
GlobalVariable Property SBA_NPCCloakRadius               Auto
GlobalVariable Property SBA_NPCCoverSelfEnabled          Auto
Int            Property LOSCloakIndex                    Auto
Int            Property LOSCloakRadius                   Auto
Int            Property LOSUncoverDelay                  Auto
Int            Property NPCCloakIndex                    Auto
Int            Property NPCCloakRadius                   Auto
Quest          Property LOSQuest                         Auto
Quest          Property NPCQuest                         Auto
Spell          Property SBA_CoverTopAndBottomPower       Auto
Spell          Property SBA_CoverTopPower                Auto
Spell          Property SBA_StopCoverPower               Auto
Spell          Property SBA_ToggleFacialExpressionPower  Auto
Spell          Property SBA_ToggleFollowerCoverSelfPower Auto
Spell          Property SBA_ToggleNpcCoverSelfPower      Auto
Spell          Property SBA_ToggleNpcLOSPower            Auto

SBA_CoverSelfPlayerScript Property CoverSelfQuest Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Bool FacialExpressionEnabled
Bool FollowerEnabled
Bool LOSEnabled
Bool NPCEnabled
Bool SettingsChanged


; -------------------------------------------------------------------------------------------------
; MCM OIDs
; -------------------------------------------------------------------------------------------------

Int FacialExpressionEnabled_OID_B
Int FollowerEnabled_OID_B
Int IsEnabled_OID_B
Int LOSCloakRadius_OID_S
Int LOSCloakRate_OID_S
Int LOSEnabled_OID_B
Int LOSMonitorRate_OID_S
Int LOSUncoverDelay_OID_S
Int LOSUpdateRate_OID_S
Int NPCCloakRadius_OID_S
Int NPCCloakRate_OID_S
Int NPCEnabled_OID_B
Int PowersEnabled_OID_B


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

Event OnConfigInit()
	RegisterForSingleUpdate(1)
EndEvent


Event OnPageReset(String page)
	Int IsEnabledOptionFlag = OPTION_FLAG_DISABLED
	If IsEnabled
		IsEnabledOptionFlag = OPTION_FLAG_NONE
	EndIf

	FollowerEnabled = (SBA_FollowerEnabled.GetValue() as Bool)
	FacialExpressionEnabled = (SBA_FacialExpressionEnabled.GetValue() as Bool)
	SetCursorFillMode(TOP_TO_BOTTOM)
	SetCursorPosition(0)

	AddHeaderOption(GetName() + " v" + GetVersionString())
	IsEnabled_OID_B = AddToggleOption("Enabled", IsEnabled)

	AddHeaderOption("NPC Cover Self Options")
	NPCEnabled_OID_B     = AddToggleOption("NPC Enabled", NPCEnabled, IsEnabledOptionFlag)
	NPCCloakRadius_OID_S = AddSliderOption("NPC Radius", NPCCloakRadius, "{0} feet", IsEnabledOptionFlag)
	NPCCloakRate_OID_S   = AddSliderOption("NPC Search Rate", NPCCloakRate, "{1} seconds", IsEnabledOptionFlag)
	AddHeaderOption("Other Options")
	PowersEnabled_OID_B           = AddToggleOption("Cover Self Power Enabled", PowersEnabled, IsEnabledOptionFlag)
	FollowerEnabled_OID_B         = AddToggleOption("Follower Enabled", FollowerEnabled, IsEnabledOptionFlag)
	FacialExpressionEnabled_OID_B = AddToggleOption("Expressions Enabled", FacialExpressionEnabled, IsEnabledOptionFlag)
	SetCursorPosition(1)
	AddHeaderOption("Line of Sight Options")
	LOSEnabled_OID_B      = AddToggleOption("Line of Sight Enabled", LOSEnabled, IsEnabledOptionFlag)
	LOSCloakRadius_OID_S  = AddSliderOption("LoS Radius", LOSCloakRadius, "{0} feet", IsEnabledOptionFlag)
	LOSCloakRate_OID_S    = AddSliderOption("LoS Search Rate", LOSCloakRate, "{1} seconds", IsEnabledOptionFlag)
	LOSMonitorRate_OID_S  = AddSliderOption("LoS NPC Update Rate", LOSCloakRate, "{1} seconds", IsEnabledOptionFlag)
	LOSUpdateRate_OID_S   = AddSliderOption("LoS Player Update Rate", LOSUpdateRate, "{1} seconds", IsEnabledOptionFlag)
	LOSUncoverDelay_OID_S = AddSliderOption("Uncover Delay", LOSUncoverDelay, "{0} seconds", IsEnabledOptionFlag)
EndEvent


Event OnOptionSelect(Int option)
	If (option == IsEnabled_OID_B)
		IsEnabled = !IsEnabled
		SetToggleOptionValue(IsEnabled_OID_B, IsEnabled)
		EnableMod(IsEnabled)
	ElseIf (option == NPCEnabled_OID_B)
		NPCEnabled = !NPCEnabled
		SetToggleOptionValue(NPCEnabled_OID_B, NPCEnabled)
		EnableNPC(NPCEnabled)
	ElseIf (option == LOSEnabled_OID_B)
		LOSEnabled = !LOSEnabled
		SetToggleOptionValue(LOSEnabled_OID_B, LOSEnabled)
		EnableLOS(LOSEnabled)
	ElseIf (option == PowersEnabled_OID_B)
		PowersEnabled = !PowersEnabled
		SetToggleOptionValue(PowersEnabled_OID_B, PowersEnabled)
		EnablePowers(PowersEnabled)
	ElseIf (option == FollowerEnabled_OID_B)
		FollowerEnabled = !FollowerEnabled
		SetToggleOptionValue(FollowerEnabled_OID_B, FollowerEnabled)
		SBA_FollowerEnabled.SetValue(FollowerEnabled as Int)
	ElseIf (option == FacialExpressionEnabled_OID_B)
		FacialExpressionEnabled = !FacialExpressionEnabled
		SetToggleOptionValue(FacialExpressionEnabled_OID_B, FacialExpressionEnabled)
		SBA_FacialExpressionEnabled.SetValue(FacialExpressionEnabled as Int)
	Endif
EndEvent


Event OnOptionHighlight(Int option)
	If (option == IsEnabled_OID_B)
		SetInfoText("Enables or disables the mod.")
	ElseIf (option == NPCEnabled_OID_B)
		SetInfoText("Activate automatic Cover Self for all female NPCs.")
	ElseIf (option == LOSEnabled_OID_B)
		SetInfoText("Activate Line Of Sight detection for the player. Active Followers will not contribute to detection.")
	ElseIf (option == PowersEnabled_OID_B)
		SetInfoText("Adds lesser powers for manual Cover Self toggle to the player.")
	ElseIf (option == FollowerEnabled_OID_B)
		SetInfoText("Activate automatic Cover Self for all followers. NPC Cover Self needs to be enabled.")
	ElseIf (option == FacialExpressionEnabled_OID_B)
		SetInfoText("Activate facial expressions.")
	ElseIf (option == LOSMonitorRate_OID_S)
		SetInfoText("Set how frequent to update detection status on NPCs. Lesser value gives faster reaction times.")
	ElseIf (option == LOSCloakRate_OID_S)
		SetInfoText("Set how frequent to search for new NPCs entering detection radius.")
	ElseIf (option == LOSUpdateRate_OID_S)
		SetInfoText("Set how frequent to update LoS status on the player. Lesser value gives faster reaction times.")
	ElseIf (option == NPCCloakRate_OID_S)
		SetInfoText("Set how frequent to search for new NPCs entering detection radius.")
	ElseIf (option == LOSUncoverDelay_OID_S)
		SetInfoText("Set how many seconds to wait for uncovering when every NPC has lost sight.")
	ElseIf (option == LOSCloakRadius_OID_S)
		SetInfoText("Set the radius for NPC line of sight detection. 16 feet = 341 units. Max. 4096 units, equals one world cell. WARNING: Greater radius produces more stress on papyrus when a lot of NPCs are affected.")
	ElseIf (option == NPCCloakRadius_OID_S)
		SetInfoText("Set the radius for NPC Cover Self. 32 feet = 682 units. Max. 5461 units. WARNING: Greater radius produces more stress on papyrus when a lot of NPCs are affected.")
	EndIf
EndEvent


Event OnOptionSliderOpen(Int option)
	If (option == NPCCloakRadius_OID_S)
		SetSliderDialogStartValue(NPCCloakRadius)
		SetSliderDialogDefaultValue(192.0)
		SetSliderDialogRange(32.0, 256.0)
		SetSliderDialogInterval(32.0)
	ElseIf (option == NPCCloakRate_OID_S)
		SetSliderDialogStartValue(NPCCloakRate)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(1.0, 10.0)
		SetSliderDialogInterval(0.1)
	ElseIf (option == LOSCloakRadius_OID_S)
		SetSliderDialogStartValue(LOSCloakRadius)
		SetSliderDialogDefaultValue(80.0)
		SetSliderDialogRange(16.0, 192.0)
		SetSliderDialogInterval(16.0)
	ElseIf (option == LOSCloakRate_OID_S)
		SetSliderDialogStartValue(LOSCloakRate)
		SetSliderDialogDefaultValue(2.0)
		SetSliderDialogRange(1.0, 10.0)
		SetSliderDialogInterval(0.1)
	ElseIf (option == LOSMonitorRate_OID_S)
		SetSliderDialogStartValue(LOSMonitorRate)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.1, 10.0)
		SetSliderDialogInterval(0.1)
	ElseIf (option == LOSUpdateRate_OID_S)
		SetSliderDialogStartValue(LOSUpdateRate)
		SetSliderDialogDefaultValue(0.5)
		SetSliderDialogRange(0.1, 3.0)
		SetSliderDialogInterval(0.1)
	ElseIf (option == LOSUncoverDelay_OID_S)
		SetSliderDialogStartValue(LOSUncoverDelay)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(1.0, 30.0)
		SetSliderDialogInterval(1.0)
  Endif
EndEvent


Event OnOptionSliderAccept(Int option, Float value)
	If (option == NPCCloakRadius_OID_S)
		NPCCloakRadius = (value as Int)
		SetSliderOptionValue(NPCCloakRadius_OID_S, NPCCloakRadius, "{0} feet")
	ElseIf (option == NPCCloakRate_OID_S)
		NPCCloakRate = value
		SetSliderOptionValue(NPCCloakRate_OID_S, NPCCloakRate, "{1} seconds")
	ElseIf (option == LOSCloakRadius_OID_S)
		LOSCloakRadius = (value as Int)
		SetSliderOptionValue(LOSCloakRadius_OID_S, LOSCloakRadius, "{0} feet")
	ElseIf (option == LOSCloakRate_OID_S)
		LOSCloakRate = value
		SetSliderOptionValue(LOSCloakRate_OID_S, LOSCloakRate, "{1} seconds")
	ElseIf (option == LOSMonitorRate_OID_S)
		LOSMonitorRate = value
		SetSliderOptionValue(LOSMonitorRate_OID_S, LOSMonitorRate, "{1} seconds")
	ElseIf (option == LOSUpdateRate_OID_S)
		LOSUpdateRate = value
		SetSliderOptionValue(LOSUpdateRate_OID_S, LOSUpdateRate, "{1} seconds")
	ElseIf (option == LOSUncoverDelay_OID_S)
		LOSUncoverDelay = (value as Int)
		SetSliderOptionValue(LOSUncoverDelay_OID_S, LOSUncoverDelay, "{0} seconds")
  Endif
  LOSCloakIndex = ((LOSCloakRadius / 16) - 1)
  NPCCloakIndex = ((LOSCloakRadius / 32) - 1)
  SBA_LOSCloakRadius.SetValue((LOSCloakRadius * 22.3333) + 128)
  SBA_NPCCloakRadius.SetValue((NPCCloakRadius * 22.3333) + 128)
EndEvent


Event OnConfigClose()
	if SettingsChanged
		SettingsChanged = false
		if IsEnabled
			Debug.Notification(GetName() + " enabled.")
		Else
			Debug.Notification(GetName() + " disabled.")
		EndIf
	EndIf
EndEvent


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnUpdate()
	LOSCloakIndex = ((LOSCloakRadius / 16) - 1)
	NPCCloakIndex = ((LOSCloakRadius / 32) - 1)
	SBA_LOSCloakRadius.SetValue((LOSCloakRadius * 22.3333) + 128)
	SBA_NPCCloakRadius.SetValue((NPCCloakRadius * 22.3333) + 128)

	if !IsEnabled
		;EnableNPC(false)
		;EnableLOS(false)
		;SBA_FollowerEnabled.SetValue(0)
		;SBA_FacialExpressionEnabled.SetValue(0)
		EnablePowers(false)
	Else
		If NPCEnabled != (SBA_NPCCoverSelfEnabled.GetValue() as Bool)
			NPCEnabled = (SBA_NPCCoverSelfEnabled.GetValue() as Bool)
			EnableNPC(NPCEnabled)
		EndIf
		If LOSEnabled != (SBA_LOSEnabled.GetValue() as Bool)
			LOSEnabled = (SBA_LOSEnabled.GetValue() as Bool)
			EnableLOS(LOSEnabled)
		EndIf
		If FollowerEnabled != (SBA_FollowerEnabled.GetValue() as Bool)
			FollowerEnabled = (SBA_FollowerEnabled.GetValue() as Bool)
		EndIf
		If FacialExpressionEnabled != (SBA_FacialExpressionEnabled.GetValue() as Bool)
			FacialExpressionEnabled = (SBA_FacialExpressionEnabled.GetValue() as Bool)
		EndIf
		EnablePowers(PowersEnabled)
	EndIf
EndEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

String Function GetName()
	return "Female Cover Self"
EndFunction


String Function GetVersionString()
	return "1.0.0"
EndFunction


int Function GetVersion()
	return 100
EndFunction


Bool Function EnableMod(Bool value)
	RegisterForSingleUpdate(1)
	CoverSelfQuest.RegisterForSingleUpdate(1)
	if NPCEnabled
		NPCQuest.RegisterForSingleUpdate(1)
	EndIf
	If LOSEnabled
		LOSQuest.RegisterForSingleUpdate(1)
	EndIf
	SettingsChanged = true
EndFunction


Bool Function EnableNPC(Bool value)
	Int stg = NPCQuest.GetStage()
	SBA_NPCCoverSelfEnabled.SetValue(value as Float)
	If value
		If stg != 10
			NPCQuest.Start()
		Endif
	Else
		If stg == 10
			NPCQuest.SetStage(1000)
		Endif
	Endif
EndFunction


Bool Function EnableLOS(Bool value)
	Int stg = LOSQuest.GetStage()
	SBA_LOSEnabled.SetValue(value as Float)
	If value
		If stg != 10
			LOSQuest.Start()
			CoverSelfQuest.RegisterForSingleUpdate(1)
		Endif
	Else
		If stg == 10
			LOSQuest.SetStage(1000)
		Endif
	Endif
EndFunction


Bool Function EnablePowers(Bool value)
	Actor PlayerRef = Game.GetPlayer()
	If value
		PlayerRef.AddSpell(SBA_CoverTopPower, true)
		PlayerRef.AddSpell(SBA_CoverTopAndBottomPower, true)
		PlayerRef.AddSpell(SBA_StopCoverPower, true)
		PlayerRef.AddSpell(SBA_ToggleNpcCoverSelfPower, true)
		PlayerRef.AddSpell(SBA_ToggleFollowerCoverSelfPower, true)
		PlayerRef.AddSpell(SBA_ToggleFacialExpressionPower, true)
		PlayerRef.AddSpell(SBA_ToggleNpcLOSPower, true)
	Else
		PlayerRef.RemoveSpell(SBA_CoverTopPower)
		PlayerRef.RemoveSpell(SBA_CoverTopAndBottomPower)
		PlayerRef.RemoveSpell(SBA_StopCoverPower)
		PlayerRef.RemoveSpell(SBA_ToggleNpcCoverSelfPower)
		PlayerRef.RemoveSpell(SBA_ToggleFollowerCoverSelfPower)
		PlayerRef.RemoveSpell(SBA_ToggleFacialExpressionPower)
		PlayerRef.RemoveSpell(SBA_ToggleNpcLOSPower)
	Endif
EndFunction

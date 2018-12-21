Scriptname SFL4_SKSE_Quest extends SKI_ConfigBase

; -----

GlobalVariable Property WCT_Ability_Global_AttacksCostStamina_1H Auto
GlobalVariable Property WCT_Ability_Global_AttacksCostStamina_2H Auto
GlobalVariable Property WCT_Ability_Global_AttacksCostStamina_Bow Auto
GlobalVariable Property WCT_Ability_Global_DisableBowStaminaDrain Auto
GlobalVariable Property WCT_Ability_Global_DisableDynamicCombat Auto
GlobalVariable Property WCT_Ability_Global_Injuries Auto
GlobalVariable Property WCT_Ability_Global_DisableRegenFlux Auto
GlobalVariable Property WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina Auto
GlobalVariable Property WCT_Ability_Global_DisableSwimStaminaDrain Auto
GlobalVariable Property WCT_Ability_Global_DisableTimedBlock Auto
GlobalVariable Property WCT_Ability_Global_InjuryRektOMeter Auto
GlobalVariable Property WCT_Ability_Global_InjuryRektOMeter_Chance Auto
GlobalVariable Property WCT_Ability_Global_InjuryRektOMeter_Threshold Auto
GlobalVariable Property WCT_Ability_Global_DisableBowInterrupt Auto
GlobalVariable Property WCT_Ability_Global_InjuryThreshold_Chance Auto
GlobalVariable Property WCT_Ability_Global_InjuryThreshold_HP1 Auto
GlobalVariable Property WCT_Ability_Global_InjuryThreshold_HP2 Auto
GlobalVariable Property WCT_Modifier_Global_DisableAAO Auto
GlobalVariable Property WCT_Modifier_Global_DisableDirectionalDamage Auto
GlobalVariable Property WCT_Modifier_Global_DisableDynamicDamage Auto
GlobalVariable Property WCT_Modifier_Global_DisableMassive Auto
GlobalVariable Property WCT_Modifier_Global_DisableMelee Auto
GlobalVariable Property WCT_Stagger_Global_DisableStagger Auto
GlobalVariable Property WCT_TimedBlock_Global_SquelchTimedBlockMessage Auto
GlobalVariable Property WCT_Quest_Global_DifficultyWatchdog Auto
GlobalVariable Property WCT_VE_Global_By Auto
GlobalVariable Property WCT_VE_Global_To Auto
GlobalVariable Property WCT_E_Global_By Auto
GlobalVariable Property WCT_E_Global_To Auto
GlobalVariable Property WCT_N_Global_By Auto
GlobalVariable Property WCT_N_Global_To Auto
GlobalVariable Property WCT_H_Global_By Auto
GlobalVariable Property WCT_H_Global_To Auto
GlobalVariable Property WCT_VH_Global_By Auto
GlobalVariable Property WCT_VH_Global_To Auto
GlobalVariable Property WCT_L_Global_By Auto
GlobalVariable Property WCT_L_Global_To Auto
GlobalVariable Property WCT_Ability_Global_FBS Auto

String Property WCT_DynamicOptions Auto
String Property WCT_InjuryOptions Auto
String Property WCT_TimedBlockOptions Auto
String Property WCT_ModifierOptions Auto
String Property WCT_DifficultyOptions Auto
String Property WCT_StaminaOptions Auto

String Property WCT_Ability_Text_AttacksCostStamina_1H Auto
String Property WCT_Ability_Text_AttacksCostStamina_2H Auto
String Property WCT_Ability_Text_AttacksCostStamina_Bow Auto
String Property WCT_Ability_Text_DisableBowStaminaDrain Auto
String Property WCT_Ability_Text_DisableDynamicCombat Auto
String Property WCT_Ability_Text_Injuries Auto
String Property WCT_Ability_Text_DisableRegenFlux Auto
String Property WCT_Ability_Text_DisableSpeedPenaltyAtLowStamina Auto
String Property WCT_Ability_Text_DisableSwimStaminaDrain Auto
String Property WCT_Ability_Text_DisableTimedBlock Auto
String Property WCT_Ability_Text_InjuryRektOMeter Auto
String Property WCT_Ability_Text_InjuryRektOMeter_Chance Auto
String Property WCT_Ability_Text_InjuryRektOMeter_Threshold Auto
String Property WCT_Ability_Text_DisableBowInterrupt Auto
String Property WCT_Ability_Text_InjuryThreshold_Chance Auto
String Property WCT_Ability_Text_InjuryThreshold_HP1 Auto
String Property WCT_Ability_Text_InjuryThreshold_HP2 Auto
String Property WCT_Modifier_Text_DisableAAO Auto
String Property WCT_Modifier_Text_DisableDirectionalDamage Auto
String Property WCT_Modifier_Text_DisableDynamicDamage Auto
String Property WCT_Modifier_Text_DisableMassive Auto
String Property WCT_Modifier_Text_DisableMelee Auto
String Property WCT_Stagger_Text_DisableStagger Auto
String Property WCT_TimedBlock_Text_SquelchTimedBlockMessage Auto
String Property WCT_Quest_Text_DifficultyWatchdog Auto
String Property WCT_VE_Text_By Auto
String Property WCT_VE_Text_To Auto
String Property WCT_E_Text_By Auto
String Property WCT_E_Text_To Auto
String Property WCT_N_Text_By Auto
String Property WCT_N_Text_To Auto
String Property WCT_H_Text_By Auto
String Property WCT_H_Text_To Auto
String Property WCT_VH_Text_By Auto
String Property WCT_VH_Text_To Auto
String Property WCT_L_Text_By Auto
String Property WCT_L_Text_To Auto
String Property WCT_Ability_Text_FBS Auto

String Property WCT_Ability_Desc_AttacksCostStamina_1H Auto
String Property WCT_Ability_Desc_AttacksCostStamina_2H Auto
String Property WCT_Ability_Desc_AttacksCostStamina_Bow Auto
String Property WCT_Ability_Desc_DisableBowStaminaDrain Auto
String Property WCT_Ability_Desc_DisableDynamicCombat Auto
String Property WCT_Ability_Desc_Injuries Auto
String Property WCT_Ability_Desc_DisableRegenFlux Auto
String Property WCT_Ability_Desc_DisableSpeedPenaltyAtLowStamina Auto
String Property WCT_Ability_Desc_DisableSwimStaminaDrain Auto
String Property WCT_Ability_Desc_DisableTimedBlock Auto
String Property WCT_Ability_Desc_InjuryRektOMeter Auto
String Property WCT_Ability_Desc_InjuryRektOMeter_Chance Auto
String Property WCT_Ability_Desc_InjuryRektOMeter_Threshold Auto
String Property WCT_Ability_Desc_DisableBowInterrupt Auto
String Property WCT_Ability_Desc_InjuryThreshold_Chance Auto
String Property WCT_Ability_Desc_InjuryThreshold_HP1 Auto
String Property WCT_Ability_Desc_InjuryThreshold_HP2 Auto
String Property WCT_Modifier_Desc_DisableAAO Auto
String Property WCT_Modifier_Desc_DisableDirectionalDamage Auto
String Property WCT_Modifier_Desc_DisableDynamicDamage Auto
String Property WCT_Modifier_Desc_DisableMassive Auto
String Property WCT_Modifier_Desc_DisableMelee Auto
String Property WCT_Stagger_Desc_DisableStagger Auto
String Property WCT_TimedBlock_Desc_SquelchTimedBlockMessage Auto
String Property WCT_Quest_Desc_DifficultyWatchdog Auto
String Property WCT_Desc_By Auto
String Property WCT_Desc_To Auto
String Property WCT_Ability_Desc_FBS Auto

String Property WCT_Parse_Chance Auto
String Property WCT_Parse_Percent Auto
String Property WCT_Parse_PercentHealth Auto
String Property WCT_Parse_Stamcost Auto
String Property WCT_Parse_ByTo Auto

SFL4_Maintenance_Quest Property WCT Auto

; -----

Int T_AttacksCostStamina_1H
Int T_AttacksCostStamina_2H
Int T_AttacksCostStamina_Bow
Int T_DisableBowStaminaDrain
Int T_DisableDynamicCombat
Int T_Injuries
Int T_DisableRegenFlux
Int T_DisableSpeedPenaltyAtLowStamina
Int T_DisableSwimStaminaDrain
Int T_DisableTimedBlock
Int T_InjuryRektOMeter
Int T_InjuryRektOMeter_Chance
Int T_InjuryRektOMeter_Threshold
Int T_DisableBowInterrupt
Int T_InjuryThreshold_Chance
Int T_InjuryThreshold_HP1
Int T_InjuryThreshold_HP2
Int T_DisableAAO
Int T_DisableDirectionalDamage
Int T_DisableDynamicDamage
Int T_DisableMassive
Int T_DisableMelee
Int T_DisableStagger
Int T_SquelchTimedBlockMessage
Int T_DifficultyWatchdog
Int T_FBS
Int WCT_VE_T_By
Int WCT_VE_T_To
Int WCT_E_T_By
Int WCT_E_T_To
Int WCT_N_T_By
Int WCT_N_T_To
Int WCT_H_T_By
Int WCT_H_T_To
Int WCT_VH_T_By
Int WCT_VH_T_To
Int WCT_L_T_By
Int WCT_L_T_To

Int SClo
Int SInj
Int SRit
Int STit
Int SBck
Int SDif

; -----

Function CHid()

	If WCT_Ability_Global_DisableDynamicCombat.GetValue() == false
		SClo=OPTION_FLAG_NONE
	Else
		SClo=OPTION_FLAG_DISABLED
	EndIf

	If WCT_Ability_Global_Injuries.GetValue() == false && WCT_Ability_Global_DisableDynamicCombat.GetValue() == false
		SInj=OPTION_FLAG_NONE
	Else
		SInj=OPTION_FLAG_DISABLED
	EndIf

	If (WCT_Ability_Global_InjuryRektOMeter.GetValue() == true && WCT_Ability_Global_Injuries.GetValue() == false) && WCT_Ability_Global_DisableDynamicCombat.GetValue() == false
		SRit=OPTION_FLAG_NONE
	Else
		SRit=OPTION_FLAG_DISABLED
	EndIf

	If (WCT_Ability_Global_InjuryRektOMeter.GetValue() == false && WCT_Ability_Global_Injuries.GetValue() == false) && WCT_Ability_Global_DisableDynamicCombat.GetValue() == false
		STit=OPTION_FLAG_NONE
	Else
		STit=OPTION_FLAG_DISABLED
	EndIf

	If WCT_Ability_Global_DisableTimedBlock.GetValue() == false && WCT_Ability_Global_DisableDynamicCombat.GetValue() == false
		SBck=OPTION_FLAG_NONE
	Else
		SBck=OPTION_FLAG_DISABLED
	EndIf

	If WCT_Quest_Global_DifficultyWatchdog.GetValue() == true
		SDif=OPTION_FLAG_NONE
	Else
		SDif=OPTION_FLAG_DISABLED
	EndIf

	SetOptionFlags(T_AttacksCostStamina_1H, SClo)
	SetOptionFlags(T_AttacksCostStamina_2H, SClo)
	SetOptionFlags(T_AttacksCostStamina_Bow, SClo)
	SetOptionFlags(T_DisableBowStaminaDrain, SClo)
	SetOptionFlags(T_Injuries, SClo)
	SetOptionFlags(T_DisableRegenFlux, SClo)
	SetOptionFlags(T_DisableSpeedPenaltyAtLowStamina, SClo)
	SetOptionFlags(T_DisableSwimStaminaDrain, SClo)
	SetOptionFlags(T_DisableTimedBlock, SClo)
	SetOptionFlags(T_InjuryRektOMeter, SInj)
	SetOptionFlags(T_InjuryRektOMeter_Chance, SRit)
	SetOptionFlags(T_InjuryRektOMeter_Threshold, SRit)
	SetOptionFlags(T_DisableBowInterrupt, SClo)
	SetOptionFlags(T_InjuryThreshold_Chance, STit)
	SetOptionFlags(T_InjuryThreshold_HP1, STit)
	SetOptionFlags(T_InjuryThreshold_HP2, STit)
	SetOptionFlags(T_DisableStagger, SInj)
	SetOptionFlags(T_SquelchTimedBlockMessage, SBck)
	SetOptionFlags(WCT_VE_T_By, SDif)
	SetOptionFlags(WCT_VE_T_To, SDif)
	SetOptionFlags(WCT_E_T_By, SDif)
	SetOptionFlags(WCT_E_T_To, SDif)
	SetOptionFlags(WCT_N_T_By, SDif)
	SetOptionFlags(WCT_N_T_To, SDif)
	SetOptionFlags(WCT_H_T_By, SDif)
	SetOptionFlags(WCT_H_T_To, SDif)
	SetOptionFlags(WCT_VH_T_By, SDif)
	SetOptionFlags(WCT_VH_T_To, SDif)
	SetOptionFlags(WCT_L_T_By, SDif)
	SetOptionFlags(WCT_L_T_To, SDif)


EndFunction

; -----

Event OnPageReset(string akPage)

	SetCursorFillMode(TOP_TO_BOTTOM)

	CHid()

	SetCursorPosition(0)
	AddHeaderOption(WCT_DynamicOptions)

	T_DisableDynamicCombat=AddToggleOption(WCT_Ability_Text_DisableDynamicCombat, WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool)

	AddEmptyOption()

	T_DisableRegenFlux=AddToggleOption(WCT_Ability_Text_DisableRegenFlux, WCT_Ability_Global_DisableRegenFlux.GetValue() as Bool, Sclo)
	T_DisableSpeedPenaltyAtLowStamina=AddToggleOption(WCT_Ability_Text_DisableSpeedPenaltyAtLowStamina, WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.GetValue() as Bool, Sclo)
	T_DisableSwimStaminaDrain=AddToggleOption(WCT_Ability_Text_DisableSwimStaminaDrain, WCT_Ability_Global_DisableSwimStaminaDrain.GetValue() as Bool, Sclo)
	T_DisableBowInterrupt=AddToggleOption(WCT_Ability_Text_DisableBowInterrupt, WCT_Ability_Global_DisableBowInterrupt.GetValue() as Bool, SClo)
	T_FBS=AddToggleOption(WCT_Ability_Text_FBS, WCT_Ability_Global_FBS.GetValue() as Bool, Sclo)

	AddEmptyOption()
	AddHeaderOption(WCT_StaminaOptions)

	T_AttacksCostStamina_1H=AddSliderOption(WCT_Ability_Text_AttacksCostStamina_1H, WCT_Ability_Global_AttacksCostStamina_1H.GetValue(), WCT_Parse_Stamcost, Sclo)
	T_AttacksCostStamina_2H=AddSliderOption(WCT_Ability_Text_AttacksCostStamina_2H, WCT_Ability_Global_AttacksCostStamina_2H.GetValue(), WCT_Parse_Stamcost, Sclo)
	T_AttacksCostStamina_Bow=AddSliderOption(WCT_Ability_Text_AttacksCostStamina_Bow, WCT_Ability_Global_AttacksCostStamina_Bow.GetValue(), WCT_Parse_Stamcost, Sclo)
	T_DisableBowStaminaDrain=AddToggleOption(WCT_Ability_Text_DisableBowStaminaDrain, WCT_Ability_Global_DisableBowStaminaDrain.GetValue() as Bool, Sclo)

	AddEmptyOption()
	AddHeaderOption(WCT_InjuryOptions)

	T_Injuries=AddToggleOption(WCT_Ability_Text_Injuries, WCT_Ability_Global_Injuries.GetValue() as Bool, Sclo)

	AddEmptyOption()

	T_InjuryThreshold_Chance=AddSliderOption(WCT_Ability_Text_InjuryThreshold_Chance, WCT_Ability_Global_InjuryThreshold_Chance.GetValue(), WCT_Parse_Chance, STit)
	T_InjuryThreshold_HP1=AddSliderOption(WCT_Ability_Text_InjuryThreshold_HP1, WCT_Ability_Global_InjuryThreshold_HP1.GetValue()*100, WCT_Parse_PercentHealth, STit)
	T_InjuryThreshold_HP2=AddSliderOption(WCT_Ability_Text_InjuryThreshold_HP2, WCT_Ability_Global_InjuryThreshold_HP2.GetValue()*100, WCT_Parse_PercentHealth, STit)

	AddEmptyOption()

	T_InjuryRektOMeter=AddToggleOption(WCT_Ability_Text_InjuryRektOMeter, WCT_Ability_Global_InjuryRektOMeter.GetValue() as Bool, SInj)
	T_InjuryRektOMeter_Chance=AddSliderOption(WCT_Ability_Text_InjuryRektOMeter_Chance, WCT_Ability_Global_InjuryRektOMeter_Chance.GetValue(), WCT_Parse_Chance, SRit)
	T_InjuryRektOMeter_Threshold=AddSliderOption(WCT_Ability_Text_InjuryRektOMeter_Threshold, WCT_Ability_Global_InjuryRektOMeter_Threshold.GetValue(), WCT_Parse_PercentHealth, SRit)

	AddEmptyOption()

	T_DisableStagger=AddToggleOption(WCT_Stagger_Text_DisableStagger, WCT_Stagger_Global_DisableStagger.GetValue() as Bool, SInj)

	AddEmptyOption()
	AddHeaderOption(WCT_TimedBlockOptions)

	T_DisableTimedBlock=AddToggleOption(WCT_Ability_Text_DisableTimedBlock, WCT_Ability_Global_DisableTimedBlock.GetValue() as Bool, Sclo)

	AddEmptyOption()

	T_SquelchTimedBlockMessage=AddToggleOption(WCT_TimedBlock_Text_SquelchTimedBlockMessage, WCT_TimedBlock_Global_SquelchTimedBlockMessage.GetValue() as Bool, Sclo)

	SetCursorPosition(1)
	AddHeaderOption(WCT_ModifierOptions)

	T_DisableAAO=AddToggleOption(WCT_Modifier_Text_DisableAAO, WCT_Modifier_Global_DisableAAO.GetValue() as Bool)
	T_DisableDirectionalDamage=AddToggleOption(WCT_Modifier_Text_DisableDirectionalDamage, WCT_Modifier_Global_DisableDirectionalDamage.GetValue() as Bool)
	T_DisableDynamicDamage=AddToggleOption(WCT_Modifier_Text_DisableDynamicDamage, WCT_Modifier_Global_DisableDynamicDamage.GetValue() as Bool)
	T_DisableMelee=AddToggleOption(WCT_Modifier_Text_DisableMelee, WCT_Modifier_Global_DisableMelee.GetValue() as Bool)
	T_DisableMassive=AddToggleOption(WCT_Modifier_Text_DisableMassive, WCT_Modifier_Global_DisableMassive.GetValue() as Bool)

	AddEmptyOption()
	AddHeaderOption(WCT_DifficultyOptions)

	T_DifficultyWatchdog=AddToggleOption(WCT_Quest_Text_DifficultyWatchdog, WCT_Quest_Global_DifficultyWatchdog.GetValue() as Bool)
	WCT_VE_T_By=AddSliderOption(WCT_VE_Text_By, WCT_VE_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_VE_T_To=AddSliderOption(WCT_VE_Text_To, WCT_VE_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_E_T_By=AddSliderOption(WCT_E_Text_By, WCT_E_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_E_T_To=AddSliderOption(WCT_E_Text_To, WCT_E_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_N_T_By=AddSliderOption(WCT_N_Text_By, WCT_N_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_N_T_To=AddSliderOption(WCT_N_Text_To, WCT_N_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_H_T_By=AddSliderOption(WCT_H_Text_By, WCT_H_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_H_T_To=AddSliderOption(WCT_H_Text_To, WCT_H_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_VH_T_By=AddSliderOption(WCT_VH_Text_By, WCT_VH_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_VH_T_To=AddSliderOption(WCT_VH_Text_To, WCT_VH_Global_To.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_L_T_By=AddSliderOption(WCT_L_Text_By, WCT_L_Global_By.GetValue(), WCT_Parse_ByTo, SDif)
	WCT_L_T_To=AddSliderOption(WCT_L_Text_To, WCT_L_Global_To.GetValue(), WCT_Parse_ByTo, SDif)

	AddEmptyOption()


EndEvent

; -----

Event OnOptionSelect(Int akOp)

	If akOp==T_DisableBowStaminaDrain
		WCT_Ability_Global_DisableBowStaminaDrain.SetValue(1 - WCT_Ability_Global_DisableBowStaminaDrain.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableBowStaminaDrain, WCT_Ability_Global_DisableBowStaminaDrain.GetValue() as Bool)
	ElseIf akOp==T_DisableDynamicCombat
		WCT_Ability_Global_DisableDynamicCombat.SetValue(1 - WCT_Ability_Global_DisableDynamicCombat.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableDynamicCombat, WCT_Ability_Global_DisableDynamicCombat.GetValue() as Bool)
	ElseIf akOp==T_Injuries
		WCT_Ability_Global_Injuries.SetValue(1 - WCT_Ability_Global_Injuries.GetValue())
		Chid()
		SetToggleOptionValue(T_Injuries, WCT_Ability_Global_Injuries.GetValue() as Bool)
	ElseIf akOp==T_DisableBowInterrupt
		WCT_Ability_Global_DisableBowInterrupt.SetValue(1 - WCT_Ability_Global_DisableBowInterrupt.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableBowInterrupt, WCT_Ability_Global_DisableBowInterrupt.GetValue() as Bool)
	ElseIf akOp==T_InjuryRektOMeter
		WCT_Ability_Global_InjuryRektOMeter.SetValue(1 - WCT_Ability_Global_InjuryRektOMeter.GetValue())
		Chid()
		SetToggleOptionValue(T_InjuryRektOMeter, WCT_Ability_Global_InjuryRektOMeter.GetValue() as Bool)
	ElseIf akOp==T_DisableRegenFlux
		WCT_Ability_Global_DisableRegenFlux.SetValue(1 - WCT_Ability_Global_DisableRegenFlux.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableRegenFlux, WCT_Ability_Global_DisableRegenFlux.GetValue() as Bool)
	ElseIf akOp==T_DisableSpeedPenaltyAtLowStamina
		WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.SetValue(1 - WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableSpeedPenaltyAtLowStamina, WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.GetValue() as Bool)
	ElseIf akOp==T_DisableSwimStaminaDrain
		WCT_Ability_Global_DisableSwimStaminaDrain.SetValue(1 - WCT_Ability_Global_DisableSwimStaminaDrain.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableSwimStaminaDrain, WCT_Ability_Global_DisableSwimStaminaDrain.GetValue() as Bool)
	ElseIf akOp==T_DisableTimedBlock
		WCT_Ability_Global_DisableTimedBlock.SetValue(1 - WCT_Ability_Global_DisableTimedBlock.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableTimedBlock, WCT_Ability_Global_DisableTimedBlock.GetValue() as Bool)
	ElseIf akOp==T_DisableAAO
		WCT_Modifier_Global_DisableAAO.SetValue(1 - WCT_Modifier_Global_DisableAAO.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableAAO, WCT_Modifier_Global_DisableAAO.GetValue() as Bool)
	ElseIf akOp==T_DisableDirectionalDamage
		WCT_Modifier_Global_DisableDirectionalDamage.SetValue(1 - WCT_Modifier_Global_DisableDirectionalDamage.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableDirectionalDamage, WCT_Modifier_Global_DisableDirectionalDamage.GetValue() as Bool)
	ElseIf akOp==T_DisableDynamicDamage
		WCT_Modifier_Global_DisableDynamicDamage.SetValue(1 - WCT_Modifier_Global_DisableDynamicDamage.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableDynamicDamage, WCT_Modifier_Global_DisableDynamicDamage.GetValue() as Bool)
	ElseIf akOp==T_DisableMassive
		WCT_Modifier_Global_DisableMassive.SetValue(1 - WCT_Modifier_Global_DisableMassive.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableMassive, WCT_Modifier_Global_DisableMassive.GetValue() as Bool)
	ElseIf akOp==T_DisableMelee
		WCT_Modifier_Global_DisableMelee.SetValue(1 - WCT_Modifier_Global_DisableMelee.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableMelee, WCT_Modifier_Global_DisableMelee.GetValue() as Bool)
	ElseIf akOp==T_DisableStagger
		WCT_Stagger_Global_DisableStagger.SetValue(1 - WCT_Stagger_Global_DisableStagger.GetValue())
		Chid()
		SetToggleOptionValue(T_DisableStagger, WCT_Stagger_Global_DisableStagger.GetValue() as Bool)
	ElseIf akOp==T_SquelchTimedBlockMessage
		WCT_TimedBlock_Global_SquelchTimedBlockMessage.SetValue(1 - WCT_TimedBlock_Global_SquelchTimedBlockMessage.GetValue())
		Chid()
		SetToggleOptionValue(T_SquelchTimedBlockMessage, WCT_TimedBlock_Global_SquelchTimedBlockMessage.GetValue() as Bool)
	ElseIf akOp==T_DifficultyWatchdog
		WCT_Quest_Global_DifficultyWatchdog.SetValue(1 - WCT_Quest_Global_DifficultyWatchdog.GetValue())
		CHid()
		Bool NewWatchdog = WCT_Quest_Global_DifficultyWatchdog.GetValue() as Bool
		SetToggleOptionValue(T_DifficultyWatchdog, NewWatchdog)
		If NewWatchdog
			WCT.StartPolling()
		Else
			WCT.StopPolling()
		EndIf
	ElseIf akOp==T_FBS
		WCT_Ability_Global_FBS.SetValue(1 - WCT_Ability_Global_FBS.GetValue())
		Chid()
		SetToggleOptionValue(T_FBS, WCT_Ability_Global_FBS.GetValue() as Bool)
	EndIf


EndEvent

; -----

Event OnOptionDefault(Int akOp)

	If akOp==T_DisableBowStaminaDrain
		WCT_Ability_Global_DisableBowStaminaDrain.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableBowStaminaDrain, false)
	ElseIf akOp==T_DisableDynamicCombat
		WCT_Ability_Global_DisableDynamicCombat.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableDynamicCombat, false)
	ElseIf akOp==T_Injuries
		WCT_Ability_Global_Injuries.SetValue(1)
		Chid()
		SetToggleOptionValue(T_Injuries, false)
	ElseIf akOp==T_DisableBowInterrupt
		WCT_Ability_Global_DisableBowInterrupt.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableBowInterrupt, false)
	ElseIf akOp==T_InjuryRektOMeter
		WCT_Ability_Global_InjuryRektOMeter.SetValue(0)
		Chid()
		SetToggleOptionValue(T_InjuryRektOMeter, false)
	ElseIf akOp==T_DisableRegenFlux
		WCT_Ability_Global_DisableRegenFlux.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableRegenFlux, false)
	ElseIf akOp==T_DisableSpeedPenaltyAtLowStamina
		WCT_Ability_Global_DisableSpeedPenaltyAtLowStamina.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableSpeedPenaltyAtLowStamina, false)
	ElseIf akOp==T_DisableSwimStaminaDrain
		WCT_Ability_Global_DisableSwimStaminaDrain.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableSwimStaminaDrain, false)
	ElseIf akOp==T_DisableTimedBlock
		WCT_Ability_Global_DisableTimedBlock.SetValue(1)
		Chid()
		SetToggleOptionValue(T_DisableTimedBlock, false)
	ElseIf akOp==T_DisableAAO
		WCT_Modifier_Global_DisableAAO.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableAAO, false)
	ElseIf akOp==T_DisableDirectionalDamage
		WCT_Modifier_Global_DisableDirectionalDamage.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableDirectionalDamage, false)
	ElseIf akOp==T_DisableDynamicDamage
		WCT_Modifier_Global_DisableDynamicDamage.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableDynamicDamage, false)
	ElseIf akOp==T_DisableMassive
		WCT_Modifier_Global_DisableMassive.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableMassive, false)
	ElseIf akOp==T_DisableMelee
		WCT_Modifier_Global_DisableMelee.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableMelee, false)
	ElseIf akOp==T_DisableStagger
		WCT_Stagger_Global_DisableStagger.SetValue(0)
		Chid()
		SetToggleOptionValue(T_DisableStagger, false)
	ElseIf akOp==T_SquelchTimedBlockMessage
		WCT_TimedBlock_Global_SquelchTimedBlockMessage.SetValue(0)
		Chid()
		SetToggleOptionValue(T_SquelchTimedBlockMessage, false)
	ElseIf akOp==T_DifficultyWatchdog
		WCT_Quest_Global_DifficultyWatchdog.SetValue(0)
		CHid()
		SetToggleOptionValue(T_DifficultyWatchdog,false)
		WCT.StopPolling()
	ElseIf akOp==T_FBS
		WCT_Ability_Global_FBS.SetValue(0)
		Chid()
		SetToggleOptionValue(T_FBS, false)
	EndIf


EndEvent

; -----

Event OnOptionHighlight(Int akOp)

	If akOp==T_AttacksCostStamina_1H
		SetInfoText(WCT_Ability_Desc_AttacksCostStamina_1H)
	ElseIf akOp==T_AttacksCostStamina_2H
		SetInfoText(WCT_Ability_Desc_AttacksCostStamina_2H)
	ElseIf akOp==T_AttacksCostStamina_Bow
		SetInfoText(WCT_Ability_Desc_AttacksCostStamina_Bow)
	ElseIf akOp==T_DisableBowStaminaDrain
		SetInfoText(WCT_Ability_Desc_DisableBowStaminaDrain)
	ElseIf akOp==T_DisableDynamicCombat
		SetInfoText(WCT_Ability_Desc_DisableDynamicCombat)
	ElseIf akOp==T_Injuries
		SetInfoText(WCT_Ability_Desc_Injuries)
	ElseIf akOp==T_DisableBowInterrupt
		SetInfoText(WCT_Ability_Desc_DisableBowInterrupt)
	ElseIf akOp==T_InjuryRektOMeter
		SetInfoText(WCT_Ability_Desc_InjuryRektOMeter)
	ElseIf akOp==T_DisableRegenFlux
		SetInfoText(WCT_Ability_Desc_DisableRegenFlux)
	ElseIf akOp==T_DisableSpeedPenaltyAtLowStamina
		SetInfoText(WCT_Ability_Desc_DisableSpeedPenaltyAtLowStamina)
	ElseIf akOp==T_DisableSwimStaminaDrain
		SetInfoText(WCT_Ability_Desc_DisableSwimStaminaDrain)
	ElseIf akOp==T_DisableTimedBlock
		SetInfoText(WCT_Ability_Desc_DisableTimedBlock)
	ElseIf akOp==T_InjuryRektOMeter_Chance
		SetInfoText(WCT_Ability_Desc_InjuryRektOMeter_Chance)
	ElseIf akOp==T_InjuryRektOMeter_Threshold
		SetInfoText(WCT_Ability_Desc_InjuryRektOMeter_Threshold)
	ElseIf akOp==T_InjuryThreshold_Chance
		SetInfoText(WCT_Ability_Desc_InjuryThreshold_Chance)
	ElseIf akOp==T_InjuryThreshold_HP1
		SetInfoText(WCT_Ability_Desc_InjuryThreshold_HP1)
	ElseIf akOp==T_InjuryThreshold_HP2
		SetInfoText(WCT_Ability_Desc_InjuryThreshold_HP2)
	ElseIf akOp==T_DisableAAO
		SetInfoText(WCT_Modifier_Desc_DisableAAO)
	ElseIf akOp==T_DisableDirectionalDamage
		SetInfoText(WCT_Modifier_Desc_DisableDirectionalDamage)
	ElseIf akOp==T_DisableDynamicDamage
		SetInfoText(WCT_Modifier_Desc_DisableDynamicDamage)
	ElseIf akOp==T_DisableMassive
		SetInfoText(WCT_Modifier_Desc_DisableMassive)
	ElseIf akOp==T_DisableMelee
		SetInfoText(WCT_Modifier_Desc_DisableMelee)
	ElseIf akOp==T_DisableStagger
		SetInfoText(WCT_Stagger_Desc_DisableStagger)
	ElseIf akOp==T_SquelchTimedBlockMessage
		SetInfoText(WCT_TimedBlock_Desc_SquelchTimedBlockMessage)
	ElseIf akOp==T_DifficultyWatchdog
		SetInfoText(WCT_Quest_Desc_DifficultyWatchdog)
	ElseIf akOp==T_FBS
		SetInfoText(WCT_Ability_Desc_FBS)
	ElseIf akOp==WCT_VE_T_By
		SetInfoText(WCT_Desc_By)
	ElseIf akOp==WCT_VE_T_To
		SetInfoText(WCT_Desc_To)
	ElseIf akOp==WCT_E_T_By
		SetInfoText(WCT_Desc_By)
	ElseIf akOp==WCT_E_T_To
		SetInfoText(WCT_Desc_To)
	ElseIf akOp==WCT_N_T_By
		SetInfoText(WCT_Desc_By)
	ElseIf akOp==WCT_N_T_To
		SetInfoText(WCT_Desc_To)
	ElseIf akOp==WCT_H_T_By
		SetInfoText(WCT_Desc_By)
	ElseIf akOp==WCT_H_T_To
		SetInfoText(WCT_Desc_To)
	ElseIf akOp==WCT_VH_T_By
		SetInfoText(WCT_Desc_By)
	ElseIf akOp==WCT_VH_T_To
		SetInfoText(WCT_Desc_To)
	ElseIf akOp==WCT_L_T_By
		SetInfoText(WCT_Desc_By)
	ElseIf akOp==WCT_L_T_To
		SetInfoText(WCT_Desc_To)
	EndIf

EndEvent

; -----

Event OnOptionSliderOpen(Int akOp)

	If akOp==T_AttacksCostStamina_1H
		SetSliderDialogStartValue(WCT_Ability_Global_AttacksCostStamina_1H.GetValue())
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(0, 40)
		SetSliderDialogInterval(1)
	ElseIf akOp==T_AttacksCostStamina_2H
		SetSliderDialogStartValue(WCT_Ability_Global_AttacksCostStamina_2H.GetValue())
		SetSliderDialogDefaultValue(10)
		SetSliderDialogRange(0, 40)
		SetSliderDialogInterval(1)
	ElseIf akOp==T_AttacksCostStamina_Bow
		SetSliderDialogStartValue(WCT_Ability_Global_AttacksCostStamina_Bow.GetValue())
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(0, 40)
		SetSliderDialogInterval(1)
	ElseIf akOp==T_InjuryRektOMeter_Chance
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryRektOMeter_Chance.GetValue())
		SetSliderDialogDefaultValue(50)
		SetSliderDialogRange(5, 100)
		SetSliderDialogInterval(5)
	ElseIf akOp==T_InjuryRektOMeter_Threshold
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryRektOMeter_Threshold.GetValue())
		SetSliderDialogDefaultValue(30)
		SetSliderDialogRange(5, 95)
		SetSliderDialogInterval(5)
	ElseIf akOp==T_InjuryThreshold_Chance
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryThreshold_Chance.GetValue())
		SetSliderDialogDefaultValue(30)
		SetSliderDialogRange(5, 100)
		SetSliderDialogInterval(5)
	ElseIf akOp==T_InjuryThreshold_HP1
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryThreshold_HP1.GetValue()*100)
		SetSliderDialogDefaultValue(30)
		SetSliderDialogRange(0, 95)
		SetSliderDialogInterval(5)
	ElseIf akOp==T_InjuryThreshold_HP2
		SetSliderDialogStartValue(WCT_Ability_Global_InjuryThreshold_HP2.GetValue()*100)
		SetSliderDialogDefaultValue(15)
		SetSliderDialogRange(0, 95)
		SetSliderDialogInterval(5)
	ElseIf akOp==WCT_VE_T_By
		SetSliderDialogStartValue(WCT_VE_Global_By.GetValue())
		SetSliderDialogDefaultValue(2.5)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_VE_T_To
		SetSliderDialogStartValue(WCT_VE_Global_To.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_E_T_By
		SetSliderDialogStartValue(WCT_E_Global_By.GetValue())
		SetSliderDialogDefaultValue(2)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_E_T_To
		SetSliderDialogStartValue(WCT_E_Global_To.GetValue())
		SetSliderDialogDefaultValue(1.25)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_N_T_By
		SetSliderDialogStartValue(WCT_N_Global_By.GetValue())
		SetSliderDialogDefaultValue(1.5)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_N_T_To
		SetSliderDialogStartValue(WCT_N_Global_To.GetValue())
		SetSliderDialogDefaultValue(1.5)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_H_T_By
		SetSliderDialogStartValue(WCT_H_Global_By.GetValue())
		SetSliderDialogDefaultValue(1.25)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_H_T_To
		SetSliderDialogStartValue(WCT_H_Global_To.GetValue())
		SetSliderDialogDefaultValue(2)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_VH_T_By
		SetSliderDialogStartValue(WCT_VH_Global_By.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_VH_T_To
		SetSliderDialogStartValue(WCT_VH_Global_To.GetValue())
		SetSliderDialogDefaultValue(2.5)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_L_T_By
		SetSliderDialogStartValue(WCT_L_Global_By.GetValue())
		SetSliderDialogDefaultValue(0.5)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	ElseIf akOp==WCT_L_T_To
		SetSliderDialogStartValue(WCT_L_Global_To.GetValue())
		SetSliderDialogDefaultValue(3.5)
		SetSliderDialogRange(0.25, 8)
		SetSliderDialogInterval(0.25)
	EndIf

EndEvent

; -----

Event OnOptionSliderAccept(Int akOp, Float akValue)

	If akOp==T_AttacksCostStamina_1H
		WCT_Ability_Global_AttacksCostStamina_1H.SetValue(akValue)
		Chid()
		SetSliderOptionValue(T_AttacksCostStamina_1H, akValue, WCT_Parse_Stamcost)
	ElseIf akOp==T_AttacksCostStamina_2H
		WCT_Ability_Global_AttacksCostStamina_2H.SetValue(akValue)
		Chid()
		SetSliderOptionValue(T_AttacksCostStamina_2H, akValue, WCT_Parse_Stamcost)
	ElseIf akOp==T_AttacksCostStamina_Bow
		WCT_Ability_Global_AttacksCostStamina_Bow.SetValue(akValue)
		Chid()
		SetSliderOptionValue(T_AttacksCostStamina_Bow, akValue, WCT_Parse_Stamcost)
	ElseIf akOp==T_InjuryRektOMeter_Chance
		WCT_Ability_Global_InjuryRektOMeter_Chance.SetValue(akValue)
		Chid()
		SetSliderOptionValue(T_InjuryRektOMeter_Chance, akValue, WCT_Parse_Chance)
	ElseIf akOp==T_InjuryRektOMeter_Threshold
		WCT_Ability_Global_InjuryRektOMeter_Threshold.SetValue(akValue)
		Chid()
		SetSliderOptionValue(T_InjuryRektOMeter_Threshold, akValue, WCT_Parse_PercentHealth)
	ElseIf akOp==T_InjuryThreshold_Chance
		WCT_Ability_Global_InjuryThreshold_Chance.SetValue(akValue)
		Chid()
		SetSliderOptionValue(T_InjuryThreshold_Chance, akValue, WCT_Parse_Chance)
	ElseIf akOp==T_InjuryThreshold_HP1
		WCT_Ability_Global_InjuryThreshold_HP1.SetValue(akValue/100)
		Chid()
		SetSliderOptionValue(T_InjuryThreshold_HP1, akValue, WCT_Parse_PercentHealth)
	ElseIf akOp==T_InjuryThreshold_HP2
		WCT_Ability_Global_InjuryThreshold_HP2.SetValue(akValue/100)
		Chid()
		SetSliderOptionValue(T_InjuryThreshold_HP2, akValue, WCT_Parse_PercentHealth)
	Else
		; difficulty
		If akOp==WCT_VE_T_By
			WCT_VE_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_VE_T_By, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_VE_T_To
			WCT_VE_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_VE_T_To, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_E_T_By
			WCT_E_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_E_T_By, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_E_T_To
			WCT_E_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_E_T_To, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_N_T_By
			WCT_N_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_N_T_By, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_N_T_To
			WCT_N_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_N_T_To, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_H_T_By
			WCT_H_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_H_T_By, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_H_T_To
			WCT_H_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_H_T_To, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_VH_T_By
			WCT_VH_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_VH_T_By, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_VH_T_To
			WCT_VH_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_VH_T_To, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_L_T_By
			WCT_L_Global_By.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_L_T_By, akValue, WCT_Parse_ByTo)
		ElseIf akOp==WCT_L_T_To
			WCT_L_Global_To.SetValue(akValue)
			CHid()
			SetSliderOptionValue(WCT_L_T_To, akValue, WCT_Parse_ByTo)
		EndIf
		WCT.UGS()
	EndIf


EndEvent

; -----
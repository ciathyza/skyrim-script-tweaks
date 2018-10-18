;/ Decompiled by Champollion V1.0.0
Source   : zbloodEBTmenu.psc
Modified : 2015-10-24 07:08:47
Compiled : 2015-10-25 00:55:23
User     : BATMAN
Computer : JMJ-RM-PC
/;
scriptName zbloodEBTmenu extends SKI_ConfigBase

;-- Properties --------------------------------------
globalvariable property zblood_spas_chance_kill auto
quest property zGoreEffectsPlayerQuest auto
globalvariable property zblood_versionnumber auto
globalvariable property zblood_spas_amount auto
globalvariable property zblood_updated auto
globalvariable property zblood_severeMin auto
globalvariable property zblood_spas_chance_head auto
globalvariable property zblood_spas_mass auto
spell property BloodMonitorAbility auto
message property zbloodFinalMessage auto
globalvariable property zblood_poolEnabled auto
globalvariable property zblood_scriptDelay auto

;-- Variables ---------------------------------------
Float IDscreenDuration = 6.00000
Bool AmainVal = true
Int FlaggingAll
Int isUninstall = 0
Int _poolEnabled_B
Int _uninstall_T
Int _screenSizeMax_S
Int Flagging
Int _spas_chance_kill_S
Int _screenAmount_S
Int _weaponDuration_S
Int _screenblood_B
Float IDscriptDelay = 2.50000
Float IDwoundDuration = 256.000
Float hold
Float IDscreenSizeMax = 0.350000
Float IDweaponBloodDuration = 360.000
Float IDweaponFadeDuration = 60.0000
Float IDscreenSizeMin = 0.150000
Bool ApoolVal = true
Bool AmassVal = false
Int _screenDuration_S
Int _cloakReset_T
Int UpdateCode = 0
Bool AscreenVal = false
Int FlaggingMain
Int _scriptDelay_S
Int _spas_force_S
Int _mainblood_B
Float IDscreenAmount = 0.0
Int _severeMin_S
Int FlaggingSP
Int _spas_mass_B
Int _woundDuration_S
Int _screenSizeMin_S
Int _spas_chance_head_S

;-- Functions ---------------------------------------

function OnPageReset(String page)

	self.SetCursorFillMode(self.TOP_TO_BOTTOM)
	self.AddHeaderOption("Screen Blood", 0)
	_screenblood_B = self.AddToggleOption("Enabled", AscreenVal, FlaggingMain)
	_screenAmount_S = self.AddSliderOption("Max Amount", IDscreenAmount as Float, "{0}", Flagging)
	_screenSizeMax_S = self.AddSliderOption("Max Size", IDscreenSizeMax, "{2}", Flagging)
	_screenSizeMin_S = self.AddSliderOption("Min Size", IDscreenSizeMin, "{2}", Flagging)
	_screenDuration_S = self.AddSliderOption("Duration", IDscreenDuration, "{0} Seconds", Flagging)
	self.AddHeaderOption("Blood on Weapons", 0)
	_weaponDuration_S = self.AddSliderOption("Duration", IDweaponBloodDuration, "{0} Seconds", FlaggingMain)
	self.AddHeaderOption("Blood Lifetime", 0)
	_woundDuration_S = self.AddSliderOption("Duration", IDwoundDuration, "{0} Seconds", FlaggingMain)
	self.AddHeaderOption("Severe Blood Splatters", 0)
	_severeMin_S = self.AddSliderOption("Minimal Damage", zblood_severeMin.getValue(), "{2} Percent", FlaggingAll)
	self.SetCursorPosition(1)
	self.AddHeaderOption("Main Functions", 0)
	_mainblood_B = self.AddToggleOption("Enable NPC Scripts", AmainVal, FlaggingMain)
	_poolEnabled_B = self.AddToggleOption("Blood Pools", zblood_poolEnabled.getValueInt() as Bool, FlaggingAll)
	_scriptDelay_S = self.AddSliderOption("Script Update Rate", zblood_scriptDelay.getValue(), "{1} Seconds", FlaggingAll)
	self.AddHeaderOption("Spasms", 0)
	_spas_chance_head_S = self.AddSliderOption("Chance on Decap", zblood_spas_chance_head.getValue(), "{2} Percent", FlaggingAll)
	_spas_chance_kill_S = self.AddSliderOption("Chance on Killmove", zblood_spas_chance_kill.getValue(), "{2} Percent", FlaggingAll)
	_spas_mass_B = self.AddToggleOption("Calculate for Mass", AmassVal, FlaggingAll)
	_spas_force_S = self.AddSliderOption("Impulse Force", zblood_spas_amount.getValue(), "{0}", FlaggingSP)
	self.AddHeaderOption("Other", 0)
	_cloakReset_T = self.AddTextOption("Reset Cloak Spell", "", FlaggingAll)
	_uninstall_T = self.AddTextOption("Uninstall Mod", "", FlaggingMain)
endFunction

; Skipped compiler generated GotoState

function OnOptionHighlight(Int option)

	if option == _mainblood_B
		self.SetInfoText("DEBUG: Turning this off will remove bleeding scripts from NPCs.(Disable NPC bleeding) This doesn't mean it will stop scripts from running. \nDefault: On")
	elseIf option == _uninstall_T
		self.SetInfoText("Exit all menus after clicking this and wait for a message box. Make sure that you are in a location where there are no other blood decals. Make a clean save or else the MCM menu will not reset.")
	elseIf option == _cloakReset_T
		self.SetInfoText("DEBUG: Resets the cloak applying spell and remove NPC scripts until process is finished. Possible fix if blood splatters isn't working or fix other issues.")
	elseIf option == _screenblood_B
		self.SetInfoText("Blood that appears on your screen when you take damage.\nDefault: Off")
	elseIf option == _screenAmount_S
		self.SetInfoText("Max amount of blood splatters on screen at once.\nDefault: 0")
	elseIf option == _screenSizeMax_S
		self.SetInfoText("Max size of screen blood.\nSize will be chosen randomly between max and min.\nDefault: 0.35")
	elseIf option == _screenSizeMin_S
		self.SetInfoText("Min size of screen blood.\nSize will be chosen randomly between max and min.\nDefault: 0.15")
	elseIf option == _screenDuration_S
		self.SetInfoText("How long will screen blood last before disappearing \nDefault: 6")
	elseIf option == _weaponDuration_S
		self.SetInfoText("How long will blood last on weapons. Set to 0 to disable. \nDefault: 360")
	elseIf option == _woundDuration_S
		self.SetInfoText("How long will wounds and blood spatters last in seconds. Those are hardcoded into one setting and cannot be set individually. \nDefault: 256")
	elseIf option == _poolEnabled_B
		self.SetInfoText("Blood pools appear when an actor dies after getting hit at least once from melee or arrows. If you have issues with blood pools not appearing then you may need to increase your graphic's decal amount setting.\nDefault: On")
	elseIf option == _spas_chance_head_S
		self.SetInfoText("Spasm chance on decapitations \nDefault: 0.50")
	elseIf option == _spas_chance_kill_S
		self.SetInfoText("Spasm chance on killmoves \nDefault: 0.85")
	elseIf option == _spas_force_S
		self.SetInfoText("Amount of force or movement the body will do during spasms. Recommend increasing this setting if you are using ragdoll mods or body mods that change the weight and limbs or if you just want them to react more. \nDefault: 15")
	elseIf option == _spas_mass_B
		self.SetInfoText("Heaver bodies have less spasm force when toggled on. This is affected by mods that change character models or ragdolls, which can cause bodies to not spasm. \nDefault: Off")
	elseIf option == _scriptDelay_S
		self.SetInfoText("The rate that the blood scripts will attempt to apply to surrounding NPCs. Higher values will reduce update strain, but it will be slower apply to newly encountered NPCs. \nDefault: 2.5")
	elseIf option == _severeMin_S
		self.SetInfoText("Minimum percent of damage to actor's base health needed for severe blood splatters to appear in place of normal blood splatters. Changes to this setting will only affect newly encountered NPCs. \nRecommend leaving this at default unless you are using mods that change damage. Lower numbers will produce more blood.")
	endIf
endFunction

function OnOptionSliderOpen(Int option)

	if option == _severeMin_S
		self.SetSliderDialogStartValue(zblood_severeMin.getValue())
		self.SetSliderDialogDefaultValue(zblood_severeMin.getValue())
		self.SetSliderDialogRange(0.000000, 1.00000)
		self.SetSliderDialogInterval(0.0100000)
	elseIf option == _scriptDelay_S
		self.SetSliderDialogStartValue(zblood_scriptDelay.getValue())
		self.SetSliderDialogDefaultValue(zblood_scriptDelay.getValue())
		self.SetSliderDialogRange(1.00000, 25.0000)
		self.SetSliderDialogInterval(0.100000)
	elseIf option == _screenAmount_S
		self.SetSliderDialogStartValue(game.getGameSettingint("iBloodSplatterMaxCount") as Float)
		self.SetSliderDialogDefaultValue(game.getGameSettingint("iBloodSplatterMaxCount") as Float)
		self.SetSliderDialogRange(1.00000, 50.0000)
		self.SetSliderDialogInterval(1.00000)
	elseIf option == _screenSizeMax_S
		self.SetSliderDialogStartValue(game.getGameSettingfloat("fBloodSplatterMaxSize"))
		self.SetSliderDialogDefaultValue(game.getGameSettingfloat("fBloodSplatterMaxSize"))
		self.SetSliderDialogRange(0.0100000, 2.50000)
		self.SetSliderDialogInterval(0.0100000)
	elseIf option == _screenSizeMin_S
		self.SetSliderDialogStartValue(game.getGameSettingfloat("fBloodSplatterMinSize"))
		self.SetSliderDialogDefaultValue(game.getGameSettingfloat("fBloodSplatterMinSize"))
		self.SetSliderDialogRange(0.0200000, 2.25000)
		self.SetSliderDialogInterval(0.0100000)
	elseIf option == _screenDuration_S
		self.SetSliderDialogStartValue(game.getGameSettingfloat("fBloodSplatterDuration"))
		self.SetSliderDialogDefaultValue(game.getGameSettingfloat("fBloodSplatterDuration"))
		self.SetSliderDialogRange(1.00000, 60.0000)
		self.SetSliderDialogInterval(1.00000)
	elseIf option == _weaponDuration_S
		self.SetSliderDialogStartValue(game.getGameSettingfloat("fWeaponBloodLifetime"))
		self.SetSliderDialogDefaultValue(game.getGameSettingfloat("fWeaponBloodLifetime"))
		self.SetSliderDialogRange(0.000000, 500.000)
		self.SetSliderDialogInterval(1.00000)
	elseIf option == _woundDuration_S
		hold = utility.GetINIFloat("fDecalLifetime:Display")
		if hold > 1000.00
			hold = 1000.00
		endIf
		self.SetSliderDialogStartValue(hold)
		self.SetSliderDialogDefaultValue(hold)
		self.SetSliderDialogRange(0.000000, 1000.00)
		self.SetSliderDialogInterval(1.00000)
	elseIf option == _spas_chance_head_S
		self.SetSliderDialogStartValue(zblood_spas_chance_head.getValue())
		self.SetSliderDialogDefaultValue(zblood_spas_chance_head.getValue())
		self.SetSliderDialogRange(0.000000, 1.00000)
		self.SetSliderDialogInterval(0.0500000)
	elseIf option == _spas_chance_kill_S
		self.SetSliderDialogStartValue(zblood_spas_chance_kill.getValue())
		self.SetSliderDialogDefaultValue(zblood_spas_chance_kill.getValue())
		self.SetSliderDialogRange(0.000000, 1.00000)
		self.SetSliderDialogInterval(0.0500000)
	elseIf option == _spas_force_S
		self.SetSliderDialogStartValue(zblood_spas_amount.getValue())
		self.SetSliderDialogDefaultValue(zblood_spas_amount.getValue())
		self.SetSliderDialogRange(5.00000, 100.000)
		self.SetSliderDialogInterval(1.00000)
	endIf
endFunction

function OnOptionSliderAccept(Int option, Float value)

	if option == _severeMin_S
		hold = value
		zblood_severeMin.setValue(hold)
		self.SetSliderOptionValue(_severeMin_S, hold, "{2} Percent", false)
	elseIf option == _scriptDelay_S
		hold = value
		zblood_scriptDelay.setValue(hold)
		self.SetSliderOptionValue(_scriptDelay_S, hold, "{1} Seconds", false)
	elseIf option == _screenAmount_S
		hold = value
		game.SetGameSettingInt("iBloodSplatterMaxCount", hold as Int)
		self.SetSliderOptionValue(_screenAmount_S, hold, "{0}", false)
		IDscreenAmount = hold
	elseIf option == _screenSizeMax_S
		hold = value
		game.setGameSettingfloat("fBloodSplatterMaxSize", hold)
		self.SetSliderOptionValue(_screenSizeMax_S, hold, "{2}", false)
		IDscreenSizeMax = hold
	elseIf option == _screenSizeMin_S
		hold = value
		game.setGameSettingfloat("fBloodSplatterMinSize", hold)
		self.SetSliderOptionValue(_screenSizeMin_S, hold, "{2}", false)
		IDscreenSizeMin = hold
	elseIf option == _screenDuration_S
		hold = value
		game.setGameSettingfloat("fBloodSplatterDuration", hold)
		self.SetSliderOptionValue(_screenDuration_S, hold, "{0} Seconds", false)
		IDscreenDuration = hold
	elseIf option == _weaponDuration_S
		hold = value
		game.setGameSettingfloat("fWeaponBloodLifetime", hold)
		self.SetSliderOptionValue(_weaponDuration_S, hold, "{0} Seconds", false)
		IDweaponBloodDuration = hold
		if IDweaponBloodDuration <= 2 as Float
			IDweaponFadeDuration = 1 as Float
		elseIf IDweaponBloodDuration <= 20 as Float
			IDweaponFadeDuration = 5 as Float
		elseIf IDweaponBloodDuration >= 21 as Float
			IDweaponFadeDuration = 10 as Float
		endIf
		game.setGameSettingfloat("fWeaponBloodFadeDuration", IDweaponFadeDuration)
	elseIf option == _woundDuration_S
		hold = value
		utility.SetINIFloat("fDecalLifetime:Display", hold)
		self.SetSliderOptionValue(_woundDuration_S, hold, "{0} Seconds", false)
		IDwoundDuration = hold
	elseIf option == _spas_chance_kill_S
		hold = value
		zblood_spas_chance_kill.setValue(hold)
		self.SetSliderOptionValue(_spas_chance_kill_S, hold, "{2} Percent", false)
	elseIf option == _spas_chance_head_S
		hold = value
		zblood_spas_chance_head.setValue(hold)
		self.SetSliderOptionValue(_spas_chance_head_S, hold, "{2} Percent", false)
	elseIf option == _spas_force_S
		hold = value
		zblood_spas_amount.setValue(hold)
		self.SetSliderOptionValue(_spas_force_S, hold, "{0}", false)
	endIf
endFunction

function OnOptionSelect(Int option)

	if option == _screenblood_B
		if AscreenVal == true
			AscreenVal = !AscreenVal
			self.SetToggleOptionValue(_screenblood_B, AscreenVal, false)
			game.SetGameSettingInt("iBloodSplatterMaxCount", 0)
			self.SetOptionFlags(_screenAmount_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_screenSizeMax_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_screenSizeMin_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_screenDuration_S, self.OPTION_FLAG_DISABLED, false)
			IDscreenAmount = 0.000000
			Flagging = self.OPTION_FLAG_DISABLED
		elseIf AscreenVal == false
			AscreenVal = !AscreenVal
			self.SetToggleOptionValue(_screenblood_B, AscreenVal, false)
			game.SetGameSettingInt("iBloodSplatterMaxCount", 10)
			self.SetSliderOptionValue(_screenAmount_S, 10 as Float, "{0}", false)
			self.SetOptionFlags(_screenAmount_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_screenSizeMax_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_screenSizeMin_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_screenDuration_S, self.OPTION_FLAG_NONE, false)
			IDscreenAmount = 10.0000
			Flagging = self.OPTION_FLAG_NONE
		endIf
	elseIf option == _poolEnabled_B
		if ApoolVal == true
			ApoolVal = !ApoolVal
			self.SetToggleOptionValue(_poolEnabled_B, ApoolVal, false)
			zblood_poolEnabled.setValueInt(0)
		elseIf ApoolVal == false
			ApoolVal = !ApoolVal
			self.SetToggleOptionValue(_poolEnabled_B, ApoolVal, false)
			zblood_poolEnabled.setValueInt(1)
		endIf
	elseIf option == _spas_mass_B
		if AmassVal == true
			AmassVal = !AmassVal
			self.SetToggleOptionValue(_spas_mass_B, AmassVal, false)
			self.SetSliderOptionValue(_spas_force_S, 15.0000, "{0}", false)
			FlaggingSP = self.OPTION_FLAG_NONE
			zblood_spas_amount.setValue(15.0000)
			zblood_spas_mass.setValueInt(0)
			self.SetOptionFlags(_spas_force_S, self.OPTION_FLAG_NONE, false)
		elseIf AmassVal == false
			AmassVal = !AmassVal
			zblood_spas_amount.setValue(15.0000)
			self.SetToggleOptionValue(_spas_mass_B, AmassVal, false)
			self.SetSliderOptionValue(_spas_force_S, 50.0000, "{0}", false)
			FlaggingSP = self.OPTION_FLAG_DISABLED
			zblood_spas_amount.setValue(50.0000)
			zblood_spas_mass.setValueInt(1)
			self.SetOptionFlags(_spas_force_S, self.OPTION_FLAG_DISABLED, false)
		endIf
	elseIf option == _mainblood_B
		if AmainVal == true
			AmainVal = !AmainVal
			self.SetToggleOptionValue(_mainblood_B, AmainVal, false)
			FlaggingAll = self.OPTION_FLAG_DISABLED
			zblood_updated.setValueInt(0)
			self.SetOptionFlags(_poolEnabled_B, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_severeMin_S, self.OPTION_FLAG_DISABLED, false)
			self.SetOptionFlags(_scriptDelay_S, self.OPTION_FLAG_DISABLED, false)
		elseIf AmainVal == false
			AmainVal = !AmainVal
			self.SetToggleOptionValue(_mainblood_B, AmainVal, false)
			FlaggingAll = self.OPTION_FLAG_NONE
			zblood_updated.setValueInt(1)
			self.SetOptionFlags(_poolEnabled_B, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_severeMin_S, self.OPTION_FLAG_NONE, false)
			self.SetOptionFlags(_scriptDelay_S, self.OPTION_FLAG_NONE, false)
			zblood_scriptDelay.setValue(2.50000)
			self.SetSliderOptionValue(_scriptDelay_S, 2.50000, "{1} Seconds", false)
		endIf
	elseIf option == _cloakReset_T
		if self.showmessage("Reset the cloak spell?", true, "$Accept", "$Cancel")
			zblood_updated.setValueInt(0)
			utility.wait(5 as Float)
			game.GetPlayer().RemoveSpell(BloodMonitorAbility)
			utility.wait(3.50000)
			debug.Notification("EBT: Reset finished")
			zblood_updated.setValueInt(1)
			game.GetPlayer().AddSpell(BloodMonitorAbility, true)
		endIf
	elseIf option == _uninstall_T
		Bool ifTrue = false
		if self.showmessage("This will uninstall the mod. Are you sure?", true, "$Accept", "$Cancel")
			isUninstall = 1
			FlaggingAll = self.OPTION_FLAG_DISABLED
			Flagging = self.OPTION_FLAG_DISABLED
			FlaggingMain = self.OPTION_FLAG_DISABLED
			zblood_updated.setValueInt(0)
			zblood_versionnumber.setValue(0.000000)
			self.SetOptionFlags(_poolEnabled_B, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_mainblood_B, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_screenblood_B, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_severeMin_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_screenAmount_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_screenSizeMax_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_screenSizeMin_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_woundDuration_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_spas_chance_head_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_spas_chance_kill_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_spas_force_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_spas_mass_B, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_scriptDelay_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_cloakReset_T, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_weaponDuration_S, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_uninstall_T, self.OPTION_FLAG_DISABLED, true)
			self.SetOptionFlags(_screenDuration_S, self.OPTION_FLAG_DISABLED, false)
			utility.wait(5 as Float)
			game.GetPlayer().RemoveSpell(BloodMonitorAbility)
			utility.wait(5 as Float)
			Int messages2 = zbloodFinalMessage.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			FlaggingAll = self.OPTION_FLAG_NONE
			Flagging = self.OPTION_FLAG_NONE
			FlaggingMain = self.OPTION_FLAG_NONE
			zblood_updated.setValueInt(0)
			zblood_versionnumber.setValue(0.000000)
			self.SetOptionFlags(_poolEnabled_B, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_mainblood_B, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_screenblood_B, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_severeMin_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_screenAmount_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_screenSizeMax_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_screenSizeMin_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_woundDuration_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_spas_chance_head_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_spas_chance_kill_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_spas_force_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_spas_mass_B, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_scriptDelay_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_cloakReset_T, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_weaponDuration_S, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_uninstall_T, self.OPTION_FLAG_NONE, true)
			self.SetOptionFlags(_screenDuration_S, self.OPTION_FLAG_NONE, false)
		endIf
	endIf
endFunction

function OnOptionDefault(Int option)

	if option == _mainblood_B
		AmainVal = true
		self.SetToggleOptionValue(_mainblood_B, AmainVal, false)
		zblood_updated.setValueInt(1)
		self.SetOptionFlags(_poolEnabled_B, self.OPTION_FLAG_NONE, true)
		self.SetOptionFlags(_severeMin_S, self.OPTION_FLAG_NONE, false)
		Flagging = self.OPTION_FLAG_NONE
	elseIf option == _screenblood_B
		AscreenVal = true
		self.SetToggleOptionValue(_screenblood_B, AscreenVal, false)
		game.SetGameSettingInt("iBloodSplatterMaxCount", 10)
		self.SetSliderOptionValue(_screenAmount_S, 10 as Float, "{0}", false)
		IDscreenAmount = 10.0000
		self.SetOptionFlags(_screenAmount_S, self.OPTION_FLAG_NONE, true)
		self.SetOptionFlags(_screenSizeMax_S, self.OPTION_FLAG_NONE, true)
		self.SetOptionFlags(_screenSizeMin_S, self.OPTION_FLAG_NONE, true)
		self.SetOptionFlags(_screenDuration_S, self.OPTION_FLAG_NONE, false)
		FlaggingAll = self.OPTION_FLAG_NONE
	elseIf option == _screenAmount_S
		game.SetGameSettingInt("iBloodSplatterMaxCount", 10)
		self.SetSliderOptionValue(_screenAmount_S, 10 as Float, "{0}", false)
		IDscreenAmount = 10.0000
	elseIf option == _screenSizeMax_S
		game.setGameSettingfloat("fBloodSplatterMaxSize", 0.350000)
		self.SetSliderOptionValue(_screenSizeMax_S, 0.350000, "{2}", false)
		IDscreenSizeMax = 0.350000
	elseIf option == _screenSizeMin_S
		game.setGameSettingfloat("fBloodSplatterMinSize", 0.150000)
		self.SetSliderOptionValue(_screenSizeMin_S, 0.150000, "{2}", false)
		IDscreenSizeMin = 0.150000
	elseIf option == _screenDuration_S
		game.setGameSettingfloat("fBloodSplatterDuration", 6.00000)
		self.SetSliderOptionValue(_screenDuration_S, 6.00000, "{0} Seconds", false)
		IDscreenDuration = 6.00000
	elseIf option == _weaponDuration_S
		game.setGameSettingfloat("fWeaponBloodLifetime", 360.000)
		self.SetSliderOptionValue(_weaponDuration_S, 360.000, "{0} Seconds", false)
		IDweaponBloodDuration = 360.000
	elseIf option == _severeMin_S
		zblood_severeMin.setValue(0.220000)
		self.SetSliderOptionValue(_severeMin_S, 0.220000, "{2} Percent", false)
	elseIf option == _poolEnabled_B
		ApoolVal = true
		self.SetToggleOptionValue(_poolEnabled_B, ApoolVal, false)
		zblood_poolEnabled.setValueInt(1)
	elseIf option == _woundDuration_S
		utility.SetINIFloat("fDecalLifetime:Display", 256.000)
		self.SetSliderOptionValue(_woundDuration_S, 256.000, "{0} Seconds", false)
		IDwoundDuration = 256.000
	elseIf option == _scriptDelay_S
		zblood_scriptDelay.setValue(2.50000)
		self.SetSliderOptionValue(_scriptDelay_S, 2.50000, "{1} Seconds", false)
	elseIf option == _spas_chance_head_S
		zblood_spas_chance_head.setValue(0.500000)
		self.SetSliderOptionValue(_spas_chance_head_S, 0.500000, "{2} Percent", false)
	elseIf option == _spas_chance_kill_S
		zblood_spas_chance_kill.setValue(0.850000)
		self.SetSliderOptionValue(_spas_chance_kill_S, 0.850000, "{2} Percent", false)
	elseIf option == _spas_force_S
		zblood_spas_amount.setValue(15.0000)
		self.SetSliderOptionValue(_spas_force_S, 15.0000, "{0}", false)
	endIf
endFunction

; Skipped compiler generated GetState

function OnGameReload()

	parent.OnGameReload()
	game.setGameSettingfloat("iBloodSplatterMaxCount", IDscreenAmount as Float)
	game.setGameSettingfloat("fBloodSplatterMaxSize", IDscreenSizeMax)
	game.setGameSettingfloat("fBloodSplatterMinSize", IDscreenSizeMin)
	game.setGameSettingfloat("fBloodSplatterDuration", IDscreenDuration)
	game.setGameSettingfloat("fWeaponBloodLifetime", IDweaponBloodDuration)
	if IDweaponBloodDuration <= 2 as Float
		IDweaponFadeDuration = 1 as Float
	elseIf IDweaponBloodDuration <= 20 as Float
		IDweaponFadeDuration = 5 as Float
	elseIf IDweaponBloodDuration >= 21 as Float
		IDweaponFadeDuration = 10 as Float
	endIf
	game.setGameSettingfloat("fWeaponBloodFadeDuration", IDweaponFadeDuration)
	utility.SetINIFloat("fDecalLifetime:Display", IDwoundDuration)
	if (zblood_severeMin.getValue() == 0.200000 || zblood_severeMin.getValue() == 0.150000 || zblood_severeMin.getValue() == 0.250000) && UpdateCode == 3
		zblood_severeMin.setValue(0.220000)
		UpdateCode = 4
	endIf
	if AmainVal == false
		zblood_updated.setValueInt(0)
	endIf
endFunction

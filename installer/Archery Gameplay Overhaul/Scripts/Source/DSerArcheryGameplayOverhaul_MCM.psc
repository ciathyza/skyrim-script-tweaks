;/ Decompiled by Champollion V1.0.0
Source   : DSerArcheryGameplayOverhaul_MCM.psc
Modified : 2015-08-28 01:19:37
Compiled : 2015-08-28 01:19:39
User     : Evan
Computer : EVAN-PC
/;
scriptName DSerArcheryGameplayOverhaul_MCM extends SKI_ConfigBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

globalvariable          property MCM_ArmFatigue                  auto
globalvariable          property MCM_ArrowWounds                 auto
globalvariable          property MCM_BowCamera                   auto
globalvariable          property MCM_BowCamera_SmoothTransition  auto
globalvariable          property MCM_BowCrosshair                auto
globalvariable          property MCM_EnchantArrows               auto
globalvariable          property MCM_PersistentArrows            auto
globalvariable          property MCM_RemovalHotkeyOn             auto
globalvariable          property MCM_ScalingWeight               auto
globalvariable          property MCM_ThrowArrows                 auto
globalvariable          property MCM_ZoomFX                      auto
globalvariable          property PoisonCount                     auto

actor                   property PlayerRef                       auto
dserdeadlyarrowsmonitor property DeadlyArrowsMonitor             auto
leveleditem             property LItemSpellTomes25AllDestruction auto
quest                   property DeadlyArrowsQuest               auto
spell                   property EnchantArrow_Fire               auto
spell                   property EnchantArrow_Ice                auto
spell                   property EnchantArrow_Magic              auto
spell                   property EnchantArrow_Shock              auto
spell                   property RemovalAbility                  auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Bool toggleE_1  = true
Bool toggleE_2  = true
Bool toggleE_3  = true
Bool toggleE_4  = true
Bool toggleE_5  = true
Bool toggleE_6  = false
Bool toggleE_7  = true
Bool toggleE_8  = true
Bool toggleE_9  = true
Float valueB_SX = 27.5
Float valueB_SY = 25.0
Float valueB_SZ = -5.0
Float valueB_X  = 27.5
Float valueB_Y  = 5.0
Float valueB_Z  = -5.0
Float valueC_SX = -2.0
Float valueC_SY = -3.0
Float valueC_X  = -2.0
Float valueC_Y  = 3.0
Float valueD    = 30.0

Float valueS_1
Float valueS_2
Float valueS_3
Float valueS_4
Int keyK_1 = 19
Int optionA
Int optionB_SX
Int optionB_SY
Int optionB_SZ
Int optionB_X
Int optionB_Y
Int optionB_Z
Int optionC_SX
Int optionC_SY
Int optionC_X
Int optionC_Y
Int optionD
Int optionE_1
Int optionE_2
Int optionE_3
Int optionE_4
Int optionE_5
Int optionE_6
Int optionE_7
Int optionE_8
Int optionE_9
Int optionK_1
Int optionS_1
Int optionS_2
Int optionS_3
Int optionS_4


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

function OnPageReset(String page)
	self.SetCursorFillMode(self.TOP_TO_BOTTOM)
	self.SetCursorPosition(0)

	if page == ""
		self.LoadCustomContent("AGO.dds", 0 as Float, 115 as Float)
		return 
	elseIf page == "Info"
		self.UnloadCustomContent()
		self.LoadCustomContent("AGOInfoPage.dds", 50 as Float, 35 as Float)
		return 
	elseIf page == "Settings"
		self.UnloadCustomContent()
		self.SetTitleText("Settings")
		self.AddHeaderOption("Bow Camera", 0)
		optionE_7 = self.AddToggleOption(" Smooth Transition", toggleE_7, 0)
		optionB_X = self.AddSliderOption(" Horizontal", valueB_X, "{0}", 0)
		optionB_Y = self.AddSliderOption(" Vertical", valueB_Y, "{0}", 0)
		optionB_Z = self.AddSliderOption(" Zoom", valueB_Z, "{0}", 0)
		optionB_SX = self.AddSliderOption(" Sneak Horizontal", valueB_SX, "{0}", 0)
		optionB_SY = self.AddSliderOption(" Sneak Vertical", valueB_SY, "{0}", 0)
		optionB_SZ = self.AddSliderOption(" Sneak Zoom", valueB_SZ, "{0}", 0)
		self.AddEmptyOption()
		self.AddHeaderOption("Bow Crosshair", 0)
		optionC_X = self.AddSliderOption(" Horizontal", valueC_X, "{0}", 0)
		optionC_Y = self.AddSliderOption(" Vertical", valueC_Y, "{0}", 0)
		optionC_SX = self.AddSliderOption(" Sneak Horizontal", valueC_SX, "{0}", 0)
		optionC_SY = self.AddSliderOption(" Sneak Vertical", valueC_SY, "{0}", 0)
		self.AddEmptyOption()
		self.AddHeaderOption("Enchanted Arrows", 0)
		optionD = self.AddSliderOption(" Scaling Weight", valueD, "{0}%", 0)
		self.AddEmptyOption()
		self.AddHeaderOption("Hotkeys", 0)
		optionK_1 = self.AddKeyMapOption(" Remove Projectiles", keyK_1, 0)
		self.SetCursorPosition(1)
		self.AddHeaderOption("Enable/Disable", 0)
		optionE_1 = self.AddToggleOption(" Bow Camera", toggleE_1, 0)
		optionE_8 = self.AddToggleOption(" Bow Crosshair", toggleE_8, 0)
		optionE_2 = self.AddToggleOption(" Arrow Wounds", toggleE_2, 0)
		optionE_3 = self.AddToggleOption(" Persistent Arrows", toggleE_3, 0)
		optionE_4 = self.AddToggleOption(" Arm Fatigue", toggleE_4, 0)
		optionE_5 = self.AddToggleOption(" Enchant Arrows", toggleE_5, 0)
		optionE_6 = self.AddToggleOption(" Throw or Stab Bash", toggleE_6, 0)
		optionE_9 = self.AddToggleOption(" Bow Zoom FX", toggleE_9, 0)
	elseIf page == "Statistics"
		self.UnloadCustomContent()
		self.SetTitleText("Statistics")
		if 1.5 * PlayerRef.GetAV("Marksman") < 100.0
			valueS_1 = 1.5 * PlayerRef.GetAV("Marksman")
		else
			valueS_1 = 100.0
		endIf
		valueS_2 = 5.0 + 0.25 * PlayerRef.GetAV("Marksman")
		valueS_3 = ((0.01 * valueD * PlayerRef.GetAV("Enchanting")) as Int) as Float
		valueS_4 = PoisonCount.GetValueInt() as Float
		optionS_1 = self.AddSliderOption("Arrow Recovery Percentage", valueS_1, "{2}%", self.OPTION_FLAG_DISABLED)
		optionS_2 = self.AddSliderOption("Arm Fatigue Time", valueS_2, "{1} s", self.OPTION_FLAG_DISABLED)
		optionS_3 = self.AddSliderOption("Enchanted Arrow Charge", valueS_3, "{0} Damage", self.OPTION_FLAG_DISABLED)
		optionS_4 = self.AddSliderOption("Poison Uses", valueS_4, "{0} Arrows", self.OPTION_FLAG_DISABLED)
	endIf
endFunction


function OnOptionHighlight(Int option)
	if option == optionB_X
		self.SetInfoText("Set the left/right position of your camera when wielding a bow. Positive values are on the right, negative values are on the left.")
	elseIf option == optionB_Y
		self.SetInfoText("Set the up/down position of your camera when wielding a bow. Positive values are up, negative values are down.")
	elseIf option == optionB_Z
		self.SetInfoText("Set the zoom in/out of your camera when wielding a bow. Positive values are closer to your character, negative values are farther from your character.")
	elseIf option == optionB_SX
		self.SetInfoText("Set the left/right position of your camera when wielding a bow and sneaking. Positive values are on the right, negative values are on the left.")
	elseIf option == optionB_SY
		self.SetInfoText("Set the up/down position of your camera when wielding a bow and sneaking. Positive values are up, negative values are down.")
	elseIf option == optionB_SZ
		self.SetInfoText("Set the zoom in/out of your camera when wielding a bow and sneaking. Positive values are closer to your character, negative values are farther from your character.")
	elseIf option == optionC_X
		self.SetInfoText("Set the left/right position of your crosshair when wielding a bow. Positive values are on the right, negative values are on the left.")
	elseIf option == optionC_Y
		self.SetInfoText("Set the up/down position of your crosshair when wielding a bow. Positive values are up, negative values are down.")
	elseIf option == optionC_SX
		self.SetInfoText("Set the left/right position of your crosshair when wielding a bow and sneaking. Positive values are on the right, negative values are on the left.")
	elseIf option == optionC_SY
		self.SetInfoText("Set the up/down position of your crosshair when wielding a bow and sneaking. Positive values are up, negative values are down.")
	elseIf option == optionD
		self.SetInfoText("Set the maximum charge for your enchanted arrows based on a percentage of your Enchanting level. E.g. 50% makes enchanted arrows deal damage equal to half of your Enchanting level.")
	elseIf option == optionE_1
		self.SetInfoText("Moves the camera into position when you unsheathe your bow. Disabling this option also disables bow crosshair.\n[X] = Enabled, [ ] = Disabled")
	elseIf option == optionE_8
		self.SetInfoText("Moves the crosshair into position when you unsheathe your bow. Re-enable this only if your crosshair is visible in the center of the screen.\n[X] = Enabled, [ ] = Disabled")
	elseIf option == optionE_2
		self.SetInfoText("Arrows cause a bleeding effect for 30 seconds.\n[X] = Enabled, [ ] = Disabled")
	elseIf option == optionE_3
		self.SetInfoText("Arrows won't disappear until you use your 'Remove Projectiles' ability. Disabling this option also removes the ability.\n[X] = Enabled, [ ] = Disabled")
	elseIf option == optionE_4
		self.SetInfoText("Holding your bow drawn for too long will drain stamina, shake the camera, and shake the controller (if you have one).\n[X] = Enabled, [ ] = Disabled")
	elseIf option == optionE_5
		self.SetInfoText("Enchant arrows with magic, causing extra damage on hit. Disabling this option also removes the spells and spell tomes. Rings also lose their effects.\n[X] = Enabled, [ ] = Disabled")
	elseIf option == optionE_6
		self.SetInfoText("Choose between throwing or stabbing with the bow bash. Only enables throwing for the player.\n[X] = Throwing, [ ] = Stabbing")
	elseIf option == optionE_7
		self.SetInfoText("Camera (and crosshair) will either pan smoothly or make a fast movement when you draw/sheathe your bow.\n[X] = Smooth, [ ] = Fast")
	elseIf option == optionE_9
		self.SetInfoText("Zooming in with a bow will add a radial blur effect to the screen.\n[X] = Enabled, [ ] = Disabled")
	elseIf option == optionS_1
		self.SetInfoText("The percentage of arrow that you'll add to your inventory when using the 'Remove Projectiles' ability.")
	elseIf option == optionS_2
		self.SetInfoText("The amount of time you can hold your bow drawn before your screen will start shaking.")
	elseIf option == optionS_3
		self.SetInfoText("Elemental damage dealt by an enchanted arrow.")
	elseIf option == optionS_4
		self.SetInfoText("Poisons will last for this many arrows.")
	elseIf option == optionK_1
		self.SetInfoText("Set a hotkey to remove/collect projectiles. You can also choose to remove the 'Remove Projectiles' ability from the spells menu.")
	endIf
endFunction


function OnOptionSliderAccept(Int option, Float value)
	if option == optionB_X
		valueB_X = value
		DeadlyArrowsMonitor.hori_combat_bow = valueB_X
		self.SetSliderOptionValue(optionB_X, valueB_X, "{0}", false)
	elseIf option == optionB_Y
		valueB_Y = value
		DeadlyArrowsMonitor.vert_combat_bow = valueB_Y
		self.SetSliderOptionValue(optionB_Y, valueB_Y, "{0}", false)
	elseIf option == optionB_Z
		valueB_Z = value
		DeadlyArrowsMonitor.zoom_combat_bow = valueB_Z
		self.SetSliderOptionValue(optionB_Z, valueB_Z, "{0}", false)
	elseIf option == optionB_SX
		valueB_SX = value
		DeadlyArrowsMonitor.hori_combat_bow_sneak = valueB_SX
		self.SetSliderOptionValue(optionB_SX, valueB_SX, "{0}", false)
	elseIf option == optionB_SY
		valueB_SY = value
		DeadlyArrowsMonitor.vert_combat_bow_sneak = valueB_SY
		self.SetSliderOptionValue(optionB_SY, valueB_SY, "{0}", false)
	elseIf option == optionB_SZ
		valueB_SZ = value
		DeadlyArrowsMonitor.zoom_combat_bow_sneak = valueB_SZ
		self.SetSliderOptionValue(optionB_SZ, valueB_SZ, "{0}", false)
	elseIf option == optionC_X
		valueC_X = value
		DeadlyArrowsMonitor.crosshair_hori_bow = DeadlyArrowsMonitor.crosshair_hori_idle + valueC_X
		self.SetSliderOptionValue(optionC_X, valueC_X, "{0}", false)
	elseIf option == optionC_Y
		valueC_Y = value
		DeadlyArrowsMonitor.crosshair_vert_bow = DeadlyArrowsMonitor.crosshair_vert_idle - valueC_Y
		self.SetSliderOptionValue(optionC_Y, valueC_Y, "{0}", false)
	elseIf option == optionC_SX
		valueC_SX = value
		DeadlyArrowsMonitor.crosshair_hori_bow_sneak = DeadlyArrowsMonitor.crosshair_hori_idle + valueC_SX
		self.SetSliderOptionValue(optionC_SX, valueC_SX, "{0}", false)
	elseIf option == optionC_SY
		valueC_SY = value
		DeadlyArrowsMonitor.crosshair_vert_bow_sneak = DeadlyArrowsMonitor.crosshair_vert_idle - valueC_SY
		self.SetSliderOptionValue(optionC_SY, valueC_SY, "{0}", false)
	elseIf option == optionD
		valueD = value
		MCM_ScalingWeight.SetValue(0.01 * valueD)
		self.SetSliderOptionValue(optionD, valueD, "{0}", false)
	endIf
endFunction


function OnOptionSliderOpen(Int option)
	if option == optionB_X
		self.SetSliderDialogStartValue(valueB_X)
		self.SetSliderDialogDefaultValue(27.5)
		self.SetSliderDialogRange(-50.0, 50.0)
		self.SetSliderDialogInterval(0.50)
	elseIf option == optionB_Y
		self.SetSliderDialogStartValue(valueB_Y)
		self.SetSliderDialogDefaultValue(5.0)
		self.SetSliderDialogRange(-50.0, 50.0)
		self.SetSliderDialogInterval(0.50)
	elseIf option == optionB_Z
		self.SetSliderDialogStartValue(valueB_Z)
		self.SetSliderDialogDefaultValue(-5.0)
		self.SetSliderDialogRange(-50.0, 50.0)
		self.SetSliderDialogInterval(0.5)
	elseIf option == optionB_SX
		self.SetSliderDialogStartValue(valueB_SX)
		self.SetSliderDialogDefaultValue(27.5)
		self.SetSliderDialogRange(-50.0, 50.0)
		self.SetSliderDialogInterval(0.5)
	elseIf option == optionB_SY
		self.SetSliderDialogStartValue(valueB_SY)
		self.SetSliderDialogDefaultValue(25.0)
		self.SetSliderDialogRange(-50.0, 50.0)
		self.SetSliderDialogInterval(0.5)
	elseIf option == optionB_SZ
		self.SetSliderDialogStartValue(valueB_SZ)
		self.SetSliderDialogDefaultValue(-5.0)
		self.SetSliderDialogRange(-50.0, 50.0)
		self.SetSliderDialogInterval(0.5)
	elseIf option == optionC_X
		self.SetSliderDialogStartValue(valueC_X)
		self.SetSliderDialogDefaultValue(-2.0)
		self.SetSliderDialogRange(-100.0, 100.0)
		self.SetSliderDialogInterval(0.5)
	elseIf option == optionC_Y
		self.SetSliderDialogStartValue(valueC_Y)
		self.SetSliderDialogDefaultValue(3.0)
		self.SetSliderDialogRange(-100.0, 100.0)
		self.SetSliderDialogInterval(0.5)
	elseIf option == optionC_SX
		self.SetSliderDialogStartValue(valueC_SX)
		self.SetSliderDialogDefaultValue(-2 as Float)
		self.SetSliderDialogRange(-100.0, 100.0)
		self.SetSliderDialogInterval(0.5)
	elseIf option == optionC_SY
		self.SetSliderDialogStartValue(valueC_SY)
		self.SetSliderDialogDefaultValue(-3.0)
		self.SetSliderDialogRange(-50.0, 50.0)
		self.SetSliderDialogInterval(0.5)
	elseIf option == optionD
		self.SetSliderDialogStartValue(valueD)
		self.SetSliderDialogDefaultValue(30.0)
		self.SetSliderDialogRange(10.0, 50.0)
		self.SetSliderDialogInterval(5.0)
	endIf
endFunction


function OnKeyDown(Int keycode)
	if keycode == keyK_1 && game.IsMovementControlsEnabled() && !utility.IsInMenuMode() && !PlayerRef.IsOnMount() && PlayerRef.GetSitState() == 0
		RemovalAbility.Cast(PlayerRef as objectreference, PlayerRef as objectreference)
	endIf
endFunction


function OnOptionSelect(Int option)
	if option == optionE_1
		toggleE_1 = !toggleE_1
		MCM_BowCamera.SetValue((toggleE_1 as Int) as Float)
		if !toggleE_1
			toggleE_8 = false
			MCM_BowCrosshair.SetValue((toggleE_8 as Int) as Float)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", DeadlyArrowsMonitor.crosshair_hori_idle)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", DeadlyArrowsMonitor.crosshair_vert_idle)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", DeadlyArrowsMonitor.crosshair_hori_idle)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", DeadlyArrowsMonitor.crosshair_vert_idle)
			self.SetToggleOptionValue(optionE_8, toggleE_8, false)
		endIf
		self.SetToggleOptionValue(optionE_1, toggleE_1, false)
	elseIf option == optionE_8
		toggleE_8 = !toggleE_8
		MCM_BowCrosshair.SetValue((toggleE_8 as Int) as Float)
		if !toggleE_8
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", DeadlyArrowsMonitor.crosshair_hori_idle)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", DeadlyArrowsMonitor.crosshair_vert_idle)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", DeadlyArrowsMonitor.crosshair_hori_idle)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", DeadlyArrowsMonitor.crosshair_vert_idle)
		else
			DeadlyArrowsMonitor.crosshair_hori_idle = ui.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x")
			DeadlyArrowsMonitor.crosshair_vert_idle = ui.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y")
			DeadlyArrowsMonitor.crosshair_hori_bow = DeadlyArrowsMonitor.crosshair_hori_idle + valueC_X
			DeadlyArrowsMonitor.crosshair_vert_bow = DeadlyArrowsMonitor.crosshair_vert_idle - valueC_Y
			DeadlyArrowsMonitor.crosshair_hori_bow_sneak = DeadlyArrowsMonitor.crosshair_hori_idle + valueC_SX
			DeadlyArrowsMonitor.crosshair_vert_bow_sneak = DeadlyArrowsMonitor.crosshair_vert_idle - valueC_SY
		endIf
		self.SetToggleOptionValue(optionE_8, toggleE_8, false)
	elseIf option == optionE_2
		toggleE_2 = !toggleE_2
		MCM_ArrowWounds.SetValue((toggleE_2 as Int) as Float)
		self.SetToggleOptionValue(optionE_2, toggleE_2, false)
	elseIf option == optionE_3
		toggleE_3 = !toggleE_3
		MCM_PersistentArrows.SetValue((toggleE_3 as Int) as Float)
		if toggleE_3
			game.SetGameSettingFloat("fAttachedArrowAgeMax", 500.0)
			game.SetGameSettingInt("iMaxAttachedArrows", 999)
			if !PlayerRef.HasSpell(RemovalAbility as form)
				PlayerRef.AddSpell(RemovalAbility, true)
			endIf
		else
			game.SetGameSettingFloat("fAttachedArrowAgeMax", 1.0)
			game.SetGameSettingInt("iMaxAttachedArrows", 3)
			if PlayerRef.HasSpell(RemovalAbility as form)
				PlayerRef.RemoveSpell(RemovalAbility)
			endIf
		endIf
		self.SetToggleOptionValue(optionE_3, toggleE_3, false)
	elseIf option == optionE_4
		toggleE_4 = !toggleE_4
		MCM_ArmFatigue.SetValue((toggleE_4 as Int) as Float)
		self.SetToggleOptionValue(optionE_4, toggleE_4, false)
	elseIf option == optionE_5
		toggleE_5 = !toggleE_5
		MCM_EnchantArrows.SetValue((toggleE_5 as Int) as Float)
		if !toggleE_5
			if PlayerRef.HasSpell(EnchantArrow_Fire as form)
				PlayerRef.RemoveSpell(EnchantArrow_Fire)
			endIf
			if PlayerRef.HasSpell(EnchantArrow_Ice as form)
				PlayerRef.RemoveSpell(EnchantArrow_Ice)
			endIf
			if PlayerRef.HasSpell(EnchantArrow_Magic as form)
				PlayerRef.RemoveSpell(EnchantArrow_Magic)
			endIf
			if PlayerRef.HasSpell(EnchantArrow_Shock as form)
				PlayerRef.RemoveSpell(EnchantArrow_Shock)
			endIf
			LItemSpellTomes25AllDestruction.Revert()
		else
			if !PlayerRef.HasSpell(EnchantArrow_Fire as form)
				PlayerRef.AddSpell(EnchantArrow_Fire, false)
			endIf
			if !PlayerRef.HasSpell(EnchantArrow_Ice as form)
				PlayerRef.AddSpell(EnchantArrow_Ice, false)
			endIf
			if !PlayerRef.HasSpell(EnchantArrow_Magic as form)
				PlayerRef.AddSpell(EnchantArrow_Magic, false)
			endIf
			if !PlayerRef.HasSpell(EnchantArrow_Shock as form)
				PlayerRef.AddSpell(EnchantArrow_Shock, false)
			endIf
			LItemSpellTomes25AllDestruction.Revert()
		endIf
		self.SetToggleOptionValue(optionE_5, toggleE_5, false)
	elseIf option == optionE_6
		toggleE_6 = !toggleE_6
		MCM_ThrowArrows.SetValue((toggleE_6 as Int) as Float)
		self.SetToggleOptionValue(optionE_6, toggleE_6, false)
	elseIf option == optionE_7
		toggleE_7 = !toggleE_7
		MCM_BowCamera_SmoothTransition.SetValue((toggleE_7 as Int) as Float)
		self.SetToggleOptionValue(optionE_7, toggleE_7, false)
	elseIf option == optionE_9
		toggleE_9 = !toggleE_9
		MCM_ZoomFX.SetValue((toggleE_9 as Int) as Float)
		self.SetToggleOptionValue(optionE_9, toggleE_9, false)
	endIf
endFunction


function OnOptionKeyMapChange(Int option, Int keycode, String conflictControl, String conflictName)
	if option == optionK_1
		if conflictControl == ""
			self.UnregisterForKey(keyK_1)
			keyK_1 = keycode
			self.RegisterForKey(keyK_1)
			self.SetKeyMapOptionValue(optionK_1, keyK_1, false)
			Bool choice_2 = self.ShowMessage("Remove the 'Remove Projectiles' ability from the spells menu?", true, "Yes", "No")
			if choice_2
				PlayerRef.RemoveSpell(RemovalAbility)
				MCM_RemovalHotkeyOn.SetValue(1.0)
			endIf
		elseIf conflictName == ""
			Bool choice = self.ShowMessage("Key is in conflict with '" + conflictControl + "'. Do you still want to use this key?", true, "Yes", "No")
			if choice
				self.UnregisterForKey(keyK_1)
				keyK_1 = keycode
				self.RegisterForKey(keyK_1)
				self.SetKeyMapOptionValue(optionK_1, keyK_1, false)
				Bool choice_2 = self.ShowMessage("Remove the 'Remove Projectiles' ability from the spells menu?", true, "Yes", "No")
				if choice_2
					PlayerRef.RemoveSpell(RemovalAbility)
					MCM_RemovalHotkeyOn.SetValue(1.0)
				endIf
			endIf
		else
			Bool choice = self.ShowMessage("Key is in conflict with '" + conflictControl + "' from the mod, '" + conflictName + "'. Do you still want to use this key?", true, "Yes", "No")
			if choice
				self.UnregisterForKey(keyK_1)
				keyK_1 = keycode
				self.RegisterForKey(keyK_1)
				self.SetKeyMapOptionValue(optionK_1, keyK_1, false)
				Bool choice_2 = self.ShowMessage("Remove the 'Remove Projectiles' ability from the spells menu?", true, "Yes", "No")
				if choice_2
					PlayerRef.RemoveSpell(RemovalAbility)
					MCM_RemovalHotkeyOn.SetValue(1.0)
				endIf
			endIf
		endIf
	endIf
endFunction

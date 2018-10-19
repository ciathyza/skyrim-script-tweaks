scriptName LIH_ConfigMenu extends SKI_ConfigBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

globalvariable property _LIH_ActivateButtonS            auto
globalvariable property _LIH_ActivateButtonVisible      auto
globalvariable property _LIH_ActivateButtonX            auto
globalvariable property _LIH_ActivateButtonY            auto
globalvariable property _LIH_AltCrosshairVisible        auto
globalvariable property _LIH_AltHealthBarVisible        auto
globalvariable property _LIH_AltSneakMeterVisible       auto
globalvariable property _LIH_AnimLetterS                auto
globalvariable property _LIH_AnimLetterX                auto
globalvariable property _LIH_AnimLetterY                auto
globalvariable property _LIH_ArrowsAlign                auto
globalvariable property _LIH_ArrowsAlpha                auto
globalvariable property _LIH_ArrowsS                    auto
globalvariable property _LIH_ArrowsX                    auto
globalvariable property _LIH_ArrowsY                    auto
globalvariable property _LIH_BarsAlwaysVisible          auto
globalvariable property _LIH_CompassS                   auto
globalvariable property _LIH_CompassX                   auto
globalvariable property _LIH_CompassY                   auto
globalvariable property _LIH_CrosshairAlpha             auto
globalvariable property _LIH_CrosshairS                 auto
globalvariable property _LIH_CrosshairX                 auto
globalvariable property _LIH_CrosshairY                 auto
globalvariable property _LIH_DebugVisible               auto
globalvariable property _LIH_DefActivateButtonX         auto
globalvariable property _LIH_DefActivateButtonY         auto
globalvariable property _LIH_DefAnimLetterX             auto
globalvariable property _LIH_DefAnimLetterY             auto
globalvariable property _LIH_DefArrowsX                 auto
globalvariable property _LIH_DefArrowsY                 auto
globalvariable property _LIH_Default                    auto
globalvariable property _LIH_DefCompassX                auto
globalvariable property _LIH_DefCompassY                auto
globalvariable property _LIH_DefCrosshairX              auto
globalvariable property _LIH_DefCrosshairY              auto
globalvariable property _LIH_DefEnchantLX               auto
globalvariable property _LIH_DefEnchantLY               auto
globalvariable property _LIH_DefEnchantRX               auto
globalvariable property _LIH_DefEnchantRY               auto
globalvariable property _LIH_DefEnemyHealthX            auto
globalvariable property _LIH_DefEnemyHealthY            auto
globalvariable property _LIH_DefFavorBackButtonX        auto
globalvariable property _LIH_DefFavorBackButtonY        auto
globalvariable property _LIH_DefGrayBarX                auto
globalvariable property _LIH_DefGrayBarY                auto
globalvariable property _LIH_DefHealthX                 auto
globalvariable property _LIH_DefHealthY                 auto
globalvariable property _LIH_DefHUDMsgX                 auto
globalvariable property _LIH_DefHUDMsgY                 auto
globalvariable property _LIH_DefInfoX                   auto
globalvariable property _LIH_DefInfoY                   auto
globalvariable property _LIH_DefLevelUpX                auto
globalvariable property _LIH_DefLevelUpY                auto
globalvariable property _LIH_DefLocationX               auto
globalvariable property _LIH_DefLocationY               auto
globalvariable property _LIH_DefMagickaX                auto
globalvariable property _LIH_DefMagickaY                auto
globalvariable property _LIH_DefNameX                   auto
globalvariable property _LIH_DefNameY                   auto
globalvariable property _LIH_DefObjectivesX             auto
globalvariable property _LIH_DefObjectivesY             auto
globalvariable property _LIH_DefShoutsX                 auto
globalvariable property _LIH_DefShoutsY                 auto
globalvariable property _LIH_DefSneakCrosshairX         auto
globalvariable property _LIH_DefSneakCrosshairY         auto
globalvariable property _LIH_DefStaminaX                auto
globalvariable property _LIH_DefStaminaY                auto
globalvariable property _LIH_DefStealthMeterX           auto
globalvariable property _LIH_DefStealthMeterY           auto
globalvariable property _LIH_DefSubtitleX               auto
globalvariable property _LIH_DefSubtitleY               auto
globalvariable property _LIH_DownKey                    auto
globalvariable property _LIH_Enabled                    auto
globalvariable property _LIH_EnchantLR                  auto
globalvariable property _LIH_EnchantLS                  auto
globalvariable property _LIH_EnchantLX                  auto
globalvariable property _LIH_EnchantLY                  auto
globalvariable property _LIH_EnchantmentAlpha           auto
globalvariable property _LIH_EnchantRR                  auto
globalvariable property _LIH_EnchantRS                  auto
globalvariable property _LIH_EnchantRX                  auto
globalvariable property _LIH_EnchantRY                  auto
globalvariable property _LIH_EnemyHealthS               auto
globalvariable property _LIH_EnemyHealthX               auto
globalvariable property _LIH_EnemyHealthY               auto
globalvariable property _LIH_EnemyMarkersVisible        auto
globalvariable property _LIH_FavorBackButtonS           auto
globalvariable property _LIH_FavorBackButtonX           auto
globalvariable property _LIH_FavorBackButtonY           auto
globalvariable property _LIH_GrayBarS                   auto
globalvariable property _LIH_GrayBarX                   auto
globalvariable property _LIH_GrayBarY                   auto
globalvariable property _LIH_HealthAlpha                auto
globalvariable property _LIH_HealthR                    auto
globalvariable property _LIH_HealthS                    auto
globalvariable property _LIH_HealthX                    auto
globalvariable property _LIH_HealthY                    auto
globalvariable property _LIH_HUDMsgAlign                auto
globalvariable property _LIH_HUDMsgS                    auto
globalvariable property _LIH_HUDMsgX                    auto
globalvariable property _LIH_HUDMsgY                    auto
globalvariable property _LIH_InfoAlign                  auto
globalvariable property _LIH_InfoAlpha                  auto
globalvariable property _LIH_InfoS                      auto
globalvariable property _LIH_InfoX                      auto
globalvariable property _LIH_InfoY                      auto
globalvariable property _LIH_ItemAlpha                  auto
globalvariable property _LIH_ItemLeadingAlpha           auto
globalvariable property _LIH_Key                        auto
globalvariable property _LIH_LeftKey                    auto
globalvariable property _LIH_LevelUpS                   auto
globalvariable property _LIH_LevelUpX                   auto
globalvariable property _LIH_LevelUpY                   auto
globalvariable property _LIH_Load                       auto
globalvariable property _LIH_LocationAlign              auto
globalvariable property _LIH_LocationMarkersVisible     auto
globalvariable property _LIH_LocationS                  auto
globalvariable property _LIH_LocationX                  auto
globalvariable property _LIH_LocationY                  auto
globalvariable property _LIH_MagickaAlpha               auto
globalvariable property _LIH_MagickaR                   auto
globalvariable property _LIH_MagickaS                   auto
globalvariable property _LIH_MagickaX                   auto
globalvariable property _LIH_MagickaY                   auto
globalvariable property _LIH_NameS                      auto
globalvariable property _LIH_NameX                      auto
globalvariable property _LIH_NameY                      auto
globalvariable property _LIH_NextKey                    auto
globalvariable property _LIH_ObjectivesS                auto
globalvariable property _LIH_ObjectivesX                auto
globalvariable property _LIH_ObjectivesY                auto
globalvariable property _LIH_PlayerSetMarkerVisible     auto
globalvariable property _LIH_PrevKey                    auto
globalvariable property _LIH_QuestDoorMarkersVisible    auto
globalvariable property _LIH_QuestMarkersVisible        auto
globalvariable property _LIH_Reset                      auto
globalvariable property _LIH_ResetKey                   auto
globalvariable property _LIH_RightKey                   auto
globalvariable property _LIH_RotateKey                  auto
globalvariable property _LIH_ScaleDownKey               auto
globalvariable property _LIH_ScaleUpKey                 auto
globalvariable property _LIH_Selected                   auto
globalvariable property _LIH_SeparatorAlpha             auto
globalvariable property _LIH_ShoutsS                    auto
globalvariable property _LIH_ShoutsX                    auto
globalvariable property _LIH_ShoutsY                    auto
globalvariable property _LIH_SlimCompassVisible         auto
globalvariable property _LIH_SneakCrosshairAlpha        auto
globalvariable property _LIH_SneakCrosshairS            auto
globalvariable property _LIH_SneakCrosshairVisible      auto
globalvariable property _LIH_SneakCrosshairX            auto
globalvariable property _LIH_SneakCrosshairY            auto
globalvariable property _LIH_SneakTextVisible           auto
globalvariable property _LIH_StaminaAlpha               auto
globalvariable property _LIH_StaminaR                   auto
globalvariable property _LIH_StaminaS                   auto
globalvariable property _LIH_StaminaX                   auto
globalvariable property _LIH_StaminaY                   auto
globalvariable property _LIH_StealthMeterS              auto
globalvariable property _LIH_StealthMeterX              auto
globalvariable property _LIH_StealthMeterY              auto
globalvariable property _LIH_Step                       auto
globalvariable property _LIH_StepKey                    auto
globalvariable property _LIH_SubtitleAlpha              auto
globalvariable property _LIH_SubtitleLeadingAlpha       auto
globalvariable property _LIH_SubtitleS                  auto
globalvariable property _LIH_SubtitlesAlign             auto
globalvariable property _LIH_SubtitleX                  auto
globalvariable property _LIH_SubtitleY                  auto
globalvariable property _LIH_Toggle                     auto
globalvariable property _LIH_UndiscoveredMarkersVisible auto
globalvariable property _LIH_UpKey                      auto
globalvariable property _LIH_Version                    auto
lih_main       property LIH_MainInstance                auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Float  _LIH_XItem
Float  _LIH_YItem
Int    _ActivateButtonVisible_T
Int    _AltCrosshairVisible_T
Int    _AltHealthBarVisible_T
Int    _AltSneakMeterVisible_T
Int    _ArrowsAlpha_S
Int    _BarsAlwaysVisible_T
Int    _CrosshairAlpha_S
Int    _DebugVisible_T
Int    _DownKey_K
Int    _Enabled_T
Int    _EnchantmentAlpha_S
Int    _EnemyMarkersVisible_T
Int    _HealthAlpha_S
Int    _HotKey_K
Int    _InfoAlpha_S
Int    _ItemAlpha_S
Int    _LeftKey_K
Int    _LIH_RotateItem
Int    _LIH_ScaleItem
Int    _Load2_T
Int    _Load_T
Int    _LocationMarkersVisible_T
Int    _MagickaAlpha_S
Int    _NextKey_K
Int    _PlayerSetMarkerVisible_T
Int    _PrevKey_K
Int    _QuestDoorMarkersVisible_T
Int    _QuestMarkersVisible_T
Int    _Reset_T
Int    _ResetKey_K
Int    _RightKey_K
Int    _RotateKey_K
Int    _Save_T
Int    _ScaleDownKey_K
Int    _ScaleUpKey_K
Int    _SeparatorAlpha_S
Int    _SlimCompassVisible_T
Int    _SneakCrosshairAlpha_S
Int    _SneakCrosshairVisible_T
Int    _SneakTextVisible_T
Int    _StaminaAlpha_S
Int    _StepKey_K
Int    _SubtitleAlpha_S
Int    _UndiscoveredMarkersVisible_T
Int    _UpKey_K
String _LIH_AlignItem
String _LIH_SelectedDesc
String _LIH_SelectedItem
String isClip


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

Event OnConfigInit()
	; Execution Delay.
	Utility.Wait(2.0)
	setPages()
	OnGameReload()
	LoadPreset_New()
endEvent


Event OnConfigClose()
	if _LIH_Reset.GetValueInt() == 1
		ResetDefaults()
	else
		ApplySettings()
	endIf
endEvent


Event OnPageReset(String a_page)
	if a_page == ""
		LoadCustomContent("exported/lihud_splash.swf", 0.000000, 0.000000)
		return 
	else
		UnloadCustomContent()
	endIf

	if a_page == "General Settings"
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("MOD Configuration", 0)
		_Enabled_T = AddToggleOption("Enabled", _LIH_Enabled.GetValueInt() as Bool, 0)
		AddEmptyOption()
		_Reset_T = AddToggleOption("Load defaults", _LIH_Reset.GetValueInt() as Bool, 0)
		AddEmptyOption()
		_Load_T = AddToggleOption("Load preset", _LIH_Load.GetValueInt() as Bool, 0)
		AddEmptyOption()
		_DebugVisible_T = AddToggleOption("Show MOD messages", _LIH_DebugVisible.GetValueInt() as Bool, 0)
		AddEmptyOption()
		SetCursorPosition(1)
		AddHeaderOption("FileAccess Interface", 0)
		FISSInterface fiss = FISSFactory.getFISS()
		If fiss
			_Save_T = AddToggleOption("Save personal preset", _LIH_Load.GetValueInt() as Bool, 0)
			AddEmptyOption()
			_Load2_T = AddToggleOption("Load personal preset", _LIH_Load.GetValueInt() as Bool, 0)
			AddEmptyOption()
		endif
	elseIf a_page == "HUD Visibility"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("HUD Items Visibility", 0)
		_BarsAlwaysVisible_T = AddToggleOption("Always show HUD bars", _LIH_BarsAlwaysVisible.GetValueInt() as Bool, 0)
		_AltHealthBarVisible_T = AddToggleOption("Show Alternate Health Bar", _LIH_AltHealthBarVisible.GetValueInt() as Bool, 0)
		_SlimCompassVisible_T = AddToggleOption("Show Alternate Compass (Slim)", _LIH_SlimCompassVisible.GetValueInt() as Bool, 0)
		_AltCrosshairVisible_T = AddToggleOption("Show Alternate Crosshair", _LIH_AltCrosshairVisible.GetValueInt() as Bool, 0)
		_SneakCrosshairVisible_T = AddToggleOption("Show Alternate Sneak Crosshair", _LIH_SneakCrosshairVisible.GetValueInt() as Bool, 0)
		_AltSneakMeterVisible_T = AddToggleOption("Show Alternate Sneak Meter", _LIH_AltSneakMeterVisible.GetValueInt() as Bool, 0)
		_SneakTextVisible_T = AddToggleOption("Show Sneak Text", _LIH_SneakTextVisible.GetValueInt() as Bool, 0)
		_ActivateButtonVisible_T = AddToggleOption("Show Activate Button", _LIH_ActivateButtonVisible.GetValueInt() as Bool, 0)
		AddEmptyOption()
		AddHeaderOption("HUD Items Opacity", 0)
		_MagickaAlpha_S = AddSliderOption("Magicka Bar Opacity", _LIH_MagickaAlpha.GetValueInt() as Float, "{0}", 0)
		_HealthAlpha_S = AddSliderOption("Health Bar Opacity", _LIH_HealthAlpha.GetValueInt() as Float, "{0}", 0)
		_StaminaAlpha_S = AddSliderOption("Stamina Bar Opacity", _LIH_StaminaAlpha.GetValueInt() as Float, "{0}", 0)
		_EnchantmentAlpha_S = AddSliderOption("Enchantment Bar Opacity", _LIH_EnchantmentAlpha.GetValueInt() as Float, "{0}", 0)
		_ItemAlpha_S = AddSliderOption("Item/NPC Name Opacity", _LIH_ItemAlpha.GetValueInt() as Float, "{0}", 0)
		_InfoAlpha_S = AddSliderOption("Item Info Text Opacity", _LIH_InfoAlpha.GetValueInt() as Float, "{0}", 0)
		_SeparatorAlpha_S = AddSliderOption("Separator Opacity", _LIH_SeparatorAlpha.GetValueInt() as Float, "{0}", 0)
		_SubtitleAlpha_S = AddSliderOption("Subtitles Opacity", _LIH_SubtitleAlpha.GetValueInt() as Float, "{0}", 0)
		_ArrowsAlpha_S = AddSliderOption("Arrows Indicator Opacity", _LIH_ArrowsAlpha.GetValueInt() as Float, "{0}", 0)
		_CrosshairAlpha_S = AddSliderOption("Crosshair Opacity", _LIH_CrosshairAlpha.GetValueInt() as Float, "{0}", 0)
		_SneakCrosshairAlpha_S = AddSliderOption("Alternative Sneak Crosshair Opacity", _LIH_SneakCrosshairAlpha.GetValueInt() as Float, "{0}", 0)
		AddEmptyOption()
		SetCursorPosition(1)
		AddHeaderOption("Compass Markers", 0)
		_UndiscoveredMarkersVisible_T = AddToggleOption("Show Undiscovered Locations", _LIH_UndiscoveredMarkersVisible.GetValueInt() as Bool, 0)
		_LocationMarkersVisible_T = AddToggleOption("Show Discovered Locations", _LIH_LocationMarkersVisible.GetValueInt() as Bool, 0)
		_EnemyMarkersVisible_T = AddToggleOption("Show Enemy Markers", _LIH_EnemyMarkersVisible.GetValueInt() as Bool, 0)
		_PlayerSetMarkerVisible_T = AddToggleOption("Show Player Set Marker", _LIH_PlayerSetMarkerVisible.GetValueInt() as Bool, 0)
		_QuestDoorMarkersVisible_T = AddToggleOption("Show Floating Markers", _LIH_QuestDoorMarkersVisible.GetValueInt() as Bool, 0)
		_QuestMarkersVisible_T = AddToggleOption("Show Quest Markers", _LIH_QuestMarkersVisible.GetValueInt() as Bool, 0)
		AddEmptyOption()
	elseIf a_page == "HUD Position"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		_HotKey_K = AddKeyMapOption("Edit HUD Mode Hotkey", _LIH_Key.GetValueInt(), 0)
		_LeftKey_K = AddKeyMapOption("Move Left Hotkey", _LIH_LeftKey.GetValueInt(), 0)
		_RightKey_K = AddKeyMapOption("Move Right Hotkey", _LIH_RightKey.GetValueInt(), 0)
		_UpKey_K = AddKeyMapOption("Move Up Hotkey", _LIH_UpKey.GetValueInt(), 0)
		_DownKey_K = AddKeyMapOption("Move Down Hotkey", _LIH_DownKey.GetValueInt(), 0)
		_ScaleUpKey_K = AddKeyMapOption("Scale Up Hotkey", _LIH_ScaleUpKey.GetValueInt(), 0)
		_ScaleDownKey_K = AddKeyMapOption("Scale Down Mode Hotkey", _LIH_ScaleDownKey.GetValueInt(), 0)
		SetCursorPosition(1)
		_PrevKey_K = AddKeyMapOption("Previous Item Hotkey", _LIH_PrevKey.GetValueInt(), 0)
		_NextKey_K = AddKeyMapOption("Next Item Hotkey", _LIH_NextKey.GetValueInt(), 0)
		_StepKey_K = AddKeyMapOption("Toggle Step Hotkey", _LIH_StepKey.GetValueInt(), 0)
		_ResetKey_K = AddKeyMapOption("Item Reset Hotkey", _LIH_ResetKey.GetValueInt(), 0)
		_RotateKey_K = AddKeyMapOption("Rotate/Linespace Hotkey", _LIH_RotateKey.GetValueInt(), 0)
		AddEmptyOption()
	endIf
endEvent


Event OnOptionKeyMapChange(Int a_option, Int a_keyCode, String a_conflictControl, String a_conflictName)
	String page = CurrentPage
	if page == "HUD Position"
		if a_option == _HotKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_Key.SetValue(a_keyCode as Float)
		elseIf a_option == _LeftKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_LeftKey.SetValue(a_keyCode as Float)
		elseIf a_option == _RightKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_RightKey.SetValue(a_keyCode as Float)
		elseIf a_option == _UpKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_UpKey.SetValue(a_keyCode as Float)
		elseIf a_option == _DownKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_DownKey.SetValue(a_keyCode as Float)
		elseIf a_option == _PrevKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_PrevKey.SetValue(a_keyCode as Float)
		elseIf a_option == _NextKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_NextKey.SetValue(a_keyCode as Float)
		elseIf a_option == _ScaleUpKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_ScaleUpKey.SetValue(a_keyCode as Float)
		elseIf a_option == _ScaleDownKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_ScaleDownKey.SetValue(a_keyCode as Float)
		elseIf a_option == _StepKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_StepKey.SetValue(a_keyCode as Float)
		elseIf a_option == _RotateKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_RotateKey.SetValue(a_keyCode as Float)
		elseIf a_option == _ResetKey_K
			SetKeyMapOptionValue(a_option, a_keyCode, false)
			_LIH_ResetKey.SetValue(a_keyCode as Float)
		endIf
	endIf
endEvent


Event OnOptionSelect(Int a_option)
	String page = CurrentPage
	if page == "General Settings"
		if a_option == _Enabled_T
			toggle(_LIH_Enabled)
			SetToggleOptionValue(a_option, _LIH_Enabled.GetValueInt() as Bool, false)
		elseIf a_option == _Reset_T
			toggle(_LIH_Reset)
			SetToggleOptionValue(a_option, _LIH_Reset.GetValueInt() as Bool, false)
		elseIf a_option == _Load_T
			toggle(_LIH_Load)
			SetToggleOptionValue(a_option, _LIH_Load.GetValueInt() as Bool, false)
		elseIf a_option == _Load2_T
			bool continue = ShowMessage("do you want to load personal setting?", true, "$Yes", "$No")
			if (continue)
				toggle3(_LIH_Load)
				SetToggleOptionValue(a_option, _LIH_Load.GetValueInt() as Bool, false)
			endif
		elseIf a_option == _Save_T
			bool continue = ShowMessage("do you want to save current setting?", true, "$Yes", "$No")
			if (continue)
				toggle2(_LIH_Load)
				SetToggleOptionValue(a_option, _LIH_Load.GetValueInt() as Bool, false)
			endif
		elseIf a_option == _DebugVisible_T
			toggle(_LIH_DebugVisible)
			SetToggleOptionValue(a_option, _LIH_DebugVisible.GetValueInt() as Bool, false)
		endIf
	elseIf page == "HUD Visibility"
		if a_option == _BarsAlwaysVisible_T
			toggle(_LIH_BarsAlwaysVisible)
			SetToggleOptionValue(a_option, _LIH_BarsAlwaysVisible.GetValueInt() as Bool, false)
		elseIf a_option == _AltHealthBarVisible_T
			toggle(_LIH_AltHealthBarVisible)
			SetToggleOptionValue(a_option, _LIH_AltHealthBarVisible.GetValueInt() as Bool, false)
		elseIf a_option == _SneakCrosshairVisible_T
			toggle(_LIH_SneakCrosshairVisible)
			SetToggleOptionValue(a_option, _LIH_SneakCrosshairVisible.GetValueInt() as Bool, false)
		elseIf a_option == _AltCrosshairVisible_T
			toggle(_LIH_AltCrosshairVisible)
			SetToggleOptionValue(a_option, _LIH_AltCrosshairVisible.GetValueInt() as Bool, false)
		elseIf a_option == _SlimCompassVisible_T
			toggle(_LIH_SlimCompassVisible)
			SetToggleOptionValue(a_option, _LIH_SlimCompassVisible.GetValueInt() as Bool, false)
		elseIf a_option == _AltSneakMeterVisible_T
			toggle(_LIH_AltSneakMeterVisible)
			SetToggleOptionValue(a_option, _LIH_AltSneakMeterVisible.GetValueInt() as Bool, false)
		elseIf a_option == _ActivateButtonVisible_T
			toggle(_LIH_ActivateButtonVisible)
			SetToggleOptionValue(a_option, _LIH_ActivateButtonVisible.GetValueInt() as Bool, false)
		elseIf a_option == _SneakTextVisible_T
			toggle(_LIH_SneakTextVisible)
			SetToggleOptionValue(a_option, _LIH_SneakTextVisible.GetValueInt() as Bool, false)
		elseIf a_option == _UndiscoveredMarkersVisible_T
			toggle(_LIH_UndiscoveredMarkersVisible)
			SetToggleOptionValue(a_option, _LIH_UndiscoveredMarkersVisible.GetValueInt() as Bool, false)
		elseIf a_option == _LocationMarkersVisible_T
			toggle(_LIH_LocationMarkersVisible)
			SetToggleOptionValue(a_option, _LIH_LocationMarkersVisible.GetValueInt() as Bool, false)
		elseIf a_option == _EnemyMarkersVisible_T
			toggle(_LIH_EnemyMarkersVisible)
			SetToggleOptionValue(a_option, _LIH_EnemyMarkersVisible.GetValueInt() as Bool, false)
		elseIf a_option == _PlayerSetMarkerVisible_T
			toggle(_LIH_PlayerSetMarkerVisible)
			SetToggleOptionValue(a_option, _LIH_PlayerSetMarkerVisible.GetValueInt() as Bool, false)
		elseIf a_option == _QuestDoorMarkersVisible_T
			toggle(_LIH_QuestDoorMarkersVisible)
			SetToggleOptionValue(a_option, _LIH_QuestDoorMarkersVisible.GetValueInt() as Bool, false)
		elseIf a_option == _QuestMarkersVisible_T
			toggle(_LIH_QuestMarkersVisible)
			SetToggleOptionValue(a_option, _LIH_QuestMarkersVisible.GetValueInt() as Bool, false)
		endIf
	endIf
endEvent


Event OnOptionMenuOpen(Int a_option)
	String page = CurrentPage
endEvent


Event OnOptionColorOpen(Int a_option)
	String page = CurrentPage
endEvent


Event OnOptionHighlight(Int a_option)
	String page = CurrentPage
endEvent


Event OnOptionColorAccept(Int a_option, Int a_color)
	String page = CurrentPage
endEvent


Event OnOptionSliderOpen(Int a_option)
	String page = CurrentPage
	if page == "HUD Visibility"
		if a_option == _CrosshairAlpha_S
			SetSliderDialogStartValue(_LIH_CrosshairAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _SneakCrosshairAlpha_S
			SetSliderDialogStartValue(_LIH_SneakCrosshairAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _MagickaAlpha_S
			SetSliderDialogStartValue(_LIH_MagickaAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _HealthAlpha_S
			SetSliderDialogStartValue(_LIH_HealthAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _StaminaAlpha_S
			SetSliderDialogStartValue(_LIH_StaminaAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _EnchantmentAlpha_S
			SetSliderDialogStartValue(_LIH_EnchantmentAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _ItemAlpha_S
			SetSliderDialogStartValue(_LIH_ItemAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _InfoAlpha_S
			SetSliderDialogStartValue(_LIH_InfoAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _SeparatorAlpha_S
			SetSliderDialogStartValue(_LIH_SeparatorAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _SubtitleAlpha_S
			SetSliderDialogStartValue(_LIH_SubtitleAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		elseIf a_option == _ArrowsAlpha_S
			SetSliderDialogStartValue(_LIH_ArrowsAlpha.GetValueInt() as Float)
			SetSliderDialogDefaultValue(100 as Float)
			SetSliderDialogRange(0 as Float, 100 as Float)
			SetSliderDialogInterval(1 as Float)
		endIf
	endIf
endEvent


Event OnOptionSliderAccept(Int a_option, Float a_value)
	String page = CurrentPage
	if page == "HUD Visibility"
		if a_option == _CrosshairAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_CrosshairAlpha.SetValue(a_value)
		elseIf a_option == _SneakCrosshairAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_SneakCrosshairAlpha.SetValue(a_value)
		elseIf a_option == _MagickaAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_MagickaAlpha.SetValue(a_value)
		elseIf a_option == _HealthAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_HealthAlpha.SetValue(a_value)
		elseIf a_option == _StaminaAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_StaminaAlpha.SetValue(a_value)
		elseIf a_option == _EnchantmentAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_EnchantmentAlpha.SetValue(a_value)
		elseIf a_option == _ItemAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_ItemAlpha.SetValue(a_value)
		elseIf a_option == _InfoAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_InfoAlpha.SetValue(a_value)
		elseIf a_option == _SeparatorAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_SeparatorAlpha.SetValue(a_value)
		elseIf a_option == _SubtitleAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_SubtitleAlpha.SetValue(a_value)
		elseIf a_option == _ArrowsAlpha_S
			SetSliderOptionValue(a_option, a_value, "{0}", false)
			_LIH_ArrowsAlpha.SetValue(a_value)
		endIf
	endIf
endEvent


Event OnOptionMenuAccept(Int a_option, Int a_index)
	String page = CurrentPage
endEvent


Event OnVersionUpdate(Int a_version)
endEvent


Event OnOptionDefault(Int a_option)
	String page = CurrentPage
endEvent


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

function OnGameReload()
	parent.OnGameReload()
	show("_root.HUDDummy", 0 as Bool)
	show("_root.HUDMovieBaseInstance", 0 as Bool)
	_LIH_SelectedItem = "None"
	_LIH_SelectedDesc = "None"
	_LIH_Reset.SetValueInt(0)
	_LIH_Selected.SetValueInt(0)
	Float _Version = 1.1

	if _LIH_Version.Getvalue() < _Version
		if _LIH_Version.GetValueInt() > 0
			_LIH_Default.SetValueInt(2)
			ApplySettings()
		else
			_LIH_Default.SetValueInt(0)
			ResetDefaults()
		endIf
		_LIH_Version.SetValue(_Version)
		debug.Notification("Updating to HUD version " + _Version as String)
	else
		debug.Notification("Initializing HUD version " + _Version as String)
		ApplySettings()
	endIf
endFunction


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

function setPages()
	Pages = new String[3]
	Pages[0] = "General Settings"
	Pages[1] = "HUD Visibility"
	Pages[2] = "HUD Position"
endFunction


Float function getHUDNumber(String element, String attribute) global
	return ui.GetNumber("HUD Menu", element + "." + attribute)
endFunction


function setHUDNumber(String element, String attribute, Float value) global
	ui.SetNumber("HUD Menu", element + "." + attribute, value)
endFunction


function setHUDBool(String element, String attribute, Bool value) global
	ui.SetBool("HUD Menu", element + "." + attribute, value)
endFunction


function setHUDString(String element, String attribute, String value) global
	ui.SetString("HUD Menu", element + "." + attribute, value)
endFunction


function hide(String clip, Bool visible)
	isClip = clip
	if visible == true
		visible = false
	else
		visible = true
	endIf
	LIH_ConfigMenu.setHUDBool(isClip, "_visible", visible)
endFunction


function ResetItem()
	if _LIH_SelectedItem == "Magica"
		_LIH_MagickaX.SetValue(_LIH_DefMagickaX.Getvalue())
		_LIH_MagickaY.SetValue(_LIH_DefMagickaY.Getvalue())
		_LIH_MagickaS.SetValueInt(100)
		_LIH_MagickaR.SetValueInt(0)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_x", _LIH_MagickaX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_y", _LIH_MagickaY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_xscale", _LIH_MagickaS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_yscale", _LIH_MagickaS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_rotation", _LIH_MagickaR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Health"
		_LIH_HealthX.SetValue(_LIH_DefHealthX.Getvalue())
		_LIH_HealthY.SetValue(_LIH_DefHealthY.Getvalue())
		_LIH_HealthS.SetValueInt(100)
		_LIH_HealthR.SetValueInt(0)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_x", _LIH_HealthX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_y", _LIH_HealthY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_xscale", _LIH_HealthS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_yscale", _LIH_HealthS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_rotation", _LIH_HealthR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_StaminaX.SetValue(_LIH_DefStaminaX.Getvalue())
		_LIH_StaminaY.SetValue(_LIH_DefStaminaY.Getvalue())
		_LIH_StaminaS.SetValueInt(100)
		_LIH_StaminaR.SetValueInt(0)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_x", _LIH_StaminaX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_y", _LIH_StaminaY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_xscale", _LIH_StaminaS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_yscale", _LIH_StaminaS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_rotation", _LIH_StaminaR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "CompassShoutMeterHolder"
		_LIH_CompassX.SetValue(_LIH_DefCompassX.Getvalue())
		_LIH_CompassY.SetValue(_LIH_DefCompassY.Getvalue())
		_LIH_CompassS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_x", _LIH_CompassX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_y", _LIH_CompassY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_xscale", _LIH_CompassS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_yscale", _LIH_CompassS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "EnemyHealth_mc"
		_LIH_EnemyHealthX.SetValue(_LIH_DefEnemyHealthX.Getvalue())
		_LIH_EnemyHealthY.SetValue(_LIH_DefEnemyHealthY.Getvalue())
		_LIH_EnemyHealthS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_x", _LIH_EnemyHealthX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_y", _LIH_EnemyHealthY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_xscale", _LIH_EnemyHealthS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_yscale", _LIH_EnemyHealthS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_ArrowsX.SetValue(_LIH_DefArrowsX.Getvalue())
		_LIH_ArrowsY.SetValue(_LIH_DefArrowsY.Getvalue())
		_LIH_ArrowsS.SetValueInt(100)
		_LIH_ArrowsAlign.SetValueInt(0)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_x", _LIH_ArrowsX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_y", _LIH_ArrowsY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_xscale", _LIH_ArrowsS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_yscale", _LIH_ArrowsS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowsAlign", "_alpha", _LIH_ArrowsAlign.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "StealthMeterInstance"
		_LIH_StealthMeterX.SetValue(_LIH_DefStealthMeterX.Getvalue())
		_LIH_StealthMeterY.SetValue(_LIH_DefStealthMeterY.Getvalue())
		_LIH_StealthMeterS.SetValueInt(58)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_x", _LIH_StealthMeterX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_y", _LIH_StealthMeterY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_xscale", _LIH_StealthMeterS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_yscale", _LIH_StealthMeterS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Crosshair"
		_LIH_CrosshairX.SetValue(_LIH_DefCrosshairX.Getvalue())
		_LIH_CrosshairY.SetValue(_LIH_DefCrosshairY.Getvalue())
		_LIH_CrosshairS.SetValueInt(31)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_x", _LIH_CrosshairX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_y", _LIH_CrosshairY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_xscale", _LIH_CrosshairS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_yscale", _LIH_CrosshairS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "SneakCrosshair"
		_LIH_SneakCrosshairX.SetValue(_LIH_DefSneakCrosshairX.Getvalue())
		_LIH_SneakCrosshairY.SetValue(_LIH_DefSneakCrosshairY.Getvalue())
		_LIH_SneakCrosshairS.SetValueInt(31)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_x", _LIH_SneakCrosshairX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_y", _LIH_SneakCrosshairY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_xscale", _LIH_SneakCrosshairS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_yscale", _LIH_SneakCrosshairS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_EnchantLX.SetValue(_LIH_DefEnchantLX.Getvalue())
		_LIH_EnchantLY.SetValue(_LIH_DefEnchantLY.Getvalue())
		_LIH_EnchantLS.SetValueInt(100)
		_LIH_EnchantLR.SetValueInt(0)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_x", _LIH_EnchantLX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_y", _LIH_EnchantLY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_xscale", _LIH_EnchantLS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_yscale", _LIH_EnchantLS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_rotation", _LIH_EnchantLR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_EnchantRX.SetValue(_LIH_DefEnchantRX.Getvalue())
		_LIH_EnchantRY.SetValue(_LIH_DefEnchantRY.Getvalue())
		_LIH_EnchantRS.SetValueInt(100)
		_LIH_EnchantRR.SetValueInt(0)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_x", _LIH_EnchantRX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_y", _LIH_EnchantRY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_xscale", _LIH_EnchantRS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_yscale", _LIH_EnchantRS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_rotation", _LIH_EnchantRR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_HUDMsgX.SetValue(_LIH_DefHUDMsgX.Getvalue())
		_LIH_HUDMsgY.SetValue(_LIH_DefHUDMsgY.Getvalue())
		_LIH_HUDMsgS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_x", _LIH_HUDMsgX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_y", _LIH_HUDMsgY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_xscale", _LIH_HUDMsgS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_yscale", _LIH_HUDMsgS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_LocationX.SetValue(_LIH_DefLocationX.Getvalue())
		_LIH_LocationY.SetValue(_LIH_DefLocationY.Getvalue())
		_LIH_LocationS.SetValueInt(100)
		_LIH_LocationAlign.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_x", _LIH_LocationX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_y", _LIH_LocationY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_xscale", _LIH_LocationS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_yscale", _LIH_LocationS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationAlign", "_yscale", _LIH_LocationAlign.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ActivateButton_tf"
		_LIH_ActivateButtonX.SetValue(_LIH_DefActivateButtonX.Getvalue())
		_LIH_ActivateButtonY.SetValue(_LIH_DefActivateButtonY.Getvalue())
		_LIH_ActivateButtonS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_x", _LIH_ActivateButtonY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_y", _LIH_ActivateButtonY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_xscale", _LIH_ActivateButtonS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_yscale", _LIH_ActivateButtonS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "RolloverNameInstance"
		_LIH_NameX.SetValue(_LIH_DefNameX.Getvalue())
		_LIH_NameY.SetValue(_LIH_DefNameY.Getvalue())
		_LIH_NameS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_x", _LIH_NameX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_y", _LIH_NameY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_xscale", _LIH_NameS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_yscale", _LIH_NameS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "GrayBarInstance"
		_LIH_GrayBarX.SetValue(_LIH_DefGrayBarX.Getvalue())
		_LIH_GrayBarY.SetValue(_LIH_DefGrayBarY.Getvalue())
		_LIH_GrayBarS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_x", _LIH_GrayBarX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_y", _LIH_GrayBarY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_xscale", _LIH_GrayBarS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_yscale", _LIH_GrayBarS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_InfoX.SetValue(_LIH_DefInfoX.Getvalue())
		_LIH_InfoY.SetValue(_LIH_DefInfoY.Getvalue())
		_LIH_InfoS.SetValueInt(100)
		_LIH_InfoAlign.SetValueInt(50)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_x", _LIH_InfoX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_y", _LIH_InfoY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_xscale", _LIH_InfoS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_yscale", _LIH_InfoS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_SubtitleX.SetValue(_LIH_DefSubtitleX.Getvalue())
		_LIH_SubtitleY.SetValue(_LIH_DefSubtitleY.Getvalue())
		_LIH_SubtitleS.SetValueInt(100)
		_LIH_SubtitlesAlign.SetValueInt(50)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_x", _LIH_SubtitleX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_y", _LIH_SubtitleY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_xscale", _LIH_SubtitleS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_yscale", _LIH_SubtitleS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitlesAlign", "_alpha", _LIH_SubtitlesAlign.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ItemLeading"
		_LIH_ItemLeadingAlpha.SetValue(0 as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ItemLeading", "_alpha", _LIH_ItemLeadingAlpha.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleLeading"
		_LIH_SubtitleLeadingAlpha.SetValue(0 as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleLeading", "_alpha", _LIH_SubtitleLeadingAlpha.Getvalue())
	elseIf _LIH_SelectedItem == "FavorBackButtonBase"
		_LIH_FavorBackButtonX.SetValue(_LIH_DefFavorBackButtonX.Getvalue())
		_LIH_FavorBackButtonY.SetValue(_LIH_DefFavorBackButtonY.Getvalue())
		_LIH_FavorBackButtonS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_x", _LIH_FavorBackButtonX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_y", _LIH_FavorBackButtonY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_xscale", _LIH_FavorBackButtonS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_yscale", _LIH_FavorBackButtonS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ObjectiveLineInstance"
		_LIH_ObjectivesX.SetValue(_LIH_DefObjectivesX.Getvalue())
		_LIH_ObjectivesY.SetValue(_LIH_DefObjectivesY.Getvalue())
		_LIH_ObjectivesS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_x", _LIH_ObjectivesX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_y", _LIH_ObjectivesY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_xscale", _LIH_ObjectivesS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_yscale", _LIH_ObjectivesS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ShoutAnimatedLetter"
		_LIH_ShoutsX.SetValue(_LIH_DefShoutsX.Getvalue())
		_LIH_ShoutsY.SetValue(_LIH_DefShoutsY.Getvalue())
		_LIH_ShoutsS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_x", _LIH_ShoutsX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_y", _LIH_ShoutsY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_xscale", _LIH_ShoutsS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_yscale", _LIH_ShoutsS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "AnimatedLetter_mc"
		_LIH_AnimLetterX.SetValue(_LIH_DefAnimLetterX.Getvalue())
		_LIH_AnimLetterY.SetValue(_LIH_DefAnimLetterY.Getvalue())
		_LIH_AnimLetterS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_x", _LIH_AnimLetterX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_y", _LIH_AnimLetterY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_xscale", _LIH_AnimLetterS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_yscale", _LIH_AnimLetterS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "LevelMeterBaseInstance"
		_LIH_LevelUpX.SetValue(_LIH_DefObjectivesX.Getvalue())
		_LIH_LevelUpY.SetValue(_LIH_DefObjectivesY.Getvalue())
		_LIH_LevelUpS.SetValueInt(100)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_x", _LIH_LevelUpX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_y", _LIH_LevelUpY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_xscale", _LIH_LevelUpS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_yscale", _LIH_LevelUpS.GetValueInt() as Float)
	endIf
	if _LIH_DebugVisible.GetValueInt() == 1
		debug.Notification("Values Reset: " + _LIH_SelectedDesc)
	endIf
	UpdateItem()
endFunction


function ApplyHUD()
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_alpha", _LIH_ItemAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_alpha", _LIH_InfoAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_alpha", _LIH_SeparatorAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_alpha", _LIH_SubtitleAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_alpha", _LIH_ArrowsAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_alpha", _LIH_SubtitleAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_alpha", _LIH_ArrowsAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_rotation", _LIH_MagickaR.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_rotation", _LIH_HealthR.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_rotation", _LIH_StaminaR.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_rotation", _LIH_EnchantLR.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_rotation", _LIH_EnchantRR.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_alpha", _LIH_EnchantmentAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_alpha", _LIH_EnchantmentAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_x", _LIH_MagickaX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_y", _LIH_MagickaY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_xscale", _LIH_MagickaS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_yscale", _LIH_MagickaS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_alpha", _LIH_MagickaAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_x", _LIH_HealthX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_y", _LIH_HealthY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_xscale", _LIH_HealthS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_yscale", _LIH_HealthS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_alpha", _LIH_HealthAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_x", _LIH_StaminaX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_y", _LIH_StaminaY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_xscale", _LIH_StaminaS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_yscale", _LIH_StaminaS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_alpha", _LIH_StaminaAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_x", _LIH_CompassX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_y", _LIH_CompassY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_xscale", _LIH_CompassS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_yscale", _LIH_CompassS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_x", _LIH_EnemyHealthX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_y", _LIH_EnemyHealthY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_xscale", _LIH_EnemyHealthS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_yscale", _LIH_EnemyHealthS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_x", _LIH_ArrowsX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_y", _LIH_ArrowsY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_xscale", _LIH_ArrowsS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_yscale", _LIH_ArrowsS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_x", _LIH_StealthMeterX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_y", _LIH_StealthMeterY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_xscale", _LIH_StealthMeterS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_yscale", _LIH_StealthMeterS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_x", _LIH_CrosshairX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_y", _LIH_CrosshairY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_xscale", _LIH_CrosshairS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_yscale", _LIH_CrosshairS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_x", _LIH_SneakCrosshairX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_y", _LIH_SneakCrosshairY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_xscale", _LIH_SneakCrosshairS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_yscale", _LIH_SneakCrosshairS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_x", _LIH_EnchantLX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_y", _LIH_EnchantLY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_xscale", _LIH_EnchantLS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_yscale", _LIH_EnchantLS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_x", _LIH_EnchantRX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_y", _LIH_EnchantRY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_xscale", _LIH_EnchantRS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_yscale", _LIH_EnchantRS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_x", _LIH_HUDMsgX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_y", _LIH_HUDMsgY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_xscale", _LIH_HUDMsgS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_yscale", _LIH_HUDMsgS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_x", _LIH_LocationX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_y", _LIH_LocationY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_xscale", _LIH_LocationS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_yscale", _LIH_LocationS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_x", _LIH_ActivateButtonX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_y", _LIH_ActivateButtonY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_xscale", _LIH_ActivateButtonS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_yscale", _LIH_ActivateButtonS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_x", _LIH_NameX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_y", _LIH_NameY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_xscale", _LIH_NameS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_yscale", _LIH_NameS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_x", _LIH_GrayBarX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_y", _LIH_GrayBarY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_xscale", _LIH_GrayBarS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_yscale", _LIH_GrayBarS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_x", _LIH_InfoX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_y", _LIH_InfoY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_xscale", _LIH_InfoS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_yscale", _LIH_InfoS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_x", _LIH_SubtitleX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_y", _LIH_SubtitleY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_xscale", _LIH_SubtitleS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_yscale", _LIH_SubtitleS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ItemLeading", "_alpha", _LIH_ItemLeadingAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleLeading", "_alpha", _LIH_SubtitleLeadingAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_x", _LIH_FavorBackButtonX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_y", _LIH_FavorBackButtonY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_xscale", _LIH_FavorBackButtonS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_yscale", _LIH_FavorBackButtonS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_x", _LIH_LevelUpX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_y", _LIH_LevelUpY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_xscale", _LIH_LevelUpS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_yscale", _LIH_LevelUpS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_x", _LIH_ObjectivesX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_y", _LIH_ObjectivesY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_xscale", _LIH_ObjectivesS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_yscale", _LIH_ObjectivesS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_x", _LIH_ShoutsX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_y", _LIH_ShoutsY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_xscale", _LIH_ShoutsS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_yscale", _LIH_ShoutsS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_x", _LIH_AnimLetterX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_y", _LIH_AnimLetterY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_xscale", _LIH_AnimLetterS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_yscale", _LIH_AnimLetterS.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowsAlign", "_alpha", _LIH_ArrowsAlign.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitlesAlign", "_alpha", _LIH_SubtitlesAlign.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationAlign", "_alpha", _LIH_LocationAlign.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.HUDMsgAlign", "_alpha", _LIH_HUDMsgAlign.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.InfoAlign", "_alpha", _LIH_InfoAlign.GetValueInt() as Float)
	show("_root.HUDMovieBaseInstance", 1 as Bool)
	if _LIH_Enabled.GetValueInt() == 0
		_LIH_Toggle.SetValueInt(1)
		ToggleHUD()
	endIf
endFunction


function MoveDown()
	if _LIH_SelectedItem == "Magica"
		_LIH_MagickaY.SetValue(_LIH_MagickaY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_y", _LIH_MagickaY.Getvalue())
	elseIf _LIH_SelectedItem == "Health"
		_LIH_HealthY.SetValue(_LIH_HealthY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_y", _LIH_HealthY.Getvalue())
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_StaminaY.SetValue(_LIH_StaminaY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_y", _LIH_StaminaY.Getvalue())
	elseIf _LIH_SelectedItem == "CompassShoutMeterHolder"
		_LIH_CompassY.SetValue(_LIH_CompassY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_y", _LIH_CompassY.Getvalue())
	elseIf _LIH_SelectedItem == "EnemyHealth_mc"
		_LIH_EnemyHealthY.SetValue(_LIH_EnemyHealthY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_y", _LIH_EnemyHealthY.Getvalue())
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_ArrowsY.SetValue(_LIH_ArrowsY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_y", _LIH_ArrowsY.Getvalue())
	elseIf _LIH_SelectedItem == "StealthMeterInstance"
		_LIH_StealthMeterY.SetValue(_LIH_StealthMeterY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_y", _LIH_StealthMeterY.Getvalue())
	elseIf _LIH_SelectedItem == "Crosshair"
		_LIH_CrosshairY.SetValue(_LIH_CrosshairY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_y", _LIH_CrosshairY.Getvalue())
	elseIf _LIH_SelectedItem == "SneakCrosshair"
		_LIH_SneakCrosshairY.SetValue(_LIH_SneakCrosshairY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_y", _LIH_SneakCrosshairY.Getvalue())
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_EnchantLY.SetValue(_LIH_EnchantLY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_y", _LIH_EnchantLY.Getvalue())
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_EnchantRY.SetValue(_LIH_EnchantRY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_y", _LIH_EnchantRY.Getvalue())
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_HUDMsgY.SetValue(_LIH_HUDMsgY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_y", _LIH_HUDMsgY.Getvalue())
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_LocationY.SetValue(_LIH_LocationY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_y", _LIH_LocationY.Getvalue())
	elseIf _LIH_SelectedItem == "ActivateButton_tf"
		_LIH_ActivateButtonY.SetValue(_LIH_ActivateButtonY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_y", _LIH_ActivateButtonY.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverNameInstance"
		_LIH_NameY.SetValue(_LIH_NameY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_y", _LIH_NameY.Getvalue())
	elseIf _LIH_SelectedItem == "GrayBarInstance"
		_LIH_GrayBarY.SetValue(_LIH_GrayBarY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_y", _LIH_GrayBarY.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_InfoY.SetValue(_LIH_InfoY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_y", _LIH_InfoY.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_SubtitleY.SetValue(_LIH_SubtitleY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_y", _LIH_SubtitleY.Getvalue())
	elseIf _LIH_SelectedItem == "ItemLeading"
		
	elseIf _LIH_SelectedItem == "SubtitleLeading"
		
	elseIf _LIH_SelectedItem == "FavorBackButtonBase"
		_LIH_FavorBackButtonY.SetValue(_LIH_FavorBackButtonY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_x", _LIH_FavorBackButtonY.Getvalue())
	elseIf _LIH_SelectedItem == "ObjectiveLineInstance"
		_LIH_ObjectivesY.SetValue(_LIH_ObjectivesY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_y", _LIH_ObjectivesY.Getvalue())
	elseIf _LIH_SelectedItem == "ShoutAnimatedLetter"
		_LIH_ShoutsY.SetValue(_LIH_ShoutsY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_y", _LIH_ShoutsY.Getvalue())
	elseIf _LIH_SelectedItem == "AnimatedLetter_mc"
		_LIH_AnimLetterY.SetValue(_LIH_AnimLetterY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_y", _LIH_AnimLetterY.Getvalue())
	elseIf _LIH_SelectedItem == "LevelMeterBaseInstance"
		_LIH_LevelUpY.SetValue(_LIH_LevelUpY.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_y", _LIH_LevelUpY.Getvalue())
	endIf
	UpdateItem()
endFunction


function show(String clip, Bool visible)
	isClip = clip
	LIH_ConfigMenu.setHUDBool(isClip, "_visible", visible)
endFunction


function UpdateItem()
	_LIH_XItem = 0 as Float
	_LIH_YItem = 0 as Float
	_LIH_ScaleItem = 0
	_LIH_RotateItem = 0
	_LIH_AlignItem = ""
	if _LIH_SelectedItem == "Magica"
		_LIH_XItem = _LIH_MagickaX.Getvalue()
		_LIH_YItem = _LIH_MagickaY.Getvalue()
		_LIH_ScaleItem = _LIH_MagickaS.GetValueInt()
		_LIH_RotateItem = _LIH_MagickaR.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_x", _LIH_XItem)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_y", _LIH_YItem)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_xscale", _LIH_ScaleItem as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_yscale", _LIH_ScaleItem as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_rotation", _LIH_RotateItem as Float)
	elseIf _LIH_SelectedItem == "Health"
		_LIH_XItem = _LIH_HealthX.Getvalue()
		_LIH_YItem = _LIH_HealthY.Getvalue()
		_LIH_ScaleItem = _LIH_HealthS.GetValueInt()
		_LIH_RotateItem = _LIH_HealthR.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_x", _LIH_XItem)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_y", _LIH_YItem)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_xscale", _LIH_ScaleItem as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_yscale", _LIH_ScaleItem as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_rotation", _LIH_RotateItem as Float)
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_XItem = _LIH_StaminaX.Getvalue()
		_LIH_YItem = _LIH_StaminaY.Getvalue()
		_LIH_ScaleItem = _LIH_StaminaS.GetValueInt()
		_LIH_RotateItem = _LIH_StaminaR.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_x", _LIH_XItem)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_y", _LIH_YItem)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_xscale", _LIH_ScaleItem as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_yscale", _LIH_ScaleItem as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_rotation", _LIH_RotateItem as Float)
	elseIf _LIH_SelectedItem == "CompassShoutMeterHolder"
		_LIH_XItem = _LIH_CompassX.Getvalue()
		_LIH_YItem = _LIH_CompassY.Getvalue()
		_LIH_ScaleItem = _LIH_CompassS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder", "_x", _LIH_CompassX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder", "_y", _LIH_CompassY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder", "_xscale", _LIH_CompassS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder", "_yscale", _LIH_CompassS.Getvalue())
	elseIf _LIH_SelectedItem == "EnemyHealth_mc"
		_LIH_XItem = _LIH_EnemyHealthX.Getvalue()
		_LIH_YItem = _LIH_EnemyHealthY.Getvalue()
		_LIH_ScaleItem = _LIH_EnemyHealthS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyHealth_mc", "_x", _LIH_EnemyHealthX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyHealth_mc", "_y", _LIH_EnemyHealthY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyHealth_mc", "_xscale", _LIH_EnemyHealthS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyHealth_mc", "_yscale", _LIH_EnemyHealthS.Getvalue())
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_XItem = _LIH_ArrowsX.Getvalue()
		_LIH_YItem = _LIH_ArrowsY.Getvalue()
		_LIH_ScaleItem = _LIH_ArrowsS.GetValueInt()
		_LIH_RotateItem = _LIH_ArrowsAlign.GetValueInt()
		ShowAlign()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_x", _LIH_ArrowsX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_y", _LIH_ArrowsY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_xscale", _LIH_ArrowsS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_yscale", _LIH_ArrowsS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowsAlign", "_alpha", _LIH_ArrowsAlign.Getvalue())
	elseIf _LIH_SelectedItem == "StealthMeterInstance"
		_LIH_XItem = _LIH_StealthMeterX.Getvalue()
		_LIH_YItem = _LIH_StealthMeterY.Getvalue()
		_LIH_ScaleItem = _LIH_StealthMeterS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.StealthMeterInstance", "_x", _LIH_StealthMeterX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.StealthMeterInstance", "_y", _LIH_StealthMeterY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.StealthMeterInstance", "_xscale", _LIH_StealthMeterS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.StealthMeterInstance", "_yscale", _LIH_StealthMeterS.Getvalue())
	elseIf _LIH_SelectedItem == "Crosshair"
		_LIH_XItem = _LIH_CrosshairX.Getvalue()
		_LIH_YItem = _LIH_CrosshairY.Getvalue()
		_LIH_ScaleItem = _LIH_CrosshairS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_x", _LIH_CrosshairX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_y", _LIH_CrosshairY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_xscale", _LIH_CrosshairS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_yscale", _LIH_CrosshairS.Getvalue())
	elseIf _LIH_SelectedItem == "SneakCrosshair"
		_LIH_XItem = _LIH_SneakCrosshairX.Getvalue()
		_LIH_YItem = _LIH_SneakCrosshairY.Getvalue()
		_LIH_ScaleItem = _LIH_SneakCrosshairS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_x", _LIH_SneakCrosshairX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_y", _LIH_SneakCrosshairY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_xscale", _LIH_SneakCrosshairS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_yscale", _LIH_SneakCrosshairS.Getvalue())
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_XItem = _LIH_EnchantLX.Getvalue()
		_LIH_YItem = _LIH_EnchantLY.Getvalue()
		_LIH_ScaleItem = _LIH_EnchantLS.GetValueInt()
		_LIH_RotateItem = _LIH_EnchantLR.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_x", _LIH_EnchantLX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_y", _LIH_EnchantLY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_xscale", _LIH_EnchantLS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_yscale", _LIH_EnchantLS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_rotation", _LIH_EnchantLR.Getvalue())
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_XItem = _LIH_EnchantRX.Getvalue()
		_LIH_YItem = _LIH_EnchantRY.Getvalue()
		_LIH_ScaleItem = _LIH_EnchantRS.GetValueInt()
		_LIH_RotateItem = _LIH_EnchantRR.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_x", _LIH_EnchantRX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_y", _LIH_EnchantRY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_xscale", _LIH_EnchantRS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_yscale", _LIH_EnchantRS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_rotation", _LIH_EnchantRR.Getvalue())
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_XItem = _LIH_HUDMsgX.Getvalue()
		_LIH_YItem = _LIH_HUDMsgY.Getvalue()
		_LIH_ScaleItem = _LIH_HUDMsgS.GetValueInt()
		_LIH_RotateItem = _LIH_HUDMsgAlign.GetValueInt()
		ShowAlign()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.MessagesBlock", "_x", _LIH_HUDMsgX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.MessagesBlock", "_y", _LIH_HUDMsgY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.MessagesBlock", "_xscale", _LIH_HUDMsgS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.MessagesBlock", "_yscale", _LIH_HUDMsgS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.HUDMsgAlign", "_alpha", _LIH_HUDMsgAlign.Getvalue())
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_XItem = _LIH_LocationX.Getvalue()
		_LIH_YItem = _LIH_LocationY.Getvalue()
		_LIH_ScaleItem = _LIH_LocationS.GetValueInt()
		_LIH_RotateItem = _LIH_LocationAlign.GetValueInt()
		ShowAlign()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationLockBase", "_x", _LIH_LocationX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationLockBase", "_y", _LIH_LocationY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationLockBase", "_xscale", _LIH_LocationS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationLockBase", "_yscale", _LIH_LocationS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationAlign", "_alpha", _LIH_LocationAlign.Getvalue())
	elseIf _LIH_SelectedItem == "ActivateButton_tf"
		_LIH_XItem = _LIH_ActivateButtonX.Getvalue()
		_LIH_YItem = _LIH_ActivateButtonY.Getvalue()
		_LIH_ScaleItem = _LIH_ActivateButtonS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ActivateButton_tf", "_x", _LIH_ActivateButtonY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ActivateButton_tf", "_y", _LIH_ActivateButtonY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ActivateButton_tf", "_xscale", _LIH_ActivateButtonS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ActivateButton_tf", "_yscale", _LIH_ActivateButtonS.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverNameInstance"
		_LIH_XItem = _LIH_NameX.Getvalue()
		_LIH_YItem = _LIH_NameY.Getvalue()
		_LIH_ScaleItem = _LIH_NameS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_x", _LIH_NameX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_y", _LIH_NameY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_xscale", _LIH_NameS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_yscale", _LIH_NameS.Getvalue())
	elseIf _LIH_SelectedItem == "GrayBarInstance"
		_LIH_XItem = _LIH_GrayBarX.Getvalue()
		_LIH_YItem = _LIH_GrayBarY.Getvalue()
		_LIH_ScaleItem = _LIH_GrayBarS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_x", _LIH_GrayBarX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_y", _LIH_GrayBarY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_xscale", _LIH_GrayBarS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_yscale", _LIH_GrayBarS.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_XItem = _LIH_InfoX.Getvalue()
		_LIH_YItem = _LIH_InfoY.Getvalue()
		_LIH_ScaleItem = _LIH_InfoS.GetValueInt()
		_LIH_RotateItem = _LIH_InfoAlign.GetValueInt()
		ShowAlign()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_x", _LIH_InfoX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_y", _LIH_InfoY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_xscale", _LIH_InfoS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_yscale", _LIH_InfoS.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_XItem = _LIH_SubtitleX.Getvalue()
		_LIH_YItem = _LIH_SubtitleY.Getvalue()
		_LIH_ScaleItem = _LIH_SubtitleS.GetValueInt()
		_LIH_RotateItem = _LIH_SubtitlesAlign.GetValueInt()
		ShowAlign()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_x", _LIH_SubtitleX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_y", _LIH_SubtitleY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_xscale", _LIH_SubtitleS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_yscale", _LIH_SubtitleS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitlesAlign", "_alpha", _LIH_SubtitlesAlign.Getvalue())
	elseIf _LIH_SelectedItem == "ItemLeading"
		_LIH_XItem = 0 as Float
		_LIH_YItem = 0 as Float
		_LIH_ScaleItem = _LIH_ItemLeadingAlpha.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ItemLeading", "_alpha", _LIH_ItemLeadingAlpha.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleLeading"
		_LIH_XItem = 0 as Float
		_LIH_YItem = 0 as Float
		_LIH_ScaleItem = _LIH_SubtitleLeadingAlpha.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleLeading", "_alpha", _LIH_SubtitleLeadingAlpha.Getvalue())
	elseIf _LIH_SelectedItem == "FavorBackButtonBase"
		_LIH_XItem = _LIH_FavorBackButtonX.Getvalue()
		_LIH_YItem = _LIH_FavorBackButtonY.Getvalue()
		_LIH_ScaleItem = _LIH_FavorBackButtonS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.FavorBackButtonBase", "_x", _LIH_FavorBackButtonX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.FavorBackButtonBase", "_y", _LIH_FavorBackButtonY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.FavorBackButtonBase", "_xscale", _LIH_FavorBackButtonS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.FavorBackButtonBase", "_yscale", _LIH_FavorBackButtonS.Getvalue())
	elseIf _LIH_SelectedItem == "ObjectiveLineInstance"
		_LIH_XItem = _LIH_ObjectivesX.Getvalue()
		_LIH_YItem = _LIH_ObjectivesY.Getvalue()
		_LIH_ScaleItem = _LIH_ObjectivesS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ObjectiveLineInstance", "_x", _LIH_ObjectivesX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ObjectiveLineInstance", "_y", _LIH_ObjectivesY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ObjectiveLineInstance", "_xscale", _LIH_ObjectivesS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ObjectiveLineInstance", "_yscale", _LIH_ObjectivesS.Getvalue())
	elseIf _LIH_SelectedItem == "ShoutAnimatedLetter"
		_LIH_XItem = _LIH_ShoutsX.Getvalue()
		_LIH_YItem = _LIH_ShoutsY.Getvalue()
		_LIH_ScaleItem = _LIH_ShoutsS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_x", _LIH_ShoutsX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_y", _LIH_ShoutsY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_xscale", _LIH_ShoutsS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_yscale", _LIH_ShoutsS.Getvalue())
	elseIf _LIH_SelectedItem == "AnimatedLetter_mc"
		_LIH_XItem = _LIH_AnimLetterX.Getvalue()
		_LIH_YItem = _LIH_AnimLetterY.Getvalue()
		_LIH_ScaleItem = _LIH_AnimLetterS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.AnimatedLetter_mc", "_x", _LIH_AnimLetterX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.AnimatedLetter_mc", "_y", _LIH_AnimLetterY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.AnimatedLetter_mc", "_xscale", _LIH_AnimLetterS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.AnimatedLetter_mc", "_yscale", _LIH_AnimLetterS.Getvalue())
	elseIf _LIH_SelectedItem == "LevelMeterBaseInstance"
		_LIH_XItem = _LIH_LevelUpX.Getvalue()
		_LIH_YItem = _LIH_LevelUpY.Getvalue()
		_LIH_ScaleItem = _LIH_LevelUpS.GetValueInt()
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_x", _LIH_LevelUpX.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_y", _LIH_LevelUpY.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_xscale", _LIH_LevelUpS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_yscale", _LIH_LevelUpS.Getvalue())
	endIf
	LIH_ConfigMenu.setHUDString("_root.HUDDummy.guideLines_mc.HUDDisplayInfo", "text", _LIH_SelectedDesc + " / Step: " + _LIH_Step.Getvalue() as String + " units " + " X: " + _LIH_XItem as String + " Y: " + _LIH_YItem as String + " S: " + _LIH_ScaleItem as String + "%" + " R/A: " + _LIH_RotateItem as String + " " + _LIH_AlignItem)
endFunction


function ResetDefaults()
	_LIH_UndiscoveredMarkersVisible.SetValueInt(1)
	_LIH_LocationMarkersVisible.SetValueInt(1)
	_LIH_EnemyMarkersVisible.SetValueInt(1)
	_LIH_PlayerSetMarkerVisible.SetValueInt(1)
	_LIH_QuestDoorMarkersVisible.SetValueInt(1)
	_LIH_QuestMarkersVisible.SetValueInt(1)
	_LIH_AltHealthBarVisible.SetValueInt(0)
	_LIH_EnchantmentAlpha.SetValueInt(100)
	_LIH_ItemAlpha.SetValueInt(100)
	_LIH_InfoAlpha.SetValueInt(100)
	_LIH_SeparatorAlpha.SetValueInt(100)
	_LIH_SubtitleAlpha.SetValueInt(100)
	_LIH_ArrowsAlpha.SetValueInt(100)
	_LIH_CrosshairAlpha.SetValueInt(100)
	_LIH_SneakCrosshairAlpha.SetValueInt(100)
	_LIH_MagickaR.SetValueInt(0)
	_LIH_HealthR.SetValueInt(0)
	_LIH_StaminaR.SetValueInt(0)
	_LIH_EnchantLR.SetValueInt(0)
	_LIH_EnchantRR.SetValueInt(0)
	_LIH_MagickaX.SetValue(_LIH_DefMagickaX.Getvalue())
	_LIH_MagickaY.SetValue(_LIH_DefMagickaY.Getvalue())
	_LIH_MagickaS.SetValueInt(100)
	_LIH_MagickaAlpha.SetValueInt(100)
	_LIH_HealthX.SetValue(_LIH_DefHealthX.Getvalue())
	_LIH_HealthY.SetValue(_LIH_DefHealthY.Getvalue())
	_LIH_HealthS.SetValueInt(100)
	_LIH_HealthAlpha.SetValueInt(100)
	_LIH_StaminaX.SetValue(_LIH_DefStaminaX.Getvalue())
	_LIH_StaminaY.SetValue(_LIH_DefStaminaY.Getvalue())
	_LIH_StaminaS.SetValueInt(100)
	_LIH_StaminaAlpha.SetValueInt(100)
	_LIH_CompassX.SetValue(_LIH_DefCompassX.Getvalue())
	_LIH_CompassY.SetValue(_LIH_DefCompassY.Getvalue())
	_LIH_CompassS.SetValueInt(100)
	_LIH_EnemyHealthX.SetValue(_LIH_DefEnemyHealthX.Getvalue())
	_LIH_EnemyHealthY.SetValue(_LIH_DefEnemyHealthY.Getvalue())
	_LIH_EnemyHealthS.SetValueInt(100)
	_LIH_ArrowsX.SetValue(_LIH_DefArrowsX.Getvalue())
	_LIH_ArrowsY.SetValue(_LIH_DefArrowsY.Getvalue())
	_LIH_ArrowsS.SetValueInt(100)
	_LIH_StealthMeterX.SetValue(_LIH_DefStealthMeterX.Getvalue())
	_LIH_StealthMeterY.SetValue(_LIH_DefStealthMeterY.Getvalue())
	_LIH_StealthMeterS.SetValueInt(58)
	_LIH_CrosshairX.SetValue(_LIH_DefCrosshairX.Getvalue())
	_LIH_CrosshairY.SetValue(_LIH_DefCrosshairY.Getvalue())
	_LIH_CrosshairS.SetValueInt(31)
	_LIH_SneakCrosshairX.SetValue(_LIH_DefSneakCrosshairX.Getvalue())
	_LIH_SneakCrosshairY.SetValue(_LIH_DefSneakCrosshairY.Getvalue())
	_LIH_SneakCrosshairS.SetValueInt(31)
	_LIH_EnchantLX.SetValue(_LIH_DefEnchantLX.Getvalue())
	_LIH_EnchantLY.SetValue(_LIH_DefEnchantLY.Getvalue())
	_LIH_EnchantLS.SetValueInt(100)
	_LIH_EnchantRX.SetValue(_LIH_DefEnchantRX.Getvalue())
	_LIH_EnchantRY.SetValue(_LIH_DefEnchantRY.Getvalue())
	_LIH_EnchantRS.SetValueInt(100)
	_LIH_HUDMsgX.SetValue(_LIH_DefHUDMsgX.Getvalue())
	_LIH_HUDMsgY.SetValue(_LIH_DefHUDMsgY.Getvalue())
	_LIH_HUDMsgS.SetValueInt(100)
	_LIH_LocationX.SetValue(_LIH_DefLocationX.Getvalue())
	_LIH_LocationY.SetValue(_LIH_DefLocationY.Getvalue())
	_LIH_LocationS.SetValueInt(100)
	_LIH_ActivateButtonX.SetValue(_LIH_DefActivateButtonX.Getvalue())
	_LIH_ActivateButtonY.SetValue(_LIH_DefActivateButtonY.Getvalue())
	_LIH_ActivateButtonS.SetValueInt(100)
	_LIH_NameX.SetValue(_LIH_DefNameX.Getvalue())
	_LIH_NameY.SetValue(_LIH_DefNameY.Getvalue())
	_LIH_NameS.SetValueInt(100)
	_LIH_GrayBarX.SetValue(_LIH_DefGrayBarX.Getvalue())
	_LIH_GrayBarY.SetValue(_LIH_DefGrayBarY.Getvalue())
	_LIH_GrayBarS.SetValueInt(100)
	_LIH_InfoX.SetValue(_LIH_DefInfoX.Getvalue())
	_LIH_InfoY.SetValue(_LIH_DefInfoY.Getvalue())
	_LIH_InfoS.SetValueInt(100)
	_LIH_SubtitleX.SetValue(_LIH_DefSubtitleX.Getvalue())
	_LIH_SubtitleY.SetValue(_LIH_DefSubtitleY.Getvalue())
	_LIH_SubtitleS.SetValueInt(100)
	_LIH_ItemLeadingAlpha.SetValue(0 as Float)
	_LIH_SubtitleLeadingAlpha.SetValue(0 as Float)
	_LIH_FavorBackButtonX.SetValue(_LIH_DefFavorBackButtonX.Getvalue())
	_LIH_FavorBackButtonY.SetValue(_LIH_DefFavorBackButtonY.Getvalue())
	_LIH_FavorBackButtonS.SetValueInt(100)
	_LIH_LevelUpX.SetValue(_LIH_DefLevelUpX.Getvalue())
	_LIH_LevelUpY.SetValue(_LIH_DefLevelUpY.Getvalue())
	_LIH_LevelUpS.SetValueInt(100)
	_LIH_ObjectivesX.SetValue(_LIH_DefObjectivesX.Getvalue())
	_LIH_ObjectivesY.SetValue(_LIH_DefObjectivesY.Getvalue())
	_LIH_ObjectivesS.SetValueInt(100)
	_LIH_ShoutsX.SetValue(_LIH_DefShoutsX.Getvalue())
	_LIH_ShoutsY.SetValue(_LIH_DefShoutsY.Getvalue())
	_LIH_ShoutsS.SetValueInt(100)
	_LIH_AnimLetterX.SetValue(_LIH_DefAnimLetterX.Getvalue())
	_LIH_AnimLetterY.SetValue(_LIH_DefAnimLetterY.Getvalue())
	_LIH_AnimLetterS.SetValueInt(100)
	_LIH_ArrowsAlign.SetValueInt(0)
	_LIH_SubtitlesAlign.SetValueInt(50)
	_LIH_LocationAlign.SetValueInt(100)
	_LIH_HUDMsgAlign.SetValueInt(0)
	_LIH_InfoAlign.SetValueInt(50)
	if _LIH_Default.GetValueInt() == 1 && _LIH_Reset.GetValueInt() == 1
		_LIH_Default.SetValueInt(0)
		debug.Notification("Uninstalling mod..")
		_LIH_AltHealthBarVisible.SetValueInt(0)
		_LIH_SneakCrosshairAlpha.SetValueInt(100)
		_LIH_SneakCrosshairVisible.SetValueInt(0)
		_LIH_ActivateButtonVisible.SetValueInt(1)
		_LIH_AltCrosshairVisible.SetValueInt(0)
		_LIH_AltSneakMeterVisible.SetValueInt(0)
		_LIH_SneakTextVisible.SetValueInt(1)
		_LIH_SlimCompassVisible.SetValueInt(0)
		ApplyChanges()
		ApplyHUD()
	endIf
	_LIH_Reset.SetValueInt(0)
	ApplySettings()
endFunction


function ZoomOut()
	if _LIH_SelectedItem == "Magica"
		_LIH_MagickaS.SetValueInt(_LIH_MagickaS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_xscale", _LIH_MagickaS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_yscale", _LIH_MagickaS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Health"
		_LIH_HealthS.SetValueInt(_LIH_HealthS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_xscale", _LIH_HealthS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_yscale", _LIH_HealthS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_StaminaS.SetValueInt(_LIH_StaminaS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_xscale", _LIH_StaminaS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_yscale", _LIH_StaminaS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "CompassShoutMeterHolder"
		_LIH_CompassS.SetValueInt(_LIH_CompassS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_xscale", _LIH_CompassS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_yscale", _LIH_CompassS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "EnemyHealth_mc"
		_LIH_EnemyHealthS.SetValueInt(_LIH_EnemyHealthS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_xscale", _LIH_EnemyHealthS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_yscale", _LIH_EnemyHealthS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_ArrowsS.SetValueInt(_LIH_ArrowsS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_xscale", _LIH_ArrowsS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_yscale", _LIH_ArrowsS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "StealthMeterInstance"
		_LIH_StealthMeterS.SetValueInt(_LIH_StealthMeterS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_xscale", _LIH_StealthMeterS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_yscale", _LIH_StealthMeterS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Crosshair"
		_LIH_CrosshairS.SetValueInt(_LIH_CrosshairS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_xscale", _LIH_CrosshairS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_yscale", _LIH_CrosshairS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "SneakCrosshair"
		_LIH_SneakCrosshairS.SetValueInt(_LIH_SneakCrosshairS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_xscale", _LIH_SneakCrosshairS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_yscale", _LIH_SneakCrosshairS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_EnchantLS.SetValueInt(_LIH_EnchantLS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_xscale", _LIH_EnchantLS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_yscale", _LIH_EnchantLS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_EnchantRS.SetValueInt(_LIH_EnchantRS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_xscale", _LIH_EnchantRS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_yscale", _LIH_EnchantRS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_HUDMsgS.SetValueInt(_LIH_HUDMsgS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_xscale", _LIH_HUDMsgS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_yscale", _LIH_HUDMsgS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_LocationS.SetValueInt(_LIH_LocationS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_xscale", _LIH_LocationS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_yscale", _LIH_LocationS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ActivateButton_tf"
		_LIH_ActivateButtonS.SetValueInt(_LIH_ActivateButtonS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_xscale", _LIH_ActivateButtonS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_yscale", _LIH_ActivateButtonS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "RolloverNameInstance"
		_LIH_NameS.SetValueInt(_LIH_NameS.GetValueInt() - _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_xscale", _LIH_NameS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_yscale", _LIH_NameS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "GrayBarInstance"
		_LIH_GrayBarS.SetValue(_LIH_GrayBarS.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_xscale", _LIH_GrayBarS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_yscale", _LIH_GrayBarS.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_InfoS.SetValue(_LIH_InfoS.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_xscale", _LIH_InfoS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_yscale", _LIH_InfoS.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_SubtitleS.SetValue(_LIH_SubtitleS.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_xscale", _LIH_SubtitleS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_yscale", _LIH_SubtitleS.Getvalue())
	elseIf _LIH_SelectedItem == "ItemLeading"
		_LIH_ItemLeadingAlpha.SetValue(_LIH_ItemLeadingAlpha.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ItemLeading", "_alpha", _LIH_ItemLeadingAlpha.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleLeading"
		_LIH_SubtitleLeadingAlpha.SetValue(_LIH_SubtitleLeadingAlpha.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleLeading", "_alpha", _LIH_SubtitleLeadingAlpha.Getvalue())
	elseIf _LIH_SelectedItem == "FavorBackButtonBase"
		_LIH_FavorBackButtonS.SetValue(_LIH_FavorBackButtonS.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_xscale", _LIH_FavorBackButtonS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_yscale", _LIH_FavorBackButtonS.Getvalue())
	elseIf _LIH_SelectedItem == "ObjectiveLineInstance"
		_LIH_ObjectivesS.SetValue(_LIH_ObjectivesS.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_xscale", _LIH_ObjectivesS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_yscale", _LIH_ObjectivesS.Getvalue())
	elseIf _LIH_SelectedItem == "ShoutAnimatedLetter"
		_LIH_ShoutsS.SetValue(_LIH_ShoutsS.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_xscale", _LIH_ShoutsS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_yscale", _LIH_ShoutsS.Getvalue())
	elseIf _LIH_SelectedItem == "AnimatedLetter_mc"
		_LIH_AnimLetterS.SetValue(_LIH_AnimLetterS.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_xscale", _LIH_AnimLetterS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_yscale", _LIH_AnimLetterS.Getvalue())
	elseIf _LIH_SelectedItem == "LevelMeterBaseInstance"
		_LIH_LevelUpS.SetValue(_LIH_LevelUpS.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_xscale", _LIH_LevelUpS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_yscale", _LIH_LevelUpS.Getvalue())
	endIf
	UpdateItem()
endFunction


function LoadDummy()
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder.CompassFrameAlt", "_visible", _LIH_SlimCompassVisible.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder.CompassFrame", "_visible", _LIH_SlimCompassVisible.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_alpha", _LIH_ItemAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_alpha", _LIH_InfoAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_alpha", _LIH_SeparatorAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_alpha", _LIH_SubtitleAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_x", _LIH_MagickaX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_y", _LIH_MagickaY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_xscale", _LIH_MagickaS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_yscale", _LIH_MagickaS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Magica", "_alpha", _LIH_MagickaAlpha.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_x", _LIH_HealthX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_y", _LIH_HealthY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_xscale", _LIH_HealthS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_yscale", _LIH_HealthS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Health", "_alpha", _LIH_HealthAlpha.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_x", _LIH_StaminaX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_y", _LIH_StaminaY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_xscale", _LIH_StaminaS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_yscale", _LIH_StaminaS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Stamina", "_alpha", _LIH_StaminaAlpha.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder", "_x", _LIH_CompassX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder", "_y", _LIH_CompassY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder", "_xscale", _LIH_CompassS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.CompassShoutMeterHolder", "_yscale", _LIH_CompassS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyHealth_mc", "_x", _LIH_EnemyHealthX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyHealth_mc", "_y", _LIH_EnemyHealthY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyHealth_mc", "_xscale", _LIH_EnemyHealthS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyHealth_mc", "_yscale", _LIH_EnemyHealthS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_x", _LIH_ArrowsX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_y", _LIH_ArrowsY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_xscale", _LIH_ArrowsS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowInfoInstance", "_yscale", _LIH_ArrowsS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.StealthMeterInstance", "_x", _LIH_StealthMeterX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.StealthMeterInstance", "_y", _LIH_StealthMeterY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.StealthMeterInstance", "_xscale", _LIH_StealthMeterS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.StealthMeterInstance", "_yscale", _LIH_StealthMeterS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_x", _LIH_CrosshairX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_y", _LIH_CrosshairY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_xscale", _LIH_CrosshairS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_yscale", _LIH_CrosshairS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_x", _LIH_SneakCrosshairX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_y", _LIH_SneakCrosshairY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_xscale", _LIH_SneakCrosshairS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_yscale", _LIH_SneakCrosshairS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_x", _LIH_EnchantLX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_y", _LIH_EnchantLY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_xscale", _LIH_EnchantLS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_yscale", _LIH_EnchantLS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_x", _LIH_EnchantRX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_y", _LIH_EnchantRY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_xscale", _LIH_EnchantRS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_yscale", _LIH_EnchantRS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.MessagesBlock", "_x", _LIH_HUDMsgX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.MessagesBlock", "_y", _LIH_HUDMsgY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.MessagesBlock", "_xscale", _LIH_HUDMsgS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.MessagesBlock", "_yscale", _LIH_HUDMsgS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationLockBase", "_x", _LIH_LocationX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationLockBase", "_y", _LIH_LocationY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationLockBase", "_xscale", _LIH_LocationS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationLockBase", "_yscale", _LIH_LocationS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ActivateButton_tf", "_x", _LIH_ActivateButtonX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ActivateButton_tf", "_y", _LIH_ActivateButtonY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ActivateButton_tf", "_xscale", _LIH_ActivateButtonS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ActivateButton_tf", "_yscale", _LIH_ActivateButtonS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_x", _LIH_NameX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_y", _LIH_NameY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_xscale", _LIH_NameS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverNameInstance", "_yscale", _LIH_NameS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_x", _LIH_GrayBarX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_y", _LIH_GrayBarY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_xscale", _LIH_GrayBarS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.GrayBarInstance", "_yscale", _LIH_GrayBarS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_x", _LIH_InfoX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_y", _LIH_InfoY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_xscale", _LIH_InfoS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.RolloverInfoInstance", "_yscale", _LIH_InfoS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_x", _LIH_SubtitleX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_y", _LIH_SubtitleY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_xscale", _LIH_SubtitleS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleTextHolder", "_yscale", _LIH_SubtitleS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ItemLeading", "_alpha", _LIH_ItemLeadingAlpha.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleLeading", "_alpha", _LIH_SubtitleLeadingAlpha.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.FavorBackButtonBase", "_x", _LIH_FavorBackButtonX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.FavorBackButtonBase", "_y", _LIH_FavorBackButtonY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.FavorBackButtonBase", "_xscale", _LIH_FavorBackButtonS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.FavorBackButtonBase", "_yscale", _LIH_FavorBackButtonS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_x", _LIH_LevelUpX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_y", _LIH_LevelUpY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_xscale", _LIH_LevelUpS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_yscale", _LIH_LevelUpS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ObjectiveLineInstance", "_x", _LIH_ObjectivesX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ObjectiveLineInstance", "_y", _LIH_ObjectivesY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ObjectiveLineInstance", "_xscale", _LIH_ObjectivesS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ObjectiveLineInstance", "_yscale", _LIH_ObjectivesS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_x", _LIH_ShoutsX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_y", _LIH_ShoutsY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_xscale", _LIH_ShoutsS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_yscale", _LIH_ShoutsS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.AnimatedLetter_mc", "_x", _LIH_AnimLetterX.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.AnimatedLetter_mc", "_y", _LIH_AnimLetterY.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.AnimatedLetter_mc", "_xscale", _LIH_AnimLetterS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestUpdateBaseInstance.AnimatedLetter_mc", "_yscale", _LIH_AnimLetterS.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowsAlign", "_alpha", _LIH_ArrowsAlign.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitlesAlign", "_alpha", _LIH_SubtitlesAlign.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationAlign", "_alpha", _LIH_LocationAlign.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.HUDMsgAlign", "_alpha", _LIH_HUDMsgAlign.Getvalue())
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.HUDInfoAlign", "_alpha", _LIH_InfoAlign.Getvalue())
endFunction


function ApplySettings()
	if _LIH_Enabled.GetValueInt() > 0 && _LIH_Reset.GetValueInt() < 1
		if _LIH_DebugVisible.GetValueInt() == 1
			debug.Notification("Applying settings...")
		endIf
		LIH_MainInstance.reset()
		ApplyChanges()
		if _LIH_Default.GetValueInt() == 2
			if _LIH_DebugVisible.GetValueInt() == 1
				debug.Notification("Restoring saved HUD position...")
			endIf
		elseIf _LIH_DebugVisible.GetValueInt() == 1
			debug.Notification("Restoring default HUD position...")
		endIf
		ApplyHUD()
	endIf
	if _LIH_Enabled.GetValueInt() == 0 && _LIH_Default.GetValueInt() > 0
		debug.Notification("Disabling mod...")
		LIH_MainInstance.deactivate()
		_LIH_Default.SetValueInt(1)
		_LIH_Reset.SetValueInt(1)
	endIf
	if _LIH_Reset.GetValueInt() == 1
		if _LIH_DebugVisible.GetValueInt() == 1
			debug.Notification("Restoring default HUD values...")
		endIf
		ResetDefaults()
	elseIf _LIH_Load.GetValueInt() > 0
		if _LIH_DebugVisible.GetValueInt() == 1
			if _LIH_Load.GetValueInt() == 2
				debug.Notification("Saved preset HUD values.")
			else
				debug.Notification("Restored saved HUD values.")
			endif
		endIf

		if _LIH_Load.GetValueInt() == 2
			SavePreset_New()
		elseif _LIH_Load.GetValueInt() == 3
			LoadPreset_New()
		else
			LoadPreset()
		endif
	endIf
endFunction


function MoveRight()
	if _LIH_SelectedItem == "Magica"
		_LIH_MagickaX.SetValue(_LIH_MagickaX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_x", _LIH_MagickaX.Getvalue())
	elseIf _LIH_SelectedItem == "Health"
		_LIH_HealthX.SetValue(_LIH_HealthX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_x", _LIH_HealthX.Getvalue())
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_StaminaX.SetValue(_LIH_StaminaX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_x", _LIH_StaminaX.Getvalue())
	elseIf _LIH_SelectedItem == "CompassShoutMeterHolder"
		_LIH_CompassX.SetValue(_LIH_CompassX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_x", _LIH_CompassX.Getvalue())
	elseIf _LIH_SelectedItem == "EnemyHealth_mc"
		_LIH_EnemyHealthX.SetValue(_LIH_EnemyHealthX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_x", _LIH_EnemyHealthX.Getvalue())
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_ArrowsX.SetValue(_LIH_ArrowsX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_x", _LIH_ArrowsX.Getvalue())
	elseIf _LIH_SelectedItem == "StealthMeterInstance"
		_LIH_StealthMeterX.SetValue(_LIH_StealthMeterX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_x", _LIH_StealthMeterX.Getvalue())
	elseIf _LIH_SelectedItem == "Crosshair"
		_LIH_CrosshairX.SetValue(_LIH_CrosshairX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_x", _LIH_CrosshairX.Getvalue())
	elseIf _LIH_SelectedItem == "SneakCrosshair"
		_LIH_SneakCrosshairX.SetValue(_LIH_SneakCrosshairX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_x", _LIH_SneakCrosshairX.Getvalue())
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_EnchantLX.SetValue(_LIH_EnchantLX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_x", _LIH_EnchantLX.Getvalue())
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_EnchantRX.SetValue(_LIH_EnchantRX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_x", _LIH_EnchantRX.Getvalue())
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_HUDMsgX.SetValue(_LIH_HUDMsgX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_x", _LIH_HUDMsgX.Getvalue())
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_LocationX.SetValue(_LIH_LocationX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_x", _LIH_LocationX.Getvalue())
	elseIf _LIH_SelectedItem == "ActivateButton_tf"
		_LIH_ActivateButtonX.SetValue(_LIH_ActivateButtonX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_x", _LIH_ActivateButtonX.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverNameInstance"
		_LIH_NameX.SetValue(_LIH_NameX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_x", _LIH_NameX.Getvalue())
	elseIf _LIH_SelectedItem == "GrayBarInstance"
		_LIH_GrayBarX.SetValue(_LIH_GrayBarX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_x", _LIH_GrayBarX.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_InfoX.SetValue(_LIH_InfoX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_x", _LIH_InfoX.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_SubtitleX.SetValue(_LIH_SubtitleX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_x", _LIH_SubtitleX.Getvalue())
	elseIf _LIH_SelectedItem == "ItemLeading"
		
	elseIf _LIH_SelectedItem == "SubtitleLeading"
		
	elseIf _LIH_SelectedItem == "FavorBackButtonBase"
		_LIH_FavorBackButtonX.SetValue(_LIH_FavorBackButtonX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_x", _LIH_FavorBackButtonX.Getvalue())
	elseIf _LIH_SelectedItem == "ObjectiveLineInstance"
		_LIH_ObjectivesX.SetValue(_LIH_ObjectivesX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_x", _LIH_ObjectivesX.Getvalue())
	elseIf _LIH_SelectedItem == "ShoutAnimatedLetter"
		_LIH_ShoutsX.SetValue(_LIH_ShoutsX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_x", _LIH_ShoutsX.Getvalue())
	elseIf _LIH_SelectedItem == "AnimatedLetter_mc"
		_LIH_AnimLetterX.SetValue(_LIH_AnimLetterX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_x", _LIH_AnimLetterX.Getvalue())
	elseIf _LIH_SelectedItem == "LevelMeterBaseInstance"
		_LIH_LevelUpX.SetValue(_LIH_LevelUpX.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_x", _LIH_LevelUpX.Getvalue())
	endIf
	UpdateItem()
endFunction


function LoadPreset()
	_LIH_UndiscoveredMarkersVisible.SetValueInt(0)
	_LIH_LocationMarkersVisible.SetValueInt(1)
	_LIH_EnemyMarkersVisible.SetValueInt(0)
	_LIH_PlayerSetMarkerVisible.SetValueInt(1)
	_LIH_QuestDoorMarkersVisible.SetValueInt(0)
	_LIH_QuestMarkersVisible.SetValueInt(0)
	_LIH_AltHealthBarVisible.SetValueInt(1)
	_LIH_CrosshairAlpha.SetValueInt(75)
	_LIH_SneakCrosshairAlpha.SetValueInt(75)
	_LIH_SneakCrosshairVisible.SetValueInt(1)
	_LIH_ActivateButtonVisible.SetValueInt(0)
	_LIH_AltCrosshairVisible.SetValueInt(0)
	_LIH_AltSneakMeterVisible.SetValueInt(1)
	_LIH_SneakTextVisible.SetValueInt(0)
	_LIH_SlimCompassVisible.SetValueInt(1)
	_LIH_EnchantmentAlpha.SetValueInt(65)
	_LIH_ItemAlpha.SetValueInt(85)
	_LIH_InfoAlpha.SetValueInt(75)
	_LIH_SeparatorAlpha.SetValueInt(60)
	_LIH_SubtitleAlpha.SetValueInt(90)
	_LIH_ArrowsAlpha.SetValueInt(65)
	_LIH_MagickaR.SetValueInt(0)
	_LIH_HealthR.SetValueInt(0)
	_LIH_StaminaR.SetValueInt(0)
	_LIH_EnchantLR.SetValueInt(0)
	_LIH_EnchantRR.SetValueInt(0)
	_LIH_MagickaX.SetValue(-635.150)
	_LIH_MagickaY.SetValue(237.050)
	_LIH_MagickaS.SetValueInt(75)
	_LIH_MagickaAlpha.SetValueInt(65)
	_LIH_HealthX.SetValue(22.7000)
	_LIH_HealthY.SetValue(237.050)
	_LIH_HealthS.SetValueInt(75)
	_LIH_HealthAlpha.SetValueInt(65)
	_LIH_StaminaX.SetValue(681.850)
	_LIH_StaminaY.SetValue(237.050)
	_LIH_StaminaS.SetValueInt(75)
	_LIH_StaminaAlpha.SetValueInt(65)
	_LIH_CompassX.SetValue(22.7000)
	_LIH_CompassY.SetValue(-474.950)
	_LIH_CompassS.SetValueInt(65)
	_LIH_EnemyHealthX.SetValue(23.3000)
	_LIH_EnemyHealthY.SetValue(-475 as Float)
	_LIH_EnemyHealthS.SetValueInt(65)
	_LIH_ArrowsX.SetValue(-208.150)
	_LIH_ArrowsY.SetValue(278.050)
	_LIH_ArrowsS.SetValueInt(76)
	_LIH_StealthMeterX.SetValue(23.2500)
	_LIH_StealthMeterY.SetValue(233.400)
	_LIH_StealthMeterS.SetValueInt(36)
	_LIH_CrosshairX.SetValue(23.2000)
	_LIH_CrosshairY.SetValue(-115.300)
	_LIH_CrosshairS.SetValueInt(22)
	_LIH_SneakCrosshairX.SetValue(23.4000)
	_LIH_SneakCrosshairY.SetValue(-115.350)
	_LIH_SneakCrosshairS.SetValueInt(22)
	_LIH_EnchantLX.SetValue(-625.150)
	_LIH_EnchantLY.SetValue(231.050)
	_LIH_EnchantLS.SetValueInt(60)
	_LIH_EnchantRX.SetValue(671.850)
	_LIH_EnchantRY.SetValue(231.050)
	_LIH_EnchantRS.SetValueInt(60)
	_LIH_HUDMsgX.SetValue(-598.150)
	_LIH_HUDMsgY.SetValue(-464.950)
	_LIH_HUDMsgS.SetValueInt(66)
	_LIH_LocationX.SetValue(929.850)
	_LIH_LocationY.SetValue(-428.950)
	_LIH_LocationS.SetValueInt(160)
	_LIH_ActivateButtonX.SetValue(-101.350)
	_LIH_ActivateButtonY.SetValue(-42.5000)
	_LIH_ActivateButtonS.SetValueInt(0)
	_LIH_NameX.SetValue(-527.950)
	_LIH_NameY.SetValue(24.1500)
	_LIH_NameS.SetValueInt(86)
	_LIH_GrayBarX.SetValue(-78.6000)
	_LIH_GrayBarY.SetValue(73.2000)
	_LIH_GrayBarS.SetValueInt(80)
	_LIH_InfoX.SetValue(-240 as Float)
	_LIH_InfoY.SetValue(73.2000)
	_LIH_InfoS.SetValueInt(80)
	_LIH_SubtitleX.SetValue(23.5000)
	_LIH_SubtitleY.SetValue(211.500)
	_LIH_SubtitleS.SetValueInt(85)
	_LIH_ItemLeadingAlpha.SetValue(-3 as Float)
	_LIH_SubtitleLeadingAlpha.SetValue(-4 as Float)
	_LIH_FavorBackButtonX.SetValue(640.850)
	_LIH_FavorBackButtonY.SetValue(186.050)
	_LIH_FavorBackButtonS.SetValueInt(90)
	_LIH_LevelUpX.SetValue(-27 as Float)
	_LIH_LevelUpY.SetValue(122 as Float)
	_LIH_LevelUpS.SetValueInt(80)
	_LIH_ObjectivesX.SetValue(0 as Float)
	_LIH_ObjectivesY.SetValue(221.650)
	_LIH_ObjectivesS.SetValueInt(100)
	_LIH_ShoutsX.SetValue(-192.700)
	_LIH_ShoutsY.SetValue(10 as Float)
	_LIH_ShoutsS.SetValueInt(140)
	_LIH_AnimLetterX.SetValue(-21 as Float)
	_LIH_AnimLetterY.SetValue(122 as Float)
	_LIH_AnimLetterS.SetValueInt(80)
	_LIH_ArrowsAlign.SetValueInt(0)
	_LIH_SubtitlesAlign.SetValueInt(50)
	_LIH_LocationAlign.SetValueInt(50)
	_LIH_HUDMsgAlign.SetValueInt(0)
	_LIH_InfoAlign.SetValueInt(50)
	_LIH_Reset.SetValueInt(0)
	_LIH_Load.SetValueInt(0)
	ApplySettings()
endFunction


function toggle2(globalvariable value)
	if value.GetValueInt() == 0
		value.SetValueInt(2)
	else
		value.SetValueInt(0)
	endIf
endFunction


function toggle3(globalvariable value)
	if value.GetValueInt() == 0
		value.SetValueInt(3)
	else
		value.SetValueInt(0)
	endIf
endFunction


function LoadPreset_New()
	FISSInterface fiss = FISSFactory.getFISS()
	If fiss
		fiss.beginLoad("LessIntrusiveHUD2.xml")
		_LIH_BarsAlwaysVisible.SetValueInt(fiss.loadInt("_LIH_BarsAlwaysVisible"))
		_LIH_UndiscoveredMarkersVisible.SetValueInt(fiss.loadInt("_LIH_UndiscoveredMarkersVisible"))
		_LIH_LocationMarkersVisible.SetValueInt(fiss.loadInt("_LIH_LocationMarkersVisible"))
		_LIH_EnemyMarkersVisible.SetValueInt(fiss.loadInt("_LIH_EnemyMarkersVisible"))
		_LIH_PlayerSetMarkerVisible.SetValueInt(fiss.loadInt("_LIH_PlayerSetMarkerVisible"))
		_LIH_QuestDoorMarkersVisible.SetValueInt(fiss.loadInt("_LIH_QuestDoorMarkersVisible"))
		_LIH_QuestMarkersVisible.SetValueInt(fiss.loadInt("_LIH_QuestMarkersVisible"))
		_LIH_AltHealthBarVisible.SetValueInt(fiss.loadInt("_LIH_AltHealthBarVisible"))
		_LIH_CrosshairAlpha.SetValueInt(fiss.loadInt("_LIH_CrosshairAlpha"))
		_LIH_SneakCrosshairAlpha.SetValueInt(fiss.loadInt("_LIH_SneakCrosshairAlpha"))
		_LIH_SneakCrosshairVisible.SetValueInt(fiss.loadInt("_LIH_SneakCrosshairVisible"))
		_LIH_ActivateButtonVisible.SetValueInt(fiss.loadInt("_LIH_ActivateButtonVisible"))
		_LIH_AltCrosshairVisible.SetValueInt(fiss.loadInt("_LIH_AltCrosshairVisible"))
		_LIH_AltSneakMeterVisible.SetValueInt(fiss.loadInt("_LIH_AltSneakMeterVisible"))
		_LIH_SneakTextVisible.SetValueInt(fiss.loadInt("_LIH_SneakTextVisible"))
		_LIH_SlimCompassVisible.SetValueInt(fiss.loadInt("_LIH_SlimCompassVisible"))
		_LIH_EnchantmentAlpha.SetValueInt(fiss.loadInt("_LIH_EnchantmentAlpha"))
		_LIH_ItemAlpha.SetValueInt(fiss.loadInt("_LIH_ItemAlpha"))
		_LIH_InfoAlpha.SetValueInt(fiss.loadInt("_LIH_InfoAlpha"))
		_LIH_SeparatorAlpha.SetValueInt(fiss.loadInt("_LIH_SeparatorAlpha"))
		_LIH_SubtitleAlpha.SetValueInt(fiss.loadInt("_LIH_SubtitleAlpha"))
		_LIH_ArrowsAlpha.SetValueInt(fiss.loadInt("_LIH_ArrowsAlpha"))
		_LIH_MagickaR.SetValueInt(fiss.loadInt("_LIH_MagickaR"))
		_LIH_HealthR.SetValueInt(fiss.loadInt("_LIH_HealthR"))
		_LIH_StaminaR.SetValueInt(fiss.loadInt("_LIH_StaminaR"))
		_LIH_EnchantLR.SetValueInt(fiss.loadInt("_LIH_EnchantLR"))
		_LIH_EnchantRR.SetValueInt(fiss.loadInt("_LIH_EnchantRR"))
		_LIH_MagickaX.SetValue(fiss.loadFloat("_LIH_MagickaX"))
		_LIH_MagickaY.SetValue(fiss.loadFloat("_LIH_MagickaY"))
		_LIH_MagickaS.SetValueInt(fiss.loadInt("_LIH_MagickaS"))
		_LIH_MagickaAlpha.SetValueInt(fiss.loadInt("_LIH_MagickaAlpha"))
		_LIH_HealthX.SetValue(fiss.loadFloat("_LIH_HealthX"))
		_LIH_HealthY.SetValue(fiss.loadFloat("_LIH_HealthY"))
		_LIH_HealthS.SetValueInt(fiss.loadInt("_LIH_HealthS"))
		_LIH_HealthAlpha.SetValueInt(fiss.loadInt("_LIH_HealthAlpha"))
		_LIH_StaminaX.SetValue(fiss.loadFloat("_LIH_StaminaX"))
		_LIH_StaminaY.SetValue(fiss.loadFloat("_LIH_StaminaY"))
		_LIH_StaminaS.SetValueInt(fiss.loadInt("_LIH_StaminaS"))
		_LIH_StaminaAlpha.SetValueInt(fiss.loadInt("_LIH_StaminaAlpha"))
		_LIH_CompassX.SetValue(fiss.loadFloat("_LIH_CompassX"))
		_LIH_CompassY.SetValue(fiss.loadFloat("_LIH_CompassY"))
		_LIH_CompassS.SetValueInt(fiss.loadInt("_LIH_CompassS"))
		_LIH_EnemyHealthX.SetValue(fiss.loadFloat("_LIH_EnemyHealthX"))
		_LIH_EnemyHealthY.SetValue(fiss.loadFloat("_LIH_EnemyHealthY"))
		_LIH_EnemyHealthS.SetValueInt(fiss.loadInt("_LIH_EnemyHealthS"))
		_LIH_ArrowsX.SetValue(fiss.loadFloat("_LIH_ArrowsX"))
		_LIH_ArrowsY.SetValue(fiss.loadFloat("_LIH_ArrowsY"))
		_LIH_ArrowsS.SetValueInt(fiss.loadInt("_LIH_ArrowsS"))
		_LIH_StealthMeterX.SetValue(fiss.loadFloat("_LIH_StealthMeterX"))
		_LIH_StealthMeterY.SetValue(fiss.loadFloat("_LIH_StealthMeterY"))
		_LIH_StealthMeterS.SetValueInt(fiss.loadInt("_LIH_StealthMeterS"))
		_LIH_CrosshairX.SetValue(fiss.loadFloat("_LIH_CrosshairX"))
		_LIH_CrosshairY.SetValue(fiss.loadFloat("_LIH_CrosshairY"))
		_LIH_CrosshairS.SetValueInt(fiss.loadInt("_LIH_CrosshairS"))
		_LIH_SneakCrosshairX.SetValue(fiss.loadFloat("_LIH_SneakCrosshairX"))
		_LIH_SneakCrosshairY.SetValue(fiss.loadFloat("_LIH_SneakCrosshairY"))
		_LIH_SneakCrosshairS.SetValueInt(fiss.loadInt("_LIH_SneakCrosshairS"))
		_LIH_EnchantLX.SetValue(fiss.loadFloat("_LIH_EnchantLX"))
		_LIH_EnchantLY.SetValue(fiss.loadFloat("_LIH_EnchantLY"))
		_LIH_EnchantLS.SetValueInt(fiss.loadInt("_LIH_EnchantLS"))
		_LIH_EnchantRX.SetValue(fiss.loadFloat("_LIH_EnchantRX"))
		_LIH_EnchantRY.SetValue(fiss.loadFloat("_LIH_EnchantRY"))
		_LIH_EnchantRS.SetValueInt(fiss.loadInt("_LIH_EnchantRS"))
		_LIH_HUDMsgX.SetValue(fiss.loadFloat("_LIH_HUDMsgX"))
		_LIH_HUDMsgY.SetValue(fiss.loadFloat("_LIH_HUDMsgY"))
		_LIH_HUDMsgS.SetValueInt(fiss.loadInt("_LIH_HUDMsgS"))
		_LIH_LocationX.SetValue(fiss.loadFloat("_LIH_LocationX"))
		_LIH_LocationY.SetValue(fiss.loadFloat("_LIH_LocationY"))
		_LIH_LocationS.SetValueInt(fiss.loadInt("_LIH_LocationS"))
		_LIH_ActivateButtonX.SetValue(fiss.loadFloat("_LIH_ActivateButtonX"))
		_LIH_ActivateButtonY.SetValue(fiss.loadFloat("_LIH_ActivateButtonY"))
		_LIH_ActivateButtonS.SetValueInt(fiss.loadInt("_LIH_ActivateButtonS"))
		_LIH_NameX.SetValue(fiss.loadFloat("_LIH_NameX"))
		_LIH_NameY.SetValue(fiss.loadFloat("_LIH_NameY"))
		_LIH_NameS.SetValueInt(fiss.loadInt("_LIH_NameS"))
		_LIH_GrayBarX.SetValue(fiss.loadFloat("_LIH_GrayBarX"))
		_LIH_GrayBarY.SetValue(fiss.loadFloat("_LIH_GrayBarY"))
		_LIH_GrayBarS.SetValueInt(fiss.loadInt("_LIH_GrayBarS"))
		_LIH_InfoX.SetValue(fiss.loadFloat("_LIH_InfoX"))
		_LIH_InfoY.SetValue(fiss.loadFloat("_LIH_InfoY"))
		_LIH_InfoS.SetValueInt(fiss.loadInt("_LIH_InfoS"))
		_LIH_SubtitleX.SetValue(fiss.loadFloat("_LIH_SubtitleX"))
		_LIH_SubtitleY.SetValue(fiss.loadFloat("_LIH_SubtitleY"))
		_LIH_SubtitleS.SetValueInt(fiss.loadInt("_LIH_SubtitleS"))
		_LIH_ItemLeadingAlpha.SetValue(fiss.loadInt("_LIH_ItemLeadingAlpha"))
		_LIH_SubtitleLeadingAlpha.SetValue(fiss.loadInt("_LIH_SubtitleLeadingAlpha"))
		_LIH_FavorBackButtonX.SetValue(fiss.loadFloat("_LIH_FavorBackButtonX"))
		_LIH_FavorBackButtonY.SetValue(fiss.loadFloat("_LIH_FavorBackButtonY"))
		_LIH_FavorBackButtonS.SetValueInt(fiss.loadInt("_LIH_FavorBackButtonS"))
		_LIH_LevelUpX.SetValue(fiss.loadFloat("_LIH_LevelUpX"))
		_LIH_LevelUpY.SetValue(fiss.loadFloat("_LIH_LevelUpY"))
		_LIH_LevelUpS.SetValueInt(fiss.loadInt("_LIH_LevelUpS"))
		_LIH_ObjectivesX.SetValue(fiss.loadFloat("_LIH_ObjectivesX"))
		_LIH_ObjectivesY.SetValue(fiss.loadFloat("_LIH_ObjectivesY"))
		_LIH_ObjectivesS.SetValueInt(fiss.loadInt("_LIH_ObjectivesS"))
		_LIH_ShoutsX.SetValue(fiss.loadFloat("_LIH_ShoutsX"))
		_LIH_ShoutsY.SetValue(fiss.loadFloat("_LIH_ShoutsY"))
		_LIH_ShoutsS.SetValueInt(fiss.loadInt("_LIH_ShoutsS"))
		_LIH_AnimLetterX.SetValue(fiss.loadFloat("_LIH_AnimLetterX"))
		_LIH_AnimLetterY.SetValue(fiss.loadFloat("_LIH_AnimLetterY"))
		_LIH_AnimLetterS.SetValueInt(fiss.loadInt("_LIH_AnimLetterS"))
		_LIH_ArrowsAlign.SetValue(fiss.loadFloat("_LIH_ArrowsAlign"))
		_LIH_SubtitlesAlign.SetValue(fiss.loadFloat("_LIH_SubtitlesAlign"))
		_LIH_LocationAlign.SetValue(fiss.loadFloat("_LIH_LocationAlign"))
		_LIH_HUDMsgAlign.SetValueInt(fiss.loadInt("_LIH_HUDMsgAlign"))
		_LIH_InfoAlign.SetValueInt(fiss.loadInt("_LIH_InfoAlign"))
		string loadResult = fiss.endLoad()

		_LIH_Reset.SetValueInt(0)
		_LIH_Load.SetValueInt(0)
		ApplySettings()
	else
		LoadPreset()
	endif
endFunction


function SavePreset_New()
	FISSInterface fiss = FISSFactory.getFISS()
	If fiss
		fiss.beginSave("LessIntrusiveHUD2.xml", "LessIntrusiveHUD2")
		fiss.saveInt("_LIH_BarsAlwaysVisible", _LIH_BarsAlwaysVisible.GetValueInt())
		fiss.saveInt("_LIH_UndiscoveredMarkersVisible", _LIH_UndiscoveredMarkersVisible.GetValueInt())
		fiss.saveInt("_LIH_LocationMarkersVisible", _LIH_LocationMarkersVisible.GetValueInt())
		fiss.saveInt("_LIH_EnemyMarkersVisible", _LIH_EnemyMarkersVisible.GetValueInt())
		fiss.saveInt("_LIH_PlayerSetMarkerVisible", _LIH_PlayerSetMarkerVisible.GetValueInt())
		fiss.saveInt("_LIH_QuestDoorMarkersVisible", _LIH_QuestDoorMarkersVisible.GetValueInt())
		fiss.saveInt("_LIH_QuestMarkersVisible", _LIH_QuestMarkersVisible.GetValueInt())
		fiss.saveInt("_LIH_AltHealthBarVisible", _LIH_AltHealthBarVisible.GetValueInt())
		fiss.saveInt("_LIH_CrosshairAlpha", _LIH_CrosshairAlpha.GetValueInt())
		fiss.saveInt("_LIH_SneakCrosshairAlpha", _LIH_SneakCrosshairAlpha.GetValueInt())
		fiss.saveInt("_LIH_SneakCrosshairVisible", _LIH_SneakCrosshairVisible.GetValueInt())
		fiss.saveInt("_LIH_ActivateButtonVisible", _LIH_ActivateButtonVisible.GetValueInt())
		fiss.saveInt("_LIH_AltCrosshairVisible", _LIH_AltCrosshairVisible.GetValueInt())
		fiss.saveInt("_LIH_AltSneakMeterVisible", _LIH_AltSneakMeterVisible.GetValueInt())
		fiss.saveInt("_LIH_SneakTextVisible", _LIH_SneakTextVisible.GetValueInt())
		fiss.saveInt("_LIH_SlimCompassVisible", _LIH_SlimCompassVisible.GetValueInt())
		fiss.saveInt("_LIH_ItemAlpha", _LIH_ItemAlpha.GetValueInt())
		fiss.saveInt("_LIH_InfoAlpha", _LIH_InfoAlpha.GetValueInt())
		fiss.saveInt("_LIH_SeparatorAlpha", _LIH_SeparatorAlpha.GetValueInt())
		fiss.saveInt("_LIH_SubtitleAlpha", _LIH_SubtitleAlpha.GetValueInt())
		fiss.saveInt("_LIH_ArrowsAlpha", _LIH_ArrowsAlpha.GetValueInt())
		fiss.saveInt("_LIH_MagickaR", _LIH_MagickaR.GetValueInt())
		fiss.saveInt("_LIH_HealthR", _LIH_HealthR.GetValueInt())
		fiss.saveInt("_LIH_StaminaR", _LIH_StaminaR.GetValueInt())
		fiss.saveInt("_LIH_EnchantLR", _LIH_EnchantLR.GetValueInt())
		fiss.saveInt("_LIH_EnchantRR", _LIH_EnchantRR.GetValueInt())
		fiss.saveInt("_LIH_EnchantmentAlpha", _LIH_EnchantmentAlpha.GetValueInt())
		fiss.saveFloat("_LIH_MagickaX", _LIH_MagickaX.GetValue())
		fiss.saveFloat("_LIH_MagickaY", _LIH_MagickaY.GetValue())
		fiss.saveInt("_LIH_MagickaS", _LIH_MagickaS.GetValueInt())
		fiss.saveInt("_LIH_MagickaAlpha", _LIH_MagickaAlpha.GetValueInt())
		fiss.saveFloat("_LIH_HealthX", _LIH_HealthX.GetValue())
		fiss.saveFloat("_LIH_HealthY", _LIH_HealthY.GetValue())
		fiss.saveInt("_LIH_HealthS", _LIH_HealthS.GetValueInt())
		fiss.saveInt("_LIH_HealthAlpha", _LIH_HealthAlpha.GetValueInt())
		fiss.saveFloat("_LIH_StaminaX", _LIH_StaminaX.GetValue())
		fiss.saveFloat("_LIH_StaminaY", _LIH_StaminaY.GetValue())
		fiss.saveInt("_LIH_StaminaS", _LIH_StaminaS.GetValueInt())
		fiss.saveInt("_LIH_StaminaAlpha", _LIH_StaminaAlpha.GetValueInt())
		fiss.saveFloat("_LIH_CompassX", _LIH_CompassX.GetValue())
		fiss.saveFloat("_LIH_CompassY", _LIH_CompassY.GetValue())
		fiss.saveInt("_LIH_CompassS", _LIH_CompassS.GetValueInt())
		fiss.saveFloat("_LIH_EnemyHealthX", _LIH_EnemyHealthX.GetValue())
		fiss.saveFloat("_LIH_EnemyHealthY", _LIH_EnemyHealthY.GetValue())
		fiss.saveInt("_LIH_EnemyHealthS", _LIH_EnemyHealthS.GetValueInt())
		fiss.saveFloat("_LIH_ArrowsX", _LIH_ArrowsX.GetValue())
		fiss.saveFloat("_LIH_ArrowsY", _LIH_ArrowsY.GetValue())
		fiss.saveInt("_LIH_ArrowsS", _LIH_ArrowsS.GetValueInt())
		fiss.saveFloat("_LIH_StealthMeterX", _LIH_StealthMeterX.GetValue())
		fiss.saveFloat("_LIH_StealthMeterY", _LIH_StealthMeterY.GetValue())
		fiss.saveInt("_LIH_StealthMeterS", _LIH_StealthMeterS.GetValueInt())
		fiss.saveFloat("_LIH_CrosshairX", _LIH_CrosshairX.GetValue())
		fiss.saveFloat("_LIH_CrosshairY", _LIH_CrosshairY.GetValue())
		fiss.saveInt("_LIH_CrosshairS", _LIH_CrosshairS.GetValueInt())
		fiss.saveFloat("_LIH_SneakCrosshairX", _LIH_SneakCrosshairX.GetValue())
		fiss.saveFloat("_LIH_SneakCrosshairY", _LIH_SneakCrosshairY.GetValue())
		fiss.saveInt("_LIH_SneakCrosshairS", _LIH_SneakCrosshairS.GetValueInt())
		fiss.saveFloat("_LIH_EnchantLX", _LIH_EnchantLX.GetValue())
		fiss.saveFloat("_LIH_EnchantLY", _LIH_EnchantLY.GetValue())
		fiss.saveInt("_LIH_EnchantLS", _LIH_EnchantLS.GetValueInt())
		fiss.saveFloat("_LIH_EnchantRX", _LIH_EnchantRX.GetValue())
		fiss.saveFloat("_LIH_EnchantRY", _LIH_EnchantRY.GetValue())
		fiss.saveInt("_LIH_EnchantRS", _LIH_EnchantRS.GetValueInt())
		fiss.saveFloat("_LIH_HUDMsgX", _LIH_HUDMsgX.GetValue())
		fiss.saveFloat("_LIH_HUDMsgY", _LIH_HUDMsgY.GetValue())
		fiss.saveInt("_LIH_HUDMsgS", _LIH_HUDMsgS.GetValueInt())
		fiss.saveFloat("_LIH_LocationX", _LIH_LocationX.GetValue())
		fiss.saveFloat("_LIH_LocationY", _LIH_LocationY.GetValue())
		fiss.saveInt("_LIH_LocationS", _LIH_LocationS.GetValueInt())
		fiss.saveFloat("_LIH_ActivateButtonX", _LIH_ActivateButtonX.GetValue())
		fiss.saveFloat("_LIH_ActivateButtonY", _LIH_ActivateButtonY.GetValue())
		fiss.saveInt("_LIH_ActivateButtonS", _LIH_ActivateButtonS.GetValueInt())
		fiss.saveFloat("_LIH_NameX", _LIH_NameX.GetValue())
		fiss.saveFloat("_LIH_NameY", _LIH_NameY.GetValue())
		fiss.saveInt("_LIH_NameS", _LIH_NameS.GetValueInt())
		fiss.saveFloat("_LIH_GrayBarX", _LIH_GrayBarX.GetValue())
		fiss.saveFloat("_LIH_GrayBarY", _LIH_GrayBarY.GetValue())
		fiss.saveInt("_LIH_GrayBarS", _LIH_GrayBarS.GetValueInt())
		fiss.saveFloat("_LIH_InfoX", _LIH_InfoX.GetValue())
		fiss.saveFloat("_LIH_InfoY", _LIH_InfoY.GetValue())
		fiss.saveInt("_LIH_InfoS", _LIH_InfoS.GetValueInt())
		fiss.saveFloat("_LIH_SubtitleX", _LIH_SubtitleX.GetValue())
		fiss.saveFloat("_LIH_SubtitleY", _LIH_SubtitleY.GetValue())
		fiss.saveInt("_LIH_SubtitleS", _LIH_SubtitleS.GetValueInt())
		fiss.saveInt("_LIH_ItemLeadingAlpha", _LIH_ItemLeadingAlpha.GetValueInt())
		fiss.saveInt("_LIH_SubtitleLeadingAlpha", _LIH_SubtitleLeadingAlpha.GetValueInt())
		fiss.saveFloat("_LIH_FavorBackButtonX", _LIH_FavorBackButtonX.GetValue())
		fiss.saveFloat("_LIH_FavorBackButtonY", _LIH_FavorBackButtonY.GetValue())
		fiss.saveInt("_LIH_FavorBackButtonS", _LIH_FavorBackButtonS.GetValueInt())
		fiss.saveFloat("_LIH_LevelUpX", _LIH_LevelUpX.GetValue())
		fiss.saveFloat("_LIH_LevelUpY", _LIH_LevelUpY.GetValue())
		fiss.saveInt("_LIH_LevelUpS", _LIH_LevelUpS.GetValueInt())
		fiss.saveFloat("_LIH_ObjectivesX", _LIH_ObjectivesX.GetValue())
		fiss.saveFloat("_LIH_ObjectivesY", _LIH_ObjectivesY.GetValue())
		fiss.saveInt("_LIH_ObjectivesS", _LIH_ObjectivesS.GetValueInt())
		fiss.saveFloat("_LIH_ShoutsX", _LIH_ShoutsX.GetValue())
		fiss.saveFloat("_LIH_ShoutsY", _LIH_ShoutsY.GetValue())
		fiss.saveInt("_LIH_ShoutsS", _LIH_ShoutsS.GetValueInt())
		fiss.saveFloat("_LIH_AnimLetterX", _LIH_AnimLetterX.GetValue())
		fiss.saveFloat("_LIH_AnimLetterY", _LIH_AnimLetterY.GetValue())
		fiss.saveInt("_LIH_AnimLetterS", _LIH_AnimLetterS.GetValueInt())
		fiss.saveFloat("_LIH_ArrowsAlign", _LIH_ArrowsAlign.GetValue())
		fiss.saveFloat("_LIH_SubtitlesAlign", _LIH_SubtitlesAlign.GetValue())
		fiss.saveFloat("_LIH_LocationAlign", _LIH_LocationAlign.GetValue())
		fiss.saveInt("_LIH_HUDMsgAlign", _LIH_HUDMsgAlign.GetValueInt())
		fiss.saveInt("_LIH_InfoAlign", _LIH_InfoAlign.GetValueInt())
		string saveResult = fiss.endSave()
	endif

	_LIH_Reset.SetValueInt(0)
	_LIH_Load.SetValueInt(0)
endFunction


function ZoomIn()
	if _LIH_SelectedItem == "Magica"
		_LIH_MagickaS.SetValueInt(_LIH_MagickaS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_xscale", _LIH_MagickaS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_yscale", _LIH_MagickaS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Health"
		_LIH_HealthS.SetValueInt(_LIH_HealthS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_xscale", _LIH_HealthS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_yscale", _LIH_HealthS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_StaminaS.SetValueInt(_LIH_StaminaS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_xscale", _LIH_StaminaS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_yscale", _LIH_StaminaS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "CompassShoutMeterHolder"
		_LIH_CompassS.SetValueInt(_LIH_CompassS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_xscale", _LIH_CompassS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_yscale", _LIH_CompassS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "EnemyHealth_mc"
		_LIH_EnemyHealthS.SetValueInt(_LIH_EnemyHealthS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_xscale", _LIH_EnemyHealthS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_yscale", _LIH_EnemyHealthS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_ArrowsS.SetValueInt(_LIH_ArrowsS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_xscale", _LIH_ArrowsS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_yscale", _LIH_ArrowsS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "StealthMeterInstance"
		_LIH_StealthMeterS.SetValueInt(_LIH_StealthMeterS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_xscale", _LIH_StealthMeterS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_yscale", _LIH_StealthMeterS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Crosshair"
		_LIH_CrosshairS.SetValueInt(_LIH_CrosshairS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_xscale", _LIH_CrosshairS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_yscale", _LIH_CrosshairS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "SneakCrosshair"
		_LIH_SneakCrosshairS.SetValueInt(_LIH_SneakCrosshairS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_xscale", _LIH_SneakCrosshairS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_yscale", _LIH_SneakCrosshairS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_EnchantLS.SetValueInt(_LIH_EnchantLS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_xscale", _LIH_EnchantLS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_yscale", _LIH_EnchantLS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_EnchantRS.SetValueInt(_LIH_EnchantRS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_xscale", _LIH_EnchantRS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_yscale", _LIH_EnchantRS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_HUDMsgS.SetValueInt(_LIH_HUDMsgS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_xscale", _LIH_HUDMsgS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_yscale", _LIH_HUDMsgS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_LocationS.SetValueInt(_LIH_LocationS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_xscale", _LIH_LocationS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_yscale", _LIH_LocationS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ActivateButton_tf"
		_LIH_ActivateButtonS.SetValueInt(_LIH_ActivateButtonS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_xscale", _LIH_ActivateButtonS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_yscale", _LIH_ActivateButtonS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "RolloverNameInstance"
		_LIH_NameS.SetValueInt(_LIH_NameS.GetValueInt() + _LIH_Step.GetValueInt())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_xscale", _LIH_NameS.GetValueInt() as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_yscale", _LIH_NameS.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "GrayBarInstance"
		_LIH_GrayBarS.SetValue(_LIH_GrayBarS.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_xscale", _LIH_GrayBarS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_yscale", _LIH_GrayBarS.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_InfoS.SetValue(_LIH_InfoS.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_xscale", _LIH_InfoS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_yscale", _LIH_InfoS.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_SubtitleS.SetValue(_LIH_SubtitleS.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_xscale", _LIH_SubtitleS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_yscale", _LIH_SubtitleS.Getvalue())
	elseIf _LIH_SelectedItem == "ItemLeading"
		_LIH_ItemLeadingAlpha.SetValue(_LIH_ItemLeadingAlpha.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ItemLeading", "_alpha", _LIH_ItemLeadingAlpha.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleLeading"
		_LIH_SubtitleLeadingAlpha.SetValue(_LIH_SubtitleLeadingAlpha.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitleLeading", "_alpha", _LIH_SubtitleLeadingAlpha.Getvalue())
	elseIf _LIH_SelectedItem == "FavorBackButtonBase"
		_LIH_FavorBackButtonS.SetValue(_LIH_FavorBackButtonS.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_xscale", _LIH_FavorBackButtonS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_yscale", _LIH_FavorBackButtonS.Getvalue())
	elseIf _LIH_SelectedItem == "ObjectiveLineInstance"
		_LIH_ObjectivesS.SetValue(_LIH_ObjectivesS.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_xscale", _LIH_ObjectivesS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_yscale", _LIH_ObjectivesS.Getvalue())
	elseIf _LIH_SelectedItem == "ShoutAnimatedLetter"
		_LIH_ShoutsS.SetValue(_LIH_ShoutsS.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_xscale", _LIH_ShoutsS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_yscale", _LIH_ShoutsS.Getvalue())
	elseIf _LIH_SelectedItem == "AnimatedLetter_mc"
		_LIH_AnimLetterS.SetValue(_LIH_AnimLetterS.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_xscale", _LIH_AnimLetterS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_yscale", _LIH_AnimLetterS.Getvalue())
	elseIf _LIH_SelectedItem == "LevelMeterBaseInstance"
		_LIH_LevelUpS.SetValue(_LIH_LevelUpS.Getvalue() + _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_xscale", _LIH_LevelUpS.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_yscale", _LIH_LevelUpS.Getvalue())
	endIf
	UpdateItem()
endFunction


function ToggleHUD()
	if _LIH_Toggle.GetValueInt() > 0
		_LIH_Toggle.SetValueInt(0)
		_LIH_Selected.SetValueInt(0)
		if _LIH_DebugVisible.GetValueInt() == 1
			debug.Notification("Exiting HUD Edit Mode...")
		endIf
		show("_root.HUDDummy", 0 as Bool)
		show("_root.HUDDummy.guideLines_mc", 0 as Bool)
		show("_root.HUDDummy.ApplyChanges", 0 as Bool)
	else
		LoadDummy()
		_LIH_Toggle.SetValueInt(1)
		_LIH_Selected.SetValueInt(1)
		if _LIH_DebugVisible.GetValueInt() == 1
			debug.Notification("Entering HUD Edit Mode...")
		endIf
		show("_root.HUDDummy", 1 as Bool)
		show("_root.HUDDummy.guideLines_mc", 1 as Bool)
		show("_root.HUDDummy.ApplyChanges", 1 as Bool)
		CheckItem()
	endIf
endFunction


function PreviousItem()
	_LIH_Selected.SetValueInt(_LIH_Selected.GetValueInt() - 1)
	if _LIH_Selected.GetValueInt() == 0
		_LIH_Selected.SetValueInt(25)
	endIf
	CheckItem()
endFunction


function CheckItem()
	if _LIH_Selected.GetValueInt() == 0
		_LIH_SelectedItem = "None"
		_LIH_SelectedDesc = "None"
	elseIf _LIH_Selected.GetValueInt() == 1
		_LIH_SelectedItem = "Magica"
		_LIH_SelectedDesc = "Magicka Bar"
	elseIf _LIH_Selected.GetValueInt() == 2
		_LIH_SelectedItem = "Health"
		_LIH_SelectedDesc = "Health Bar"
	elseIf _LIH_Selected.GetValueInt() == 3
		_LIH_SelectedItem = "Stamina"
		_LIH_SelectedDesc = "Stamina Bar"
	elseIf _LIH_Selected.GetValueInt() == 4
		_LIH_SelectedItem = "CompassShoutMeterHolder"
		_LIH_SelectedDesc = "Compass"
	elseIf _LIH_Selected.GetValueInt() == 5
		_LIH_SelectedItem = "EnemyHealth_mc"
		_LIH_SelectedDesc = "Enemy Health"
	elseIf _LIH_Selected.GetValueInt() == 6
		_LIH_SelectedItem = "ArrowInfoInstance"
		_LIH_SelectedDesc = "Arrows"
	elseIf _LIH_Selected.GetValueInt() == 7
		_LIH_SelectedItem = "StealthMeterInstance"
		_LIH_SelectedDesc = "Stealth Meter"
	elseIf _LIH_Selected.GetValueInt() == 8
		_LIH_SelectedItem = "Crosshair"
		_LIH_SelectedDesc = "Crosshair"
	elseIf _LIH_Selected.GetValueInt() == 9
		_LIH_SelectedItem = "SneakCrosshair"
		_LIH_SelectedDesc = "Sneak Crosshair"
	elseIf _LIH_Selected.GetValueInt() == 10
		_LIH_SelectedItem = "BottomLeftLockInstance"
		_LIH_SelectedDesc = "Enchantment Bar (Left)"
	elseIf _LIH_Selected.GetValueInt() == 11
		_LIH_SelectedItem = "BottomRightLockInstance"
		_LIH_SelectedDesc = "Enchantment Bar (Right)"
	elseIf _LIH_Selected.GetValueInt() == 12
		_LIH_SelectedItem = "MessagesBlock"
		_LIH_SelectedDesc = "HUD Messages"
	elseIf _LIH_Selected.GetValueInt() == 13
		_LIH_SelectedItem = "LocationLockBase"
		_LIH_SelectedDesc = "Location Text"
	elseIf _LIH_Selected.GetValueInt() == 14
		_LIH_SelectedItem = "ActivateButton_tf"
		_LIH_SelectedDesc = "Activate Button"
	elseIf _LIH_Selected.GetValueInt() == 15
		_LIH_SelectedItem = "RolloverNameInstance"
		_LIH_SelectedDesc = "Item/NPC Name"
	elseIf _LIH_Selected.GetValueInt() == 16
		_LIH_SelectedItem = "ItemLeading"
		_LIH_SelectedDesc = "Item/NPC Name Text Linespacing"
	elseIf _LIH_Selected.GetValueInt() == 17
		_LIH_SelectedItem = "GrayBarInstance"
		_LIH_SelectedDesc = "Item Info Separator"
	elseIf _LIH_Selected.GetValueInt() == 18
		_LIH_SelectedItem = "RolloverInfoInstance"
		_LIH_SelectedDesc = "Item Info Text"
	elseIf _LIH_Selected.GetValueInt() == 19
		_LIH_SelectedItem = "SubtitleTextHolder"
		_LIH_SelectedDesc = "Text Subtitles"
	elseIf _LIH_Selected.GetValueInt() == 20
		_LIH_SelectedItem = "SubtitleLeading"
		_LIH_SelectedDesc = "Text Subtitles Linespacing"
	elseIf _LIH_Selected.GetValueInt() == 21
		_LIH_SelectedItem = "FavorBackButtonBase"
		_LIH_SelectedDesc = "Followers Back Button"
	elseIf _LIH_Selected.GetValueInt() == 22
		_LIH_SelectedItem = "ObjectiveLineInstance"
		_LIH_SelectedDesc = "Quest Objectives Text"
	elseIf _LIH_Selected.GetValueInt() == 23
		_LIH_SelectedItem = "ShoutAnimatedLetter"
		_LIH_SelectedDesc = "New Shout Learned Text"
	elseIf _LIH_Selected.GetValueInt() == 24
		_LIH_SelectedItem = "AnimatedLetter_mc"
		_LIH_SelectedDesc = "Skill Level Up Text"
	elseIf _LIH_Selected.GetValueInt() == 25
		_LIH_SelectedItem = "LevelMeterBaseInstance"
		_LIH_SelectedDesc = "Level Up Progress Meter"
	endIf
	if _LIH_DebugVisible.GetValueInt() == 1
		debug.Notification("Selected Item: " + _LIH_SelectedDesc)
	endIf
	UpdateItem()
endFunction


function ApplyChanges()
	LoadDummy()
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomLeftLockInstance", "_alpha", _LIH_EnchantmentAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BottomRightLockInstance", "_alpha", _LIH_EnchantmentAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.Crosshair", "_alpha", _LIH_CrosshairAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_alpha", _LIH_SneakCrosshairAlpha.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SneakCrosshair", "_visible", _LIH_SneakCrosshairVisible.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.AltHealthBar", "_visible", _LIH_AltHealthBarVisible.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.BarsAlwaysVisible", "_visible", _LIH_BarsAlwaysVisible.GetValueInt() as Float)
	LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ApplyChanges", "_visible", 1 as Float)
	if _LIH_Selected.GetValueInt() == 0
		show("_root.HUDDummy", 0 as Bool)
	else
		show("_root.HUDDummy", 1 as Bool)
	endIf
	if _LIH_SlimCompassVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder.Compass.CompassFrameAlt", "_visible", 1 as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder.Compass.CompassFrame", "_visible", 0 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder.Compass.CompassFrameAlt", "_visible", 0 as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder.Compass.CompassFrame", "_visible", 1 as Float)
	endIf
	if _LIH_ActivateButtonVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActButton", "_visible", 1 as Float)
		if _LIH_ActivateButtonS.GetValueInt() == 0
			_LIH_ActivateButtonX.SetValue(_LIH_DefActivateButtonX.Getvalue())
			_LIH_ActivateButtonY.SetValue(_LIH_DefActivateButtonY.Getvalue())
			_LIH_ActivateButtonS.SetValueInt(100)
		endIf
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActButton", "_visible", 0 as Float)
		_LIH_ActivateButtonS.SetValueInt(0)
	endIf
	if _LIH_UndiscoveredMarkersVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.UndiscoveredMarkers", "_visible", 1 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.UndiscoveredMarkers", "_visible", 0 as Float)
	endIf
	if _LIH_LocationMarkersVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationMarkers", "_visible", 1 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationMarkers", "_visible", 0 as Float)
	endIf
	if _LIH_EnemyMarkersVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyMarkers", "_visible", 1 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.EnemyMarkers", "_visible", 0 as Float)
	endIf
	if _LIH_PlayerSetMarkerVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.PlayerSetMarker", "_visible", 1 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.PlayerSetMarker", "_visible", 0 as Float)
	endIf
	if _LIH_QuestDoorMarkersVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestDoorMarkers", "_visible", 1 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestDoorMarkers", "_visible", 0 as Float)
	endIf
	if _LIH_QuestMarkersVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestMarkers", "_visible", 1 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.QuestMarkers", "_visible", 0 as Float)
	endIf
	if _LIH_AltCrosshairVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.AltCrosshair", "_visible", 1 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.AltCrosshair", "_visible", 0 as Float)
	endIf
	if _LIH_AltSneakMeterVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance.SneakAnimInstanceAlt", "_visible", 1 as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance.SneakAnimInstance", "_visible", 0 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance.SneakAnimInstanceAlt", "_visible", 0 as Float)
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance.SneakAnimInstance", "_visible", 1 as Float)
	endIf
	if _LIH_SneakTextVisible.GetValueInt() == 1
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance.SneakTextHolder", "_visible", 1 as Float)
	else
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance.SneakTextHolder", "_visible", 0 as Float)
	endIf
endFunction


function MoveUp()
	if _LIH_SelectedItem == "Magica"
		_LIH_MagickaY.SetValue(_LIH_MagickaY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_y", _LIH_MagickaY.Getvalue())
	elseIf _LIH_SelectedItem == "Health"
		_LIH_HealthY.SetValue(_LIH_HealthY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_y", _LIH_HealthY.Getvalue())
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_StaminaY.SetValue(_LIH_StaminaY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_y", _LIH_StaminaY.Getvalue())
	elseIf _LIH_SelectedItem == "CompassShoutMeterHolder"
		_LIH_CompassY.SetValue(_LIH_CompassY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_y", _LIH_CompassY.Getvalue())
	elseIf _LIH_SelectedItem == "EnemyHealth_mc"
		_LIH_EnemyHealthY.SetValue(_LIH_EnemyHealthY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_y", _LIH_EnemyHealthY.Getvalue())
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_ArrowsY.SetValue(_LIH_ArrowsY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_y", _LIH_ArrowsY.Getvalue())
	elseIf _LIH_SelectedItem == "StealthMeterInstance"
		_LIH_StealthMeterY.SetValue(_LIH_StealthMeterY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_y", _LIH_StealthMeterY.Getvalue())
	elseIf _LIH_SelectedItem == "Crosshair"
		_LIH_CrosshairY.SetValue(_LIH_CrosshairY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_y", _LIH_CrosshairY.Getvalue())
	elseIf _LIH_SelectedItem == "SneakCrosshair"
		_LIH_SneakCrosshairY.SetValue(_LIH_SneakCrosshairY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_y", _LIH_SneakCrosshairY.Getvalue())
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_EnchantLY.SetValue(_LIH_EnchantLY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_y", _LIH_EnchantLY.Getvalue())
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_EnchantRY.SetValue(_LIH_EnchantRY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_y", _LIH_EnchantRY.Getvalue())
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_HUDMsgY.SetValue(_LIH_HUDMsgY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_y", _LIH_HUDMsgY.Getvalue())
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_LocationY.SetValue(_LIH_LocationY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_y", _LIH_LocationY.Getvalue())
	elseIf _LIH_SelectedItem == "ActivateButton_tf"
		_LIH_ActivateButtonY.SetValue(_LIH_ActivateButtonY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_y", _LIH_ActivateButtonY.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverNameInstance"
		_LIH_NameY.SetValue(_LIH_NameY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_y", _LIH_NameY.Getvalue())
	elseIf _LIH_SelectedItem == "GrayBarInstance"
		_LIH_GrayBarY.SetValue(_LIH_GrayBarY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_y", _LIH_GrayBarY.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_InfoY.SetValue(_LIH_InfoY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_y", _LIH_InfoY.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_SubtitleY.SetValue(_LIH_SubtitleY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_y", _LIH_SubtitleY.Getvalue())
	elseIf _LIH_SelectedItem == "ItemLeading"
		
	elseIf _LIH_SelectedItem == "SubtitleLeading"
		
	elseIf _LIH_SelectedItem == "FavorBackButtonBase"
		_LIH_FavorBackButtonY.SetValue(_LIH_FavorBackButtonY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_x", _LIH_FavorBackButtonY.Getvalue())
	elseIf _LIH_SelectedItem == "ObjectiveLineInstance"
		_LIH_ObjectivesY.SetValue(_LIH_ObjectivesY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_y", _LIH_ObjectivesY.Getvalue())
	elseIf _LIH_SelectedItem == "ShoutAnimatedLetter"
		_LIH_ShoutsY.SetValue(_LIH_ShoutsY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_y", _LIH_ShoutsY.Getvalue())
	elseIf _LIH_SelectedItem == "AnimatedLetter_mc"
		_LIH_AnimLetterY.SetValue(_LIH_AnimLetterY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_y", _LIH_AnimLetterY.Getvalue())
	elseIf _LIH_SelectedItem == "LevelMeterBaseInstance"
		_LIH_LevelUpY.SetValue(_LIH_LevelUpY.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_y", _LIH_LevelUpY.Getvalue())
	endIf
	UpdateItem()
endFunction


function ToggleStep()
	if _LIH_Step.Getvalue() == 1.00000
		_LIH_Step.SetValue(10.0000)
	elseIf _LIH_Step.Getvalue() == 10.0000
		_LIH_Step.SetValue(0.500000)
	else
		_LIH_Step.SetValue(1.00000)
	endIf
	UpdateItem()
endFunction


function ShowAlign()
	if _LIH_RotateItem == 0
		_LIH_AlignItem = "(Left)"
	elseIf _LIH_RotateItem == 50
		_LIH_AlignItem = "(Center)"
	else
		_LIH_AlignItem = "(Right)"
	endIf
endFunction


function NextItem()
	_LIH_Selected.SetValueInt(_LIH_Selected.GetValueInt() + 1)
	if _LIH_Selected.GetValueInt() == 26
		_LIH_Selected.SetValueInt(1)
	endIf
	CheckItem()
endFunction


function RotateAlign()
	if _LIH_SelectedItem == "Magica"
		_LIH_MagickaR.SetValueInt(_LIH_MagickaR.GetValueInt() + _LIH_Step.GetValueInt())
		if _LIH_MagickaR.GetValueInt() == 360
			_LIH_MagickaR.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_rotation", _LIH_MagickaR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Health"
		_LIH_HealthR.SetValueInt(_LIH_HealthR.GetValueInt() + _LIH_Step.GetValueInt())
		if _LIH_HealthR.GetValueInt() == 360
			_LIH_HealthR.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_rotation", _LIH_HealthR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_StaminaR.SetValueInt(_LIH_StaminaR.GetValueInt() + _LIH_Step.GetValueInt())
		if _LIH_StaminaR.GetValueInt() == 360
			_LIH_StaminaR.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_rotation", _LIH_StaminaR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_ArrowsAlign.SetValueInt(_LIH_ArrowsAlign.GetValueInt() + 50)
		if _LIH_ArrowsAlign.GetValueInt() == 150
			_LIH_ArrowsAlign.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.ArrowsAlign", "_alpha", _LIH_ArrowsAlign.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_EnchantLR.SetValueInt(_LIH_EnchantLR.GetValueInt() + _LIH_Step.GetValueInt())
		if _LIH_EnchantLR.GetValueInt() == 360
			_LIH_EnchantLR.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_rotation", _LIH_EnchantLR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_EnchantRR.SetValueInt(_LIH_EnchantRR.GetValueInt() + _LIH_Step.GetValueInt())
		if _LIH_EnchantRR.GetValueInt() == 360
			_LIH_EnchantRR.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_rotation", _LIH_EnchantRR.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_HUDMsgAlign.SetValueInt(_LIH_HUDMsgAlign.GetValueInt() + 50)
		if _LIH_HUDMsgAlign.GetValueInt() == 150
			_LIH_HUDMsgAlign.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.HUDMsgAlign", "_alpha", _LIH_HUDMsgAlign.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_LocationAlign.SetValueInt(_LIH_LocationAlign.GetValueInt() + 50)
		if _LIH_LocationAlign.GetValueInt() == 150
			_LIH_LocationAlign.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.LocationAlign", "_alpha", _LIH_LocationAlign.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_InfoAlign.SetValueInt(_LIH_InfoAlign.GetValueInt() + 50)
		if _LIH_InfoAlign.GetValueInt() == 150
			_LIH_InfoAlign.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.InfoAlign", "_alpha", _LIH_InfoAlign.GetValueInt() as Float)
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_SubtitlesAlign.SetValueInt(_LIH_SubtitlesAlign.GetValueInt() + 50)
		if _LIH_SubtitlesAlign.GetValueInt() == 150
			_LIH_SubtitlesAlign.SetValueInt(0)
		endIf
		LIH_ConfigMenu.setHUDNumber("_root.HUDDummy.SubtitlesAlign", "_alpha", _LIH_SubtitlesAlign.Getvalue())
	endIf
	UpdateItem()
endFunction


function MoveLeft()
	if _LIH_SelectedItem == "Magica"
		_LIH_MagickaX.SetValue(_LIH_MagickaX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Magica", "_x", _LIH_MagickaX.Getvalue())
	elseIf _LIH_SelectedItem == "Health"
		_LIH_HealthX.SetValue(_LIH_HealthX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Health", "_x", _LIH_HealthX.Getvalue())
	elseIf _LIH_SelectedItem == "Stamina"
		_LIH_StaminaX.SetValue(_LIH_StaminaX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Stamina", "_x", _LIH_StaminaX.Getvalue())
	elseIf _LIH_SelectedItem == "CompassShoutMeterHolder"
		_LIH_CompassX.SetValue(_LIH_CompassX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.CompassShoutMeterHolder", "_x", _LIH_CompassX.Getvalue())
	elseIf _LIH_SelectedItem == "EnemyHealth_mc"
		_LIH_EnemyHealthX.SetValue(_LIH_EnemyHealthX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.EnemyHealth_mc", "_x", _LIH_EnemyHealthX.Getvalue())
	elseIf _LIH_SelectedItem == "ArrowInfoInstance"
		_LIH_ArrowsX.SetValue(_LIH_ArrowsX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ArrowInfoInstance", "_x", _LIH_ArrowsX.Getvalue())
	elseIf _LIH_SelectedItem == "StealthMeterInstance"
		_LIH_StealthMeterX.SetValue(_LIH_StealthMeterX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.StealthMeterInstance", "_x", _LIH_StealthMeterX.Getvalue())
	elseIf _LIH_SelectedItem == "Crosshair"
		_LIH_CrosshairX.SetValue(_LIH_CrosshairX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.Crosshair", "_x", _LIH_CrosshairX.Getvalue())
	elseIf _LIH_SelectedItem == "SneakCrosshair"
		_LIH_SneakCrosshairX.SetValue(_LIH_SneakCrosshairX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SneakCrosshair", "_x", _LIH_SneakCrosshairX.Getvalue())
	elseIf _LIH_SelectedItem == "BottomLeftLockInstance"
		_LIH_EnchantLX.SetValue(_LIH_EnchantLX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomLeftLockInstance", "_x", _LIH_EnchantLX.Getvalue())
	elseIf _LIH_SelectedItem == "BottomRightLockInstance"
		_LIH_EnchantRX.SetValue(_LIH_EnchantRX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.BottomRightLockInstance", "_x", _LIH_EnchantRX.Getvalue())
	elseIf _LIH_SelectedItem == "MessagesBlock"
		_LIH_HUDMsgX.SetValue(_LIH_HUDMsgX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.MessagesBlock", "_x", _LIH_HUDMsgX.Getvalue())
	elseIf _LIH_SelectedItem == "LocationLockBase"
		_LIH_LocationX.SetValue(_LIH_LocationX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.LocationLockBase", "_x", _LIH_LocationX.Getvalue())
	elseIf _LIH_SelectedItem == "ActivateButton_tf"
		_LIH_ActivateButtonX.SetValue(_LIH_ActivateButtonX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.ActivateButton_tf", "_x", _LIH_ActivateButtonX.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverNameInstance"
		_LIH_NameX.SetValue(_LIH_NameX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverNameInstance", "_x", _LIH_NameX.Getvalue())
	elseIf _LIH_SelectedItem == "GrayBarInstance"
		_LIH_GrayBarX.SetValue(_LIH_GrayBarX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.GrayBarInstance", "_x", _LIH_GrayBarX.Getvalue())
	elseIf _LIH_SelectedItem == "RolloverInfoInstance"
		_LIH_InfoX.SetValue(_LIH_InfoX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.RolloverInfoInstance", "_x", _LIH_InfoX.Getvalue())
	elseIf _LIH_SelectedItem == "SubtitleTextHolder"
		_LIH_SubtitleX.SetValue(_LIH_SubtitleX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.SubtitleTextHolder", "_x", _LIH_SubtitleX.Getvalue())
	elseIf _LIH_SelectedItem == "ItemLeading"
		
	elseIf _LIH_SelectedItem == "SubtitleLeading"
		
	elseIf _LIH_SelectedItem == "FavorBackButtonBase"
		_LIH_FavorBackButtonX.SetValue(_LIH_FavorBackButtonX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.FavorBackButtonBase", "_x", _LIH_FavorBackButtonX.Getvalue())
	elseIf _LIH_SelectedItem == "ObjectiveLineInstance"
		_LIH_ObjectivesX.SetValue(_LIH_ObjectivesX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ObjectiveLineInstance", "_x", _LIH_ObjectivesX.Getvalue())
	elseIf _LIH_SelectedItem == "ShoutAnimatedLetter"
		_LIH_ShoutsX.SetValue(_LIH_ShoutsX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShoutAnimatedLetter", "_x", _LIH_ShoutsX.Getvalue())
	elseIf _LIH_SelectedItem == "AnimatedLetter_mc"
		_LIH_AnimLetterX.SetValue(_LIH_AnimLetterX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.AnimatedLetter_mc", "_x", _LIH_AnimLetterX.Getvalue())
	elseIf _LIH_SelectedItem == "LevelMeterBaseInstance"
		_LIH_LevelUpX.SetValue(_LIH_LevelUpX.Getvalue() - _LIH_Step.Getvalue())
		LIH_ConfigMenu.setHUDNumber("_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.LevelMeterBaseInstance", "_x", _LIH_LevelUpX.Getvalue())
	endIf
	UpdateItem()
endFunction


function toggle(globalvariable value)
	if value.GetValueInt() == 0
		value.SetValueInt(1)
	else
		value.SetValueInt(0)
	endIf
endFunction

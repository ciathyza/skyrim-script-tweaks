Scriptname EWM_Config extends SKI_ConfigBase

Import EasyWheelAPI


Int[] HandlerPlugins_OIDs
Int[] HandlerEnabler_OIDs
Int[] WheelConfig_OIDs


Event OnConfigInit()
    Pages = new string[3]
    Pages[0] = "$UIWHEEL_GENERAL"
    Pages[1] = "$UIWHEEL_AVAILABLE_FCT"
    Pages[2] = "$UIWHEEL_CONFIG"
EndEvent


Event OnPageReset(string page)
	If (page == "")
		; Nothing here!
	ElseIf (page == "$UIWHEEL_GENERAL")
        ResetGeneralPage()
    elseIf (page == "$UIWHEEL_AVAILABLE_FCT")
    	ResetFctListPage()
    ElseIf (page == "$UIWHEEL_CONFIG")
    	ResetConfigurationPage()
    endIf
EndEvent


Function ResetGeneralPage()
	SetCursorFillMode(TOP_TO_BOTTOM)
	SetCursorPosition(0)
    AddHeaderOption("$UIWHEEL_CONFIG")
	AddToggleOptionST("ConfigHideSpellsState", "$UIWHEEL_HIDESPELLS", GetAPI()._bhideSpells)
	AddEmptyOption()
	AddToggleOptionST("ConfigShowPlayerStatsState", "$UIWHEEL_SHOWPLAYERSTATS", GetAPI()._bShowPlayerStats)
	AddToggleOptionST("ConfigShowHandlerStatusState", "$UIWHEEL_SHOWHANDLERSTATUS", GetAPI()._bShowHandlerStatus)
    SetCursorPosition(1)
    AddHeaderOption("$UIWHEEL_MODE")
    Bool isInSwapMode = false
    int swapModeFlag = OPTION_FLAG_DISABLED
    if GetInputState() == "WheelSwaps"
    	isInSwapMode = true
    	swapModeFlag = OPTION_FLAG_NONE
    endif
    AddToggleOptionST("ConfigModeState", "$UIWHEEL_USESWAP", isInSwapMode)
    AddKeyMapOptionST("ConfigKeycodeSwapShowState", "$UIWHEEL_SWAPSHOW", KeycodeSwap("Show"), swapModeFlag)
    AddKeyMapOptionST("ConfigKeycodeSwapNextState", "$UIWHEEL_SWAPNEXT", KeycodeSwap("Next"), swapModeFlag)
    AddKeyMapOptionST("ConfigKeycodeSwapPrevState", "$UIWHEEL_SWAPPREV", KeycodeSwap("Prev"), swapModeFlag)
EndFunction


Function ResetFctListPage()
	Int numHandlers = GetHandlersCount()
	HandlerPlugins_OIDs = Utility.CreateIntArray(numHandlers, 0)
	HandlerEnabler_OIDs = Utility.CreateIntArray(numHandlers, 0)
	SetCursorFillMode(TOP_TO_BOTTOM)
	SetCursorPosition(0)
	AddHeaderOption("$UIWHEEL_LOADEDMODS")
	int k = numHandlers
	while k > 0
		k -= 1
		EWM_HandleModBase currentHandler = GetHandler(k)
		HandlerPlugins_OIDs[k] = AddMenuOption(currentHandler.PluginName, currentHandler.GetFctRatio(), currentHandler.isManuallyDisabledFlag)
	endwhile
	SetCursorPosition(1)
	AddHeaderOption("$UIWHEEL_SHOWHIDE_FCT")
	k = numHandlers
	while k > 0
		k -= 1
		HandlerEnabler_OIDs[k] = AddToggleOption("$UIWHEEL_HIDE_HANDLER_FCT", GetHandler(k).isManuallyDisabled)
	endwhile
EndFunction


Function ResetConfigurationPage()
	RefreshFunctions()
	SetCursorFillMode(TOP_TO_BOTTOM)
	String[] zeLayout = GetCurrentLayout()
	WheelConfig_OIDs = new Int[8]
	SetCursorPosition(0)
    AddHeaderOption("$UIWHEEL_WHEELCONFIG")
	int i = 0
	while i < 8
		WheelConfig_OIDs[i] = AddMenuOption(i + 1, "$"+zeLayout[i])
		i += 1
	endwhile
	Bool isInSwapMode = false
	int swapModeFlag = OPTION_FLAG_NONE
    if GetInputState() == "WheelSwaps"
    	isInSwapMode = true
    	swapModeFlag = OPTION_FLAG_DISABLED
    endif
    SetCursorPosition(1)
    Int currentIndex = GetCurrentIndex()
    AddMenuOptionST("SelectWheelToConfigure", "$UIWHEEL_CURRENTCONFIG", currentIndex)
    AddEmptyOption()
    AddKeyMapOptionST("SetCurrentWheelKeycode", "$UIWHEEL_KEYCODECONFIG", GetKeycodeWheel(currentIndex), swapModeFlag)
EndFunction


State ConfigHideSpellsState
	event OnSelectST()
        SetToggleOptionValueST(ChangeSpellsVisibility())
    endEvent
    event OnHighlightST()
        SetInfoText("$UIWHEEL_DESC_HIDESPELLS")
    endEvent
EndState


State ConfigShowPlayerStatsState
	event OnSelectST()
        SetToggleOptionValueST(ChangeShowPlayerStats())
    endEvent
    event OnHighlightST()
        SetInfoText("$UIWHEEL_DESC_SHOWPLAYERSTATS")
    endEvent
EndState


State ConfigShowHandlerStatusState
	event OnSelectST()
        SetToggleOptionValueST(ChangeShowHandlerStatus())
    endEvent
    event OnHighlightST()
        SetInfoText("$UIWHEEL_DESC_SHOWHANDLERSTATUS")
    endEvent
EndState


State SelectWheelToConfigure
	Event OnMenuOpenST()
		SetMenuDialogStartIndex(GetCurrentIndex() - 1)
        SetMenuDialogDefaultIndex(0)
        SetMenuDialogOptions(GetWheels())
	EndEvent
	Event OnMenuAcceptST(int index)
		SetCurrentIndex(index + 1)
        SetMenuOptionValueST(index + 1)
        ForcePageReset()
	EndEvent
	Event OnDefaultST()
		SetCurrentIndex(1)
        SetMenuOptionValueST(1)
        ForcePageReset()
	EndEvent
	Event OnHighlightST()
		SetInfoText("$UIWHEEL_DESC_SELECTWHEEL")
	EndEvent
EndState


State SetCurrentWheelKeycode
	Event OnKeyMapChangeST(int a_keyCode, string a_conflictControl, string a_conflictName)
    	SetKeycodeWheel(GetCurrentIndex(), a_keyCode)
    	SetKeyMapOptionValueST(a_keyCode)
    EndEvent
    event OnDefaultST()
    	SetKeycodeWheel(GetCurrentIndex(), 0)
    	SetKeyMapOptionValueST(0)
    endEvent
    event OnHighlightST()
        SetInfoText("$UIWHEEL_DESC_WHEELKEYCODE")
    endEvent
EndState


State ConfigModeState
	event OnSelectST()
		Bool isInSwapMode = false
		if GetInputState() == "WheelSwaps"
			SetInputState("WheelPerKey")
			isInSwapMode = false
		elseIf GetInputState() == "WheelPerKey"
			SetInputState("WheelSwaps")
			isInSwapMode = true
		endif
        SetToggleOptionValueST(isInSwapMode)
        ForcePageReset()
    endEvent
    event OnDefaultST()
    	SetInputState("WheelPerKey")
        SetTextOptionValueST(false)
        ForcePageReset()
    endEvent
    event OnHighlightST()
        SetInfoText("$UIWHEEL_DESC_ENABLESWAP")
    endEvent
EndState


State ConfigKeycodeSwapShowState
    Event OnKeyMapChangeST(int a_keyCode, string a_conflictControl, string a_conflictName)
    	SetKeycodeSwap("Show", a_keyCode)
    	SetKeyMapOptionValueST(a_keyCode)
    EndEvent
    event OnDefaultST()
    	SetKeycodeSwap("Show", 0)
    	SetKeyMapOptionValueST(0)
    endEvent
    event OnHighlightST()
        SetInfoText("$UIWHEEL_DESC_SHOWSWAP")
    endEvent
EndState


State ConfigKeycodeSwapNextState
	Event OnKeyMapChangeST(int a_keyCode, string a_conflictControl, string a_conflictName)
		SetKeycodeSwap("Next", a_keyCode)
    	SetKeyMapOptionValueST(a_keyCode)
    EndEvent
    event OnDefaultST()
    	SetKeycodeSwap("Next", 0)
		SetKeyMapOptionValueST(0)
    endEvent
    event OnHighlightST()
        SetInfoText("$UIWHEEL_DESC_NEXTSWAP")
    endEvent
EndState


State ConfigKeycodeSwapPrevState
	Event OnKeyMapChangeST(int a_keyCode, string a_conflictControl, string a_conflictName)
		SetKeycodeSwap("Prev", a_keyCode)
    	SetKeyMapOptionValueST(a_keyCode)
    EndEvent
    event OnDefaultST()
    	SetKeycodeSwap("Prev", 0)
    	SetKeyMapOptionValueST(0)
    endEvent
    event OnHighlightST()
        SetInfoText("$UIWHEEL_DESC_PREVSWAP")
    endEvent
EndState


Event OnOptionSelect(int option)
	If (CurrentPage == "$UIWHEEL_AVAILABLE_FCT")
		EnableDisableToggle(option)
	endIf
EndEvent


Function EnableDisableToggle(int option)
	Int handlerIndex = HandlerEnabler_OIDs.Find(option)
	If handlerIndex >= 0
		EWM_HandleModBase localCurrentHandler = GetHandler(handlerIndex)
		localCurrentHandler.isManuallyDisabled = !localCurrentHandler.isManuallyDisabled
		int disabledFlag = OPTION_FLAG_NONE
		if localCurrentHandler.isManuallyDisabled
			disabledFlag = OPTION_FLAG_DISABLED
		endIf
		SetOptionFlags(HandlerPlugins_OIDs[handlerIndex], disabledFlag)
		SetToggleOptionValue(HandlerEnabler_OIDs[handlerIndex], localCurrentHandler.isManuallyDisabled)
	EndIf
EndFunction


Event OnOptionMenuOpen(int option)
	if (CurrentPage == "$UIWHEEL_AVAILABLE_FCT")
		OnOptionMenuOpen_FctList(option)
	ElseIf (currentPage == "$UIWHEEL_CONFIG")
		OnOptionMenuOpen_Config(option)
	EndIf
EndEvent


Function OnOptionMenuOpen_FctList(Int option)
	Int handlerIndex = HandlerPlugins_OIDs.Find(option)
	If handlerIndex >= 0
		SetMenuDialogOptions(GetHandler(handlerIndex).FunctionsForMenu)
	EndIf
EndFunction


Function OnOptionMenuOpen_Config(Int option)
	Int layoutIndex = WheelConfig_OIDs.Find(option)
	If layoutIndex >= 0
		String[] currentOptions = GetVisibleFunctions()
		int startIndex = currentOptions.Find("$"+GetCurrentLayout()[layoutIndex])
		if startIndex < 0
			startIndex = 0
		endif
		SetMenuDialogStartIndex(startIndex)
		SetMenuDialogOptions(currentOptions)
		SetMenuDialogDefaultIndex(0)
	EndIf
EndFunction


Event OnOptionMenuAccept (int option, int index)
	Int layoutIndex = WheelConfig_OIDs.Find(option)
	If layoutIndex >= 0
		if index < 0
			GetCurrentLayout()[layoutIndex] = "EMPTY"
			SetMenuOptionValue(WheelConfig_OIDs[layoutIndex], "$EMPTY")
		else
			String[] currentOptions = GetVisibleFunctions()
			GetCurrentLayout()[layoutIndex] = StringUtil.Substring(currentOptions[index], 1)
			SetMenuOptionValue(WheelConfig_OIDs[layoutIndex], currentOptions[index])
		endif
	endif
EndEvent


Event OnOptionDefault (int option)
	Int layoutIndex = WheelConfig_OIDs.Find(option)
	If layoutIndex >= 0
		GetCurrentLayout()[layoutIndex] = "EMPTY"
		SetMenuOptionValue(WheelConfig_OIDs[layoutIndex], "$EMPTY")
	EndIf
EndEvent


Event OnOptionHighlight(int option)
	if WheelConfig_OIDs.Find(option) >= 0
		SetInfoText("$UIWHEEL_WHEELCONFIG_DESC")
	elseIf HandlerPlugins_OIDs.Find(option) >= 0
		SetInfoText("$UIWHEEL_HANDLERPLUGIN_DESC")
	elseif HandlerEnabler_OIDs.Find(option) >= 0
		SetInfoText("$UIWHEEL_HANDLERENABLER_DESC")
	endif
EndEvent


Event OnConfigClose()
	RefreshKeyCodes()
	Parent.OnConfigClose()
EndEvent

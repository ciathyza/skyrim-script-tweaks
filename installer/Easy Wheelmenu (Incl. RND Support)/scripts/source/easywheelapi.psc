scriptname EasyWheelAPI hidden

Import Debug
Import EWM_Util


_EasyWheelAPI Function GetAPI() Global
	return (Game.GetFormFromFile(0x00000d62, "EasyWheel.esp") as Quest) as _EasyWheelAPI
EndFunction


function EnableWheelMenuAPI(Bool isEnabled = true) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("Serious shit happened")
	endif
	int timer = 0
	while !EWMAPI._isInitialized && timer <= 10
		Utility.Wait(0.2)
		timer += 1
	endwhile
	if timer >= 10
		RaiseEWMAPIError("Easywheel couldn't initialize itself within the 20s limit")
		return
	endif
	EWMAPI._isAvailable = isEnabled
endfunction


Function RaiseEWMAPIError(String ErrorMessage = "", Int severity = 0) Global
	Trace("[EasyWheel] Error : "+ ErrorMessage)
EndFunction


;---------------------------------------------------------------------------------------------------------------
;	FUNCTIONS MANAGER
;---------------------------------------------------------------------------------------------------------------

String[] Function GetFunctions() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return None
	endif
	return EWMAPI.EWM_FCT_ALL
EndFunction


String[] Function GetVisibleFunctions() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return None
	endif
	return EWMAPI._GetVisibleFunctions()
EndFunction


Int Function GetFunctionsCount() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return 0
	endif
	return EWMAPI._GetFunctionsCount()
EndFunction


String[] Function GetUserSelection() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	return EWMAPI.EWM_USER_SELECTION
EndFunction


Function AddFunctions(String[] functions) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
	endif
	EWMAPI._AddFunctions(functions)
EndFunction


Function RemoveFunctions(String[] functions) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
	endif
	EWMAPI._RemoveFunctions(functions)
EndFunction


Function AddFunction(String aFunction) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
	endif
	EWMAPI._AddFunction(aFunction)
EndFunction


Function RemoveFunction(String aFunction) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
	endif
	EWMAPI._RemoveFunction(aFunction)
EndFunction


String Function GetFunction(Int index) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	return EWMAPI.EWM_FCT_ALL[index]
EndFunction


Function RefreshFunctions() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	EWMAPI.EWM_FCT_ALL = new String[128]
	int n = EWMAPI.EWM_HANDLER_LIST.GetSize()
	while n > 0
		n -= 1
		GetHandler(n).RegisterFunctions()
	EndWhile
EndFunction


Bool Function GetFunctionCondition(string functionName) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return None
	endif
	Int i = EWMAPI.EWM_HANDLER_LIST.GetSize()
	While i > 0
		i -= 1
		EWM_HandleModBase currentHandler = EWMAPI.EWM_HANDLER_LIST.GetAt(i) As EWM_HandleModBase
		Int functionIndexInHandler = currentHandler.HasFunction(functionName)
		if functionIndexInHandler >= 0
			return currentHandler.GetFunctionCondition(functionIndexInHandler)
		endif
	EndWhile
EndFunction


;---------------------------------------------------------------------------------------------------------------
;	HANDLERS MANAGER
;---------------------------------------------------------------------------------------------------------------

Formlist Function GetHandlers() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return None
	endif
	return EWMAPI.EWM_HANDLER_LIST
EndFunction


EWM_HandleModBase Function GetHandler(Int index) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return None
	endif
	return (EWMAPI.EWM_HANDLER_LIST.GetAt(index) As Quest) As EWM_HandleModBase
EndFunction


EWM_HandleModBase Function GetHandlerWithFunction(string functionName) Global
	Int i = GetHandlersCount()
	while i > 0
		i -= 1
		if GetHandler(i).HasFunction(functionName) >= 0
			return GetHandler(i)
		endif
	EndWhile
EndFunction


Int Function GetHandlersCount() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return 0
	endif
	return EWMAPI.EWM_HANDLER_LIST.GetSize()
EndFunction


Function EnableHandler(String QuestHandlerName, String akPluginName = "") Global
	EWM_HandleModBase handler = Quest.GetQuest(QuestHandlerName) As EWM_HandleModBase
	if akPluginName != ""
		handler.PluginName=akPluginName
	endif
	if handler.GetState() != "HandlerON"
		handler.GoToState("HandlerON")
	endif
EndFunction


Function DisableHandler(String QuestHandlerName) Global
	(Quest.GetQuest(QuestHandlerName) As EWM_HandleModBase).GoToState("HandlerOFF")
EndFunction


Function SendEWMEvent (String functionName) Global
	int handle = ModEvent.Create("EWM_"+functionName)
    if (handle)
        ModEvent.Send(handle)
    endIf
EndFunction


;---------------------------------------------------------------------------------------------------------------
;	WHEELS MANAGER
;---------------------------------------------------------------------------------------------------------------

Bool Function isWheel(Int wheelNumber) Global
	if GetKeycodeWheel(wheelNumber) != 0
		return true
	endif
	return false
EndFunction


String[] Function GetWheels() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	return EWMAPI.wheelList
EndFunction


Function TryOpenWheel(String[] akLayout) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
	endif
	UI.CloseCustomMenu()
	EWMAPI.CurrentLayoutIndex = GetLayoutIndex(akLayout)
	if !EWMAPI.WheelMenu.Open(akLayout)
		RaiseEWMAPIError("Layout "+EWMAPI.CurrentLayoutIndex+" corrupted, cleaning now")
		AutofillLayout(akLayout, true)
	EndIf
EndFunction


Bool Function isWheelOpen() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		Return false
	endif
	return EWMAPI._isWheelOpen
EndFunction


Function WheelOpen(Bool isOpen = True) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		Return
	endif
	EWMAPI._isWheelOpen = isOpen
EndFunction


;---------------------------------------------------------------------------------------------------------------
;	KEYCODES MANAGER
;---------------------------------------------------------------------------------------------------------------

Int Function GetKeycodeWheel(Int wheelNumber) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return 0
	endif
	if !EWMAPI.WHEELS_KEYCODES
		RaiseEWMAPIError("Wheels keycodes not initialized")
		ResetKeycodes()
		return 0
	endif
	if wheelNumber < 1 || wheelNumber > 16
		return 0
	endif
	return EWMAPI.WHEELS_KEYCODES[wheelNumber - 1]
EndFunction


Function SetKeycodeWheel(Int wheelNumber, Int keyCode) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return
	endif
	if !EWMAPI.WHEELS_KEYCODES
		RaiseEWMAPIError("Wheels keycodes not initialized")
		ResetKeycodes()
		return
	endif
	if wheelNumber < 0 || wheelNumber > 15
		return
	endif
	EWMAPI.WHEELS_KEYCODES[wheelNumber - 1] = keyCode
EndFunction


Function ResetKeycodes() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
	endif
	EWMAPI._ResetKeycodes()
EndFunction


String Function GetInputState() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		Return ""
	endif
	return EWMAPI.InputState
EndFunction


Function SetInputState(String stateName) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
	endif
	EWMAPI.InputState = stateName
EndFunction


Function RefreshKeyCodes() Global
		_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		Return
	endif
	EWMAPI.InputManager.RefreshKeys()
EndFunction


Int Function KeycodeSwap(String option = "") Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		Return 0
	endif
	if option == "" || option == "Show"
		return EWMAPI.SWAP_WHEELS_SHOW_KEYCODE
	elseif option == "Next"
		return EWMAPI.SWAP_WHEELS_NEXT_KEYCODE
	elseif option == "Prev"
		return EWMAPI.SWAP_WHEELS_PREV_KEYCODE
	else
		return 0
	EndIf
EndFunction


Function SetKeycodeSwap(String option, int keycode) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		Return
	endif
	if option == "Show"
		EWMAPI.SWAP_WHEELS_SHOW_KEYCODE = keycode
	elseif option == "Next"
		EWMAPI.SWAP_WHEELS_NEXT_KEYCODE = keycode
	elseif option == "Prev"
		EWMAPI.SWAP_WHEELS_PREV_KEYCODE = keycode
	EndIf
EndFunction


;---------------------------------------------------------------------------------------------------------------
;	LAYOUTS MANAGER
;---------------------------------------------------------------------------------------------------------------

String[] Function GetLayout(int i) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	return EWMAPI._GetLayout(i)
EndFunction


String[] Function GetCurrentLayout() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	Return GetLayout(EWMAPI.CurrentLayoutIndex)
EndFunction


Int Function GetCurrentIndex() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return 0
	endif
	Return EWMAPI.CurrentLayoutIndex
EndFunction


Function SetCurrentIndex(int index) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return
	endif
	EWMAPI.CurrentLayoutIndex = index
EndFunction


Function AutofillLayout (String[] wheelLayout, Bool blankOnly = False) Global
	Int i = -1
	If !blankOnly
		Int n = GetFunctionsCount()
		While (i < n && i < 7)
			i += 1
			wheelLayout[i] = GetFunction(i)
			if wheelLayout[i] == ""
				wheelLayout[i] == "EMPTY"
			endif
		EndWhile
	Else
		wheelLayout = new String[8]
	EndIf
	While i < 7
		i += 1
		wheelLayout[i] = "EMPTY"
	EndWhile
EndFunction


Function CleanLayout (Int i) Global
	AutofillLayout(GetLayout(i), true)
EndFunction


String[] Function LayoutFromKeycode(int keyCode) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	int keycodeIndex = EWMAPI.WHEELS_KEYCODES.Find(keyCode)
	if keycodeIndex < 0
		RaiseEWMAPIError("keyCode doesn't match any known wheel layout")
		return none
	endif
	return GetLayout(keycodeIndex + 1)
EndFunction


Int Function GetLayoutIndex(String[] akLayout) Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return 0
	endif
	return EWMAPI._GetLayoutIndex(akLayout)
EndFunction


String[] Function GetNextLayout() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	int nextIndex = EWMAPI.CurrentLayoutIndex + 1
	if nextIndex == 17
		nextIndex = 1
	endif
	int counter = 0
	while IsEmptyLayout(GetLayout(nextIndex)) || counter > 16
		counter += 1
		nextIndex += 1
		if nextIndex == 17
			nextIndex = 1
		endif
	EndWhile
	if counter > 16
		RaiseEWMAPIError("All layouts are empty")
	endif
	return GetLayout(nextIndex)
EndFunction


String[] Function GetPrevLayout() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return none
	endif
	int prevIndex = EWMAPI.CurrentLayoutIndex - 1
	if prevIndex == 0
		prevIndex = 16
	endif
	int counter = 0
	while IsEmptyLayout(GetLayout(prevIndex)) || counter > 16
		counter += 1
		prevIndex -= 1
		if prevIndex == 0
			prevIndex = 16
		endif
	EndWhile
	if counter > 16
		RaiseEWMAPIError("All layouts are empty")
	endif
	return GetLayout(prevIndex)
EndFunction


Bool Function IsEmptyLayout(String[] akLayout) Global
	int i = akLayout.Length
	if i != 8
		RaiseEWMAPIError("Layout doesn't have 8 entries")
		return true
	endif
	while i > 0
		i -= 1
		if akLayout[i] != "" && akLayout[i] != "EMPTY"
			return false
		endif
	EndWhile
	return true
EndFunction


;---------------------------------------------------------------------------------------------------------------
;	MAINTAINANCE
;---------------------------------------------------------------------------------------------------------------

Function CheckMods() Global
	If !EWM_ModScanner.ScanInstalledMods()
		EnableWheelMenuAPI(False)
		RaiseEWMAPIError("Mod Scanner Failed.")
		Debug.MessageBox("EasyWheel : \n Pre-requisites missing, mod disabled.")
		Return
	EndIf
	EnableWheelMenuAPI()
EndFunction


Function ResetConfig() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return
	endif
	ResetKeycodes()
	int i = 2
	While i <= 16
		CleanLayout(i)
		i += 1
	EndWhile
	AutofillLayout(GetLayout(1))
	SetInputState("WheelPerKey")
	if EWMAPI._bHideSpells
		EWMAPI._HideSpells()
	endif
EndFunction


;---------------------------------------------------------------------------------------------------------------
;	MCM HELPER
;---------------------------------------------------------------------------------------------------------------

Bool Function ChangeSpellsVisibility() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return false
	endif
	EWMAPI._bhideSpells = !EWMAPI._bhideSpells
	EWMAPI._ShowSpells()
	if EWMAPI._bHideSpells
		EWMAPI._HideSpells()
	endif
	return EWMAPI._bhideSpells
EndFunction


Bool Function ChangeShowPlayerStats() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return false
	endif
	EWMAPI._bShowPlayerStats = !EWMAPI._bShowPlayerStats
	return EWMAPI._bShowPlayerStats
EndFunction


Bool Function ChangeShowHandlerStatus() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return false
	endif
	EWMAPI._bShowHandlerStatus = !EWMAPI._bShowHandlerStatus
	return EWMAPI._bShowHandlerStatus
EndFunction


Bool Function bHideSpells() Global
	_EasyWheelAPI EWMAPI = GetAPI()
	if EWMAPI == none
		RaiseEWMAPIError("EWMAPI unavailable")
		return false
	endif
	return EWMAPI._bhideSpells
EndFunction

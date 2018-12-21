scriptname _EasyWheelAPI extends Quest

Import EWM_Util


Actor Property PlayerRef Auto
EWM_WheelMenu Property WheelMenu Auto

FormList Property EWM_HANDLER_LIST Auto
Int[]    Property WHEELS_KEYCODES        Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_1  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_2  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_3  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_4  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_5  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_6  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_7  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_8  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_9  Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_10 Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_11 Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_12 Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_13 Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_14 Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_15 Auto Hidden
String[] Property CONFIG_LAYOUT_WHEEL_16 Auto Hidden
String[] Property EWM_FCT_ALL            Auto Hidden
String[] Property wheelList              Auto Hidden

Int Property CurrentLayoutIndex       = 1 Auto Hidden
Int Property SKSE_MIN_VERSION         = 10703 AutoReadOnly Hidden
Int Property SWAP_WHEELS_NEXT_KEYCODE = 0 Auto Hidden
Int Property SWAP_WHEELS_PREV_KEYCODE = 0 Auto Hidden
Int Property SWAP_WHEELS_SHOW_KEYCODE = 0 Auto Hidden

Bool Property _bhideSpells        = true Auto Hidden
Bool Property _bShowHandlerStatus = false Auto Hidden
Bool Property _bShowPlayerStats   = false Auto Hidden
Bool Property _isAvailable        = False Auto Hidden
Bool Property _isInitialized      = False Auto Hidden
Bool Property _isWheelOpen        = False Auto Hidden

String _InputState = "WheelPerKey"

EWM_InputManager Property InputManager Auto

String Property InputState Hidden
	String Function get()
		return _InputState
	endfunction
	Function set(string stateName)
		_InputState =  stateName
		InputManager.GoToState(stateName)
	EndFunction
endproperty

String[] Property EWM_USER_SELECTION Hidden
	String[] function get()
		String[] userSelection = new String[128]
		int k = 16
		while k > 0
			int i = 8
			while i > 0
				i -= 1
				ArrayAddStr(userSelection, _GetLayout(k)[i])
			endwhile
			k -= 1
		endwhile
		return userSelection
	EndFunction
endproperty


Event OnInit()
	RegisterForSingleUpdate(0.1)
EndEvent


Event OnUpdate()
	EWM_FCT_ALL = new String[128]
	WHEELS_KEYCODES = new Int[16]
	CONFIG_LAYOUT_WHEEL_1 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_2 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_3 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_4 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_5 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_6 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_7 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_8 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_9 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_10 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_11 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_12 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_13 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_14 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_15 = Utility.CreateStringArray(8, "EMPTY")
	CONFIG_LAYOUT_WHEEL_16 = Utility.CreateStringArray(8, "EMPTY")
	wheelList = new String[16]
	int i = 0
	while i < 16
		wheelList[i] = i + 1
		i += 1
	endwhile
	_isInitialized = True
EndEvent


bool function _AddFunctions(String[] myFunctions)
	int i = myFunctions.Length
	bool result = true
	while i > 0 && result
		i -= 1
		result = _AddFunction(myFunctions[i])
	endwhile
	return result
endfunction


bool function _RemoveFunctions(String[] myFunctions)
	int i = myFunctions.Length
	bool result = true
	while i > 0 && result
		i -= 1
		result = _RemoveFunction(myFunctions[i])
	endwhile
	return result
endfunction


Int Function _GetFunctionsCount()
	int FctCount = StrCount(EWM_FCT_ALL)
	return FctCount
EndFunction


Bool function _AddFunction(String myFunction)
	return ArrayAddStr(EWM_FCT_ALL, myFunction)
endfunction


Bool function _RemoveFunction(String myFunction)
	return ArrayRemoveStr(EWM_FCT_ALL, myFunction)
endfunction


function _ShowSpells()
	int i = EWM_HANDLER_LIST.GetSize()
	while i > 0
		i -= 1
		(EWM_HANDLER_LIST.GetAt(i) As EWM_HandleModBase).ShowMySpells(PlayerRef)
	endwhile
endfunction


function _HideSpells()
	int i = EWM_HANDLER_LIST.GetSize()
	String[] userSelection = EWM_USER_SELECTION
	while i > 0
		i -= 1
		(EWM_HANDLER_LIST.GetAt(i) As EWM_HandleModBase).HideMySpells(PlayerRef, userSelection)
	endwhile
endfunction


function _ResetKeycodes()
	WHEELS_KEYCODES = Utility.CreateIntArray(16, 0)
	WHEELS_KEYCODES[0] = 16
	SWAP_WHEELS_SHOW_KEYCODE = 0
	SWAP_WHEELS_NEXT_KEYCODE = 0
	SWAP_WHEELS_PREV_KEYCODE = 0
endfunction


String[] Function _GetLayout(int i)
	if i == 1
		return CONFIG_LAYOUT_WHEEL_1
	elseif i == 2
		return CONFIG_LAYOUT_WHEEL_2
	elseif i == 3
		return CONFIG_LAYOUT_WHEEL_3
	elseif i == 4
		return CONFIG_LAYOUT_WHEEL_4
	elseif i == 5
		return CONFIG_LAYOUT_WHEEL_5
	elseif i == 6
		return CONFIG_LAYOUT_WHEEL_6
	elseif i == 7
		return CONFIG_LAYOUT_WHEEL_7
	elseif i == 8
		return CONFIG_LAYOUT_WHEEL_8
	elseif i == 9
		return CONFIG_LAYOUT_WHEEL_9
	elseif i == 10
		return CONFIG_LAYOUT_WHEEL_10
	elseif i == 11
		return CONFIG_LAYOUT_WHEEL_11
	elseif i == 12
		return CONFIG_LAYOUT_WHEEL_12
	elseif i == 13
		return CONFIG_LAYOUT_WHEEL_13
	elseif i == 14
		return CONFIG_LAYOUT_WHEEL_14
	elseif i == 15
		return CONFIG_LAYOUT_WHEEL_15
	elseif i == 16
		return CONFIG_LAYOUT_WHEEL_16
	else
		return none
	endif
EndFunction


Int Function _GetLayoutIndex(String[] wheelLayout)
	if wheelLayout == CONFIG_LAYOUT_WHEEL_1
		return 1
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_2
		return 2
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_3
		return 3
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_4
		return 4
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_5
		return 5
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_6
		return 6
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_7
		return 7
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_8
		return 8
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_9
		return 9
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_10
		return 10
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_11
		return 11
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_12
		return 12
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_13
		return 13
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_14
		return 14
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_15
		return 15
	elseif wheelLayout == CONFIG_LAYOUT_WHEEL_16
		return 16
	else
		return 0
	endif
EndFunction


Function RefreshFunctions()
	EWM_FCT_ALL = new String[128]
EndFunction


String[] Function _GetVisibleFunctions()
	String[] visibleFunction = Utility.CreateStringArray(_GetFunctionsCount())
	Int handlerCount = EWM_HANDLER_LIST.GetSize()
	while handlerCount > 0
		handlerCount -= 1
		EWM_HandleModBase currentHandler = (EWM_HANDLER_LIST.GetAt(handlerCount) As Quest) As EWM_HandleModBase
		if !currentHandler.isManuallyDisabled
			String[] handlerFunctionsList = currentHandler.FunctionsForMenu
			int i = handlerFunctionsList.Length
			while i > 0
				i -= 1
				ArrayAddStr(visibleFunction, handlerFunctionsList[i])
			endwhile
		endif
	endwhile
	return visibleFunction
EndFunction

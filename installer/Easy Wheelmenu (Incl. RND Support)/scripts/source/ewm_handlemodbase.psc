Scriptname EWM_HandleModBase extends Quest hidden
{
	EasyWheelMenu Mod handler base script
}
Import EasyWheelAPI
Import EWM_Util

String[] Property FCT_LST_DEFAULT Auto
{
	List of functions available for this handler.
}
String[] Property FunctionsForMenu Hidden
	String[] function get()
		int i = FCT_LST_DEFAULT.Length
		int j = 0
		String[] myList = Utility.CreateStringArray(i)
		while i > 0
			i -= 1
			if GetFunctionCondition(i)
				myList[j] = "$"+FCT_LST_DEFAULT[i]
				j += 1
			endif
		endwhile
		return myList
	EndFunction
endproperty

Bool[] Property FCT_LST_CONDITION Auto Hidden

String Property PluginName = "" Auto
{
	Name for this handler (used for the display in the MCM)
}

String Property AddOnQuest = "" Auto
{
	Must be set to the exact EditorID of the quest this script is attached to !
}

Bool Property isManuallyDisabled = False Auto Hidden
Int Property isManuallyDisabledFlag Hidden
	Int Function get()
		if isManuallyDisabled
			return 0x01
		endif
		return 0x00
	EndFunction
endproperty

Bool Property HasSpells = false Auto
{
	Set to true if at least one function is used to replace a spell.
}

Event OnInit()
	if AddOnQuest != ""
		RegisterForModEvent("EWM_PluginCheck", "OnEWMPluginCkeck")
	endif
EndEvent

Event OnEWMPluginCkeck()
	Debug.Trace("[EasyWheel] Registering plugin : "+PluginName+" with "+AddOnQuest)
	EnableHandler(AddOnQuest)
EndEvent

State HandlerON

	Event OnBeginState()
		Formlist Handlers = GetHandlers()
		Handlers.addForm(Self as Quest)
		FCT_LST_CONDITION = Utility.CreateBoolArray(FCT_LST_DEFAULT.Length, fill = true)
		RegisterFunctions()	
		RegisterForModEvent("EWM_ShowHandlerStatusEvent", "OnShowStatus")
		OnHandlerInit()
	EndEvent
	
EndState

Int Function HasFunction(string functionName)
	return FCT_LST_DEFAULT.Find(functionName)
EndFunction

Int Function GetHandlerIndex()
	Formlist Handlers = GetHandlers()
	return Handlers.Find(Self As Quest)
EndFunction


Bool Function GetFunctionConditionbyName(string functionName)
	int i = HasFunction(functionName)
	if i >= 0
		return GetFunctionCondition(i)
	else
		return false
	endif
EndFunction


State HandlerOFF

	Event OnBeginState()
		Formlist Handlers = GetHandlers()
		Handlers.RemoveAddedForm(Self as Quest)
		RemoveFunctions(FCT_LST_DEFAULT)
		UnregisterForAllModEvents()
	EndEvent

	Bool Function GetFunctionCondition(Int functionIndex)
		return false
	EndFunction
	
EndState

Spell Function GetFunctionSpell(Int functionIndex)
	return none
EndFunction

Bool Function GetFunctionCondition(Int functionIndex)
	return true
EndFunction

Function RegisterFunctions()
	Int i = FCT_LST_DEFAULT.Length
	while i > 0
		i -= 1
		RegisterFunction(i)
	endwhile
EndFunction

Function RegisterFunction(Int functionIndex)
	if GetFunctionCondition(functionIndex)
		String functionName = FCT_LST_DEFAULT[functionIndex]
		AddFunction(functionName)
		RegisterForModEvent("EWM_"+functionName, "On"+functionName)
	endif
EndFunction

Function OnHandlerInit()

EndFunction

Function ShowMySpells(Actor PlayerRef)
	if !HasSpells
		return
	endif

	Int i = FCT_LST_DEFAULT.Length
		while i > 0
			i -= 1
			if GetFunctionCondition(i)
				Spell mySpell = GetFunctionSpell(i)
				if mySpell
					PlayerRef.AddSpell(mySpell, false)
				endif
			endif
		endwhile
EndFunction

Function HideMySpells(Actor PlayerRef, String[] userSelection)
	if !HasSpells || !bHideSpells()
		return
	endif

	Int i = FCT_LST_DEFAULT.Length
		while i > 0
			i -= 1
			if userSelection.Find(FCT_LST_DEFAULT[i]) >= 0
				Spell mySpell = GetFunctionSpell(i)
				if mySpell
					PlayerRef.RemoveSpell(mySpell)
				endif
			endif
		endwhile
EndFunction

String Function GetFctRatio()
	return StrCount(FunctionsForMenu)+"/"+FCT_LST_DEFAULT.Length
EndFunction
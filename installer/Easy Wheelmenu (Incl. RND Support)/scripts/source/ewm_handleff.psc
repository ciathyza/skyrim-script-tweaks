Scriptname EWM_HandleFF extends EWM_HandleModBase

; 0 : WeatherSense
; 1 : Innerfire

Event On_EWM_FrostFall_Weathersense()
	(Game.GetFormFromFile(0x00016215, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_FrostFall_InnerFire()
	(Game.GetFormFromFile(0x000696DC, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent


Bool Function GetFunctionCondition(Int functionIndex)

	if functionIndex == 1
		GlobalVariable PerkRank_InnerFire = (Game.GetFormFromFile(0x00067BA8, PluginName)) As GlobalVariable
		If (PerkRank_InnerFire.GetValue() != 1.0)
			return false
		EndIf
	endif

	return true

EndFunction


Spell Function GetFunctionSpell(Int functionIndex)
	if functionIndex == 0
		return Game.GetFormFromFile(0x00016215, PluginName) As Spell
	elseif functionIndex == 1
		return Game.GetFormFromFile(0x000696DC, PluginName) As Spell
	endif
	return none
EndFunction


Function OnHandlerInit()
	RegisterForModEvent("Frostfall_Loaded", "OnFrostfallLoaded")
EndFunction

Event OnFrostfallLoaded()
	HideMySpells(Game.GetPlayer(), EasyWheelAPI.GetUserSelection())
EndEvent

Event OnShowStatus(string eventName, string strArg, float numArg, Form sender)
	(Game.GetFormFromFile(0x00016215, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent
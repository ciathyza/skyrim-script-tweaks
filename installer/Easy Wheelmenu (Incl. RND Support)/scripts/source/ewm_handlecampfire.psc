Scriptname EWM_HandleCampfire extends EWM_HandleModBase

; 0 : Create Item
; 1 : Harvest Wood
; 2 : Build Campfire
; 3 : Instincts

Event On_EWM_Campfire_CreateItem()
	(Game.GetFormFromFile(0x0002306B, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_Campfire_HarvestWood()
	(Game.GetFormFromFile(0x00025647, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_Campfire_BuildCampfire()
	(Game.GetFormFromFile(0x00025BD5, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_Campfire_Instincts()
	(Game.GetFormFromFile(0x00035411, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Spell Function GetFunctionSpell(Int functionIndex)

	if functionIndex == 0
		return Game.GetFormFromFile(0x0002306B, PluginName) As Spell
	elseif functionIndex == 1
		return Game.GetFormFromFile(0x00025647, PluginName) As Spell
	elseif functionIndex == 2
		return Game.GetFormFromFile(0x00025BD5, PluginName) As Spell
	elseif functionIndex == 3
		return Game.GetFormFromFile(0x00035411, PluginName) As Spell
	endif

	return none
EndFunction

Function OnHandlerInit()
	RegisterForModEvent("Campfire_Loaded", "OnCampfireLoaded")
EndFunction

Event OnCampfireLoaded()
	HideMySpells(Game.GetPlayer(), EasyWheelAPI.GetUserSelection())
EndEvent
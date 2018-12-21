Scriptname EWM_HandleEFF extends EWM_HandleModBase 


; 0 : Leader's Telepathy
; 1 : Leader's Teleportation

Event On_EWM_EFF_Telepathy()
	Debug.Trace("Telepathy")
	(Game.GetFormFromFile(0x00000F4C, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_EFF_Teleportation()
	Debug.Trace("Teleportation")
	(Game.GetFormFromFile(0x00000F5B, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Spell Function GetFunctionSpell(Int functionIndex)
	if functionIndex == 0
		return Game.GetFormFromFile(0x00000F4C, PluginName) As Spell
	elseif functionIndex == 1
		return Game.GetFormFromFile(0x00000F5B, PluginName) As Spell
	endif
	return none
EndFunction

Scriptname EWM_HandleIHO extends EWM_HandleModBase 


; 0 : Horse Menu
; 1 : Whistle

Event On_EWM_ImmHorses_Menu()
	(Game.GetFormFromFile(0x000382F2, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_ImmHorses_Whistle()
	(Game.GetFormFromFile(0x000311E0, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Spell Function GetFunctionSpell(Int functionIndex)
	if functionIndex == 0
		return Game.GetFormFromFile(0x000382F2, PluginName) As Spell
	elseif functionIndex == 1
		return Game.GetFormFromFile(0x000311E0, PluginName) As Spell
	endif
	return none
EndFunction

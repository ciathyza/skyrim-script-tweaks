Scriptname EWM_HandleRND extends EWM_HandleModBase 


; 0 : Drink From Water Source
; 1 : Check Needs

Event On_EWM_RND_DrinkFromWaterSource()
	Debug.Trace("DrinkFromSource")
	(Game.GetFormFromFile(0x0004295C, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_RND_CheckNeeds()
	Debug.Trace("Check Needs")
	(Game.GetFormFromFile(0x0002E0CB, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Spell Function GetFunctionSpell(Int functionIndex)
	if functionIndex == 0
		return Game.GetFormFromFile(0x0004295C, PluginName) As Spell
	elseif functionIndex == 1
		return Game.GetFormFromFile(0x0002E0CB, PluginName) As Spell
	endif
	return none
EndFunction

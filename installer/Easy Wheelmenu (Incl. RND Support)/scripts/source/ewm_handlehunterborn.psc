Scriptname EWM_HandleHunterborn extends EWM_HandleModBase 

; 0 : Foraging : _EWM_HB_Foraging : 0x00014225
; 1 : Scrimshaw : _EWM_HB_Scrimshaw : 0x00025c0c
; 2 : Primitive Cooking : _EWM_HB_Cook : 0x00073d95
; 3 : Sense Direction : _EWM_HB_SenseDir : 0x00044ed1
; 4 : Taxonomy : _EWM_HB_Taxonomy : 0x000215da
; 5 : Field Dress : _EWM_HB_FieldDress : 0x00044ec6
; 6 : Skin : _EWM_HB_Skin : 0x00044ec9
; 7 : Harvest : _EWM_HB_Harvest : 0x00044ecb
; 8 : Butcher : _EWM_HB_Butcher : 0x00044ecd
; 9 : Process : _EWM_HB_Process : 0x00044ecf

Event On_EWM_HB_Foraging()
	(Game.GetFormFromFile(0x00014225, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_HB_Scrimshaw()
	(Game.GetFormFromFile(0x00025c0c, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_HB_Cook()
	(Game.GetFormFromFile(0x00073d95, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_HB_SenseDir()
	(Game.GetFormFromFile(0x00044ed1, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_HB_Taxonomy()
	(Game.GetFormFromFile(0x000215da, PluginName) As Spell).Cast(Game.GetPlayer())
EndEvent

Event On_EWM_HB_FieldDress()
	Bool dont = false
	if Game.GetPlayer().GetSitState() != 0
		dont = true
	endif
	if !dont
		(Game.GetFormFromFile(0x00044ec6, PluginName) As Spell).Cast(Game.GetPlayer())
	endif
EndEvent

Event On_EWM_HB_Skin()
	Bool dont = false
	if Game.GetPlayer().GetSitState() != 0
		dont = true
	endif
	if !dont
		(Game.GetFormFromFile(0x00044ec9, PluginName) As Spell).Cast(Game.GetPlayer())
	endif
EndEvent

Event On_EWM_HB_Harvest()
	Bool dont = false
	if Game.GetPlayer().GetSitState() != 0
		dont = true
	endif
	if !dont
		(Game.GetFormFromFile(0x00044ecb, PluginName) As Spell).Cast(Game.GetPlayer())
	endif
EndEvent

Event On_EWM_HB_Butcher()
	Bool dont = false
	if Game.GetPlayer().GetSitState() != 0
		dont = true
	endif
	if !dont
		(Game.GetFormFromFile(0x00044ecd, PluginName) As Spell).Cast(Game.GetPlayer())
	endif
EndEvent

Event On_EWM_HB_Process()
	Bool dont = false
	if Game.GetPlayer().GetSitState() != 0
		dont = true
	endif
	if !dont
		(Game.GetFormFromFile(0x00044ecf, PluginName) As Spell).Cast(Game.GetPlayer())
	endif
EndEvent

Spell Function GetFunctionSpell(Int functionIndex)
	if functionIndex == 0
		return Game.GetFormFromFile(0x00014225, PluginName) As Spell
	elseif functionIndex == 1
		return Game.GetFormFromFile(0x00025c0c, PluginName) As Spell
	elseif functionIndex == 2
		return Game.GetFormFromFile(0x00073d95, PluginName) As Spell
	elseif functionIndex == 3
		return Game.GetFormFromFile(0x00044ed1, PluginName) As Spell
	elseif functionIndex == 4
		return Game.GetFormFromFile(0x000215da, PluginName) As Spell
	endif
	return none
EndFunction

Bool Function GetFunctionCondition(Int functionIndex)
	_DS_HB_Globals dsGlobals = (Quest.GetQuest("_DS_Hunterborn") As _DS_HB_Globals)
	if !dsGlobals.gHunterbornActive
		return false
	endif

	if functionIndex == 4
		if dsGlobals.gAddTaxonomy
			return true
		else 
			return false
		endif
	endif
	return true
EndFunction
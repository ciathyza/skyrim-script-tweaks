Scriptname _WetColdRegions extends activemagiceffect  

_WetQuestScript Property _WetQuest Auto

Bool Property ColdRegionsTimed Auto
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	If _WetQuest.InVanillaColdTimed || _WetQuest.InVanillaCold
		Utility.Wait(0.1)
	EndIf
	If ColdRegionsTimed
		_WetQuest.InVanillaColdTimed = True
	Else
		_WetQuest.InVanillaCold = True
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If ColdRegionsTimed
		_WetQuest.InVanillaColdTimed = False
	Else
		_WetQuest.InVanillaCold = False
	EndIf
EndEvent
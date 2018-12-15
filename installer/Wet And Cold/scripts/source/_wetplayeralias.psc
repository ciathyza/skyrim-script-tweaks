Scriptname _WetPlayerAlias extends ReferenceAlias  

_WetQuestScript Property _WetQuest Auto
 
Event OnPlayerLoadGame()
	_WetQuest.Maintenance()
EndEvent
Scriptname DCVR_LVA_GarterPouch extends activemagiceffect  


ObjectReference Property GarterChest  Auto
Actor Property PlayerRef  Auto  




Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (akCaster == PlayerRef)
		GarterChest.Activate(akCaster)

	EndIf

EndEvent

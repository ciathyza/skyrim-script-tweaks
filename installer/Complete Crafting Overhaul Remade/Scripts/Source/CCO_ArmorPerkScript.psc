Scriptname CCO_ArmorPerkScript extends ObjectReference  

Perk Property PerkToAdd auto

Event OnEquipped(Actor akActor)
	akActor.AddPerk(PerkToAdd)
EndEvent

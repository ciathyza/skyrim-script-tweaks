; Immersive Horses by sevencardz.
ScriptName PlayerHorseScript extends ReferenceAlias  
{Script attached to a stabled horse which respawns the horse at its stable when it dies.}

Actor Property MySelf Auto
ObjectReference Property StablesPosition Auto
ActorBase Property LvlHorseSaddled Auto
ReferenceAlias Property Alias_HorseRef Auto
Faction Property StablesFaction Auto
Outfit Property HorseOriginalOutfit Auto

Event OnInit()
	HorseOriginalOutfit = LvlHorseSaddled.GetOutfit()
EndEvent

Event OnDeath(Actor akKiller)
	MySelf = GetActorReference()
EndEvent

Event OnUnload()
	if MySelf.IsDead()
		MySelf.Disable()
		MySelf.Delete()
		MySelf = StablesPosition.PlaceActorAtMe(LvlHorseSaddled)
		MySelf.SetOutfit(HorseOriginalOutfit)
		Alias_HorseRef.ForceRefTo(MySelf)
		Alias_HorseRef.GetRef().SetFactionOwner(StablesFaction)
	endIf
EndEvent

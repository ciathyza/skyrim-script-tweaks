; Immersive Horses by sevencardz.
ScriptName IHOActorDeathRespawnScript extends Actor
{Script attached to an actor which respawns the persistent actor at its home when it dies.}

ObjectReference Property ActorHome Auto
Outfit actorOriginalOutfit = None
Faction actorOriginalFactionOwner = None
ActorBase actorOriginalActorOwner = None

Event OnInit()
	actorOriginalOutfit = GetActorBase().GetOutfit()
	actorOriginalFactionOwner = GetFactionOwner()
	actorOriginalActorOwner = GetActorOwner()
EndEvent

Event OnUnload()
	if IsDead()
		Actor actorRef = ActorHome.PlaceActorAtMe(GetActorBase()) ; Persistent Respawn
		if actorOriginalOutfit != None
			actorRef.SetOutfit(actorOriginalOutfit)
		endIf
		if actorOriginalFactionOwner != None
			actorRef.SetFactionOwner(actorOriginalFactionOwner)
		endIf
		if actorOriginalActorOwner != None
			actorRef.SetActorOwner(actorOriginalActorOwner)
		endIf
		Disable()
		Delete()
	endIf
EndEvent

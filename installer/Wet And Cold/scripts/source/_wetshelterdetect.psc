Scriptname _WetShelterDetect extends ObjectReference  

_WetQuestScript Property _WetQuest Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If akSource as Spell
		_WetQuest.PlayerRef.RemoveFromFaction(_WetQuest._WetIsUnderShelterFaction)
		RegisterForSingleUpdate(12.0)
	EndIf
EndEvent

Event OnUpdate()
	_WetQuest.PlayerRef.AddToFaction(_WetQuest._WetIsUnderShelterFaction)
EndEvent
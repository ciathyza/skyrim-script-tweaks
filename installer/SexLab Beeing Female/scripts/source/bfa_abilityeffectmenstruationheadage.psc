Scriptname BFA_AbilityEffectMenstruationHeadage extends activemagiceffect  

actor PlayerRef

Event OnEffectStart(Actor target, Actor caster)
	PlayerRef = target
	RegisterForSingleUpdateGameTime(1.4)
endEvent

Event  OnUpdateGameTime()
	If PlayerRef
		PlayerRef.DamageActorValue("magicka", (PlayerRef.GetBaseActorValue("magicka") / 100) * 20);
		RegisterForSingleUpdateGameTime(1.4)
	Else
		Dispel()
	EndIf
endEvent

Event OnEffectFinish(Actor target, Actor caster)
	UnregisterForUpdateGameTime()
endEvent

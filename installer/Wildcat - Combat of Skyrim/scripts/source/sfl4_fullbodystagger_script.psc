Scriptname SFL4_FullBodyStagger_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Faction Property ForceFullBodyStagger Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.5)
	PlayerRef.AddToFaction(ForceFullBodyStagger)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.RemoveFromFaction(ForceFullBodyStagger)

EndEvent

; -----
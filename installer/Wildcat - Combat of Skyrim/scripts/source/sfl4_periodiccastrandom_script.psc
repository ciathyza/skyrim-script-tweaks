Scriptname SFL4_PeriodicCastRandom_Script extends activemagiceffect  

; -----

Spell Property SFL_SpellToCast Auto
Float Property SFL_UpdateRateMin Auto
Float Property SFL_UpdateRateMax Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(Utility.RandomFloat(SFL_UpdateRateMin,SFL_UpdateRateMax))

EndEvent

; -----

Event OnUpdate()

	SFL_SpellToCast.Cast(GetTargetActor())
	RegisterForSingleUpdate(Utility.RandomFloat(SFL_UpdateRateMin,SFL_UpdateRateMax))

EndEvent

; -----
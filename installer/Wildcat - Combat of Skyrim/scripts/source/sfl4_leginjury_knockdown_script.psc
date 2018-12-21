Scriptname SFL4_LegInjury_Knockdown_Script extends activemagiceffect  


; -----

Float Property SFL_PushForce Auto
Float Property SFL_UpdateRateMin Auto
Float Property SFL_UpdateRateMax Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(Utility.RandomFloat(SFL_UpdateRateMin,SFL_UpdateRateMax))

EndEvent

; -----

Event OnUpdate()

	Actor TheTarget = GetTargetActor()
	TheTarget.PushActorAway(TheTarget, SFL_PushForce)

EndEvent

; -----
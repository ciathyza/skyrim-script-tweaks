Scriptname SFL4_CarryWeight_Script extends activemagiceffect  

; -----

Float Property SFL_CarryWeight Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	akTarget.ModActorValue("CarryWeight",SFL_CarryWeight)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModActorValue("CarryWeight",-SFL_CarryWeight)

EndEvent

; -----
Scriptname SF4_BowCostStamina_Script extends activemagiceffect  

; -----

GlobalVariable Property SFL_SwingCostsStamina_Global Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(akTarget, "BowDrawn")

EndEvent

; -----

Event OnRaceSwitchComplete()

	Actor TheTarget = GetTargetActor()
	RegisterForAnimationEvent(TheTarget, "BowDrawn")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If (asEventName == "BowDrawn")
		GetTargetActor().DamageActorValue("Stamina", SFL_SwingCostsStamina_Global.GetValue())
	EndIf

EndEvent

; -----
Scriptname SFL4_AttacksCostStamina_Script extends activemagiceffect  

; -----

GlobalVariable Property SFL_SwingCostsStamina_Global Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(akTarget, "weaponSwing")
	RegisterForAnimationEvent(akTarget, "weaponLeftSwing")

EndEvent

; -----

Event OnRaceSwitchComplete()

	Actor TheTarget = GetTargetActor()
	RegisterForAnimationEvent(TheTarget, "weaponSwing")
	RegisterForAnimationEvent(TheTarget, "weaponLeftSwing")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If (asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing")
		GetTargetActor().DamageActorValue("Stamina", SFL_SwingCostsStamina_Global.GetValue())
	EndIf

EndEvent

; -----
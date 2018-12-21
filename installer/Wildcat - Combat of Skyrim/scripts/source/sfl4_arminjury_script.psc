Scriptname SFL4_ArmInjury_Script extends activemagiceffect  

; -----

Spell Property SFL_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(akTarget, "weaponSwing")
	RegisterForAnimationEvent(akTarget, "weaponLeftSwing")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If (asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing")
		SFL_Spell.Cast(GetTargetActor())
	EndIf

EndEvent

; -----
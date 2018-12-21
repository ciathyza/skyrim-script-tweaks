Scriptname SFL4_SpineInjury_Script extends activemagiceffect  

; -----

Spell Property WCT_Stagger Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (abPowerAttack || abBashAttack) && !abHitBlocked
		WCT_Stagger.Cast(TheTarget)
	EndIf

EndEvent

; -----
Scriptname SFL4_InterruptSpells_Script extends activemagiceffect  

; -----

Spell Property SFL_Stagger Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (akSource as Weapon) && akAggressor != TheTarget && !abHitBlocked
		SFL_Stagger.Cast(TheTarget)
	EndIf

EndEvent

; -----
Scriptname SFL4_TimedBlockR_Script extends activemagiceffect  

; -----

Spell Property SFL_TimedBlock_Spell_Proc Auto
MagicEffect Property SFL_TimedBlock_Effect_Lockout Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If !akTarget.HasMagicEffect(SFL_TimedBlock_Effect_Lockout)
		SFL_TimedBlock_Spell_Proc.Cast(akTarget)
	EndIf

EndEvent

; -----
Scriptname SBA_AddCoverTopScript extends ActiveMagicEffect  

Spell Property SBA_CoverTopAbility auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(SBA_CoverTopAbility, false)
endEvent

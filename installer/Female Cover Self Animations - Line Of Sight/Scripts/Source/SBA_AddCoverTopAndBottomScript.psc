Scriptname SBA_AddCoverTopAndBottomScript extends ActiveMagicEffect  

Spell Property SBA_CoverTopAndBottomAbility auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(SBA_CoverTopAndBottomAbility, false)
endEvent

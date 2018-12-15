Scriptname SBA_RemoveCoverScript extends ActiveMagicEffect  

SBA_CoverSelfScript Property myMod auto
Spell Property SBA_CoverTopAbility auto
Spell Property SBA_CoverTopAndBottomAbility auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.RemoveSpell(SBA_CoverTopAbility)
	akTarget.RemoveSpell(SBA_CoverTopAndBottomAbility)
	myMod.ResetAnimation(akTarget)
endEvent


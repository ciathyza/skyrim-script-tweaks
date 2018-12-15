Scriptname SBA_CoverSelfApplyingEffectScript extends ActiveMagicEffect  

Spell Property SBA_CoverSelfMonitorAbility Auto

 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(SBA_CoverSelfMonitorAbility, false)
EndEvent

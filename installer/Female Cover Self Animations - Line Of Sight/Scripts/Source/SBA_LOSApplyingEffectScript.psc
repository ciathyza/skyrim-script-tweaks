Scriptname SBA_LOSApplyingEffectScript extends ActiveMagicEffect  

Spell Property SBA_LOSMonitorAbility Auto
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(SBA_LOSMonitorAbility)
EndEvent


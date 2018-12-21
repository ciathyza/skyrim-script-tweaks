Scriptname FWCloaking extends ActiveMagicEffect

Spell property BeeingFemaleSpell Auto
Spell property BeeingMaleSpell Auto
Spell property BeeingNUFemaleSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	;Debug.Trace("FWCloaking::OnEffectStart("+akTarget.GetLeveledActorBase().GetName()+", "+akCaster.GetLeveledActorBase().GetName()+")")
	
	If akTarget.HasSpell(BeeingFemaleSpell)
		if akTarget.HasMagicEffect(BeeingFemaleSpell.GetNthEffectMagicEffect(0))==false
			;Debug.Trace("- Target has Female Spell already but not the Effect")
			akTarget.RemoveSpell(BeeingFemaleSpell)
		endif
	endif
	if akTarget.HasSpell(BeeingMaleSpell)
		if akTarget.HasMagicEffect(BeeingMaleSpell.GetNthEffectMagicEffect(0))==false
			;Debug.Trace("- Target has Male Spell already but not the Effect")
			akTarget.RemoveSpell(BeeingMaleSpell)
		endif
	endif

	If (! akTarget)
		;Debug.Trace("- Target is none")
		Dispel()
	
	ElseIf (akTarget.GetLeveledActorBase().GetSex() == 0)
		;if akTarget.HasMagicEffect(BeeingMaleSpell.GetNthEffectMagicEffect(0))==false
		if akTarget.HasSpell(BeeingMaleSpell)==false
			;Debug.Trace("- Target is male - Add Spell")
			akTarget.AddSpell(BeeingMaleSpell)
		endif
	ElseIf (akTarget.GetLeveledActorBase().IsUnique())
		;if akTarget.HasMagicEffect(BeeingFemaleSpell.GetNthEffectMagicEffect(0))==false
		if akTarget.HasSpell(BeeingFemaleSpell)==false
			;Debug.Trace("- Target is female unique - Add Spell")
			akTarget.AddSpell(BeeingFemaleSpell)
		endif
	ElseIf BeeingNUFemaleSpell!=none
		;if akTarget.HasMagicEffect(BeeingNUFemaleSpell.GetNthEffectMagicEffect(0))==false
		if akTarget.HasSpell(BeeingNUFemaleSpell)==false
			;Debug.Trace("- Target is female non-unique - Add Spell")
			akTarget.AddSpell(BeeingNUFemaleSpell)
		endif
	EndIf
EndEvent

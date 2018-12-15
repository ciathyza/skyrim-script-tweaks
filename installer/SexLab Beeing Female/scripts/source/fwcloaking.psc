;/ Decompiled by Champollion V1.0.1
Source   : FWCloaking.psc
Modified : 2017-01-13 16:21:14
Compiled : 2017-01-18 08:35:34
User     : admin
Computer : PATRICK
/;
scriptName FWCloaking extends ActiveMagicEffect

;-- Properties --------------------------------------
spell property BeeingFemaleSpell auto
spell property BeeingNUFemaleSpell auto
spell property BeeingMaleSpell auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnEffectStart(Actor akTarget, Actor akCaster)

	if akTarget.HasSpell(BeeingFemaleSpell as form)
		if akTarget.HasMagicEffect(BeeingFemaleSpell.GetNthEffectMagicEffect(0)) == false
			akTarget.RemoveSpell(BeeingFemaleSpell)
		endIf
	endIf
	if akTarget.HasSpell(BeeingMaleSpell as form)
		if akTarget.HasMagicEffect(BeeingMaleSpell.GetNthEffectMagicEffect(0)) == false
			akTarget.RemoveSpell(BeeingMaleSpell)
		endIf
	endIf
	if !akTarget
		self.Dispel()
	elseIf akTarget.GetLeveledActorBase().GetSex() == 0
		if akTarget.HasSpell(BeeingMaleSpell as form) == false
			akTarget.AddSpell(BeeingMaleSpell, true)
		endIf
	elseIf akTarget.GetLeveledActorBase().IsUnique()
		if akTarget.HasSpell(BeeingFemaleSpell as form) == false
			akTarget.AddSpell(BeeingFemaleSpell, true)
		endIf
	elseIf BeeingNUFemaleSpell != none
		if akTarget.HasSpell(BeeingNUFemaleSpell as form) == false
			akTarget.AddSpell(BeeingNUFemaleSpell, true)
		endIf
	endIf
endFunction

Scriptname FWSpell extends activemagiceffect  

FWSystem property System auto
FWController property Controller auto


; In this variable you can read if the actor was pregnant when the Effect started
bool bCasterIsPregnant=false
bool bTargetIsPregnant=false


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if !System || System as Quest==none
		System = Game.GetFormFromFile(0x00001829, "BeeingFemale.esm") as FWSystem
	endIf
	if !Controller || Controller as Quest==none
		Controller=System.Controller
	endif
	if System.IsValidateFemaleActor(akTarget)>0
		bTargetIsPregnant = akTarget.HasSpell(System.StatPregnancyCycle)
		if System.IsValidateFemaleActor(akCaster)>0
			OnWoman(akTarget, akCaster)
			WomanOnWoman(akTarget, akCaster)
			OnAnyone(akTarget, akCaster)
			bCasterIsPregnant = akCaster.HasSpell(System.StatPregnancyCycle)
		elseif System.IsValidateMaleActor(akCaster)>0
			OnMan(akTarget, akCaster)
			WomanOnMan(akTarget, akCaster)
			OnAnyone(akTarget, akCaster)
		endif
	elseif System.IsValidateMaleActor(akTarget)>0
		if System.IsValidateFemaleActor(akCaster)>0
			OnWoman(akTarget, akCaster)
			ManOnWoman(akTarget, akCaster)
			OnAnyone(akTarget, akCaster)
			bCasterIsPregnant = akCaster.HasSpell(System.StatPregnancyCycle)
		elseif System.IsValidateMaleActor(akCaster)>0
			OnMan(akTarget, akCaster)
			ManOnMan(akTarget, akCaster)
			OnAnyone(akTarget, akCaster)
		endif
	endif
endEvent

Event OnInit()
	if !System || System as Quest==none
		System = Game.GetFormFromFile(0x00001829, "BeeingFemale.esm") as FWSystem
	endIf
	if !Controller || Controller as Quest==none
		Controller=System.Controller
	endif
endEvent

Event WomanOnWoman(actor Target, actor Caster)
endEvent

Event ManOnWoman(actor Target, actor Caster)
endEvent

Event ManOnMan(actor Target, actor Caster)
endEvent

Event WomanOnMan(actor Target, actor Caster)
endEvent

Event OnWoman(actor Target, actor Caster)
endEvent

Event OnMan(actor Target, actor Caster)
endEvent

Event OnAnyone(actor Target, actor Caster)
endEvent
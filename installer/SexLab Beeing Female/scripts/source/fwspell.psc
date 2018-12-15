;/ Decompiled by Champollion V1.0.1
Source   : FWSpell.psc
Modified : 2017-01-13 11:43:03
Compiled : 2017-01-18 08:35:15
User     : admin
Computer : PATRICK
/;
scriptName FWSpell extends activemagiceffect

;-- Properties --------------------------------------
fwcontroller property Controller auto
fwsystem property System auto

;-- Variables ---------------------------------------
Bool bTargetIsPregnant = false
Bool bCasterIsPregnant = false

;-- Functions ---------------------------------------

function OnInit()

	if !System || System as quest == none
		System = game.GetFormFromFile(6185, "BeeingFemale.esm") as fwsystem
	endIf
	if !Controller || Controller as quest == none
		Controller = System.Controller
	endIf
endFunction

function OnAnyone(Actor Target, Actor Caster)

	; Empty function
endFunction

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	if !System || System as quest == none
		System = game.GetFormFromFile(6185, "BeeingFemale.esm") as fwsystem
	endIf
	if !Controller || Controller as quest == none
		Controller = System.Controller
	endIf
	if System.IsValidateFemaleActor(akTarget, false) > 0
		bTargetIsPregnant = akTarget.HasSpell(System.StatPregnancyCycle as form)
		if System.IsValidateFemaleActor(akCaster, false) > 0
			self.OnWoman(akTarget, akCaster)
			self.WomanOnWoman(akTarget, akCaster)
			self.OnAnyone(akTarget, akCaster)
			bCasterIsPregnant = akCaster.HasSpell(System.StatPregnancyCycle as form)
		elseIf System.IsValidateMaleActor(akCaster, false) > 0
			self.OnMan(akTarget, akCaster)
			self.WomanOnMan(akTarget, akCaster)
			self.OnAnyone(akTarget, akCaster)
		endIf
	elseIf System.IsValidateMaleActor(akTarget, false) > 0
		if System.IsValidateFemaleActor(akCaster, false) > 0
			self.OnWoman(akTarget, akCaster)
			self.ManOnWoman(akTarget, akCaster)
			self.OnAnyone(akTarget, akCaster)
			bCasterIsPregnant = akCaster.HasSpell(System.StatPregnancyCycle as form)
		elseIf System.IsValidateMaleActor(akCaster, false) > 0
			self.OnMan(akTarget, akCaster)
			self.ManOnMan(akTarget, akCaster)
			self.OnAnyone(akTarget, akCaster)
		endIf
	endIf
endFunction

function WomanOnWoman(Actor Target, Actor Caster)

	; Empty function
endFunction

function ManOnMan(Actor Target, Actor Caster)

	; Empty function
endFunction

function OnWoman(Actor Target, Actor Caster)

	; Empty function
endFunction

function OnMan(Actor Target, Actor Caster)

	; Empty function
endFunction

function ManOnWoman(Actor Target, Actor Caster)

	; Empty function
endFunction

; Skipped compiler generated GetState

function WomanOnMan(Actor Target, Actor Caster)

	; Empty function
endFunction

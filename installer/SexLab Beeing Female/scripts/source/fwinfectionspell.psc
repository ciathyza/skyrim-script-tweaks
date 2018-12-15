;/ Decompiled by Champollion V1.0.1
Source   : FWInfectionSpell.psc
Modified : 2017-01-13 12:05:26
Compiled : 2017-01-18 08:35:26
User     : admin
Computer : PATRICK
/;
scriptName FWInfectionSpell extends FWSpell

;-- Properties --------------------------------------
potion[] property HealDrink auto

;-- Variables ---------------------------------------
actor ActorRef
Float CurDamage = 1.00000

;-- Functions ---------------------------------------

function OnMan(actor akTarget, actor akCaster)

	self.Dispel()
endFunction

function OnWoman(actor akTarget, actor akCaster)

	ActorRef = akTarget
	self.RegisterForSingleUpdateGameTime(1.00000)
endFunction

function OnSpellCast(Form akSpell)

	Int i = HealDrink.length
	while i > 0
		i -= 1
		if akSpell == HealDrink[i] as Form
			self.Dispel()
		endIf
	endWhile
endFunction

function OnUpdateGameTime()

	System.doDamage(ActorRef, CurDamage * System.getDamageScale(5, ActorRef), 13, 0.000000)
	if CurDamage < 15.0000
		CurDamage += 1.00000
	elseIf CurDamage >= 15.0000 && CurDamage < 35.0000
		CurDamage += 1.20000
	elseIf CurDamage >= 35.0000 && CurDamage < 50.0000
		CurDamage += 1.80000
	elseIf CurDamage >= 50.0000
		CurDamage += 2.50000
	else
		CurDamage += 1.00000
	endIf
	self.RegisterForSingleUpdateGameTime(1.00000)
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

;/ Decompiled by Champollion V1.0.1
Source   : FWBabyHealth.psc
Modified : 2016-12-06 03:53:07
Compiled : 2017-01-18 08:35:49
User     : admin
Computer : PATRICK
/;
scriptName FWBabyHealth extends FWSpell

;-- Properties --------------------------------------
Bool property DamageBaby = false auto
Bool property StartCombat = false auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnWoman(Actor akTarget, Actor akCaster)

	if akTarget == none
		return 
	endIf
	Float mag = self.GetMagnitude()
	if DamageBaby == true
		if mag > 0.000000
			System.Controller.DamageBaby(akTarget, mag)
			if akTarget != akCaster && akCaster != none && StartCombat == true
				akTarget.StartCombat(akCaster)
			endIf
		elseIf mag < 0.000000
			System.Controller.HealBaby(akTarget, mag * -1.00000)
		endIf
	elseIf mag < 0.000000
		System.Controller.DamageBaby(akTarget, mag * -1.00000)
		if akTarget != akCaster && akCaster != none && StartCombat == true
			akTarget.StartCombat(akCaster)
		endIf
	elseIf mag > 0.000000
		System.Controller.HealBaby(akTarget, mag)
	endIf
endFunction

; Skipped compiler generated GotoState

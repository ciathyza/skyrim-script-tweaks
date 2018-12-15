;/ Decompiled by Champollion V1.0.1
Source   : FWTest_CastSpell.psc
Modified : 2015-04-27 08:52:01
Compiled : 2017-01-18 08:35:04
User     : admin
Computer : PATRICK
/;
scriptName FWTest_CastSpell extends activemagiceffect

;-- Properties --------------------------------------
spell property TestSpell auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	if TestSpell != none
		TestSpell.Cast(akCaster as objectreference, akTarget as objectreference)
	endIf
endFunction

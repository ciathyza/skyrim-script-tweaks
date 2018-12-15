;/ Decompiled by Champollion V1.0.1
Source   : FWEffectMenstruationBlood.psc
Modified : 2017-01-13 12:05:27
Compiled : 2017-01-18 08:35:26
User     : admin
Computer : PATRICK
/;
scriptName FWEffectMenstruationBlood extends ActiveMagicEffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
Actor a

;-- Functions ---------------------------------------

function OnUpdate()

	if !a || a.IsSwimming()
		self.Dispel()
	endIf
	self.RegisterForSingleUpdate(2.00000)
endFunction

function OnEffectStart(Actor target, Actor caster)

	a = target
	self.RegisterForSingleUpdate(2.00000)
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectMenstruationHeadage.psc
Modified : 2016-12-06 03:52:27
Compiled : 2017-01-15 06:28:46
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectMenstruationHeadage extends activemagiceffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
actor PlayerRef

;-- Functions ---------------------------------------

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	self.RegisterForSingleUpdateGameTime(1.40000)
endFunction

; Skipped compiler generated GetState

function OnEffectFinish(actor target, actor caster)

	self.UnregisterForUpdateGameTime()
endFunction

; Skipped compiler generated GotoState

function OnUpdateGameTime()

	if PlayerRef
		PlayerRef.DamageActorValue("magicka", PlayerRef.GetBaseActorValue("magicka") / 100.000 * 20.0000)
		self.RegisterForSingleUpdateGameTime(1.40000)
	else
		self.Dispel()
	endIf
endFunction

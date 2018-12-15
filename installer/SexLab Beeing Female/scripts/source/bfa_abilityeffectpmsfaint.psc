;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSFaint.psc
Modified : 2016-12-06 03:52:20
Compiled : 2017-01-15 06:28:43
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSFaint extends activemagiceffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
actor PlayerRef

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		PlayerRef.ModActorValue("Carryweight", -50.0000)
		PlayerRef.ModActorValue("Stamina", -80.0000)
		PlayerRef.ModActorValue("StaminaRateMult", -20.0000)
		self.RegisterForSingleUpdateGameTime(2.00000)
	else
		self.Dispel()
	endIf
endFunction

function OnEffectFinish(actor target, actor caster)

	if PlayerRef
		PlayerRef.ModActorValue("Carryweight", 50.0000)
		PlayerRef.ModActorValue("Stamina", 80.0000)
		PlayerRef.ModActorValue("StaminaRateMult", 20.0000)
	endIf
endFunction

; Skipped compiler generated GotoState

function onUpdateGameTime()

	if PlayerRef
		PlayerRef.DamageActorValue("Stamina", PlayerRef.GetBaseActorValue("Stamina") / 100.000 * 20.0000)
		self.RegisterForSingleUpdateGameTime(2.00000)
	else
		self.Dispel()
	endIf
endFunction

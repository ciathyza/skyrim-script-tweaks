;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSPowerless.psc
Modified : 2016-12-06 03:52:14
Compiled : 2017-01-15 06:28:41
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSPowerless extends activemagiceffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
actor PlayerRef

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		PlayerRef.ModActorValue("Carryweight", -50.0000)
		PlayerRef.ModActorValue("DestructionMod", -0.100000)
		PlayerRef.ModActorValue("OneHandedMod", -0.300000)
		PlayerRef.ModActorValue("TwoHandedMod", -0.300000)
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GetState

function OnEffectFinish(actor target, actor caster)

	if PlayerRef
		PlayerRef.ModActorValue("Carryweight", 50.0000)
		PlayerRef.ModActorValue("DestructionMod", 0.100000)
		PlayerRef.ModActorValue("OneHandedMod", 0.300000)
		PlayerRef.ModActorValue("TwoHandedMod", 0.300000)
	endIf
endFunction

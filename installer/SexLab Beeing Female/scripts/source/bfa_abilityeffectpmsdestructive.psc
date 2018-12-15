;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSDestructive.psc
Modified : 2016-12-06 03:52:22
Compiled : 2017-01-15 06:28:44
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSDestructive extends activemagiceffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
actor PlayerRef

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		PlayerRef.ModActorValue("DestructionMod", 0.300000)
		PlayerRef.ModActorValue("OneHandedMod", 0.200000)
		PlayerRef.ModActorValue("TwoHandedMod", 0.200000)
		PlayerRef.ModActorValue("IllusionMod", 0.300000)
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GotoState

function OnEffectFinish(actor target, actor caster)

	if PlayerRef
		PlayerRef.ModActorValue("DestructionMod", -0.300000)
		PlayerRef.ModActorValue("OneHandedMod", -0.200000)
		PlayerRef.ModActorValue("TwoHandedMod", -0.200000)
		PlayerRef.ModActorValue("IllusionMod", -0.300000)
	endIf
endFunction

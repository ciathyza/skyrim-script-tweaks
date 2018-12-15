;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSDisqualify.psc
Modified : 2016-12-06 03:52:20
Compiled : 2017-01-15 06:28:43
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSDisqualify extends activemagiceffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
actor PlayerRef

;-- Functions ---------------------------------------

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		PlayerRef.ModActorValue("AlchemyMod", -0.300000)
		PlayerRef.ModActorValue("SmithingMod", -0.200000)
		PlayerRef.ModActorValue("EnchantingMod", -0.200000)
	endIf
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnEffectFinish(actor target, actor caster)

	if PlayerRef
		PlayerRef.ModActorValue("AlchemyMod", 0.300000)
		PlayerRef.ModActorValue("SmithingMod", 0.200000)
		PlayerRef.ModActorValue("EnchantingMod", 0.200000)
	endIf
endFunction

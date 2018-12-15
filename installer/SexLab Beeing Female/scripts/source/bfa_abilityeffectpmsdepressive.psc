;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSDepressive.psc
Modified : 2016-12-06 03:52:22
Compiled : 2017-01-15 06:28:44
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSDepressive extends activemagiceffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
Float ModHealthAmount
Float ModHealthRegenAmount
actor PlayerRef

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		ModHealthAmount = PlayerRef.GetBaseActorValue("Health") * 0.300000
		ModHealthRegenAmount = PlayerRef.GetBaseActorValue("HealRate") * 0.400000
		PlayerRef.ModActorValue("Health", -ModHealthAmount)
		PlayerRef.ModActorValue("HealRate", -ModHealthRegenAmount)
	else
		self.Dispel()
	endIf
endFunction

function OnEffectFinish(actor target, actor caster)

	if PlayerRef
		PlayerRef.ModActorValue("Health", ModHealthAmount)
		PlayerRef.ModActorValue("HealRate", ModHealthRegenAmount)
	endIf
endFunction

; Skipped compiler generated GetState

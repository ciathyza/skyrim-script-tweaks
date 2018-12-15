;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSHustleBustle.psc
Modified : 2016-12-06 03:52:18
Compiled : 2017-01-15 06:28:41
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSHustleBustle extends activemagiceffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
actor PlayerRef
Float SpeedMultMod

;-- Functions ---------------------------------------

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		PlayerRef.ModActorValue("Stamina", 60.0000)
		PlayerRef.ModActorValue("StaminaRateMult", 60.0000)
		SpeedMultMod = PlayerRef.GetBaseActorValue("SpeedMult") * 0.0800000
		PlayerRef.ModActorValue("SpeedMult", SpeedMultMod)
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectFinish(actor target, actor caster)

	if PlayerRef
		PlayerRef.ModActorValue("Stamina", -60.0000)
		PlayerRef.ModActorValue("StaminaRateMult", -60.0000)
		PlayerRef.ModActorValue("SpeedMult", -SpeedMultMod)
	endIf
endFunction

;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSHeadageHurts.psc
Modified : 2016-12-06 03:52:19
Compiled : 2017-01-15 06:28:43
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSHeadageHurts extends activemagiceffect

;-- Properties --------------------------------------
Int property MaxCount = 4 auto
fwaddonmanager property Manager auto

;-- Variables ---------------------------------------
actor PlayerRef
Int count

;-- Functions ---------------------------------------

Bool function isFormValid()

	return PlayerRef as form != none && PlayerRef.GetLeveledActorBase() != none
endFunction

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		self.RegisterForSingleUpdateGameTime(1.00000)
	else
		self.Dispel()
	endIf
endFunction

function OnEffectFinish(actor target, actor caster)

	if self.isFormValid()
		self.UnregisterForUpdateGameTime()
	endIf
endFunction

function onUpdate()

	if PlayerRef as Bool && self.isFormValid()
		PlayerRef.DamageActorValue("magicka", PlayerRef.GetBaseActorValue("magicka") / 100.000 * 10.0000)
		PlayerRef.DamageActorValue("Health", PlayerRef.GetBaseActorValue("Health") / 100.000 * 4.00000 * Manager.getActorDamageScale(2, PlayerRef))
		count += 1
		if count <= MaxCount
			self.RegisterForSingleUpdate(4.00000)
		endIf
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GetState

function OnUpdateGameTime()

	if PlayerRef as Bool && self.isFormValid()
		Int v = utility.RandomInt(0, 5)
		if v > 4
			count = 0
			self.RegisterForSingleUpdate(4.00000)
		elseIf v > 2
			PlayerRef.DamageActorValue("magicka", PlayerRef.GetBaseActorValue("magicka") / 100.000 * 30.0000)
		endIf
		self.RegisterForSingleUpdateGameTime(1.00000)
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GotoState

;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSAlgesic.psc
Modified : 2016-12-06 03:52:26
Compiled : 2017-01-15 06:28:44
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSAlgesic extends activemagiceffect

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
Float PoisonResistMod
actor PlayerRef
Float FrostResistMod
Float MagicResistMod
Float DamageResistMod
Float ElectricResistMod
Float FireResistMod

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectFinish(actor target, actor caster)

	if PlayerRef
		PlayerRef.ModActorValue("DamageResist", DamageResistMod)
		PlayerRef.ModActorValue("PoisonResist", PoisonResistMod)
		PlayerRef.ModActorValue("FireResist", FireResistMod)
		PlayerRef.ModActorValue("ElectricResist", ElectricResistMod)
		PlayerRef.ModActorValue("FrostResist", FrostResistMod)
		PlayerRef.ModActorValue("MagicResist", MagicResistMod)
	endIf
endFunction

; Skipped compiler generated GetState

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		DamageResistMod = PlayerRef.GetBaseActorValue("DamageResist") * 0.300000
		PoisonResistMod = PlayerRef.GetBaseActorValue("PoisonResist") * 0.300000
		FireResistMod = PlayerRef.GetBaseActorValue("FireResist") * 0.300000
		ElectricResistMod = PlayerRef.GetBaseActorValue("ElectricResist") * 0.300000
		FrostResistMod = PlayerRef.GetBaseActorValue("FrostResist") * 0.300000
		MagicResistMod = PlayerRef.GetBaseActorValue("MagicResist") * 0.300000
		PlayerRef.ModActorValue("DamageResist", -DamageResistMod)
		PlayerRef.ModActorValue("PoisonResist", -PoisonResistMod)
		PlayerRef.ModActorValue("FireResist", -FireResistMod)
		PlayerRef.ModActorValue("ElectricResist", -ElectricResistMod)
		PlayerRef.ModActorValue("FrostResist", -FrostResistMod)
		PlayerRef.ModActorValue("MagicResist", -MagicResistMod)
	else
		self.Dispel()
	endIf
endFunction

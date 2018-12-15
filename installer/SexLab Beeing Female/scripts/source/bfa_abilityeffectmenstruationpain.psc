;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectMenstruationPain.psc
Modified : 2016-12-06 03:52:26
Compiled : 2017-01-15 06:28:46
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectMenstruationPain extends activemagiceffect

;-- Properties --------------------------------------
fwsystem property System auto

;-- Variables ---------------------------------------
Float BaseDamageScale
Float DamageScale
Actor PlayerRef

;-- Functions ---------------------------------------

function OnUpdateGameTime()

	if PlayerRef
		if System.cfg.MenstrualCramps > utility.RandomFloat(0.000000, 99.0000)
			DamageScale = utility.RandomFloat(0.100000, 1.50000) * BaseDamageScale
			if DamageScale < 0.100000
				DamageScale = 0.100000
			endIf
			Int c = utility.RandomInt(0, 10)
			if c >= 9
				System.doDamage(PlayerRef, 6.00000, 3, 0.000000)
				System.PlayPainSound(PlayerRef, 30.0000)
			elseIf c >= 6
				System.doDamage(PlayerRef, 4.00000, 3, 0.000000)
			endIf
		endIf
		self.RegisterForSingleUpdateGameTime(2.60000)
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GetState

function OnEffectStart(Actor target, Actor caster)

	PlayerRef = target
	if PlayerRef
		self.RegisterForSingleUpdateGameTime(2.60000)
		BaseDamageScale = utility.RandomFloat(0.100000, 2.50000)
		if PlayerRef == game.GetPlayer()
			BaseDamageScale = System.Player.stateDamageScale
		endIf
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GotoState

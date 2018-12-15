;/ Decompiled by Champollion V1.0.1
Source   : FWSpellExtraLife.psc
Modified : 2017-01-13 11:43:00
Compiled : 2017-01-18 08:35:12
User     : admin
Computer : PATRICK
/;
scriptName FWSpellExtraLife extends ActiveMagicEffect

;-- Properties --------------------------------------
Float property CoolDown auto
Float property HealPercent auto
Float property MagickaPercent auto

;-- Variables ---------------------------------------
actor me
Bool bCanHeal = true

;-- Functions ---------------------------------------

function OnUpdate()

	bCanHeal = true
endFunction

function OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	self.CheckHealing()
endFunction

; Skipped compiler generated GetState

function CheckHealing()

	Float h = me.GetActorValuePercentage("Health")
	if bCanHeal == true && h < 0.0800000
		Float baseHealing = 0.000000
		if h < 0.000000
			baseHealing = h * -1.00000 * me.GetBaseActorValue("Health")
		endIf
		me.RestoreActorValue("Health", HealPercent / 100.000 * me.GetBaseActorValue("Health") + baseHealing)
		me.RestoreActorValue("Magicka", MagickaPercent / 100.000 * me.GetBaseActorValue("Magicka"))
		bCanHeal = false
		self.RegisterForSingleUpdate(CoolDown)
	endIf
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	if HealPercent <= 0.000000
		HealPercent = self.GetMagnitude()
	endIf
	me = akTarget
endFunction

; Skipped compiler generated GotoState

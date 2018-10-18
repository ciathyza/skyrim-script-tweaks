;/ Decompiled by Champollion V1.0.0
Source   : ADVSitFast_FollowerV2.psc
Modified : 2014-07-18 22:30:14
Compiled : 2014-07-20 00:21:45
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVSitFast_FollowerV2 extends ReferenceAlias

;-- Properties --------------------------------------
topic property CHATTERweird auto
actor property ActiveHost auto hidden
faction property FACTanalized auto
faction property Follower auto
spell property SPELLparalysisFull auto
quest property Master auto
magiceffect property MEparaStance auto
spell property SPELLparalysis auto
magiceffect property MEparaStanceFull auto
actor property player auto hidden

;-- Variables ---------------------------------------
actor Attacker
Float COOLDOWN
Int ParaChance

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function Terminate()

	if ActiveHost.getSitState() != 0
		debug.sendAnimationEvent(ActiveHost as objectreference, "IdleChairExitStart")
	endIf
	ActiveHost.removeFromFaction(Follower)
	self.unregisterForUpdate()
endFunction

function OnHit(objectreference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	Attacker = akAggressor as actor
	if ActiveHost.hasMagicEffect(MEparaStance) == true || ActiveHost.hasMagicEffect(MEparaStanceFull) == true
		if utility.getCurrentRealTime() > COOLDOWN
			if ActiveHost.hasMagicEffect(MEparaStanceFull) == true
				ParaChance = utility.randomInt(-3, 1)
				if ParaChance > 0
					SPELLparalysisFull.Cast(Attacker as objectreference, none)
					COOLDOWN = utility.getCurrentRealTime() + 18 as Float
					ParaChance = 0
				endIf
			elseIf ActiveHost.hasMagicEffect(MEparaStance) == true
				ParaChance = utility.randomInt(-4, 1)
				if ParaChance > 0
					SPELLparalysis.Cast(Attacker as objectreference, none)
					COOLDOWN = utility.getCurrentRealTime() + 33 as Float
					ParaChance = 0
				endIf
			elseIf utility.getCurrentRealTime() < COOLDOWN
				COOLDOWN = 0 as Float
			endIf
		endIf
	endIf
endFunction

function Initialize()

	player = game.getPlayer()
	ActiveHost = self.getRef() as actor
	utility.wait(1 as Float)
	ActiveHost.say(CHATTERweird, none, false)
	debug.sendAnimationEvent(ActiveHost as objectreference, "IdleSurrender")
endFunction

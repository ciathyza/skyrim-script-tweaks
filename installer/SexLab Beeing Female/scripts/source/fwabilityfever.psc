;/ Decompiled by Champollion V1.0.1
Source   : FWAbilityFever.psc
Modified : 2016-12-06 03:53:17
Compiled : 2017-01-18 08:36:40
User     : admin
Computer : PATRICK
/;
scriptName FWAbilityFever extends FWSpell

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
Int SkipChance = 20
actor ActorRef
Bool IsPlayer = false
Float Interval = 0.400000

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnWoman(actor akTarget, actor akCaster)

	IsPlayer = akTarget == game.GetPlayer()
	ActorRef = akTarget
	self.CastMe()
endFunction

function OnUpdateGameTime()

	self.CastMe()
endFunction

function CastMe()

	if utility.RandomInt(0, 100) > SkipChance
		if SkipChance < 70
			SkipChance += utility.RandomInt(0, 2)
		endIf
		if IsPlayer
			System.AbortusFever.Apply(utility.RandomFloat(0.300000, 1.00000))
		endIf
	endIf
	if Interval < 2.00000
		Interval += utility.RandomFloat(0.100000, 0.600000)
	else
		self.Dispel()
	endIf
	self.RegisterForSingleUpdateGameTime(Interval)
endFunction

; Skipped compiler generated GetState

function OnMan(actor akTarget, actor akCaster)

	self.Dispel()
endFunction

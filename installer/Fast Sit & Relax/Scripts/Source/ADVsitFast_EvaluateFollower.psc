;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_EvaluateFollower.psc
Modified : 2014-06-01 19:13:38
Compiled : 2014-07-20 00:22:10
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_EvaluateFollower extends ActiveMagicEffect

;-- Properties --------------------------------------
effectshader property PMSBLUE auto
topic property Weird auto
faction property Follower auto
referencealias property Follower04 auto
faction property ClassMage auto
referencealias property Follower02 auto
faction property ClassWarrior auto
referencealias property Follower05 auto
actor property ActiveTarget auto hidden
message property MSGunregister auto
spell property SelfSpell auto
message property MSGregisterFemale auto
globalvariable property Registered auto
sound property SFXunregister auto
referencealias property Follower06 auto
referencealias property Follower03 auto
message property MSGregister auto
actor property player auto hidden
referencealias property Follower01 auto
sound property SFXregister auto
referencealias property ALIASactorName auto
faction property ClassArcher auto
message property MSGregisterClass auto
visualeffect property VEapply auto

;-- Variables ---------------------------------------
Bool Unregister
Int BUTTON

;-- Functions ---------------------------------------

function ClassSelect()

	BUTTON = MSGregisterClass.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	if BUTTON == 0
		ActiveTarget.addToFaction(ClassArcher)
	elseIf BUTTON == 1
		ActiveTarget.addToFaction(ClassMage)
	elseIf BUTTON == 2
		ActiveTarget.addToFaction(ClassWarrior)
	endIf
	self.FillAlias()
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	if akTarget != game.getPlayer() && akTarget.isDead() == false
		ActiveTarget = akTarget
		ALIASactorName.ForceRefTo(ActiveTarget as objectreference)
		utility.wait(0.500000)
		self.ShowMenu()
	endIf
endFunction

; Skipped compiler generated GetState

function ApplyVisuals()

	SFXregister.play(ActiveTarget as objectreference)
	PMSBLUE.play(ActiveTarget as objectreference, 3 as Float)
	utility.wait(0.150000)
	game.ShakeCamera(none, 0.850000, 0.500000)
endFunction

function FillAlias()

	if Follower01.getRef() == none
		Follower01.ForceRefTo(ActiveTarget as objectreference)
		(Follower01 as advsitfast_followerv2).Initialize()
		self.ApplyVisuals()
		return 
	endIf
	if Follower02.getRef() == none
		Follower02.ForceRefTo(ActiveTarget as objectreference)
		(Follower02 as advsitfast_followerv2).Initialize()
		self.ApplyVisuals()
		return 
	endIf
	if Follower03.getRef() == none
		Follower03.ForceRefTo(ActiveTarget as objectreference)
		(Follower03 as advsitfast_followerv2).Initialize()
		self.ApplyVisuals()
		return 
	endIf
	if Follower04.getRef() == none
		Follower04.ForceRefTo(ActiveTarget as objectreference)
		(Follower04 as advsitfast_followerv2).Initialize()
		self.ApplyVisuals()
		return 
	endIf
	if Follower05.getRef() == none
		Follower05.ForceRefTo(ActiveTarget as objectreference)
		(Follower05 as advsitfast_followerv2).Initialize()
		self.ApplyVisuals()
		return 
	endIf
	if Follower06.getRef() == none
		Follower06.ForceRefTo(ActiveTarget as objectreference)
		(Follower06 as advsitfast_followerv2).Initialize()
		self.ApplyVisuals()
		return 
	endIf
endFunction

function ShowMenu()

	if ActiveTarget.isInFaction(Follower) == 0 as Bool
		if Registered.getValue() != 6 as Float
			actorbase ActiveBase = ActiveTarget.GetLeveledActorBase()
			if ActiveBase.GetSex() == 0
				BUTTON = MSGregister.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			else
				BUTTON = MSGregisterFemale.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			endIf
		else
			debug.Messagebox("Whoops! All slots taken. Please unregister someone.")
		endIf
	else
		Unregister = true
		BUTTON = MSGunregister.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf
	if Unregister == false
		if Registered.getValue() != 6 as Float
			if BUTTON != 3
				Registered.setValue(Registered.getValue() + 1 as Float)
				ActiveTarget.addToFaction(Follower)
				utility.wait(0.100000)
				ActiveTarget.modFactionRank(Follower, BUTTON)
				utility.wait(0.100000)
				self.FillAlias()
			endIf
		endIf
	elseIf BUTTON == 0
		Registered.setValue(Registered.getValue() - 1 as Float)
		ActiveTarget.removeFromFaction(Follower)
		VEapply.play(ActiveTarget as objectreference, 1 as Float, none)
		SFXunregister.play(ActiveTarget as objectreference)
		debug.sendAnimationEvent(ActiveTarget as objectreference, "IdleSalute")
		game.ShakeCamera(none, 0.250000, 0.250000)
		if ActiveTarget as objectreference == Follower01.getRef()
			(Follower01 as advsitfast_followerv2).terminate()
			utility.wait(0.250000)
			Follower01.clear()
		elseIf ActiveTarget as objectreference == Follower02.getRef()
			(Follower02 as advsitfast_followerv2).terminate()
			utility.wait(0.250000)
			Follower02.clear()
		elseIf ActiveTarget as objectreference == Follower03.getRef()
			(Follower03 as advsitfast_followerv2).terminate()
			utility.wait(0.250000)
			Follower03.clear()
		elseIf ActiveTarget as objectreference == Follower04.getRef()
			(Follower04 as advsitfast_followerv2).terminate()
			utility.wait(0.250000)
			Follower04.clear()
		elseIf ActiveTarget as objectreference == Follower05.getRef()
			(Follower05 as advsitfast_followerv2).terminate()
			utility.wait(0.250000)
			Follower05.clear()
		elseIf ActiveTarget as objectreference == Follower06.getRef()
			(Follower06 as advsitfast_followerv2).terminate()
			utility.wait(0.250000)
			Follower06.clear()
		endIf
	endIf
endFunction

; Skipped compiler generated GotoState

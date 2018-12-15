;/ Decompiled by Champollion V1.0.1
Source   : FWAbilityBeeingMale.psc
Modified : 2016-12-06 03:53:19
Compiled : 2017-01-18 08:36:44
User     : admin
Computer : PATRICK
/;
scriptName FWAbilityBeeingMale extends FWAbilityBeeingBase

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnUpdate()

	if !self.isFormValid()
		return 
	endIf
	parent.OnUpdate()
endFunction

; Skipped compiler generated GotoState

function OnUpdateGameTime()

	if !self.isFormValid()
		return 
	endIf
	if ActorRef == none
		self.Dispel()
		return 
	endIf
	if System == none
		return 
	endIf
	if System.Controller == none
		return 
	endIf
	System.Controller.UpdateParentFaction(ActorRef)
	if ActorRef.GetLeveledActorBase().GetSex() != 0
		if ActorRef.HasSpell(System.BeeingFemaleSpell as form) == false
			if System.IsValidateActor(ActorRef, false) > 0
				ActorRef.AddSpell(System.BeeingFemaleSpell, true)
			endIf
		endIf
		ActorRef.RemoveSpell(System.BeeingMaleSpell)
		ActorRef.DispelSpell(System.BeeingMaleSpell)
	endIf
	if IsPlayer
		if System.PlayerMale == none
			System.PlayerMale = self
			System.Player = none
		endIf
	endIf
endFunction

Bool function isFormValid()

	return ActorRef as form != none && ActorRefBase as actorbase != none
endFunction

function OnPlayerLoadGame()

	if bInit == true && bInitSpell == true && self as activemagiceffect != none
		utility.WaitMenuMode(1.00000)
		IsFollower = ActorRef.IsInFaction(System.FollowerFaction) && IsPlayer == false
		System.Controller.UpdateParentFaction(ActorRef)
		if !self.isFormValid()
			self.Dispel()
			debug.Trace("BeeingMale: OnPlayerloadgame on None Actor - Dispel", 0)
			return 
		elseIf self as FWAbilityBeeingMale != none
			(self as activemagiceffect).UnregisterForUpdateGameTime()
			(self as activemagiceffect).RegisterForupdateGameTime(2.00000)
			(self as activemagiceffect).UnregisterForUpdate()
			(self as activemagiceffect).RegisterForUpdate(5.00000)
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function OnEffectFinish(Actor akTarget, Actor akCaster)

	if self as activemagiceffect != none && self.isFormValid()
		if System
			if System.PlayerMale == self
				System.PlayerMale = none
			endIf
			if ActorRef
				ActorRef.RemoveSpell(System.BeeingMaleSpell)
				ActorRef.DispelSpell(System.BeeingMaleSpell)
			endIf
		endIf
	else
		debug.Trace("BeeingFemale: Orphaned BeeingMale OnEffectFinish", 0)
	endIf
endFunction

function OnEffectStart(Actor akTarget, Actor akCaster)

	if System.ModEnabled.GetValueInt() != 1
		akTarget.RemoveSpell(System.BeeingMaleSpell)
		akTarget.DispelSpell(System.BeeingMaleSpell)
		return 
	endIf
	if akTarget as form == none
		debug.Trace("BeeingMale: OnEffectStart Actor's Form = none : Dispel", 0)
		self.Dispel()
		return 
	endIf
	IsPlayer = akTarget == game.GetPlayer()
	ActorRef = akTarget
	ActorRefBase = akTarget.GetLeveledActorBase()
	if System.IsValidateMaleActor(akTarget, false) < 0
		ActorRef.RemoveSpell(System.BeeingMaleSpell)
		ActorRef.DispelSpell(System.BeeingMaleSpell)
		return 
	endIf
	if IsPlayer
		System.PlayerMale = self
		System.Player = none
	endIf
	self.equipChild()
	bInitSpell = true
	self.OnPlayerLoadGame()
endFunction

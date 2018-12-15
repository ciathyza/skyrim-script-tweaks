;/ Decompiled by Champollion V1.0.1
Source   : FWAbilityBeeingNUFemale.psc
Modified : 2017-01-10 13:18:36
Compiled : 2017-01-18 08:36:42
User     : admin
Computer : PATRICK
/;
scriptName FWAbilityBeeingNUFemale extends ActiveMagicEffect

;-- Properties --------------------------------------
fwsystem property System auto

;-- Variables ---------------------------------------
Bool IsCreature = false
Float lastTimeGaveExp = 0.000000
actor ActorRef

;-- Functions ---------------------------------------

function GiveItems_DifficultyEasy(actor akTarget)

	if utility.RandomInt(0, 7) >= 4
		Int rnd1 = utility.RandomInt(0, 20)
		Int rnd2 = utility.RandomInt(0, 20)
		Int rnd3 = utility.RandomInt(0, 50)
		if rnd1 >= 18
			akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(3, 8), true)
		elseIf rnd1 >= 14
			akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(2, 6), true)
		elseIf rnd1 >= 9
			akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(1, 4), true)
		elseIf rnd1 >= 6
			akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(1, 2), true)
		else
			akTarget.AddItem(System.Tampon_Normal as form, 1, true)
		endIf
		if rnd2 >= 18
			akTarget.AddItem(System.ContraceptionMid as form, utility.RandomInt(1, 2), true)
		elseIf rnd2 >= 12
			akTarget.AddItem(System.ContraceptionLow as form, utility.RandomInt(1, 3), true)
		elseIf rnd2 >= 8
			akTarget.AddItem(System.ContraceptionLow as form, 1, true)
		endIf
		if rnd3 > 39
			akTarget.AddItem(System.CallChildren2 as form, 1, true)
		endIf
	endIf
endFunction

function OnInit()

	self.RegisterForSleep()
endFunction

function OnDeath(actor akKiller)

	fwchildactor ca = akKiller as fwchildactor
	if ca != none
		ca.AddExp((ActorRef.GetLevel() * 2) as Float)
	endIf
endFunction

function OnHit(ObjectReference akAggressor, form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	fwchildactor ca = akAggressor as fwchildactor
	if ca != none
		Float t = utility.GetCurrentRealTime()
		if t > lastTimeGaveExp + 1.00000
			if abPowerAttack || abSneakAttack || abBashAttack && abHitBlocked == false
				ca.AddExp((ActorRef.GetLevel() / 5) as Float)
				lastTimeGaveExp = t
			elseIf abHitBlocked == true
				ca.AddExp((ActorRef.GetLevel() / 25) as Float)
				lastTimeGaveExp = t
			else
				ca.AddExp((ActorRef.GetLevel() / 15) as Float)
				lastTimeGaveExp = t
			endIf
		endIf
	endIf
endFunction

; Skipped compiler generated GotoState

function GiveItems_DifficultyHeavy(actor akTarget)

	; Empty function
endFunction

function GiveItems_DifficultyAdvanced(actor akTarget)

	if utility.RandomInt(0, 9) >= 8
		Int rnd1 = utility.RandomInt(0, 30)
		Int rnd2 = utility.RandomInt(0, 30)
		Int rnd3 = utility.RandomInt(0, 50)
		if rnd1 >= 27
			akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(2, 4), true)
		elseIf rnd1 >= 21
			akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(1, 2), true)
		else
			akTarget.AddItem(System.Tampon_Normal as form, 1, true)
		endIf
		if rnd2 >= 28
			akTarget.AddItem(System.ContraceptionMid as form, utility.RandomInt(1, 2), true)
		elseIf rnd2 >= 23
			akTarget.AddItem(System.ContraceptionLow as form, utility.RandomInt(1, 3), true)
		elseIf rnd2 >= 12
			akTarget.AddItem(System.ContraceptionLow as form, 1, true)
		endIf
		if rnd3 > 48
			akTarget.AddItem(System.CallChildren2 as form, 1, true)
		endIf
	endIf
endFunction

function GiveItems_DifficultyNormal(actor akTarget)

	if utility.RandomInt(0, 5) >= 4
		Int rnd1 = utility.RandomInt(0, 20)
		Int rnd2 = utility.RandomInt(0, 20)
		Int rnd3 = utility.RandomInt(0, 50)
		if rnd1 >= 18
			akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(2, 4), true)
		elseIf rnd1 >= 12
			akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(1, 2), true)
		else
			akTarget.AddItem(System.Tampon_Normal as form, 1, true)
		endIf
		if rnd2 >= 19
			akTarget.AddItem(System.ContraceptionMid as form, utility.RandomInt(1, 2), true)
		elseIf rnd2 >= 14
			akTarget.AddItem(System.ContraceptionLow as form, utility.RandomInt(1, 3), true)
		elseIf rnd2 >= 8
			akTarget.AddItem(System.ContraceptionLow as form, 1, true)
		endIf
		if rnd3 > 45
			akTarget.AddItem(System.CallChildren2 as form, 1, true)
		endIf
	endIf
endFunction

function OnGameLoad()

	self.UnregisterForSleep()
	self.RegisterForSleep()
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	ActorRef = akTarget
	IsCreature = akTarget.GetRace().HasKeywordString("ActorTypeCreature")
	if IsCreature == false
		if System != none
			if System.cfg.NPCHaveItems
				if System.cfg.Difficulty == 0
					self.GiveItems_DifficultyPainless(akTarget)
				elseIf System.cfg.Difficulty == 1
					self.GiveItems_DifficultyEasy(akTarget)
				elseIf System.cfg.Difficulty == 2
					self.GiveItems_DifficultyNormal(akTarget)
				elseIf System.cfg.Difficulty == 3
					self.GiveItems_DifficultyAdvanced(akTarget)
				elseIf System.cfg.Difficulty == 4
					self.GiveItems_DifficultyHeavy(akTarget)
				endIf
			endIf
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function GiveItems_DifficultyPainless(actor akTarget)

	Int rnd1 = utility.RandomInt(0, 20)
	Int rnd2 = utility.RandomInt(0, 20)
	Int rnd3 = utility.RandomInt(0, 50)
	if rnd1 >= 18
		akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(3, 8), true)
	elseIf rnd1 >= 12
		akTarget.AddItem(System.Tampon_Normal as form, utility.RandomInt(2, 5), true)
	else
		akTarget.AddItem(System.Tampon_Normal as form, 2, true)
	endIf
	if rnd2 >= 18
		akTarget.AddItem(System.ContraceptionMid as form, utility.RandomInt(1, 2), true)
	elseIf rnd2 >= 9
		akTarget.AddItem(System.ContraceptionLow as form, utility.RandomInt(1, 3), true)
	elseIf rnd2 >= 3
		akTarget.AddItem(System.ContraceptionLow as form, 1, true)
	endIf
	if rnd3 > 32
		akTarget.AddItem(System.CallChildren2 as form, 1, true)
	endIf
endFunction

;/ Decompiled by Champollion V1.0.1
Source   : FWAbilityBeeingBase.psc
Modified : 2017-01-15 12:21:45
Compiled : 2017-01-18 08:36:47
User     : admin
Computer : PATRICK
/;
scriptName FWAbilityBeeingBase extends ActiveMagicEffect

;-- Properties --------------------------------------
Bool property IsPlayer auto hidden
Bool property bInit = false auto hidden
actorbase property ActorRefBase auto hidden
sound property BBS auto
Bool property bInitSpell = false auto hidden
fwsystem property System auto
Bool property IsFollower auto hidden
actor property ActorRef auto hidden

;-- Variables ---------------------------------------
FormList ItemListFear
FormList ItemListHappy
Float lastTimeGaveExp = 0.000000
spell BabyTalk
Float aPosZ
Bool IsFollower = false
Float nextUpdate
Float aPosX
spell BabyLaugh
Bool IsCreature = false
FormList ItemListSupprised
spell BabyGiggle
spell BabyAmuse
spell BabyDrink
spell BabyHiccup
actor AbilityBaseActor
Int cBabyHiccup = 0
Bool bSexPartnerOnSleepCh = false
actor aSexPartnerOnSleep
Bool bSexPartnerOnSleep = false
spell BabySupprised
spell BabyCry
Keyword BabyKeyword
spell BabyFear
Bool IsSpouse = false
Bool bIsWearingBaby = false
Float lastMoveTime
Float aPosY
spell BabyHappy

;-- Functions ---------------------------------------

Bool function isBaseFormValid()

	return AbilityBaseActor as Form != none
endFunction

function PlayBabySound_SleepStop()

	if bIsWearingBaby as Bool && IsPlayer == true
		Int rnd = utility.RandomInt(0, 100)
		if rnd > 93
			self.PlayBabySound(BabyCry, true)
		elseIf rnd > 88
			self.PlayBabySound(BabyFear, true)
		elseIf rnd > 85
			self.PlayBabySound(BabyTalk, true)
		elseIf rnd > 79
			self.PlayBabySound(BabyHappy, true)
		elseIf rnd > 72
			self.PlayBabySound(BabyAmuse, true)
		elseIf rnd > 68
			self.PlayBabySound(BabyGiggle, true)
		elseIf rnd > 58
			cBabyHiccup = utility.RandomInt(1, 15)
		endIf
	endIf
endFunction

function OnDeath(actor akKiller)

	fwchildactor ca = akKiller as fwchildactor
	if ca != none
		ca.AddExp((ActorRef.GetLevel() * 2) as Float)
	endIf
endFunction

Bool function CheckNoice_HappyList()

	if ItemListHappy == none
		return false
	endIf
	Float Timer = utility.GetCurrentRealTime()
	if game.FindClosestReferenceOfAnyTypeInListFromRef(ItemListHappy, ActorRef as ObjectReference, 500.000) != none
		self.PlayBabySound(BabyHappy, true)
		return true
	endIf
	return false
endFunction

function OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if bIsWearingBaby == true && System.cfg.ChildrenMayCry == true && IsPlayer == true
		if ItemListFear != none && ItemListFear.Find(akBaseItem) as Bool
			if utility.RandomInt(1, 20) > 13
				self.PlayBabySound(BabyFear, true)
			endIf
		elseIf ItemListHappy != none && ItemListHappy.Find(akBaseItem) as Bool
			if utility.RandomInt(1, 20) > 9
				self.PlayBabySound(BabyHappy, true)
			endIf
		elseIf ItemListSupprised != none && ItemListSupprised.Find(akBaseItem) as Bool
			if utility.RandomInt(1, 20) > 9
				self.PlayBabySound(BabySupprised, true)
			endIf
		endIf
	elseIf akBaseItem.HasKeyword(BabyKeyword)
		self.equipChild()
	endIf
endFunction

function OnActivate(ObjectReference akActionRef)

	if !self.isBaseFormValid()
		return 
	endIf
	self.equipChild()
	if System.MountableRace.find(ActorRef.GetRace(), 0) >= 0
		Int c = storageutil.FormListCount(none, "FW.Babys")
		while c > 0
			c -= 1
			fwchildactor ca = storageutil.FormListGet(none, "FW.Babys", c) as fwchildactor
			if ca != none
				if ca.GetFurnitureReference() != none
					if ca.GetFurnitureReference() == ActorRef as ObjectReference
						ca.Dismount()
						c = 0
					endIf
				endIf
			endIf
		endWhile
	endIf
endFunction

Bool function CheckNoice_Weather()

	weather w = weather.GetCurrentWeather()
	Int c = w.GetClassification()
	Int r = utility.RandomInt(0, 10)
	if c == -1
		
	elseIf c == 0
		if r >= 9
			self.PlayBabySound(BabyHappy, true)
			return true
		elseIf r == 8
			self.PlayBabySound(BabyAmuse, true)
			return true
		elseIf r == 7
			self.PlayBabySound(BabyGiggle, true)
			return true
		elseIf r == 6
			self.PlayBabySound(BabyTalk, true)
			return true
		endIf
	elseIf c == 1
		
	elseIf c == 2
		if r > 9
			self.PlayBabySound(BabyCry, true)
			return true
		endIf
	elseIf c == 3
		if r > 6
			self.PlayBabySound(BabyCry, true)
			return true
		endIf
	endIf
	return false
endFunction

function PlayBabySound_Hiccup()

	self.PlayBabySound(BabyHiccup, true)
endFunction

function OnInit()

	bInit = true
	BabyKeyword = Keyword.GetKeyword("_FWBabyItem")
endFunction

function OnPlayerLoadGame()

	if !self.isBaseFormValid()
		return 
	endIf
	if self as ActiveMagicEffect
		self.UnregisterForSleep()
		self.RegisterForSleep()
	endIf
	self.equipChild()
endFunction

Bool function IsValidatePlayerSexPartner(actor a)

	if a.IsInFaction(System.FollowerFaction)
		if System.cfg.ImpregnatePlayerFollower
			return true
		endIf
	endIf
	if a.IsInFaction(System.PlayerMarriedFaction)
		if System.cfg.ImpregnatePlayerHusband
			return true
		endIf
	endIf
	return System.cfg.ImpregnateLastPlayerNPCs
endFunction

Bool function CheckNoice_ListSupprised()

	if ItemListFear == none
		return false
	endIf
	Float Timer = utility.GetCurrentRealTime()
	if game.FindClosestReferenceOfAnyTypeInListFromRef(ItemListSupprised, ActorRef as ObjectReference, 400.000) != none
		self.PlayBabySound(BabySupprised, true)
		return true
	endIf
	return false
endFunction

Bool function CheckNoice_FearList()

	if ItemListSupprised == none
		return false
	endIf
	Float Timer = utility.GetCurrentRealTime()
	if game.FindClosestReferenceOfAnyTypeInListFromRef(ItemListSupprised, ActorRef as ObjectReference, 2000.00) != none
		self.PlayBabySound(BabyFear, true)
		return true
	endIf
	return false
endFunction

function OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)

	self.PlayBabySound(none, false)
	bSexPartnerOnSleepCh = utility.RandomFloat(0.000000, 99.0000) < System.cfg.ImpregnatePlayerChance as Float
	if IsPlayer as Bool && bSexPartnerOnSleepCh as Bool && System.cfg.RelevantPlayer
		bSexPartnerOnSleep = false
		aSexPartnerOnSleep = none
		Int radius = 320
		if System.cfg.ImpregnatePlayerAmbient
			radius = 2300
		endIf
		actor p = game.GetPlayer()
		if self.CheckSexPartnerOnSleep(game.FindClosestActorFromRef(p as ObjectReference, radius as Float), p)
			System.Message("Found a SexActor when you lay down: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All, 0)
		elseIf self.CheckSexPartnerOnSleep(game.FindRandomActorFromRef(p as ObjectReference, radius as Float), p)
			System.Message("Found a SexActor when you lay down: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All, 0)
		elseIf self.CheckSexPartnerOnSleep(game.FindRandomActorFromRef(p as ObjectReference, radius as Float), p)
			System.Message("Found a SexActor when you lay down: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All, 0)
		endIf
		if p.GetLeveledActorBase().GetSex() == 1 || aSexPartnerOnSleep.GetLeveledActorBase().GetSex() == 1
			aSexPartnerOnSleep = System.Manager.OnSleepSexStart(p, aSexPartnerOnSleep)
		endIf
	endIf
endFunction

function OnUpdate()

	if !self.isBaseFormValid()
		return 
	endIf
	if IsPlayer
		if ActorRef.X > aPosX + 20.0000 || ActorRef.X < aPosX - 20.0000 || ActorRef.Y > aPosY + 20.0000 || ActorRef.Y < aPosY - 20.0000 || ActorRef.Z > aPosZ + 20.0000 || ActorRef.Z < aPosZ - 20.0000
			aPosX = ActorRef.X
			aPosY = ActorRef.Y
			aPosZ = ActorRef.Z
			lastMoveTime = utility.GetCurrentRealTime()
		endIf
	endIf
	if bIsWearingBaby == true && System.cfg.ChildrenMayCry == true && IsPlayer == true
		if cBabyHiccup > 0
			self.PlayBabySound_Hiccup()
			cBabyHiccup -= 1
		elseIf nextUpdate < utility.GetCurrentRealTime()
			Bool bFound = false
			Int itmCount = ActorRef.GetNumItems()
			while itmCount > 0
				itmCount -= 1
				Form f = ActorRef.GetNthForm(itmCount)
				if f.HasKeyword(BabyKeyword) || f.GetName() == "Baby"
					itmCount = 0
					bFound = true
				endIf
			endWhile
			if bFound == false
				bIsWearingBaby = false
				return 
			endIf
			if IsPlayer as Bool && utility.GetCurrentRealTime() - lastMoveTime > 30.0000
				Int rnd = utility.RandomInt(0, 20)
				if rnd > 17
					self.PlayBabySound(BabyCry, true)
				elseIf rnd > 14
					self.PlayBabySound(BabyFear, true)
				elseIf rnd > 12
					cBabyHiccup = utility.RandomInt(2, 8)
				elseIf rnd > 9
					self.PlayBabySound(BabyHappy, true)
				elseIf rnd > 7
					self.PlayBabySound(BabyGiggle, true)
				elseIf rnd > 4
					self.PlayBabySound(BabyAmuse, true)
				else
					self.PlayBabySound(BabyTalk, true)
				endIf
				nextUpdate = utility.GetCurrentRealTime() + utility.RandomFloat(8.00000, 20.0000)
			elseIf self.CheckNoice_Weather()
				nextUpdate = utility.GetCurrentRealTime() + utility.RandomFloat(10.0000, 90.0000)
			elseIf self.CheckNoice_HappyList()
				nextUpdate = utility.GetCurrentRealTime() + utility.RandomFloat(8.00000, 55.0000)
			elseIf self.CheckNoice_ListSupprised()
				nextUpdate = utility.GetCurrentRealTime() + utility.RandomFloat(8.00000, 65.0000)
			elseIf self.CheckNoice_FearList()
				nextUpdate = utility.GetCurrentRealTime() + utility.RandomFloat(5.00000, 120.000)
			endIf
		endIf
	endIf
endFunction

function OnEffectFinish(actor akTarget, actor akCaster)

	; Empty function
endFunction

function PlayBabySound_OnHit()

	Int rnd = utility.RandomInt(0, 7)
	if rnd == 7
		self.PlayBabySound(BabyCry, true)
	elseIf rnd == 6
		self.PlayBabySound(BabyFear, true)
	endIf
endFunction

function DispatchBabySoundFromUser(spell SoundSpell, spell ignoreSpell)

	if SoundSpell != none
		if ignoreSpell != none
			if ignoreSpell != SoundSpell
				if ActorRef.HasSpell(SoundSpell as Form)
					ActorRef.RemoveSpell(SoundSpell)
				endIf
			endIf
		elseIf ActorRef.HasSpell(SoundSpell as Form)
			ActorRef.RemoveSpell(SoundSpell)
		endIf
	endIf
endFunction

function OnSleepStop(Bool abInterrupted)

	if IsPlayer as Bool && bSexPartnerOnSleepCh as Bool && System.cfg.RelevantPlayer
		Int radius = 320
		if System.cfg.ImpregnatePlayerAmbient
			radius = 2400
		endIf
		actor p = game.GetPlayer()
		if bSexPartnerOnSleep == false || aSexPartnerOnSleep == none
			if self.CheckSexPartnerOnSleep(game.FindClosestActorFromRef(p as ObjectReference, radius as Float), p)
				System.Message("Found a SexActor when you get up: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All, 0)
			elseIf self.CheckSexPartnerOnSleep(game.FindRandomActorFromRef(p as ObjectReference, radius as Float), p)
				System.Message("Found a SexActor when you get up: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All, 0)
			elseIf self.CheckSexPartnerOnSleep(game.FindRandomActorFromRef(p as ObjectReference, radius as Float), p)
				System.Message("Found a SexActor when you get up: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All, 0)
			endIf
		endIf
		if bSexPartnerOnSleep as Bool && aSexPartnerOnSleep != none && System.cfg.ImpregnatePlayerSleep
			if p.GetLeveledActorBase().GetSex() == 1 || aSexPartnerOnSleep.GetLeveledActorBase().GetSex() == 1
				aSexPartnerOnSleep = System.Manager.OnSleepSexStop(p, aSexPartnerOnSleep)
			endIf
			if aSexPartnerOnSleep != none
				if p.GetLeveledActorBase().GetSex() == 1
					System.Controller.AddSperm(p, aSexPartnerOnSleep, 1.00000)
					System.Message(fwutility.StringReplace(System.Content.NPCCameInsideYou, "{0}", aSexPartnerOnSleep.GetLeveledActorBase().GetName()), System.MSG_Immersive, 0)
				endIf
				if aSexPartnerOnSleep.GetLeveledActorBase().GetSex() == 1
					System.Controller.AddSperm(aSexPartnerOnSleep, p, 1.00000)
					System.Message(fwutility.StringReplace(System.Content.YouCameInsideNPC, "{0}", aSexPartnerOnSleep.GetLeveledActorBase().GetName()), System.MSG_Immersive, 0)
				endIf
			endIf
		endIf
	endIf
	if System.cfg.ChildrenMayCry && IsPlayer == true
		self.PlayBabySound_SleepStop()
	endIf
endFunction

function PlayBabySound(spell SoundSpell, Bool MustBeEquiped)

	if bIsWearingBaby == true && System.cfg.ChildrenMayCry == true && IsPlayer == true
		if ActorRef as actor != none
			if SoundSpell != none
				if ActorRef.HasSpell(SoundSpell as Form)
					return 
				else
					SoundSpell.Cast(ActorRef as ObjectReference, none)
				endIf
			endIf
			ActorRef.CreateDetectionEvent(ActorRef, 100)
			return 
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function equipChild()

	if ActorRef == none || IsPlayer == true
		return 
	endIf
	Int itmCount = ActorRef.GetNumItems()
	while itmCount > 0
		itmCount -= 1
		Form f = ActorRef.GetNthForm(itmCount)
		fwchildarmor ca = f as fwchildarmor
		if ca != none || f.HasKeyword(BabyKeyword) || f.GetName() == "Baby"
			Bool bGaveAway = false
			if ca != none && bGaveAway == false && utility.RandomInt(0, 100) > 85
				actor a1 = ca.Mother
				actor a2 = ca.Father
				if a1 != none && a2 != none
					if a1 != ActorRef && a1 != game.GetPlayer() && a2 == ActorRef && a1 != none
						if a2.IsDead() == false && a2.GetCurrentLocation() == a1.GetCurrentLocation() && a1.GetLeveledActorBase().IsUnique()
							a1.AddItem(f, 1, false)
							bGaveAway = true
						endIf
					endIf
					if a2 != ActorRef && a2 != game.GetPlayer() && a1 == ActorRef && a2 != none
						if a1.IsDead() == false && a1.GetCurrentLocation() == a2.GetCurrentLocation() && a2.GetLeveledActorBase().IsUnique()
							a2.AddItem(f, 1, false)
							bGaveAway = true
						endIf
					endIf
				endIf
			endIf
			if bGaveAway == false
				ActorRef.EquipItem(f, false, true)
				itmCount = 0
			endIf
		endIf
	endWhile
endFunction

function DispelEffectIfAble()

	if self.isBaseFormValid() && (self as ActiveMagicEffect) as Bool
		self.Dispel()
	else
		return 
	endIf
endFunction

Bool function CheckSexPartnerOnSleep(actor a, actor aPlayerRef)

	if a == aPlayerRef
		return false
	endIf
	if System.IsValidateActor(aPlayerRef, false) < 0
		return false
	endIf
	if IsCreature as Bool && System.cfg.CreatureSperm == false
		return false
	endIf
	if aPlayerRef == none
		if a != none
			if System.IsValidateActor(a, false) > 0
				if self.IsValidatePlayerSexPartner(a)
					bSexPartnerOnSleep = true
					aSexPartnerOnSleep = a
					return true
				endIf
			endIf
		endIf
	elseIf a != none
		if aPlayerRef.GetLeveledActorBase().GetSex() != a.GetLeveledActorBase().GetSex() && System.IsValidateActor(a, false) > 0
			if self.IsValidatePlayerSexPartner(a)
				bSexPartnerOnSleep = true
				aSexPartnerOnSleep = a
				return true
			endIf
		endIf
	endIf
	return false
endFunction

function OnSpellCast(Form akSpell)

	if bIsWearingBaby == true && System.cfg.ChildrenMayCry == true && IsPlayer == true
		if ItemListFear != none && ItemListFear.Find(akSpell) as Bool
			if utility.RandomInt(1, 10) > 7
				self.PlayBabySound(BabyFear, true)
			endIf
		elseIf ItemListHappy != none && ItemListHappy.Find(akSpell) as Bool
			if utility.RandomInt(1, 10) > 4
				self.PlayBabySound(BabyHappy, true)
			endIf
		elseIf ItemListSupprised != none && ItemListSupprised.Find(akSpell) as Bool
			if utility.RandomInt(1, 10) > 8
				self.PlayBabySound(BabySupprised, true)
			endIf
		endIf
	endIf
endFunction

function OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

	if IsPlayer == true
		bIsWearingBaby = false
		String fName = fwutility.GetIniFile(akBaseObject)
		if fwutility.FileExists("BabySounds/" + fName)
			String tmpSoundFile = fwutility.getIniCString("BabySounds", fName, "sound", "ModFile", "")
			String soundFile = fwutility.ModFile(tmpSoundFile)
			if soundFile != ""
				bIsWearingBaby = true
				BabyCry = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyCry", 0), soundFile) as spell
				BabyFear = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyFear", 0), soundFile) as spell
				BabyTalk = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyTalk", 0), soundFile) as spell
				BabyDrink = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyDrink", 0), soundFile) as spell
				BabyHappy = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyHappy", 0), soundFile) as spell
				BabyLaugh = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyLaugh", 0), soundFile) as spell
				BabyAmuse = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyAmuse", 0), soundFile) as spell
				BabyGiggle = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyGiggle", 0), soundFile) as spell
				BabyHiccup = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabyHiccup", 0), soundFile) as spell
				BabySupprised = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "sound", "BabySupprised", 0), soundFile) as spell
			endIf
			String tmpListFile = fwutility.getIniCString("BabySounds", fName, "ItemList", "ModFile", "")
			String listFile = fwutility.ModFile(tmpListFile)
			if listFile != ""
				ItemListHappy = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "ItemList", "Happy", 0), listFile) as FormList
				ItemListFear = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "ItemList", "Fear", 0), listFile) as FormList
				ItemListSupprised = game.GetFormFromFile(fwutility.getIniCInt("BabySounds", fName, "ItemList", "Supprised", 0), listFile) as FormList
			endIf
		endIf
	endIf
endFunction

function OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

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
	if IsPlayer == true && bIsWearingBaby == true && System.cfg.ChildrenMayCry == true
		self.PlayBabySound_OnHit()
	endIf
endFunction

function OnEffectStart(actor target, actor caster)

	IsPlayer = target == game.GetPlayer()
	IsCreature = target.GetRace().HasKeywordString("ActorTypeCreature")
	IsSpouse = target.IsInFaction(System.PlayerMarriedFaction)
	IsFollower = target.IsInFaction(System.FollowerFaction)
	AbilityBaseActor = target
endFunction

; Skipped compiler generated GotoState

function OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

	String fName = fwutility.GetIniFile(akBaseObject)
	if fwutility.FileExists("BabySounds/" + fName)
		bIsWearingBaby = false
	endIf
endFunction

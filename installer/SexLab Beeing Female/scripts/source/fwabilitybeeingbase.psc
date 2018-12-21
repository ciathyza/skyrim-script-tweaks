Scriptname FWAbilityBeeingBase extends ActiveMagicEffect

FWSystem property System auto

Actor property ActorRef auto hidden
ActorBase property ActorRefBase auto hidden

bool property IsPlayer auto hidden
bool property IsFollower auto hidden

bool property bInitSpell=false auto hidden
bool property bInit=false auto hidden

Actor AbilityBaseActor

bool IsCreature = false
bool IsSpouse = false
bool IsFollower = false

bool bIsWearingBaby = false
spell BabyCry
spell BabyFear
spell BabyTalk
spell BabyDrink
spell BabyHappy
spell BabyLaugh
spell BabyAmuse
spell BabyGiggle
spell BabyHiccup
spell BabySupprised
FormList ItemListHappy
FormList ItemListFear
FormList ItemListSupprised
Keyword BabyKeyword


sound property BBS auto

float aPosX
float aPosY
float aPosZ
float lastMoveTime

Function DispelEffectIfAble()
	if isBaseFormValid() && Self as ActiveMagicEffect
		Self.Dispel()
	else
		return
	endif
EndFunction

Event OnInit()
	bInit=true
	BabyKeyword=Keyword.GetKeyword("_FWBabyItem")
endEvent

Event OnPlayerLoadGame()
	if !isBaseFormValid()
		return
	Endif
	if self as ActiveMagicEffect
		UnregisterForSleep()
		RegisterForSleep()
	endif
	equipChild()
endEvent

Event OnEffectStart(Actor target, Actor caster)
	IsPlayer = (target==Game.GetPlayer())
	IsCreature = target.GetRace().HasKeywordString("ActorTypeCreature")
	IsSpouse = target.IsInFaction(System.PlayerMarriedFaction)
	IsFollower = target.IsInFaction(System.FollowerFaction)
	AbilityBaseActor = target
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;Do Nothing ***Edit by Bane
EndEvent

Event OnDeath(Actor akKiller)
	FWChildActor ca = akKiller as FWChildActor
	if ca!=none
		ca.AddExp(ActorRef.GetLevel() * 2)
	endif
EndEvent

float lastTimeGaveExp=0.0
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	FWChildActor ca = akAggressor as FWChildActor
	if ca!=none
		float t = Utility.GetCurrentRealTime()
		if t>lastTimeGaveExp+1
			if abPowerAttack || abSneakAttack || abBashAttack && abHitBlocked==false
				ca.AddExp(ActorRef.GetLevel() / 5)
				lastTimeGaveExp = t
			elseif abHitBlocked == true
				ca.AddExp(ActorRef.GetLevel() / 25)
				lastTimeGaveExp = t
			else
				ca.AddExp(ActorRef.GetLevel() / 15)
				lastTimeGaveExp = t
			endif
		endif
	endif
	
	if IsPlayer == true && bIsWearingBaby == true && System.cfg.ChildrenMayCry==true
		PlayBabySound_OnHit()
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if !isBaseFormValid()
		return
	Endif
	equipChild()
	if System.MountableRace.find(ActorRef.GetRace())>=0
		int c = StorageUtil.FormListCount(none,"FW.Babys")
		while c > 0
			c-=1
			FWChildActor ca = StorageUtil.FormListGet(none, "FW.Babys", c) as FWChildActor
			if ca != none
				if ca.GetFurnitureReference() != none
					if ca.GetFurnitureReference() == ActorRef
						ca.Dismount()
						c = 0
					endif
				endif
			endif
		endWhile
	endif
EndEvent


bool bSexPartnerOnSleep = false
actor aSexPartnerOnSleep
bool bSexPartnerOnSleepCh = false
; Received when the player sleeps. Start and desired end time are in game time days (after registering)
Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	PlayBabySound()
	bSexPartnerOnSleepCh = Utility.RandomFloat(0,99) < System.cfg.ImpregnatePlayerChance
	if IsPlayer && bSexPartnerOnSleepCh && System.cfg.RelevantPlayer
		bSexPartnerOnSleep = false
		aSexPartnerOnSleep=none
		int radius = 320 ;200
		if System.cfg.ImpregnatePlayerAmbient
			radius = 2300 ;1900
		endif
		actor p = Game.GetPlayer()
		if CheckSexPartnerOnSleep(Game.FindClosestActorFromRef(p, radius),p)
			System.Message("Found a SexActor when you lay down: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All)
		elseif CheckSexPartnerOnSleep(Game.FindRandomActorFromRef(p, radius),p)
			System.Message("Found a SexActor when you lay down: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All)
		elseif CheckSexPartnerOnSleep(Game.FindRandomActorFromRef(p, radius),p)
			System.Message("Found a SexActor when you lay down: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All)
		endif
		
		if p.GetLeveledActorBase().GetSex()==1 || aSexPartnerOnSleep.GetLeveledActorBase().GetSex()==1
			aSexPartnerOnSleep = System.Manager.OnSleepSexStart(p,aSexPartnerOnSleep)
		endif
	endif
endEvent

; Received when the player stops sleeping - whether naturally or interrupted (after registering)
Event OnSleepStop(bool abInterrupted)
	if IsPlayer && bSexPartnerOnSleepCh && System.cfg.RelevantPlayer
		int radius = 320 ;200
		if System.cfg.ImpregnatePlayerAmbient
			radius = 2400 ;1900
		endif
		actor p = Game.GetPlayer()
		if bSexPartnerOnSleep==false || aSexPartnerOnSleep==none
			if CheckSexPartnerOnSleep(Game.FindClosestActorFromRef(p, radius),p)
				System.Message("Found a SexActor when you get up: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All)
			elseif CheckSexPartnerOnSleep(Game.FindRandomActorFromRef(p, radius),p)
				System.Message("Found a SexActor when you get up: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All)
			elseif CheckSexPartnerOnSleep(Game.FindRandomActorFromRef(p, radius),p)
				System.Message("Found a SexActor when you get up: " + aSexPartnerOnSleep.GetLeveledActorBase().GetName(), System.MSG_All)
			endif
		endif
		
		if bSexPartnerOnSleep && aSexPartnerOnSleep!=none && System.cfg.ImpregnatePlayerSleep
			; Raise Event first
			if p.GetLeveledActorBase().GetSex()==1 || aSexPartnerOnSleep.GetLeveledActorBase().GetSex()==1
				aSexPartnerOnSleep = System.Manager.OnSleepSexStop(p,aSexPartnerOnSleep)
			endif
			
			; Check aSexPartnerOnSleep again - it may has changed during the AddOn Manager
			if aSexPartnerOnSleep!=none
				; Check if Player is Female
				if p.GetLeveledActorBase().GetSex()==1
					System.Controller.AddSperm(p, aSexPartnerOnSleep)
					System.Message( FWUtility.StringReplace( System.Content.NPCCameInsideYou , "{0}",aSexPartnerOnSleep.GetLeveledActorBase().GetName()), System.MSG_Immersive)
				endif
			
				; Check if Target is female (no elseif!, so F/F pregnancy can be raised)
				if aSexPartnerOnSleep.GetLeveledActorBase().GetSex()==1
					System.Controller.AddSperm(aSexPartnerOnSleep, p)
					System.Message( FWUtility.StringReplace( System.Content.YouCameInsideNPC , "{0}",aSexPartnerOnSleep.GetLeveledActorBase().GetName()), System.MSG_Immersive)
				endif
			endif
		endif
	endif
	if System.cfg.ChildrenMayCry && IsPlayer == true
		PlayBabySound_SleepStop()
	endif
endEvent

int cBabyHiccup=0
float nextUpdate
event OnUpdate()
	if !isBaseFormValid()
		return
	Endif
	if IsPlayer
		if ActorRef.X > aPosX+20 || ActorRef.X < aPosX - 20 || ActorRef.Y > aPosY+20 || ActorRef.Y < aPosY - 20 || ActorRef.Z > aPosZ+20 || ActorRef.Z < aPosZ - 20
			aPosX=ActorRef.X
			aPosY=ActorRef.Y
			aPosZ=ActorRef.Z
			lastMoveTime=Utility.GetCurrentRealTime()
		endif
	endif
	
	if bIsWearingBaby==true && System.cfg.ChildrenMayCry==true && IsPlayer == true
		if cBabyHiccup>0
			PlayBabySound_Hiccup()
			cBabyHiccup-=1
		elseif nextUpdate < Utility.GetCurrentRealTime()
			
			; Check again if the actor is wearing a baby
			bool bFound=false
			int itmCount = ActorRef.GetNumItems()
			while itmCount>0
				itmCount-=1
				form f = ActorRef.GetNthForm(itmCount)
				if f.HasKeyword(BabyKeyword) || f.GetName()=="Baby"
					itmCount=0
					bFound=true
				endif
			endWhile
			
			if bFound==false
				bIsWearingBaby=false
				return
			endif
		
			if IsPlayer && Utility.GetCurrentRealTime() - lastMoveTime> 30
				int rnd=Utility.RandomInt(0,20)
				if rnd>17
					PlayBabySound(BabyCry, true)
				elseif rnd>14
					PlayBabySound(BabyFear, true)
				elseif rnd>12
					cBabyHiccup=Utility.RandomInt(2,8)
				elseif rnd>9
					PlayBabySound(BabyHappy, true)
				elseif rnd>7
					PlayBabySound(BabyGiggle, true)
				elseif rnd>4
					PlayBabySound(BabyAmuse, true)
				else
					PlayBabySound(BabyTalk, true)
				endif
				nextUpdate = Utility.GetCurrentRealTime()+Utility.RandomFloat(8,20)
			elseif CheckNoice_Weather()
				nextUpdate = Utility.GetCurrentRealTime()+Utility.RandomFloat(10,90)
			elseif CheckNoice_HappyList()
				nextUpdate = Utility.GetCurrentRealTime()+Utility.RandomFloat(8,55)
			elseif CheckNoice_ListSupprised()
				nextUpdate = Utility.GetCurrentRealTime()+Utility.RandomFloat(8,65)
			elseif CheckNoice_FearList()
				nextUpdate = Utility.GetCurrentRealTime()+Utility.RandomFloat(5,120)
			endif
		endif
	endif
endEvent

bool function CheckSexPartnerOnSleep(actor a,actor aPlayerRef=none)
	if a==aPlayerRef
		; Don't add sperm to yourself
		return false
	endif
	if System.IsValidateActor(aPlayerRef)<0
		return false
	endif
	if IsCreature && System.cfg.CreatureSperm==false
		return false
	endif
	if aPlayerRef==none
		if a!=none
			if System.IsValidateActor(a)>0
				if IsValidatePlayerSexPartner(a)
					bSexPartnerOnSleep = true
					aSexPartnerOnSleep = a
					return true
				endif
			endif
		endif
	else
		if a!=none
			if aPlayerRef.GetLeveledActorBase().GetSex()!=a.GetLeveledActorBase().GetSex() && System.IsValidateActor(a)>0
				if IsValidatePlayerSexPartner(a)
					bSexPartnerOnSleep = true
					aSexPartnerOnSleep = a
					return true
				endif
			endif
		endif
	endif
	return false
endFunction

bool function IsValidatePlayerSexPartner(actor a)
	; Follower Check
	if a.IsInFaction(System.FollowerFaction)
		if System.cfg.ImpregnatePlayerFollower
			return true
		endif
	endif
	; Husband Check
	if a.IsInFaction(System.PlayerMarriedFaction)
		if System.cfg.ImpregnatePlayerHusband
			return true
		endif
	endif
	; Husband Check
	return System.cfg.ImpregnateLastPlayerNPCs
endfunction

function equipChild()
	if ActorRef==none || IsPlayer==true
		return
	endif
	;Equip baby
	int itmCount = ActorRef.GetNumItems()
	while itmCount>0
		itmCount-=1
		
		form f = ActorRef.GetNthForm(itmCount)
		FWChildArmor ca = f as FWChildArmor

		if ca != none || f.HasKeyword(BabyKeyword) || f.GetName()=="Baby"
			; Check, give to other parent
			bool bGaveAway = false
			if(ca!=none && bGaveAway==false && Utility.RandomInt(0,100)>85)
				actor a1 = ca.Mother
				actor a2 = ca.Father
				if a1!=none && a2!=none
					if a1!=ActorRef && a1!=Game.GetPlayer() && a2 == ActorRef && a1!=none
						if a2.IsDead()==false && a2.GetCurrentLocation() == a1.GetCurrentLocation() && a1.GetLeveledActorBase().IsUnique()
							a1.AddItem(f,1)
							bGaveAway=true
						endif
					endif
				
					if a2!=ActorRef && a2!=Game.GetPlayer() && a1 == ActorRef && a2!=none
						if a1.IsDead()==false && a1.GetCurrentLocation() == a2.GetCurrentLocation() && a2.GetLeveledActorBase().IsUnique()
							a2.AddItem(f,1)
							bGaveAway=true
						endif
					endif
				endif
			endif
			
			; Wasn't gave away - so equip it
			if bGaveAway == false
				ActorRef.EquipItem(f, false, true)
				itmCount=0
			endif
		endif
	endWhile
endFunction


function PlayBabySound_SleepStop()
	if bIsWearingBaby && IsPlayer == true
		int rnd=Utility.RandomInt(0,100)
		if rnd>93
			PlayBabySound(BabyCry, true)
		elseif rnd>88
			PlayBabySound(BabyFear, true)
		elseif rnd>85
			PlayBabySound(BabyTalk, true)
		elseif rnd>79
			PlayBabySound(BabyHappy, true)
		elseif rnd>72
			PlayBabySound(BabyAmuse, true)
		elseif rnd>68
			PlayBabySound(BabyGiggle, true)
		elseif rnd>58
			cBabyHiccup=Utility.RandomInt(1,15)
		endif
	endif
endFunction

function PlayBabySound_OnHit()
	int rnd=Utility.RandomInt(0,7)
	if rnd==7
		PlayBabySound(BabyCry, true)
	elseif rnd==6
		PlayBabySound(BabyFear, true)
	endif
endFunction

function PlayBabySound_Hiccup()
	PlayBabySound(BabyHiccup, true)
endFunction

function PlayBabySound(spell SoundSpell = none, bool MustBeEquiped = false)
	if bIsWearingBaby==true && System.cfg.ChildrenMayCry==true && IsPlayer == true
		if ActorRef as actor != none
			; Play sound on User
			if SoundSpell!=none
				If ActorRef.HasSpell(SoundSpell)
					return
				else
					SoundSpell.Cast(ActorRef)
				endif
			endif
			ActorRef.CreateDetectionEvent(ActorRef, 100 )
			return
		endif
	endif
endFunction

function DispatchBabySoundFromUser(spell SoundSpell, spell ignoreSpell)
	if SoundSpell != none
		if ignoreSpell!=none
			if ignoreSpell!=SoundSpell
				if ActorRef.HasSpell(SoundSpell)
					ActorRef.RemoveSpell(SoundSpell)
				endif
			endif
		else
			if ActorRef.HasSpell(SoundSpell)
				ActorRef.RemoveSpell(SoundSpell)
			endif
		endif
	endif
endFunction



; Event received when this actor equips something - akReference may be None if object is not persistent
Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if IsPlayer == true
		bIsWearingBaby=false
		string fName=FWUtility.GetIniFile(akBaseObject)
		if FWUtility.FileExists("BabySounds/"+fName)
			string tmpSoundFile = FWUtility.getIniCString("BabySounds", fName, "Sound","ModFile")
			string soundFile = FWUtility.ModFile( tmpSoundFile )
			if soundFile!=""
				bIsWearingBaby=true
				BabyCry=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyCry"), soundFile) as spell
				BabyFear=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyFear"), soundFile) as spell
				BabyTalk=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyTalk"), soundFile) as spell
				BabyDrink=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyDrink"), soundFile) as spell
				BabyHappy=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyHappy"), soundFile) as spell
				BabyLaugh=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyLaugh"), soundFile) as spell
				BabyAmuse=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyAmuse"), soundFile) as spell
				BabyGiggle=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyGiggle"), soundFile) as spell
				BabyHiccup=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabyHiccup"), soundFile) as spell
				BabySupprised=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "Sound","BabySupprised"), soundFile) as spell
			endif
		
			string tmpListFile = FWUtility.getIniCString("BabySounds", fName, "ItemList","ModFile")
			string listFile = FWUtility.ModFile(tmpListFile)
			if listFile!=""
				ItemListHappy=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "ItemList","Happy"), listFile) as Formlist
				ItemListFear=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "ItemList","Fear"), listFile) as Formlist
				ItemListSupprised=Game.GetFormFromFile(FWUtility.getIniCInt("BabySounds", fName, "ItemList","Supprised"), listFile) as Formlist
			endif
		endif
	endif
endEvent

; returns the form for the item worn at the specified slotMask
; use Armor.GetMaskForSlot() to generate appropriate slotMask
;Form Function GetWornForm(int slotMask) native

; Event received when this actor unequips something - akReference may be None if object is not persistent
Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	string fName=FWUtility.GetIniFile(akBaseObject)
	if FWUtility.FileExists("BabySounds/"+fName)
		bIsWearingBaby=false
	endif
endEvent

bool function CheckNoice_Weather()
	Weather w = Weather.GetCurrentWeather()
	int c = w.GetClassification()
	int r = Utility.RandomInt(0,10)
	if c == -1 ; No classification
	elseif c==0 ; Pleasant
		if r>=9
			PlayBabySound(BabyHappy, true)
			return true
		elseif r==8
			PlayBabySound(BabyAmuse, true)
			return true
		elseif r==7
			PlayBabySound(BabyGiggle, true)
			return true
		elseif r==6
			PlayBabySound(BabyTalk, true)
			return true
		endif
	elseif c==1 ; Cloudy
	elseif c==2 ; Rainy
		if r>9
			PlayBabySound(BabyCry, true)
			return true
		endif
	elseif c==3 ; Snow
		if r>6
			PlayBabySound(BabyCry, true)
			return true
		endif
	endif
	return false
endFunction

bool function CheckNoice_HappyList()
	if ItemListHappy==none ;|| babyMood<-3
		return false
	endif
	float Timer = Utility.GetCurrentRealTime()
	if Game.FindClosestReferenceOfAnyTypeInListFromRef(ItemListHappy, ActorRef, 500) != none
		PlayBabySound(BabyHappy, true)
		return true
	endif
	return false
endFunction

bool function CheckNoice_FearList()
	if ItemListSupprised==none ;|| babyMood>3
		return false
	endif
	float Timer = Utility.GetCurrentRealTime()
	if Game.FindClosestReferenceOfAnyTypeInListFromRef(ItemListSupprised, ActorRef, 2000) != none
		PlayBabySound(BabyFear, true)
		return true
	endif
	return false
endFunction

bool function CheckNoice_ListSupprised()
	if ItemListFear==none
		return false
	endif
	float Timer = Utility.GetCurrentRealTime()
	if Game.FindClosestReferenceOfAnyTypeInListFromRef(ItemListSupprised, ActorRef, 400) != none
		PlayBabySound(BabySupprised, true)
		return true
	endif
	return false
endFunction

; Event received when an item is added to this object's inventory. If the item is a persistant reference, akItemReference will
; point at it - otherwise the parameter will be None
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if bIsWearingBaby==true && System.cfg.ChildrenMayCry==true && IsPlayer == true
		if ItemListFear!=none && ItemListFear.Find(akBaseItem)
			if Utility.RandomInt(1,20)>13
				PlayBabySound(BabyFear, true)
			endif
		elseif ItemListHappy!=none && ItemListHappy.Find(akBaseItem)
			if Utility.RandomInt(1,20)>9
				PlayBabySound(BabyHappy, true)
			endif
		elseif ItemListSupprised!=none && ItemListSupprised.Find(akBaseItem)
			if Utility.RandomInt(1,20)>9
				PlayBabySound(BabySupprised, true)
			endif
		endif
	elseif akBaseItem.HasKeyword(BabyKeyword)
		equipChild()
	endif
endEvent

; Event received when a spell is cast by this object
Event OnSpellCast(Form akSpell)
	if bIsWearingBaby==true && System.cfg.ChildrenMayCry==true && IsPlayer == true
		if ItemListFear!=none && ItemListFear.Find(akSpell)
			if Utility.RandomInt(1,10)>7
				PlayBabySound(BabyFear, true)
			endif
		elseif ItemListHappy!=none && ItemListHappy.Find(akSpell)
			if Utility.RandomInt(1,10)>4
				PlayBabySound(BabyHappy, true)
			endif
		elseif ItemListSupprised!=none && ItemListSupprised.Find(akSpell)
			if Utility.RandomInt(1,10)>8
				PlayBabySound(BabySupprised, true)
			endif
		endif
	endif
endEvent

bool Function isBaseFormValid()
	return (AbilityBaseActor as form) != none 
endfunction

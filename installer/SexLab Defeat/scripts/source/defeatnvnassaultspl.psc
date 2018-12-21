Scriptname DefeatNVNAssaultSPL extends ActiveMagicEffect

DefeatMCMscr Property McmConfig auto
DefeatConfig Property RessConfig auto

Spell Property TheSpell Auto

Import StorageUtil
Import Utility
Import Game
Import Debug

Int NVNSlot
Actor Aggressor
Actor Victim
Actor TheAdd = None
Actor Property Player Auto
Package[] Property NVNAgressorPck Auto
Bool IsFollower
Bool AggIsFollower
Bool IsHuman
String Outcome
Float MaxDistance
Float KDTime
Bool Robbed = False

Event OnEffectStart(Actor Target, Actor Caster)
	Aggressor = Caster
	Victim = Target
	If (Victim && Aggressor)
		If NVNSlot() ; Check is there is free slots.
			DefeatConfig.Log("NVN OnEffectStart - Victim - "+Victim+" // Aggressor - "+Aggressor+" Slot - "+NVNSlot+" // GetTimeElapsed "+GetTimeElapsed())
			IsFollower = RessConfig.IsFollower(Target)
			AggIsFollower = Ressconfig.IsFollower(Caster)
			IsHuman = Aggressor.HasKeyWordString("ActorTypeNPC")
			KDTime = McmConfig.KDTimeNVN
			If Self
				RegisterForSingleUpdate(1.0)
			Else
				Dispel()
			Endif
		Else
			Dispel()
		Endif
	Endif
EndEvent
Bool Function NVNSlot()
	Int i = 0
	While (i < 10)
		If !RessConfig.VicPair[i].GetReference()
			RessConfig.VicPair[i].ForceRefTo(Victim)
			RessConfig.AggPair[i].ForceRefTo(Aggressor)
			NVNSlot = i
;			DefeatConfig.Log("NVN NVNSlot chosen - "+NVNSlot)
			Return True
		Endif
		i += 1
	EndWhile
	Return False
EndFunction
Event OnUpdate()
;	DefeatConfig.Log("NVN OnUpdate -> Victim - "+Victim+" // Aggressor - "+Aggressor+" // Slot - "+NVNSlot+" // GetTimeElapsed "+GetTimeElapsed())
	If ((GetTimeElapsed() < KDTime) && ActorValid(Aggressor) && ActorValid(Victim) && Victim.HasSpell(RessConfig.KnockDownSPL))
		If (!Aggressor.IsInCombat() || !McmConfig.NPCLastEnemy) ; If last enemy is disabled, the aggressor go immediately on the victim, else they will wait for the end of the combat.
			If !McmConfig.NPCLastEnemy
				RessConfig.Calm(Aggressor, StayPut = False)
			Endif
;			DefeatConfig.Log("NVN - aggressor out of combat or Last Enemy disabled, begin the assault. // Slot - "+NVNSlot)
			Outcome = SetOutcome()
			If (IsFollower && Player.HasKeyWordString("DefeatActive")) ; Player is down and the victim is a follower, cancel the assault.
				Restored()
				If RessConfig.IsSexualAssaulter(Aggressor, Player, True)
					Int Slot = RessConfig.PlayerScr.GetAggressors().Find(None)
					If (Slot != -1)
						RessConfig.PlayerScr.AddAggressor(Aggressor, Slot)
					Elseif RessConfig.IsSexualAssaulter(Aggressor, Victim, IsFollower = True)
						Slot = RessConfig.PlayerScr.GetAccomplices().Find(None)
						If (Slot != -1)
							RessConfig.PlayerScr.AddAccomplice(Aggressor, Slot)
						Endif
					Endif
				Elseif RessConfig.IsSexualAssaulter(Aggressor, Victim, IsFollower = True)
					Int Slot = RessConfig.PlayerScr.GetAccomplices().Find(None)
					If (Slot != -1)
						RessConfig.PlayerScr.AddAccomplice(Aggressor, Slot)
					Endif
				Endif
				Victim.AddToFaction(RessConfig.DefeatFactions[0]) ; The follower is cleared from NPC vs NPC alias so is no longer in DefeatFaction, let's put them back so they are collateral-allowed.
				Return
			Endif
			If (Outcome != "")
				Aggressor.SetFactionRank(RessConfig.DefeatFactions[1], 1)
				MaxDistance = Dist()
				TheAdd = FindAdd()
				If TheAdd
					RessConfig.AggPairAdd[NVNSlot].ForceRefTo(TheAdd)
					ActorUtil.AddPackageOverride(TheAdd, NVNAgressorPck[NVNSlot], 100, 1)
					Aggressor.EvaluatePackage()
				Endif
				ActorUtil.AddPackageOverride(Aggressor, NVNAgressorPck[NVNSlot], 100, 1)
				Aggressor.EvaluatePackage()
				If (McmConfig.NoNotifications && ActorValid(Aggressor) && ActorValid(Victim))
					If (TheAdd && !TheAdd.IsDead() && !TheAdd.HasMagicEffect(RessConfig.MiscMagicEffects[0]))
						RessConfig.UILib.ShowNotification("${"+Aggressor.GetLeveledActorBase().GetName()+"} and {"+TheAdd.GetLeveledActorBase().GetName()+"} move toward {"+Victim.GetLeveledActorBase().GetName()+"}!", "#CD4C4C")
					Else
						RessConfig.UILib.ShowNotification("${"+Aggressor.GetLeveledActorBase().GetName()+"} moves toward {"+Victim.GetLeveledActorBase().GetName()+"}!", "#CD4C4C")
					Endif
;					Ressconfig.AssaultNVNMess[NVNSlot].Show()
				Endif
				Int i = 15
				While (i > 0)
					i -= 1
					If (!ActorValid(Aggressor) || !ActorValid(Victim)) && Victim.HasSpell(RessConfig.KnockDownSPL)
						DefeatConfig.Log("NVN - One of the actor is dead or victim rescued. // Slot - "+NVNSlot)
						Restored()
						Return
;					Elseif (Aggressor.HasMagicEffect(RessConfig.MiscMagicEffects[0]) || Victim.HasMagicEffect(RessConfig.MiscMagicEffects[0])) ; ImmunityEFF
;						DefeatConfig.Log("NVN - victim rescued. // Slot - "+NVNSlot)
;						Restored()
;						Return
					Elseif (Aggressor.GetDistance(Victim) < MaxDistance)
;						DefeatConfig.Log("NVN - Distance reached, Outcome. // Slot - "+NVNSlot)
						GoToState("Outcome")
						Return
					Endif
					Wait(1.0)
				EndWhile
				Restored()
			Else
				Restored()
			Endif
		Else
			If Self
				RegisterForSingleUpdate(3.0)
			Else
				Dispel()
			Endif
		Endif
	Else
		Restored()
	Endif
EndEvent
String Function SetOutcome()
	; To add : Crime faction, witness etc...
	If IsHuman
		String[] Events = New String[10]
		If IsFollower
			If RessConfig.IsBadRelation(Aggressor, Victim, False)
				If (RandomInt(1, 100) <= McmConfig.NVNRapedFollower) && RessConfig.IsSexualAssaulter(Aggressor, Victim, IsFollower = True)
					Return "Raped" ; Prioritize the rape by returning directly
				Endif
				If (RandomInt(1, 100) <= McmConfig.NVNKillFollower)
					If !Victim.IsEssential()
						i = Events.Find("")
						Events[i] = "Kill"
					Endif
				Endif
			Endif
			If (RandomInt(1, 100) <= McmConfig.NVNRobbedFollower)
				i = Events.Find("")
				Events[i] = "Robbed"
			Endif
		Else
			If RessConfig.IsBadRelation(Aggressor, Victim, False)
				If (RandomInt(1, 100) <= McmConfig.NVNRaped) && RessConfig.IsSexualAssaulter(Aggressor, Victim, IsFollower = False)
					Return "Raped" ; Prioritize the rape by returning directly
				Endif
				If (RandomInt(1, 100) <= McmConfig.NVNKill)
					If !Victim.IsEssential()
						i = Events.Find("")
						Events[i] = "Kill"
					Endif
				Endif
			Endif
			If (RandomInt(1, 100) <= McmConfig.NVNRobbed)
				i = Events.Find("")
				Events[i] = "Robbed"
			Endif
		Endif
		Int n = -1
		Int i = 0
		While (i < 10)
			If (Events[i] != "")
				n += 1
			Endif
			i += 1
		EndWhile
		If (n != -1) ; Nothing in the array to choose from
			String TheEvent = Events[RandomInt(0, n)] ; Pick an event randomly
;			DefeatConfig.Log("NVN spell Event chosen - "+TheEvent+" // Events array - "+Events)
			If (TheEvent != "")
				Return TheEvent
			Endif
		Endif
	Else
		Return "Raped"
	Endif
	Return ""
EndFunction
State Outcome
	Event OnBeginState()
		If (Outcome != "")
			If (Outcome == "Raped")
				RessConfig.NVNHasBeenRapedBy = RessConfig.HasBeenRapedBy(Victim, Aggressor)
			;	Aggressor.Say(RessConfig.TopicToSay[12], Victim)
				If IsFollower
					RessConfig.DefeatMoan(Victim, Victim, "Bleedout", McmConfig.DialoguesNVNFollower)
				Else
					RessConfig.DefeatMoan(Victim, Victim, "Bleedout", McmConfig.DialoguesNVN)
				Endif
				If !TheAdd && InvolvePlayer(RessConfig.IsFollower(Aggressor))
					TheAdd = Player
				Endif
				TheRape()
			Elseif (Outcome == "Robbed")
				RobEvent()
				If TheAdd
					ActorUtil.RemovePackageOverride(Aggressor, NVNAgressorPck[NVNSlot])
					Aggressor = TheAdd
					TheAdd = None
					Int i = 15
					While (i > 0)
						i -= 1
						If (!ActorValid(Aggressor) || !ActorValid(Victim))
							Restored()
							Return
						Elseif (Aggressor.GetDistance(Victim) < MaxDistance)
							RessConfig.NVNHasBeenRapedBy = RessConfig.HasBeenRapedBy(Victim, Aggressor)
							If IsFollower
								RessConfig.DefeatMoan(Victim, Victim, "Bleedout", McmConfig.DialoguesNVNFollower)
							Else
								RessConfig.DefeatMoan(Victim, Victim, "Bleedout", McmConfig.DialoguesNVN)
							Endif
							TheRape()
							Return
						Endif
						Wait(1.0)
					EndWhile
				Else
					Restored()
				Endif
			Elseif (Outcome == "Kill")
				If TheAdd
					ActorUtil.RemovePackageOverride(Aggressor, NVNAgressorPck[NVNSlot])
					Aggressor = TheAdd
					TheAdd = None
					Int i = 15
					While (i > 0)
						i -= 1
						If (!ActorValid(Aggressor) || !ActorValid(Victim))
							Restored()
							Return
						Elseif (Aggressor.GetDistance(Victim) < MaxDistance)
							RessConfig.NVNHasBeenRapedBy = RessConfig.HasBeenRapedBy(Victim, Aggressor)
							If IsFollower
								RessConfig.DefeatMoan(Victim, Victim, "Bleedout", McmConfig.DialoguesNVNFollower)
							Else
								RessConfig.DefeatMoan(Victim, Victim, "Bleedout", McmConfig.DialoguesNVN)
							Endif
							TheRape()
							Return
						Endif
						Wait(1.0)
					EndWhile
					TheRape()
				Else
					KillEvent()
					Restored()
				Endif
			Endif
		Else
			Restored()
		Endif
	EndEvent
	Event OnUpdate()
;		DefeatConfig.Log("Outcome state OnUpdate")
		If (Aggressor.IsDead() || Victim.IsDead() || !Victim.HasKeyWordString("SexLabActive") || !Aggressor.HasKeyWordString("SexLabActive"))
			Restored()
		Endif
	EndEvent
EndState
Function RobEvent()
	SendAnimationEvent(Aggressor, "DefeatPickUp")
	Int i = Victim.GetNumItems()
	While (i > 0)
		i -= 1
		Form Item = Victim.GetNthForm(i)
		If (Item.GetGoldValue() >= 100.0)
			Victim.RemoveItem(Item, Victim.GetItemCount(Item), True, Aggressor)
		Endif
	EndWhile
	Victim.RemoveItem(GetForm(0x0F), Victim.GetGoldAmount(), akOtherContainer = Aggressor)
	Robbed = True
	SendAnimationEvent(Victim, GetStringValue(Victim, "DefeatStateAnim"))
EndFunction
Function KillEvent()
;	If !Aggressor.IsWeaponDrawn()
;		Aggressor.DrawWeapon()
;		Float i = 3.0
;		While (!Aggressor.IsWeaponDrawn() && (i > 0.0))
;			Wait(0.5)
;			i -= 0.5
;		EndWhile
;		Wait(1.0)
;	Endif
	Int Attempts
	Bool Succes = False
	Idle TheKillmove
	Int WeaponType = Aggressor.GetEquippedItemType(1)
	If (Aggressor.IsWeaponDrawn() && ((WeaponType == 1) || (WeaponType == 2) || (WeaponType == 5))) 		; Dagger & Sword 1H/2H Bleedout kill
		TheKillmove = RessConfig.Killmoves[5]
	Elseif (Aggressor.IsWeaponDrawn() && ((WeaponType == 3) || (WeaponType == 4) || (WeaponType == 6))) 	; Axe/Mace 1H/2H
		TheKillmove = RessConfig.Killmoves[8] 	; Quick slash
	Else
		TheKillmove = RessConfig.Killmoves[10] 	; Combo 3 punches
	Endif
	While (!Succes && (Attempts < 5))
		If Aggressor.PlayIdleWithTarget(TheKillmove, Victim) ; Bleedout kill
			Succes = True
		Endif
		Attempts += 1
	EndWhile
	If !Succes ; Fail to play an animation or for Sleeping state
		Float HP = Victim.GetActorValue("Health")
		Victim.DamageActorValue("Health", HP - 1.0)
		SendAnimationEvent(Aggressor, "pa_killmove2HM3Slash")
		Wait(3.0)
		While !Victim.IsDead()
			Victim.Kill(Aggressor)
			Wait(0.5)
		EndWhile
	Endif
EndFunction
Actor Function FindAdd()
	Actor Found
	If IsHuman
		If (McmConfig.GbChanceNVN > 0.0)
			If (RandomInt(0, 100) < McmConfig.GbChanceNVN)
				Cell CurrentCell = Victim.GetParentCell()
				Int NumRefs = CurrentCell.GetNumRefs(62)
				While (NumRefs > 0)
					NumRefs -= 1
					Found = CurrentCell.GetNthRef(NumRefs, 62) as Actor
					If (Found && (Found != Player) && !Found.IsGhost() && Found.HasKeyWordString("ActorTypeNPC")); && !Found.IsInFaction((GetForm(0x89A85) As Faction))) ; PlayerHouseMannequin
						If (ActorValid(Found) && !RessConfig.IsDefeatActive(Found) && !Found.HasKeyWordString("SexLabActive") && (Found.GetDistance(Victim) < 3000.0) && CheckIfFollower(Found))
							If RessConfig.IsSexualAssaulter(Found, Victim, IsFollower = IsFollower)
	;							DefeatConfig.Log("NVN, Add found -> "+Found)
								Return Found
							Endif
						Endif
					Endif
				EndWhile
			Endif
		Endif	
	Else
		If (McmConfig.GbCrChanceNVN > 0.0)
			If (RandomInt(0, 100) < McmConfig.GbCrChanceNVN)
				Cell CurrentCell = Victim.GetParentCell()
				Int NumRefs = CurrentCell.GetNumRefs(62)
				Race AggressorRace = Aggressor.GetLeveledActorBase().GetRace()
;				VoiceType AggressorVoice = Aggressor.GetVoiceType()
				Actor[] Positions
				String GenderTag
				sslBaseAnimation[] Anims
;				Int IsValidRace = RessConfig.MiscVoicetypes.Find(AggressorRace)
;				If (IsValidRace != -1)
					While (NumRefs > 0)
						NumRefs -= 1
						Found = CurrentCell.GetNthRef(NumRefs, 62) as Actor
						If (Found && (Found != Player) && !Found.IsGhost())
							If (ActorValid(Found) && !RessConfig.IsDefeatActive(Found) && !Found.HasKeyWordString("SexLabActive") && (Found.GetDistance(Victim) < 3000.0) && CheckIfFollower(Found))
								If RessConfig.IsSexualAssaulter(Found, Victim, IsFollower = IsFollower) ; (AggressorVoice == Found.GetVoiceType())
									Positions = RessConfig.MakeActorArray(Victim, Aggressor, Found)
									GenderTag = SexLabUtil.MakeGenderTag(Positions)
									Anims = RessConfig.SexLab.GetCreatureAnimationsByRaceTags(3, AggressorRace, GenderTag+","+McmConfig.CreatureTagNVN, McmConfig.CreatureSupressTagNVN, McmConfig.CreatureRequireAllTagNVN)
									If (Anims.Length != 0)
										Return Found
;										DefeatConfig.Log("NVN Creature, Add found -> "+Found)
									Endif
								Endif
							Endif
						Endif
					EndWhile
;				Endif
			Endif
		Endif
	Endif
	Return None
EndFunction
Bool Function CheckIfFollower(Actor Target)
	If AggIsFollower
		Return Ressconfig.IsFollower(Target)
	Endif
	Return True
EndFunction

Function TheRape()
	Strip()
	If IsHuman
		If (RandomInt(0, 100) > McmConfig.GbChanceNVN)
			TheAdd = None
		Endif
	Else
		If (RandomInt(0, 100) > McmConfig.GbCrChanceNVN)
			TheAdd = None
		Endif
	Endif
	sslBaseAnimation[] Anims
	sslThreadModel TheRape
	If !TheAdd
		If Aggressor.HasKeyWordString("ActorTypeNPC")
			String AnimationSet
			If RessConfig.Tied(Victim)
				Anims = RessConfig.SexLab.GetAnimationsByTags(2, McmConfig.TiedTagNVN, McmConfig.TiedSupressTagNVN, McmConfig.TiedRequireAllTagNVN)
				AnimationSet = "TiedNVN"
			Endif
			If (Anims.length == 0)
				Int GenderCombination = RessConfig.GenderCombination(Victim, Aggressor)
				If (GenderCombination == 2)
					Anims = RessConfig.SexLab.GetAnimationsByTags(2, McmConfig.FoMTagNVN, McmConfig.FoMSupressTagNVN, McmConfig.FoMRequireAllTagNVN)
					AnimationSet = "FoMNVN"
				Elseif (GenderCombination == 3)
					Anims = RessConfig.SexLab.GetAnimationsByTags(2, McmConfig.FoFTagNVN, McmConfig.FoFSupressTagNVN, McmConfig.FoFRequireAllTagNVN)
					AnimationSet = "FoFNVN"
				Endif
			Endif
			If (Anims.length == 0)
				AnimationSet = "RapeNVN"
			Endif
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.RapeTagNVN, SupressTags = McmConfig.RapeSupressTagNVN, TagsRequireAll = McmConfig.RapeRequireAllTagNVN, FemaleFirst = AnimationSet)
		Else
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.CreatureTagNVN, SupressTags = McmConfig.CreatureSupressTagNVN, TagsRequireAll = McmConfig.CreatureRequireAllTagNVN)
		Endif
	Else
		If Aggressor.HasKeyWordString("ActorTypeNPC")
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, TheAdd, CustomAnimations = Anims, Tags = McmConfig.MultipleTagNVN, SupressTags = McmConfig.MultipleSupressTagNVN, TagsRequireAll = McmConfig.MultipleRequireAllTagNVN, FemaleFirst = "MultNVN")
		Else
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, TheAdd, CustomAnimations = Anims, Tags = McmConfig.CreatureTagNVN, SupressTags = McmConfig.CreatureSupressTagNVN, TagsRequireAll = McmConfig.CreatureRequireAllTagNVN, FemaleFirst = "MultCreaNVN")
		Endif
	Endif
	TheRape.DisableRagdollEnd(Victim)
	RegisterForModEvent("AnimationEnd_NVNR", "EndNVNR")
	TheRape.SetHook("NVNR")
	UnequipWeapons(Victim)
	UnequipWeapons(Aggressor)
	sslThreadController Thread = TheRape.StartThread()
	If Thread
		RessConfig.RemoveStates(Victim, False)
		RessConfig.Calm(Victim)
		RegisterForSingleUpdate(5.0)
	Else
		DefeatConfig.Log("Error: NPC vs NPC, Animation did not start, something went wrong with the scene, check your SexLab settings")
		Restored()
	Endif
EndFunction
Event EndNVNR(string EventName, string argString, float argNum, form sender)
;	DefeatConfig.Log("NVN SexLab event -> Victim - "+Victim+" // Aggressor - "+Aggressor+" // Slot - "+NVNSlot+" // GetTimeElapsed "+GetTimeElapsed())
	Victim.SetNoBleedoutRecovery(False)
	Bool Interrupted = Victim.HasMagicEffect(RessConfig.MiscMagicEffects[0]) ; ImmunityEFF Check if the scene has been interrupted somehow
	If !Interrupted
		RessConfig.SetSatisfied(Aggressor, Type = "NPC")
		If (TheAdd && (TheAdd != Player))
			RessConfig.SetSatisfied(TheAdd, Type = "NPC")
			AdjustIntValue(TheAdd, "RapedBy"+Victim, 1)
		Endif
	Endif
	AdjustIntValue(Aggressor, "RapedBy"+Victim, 1)
	If (TheAdd && (TheAdd != Player))
		AdjustIntValue(TheAdd, "RapedBy"+Victim, 1)
	Endif
	If IsFollower
		RessConfig.Weakenings(Victim, "Follower")
		If Player.HasKeyWordString("DefeatActive") ; Check if the player is being assaulted, in which case the follower uses player victim post assault settings.
;			If SexLabUtil.GetConfig().RagdollEnd
;				RegisterForAnimationEvent(Victim, "GetUpEnd")
;			Else
				Wait(0.5)
				If (McmConfig.bExhaustedPvic && (RandomInt(0, 1) == 0))
					RessConfig.Exhausted(Victim, Aggressor, 60.0)
				Else
					RessConfig.Trauma(Victim, Aggressor, 60.0)
				Endif
				If McmConfig.CollateralAssault
					DefeatConfig.Log("Collateral from EndNVNR event")
					RessConfig.PlayerScr.Collateral()
				Endif
				Dispel()
;			Endif
		Else
	;		If SexLabUtil.GetConfig().RagdollEnd
	;			RegisterForAnimationEvent(Victim, "GetUpEnd")
	;		Else
				WeakeningsState("Follower")
				PostAssaultEvent()
				Dispel()
	;		Endif
		Endif
	Else
		RessConfig.Weakenings(Victim, "NPC")
;		If SexLabUtil.GetConfig().RagdollEnd
;			RegisterForAnimationEvent(Victim, "GetUpEnd")
;		Else
			WeakeningsState("NPC")
			PostAssaultEvent()
			Dispel()
;		Endif
	Endif
EndEvent
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	UnregisterForAnimationEvent(Victim, "GetUpEnd")
	If (Victim.Is3DLoaded() && !Victim.IsDead() && Aggressor.Is3DLoaded() && !Aggressor.IsDead())
		If IsFollower
			WeakeningsState("Follower")
		Else
			WeakeningsState("NPC")
		Endif
		PostAssaultEvent()
	Endif
	If McmConfig.CollateralAssault
		RessConfig.PlayerScr.Collateral()
	Endif
	Dispel()
EndEvent
Function PostAssaultEvent()
	Float RobChance
	Float KillChance
	If RessConfig.IsFollower(Aggressor)
		RobChance = McmConfig.NVNRobbedPAFollower
		KillChance = McmConfig.NVNKillPAFollower
	Else
		RobChance = McmConfig.NVNRobbedPA
		KillChance = McmConfig.NVNKillPA
	Endif
	If (!Aggressor.IsInCombat() && !RessConfig.IsImmune(Victim))
		If (!Robbed && (RandomInt(1, 100) <= RobChance))
			RobEvent()
			Wait(1.5)
		Endif
		If (!Victim.IsEssential() && (RandomInt(1, 100) <= KillChance))
			KillEvent()
		Endif
	Endif
EndFunction
Function WeakeningsState(String TheType)
	If !Victim.IsDead()
		String[] Events = New String[3]
		Int i
		Int n = -1
		Float OptionTrauma
		Float OptionExhausted
		If (TheType == "Follower")
			OptionTrauma = McmConfig.NVNTraumaCvic
			OptionExhausted = McmConfig.NVNExhaustedCvic
			If ((McmConfig.EscapeCvic > 0) && !Player.HasKeyWordString("DefeatActive")) ; Don't choose escape if the player is knocked down
				i = Events.Find("")
				Events[i] = "Escape"
				n += 1
			Endif
		Else
			OptionTrauma = McmConfig.NVNTrauma
			OptionExhausted = McmConfig.NVNExhausted
			If (McmConfig.EscapeNPC > 0)
				i = Events.Find("")
				Events[i] = "Escape"
				n += 1
			Endif
		Endif
		If (OptionTrauma > 0)
			i = Events.Find("")
			Events[i] = "Trauma"
			n += 1
		Endif
		If (OptionExhausted > 0)
			i = Events.Find("")
			Events[i] = "Exhausted"
			n += 1
		Endif
		If (n != -1)
			String TheState = Events[RandomInt(0, n)]
			If (TheState == "Trauma")
				RessConfig.Trauma(Victim, Aggressor, Type = TheType)
			Elseif (TheState == "Exhausted")
				RessConfig.Exhausted(Victim, Aggressor, Type = TheType)
			Elseif (TheState == "Escape")
				RessConfig.Escape(Victim, Aggressor, Type = TheType)
			Endif
		Elseif ((TheType == "Follower") && Player.HasKeyWordString("DefeatActive")) ; If no event chosen, knock down the follower anyway if the player is knocked down
			RessConfig.Trauma(Victim, Aggressor, Type = TheType)
		Else
			RessConfig.Calm(Victim, Enter = False)
		Endif
	Else
		RessConfig.Calm(Victim, Enter = False)
	Endif
EndFunction
Bool Function InvolvePlayer(Bool AggressorFollower)
	If AggressorFollower
		If (McmConfig.NVN3wayAutoFollower > 0.0)
			If (Player.GetDistance(Victim) < McmConfig.NVN3wayAutoFollower)
				Int Button = RessConfig.MiscMessages[2].Show() ; NVN3wayAutoFollowerMess
				If (Button == 1)
					Return True
				Endif
			Endif
		Endif
	Endif
	Return False
EndFunction
Function Strip() ;===== STRIP
	RessConfig.SetEmptyOutfit(Victim)
	Form BodyArmor = Victim.GetWornForm(0x00000004)
	If (BodyArmor && BodyArmor.HasKeyWordString("BU_Equip"))
		If DefeatUtil.BUIsNotFullyBroken(BodyArmor)
			DefeatUtil.BUBreakArmor(Victim, BodyArmor)
		Endif
	Else
		If ((IsFollower && McmConfig.bRedressFollower) || (!IsFollower && McmConfig.bRedressNVN))
			Form Clothes
			Int i
			While (i < 5)
				If (McmConfig.SSNVNSet[i+1] == "$UNEQUIP")
					Clothes = Victim.GetWornForm(Armor.GetMaskForSlot(McmConfig.SSNVN[i] As Int))
					If Clothes
						SetFormValue(Victim, "DefeatVictimClothesNVN"+i+1, Clothes)
					Endif
				Endif
				i += 1
			EndWhile
		Endif
		Float zOffset = Aggressor.GetHeadingAngle(Victim)
		Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)
		Int i
		While (i < 5)
			If ActorValid(Aggressor) && ActorValid(Victim)
				PieceToStrip(McmConfig.SSNVNSet[i + 1], Armor.GetMaskForSlot(McmConfig.SSNVN[i] As Int))
			Else
				Return
			Endif
			i += 1
		EndWhile
		Weapon Equipped = Victim.GetEquippedWeapon()
		If !PieceToStrip(McmConfig.SSNVNSet[0], 0, Equipped)
			Return
		Endif
		Equipped = Victim.GetEquippedWeapon(True)
		If !PieceToStrip(McmConfig.SSNVNSet[0], 0, Equipped)
			Return
		Endif
		Armor Shield = Victim.GetEquippedShield()
		If !PieceToStrip(McmConfig.SSNVNSet[0], 0, Shield)
			Return
		Endif
		Wait(1.0)
	Endif
EndFunction
Function PieceToStrip(String Way, Int Slot, Form Weapons = None, Float WaitTime = 1.5, String Animation = "DefeatPickUp")
	Form Equipped
	If Weapons
		Equipped = Weapons
	Else
		Equipped = Victim.GetWornForm(Slot)
	Endif
	If (Equipped && (Way != "$Disabled"))
		If !Equipped.HasKeyWordString("SexLabNoStrip")
			If (Slot == 0x00000004)
				Animation = "DefeatStripAnim"
				WaitTime = 2.5
			Endif
			SendAnimationEvent(Aggressor, Animation)
			Wait(WaitTime)
			If (Way == "$UNEQUIP")
				Victim.UnequipItem(Equipped, False, True)
			Elseif (Way == "$STRIP")
				Victim.UnequipItem(Equipped, False, True)
				Victim.DropObject(Equipped)
			Elseif ((Way == "$STEAL") && IsHuman)
				Victim.UnequipItem(Equipped, False, True)
				Victim.RemoveItem(Equipped, 1, True, Aggressor)
			Endif
		Endif
	Endif
EndFunction
Bool Function ActorValid(Actor Target)
	Return (!Target.IsDead() && Target.Is3DLoaded() && !RessConfig.IsImmune(Aggressor))
EndFunction
Event OnDeath(Actor akKiller)
	DefeatConfig.Log("NVN spell OnDeath event - Slot"+NVNSlot+" / Victim - "+Victim+" / Aggressor - "+Aggressor)
	Restored()
EndEvent
Function Restored()
	Wait(2.0)
	Dispel()
EndFunction
Event OnEffectFinish(Actor Target, Actor Caster)
	RessConfig.VicPair[NVNSlot].Clear()
	RessConfig.AggPair[NVNSlot].Clear()
	ActorUtil.RemovePackageOverride(Aggressor, NVNAgressorPck[NVNSlot])
	If TheAdd
		RessConfig.AggPairAdd[NVNSlot].Clear()
		ActorUtil.RemovePackageOverride(TheAdd, NVNAgressorPck[NVNSlot])
		TheAdd = None
	Endif
	If !Victim.Is3DLoaded()
		RessConfig.Calm(Victim, Enter = False)
	Endif
	RessConfig.Calm(Aggressor, StayPut = False, Enter = False)
	DefeatConfig.Log("NVN OnEffectFinish - Victim - "+Victim+" // Aggressor - "+Aggressor+" // Slot - "+NVNSlot)
	Target.RemoveSpell(TheSpell)
EndEvent
Float Function Dist()
	If IsHuman
		Return 150.0
	Else
		If Aggressor.HasKeywordString("ActorTypeDragon")
			Return 600.0
		Else
			Return 200.0
		Endif
	Endif
EndFunction
Function UnequipWeapons(Actor Target)
	Int i = 5 ; Security for the loop to not be stuck just in case.
	Form EquippedWeapon = Target.GetEquippedWeapon()
	While (EquippedWeapon && (i > 5))
		Target.UnequipItem(EquippedWeapon, False, True)
		EquippedWeapon = Target.GetEquippedWeapon()
		i -= 1
	EndWhile
EndFunction
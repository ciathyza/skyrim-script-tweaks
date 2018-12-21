Scriptname DefeatPlayer extends ReferenceAlias

DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto
DefeatPAscr Property PostAssaultscr Auto
DefeatQTEMeter Property StruggleBar Auto
SexLabFramework SexLab
sslSystemConfig SexLabConfig
Import StorageUtil
Import Utility
Import Game
Import Debug

String Scenario
Bool Raped = False
Bool Robbed = False
Bool IsCreature
Bool ManualStart
Bool IsSurrender
Bool IsKnockout
Bool IsQTEKD
Bool NoTrans = False
Bool SpamGuard = False
Bool SSpamGuard = False
Bool StandingStruggle
Bool Enough
Actor QTEAggressor
Faction OwnerFaction
Faction CrimeFaction
Int CrimeGold
Int CrimeGoldViolent

Float FarMaxDist = 1500.0
Float Time

Bool IsBar ; Is the resist enabled?
Float DownedTime ; How much time the player will stay downed.
Bool HasFollower ; More difficult to get up is at least one follower is present.

Actor Player
ActorBase PlayerBase
ReferenceAlias Property PlayerFaction Auto
Bool PlayerIsFemale
Bool Tied = False
Bool Stripped = False
Float RobValue
Int TheRobWay

Int StrafeL
Int StrafeR
Bool QTEKeypressed = False
Bool LeftRight = True
Float FillDifficulty = 0.0
Float FillThreshold = 0.0
Int ResistTime = 0

Quest Property Detect Auto
ReferenceAlias[] Property DAggs Auto
ReferenceAlias[] Property DParts Auto
ReferenceAlias[] Property TheAggressors Auto
ReferenceAlias[] Property TheFollowers Auto
Actor[] Aggressors
Actor[] Accomplices
Actor[] Followers
Actor Persuer
Actor TheNext
ReferenceAlias Property AliasTheNext Auto
Actor TheLast
Actor LastHitAggressor
ReferenceAlias Property AliasLastAgg Auto
ReferenceAlias Property AliasLastVic Auto
ReferenceAlias[] Property CollaAgg Auto
ReferenceAlias[] Property CollaAggAdd Auto
ReferenceAlias[] Property CollaVic Auto
ReferenceAlias Property SceneCenter Auto
Actor AddOne
Actor AddTwo
Actor AddThree
Spell ComeOverHereSPL
ReferenceAlias ComeOverHereAlias

Int Property NumRapes = 0 Auto Hidden
Int Property NumAgg = 0 Auto Hidden

ObjectReference[] Property MiscReferences Auto Hidden
MiscObject[] Property MiscObjects Auto Hidden
FormList[] Property MiscFormLists Auto Hidden
Scene[] Property MiscScenes Auto Hidden
Message[] Property MiscMessages Auto Hidden

Event OnDeath(Actor akKiller)
	Clean()
Endevent
Function Clean()
	UnregisterForUpdate()
	Restored()
EndFunction
Function Install()
	SexLab = SexLabUtil.GetAPI()
	SexLabConfig = SexLabUtil.GetConfig()
	Player = (GetReference() As Actor)
	PlayerBase = Player.GetActorBase()
	Aggressors = New Actor[5]
	Accomplices = New Actor[5]
	Followers = New Actor[5]
	MiscObjects = New MiscObject[1]
	MiscObjects[0] = (GetFormFromFile(0x0F, "Skyrim.esm") As MiscObject) ; Gold
	MiscFormLists = New FormList[4]
	MiscFormLists[0] = (GetFormFromFile(0xDC642, "SexLabDefeat.esp") As FormList) ; MiscStuff
	MiscFormLists[1] = (GetFormFromFile(0xCBDE3, "SexLabDefeat.esp") As FormList) ; StrippedStuff
	MiscFormLists[2] = (GetFormFromFile(0x119C91, "SexLabDefeat.esp") As FormList) ; DefeatMarkerListExt
	MiscFormLists[3] = (GetFormFromFile(0x11A1F4, "SexLabDefeat.esp") As FormList) ; DefeatMarkerListInt
	MiscReferences = New ObjectReference[5]
	MiscMessages = New Message[3]
	MiscMessages[0] = None	; DefeatPAWaitFollowersMess
	MiscMessages[1] = (GetFormFromFile(0xCBDE2, "SexLabDefeat.esp") As Message)	; DefeatQTEAtkMess
	MiscMessages[2] = (GetFormFromFile(0xCB31D, "SexLabDefeat.esp") As Message)	; DefeatQTEStrafeMess
	MiscScenes = New Scene[4]
	MiscScenes[0] = (GetFormFromFile(0xB23F7, "SexLabDefeat.esp") As Scene) ; SCDowned
	MiscScenes[1] = (GetFormFromFile(0xABD69, "SexLabDefeat.esp") As Scene) ; SCEscape
	MiscScenes[2] = (GetFormFromFile(0xBD0C9, "SexLabDefeat.esp") As Scene) ; SCRobbing
	MiscScenes[3] = none;(GetFormFromFile(0xB54B2, "SexLabDefeat.esp") As Scene) ; SCCollateral
	ComeOverHereSPL = (GetFormFromFile(0x3145ED4, "SexLabDefeat.esp") As Spell)
	ComeOverHereAlias = (GetOwningQuest().GetAliasByName("ComeOverHere") As ReferenceAlias)
EndFunction
Function Uninstall()
	UnregisterForAllKeys()
	GoToState("Inactive")
EndFunction
Function Configure()
	Hkrefresh()
	GoToState("Running")
EndFunction
Function Hkrefresh()
	UnregisterForAllKeys()
	RegisterForKey(RessConfig.HotKeyInts[3]) ; Surrender key
EndFunction
State Inactive
EndState

String Property ForcedScene = "" Auto Hidden
Bool AllowPostAssaultOnly
Bool AllowStaydown
Bool AllowResist
Bool AllowRob
Bool AllowRelation
Bool AllowWitness
Bool AllowCommentary
Bool AllowPlayerCommentary
Function SceneSettings( String ForceScenario = "",	String ForceEvent = "",		Int ForcePostAssaultOnly = 3,	Int ForceStayDown = 3, 		Int ForceResist = 3, \
						Int ForceRob = 3, 			Int ForceRelation = 3,		Int ForceWitness = 3,			Int ForceCommentary = 3,	Int ForcePlayerCommentary = 3)
	If (ForceEvent != "")
		ForcedScene = ForceEvent
	Endif
	If (ForceScenario != "")
		Scenario = ForceScenario
	Else
		If IsCreature
			Scenario = McmConfig.CrScenario
		Else
			Scenario = McmConfig.KDScenario
		Endif
	Endif
	If (ForcePostAssaultOnly == 3)
		AllowPostAssaultOnly = False
	Else
		AllowPostAssaultOnly = ForcePostAssaultOnly
	Endif
	If (ForceStayDown == 3)
		AllowStaydown = McmConfig.StayDown
	Else
		AllowStaydown = ForceStayDown
	Endif
	If (ForceResist == 3)
		AllowResist = McmConfig.bResistQTE
	Else
		AllowResist = ForceResist
	Endif
	If (ForceRob == 3)
		AllowRob = Robbed
	Else
		AllowRob = ForceRob
	Endif
	If (ForceRelation == 3)
		AllowRelation = McmConfig.MoralityPvic
	Else
		AllowRelation = ForceRelation
	Endif
	If (ForceWitness == 3)
		AllowWitness = McmConfig.WitnessPvic
	Else
		AllowWitness = ForceWitness
	Endif
	If (ForceCommentary == 3)
		AllowCommentary = McmConfig.DialoguesPvic
	Else
		AllowCommentary = ForceCommentary
	Endif
	If (ForcePlayerCommentary == 3)
		AllowPlayerCommentary = McmConfig.CommentsPvic
	Else
		AllowPlayerCommentary = ForcePlayerCommentary
	Endif
EndFunction
Function SetKnockOut(Bool OnOff = True)
	IsKnockout = OnOff
EndFunction
Function SetAutoResist(Bool OnOff = True)
	StandingStruggle = OnOff
EndFunction
Function TriggerBleedOut()
EndFunction
State Running
	Function TriggerBleedOut()
		If McmConfig.PlayerEssential && LastHitAggressor && CheckAggressor(LastHitAggressor) && (LastHitAggressor.GetDistance(Player) < FarMaxDist) && DefeatTriggerActive(LastHitAggressor)
			Player.RestoreActorValue("Health", ((Player.GetActorValuePercentage("Health") * 100) - 80))
			Wait(1.0)
			DefeatTrigger(LastHitAggressor)
		Else
			RessConfig.PlayerEssential.Clear()
			Player.Kill()
		Endif
	EndFunction
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Actor Aggressor = (akAggressor As Actor)
		If Aggressor
			LastHitAggressor = Aggressor
			If !SpamGuard
				SpamGuard = True
				If (IsAggressorValid(Aggressor) && IsPlayerValid())
					If CheckAggressor(Aggressor)
						If KDWay(Aggressor, abPowerAttack, akSrc, abHitBlocked)
							Detect.Start()
							If IsKnockout
								SceneSettings(ForceStayDown = 1, ForceResist = 0, ForceRelation = 1, ForceWitness = 0)
								TheKnockDown(Aggressor)
							Elseif (StandingStruggle && !IsCreature && (Aggressor.GetDistance(Player) < 500.0) && RessConfig.SexInterest(Aggressor, True, False))
								SceneSettings(ForceResist = 0, ForceRelation = 0)
								KnockDownQTE(Aggressor)
							Else
								SceneSettings()
								TheKnockDown(Aggressor)
							Endif
							Detect.Stop()
							Return
						Endif
					Endif
				Endif
				Wait(2.0)
				SpamGuard = False
			Endif
		Endif
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If (KeyCode == RessConfig.HotKeyInts[3]) ; Surrender key
			If !SSpamGuard
				SSpamGuard = True
				If (!IsInMenuMode() && !Player.HasKeyWordString("FavorBrawlEvent") && !Player.IsOnMount() && Player.HasKeywordString("ActorTypeNPC") && !IsVampireLord())
					If Player.IsInCombat()
						SceneSettings()
						Surrender()
					Elseif !Player.HasKeyWordString("SexLabActive")
						Actor Target = (GetCurrentCrosshairRef() as Actor)
						If Target
							ComeOverHereAlias.Clear()
							RessConfig.SOForceGreet(Target)
						Else
							If !ComeOverHereAlias.GetReference()
								ComeOverHereSPL.Cast(Player)
							Else
								ComeOverHereAlias.Clear()
							Endif
						Endif
					Endif
				Endif
			Endif
			Wait(2.0)
			SSpamGuard = False
		Endif
	EndEvent		
EndState
; | Death Alternative trigger
Bool Function DefeatTriggerActive(Actor Aggressor)
	Return ((RessConfig.OnOffPlayerVictim) && !Player.HasKeywordString("FavorBrawlEvent") && !RessConfig.IsImmune(Player) && CheckAggressor(Aggressor) && !RessConfig.MiscQuests[6].IsRunning() && IsAggressorValid(Aggressor)) ; PlayerVicOnOff && DGIntimidateQuest && ImmunityEFF
EndFunction
Function DefeatTrigger(Actor Aggressor)
	Detect.Start()
	SceneSettings()
	TheKnockDown(Aggressor)
	Detect.Stop()
Endfunction
Function Surrender()
	IsSurrender = True
	Detect.Start()
	SetAggressors()
	If Aggressors[0]
		TheNext = Aggressors[0]
	Elseif Accomplices[0]
		TheNext = Accomplices[0]
	Endif
	If TheNext
		Actor Guard = IsThereGuard()
		If Guard
			RessConfig.DefeatMoan(Player, TheNext, "Flee", AllowPlayerCommentary)
			Player.SheatheWeapon()
			Restored()
			Return
		Endif
		RessConfig.WasAnEnemy = (TheNext.GetFactionReaction(Player) == 1) ; 0: Neutral / 1: Enemy / 2: Ally / 3: Friend
		TheNext.SetFactionRank(RessConfig.DefeatFactions[1], 2) ; AggFaction / Run toward the victim
		TheNext.EvaluatePackage()
		IsCreature = !TheNext.HasKeywordString("ActorTypeNPC")
		If !IsCreature
			ForceThirdPerson()
			PlayerFaction.ForceRefTo(Player)
			RessConfig.AddCalmList(TheNext, Player)
			DisablePlayerControls(1, 1, 1, 0, 1, 1, 0, 0) ;	(abMovement, abFighting, abCamSwitch, abLooking, abSneaking, abMenu, abActivate, abJournalTabs)
;			Player.EnableAI(False)
			SetPlayerAiDriven()
			Player.SetAnimationVariableBool("bSprintOK", False)
			RessConfig.DefeatMoan(Player, TheNext, "Flee", AllowPlayerCommentary)
			PlayerIsFemale = (SexLab.GetGender(Player) == 1)
			SetFollowers()
			SetAlertOff()
			RessConfig.LastSceneAggressors = Aggressors
			RessConfig.LastSceneAccomplices = Accomplices
			RessConfig.LastSceneFollowers = Followers
			NumAgg = RessConfig.HowMany("Aggressors")
			Player.SheatheWeapon()
			Float i = 4.0
			While (Player.IsWeaponDrawn() && (i > 0.0))
				Wait(0.5)
				i -= 0.5
			EndWhile
			RessConfig.DefeatPlayAnimation(Player, "Surrender")
			GoToState("Downed")
			EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; To display the hud
			Detect.Stop()
			Return
		Elseif (IsCreature && RessConfig.SexCombination(TheNext, Player, True))
			ForceThirdPerson()
			PlayerFaction.ForceRefTo(Player)
			RessConfig.AddCalmList(TheNext, Player)
			DisablePlayerControls(1, 1, 1, 0, 1, 1, 0, 0)
;			Player.EnableAI(False)
			SetPlayerAiDriven()
			Player.SetAnimationVariableBool("bSprintOK", False)
			RessConfig.DefeatMoan(Player, TheNext, "Flee", AllowPlayerCommentary)
			PlayerIsFemale = (SexLab.GetGender(Player) == 1)
			SetFollowers()
			SetAlertOff()
			RessConfig.LastSceneAggressors = Aggressors
			RessConfig.LastSceneAccomplices = Accomplices
			RessConfig.LastSceneFollowers = Followers
			NumAgg = RessConfig.HowMany("Aggressors")
			Player.SheatheWeapon()
			float i = 4.0
			While (Player.IsWeaponDrawn() && (i > 0.0))
				Wait(0.5)
				i -= 0.5
			EndWhile
			If Input.IsKeyPressed(RessConfig.HotKeyInts[3]) ; Surrender key
				RessConfig.DefeatPlayAnimation(Player, "Submission")
				Wait(1.0)
				GoToState("Downed")
			Else
				SendAnimationEvent(Player, "IdleCowering")
				GoToState("Downed")
			Endif
			EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; To display the hud
			Detect.Stop()
			Return
		Else
			Notification("$You can't surrender to this enemy.")	
		Endif
	Endif
	IsSurrender = False
	Detect.Stop()
Endfunction
Function SetSurrenderSpeaker(Actor Aggressor)
	TheNext = Aggressor
	AliasLastAgg.ForceRefTo(TheNext)
	TheNext.SetFactionRank(RessConfig.DefeatFactions[1], 1) ; AggFaction
	TheNext.EvaluatePackage()
EndFunction
State ForceGreetWait																			;===== ForceGreetWait
	Event OnBeginState()
		Time = -1.0
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnUpdate()
		Time += 1
		If TheNext.IsInDialogueWithPlayer()
			Return
		Elseif (Time > 10.0)
			Restored()
			Return
		Endif
		TheNext.EvaluatePackage()
		RegisterForSingleUpdate(2.0)
	EndEvent
EndState

Function KnockDownQTE(Actor Aggressor)
	If (!Player.HasKeywordString("ActorTypeNPC") || IsVampireLord())
		TheKnockDown(Aggressor)
	Else
		ForceThirdPerson()
		PlayerFaction.ForceRefTo(Player)
		CrimeHandle()
		RessConfig.AddCalmList(Aggressor, Player)
		UnequipWeapons(Player)
		DisablePlayerControls(1, 1, 1, 0, 1, 1, 0, 0) ;	(abMovement, abFighting, abCamSwitch, abLooking, abSneaking, abMenu, abActivate, abJournalTabs)
		Wait(0.5) ; Need to wait a little for the player to sheathe or camera bug...
		UnequipWeapons(Aggressor)
		SetAggressors(Aggressor)
		EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; To display the hud
		QTEAggressor = Aggressor
		RessConfig.StruggleSceneTrigger(Aggressor, Player, "Player Victim", IsCreature, True)
		SetFollowers()
		SetAlertOff()
	Endif
Endfunction
Function StruggleFail(Actor StruggleVictim, Actor StruggleAggressor, Bool StruggleStanding = False)
	If StruggleStanding
;		DefeatPlayAnimation(Player, "Bleedout")
		SendAnimationEvent(StruggleVictim, "IdleWounded_02")
		KnockDownQTEFail(StruggleAggressor)
	Else
		SendAnimationEvent(StruggleVictim, "IdleWounded_02")
		PreDownRape()
	Endif
EndFunction
Function KnockDownQTEFail(Actor Aggressor)
	SetPlayerAiDriven()
	TheNext = None
	RessConfig.LastSceneAggressors = Aggressors
	RessConfig.LastSceneAccomplices = Accomplices
	RessConfig.LastSceneFollowers = Followers
	NumAgg = RessConfig.HowMany("Aggressors")
	PlayerIsFemale = (SexLab.GetGender(Player) == 1)
	IsSurrender = False
	IsQTEKD = True
	If Followers[0]
		GoTostate("Downed")
	Else
		GoTostate("MightRecover")
	Endif
Endfunction
Function TheKnockDown(Actor Aggressor = None)
;	PlayerBase.SetInvulnerable(True)
	ForceThirdPerson()
	PlayerFaction.ForceRefTo(Player)
	CrimeHandle()
	RessConfig.AddCalmList(Aggressor, Player)
	RessConfig.DefeatPlayAnimation(Player, "Bleedout")
	DisablePlayerControls(1, 1, 1, 0, 1, 1, 0, 0) ;	(abMovement, abFighting, abCamSwitch, abLooking, abSneaking, abMenu, abActivate, abJournalTabs)
	SetPlayerAiDriven()
	Player.SetAnimationVariableBool("bSprintOK", False)
	RessConfig.DefeatMoan(Player, Player, "Death", AllowPlayerCommentary)
	PlayerIsFemale = (SexLab.GetGender(Player) == 1)
	IsSurrender = False
	IsQTEKD = False
	If (Scenario == "$No Transition")
		Wait(0.5)
		NoTrans = True
		TheNext = Aggressor
		If (McmConfig.NoTranAutoResist && !IsCreature && (TheNext.GetDistance(Player) < 500.0) && RessConfig.SexInterest(TheNext, True, False))
			EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; To display the hud
			RessConfig.StruggleSceneTrigger(TheNext, Player, "Player Victim")
		Else
			sslBaseAnimation[] Anims
			sslThreadModel TheRape
			If !IsCreature
				String AnimationSet
				If Tied
					Anims = SexLab.GetAnimationsByTags(2, McmConfig.TiedTagPvic, McmConfig.TiedSupressTagPvic, McmConfig.TiedRequireAllTagPvic)
					AnimationSet = "TiedPvic"
				Endif
				If (Anims.length == 0)
					Int GenderCombination = RessConfig.GenderCombination(Player, TheNext)
					If (GenderCombination == 2)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoMTagPvic, McmConfig.FoMSupressTagPvic, McmConfig.FoMRequireAllTagPvic)
						AnimationSet = "FoMPvic"
					Elseif (GenderCombination == 3)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoFTagPvic, McmConfig.FoFSupressTagPvic, McmConfig.FoFRequireAllTagPvic)
						AnimationSet = "FoFPvic"
					Endif
				Endif
				If (Anims.length == 0)
					AnimationSet = "RapePvic"
				Endif
				TheRape = RessConfig.SexLabScene(Player, TheNext, CustomAnimations = Anims, Tags = McmConfig.RapeTagPvic, SupressTags = McmConfig.RapeSupressTagPvic, TagsRequireAll = McmConfig.RapeRequireAllTagPvic, FemaleFirst = AnimationSet)
			Else
				TheRape = RessConfig.SexLabScene(Player, TheNext, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPvic, SupressTags = McmConfig.CreatureSupressTagPvic, TagsRequireAll = McmConfig.CreatureRequireAllTagPvic)
			Endif
			TheRape.DisableRagdollEnd(Player)
			RegisterForModEvent("AnimationEnd_DefeatPvic", "EndPr")
			TheRape.SetHook("DefeatPvic")
			sslThreadController Thread = TheRape.StartThread()
			If Thread
				RessConfig.Weakenings(Player, RemoveSpl = True)
				Player.AddSpell(RessConfig.MiscSpells[1], False) ; DebuffConsSPL
				Raped = True
				Wait(2.0)
				EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; For the HUD to appear after SexLab triggered a sex scene, the player should still be ai driven and unable to move
				If (AllowResist && (McmConfig.ResistFillStamina > 0.0))
					GoToState("PushAway")
				Endif
			Else
				DefeatConfig.Log("Error: Player victim, Animation did not start, something went wrong with the scene, check your SexLab settings")
				Restored()
			Endif
		Endif
	Else
		TheNext = None
		SetAggressors(Aggressor)
		SetFollowers()
		SetAlertOff()
		RessConfig.LastSceneAggressors = Aggressors
		RessConfig.LastSceneAccomplices = Accomplices
		RessConfig.LastSceneFollowers = Followers
		NumAgg = RessConfig.HowMany("Aggressors")
		If !Player.HasKeywordString("ActorTypeNPC")
			If RessConfig.MiscQuests[7].IsRunning() ; WerewolfQst
				SendAnimationEvent(Player, "BleedoutStart")
				If RessConfig.MiscQuests[7].IsRunning()
					RessConfig.MiscQuests[7].SetStage(100); as PlayerWerewolfChangeScript).ShiftBack()
					float i = 5.0
					While (Player.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
						Wait(0.2)
						i -= 0.2
					EndWhile
				Endif
				RessConfig.DefeatMoan(Player, Player, "Death", AllowPlayerCommentary)
				SendAnimationEvent(Player, "BleedoutStart")
			Elseif IsVampireLord()
				If RessConfig.MiscQuests[8].IsRunning() ; VampireLordQst
					SendAnimationEvent(Player, "BleedoutStart")
					RessConfig.MiscQuests[8].SetStage(100); as dlc1playervampirechangescript).ShiftBack()
					float i = 5.0
					While (Player.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
						Wait(0.2)
						i -= 0.2
					EndWhile
					RessConfig.DefeatMoan(Player, Player, "Death", AllowPlayerCommentary)
					SendAnimationEvent(Player, "BleedoutStart")
				Endif
			Endif
		Endif
		If IsKnockout
			GoToState("KnockedOut")
		Else
			EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; To display the hud
			GoToState("Downed")
		Endif
	Endif
	UpdatePackages()
EndFunction

State KnockedOut
	Event OnBeginState()
		IsQTEKD = True ; for the player to use stand animation to get up in restored function
		DownedTime = 15.0
		Time = 0.0
		Wait(1)
		Player.PushActorAway(Player, 0.1)
		RessConfig.FadeOut(2.5)
		Wait(3)
		RegisterForAnimationEvent(Player, "GetUpEnd")
		SetPlayerAiDriven(False) ; makes the player get up during black screen
	EndEvent
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		UnregisterForAnimationEvent(Player, "GetUpEnd")
		KnockdownFollowers()
		Wait(1.0)
		If StillFighting()
			RegisterForSingleUpdate(1.0)
		Else
			KnockoutProceed()
		Endif
	EndEvent
	Event OnUpdate()
		If (Time > DownedTime) ; DownedTime passed, player wakes up, sit and switch to downed state
			RessConfig.DefeatPlayAnimation(Player, "Sit")
			Wait(0.5)
			RessConfig.FadeIn(3.0)
			EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; To display the hud
			GoTostate("Downed")
		Elseif StillFighting()
			Time += 1.0
			RegisterForSingleUpdate(1.0)
		Else
			KnockoutProceed()
		Endif
	EndEvent
EndState
Bool Function IsPlayerKnokedOut()
	Return IsKnockout
EndFunction
Function KnockoutProceed()
	TheLast = FindAggOrAcc() ; Is there an aggressor alive?
	If TheLast 
		If SetNextAgg()
			SetAdds()
			Strip(Player, TheNext)
			sslBaseAnimation[] Anims
			sslThreadModel TheRape
			String AnimationSet
			If !AddOne
				If !IsCreature
					If (Anims.length == 0)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.KOTagPvic, McmConfig.KOSupressTagPvic, McmConfig.KORequireAllTagPvic)
						AnimationSet = "KOPvic"
					Endif
					If (Anims.length == 0)
						AnimationSet = "RapePvic"
					Endif
					TheRape = RessConfig.SexLabScene(Player, TheNext, AddOne, AddTwo, AddThree, CustomAnimations = Anims, Tags = McmConfig.RapeTagPvic, SupressTags = McmConfig.RapeSupressTagPvic, TagsRequireAll = McmConfig.RapeRequireAllTagPvic, FemaleFirst = AnimationSet)
				Else
					TheRape = RessConfig.SexLabScene(Player, TheNext, AddOne, AddTwo, AddThree, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPvic, SupressTags = McmConfig.CreatureSupressTagPvic, TagsRequireAll = McmConfig.CreatureRequireAllTagPvic)
				Endif
			Else
				If !IsCreature
					Int ActorCount = 3
					If AddThree
						ActorCount = 5
					Elseif AddTwo
						ActorCount = 4
					Endif
					Anims = SexLab.GetAnimationsByTags(ActorCount, McmConfig.KOTagPvic, McmConfig.KOSupressTagPvic, McmConfig.KORequireAllTagPvic)
					AnimationSet = "KOPvic"
					If (Anims.length == 0)
						AnimationSet = "MultPvic"
					Endif
					TheRape = RessConfig.SexLabScene(Player, TheNext, AddOne, AddTwo, AddThree, CustomAnimations = Anims, Tags = McmConfig.MultipleTagPvic, SupressTags = McmConfig.MultipleSupressTagPvic, TagsRequireAll = McmConfig.MultipleRequireAllTagPvic, FemaleFirst = AnimationSet)
				Else
					TheRape = RessConfig.SexLabScene(Player, TheNext, AddOne, AddTwo, AddThree, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPvic, SupressTags = McmConfig.CreatureSupressTagPvic, TagsRequireAll = McmConfig.CreatureRequireAllTagPvic)
				Endif
			Endif
			UnequipWeapons(TheNext)
			RapedStats(TheNext)
			sslBaseVoice ToVoice = SexLab.GetVoice(Player)
			TheRape.SetVoice(Player, ToVoice, True)
			TheRape.DisableRagdollEnd(Player)
			RegisterForModEvent("AnimationEnd_DefeatPvic", "EndPr")
			TheRape.SetHook("DefeatPvic")
			sslThreadController Thread = TheRape.StartThread()
			If Thread
				RessConfig.Weakenings(Player, RemoveSpl = True)
				Player.AddSpell(RessConfig.MiscSpells[1], False) ; DebuffConsSPL
				Raped = True
				If McmConfig.CollateralAssault
					Int i
					While (i < 5)
						Actor[] CollateralActors
						CollateralActors = CollateralGetActors()
						If CollateralActors[0]
							StripRegister(CollateralActors[0])
							UnequipWeapons(CollateralActors[1])
							Actor TheAdd = CollateralGetActorAdd(CollateralActors[0], CollateralActors[1])
							CollateralRape(CollateralActors[0], CollateralActors[1], TheAdd)
						Else
							i = 5 ; no available combination, end the loop
						Endif
						i += 1
					EndWhile
				Endif
				SceneSettings(ForceResist = 0, ForceRelation = 0, ForceWitness = 3, ForceCommentary = 0, ForcePlayerCommentary = 0)
				Wait(3.0)
				EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; To display the hud
				RessConfig.FadeIn(3.0)
			Else
				DefeatConfig.Log("Error: Player victim, Animation did not start, something went wrong with the scene, check your SexLab settings")
				Restored()
			Endif
		Else ; If no aggressor sexually interested 
			NumAgg = RessConfig.HowMany("Accomplices")
			If McmConfig.CollateralAssault
				Int i
				While (i < 5)
					Actor[] CollateralActors
					CollateralActors = CollateralGetActors()
					If CollateralActors[0]
						StripRegister(CollateralActors[0])
						UnequipWeapons(CollateralActors[1])
						Actor TheAdd = CollateralGetActorAdd(CollateralActors[0], CollateralActors[1])
						CollateralRape(CollateralActors[0], CollateralActors[1], TheAdd)
					Else
						i = 5 ; no available combination, end the loop
					Endif
					i += 1
				EndWhile
			Endif
			Wait(1.0)
			If StillBusy() ; Check if one aggressor or follower is still busy
				RessConfig.DefeatPlayAnimation(Player, "Unconscious")
				RessConfig.FadeIn(3.0)
				EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; For the HUD to appear to fill the bar during Followerwait
				GoToState("FollowerWait")
				Return ; prevent switch to state "" at the end of this function
			Else
				If AllowedToBeRobbed()
					RobValuable(Player, TheLast)
				Endif
				RessConfig.DefeatPlayAnimation(Player, "Unconscious") ; Wake up sitting and postassault
				PostAssault()
			Endif
		Endif
	Else ; all aggressors are dead
		RessConfig.DefeatPlayAnimation(Player, "Unconscious") ; Wake up sitting and simple escape after 3 seconds
		RessConfig.FadeIn(3.0)
		Wait(5.0)
		RessConfig.CastImmune(Player)	; Simple escape
		PostAssault() 					; 
	Endif
	GoToState("")
EndFunction
Actor Function FindAggOrAcc(Bool IsAggressor = True)
	Int i
	If IsAggressor
		While (i < 5)
			If Aggressors[i] && !Aggressors[i].IsDead()
				Return Aggressors[i]
			Endif
			i += 1
		EndWhile
		i = 0
		While (i < 5)
			If Accomplices[i] && !Accomplices[i].IsDead()
				Return Accomplices[i]
			Endif
			i += 1
		EndWhile
	Else
		i = 0
		While (i < 5)
			If Accomplices[i] && !Accomplices[i].IsDead()
				Return Accomplices[i]
			Endif
			i += 1
		EndWhile
	Endif
	Return None
EndFunction
Actor Function FindValidFollower()
	Int i = 0
	While (i < 5)
		If Followers[i] && (RessConfig.VictimState(Followers[i]) == "")
			Return Followers[i]
		Endif
		i += 1
	EndWhile
EndFunction
;Event OnRaceSwitchComplete()
;	Notification("OnRaceSwitchComplete fires!")

;	if ( GetActorReference() == Game.GetPlayer() )
 ;   		Game.GetPlayer().GetActorBase().SetInvulnerable( false )
  ;  		Game.GetPlayer().SetGhost( false )
	;endif
;
;	if (GetActorReference().GetRace() == VampireLordRace)
;		Debug.Trace("VAMPIRE: Getting notification that race swap TO vampire is complete.")
;		(GetOwningQuest() as DLC1PlayerVampireChangeScript).StartTracking()
;	else
;		Debug.Trace("VAMPIRE: Getting notification that race swap FROM vampire is complete.")
;		(GetOwningQuest() as DLC1PlayerVampireChangeScript).Shutdown()
 ;	endif
;EndEvent

Bool Function KDAllowed(Actor Aggressor)
	Return (!Player.IsInKillMove() && !RessConfig.IsImmune(Player) && !Player.HasKeywordString("FavorBrawlEvent") && !RessConfig.MiscQuests[6].IsRunning()) ; DGIntimidateQuest
EndFunction
Bool Function KDWay(Actor Aggressor, Bool PowerAttack, Form HitSource, Bool Blocked)
;	DefeatConfig.log("KDWay - Blocked - "+Blocked+" / McmConfig.KDHealthBlock - "+McmConfig.KDHealthBlock+" / McmConfig.KDStaminaBlock - "+McmConfig.KDStaminaBlock+" / McmConfig.KDPowerABlock - "+McmConfig.KDPowerABlock)
	If KDAllowed(Aggressor)
		If (Aggressor.GetDistance(Player) < FarMaxDist)
			If McmConfig.KDWayThreshold ; Wound
				If Blocked && McmConfig.KDHealthBlock
					Return False
				Endif
				Float PlayerHealth = (Player.GetActorValuePercentage("Health") * 100)  
				If ((RandomInt(1, 100) <= McmConfig.ChanceOnHitPvic) && (PlayerHealth <= McmConfig.ThresholdPvic) && (PlayerHealth >= McmConfig.ThresholdPvicMin)) ; !Player.IsWeaponDrawn()
					IsKnockout = (RandomInt(1, 100) <= McmConfig.KnockOutHPvic) && !RessConfig.Tied(Player)
					If !IsKnockout
						StandingStruggle = McmConfig.bResistQTE && (RandomInt(1, 100) <= McmConfig.SStruggleHealthPvic)
					Endif
					Return True
				Endif
			Endif
			If McmConfig.KDWayStamina ; Exhaustion
				If Blocked && McmConfig.KDStaminaBlock
					Return False
				Endif
				Float PlayerStamina = (Player.GetActorValuePercentage("Stamina") * 100)
				If OnlyBack(McmConfig.KDWayStaminaOB, Aggressor)
					If ((RandomInt(1, 100) <= McmConfig.ChanceOnHitPvicS) && (PlayerStamina <= McmConfig.ExhaustionPvic))
						IsKnockout = (RandomInt(1, 100) <= McmConfig.KnockOutSPvic) && !RessConfig.Tied(Player)
						If !IsKnockout
							StandingStruggle = McmConfig.bResistQTE && (RandomInt(1, 100) <= McmConfig.SStruggleExhaustionPvic)
						Endif
						Return True
					Endif
				Endif
			Endif
			If PowerAttack
				If McmConfig.KDWayPowerAtk ; Stun
					If Blocked && McmConfig.KDPowerABlock
						Return False
					Endif
					Weapon TheSource = (HitSource as weapon)
					If TheSource
						If ((RandomInt(1, 100) <= McmConfig.KDWayPowerAtkCOH) && ((TheSource.GetStagger() * 100) >= McmConfig.PowerAtkStagger))
							IsKnockout = (RandomInt(1, 100) <= McmConfig.KnockOutPPvic) && !RessConfig.Tied(Player)
							If !IsKnockout
								StandingStruggle = McmConfig.bResistQTE && (RandomInt(1, 100) <= McmConfig.SStrugglePowerPvic)
							Endif
							Return True
						Endif
					Endif
				Endif
			Endif
		Endif
	Endif
	Return False
EndFunction
Bool Function OnlyBack(Bool TheOption, Actor Aggressor)
	If TheOption
		Float Fangle = (Player.GetHeadingAngle(Aggressor))
		If ((Fangle < 110) && (Fangle > -110)) ; Returns FALSE for a hit in the back
			Return False
		Else
			Return True
		Endif
	Endif
	Return True
EndFunction
Bool Function CheckActor(Actor Target = None)
	If (Target && (Target.IsDead() || Target.IsCommandedActor() || !Target.Is3DLoaded()))
		Int i = Aggressors.Find(Target)
		If (i != -1)
			Aggressors[i] = None
			TheAggressors[i].Clear()
			NumAgg -= 1
			DefeatConfig.Log("CheckActor Remove aggressor - "+Target+" / Slot - "+i)
			Return False
		Endif
		i = Accomplices.Find(Target)
		If (i != -1)
			Accomplices[i] = None
			TheAggressors[i + 5].Clear()
			DefeatConfig.Log("CheckActor Remove accomplice - "+Target+" / Slot - "+i)
			Return False
		Endif
	Endif
	Return True
EndFunction
Bool Function CheckAggressor(Actor Aggressor)
	If (IsSurrender || McmConfig.EveryonePvic)
		Return True
	Else
		If (IsCreature && (!McmConfig.HuntCrea || !RessConfig.AllowedCreature(Aggressor) || !SexLab.AllowedCreature(Aggressor.GetLeveledActorBase().GetRace())))
			Return False
		Endif
		Return RessConfig.IsSexualAssaulter(Aggressor, Player, True)
	Endif
EndFunction
Bool Function IsAggressorValid(Actor Aggressor)
	If !Aggressor.IsGhost()
		If Aggressor.HasKeywordString("ActorTypeNPC")
			IsCreature = False
			Return True
		Else;if Aggressor.HasKeywordString("ActorTypeCreature")
			IsCreature = True
			Return True
		Endif
	Endif
	Return False
EndFunction
Bool Function IsPlayerValid()
	If !Player.IsOnMount() && !Player.HasKeywordString("DefeatActive")
		If !Player.HasKeywordString("ActorTypeNPC")
			Return McmConfig.BeastImmunity
		Else
			Return True
		Endif
	Endif
	Return False
EndFunction
Bool Function IsVampireLord()
	Return (RessConfig.DawnguardOn && (Player.GetRace() == RessConfig.VampireLordRace))
EndFunction
;=============================================================================================================================== NPCS HANDLING
Function SetAggressors(Actor Agg = None)
	If (Agg && Aggressors.Find(Agg) == -1)
		AddAggressor(Agg, 0)
	Endif
	Int i
	While (i < 10)
		Actor Reference = (DAggs[i].GetReference() As Actor)
;		DefeatConfig.Log("SetAggressors slot - "+i)
		If Reference
			If !Reference.IsInFaction(RessConfig.DefeatFactions[1]) ; AggFaction
				Int Slot = Aggressors.Find(None)
				If (RessConfig.SexCombination(Reference, Player, True) && (Slot != -1))
					Aggressors[Slot] = Reference
					TheAggressors[Slot].ForceRefTo(Reference)
					DefeatConfig.Log("SetAggressors Aggressor / Slot filled - "+Slot+" // Aggressor -> "+Aggressors[Slot])
					Reference.EvaluatePackage()
				Else
					Slot = Accomplices.Find(None)
					If (Slot != -1)
						Accomplices[Slot] = Reference
						TheAggressors[Slot + 5].ForceRefTo(Reference)
						DefeatConfig.Log("SetAggressors Accomplices / Slot filled - "+Slot+" // Accomplice -> "+Accomplices[Slot])
						Reference.EvaluatePackage()
					Endif
				Endif
			Endif
		Endif
		i += 1
	EndWhile
	DefeatConfig.Log("SetAggressors / Aggressors slots - "+Aggressors)
	DefeatConfig.Log("SetAggressors / Accomplices slots - "+Accomplices)
EndFunction
Function SetFollowers()
	Int i
	While (i < 5)
		Actor Reference = (DParts[i].GetReference() As Actor)
		If Reference
			Followers[i] = Reference
			TheFollowers[i].ForceRefTo(Reference)
			DefeatConfig.Log("SetFollowers / Slot filled - "+i+" // Follower - "+Followers[i])
			String TheState = RessConfig.VictimState(Reference)
			If (TheState == "") ; The follower is doing well
				If (IsSurrender && McmConfig.FollowerSurrender)
					RessConfig.Surrender(Followers[i])
				Elseif (Scenario == "$All Down") || IsSurrender ; Make aggressor attack remaining followers in case of all down or surrender with FollowerSurrender disabled
					Int n
					While (n < 5)
						If (Aggressors[n] && CheckActor(Aggressors[n]) && !Aggressors[n].GetAnimationVariableBool("bIsSynced"))
;							DefeatConfig.Log(Aggressors[n]+" attacks "+Reference)
							Aggressors[n].StartCombat(Reference)
							Reference.StartCombat(Aggressors[n])
						Endif
						If (Accomplices[n] && CheckActor(Accomplices[n]))
							Accomplices[n].StartCombat(Reference)
							Reference.StartCombat(Accomplices[n])
						Endif
						n += 1
					EndWhile
				Else ; "Original" scenario, every follower gets knocked down
					RessConfig.Knockdown(Reference, Duration = 60.0, Type = "Player Victim")
				Endif
			Else
				If (TheState == "BleedOut")
					RessConfig.Knockdown(Reference, Duration = 60.0, Type = "Player Victim")
				Endif
			Endif
		Endif
		i += 1
	EndWhile
	DefeatConfig.Log("SetFollowers / Scenario - "+Scenario+" // Followers slots - "+Followers)
EndFunction
Function KnockdownFollowers()
	Int i
	While (i < 5)
		If Followers[i]
			RessConfig.Knockdown(Followers[i], Duration = 60.0, Type = "Player Victim")
		EndIf
		i += 1
	EndWhile
EndFunction
;=============================================================================================================================== NPCS HANDLING
Bool Function StillFighting()
	Int i
	While (i < 5)
		If (Aggressors[i] && Aggressors[i].IsInCombat()) || (Accomplices[i] && Accomplices[i].IsInCombat()) || (Followers[i] && Followers[i].IsInCombat())
			Return True
		Endif
		i += 1
	EndWhile
	Return False
EndFunction
Actor Function IsThereGuard()
	Int i
	While (i < 5)
		If (Aggressors[i] && Aggressors[i].IsGuard())
			Return Aggressors[i]
		Elseif (Accomplices[i] && Accomplices[i].IsGuard())
			Return Accomplices[i]
		Endif
		i += 1
	EndWhile
	Return None
EndFunction
Function CrimeHandle()
	Actor Guard = IsThereGuard()
	If Guard
		CrimeFaction = Guard.GetCrimeFaction()
		CrimeGold = CrimeFaction.GetCrimeGold()
		CrimeGoldViolent = CrimeFaction.GetCrimeGoldViolent()
		CrimeFaction.ModCrimeGold(-CrimeGold)
		CrimeFaction.ModCrimeGold(-CrimeGoldViolent, True)
	Endif
EndFunction
Function SetAlertOff()
	Int i
	While (i < 5)
		If (Aggressors[i] && Aggressors[i].IsAlerted())
			Aggressors[i].SetAlert(False)
		Endif
		If (Accomplices[i] && Accomplices[i].IsAlerted())
			Accomplices[i].SetAlert(False)
		Endif
		i += 1
	EndWhile
EndFunction

State Downed																					;===== STATE DOWNED
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Actor Aggressor = (akAggressor As Actor)
		If (Aggressor && (Aggressors.Find(Aggressor) != -1) && (Accomplices.Find(Aggressor) != -1))
			RessConfig.AddCalmList(Aggressor, Player)
		Endif
	EndEvent
	Event OnBeginState()
		DownedTime = 15.0
		Time = 0.0
		IsBar = AllowResist
		If StillFighting() ; Check if there is an aggressor is still in combat for some reason (because of a followers or other npcs in combat with them) and if so make the state loop to give a chance to the player to get up.
			If IsSurrender
				FillThreshold = 0.05
				StruggleBar()
			Else
				MiscScenes[0].Start() ; Downed scene
				Actor IsFollower = FindValidFollower()
				HasFollower = (IsFollower && (IsFollower.GetDistance(Player) < 3000))
				If IsBar
					If HasFollower
						FillThreshold = 0.005
					Else
						FillThreshold = 0.008
					Endif
					StruggleBar()
	;				EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; For the HUD to appear or else the bar will not be displayed, the player should be ai driven and not be able to move
				Else
					If HasFollower
						DownedTime = 30.0
					Endif
				Endif
			Endif
			RegisterForSingleUpdate(1.0)
		Else
			If IsSurrender
				If !TheNext.IsDead()
					If !IsCreature
						SetSurrenderSpeaker(TheNext)
						RessConfig.SurrenderData(Player, TheNext)
						RessConfig.QSTStage = 10
						GoTostate("ForceGreetWait")
					Else
						GoToState("MightRecover")
					Endif
				else
					Restored()
				endif
			Else
				FillThreshold = 0.005
				If IsBar
					StruggleBar()
				Endif
				GoToState("MightRecover")
			Endif
		Endif
	EndEvent
	Event OnUpdate() ; Loop to check the situation every 1 second.
		Time += 1.0
		If StillFighting()
			If IsSurrender
				If (StruggleBar.Percent >= 1.0) || TheNext.IsDead() ; Bar filled, player get up, only if resist bar is enabled.
					StruggleBar(False)
					Restored()
					Return
				Endif
			Else
				If IsBar && (StruggleBar.Percent >= 1.0) ; Bar filled, player get up, only if resist bar is enabled.
					StruggleBar(False)
					Restored()
					Return
				Elseif !IsBar && (Time > DownedTime) ; DownedTime passed, player get up, only if resist bar is disabled.
					Restored()
					Return
				Endif
			Endif
		Else
			If IsSurrender
				StruggleBar(False)
				If !IsCreature
					SetSurrenderSpeaker(TheNext)
					RessConfig.SurrenderData(Player, TheNext)
					RessConfig.QSTStage = 10
					GoToState("ForceGreetWait")
				Else
					GoToState("MightRecover")
				Endif
			Else
				GoToState("MightRecover")
			Endif
			Return
		Endif
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If ((KeyCode == StrafeL) && LeftRight)
			LeftRight = False
			FillDifficulty += FillThreshold
			StruggleBar.Percent = (FillDifficulty)
		Elseif ((KeyCode == StrafeR) && !LeftRight)
			LeftRight = True
			FillDifficulty += FillThreshold
			StruggleBar.Percent = (FillDifficulty)
		Elseif (KeyCode == RessConfig.HotKeyInts[3]) ; Surrender key
			If IsSurrender  ; Ask the follower to surrender too if they are still fighting
				Int i
				While (i < 5)
					If Followers[i]
						String TheState = RessConfig.VictimState(Followers[i])
						If (TheState == "")
							RessConfig.Surrender(Followers[i])
						Endif
					Endif
					i += 1
				EndWhile
			Endif
		Endif
	EndEvent
EndState
State MightRecover																			    ;===== STATE MIGHT RECOVER
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Actor Aggressor = (akAggressor As Actor)
		If (Aggressor && (Aggressors.Find(Aggressor) != -1) && (Accomplices.Find(Aggressor) != -1))
			RessConfig.AddCalmList(Aggressor, Player)
		Endif
	EndEvent
	Event OnBeginState()
		Tied = RessConfig.Tied(Player) ; Check if the player is tied
		TheLast = Aggressors[0]
		If (!Aggressors[0] && Accomplices[0])
			NumAgg = RessConfig.HowMany("Accomplices")
		Endif
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnUpdate()
		Time += 1.0
;		DefeatConfig.Log("MightRecover / Time -> "+Time+" / DownedTime - "+DownedTime+" / TheNext -> "+TheNext)
		If SetNextAgg()
			If (IsBar && (StruggleBar.Percent >= 1.0)) ; Bar filled, player get up, only if resist bar is enabled.
				StruggleBar(False)
				Restored()
				Return
			Elseif ((TheNext.GetDistance(Player) < Dist(TheNext)) && !TheNext.IsInCombat())
				StruggleBar(False)
				GotoState("AssaultMode")
				Return
			Elseif (!IsBar && Time > DownedTime) ; The next aggressor did not reach the player in time for whatever reason, the player gets up.
				Restored()
				Return
			Endif
		Else
			Actor FirstAggressor = FindAggOrAcc()
			If FirstAggressor ; No aggressors but at least 1 accomplice is alive
				If (IsBar && (StruggleBar.Percent >= 1.0)) ; Bar filled, player get up, only if resist bar is enabled.
					StruggleBar(False)
					Restored()
					Return
				Elseif !FirstAggressor.IsInCombat()
					StruggleBar(False)
					TheLast = FirstAggressor
					GotoState("AssaultMode")
					Return
				Elseif !IsBar && (Time > DownedTime) ; The next aggressor did not reach the player in time for whatever reason, the player gets up.
					Restored()
					Return
				Endif
			Else
				If IsBar
					StruggleBar(False)
				Endif
				If (Aggressors[0] && RessConfig.IsSatisfied(Aggressors[0]))
					RessConfig.CastImmune(Player)
					PostAssault()
				Else
					Restored()
				Endif
				Return
			Endif
		Endif
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If ((KeyCode == StrafeL) && LeftRight)
			LeftRight = False
			FillDifficulty += FillThreshold
			StruggleBar.Percent = (FillDifficulty)
		Elseif ((KeyCode == StrafeR) && !LeftRight)
			LeftRight = True
			FillDifficulty += FillThreshold
			StruggleBar.Percent = (FillDifficulty)
		Endif
	EndEvent	
EndState
State Escape																					;===== STATE ESCAPE
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Actor Aggressor = (akAggressor As Actor)
		If (Aggressor && (Aggressors.Find(Aggressor) != -1) && (Accomplices.Find(Aggressor) != -1))
			RessConfig.AddCalmList(Aggressor, Player)
		Endif
	EndEvent
	Event OnBeginState()
		FillThreshold = 0.060	
		StruggleBar()
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnUpdate()
		If (StruggleBar.Percent >= 1.0)
			RegisterForSingleUpdate(10.0)
			StruggleBar(False)
			RessConfig.DefeatPlayAnimation(Player, "Stand")
			SetPlayerAiDriven(False)
			GoToState("Flee")
			Return
		Endif
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If ((KeyCode == StrafeL) && LeftRight)
			LeftRight = False
			FillDifficulty += FillThreshold
			StruggleBar.Percent = (FillDifficulty)
		Elseif ((KeyCode == StrafeR) && !LeftRight)
			LeftRight = True
			FillDifficulty += FillThreshold
			StruggleBar.Percent = (FillDifficulty)
		Endif
	EndEvent
EndState
State Flee
	Event OnUpdate()
		MiscScenes[1].Stop() ; SCEscape
	EndEvent
EndState
State AssaultMode 																				;===== STATE ASSAULT MODE
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Actor Aggressor = (akAggressor As Actor)
		If (Aggressor && (Aggressors.Find(Aggressor) != -1) && (Accomplices.Find(Aggressor) != -1))
			RessConfig.AddCalmList(Aggressor, Player)
		Endif
	EndEvent
	Event OnBeginState()
		RegisterForSingleUpdate(0.50)
	EndEvent
	Event OnUpdate()
		If (!SetNextAgg()) ; No more available aggressors
			Wait(0.5)
			If !IsKnockout
				RessConfig.DefeatPlayAnimation(Player, "Sit")
			Endif
			If (!Enough && McmConfig.CollateralAssault)
				Int i
				While (i < 5)
					If Followers[i]
						Collateral() ; Maybe the player has been knocked down by NPC who don't want them, let's check if they are interested by the followers.
						Wait(0.5)
					Endif
					i += 1
				EndWhile
			Endif
			If StillBusy() ; Check if one aggressor or follower is still busy
				GoToState("FollowerWait")
			Else
				If (AllowedToBeRobbed() && CheckActor(TheLast))
					StartRobbingScene(Player, TheLast, McmConfig.RobbingWay, McmConfig.vRobbing)
				Else
					PostAssault()
				Endif
			Endif
		Else
			If Raped
				If (!Tied && !AllowStaydown)
					SetPlayerAiDriven()
					SendAnimationEvent(TheNext, "IdlePrisonerBeat")
					RessConfig.SoundToPlay[8].Play(Player) ; Rescue
					RessConfig.DefeatPlayAnimation(Player, "Bleedout")
				Endif
			Endif
			DefeatConfig.Log("Player victim, Assault - Aggressor "+TheNext+", Persuer (Should be the same) -> "+Persuer+" // Raped - "+Raped+" // NumRapes - "+NumRapes+" // NumAgg - "+NumAgg)
			RessConfig.LastSceneRaped = Raped
			If !IsCreature ; Creature don't care about you
				RapedStats(TheNext)
				If AllowRelation && !RessConfig.IsBadRelation(TheNext, Player, True)
					DefeatConfig.Log(TheNext+" has good relation with the player, forgive topic")
					RessConfig.DefeatMoan(TheNext, Player, "Forgive")
					Int i = Aggressors.Find(TheNext)
					Aggressors[i] = None
					TheAggressors[i].Clear()
					TheLast = TheNext
					TheNext.EvaluatePackage()
					TheNext = None
					Wait(2.0)
					GoToState("AssaultMode")
				Else
					GetWitness()
					DefeatConfig.Log(TheNext+" wants to have a piece of ass / IsBadRelation")
					If AllowCommentary
						RessConfig.DefeatMoan(TheNext, Player, "Comment")
						Wait(1.5)
					Endif
					If RessConfig.AWitness
						RessConfig.UILib.ShowNotification("${"+RessConfig.AWitness.GetLeveledActorBase().GetName()+"} witnesses what is happenning.", "#CD4C4C")
						RessConfig.DefeatMoan(RessConfig.AWitness, Player, "Witness")
						Wait(2.0)
						RessConfig.MiscSpells[5].Cast(RessConfig.AWitness, Player) ; ImmunitySPL, forces the player to use the escape event
						PostAssault()
						Return
					Else
						If (AllowResist && !Tied)
							GoToState("QTE")
						Else
							PreDownRape()
						Endif
					Endif
				Endif
			Else
				If (McmConfig.HuntCrea && RessConfig.AllowedCreature(TheNext) && SexLab.AllowedCreature(TheNext.GetLeveledActorBase().GetRace()) )
					If (AllowResist && !Tied)
						GoToState("QTE")
					Else
						PreDownRape()
					Endif
				Else
					DefeatConfig.Log(TheNext+" creature not a potential aggressor, remove from aggressors.")
					Int i = Aggressors.Find(TheNext)
					Aggressors[i] = None
					TheAggressors[i].Clear()
					TheLast = TheNext
					TheNext.EvaluatePackage()
					TheNext = None
					GoToState("AssaultMode")
				Endif
			Endif
		Endif
		TheLast = TheNext
	EndEvent
EndState
Function RapedStats(Actor Target)
	RessConfig.HasBeenRapedBy = RessConfig.HasBeenRapedBy(Player, Target)					; For dialogues
	RessConfig.InSceneRapesHowManyBy = GetIntValue(Target, "RapedByInScene"+Player)		; 
	RessConfig.TheEvilFaction = RessConfig.IsEvilFaction(Target)
	RessConfig.AllowedFaction = ((RessConfig.TheEvilFaction != "") && (RessConfig.TheEvilFaction != "Guard"))
;	DefeatConfig.Log("NPC - "+Target+" / HasBeenRapedBy - "+RessConfig.HasBeenRapedBy+" / InSceneRapesHowManyBy - "+RessConfig.InSceneRapesHowManyBy+" / AllowedFaction - "+RessConfig.AllowedFaction+" / TheEvilFaction - "+RessConfig.TheEvilFaction)
EndFunction
State Pursuit
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Actor Aggressor = (akAggressor As Actor)
		If (Aggressor && (Aggressors.Find(Aggressor) != -1) && (Accomplices.Find(Aggressor) != -1))
			RessConfig.AddCalmList(Aggressor, Player)
		Endif
	EndEvent
	Event OnBeginState()
		Time = -1.0
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnUpdate()
		Time += 1.0
		If (Time >= 2.0) && (Persuer.GetDistance(Player) < (Dist(Persuer) + 50) && !Persuer.IsInCombat())
			SetPlayerAiDriven() ; set ai driven if we had to renable this if the player had to get up from a ragdoll
			GoToState("AssaultMode")
			Return
		Elseif ((Time > 15.0) || (Player.GetDistance(Persuer) > 1700.0)) ; Player succeed escaping or the next aggressor didn't reach the player in time for whatever reason
			If Tied || AllowStaydown ; The player is on the ground and not trying to run away
				RessConfig.DefeatPlayAnimation(Player, "Stand")
			Endif
			Restored()
			Return
		Elseif !Tied && !AllowStaydown ; If the player is trying to run away
			If (RandomInt(1, 100) <= 10) ; 10% every 1 second that the player staggers
				SendAnimationEvent(Player, "staggerStart")
			Endif
		Endif
		RegisterForSingleUpdate(1.0)
	EndEvent
EndState
Function PostAssault()
;	RessConfig.DefeatMoan(Player, Player, "Flee", McmConfig.CommentsPvic)
	Player.SetAnimationVariableBool("bSprintOK", True)
	If !IsKnockout
		RessConfig.DefeatPlayAnimation(Player, "Sit")
	Else
		RessConfig.FadeOut(3.0)
		Wait(5.0)
	Endif
	If !RessConfig.IsImmune(Player) ; Check if a NPC has rescued the player or has been hit
		ObjectReference Marker
		If Player.IsInInterior()
			Marker = FindClosestReferenceOfAnyTypeInListFromRef(MiscFormLists[3], Player, 50000.0) ; DefeatMarkerListInt
			If Marker
				DefeatConfig.Log("PostAssault Marker Found - "+Marker+" / BaseObject "+Marker.GetBaseObject())
				SceneCenter.ForceRefTo(Marker)
			Endif
		Else
			Marker = FindClosestReferenceOfAnyTypeInListFromRef(MiscFormLists[2], Player, 50000.0) ; DefeatMarkerListExt
			If Marker
				DefeatConfig.Log("PostAssault Marker Found - "+Marker+" / BaseObject "+Marker.GetBaseObject())
				SceneCenter.ForceRefTo(Marker)
			Endif
		Endif
		SetSceneData() ; Set data for the scene.
		Int i
		While (i < 5) ; Set aggressors to not follow the player when and if teleported.
			If Aggressors[i]
				TheAggressors[i].Clear()
;				Aggressors[i].SetFactionRank(RessConfig.DefeatFactions[1], 5) ; AggFaction
				Aggressors[i].EvaluatePackage()
				If McmConfig.InsatiablePvic
					RessConfig.SetSatisfied(Aggressors[i], Satisfied = False)
				Endif
			Endif
			If Accomplices[i]
				TheAggressors[i + 5].Clear()
;				Accomplices[i].SetFactionRank(RessConfig.DefeatFactions[1], 5) ; AggFaction
				Accomplices[i].EvaluatePackage()
				If McmConfig.InsatiablePvic
					RessConfig.SetSatisfied(Accomplices[i], Satisfied = False)
				Endif
			Endif
			i += 1
		EndWhile
		If (CrimeGold > 0)
			CrimeFaction.ModCrimeGold(CrimeGold)
		Endif
		If (CrimeGoldViolent > 0)
			CrimeFaction.ModCrimeGold(CrimeGoldViolent, True)
		Endif
		Wait(1.0)
		PostAssaultscr.PickEvent()
	Else
		PostAssaultscr.Escape()
	Endif
EndFunction
Function PreDownRape()
	SetAdds()
	If !Stripped
		Stripped = True
		Strip(Player, TheNext)
	Endif
	RessConfig.DefeatMoan(Player, Player, "Flee", AllowPlayerCommentary)
	sslBaseAnimation[] Anims
	sslThreadModel TheRape
	String AnimationSet
	If !AddOne
		If !IsCreature
			If IsKnockout
				Anims = SexLab.GetAnimationsByTags(2, McmConfig.KOTagPvic, McmConfig.KOSupressTagPvic, McmConfig.KORequireAllTagPvic)
				AnimationSet = "KOPvic"
			Else
				If Tied
					Anims = SexLab.GetAnimationsByTags(2, McmConfig.TiedTagPvic, McmConfig.TiedSupressTagPvic, McmConfig.TiedRequireAllTagPvic)
					AnimationSet = "TiedPvic"
				Endif
				If (Anims.length == 0)
					Int GenderCombination = RessConfig.GenderCombination(Player, TheNext)
					If (GenderCombination == 2)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoMTagPvic, McmConfig.FoMSupressTagPvic, McmConfig.FoMRequireAllTagPvic)
						AnimationSet = "FoMPvic"
					Elseif (GenderCombination == 3)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoFTagPvic, McmConfig.FoFSupressTagPvic, McmConfig.FoFRequireAllTagPvic)
						AnimationSet = "FoFPvic"
					Endif
				Endif
			Endif
			If (Anims.length == 0)
				AnimationSet = "RapePvic"
			Endif
			TheRape = RessConfig.SexLabScene(Player, TheNext, CustomAnimations = Anims, Tags = McmConfig.RapeTagPvic, SupressTags = McmConfig.RapeSupressTagPvic, TagsRequireAll = McmConfig.RapeRequireAllTagPvic, FemaleFirst = AnimationSet)
		Else
			TheRape = RessConfig.SexLabScene(Player, TheNext, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPvic, SupressTags = McmConfig.CreatureSupressTagPvic, TagsRequireAll = McmConfig.CreatureRequireAllTagPvic)
		Endif
	Else
		If !IsCreature
			TheRape = RessConfig.SexLabScene(Player, TheNext, AddOne, AddTwo, AddThree, CustomAnimations = Anims, Tags = McmConfig.MultipleTagPvic, SupressTags = McmConfig.MultipleSupressTagPvic, TagsRequireAll = McmConfig.MultipleRequireAllTagPvic, FemaleFirst = "MultPvic")
		Else
			TheRape = RessConfig.SexLabScene(Player, TheNext, AddOne, AddTwo, AddThree, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPvic, SupressTags = McmConfig.CreatureSupressTagPvic, TagsRequireAll = McmConfig.CreatureRequireAllTagPvic, FemaleFirst = "MultCreaPvic")
		Endif
	Endif
	TheRape.DisableRagdollEnd(Player)
	If IsKnockout
		sslBaseVoice ToVoice = SexLab.GetVoice(Player)
		TheRape.SetVoice(Player, ToVoice, True)
	Endif
	RegisterForModEvent("AnimationEnd_DefeatPvic", "EndPr")
	TheRape.SetHook("DefeatPvic")
	sslThreadController Thread = TheRape.StartThread()
	If Thread
		NumRapes += 1
		Enough = (NumRapes >= (NumAgg * 2))
		RessConfig.Weakenings(Player, RemoveSpl = True)
		Player.AddSpell(RessConfig.MiscSpells[1], False) ; DebuffConsSPL
		Raped = True
		UpdatePackages()
		If (!Enough && McmConfig.CollateralAssault)
			Int i
			While (i < 5)
				If Followers[i]
					Collateral()
				Endif
				i += 1
			EndWhile
		Endif
		Wait(2.0)
		EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0) ; For the HUD to appear after SexLab triggered a sex scene, the player should still be ai driven and unable to move
		If (IsBar && (McmConfig.ResistFillStamina > 0.0))
			GoToState("PushAway")
		Endif
	Else
		DefeatConfig.Log("Error: Player victim, Animation did not start, something went wrong with the scene, check your SexLab settings")
		Restored()
	Endif
Endfunction
Bool Function AllowedToBeRobbed()
	If (!IsCreature && !RessConfig.MiscQuests[5].IsRunning() && RessConfig.AllowedFaction) ; RobberQst
		If (RandomInt(1, 100) < McmConfig.fRobbing)
			Return True
		Endif
		MiscScenes[2].Stop() ; SCRobbing
	Endif
	Return False
EndFunction
Function StartRobbingScene(Actor Victim, Actor Aggressor, String RobWay = "", Float TheValue = -1.0)
	If RobWay == "Value"
		TheRobWay = 1
	Elseif RobWay == "Gold"
		TheRobWay = 2
	Elseif (McmConfig.RobbingWay == "$Value")
		TheRobWay = 1
	Elseif (McmConfig.RobbingWay == "$Only Gold")
		TheRobWay = 2
	Endif
	IF (TheValue != -1)
		RobValue = TheValue
	Else
		RobValue = McmConfig.vRobbing
	ENdif
	AliasLastAgg.ForceRefTo(Aggressor)
	AliasLastVic.ForceRefTo(Victim)
	MiscScenes[2].ForceStart() ; SCRobbing
Endfunction
Function RobValuable(Actor Victim, Actor Aggressor)
	SendModEvent("DefeatPostAssault", "RobBegin")
;	DefeatConfig.Log("START Robbing")
	RecoverStuff(Aggressor)
	If (TheRobWay == 1)
		Int i = Victim.GetNumItems()
		While (i > 0)
			i -= 1
			Form Item = Victim.GetNthForm(i)
			If ((Item.GetGoldValue() > RobValue) && !Item.HasKeyWordString("SexLabNoStrip"))
				Victim.RemoveItem(Item, Victim.GetItemCount(Item), True, Aggressor)
	;		Elseif (Item.GetType() == 41) ; Weapon
	;			Victim.RemoveItem(Item, Victim.GetItemCount(Item), True, Aggressor)
			Endif
		EndWhile
		Victim.RemoveItem(MiscObjects[0], Victim.GetGoldAmount(), akOtherContainer = Aggressor) ; Gold
	Else
		Victim.RemoveItem(MiscObjects[0], Victim.GetGoldAmount(), akOtherContainer = Aggressor) ; Gold
	Endif
	Robbed = True
;	DefeatConfig.Log("ENDS Robbing")
EndFunction
Float Function Dist(Actor Agg)
	If !IsCreature
		Return 150.0
	Else
		If Agg.HasKeywordString("ActorTypeDragon")
			Return 600.0
		Else
			Return 300.0
		Endif
	Endif
EndFunction
Function UpdatePackages()
	Int i
	While (i < 5)
		If Aggressors[i]
			Aggressors[i].EvaluatePackage()
		Endif
		If Accomplices[i]
			Accomplices[i].EvaluatePackage()
		Endif		
		i += 1
	EndWhile
EndFunction
Bool Function SetNextAgg()
	If (!AliasLastAgg.GetReference() && TheLast)
		AliasLastAgg.ForceRefTo(TheLast)
	Endif
	If !Enough
		If !TheNext
			Return PickAnAggressor()
		Else
			If !CheckActor(TheNext) ; TheNext actor exists, Check if he is still alive and if not return another aggressor
				Return PickAnAggressor()
			Else 	; TheNext actor exists and is alive, evaluate package
				TheNext.EvaluatePackage()
			Endif
		Endif
	Else
		Return False
	Endif
	Return True
EndFunction
Actor Function PickAnAggressor()
	Int i
	While (i < 5)
		If Aggressors[i] && (CheckActor(Aggressors[i]) && (RessConfig.VictimState(Aggressors[i]) == "") &&  RessConfig.IsSexualAssaulter(Aggressors[i], Player, True) && (Aggressors[i].GetFactionRank(RessConfig.DefeatFactions[1]) == 0))
			TheNext = Aggressors[i]
			Persuer = Aggressors[i]
			TheNext.SetFactionRank(RessConfig.DefeatFactions[1], 2) ; AggFaction / Run toward the victim
			TheNext.EvaluatePackage()
			IsCreature = !TheNext.HasKeywordString("ActorTypeNPC")
			DefeatConfig.Log("TheNext set - "+TheNext)
			AliasLastAgg.Clear()
			AliasLastAgg.ForceRefTo(TheNext)
			Return TheNext
		Endif
		i += 1
	EndWhile
	Return None
EndFunction
Function SetAdds()
	If !AddOne ; We don't want it to run a second time if an add is already set
		Float MultipleChance
		If !IsCreature
			MultipleChance = McmConfig.ThreesomeChance
		Else
			MultipleChance = McmConfig.GbCrChancePvic
		Endif
		If (MultipleChance > 0.0)
			If (RandomInt(0, 100) < MultipleChance)
				Race NextRace = TheNext.GetLeveledActorBase().GetRace()
				Actor[] TheActors = New Actor[5]
				TheActors[0] = Player
				TheActors[1] = TheNext
				String GenderTag
				Int i
				While (i < 5)
					If !AddThree
						If (Aggressors[i] && (Aggressors[i] != TheNext) && CheckActor(Aggressors[i]) && (Aggressors[i].GetDistance(Player) < FarMaxDist))
							Bool AggressorCreature = !Aggressors[i].HasKeywordString("ActorTypeNPC")
							If AggressorCreature
								NextRace = Aggressors[i].GetLeveledActorBase().GetRace()
							Endif
							If (!Aggressors[i].HasKeywordString("SexLabActive") && (Aggressors[i].GetFactionRank(RessConfig.DefeatFactions[1]) < 1) && RessConfig.IsSexualAssaulter(Aggressors[i], Player, True))
								Int Slot = TheActors.Find(None)
								TheActors[Slot] = Aggressors[i]
								Actor[] Positions = RessConfig.MakeActorArray(TheActors[0], TheActors[1], TheActors[2], TheActors[3], TheActors[4])
								GenderTag = SexLabUtil.MakeGenderTag(Positions)
								sslBaseAnimation[] Anims
								If AggressorCreature
									Anims = SexLab.GetCreatureAnimationsByRaceTags((Slot + 1), NextRace, GenderTag+","+McmConfig.CreatureTagPvic, McmConfig.CreatureSupressTagPvic, McmConfig.CreatureRequireAllTagPvic)
								Else
									If McmConfig.MultipleIgnoreGTPvic
										Anims = SexLab.GetAnimationsByType((Slot + 1), Aggressive = False)
									Else
										Anims = SexLab.GetAnimationsByTags((Slot + 1), GenderTag+","+McmConfig.MultipleTagPvic, McmConfig.MultipleSupressTagPvic, McmConfig.MultipleRequireAllTagPvic)
									Endif
								Endif
								If (Anims.Length != 0)
									If !AddOne
										AddOne = Aggressors[i]
									Elseif !AddTwo
										AddTwo = Aggressors[i]
									Else
										AddThree = Aggressors[i]
									Endif
									Aggressors[i].SetFactionRank(RessConfig.DefeatFactions[1], 2) ; AggFaction
									Aggressors[i].EvaluatePackage()
									DefeatConfig.Log("Multiple actor set -> "+Aggressors[i])
								Else
									TheActors[Slot] = None
								Endif
							Endif
						Endif
					Endif
					i += 1
				EndWhile
			Endif
		Endif
	Endif
EndFunction
Bool Function Collateral(Actor Victim = None, Actor Aggressor = None, Actor TheAdd = None)
	If (Aggressor && Victim)
		If !CollaVic[4].GetReference()
			Int Slot = CollateralReturnSlot()
			StripRegister(Victim)
			CollaVic[Slot].ForceRefTo(Victim)
			CollaAgg[Slot].ForceRefTo(Aggressor)
			If TheAdd
				CollaAggAdd[Slot].ForceRefTo(TheAdd)
			Endif
			RessConfig.MiscSpells[6].Cast(Aggressor, Victim) ; CollateralSafetySPL
;			DefeatConfig.Log("Collateral direct start - "+Aggressor+" / "+TheAdd+" on "+Victim)
			Return True
		Endif
	Elseif (!Enough && !CollaVic[4].GetReference())
		Actor[] CollateralActors
		CollateralActors = CollateralGetActors()
		If CollateralActors[0]
			RessConfig.MiscSpells[6].Cast(CollateralActors[1], CollateralActors[0]) ; CollateralSafetySPL
;			DefeatConfig.Log("Collateral start - "+CollateralActors[1]+" / "+CollateralActors[2]+" on "+CollateralActors[0])
			Return True
		Endif
	Endif
	Return False
EndFunction
Int Function CollateralReturnSlot()
	Int i
	While (i < 5)
		If !CollaVic[i].GetReference()
			Return i
		Endif
		i += 1
	EndWhile
	return -1
EndFunction
Actor[] Function CollateralGetActors()
	Actor[] CollaActors = New Actor[3]
	Int i
	Int n
	While (i < 5)
		If Followers[i]
;			DefeatConfig.Log("CollateralGetActors Followers[i] - !HasKeywordString(SexLabActive) - "+!Followers[i].HasKeywordString("SexLabActive")+" // GetFactionRank(RessConfig.DefeatFactions[0]) == 0) - "+(Followers[i].GetFactionRank(RessConfig.DefeatFactions[0]) == 0))
			If (!Followers[i].HasKeywordString("SexLabActive") && !Followers[i].HasKeywordString("DefeatCollateral") && (Followers[i].GetFactionRank(RessConfig.DefeatFactions[0]) == 0))
				n = 0
				While (n < 5)
					If Accomplices[n]
;						DefeatConfig.Log("CollateralGetActors : Accomplices[n] - "+Accomplices[n]+" // (Accomplices[n] != TheNext) - "+(Accomplices[n] != TheNext)+" // GetDistance < 3000 - "+(Accomplices[n].GetDistance(Followers[i]) < 3000)+" // Accomplices[n].HasLOS(Followers[i]) - "+Accomplices[n].HasLOS(Followers[i])+" // (Accomplices[n].GetFactionRank(RessConfig.DefeatFactions[1]) == 0) - "+(Accomplices[n].GetFactionRank(RessConfig.DefeatFactions[1]) == 0)+" // !HasKeywordString(SexLabActive) - "+!Accomplices[n].HasKeywordString("SexLabActive")+" // !RessConfig.IsSatisfied(Accomplices[n]) - "+!RessConfig.IsSatisfied(Accomplices[n])+" // RessConfig.SexCombination(Accomplices[n], Followers[i], False) - "+RessConfig.SexCombination(Accomplices[n], Followers[i], False))
						If (CheckActor(Accomplices[n]) && (Accomplices[n] != TheNext) && !Accomplices[n].HasKeywordString("DefeatCollateral") && (Accomplices[n].GetFactionRank(RessConfig.DefeatFactions[1]) == 0))
							If (((Accomplices[n].GetDistance(Followers[i]) < 3000) || Accomplices[n].HasLOS(Followers[i])) && \
								!Accomplices[n].HasKeywordString("SexLabActive") && !RessConfig.IsSatisfied(Accomplices[n]) && RessConfig.SexCombination(Accomplices[n], Followers[i], False))
								CollaActors[0] = Followers[i]
								CollaActors[1] = Accomplices[n]
								CollaActors[0].SetFactionRank(RessConfig.DefeatFactions[0], 3) ; DefeatFaction / Set follower as collateral victim
								CollaActors[1].SetFactionRank(RessConfig.DefeatFactions[1], 3) ; AggFaction / Set the aggressor as collateral aggressor
								Int Slot = CollateralReturnSlot()
								If (Slot != -1)
									CollaVic[Slot].ForceRefTo(CollaActors[0])
									CollaAgg[Slot].ForceRefTo(CollaActors[1])
									DefeatConfig.Log("Collateral accomplice set - "+Accomplices[n]+" / Slot - "+Slot)
									DefeatConfig.Log("Collateral Victim set - "+Followers[i]+" / Slot - "+Slot)									
									Actor TheAdd = CollateralGetActorAdd(CollaActors[0], CollaActors[1])
									If TheAdd
										CollaActors[2]
										CollaAggAdd[Slot].ForceRefTo(TheAdd)
										DefeatConfig.Log("Collateral add slot - "+Slot)
									Endif
									Return CollaActors
								Endif
							Endif
						Endif
					Endif
					n += 1
				EndWhile
				n = 0
				While (n < 5)
					If Aggressors[n]
;						DefeatConfig.Log("CollateralGetActors : Aggressors[n] - "+Aggressors[n]+" // (Aggressors[n] != TheNext) - "+(Aggressors[n] != TheNext)+" // GetDistance < 3000 - "+(Aggressors[n].GetDistance(Followers[i]) < 3000)+" // Aggressors[n].HasLOS(Followers[i]) - "+Aggressors[n].HasLOS(Followers[i])+" // (Aggressors[n].GetFactionRank(RessConfig.DefeatFactions[1]) == 0) - "+(Aggressors[n].GetFactionRank(RessConfig.DefeatFactions[1]) == 0)+" // !HasKeywordString(SexLabActive) - "+!Aggressors[n].HasKeywordString("SexLabActive")+" // !RessConfig.IsSatisfied(Aggressors[n]) - "+!RessConfig.IsSatisfied(Aggressors[n])+" // RessConfig.SexCombination(Aggressors[n], Followers[i], False) - "+RessConfig.SexCombination(Aggressors[n], Followers[i], False))
						If (CheckActor(Aggressors[n]) && (Aggressors[n] != TheNext) && !Aggressors[n].HasKeywordString("DefeatCollateral") && (Aggressors[n].GetFactionRank(RessConfig.DefeatFactions[1]) == 0))
							If (((Aggressors[n].GetDistance(Followers[i]) < 3000) || Aggressors[n].HasLOS(Followers[i])) && \
								!Aggressors[n].HasKeywordString("SexLabActive") && !RessConfig.IsSatisfied(Aggressors[n]) && RessConfig.SexCombination(Aggressors[n], Followers[i], False))
								CollaActors[0] = Followers[i]
								CollaActors[1] = Aggressors[n]
								CollaActors[0].SetFactionRank(RessConfig.DefeatFactions[0], 3) ; DefeatFaction / Set follower as collateral victim
								CollaActors[1].SetFactionRank(RessConfig.DefeatFactions[1], 3) ; AggFaction / Set the aggressor as collateral aggressor
								Int Slot = CollateralReturnSlot()
								If (Slot != -1)
									CollaVic[Slot].ForceRefTo(CollaActors[0])
									CollaAgg[Slot].ForceRefTo(CollaActors[1])
									DefeatConfig.Log("Collateral Aggressor set - "+Aggressors[n]+" / Slot - "+Slot)
									DefeatConfig.Log("Collateral Victim set - "+Followers[i]+" / Slot - "+Slot)
									Actor TheAdd = CollateralGetActorAdd(CollaActors[0], CollaActors[1])
									If TheAdd
										CollaActors[2]
										CollaAggAdd[Slot].ForceRefTo(TheAdd)
										DefeatConfig.Log("Collateral add slot - "+Slot)
									Endif
									Return CollaActors
								Endif
							Endif
						Endif
					Endif
					n += 1
				EndWhile
			Endif
		Endif
		i += 1
	EndWhile
	Return CollaActors
EndFunction
Actor Function CollateralGetActorAdd(Actor Victim, Actor Aggressor)
	If ((McmConfig.ThreesomeChanceCollateral > 0.0) && (RandomInt(0, 100) < McmConfig.ThreesomeChanceCollateral))
		Bool AggressorCreature
		Bool NextCreature
		Bool ValidCombination = True
		Int i 
		While (i < 5)
			If Accomplices[i]
				If (CheckActor(Accomplices[i]) && (Accomplices[i] != TheNext) && !Accomplices[i].HasKeywordString("DefeatCollateral") && (Accomplices[i].GetFactionRank(RessConfig.DefeatFactions[1]) == 0))
					If (((Accomplices[i].GetDistance(Victim) < 3000) || Accomplices[i].HasLOS(Victim)) && \
						!Accomplices[i].HasKeywordString("SexLabActive") && !RessConfig.IsSatisfied(Accomplices[i]) && RessConfig.SexCombination(Accomplices[i], Victim, False))
						AggressorCreature = !Aggressor.HasKeywordString("ActorTypeNPC")
						NextCreature = !Accomplices[i].HasKeywordString("ActorTypeNPC")
						If AggressorCreature || NextCreature
							Actor[] Positions = RessConfig.MakeActorArray(Victim, Aggressor, Accomplices[i])
							String GenderTag = SexLabUtil.MakeGenderTag(Positions)
							sslBaseAnimation[] Anims
							ValidCombination = True
							If AggressorCreature && NextCreature
								ValidCombination = SexLab.AllowedCreatureCombination(Aggressor.GetLeveledActorBase().GetRace(), Accomplices[i].GetLeveledActorBase().GetRace())
							Endif
							If ValidCombination
								If AggressorCreature
									Anims = SexLab.GetCreatureAnimationsByRaceTags(3, Aggressor.GetLeveledActorBase().GetRace(), GenderTag+","+McmConfig.CreatureTagPvic, McmConfig.CreatureSupressTagPvic, McmConfig.CreatureRequireAllTagPvic)
								Else
									Anims = SexLab.GetCreatureAnimationsByRaceTags(3, Accomplices[i].GetLeveledActorBase().GetRace(), GenderTag+","+McmConfig.CreatureTagPvic, McmConfig.CreatureSupressTagPvic, McmConfig.CreatureRequireAllTagPvic)
								Endif
								If (Anims.Length != 0)
									DefeatConfig.Log("Collateral add accomplice creature set - "+Accomplices[i])
									Accomplices[i].SetFactionRank(RessConfig.DefeatFactions[1], 3) ; AggFaction / Set the aggressor as collateral aggressor
									Return Accomplices[i]
								Endif
							Endif
						Else
							DefeatConfig.Log("Collateral add accomplice set - "+Accomplices[i])
							Accomplices[i].SetFactionRank(RessConfig.DefeatFactions[1], 3) ; AggFaction / Set the aggressor as collateral aggressor
							Return Accomplices[i]							
						Endif
					Endif
				Endif
			Endif
			i += 1
		EndWhile
		i = 0
		While (i < 5)
			If Aggressors[i]
				If (CheckActor(Aggressors[i]) && (Aggressors[i] != TheNext) && !Aggressors[i].HasKeywordString("DefeatCollateral") && (Aggressors[i].GetFactionRank(RessConfig.DefeatFactions[1]) == 0))
					If (((Aggressors[i].GetDistance(Victim) < 3000) || Aggressors[i].HasLOS(Victim)) && \
						!Aggressors[i].HasKeywordString("SexLabActive") && !RessConfig.IsSatisfied(Aggressors[i]) && RessConfig.SexCombination(Aggressors[i], Victim, False))
						AggressorCreature = !Aggressor.HasKeywordString("ActorTypeNPC")
						NextCreature = !Aggressors[i].HasKeywordString("ActorTypeNPC")
						If AggressorCreature || NextCreature
							Actor[] Positions = RessConfig.MakeActorArray(Victim, Aggressor, Aggressors[i])
							String GenderTag = SexLabUtil.MakeGenderTag(Positions)
							sslBaseAnimation[] Anims
							ValidCombination = True
							If AggressorCreature && NextCreature
								ValidCombination = SexLab.AllowedCreatureCombination(Aggressor.GetLeveledActorBase().GetRace(), Aggressors[i].GetLeveledActorBase().GetRace())
							Endif
							If ValidCombination
								If AggressorCreature
									Anims = SexLab.GetCreatureAnimationsByRaceTags(3, Aggressor.GetLeveledActorBase().GetRace(), GenderTag+","+McmConfig.CreatureTagPvic, McmConfig.CreatureSupressTagPvic, McmConfig.CreatureRequireAllTagPvic)
								Else
									Anims = SexLab.GetCreatureAnimationsByRaceTags(3, Aggressors[i].GetLeveledActorBase().GetRace(), GenderTag+","+McmConfig.CreatureTagPvic, McmConfig.CreatureSupressTagPvic, McmConfig.CreatureRequireAllTagPvic)
								Endif
								If (Anims.Length != 0)
									DefeatConfig.Log("Collateral add aggressor creature set - "+Aggressors[i])
									Aggressors[i].SetFactionRank(RessConfig.DefeatFactions[1], 3) ; AggFaction / Set the aggressor as collateral aggressor
									Return Aggressors[i]
								Endif
							Endif
						Else
							DefeatConfig.Log("Collateral add aggressor set - "+Aggressors[i])
							Aggressors[i].SetFactionRank(RessConfig.DefeatFactions[1], 3) ; AggFaction / Set the aggressor as collateral aggressor
							Return Aggressors[i]							
						Endif
					Endif
				Endif
			Endif
			i += 1
		EndWhile
	Endif
	Return None
EndFunction
Function CollateralRape(Actor Victim, Actor Aggressor, Actor TheAdd = None)
	sslBaseAnimation[] Anims
	sslThreadModel TheRape
	String AnimationSet
	If !TheAdd
		If Aggressor.HasKeywordString("ActorTypeNPC")
			If RessConfig.Tied(Victim)
				Anims = SexLab.GetAnimationsByTags(2, McmConfig.TiedTagPvic, McmConfig.TiedSupressTagPvic, McmConfig.TiedRequireAllTagPvic)
				AnimationSet = "TiedPvic"
			Endif
			If (Anims.length == 0)
				Int GenderCombination = RessConfig.GenderCombination(Victim, Aggressor)
				If (GenderCombination == 2)
					Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoMTagPvic, McmConfig.FoMSupressTagPvic, McmConfig.FoMRequireAllTagPvic)
					AnimationSet = "FoMPvic"
				Elseif (GenderCombination == 3)
					Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoFTagPvic, McmConfig.FoFSupressTagPvic, McmConfig.FoFRequireAllTagPvic)
					AnimationSet = "FoFPvic"
				Endif
			Endif
			If (Anims.length == 0)
				AnimationSet = "RapePvic"
			Endif
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.RapeTagPvic, SupressTags = McmConfig.RapeSupressTagPvic, TagsRequireAll = McmConfig.RapeRequireAllTagPvic, FemaleFirst = AnimationSet)
		Else
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPvic, SupressTags = McmConfig.CreatureSupressTagPvic, TagsRequireAll = McmConfig.CreatureRequireAllTagPvic)
		Endif
	Else
		If Aggressor.HasKeywordString("ActorTypeNPC")
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, TheAdd, CustomAnimations = Anims, Tags = McmConfig.MultipleTagPvic, SupressTags = McmConfig.MultipleSupressTagPvic, TagsRequireAll = McmConfig.MultipleRequireAllTagPvic, FemaleFirst = "MultPvic")
		Else
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, TheAdd, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPvic, SupressTags = McmConfig.CreatureSupressTagPvic, TagsRequireAll = McmConfig.CreatureRequireAllTagPvic)
		Endif
	Endif
	TheRape.DisableRagdollEnd(Victim)
	RegisterForModEvent("AnimationEnd_Collateral", "CollaEnd")
	TheRape.SetHook("Collateral")
	sslThreadController Thread = TheRape.StartThread()
	If Thread
		RessConfig.CastImmune(Victim) ; to avoid redress
		RessConfig.RemoveStates(Victim, False)
		NumRapes += 1
		Enough = (NumRapes >= (NumAgg * 2))
	Else
		Aggressor.SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction
		Victim.SetFactionRank(RessConfig.DefeatFactions[0], 0) ; DefeatFaction
		If TheAdd
			TheAdd.SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction
		Endif
		Int i 
		While (i < 5)
			If ((CollaVic[i].GetReference() As Actor) == Victim)
				CollaVic[i].Clear()
				CollaAgg[i].Clear()
				CollaAggAdd[i].Clear()
				i = 5
			Endif
			i += 1
		EndWhile
		DefeatConfig.Log("Error: Collateral, Animation did not start / Aggressor - "+Aggressor.GetLeveledActorBase().GetName()+" / "+Aggressor)
	Endif
EndFunction

Event EndPr(string EventName, string argString, Float argNum, form sender)					;===== END EVENTS
	IsQTEKD = False ; To not play the stand animation in restored function
	If TheNext.IsDead()
		Restored()
		Return
	Endif
	Bool Interrupted = RessConfig.IsImmune(Player) ; ImmunityEFF Check if the scene has been interrupted somehow
	ShiftLast(TheNext)
	Actor[] Involved = SexLab.HookActors(argString)
	Int i
	While (i < Involved.Length)
		If (Involved[i] && (Involved[i] != Player))
			If !Interrupted
				RessConfig.SetSatisfied(Involved[i], Type = "Player Victim")
			Endif
			Involved[i].SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction
			AdjustIntValue(Involved[i], "RapedBy"+Player, 1)
			AdjustIntValue(Involved[i], "RapedByInScene"+Player, 1)
		Endif
		i += 1
	EndWhile
	Player.RemoveSpell(RessConfig.MiscSpells[1]) ; DebuffConsSPL
	RessConfig.Weakenings(Player, "Player Victim")
	If !Interrupted
		If NoTrans ; If setting is set to "No Transition"
			If !RessConfig.IsClothed(Player)
				RessConfig.CoverSelf(Player)
			Endif
			NoTrans = False
			Restored()
			Return
		Endif
		AnotherTurn(Player, Involved)
		TheNext = None
		AddOne = None
		AddTwo = None
		AddThree = None
		DisablePlayerControls(0, 1, 1, 0, 1, 1, 0, 0) ; Re-disable some commands after SexLab, at this point the player should still be ai driven
		Transition()
		UpdatePackages()
	Else
		Restored()
	Endif
EndEvent
Function Consensual(Actor Victim, Actor Aggressor)
	sslBaseAnimation[] Anims
	sslThreadModel TheScene
	If Aggressor.HasKeyWordString("ActorTypeNPC")
		Int GenderCombination = RessConfig.GenderCombination(Victim, Aggressor)
		If (GenderCombination == 2)
			Anims = SexLab.GetAnimationsByTags(2, McmConfig.ConsFoMTag, McmConfig.ConsFoMSupressTag, McmConfig.ConsFoMRequireAllTag)
		Elseif (GenderCombination == 3)
			Anims = SexLab.GetAnimationsByTags(2, McmConfig.ConsFoFTag, McmConfig.ConsFoFSupressTag, McmConfig.ConsFoFRequireAllTag)
		Endif
		TheScene = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.ConsTag, SupressTags = McmConfig.ConsSupressTag, TagsRequireAll = McmConfig.ConsRequireAllTag, FemaleFirst = "Cons", IsAggressive = False)
	Else
		TheScene = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.ConsCreatureTag, SupressTags = McmConfig.ConsCreatureSupressTag, TagsRequireAll = McmConfig.ConsCreatureRequireAllTag, IsAggressive = False)
	Endif
	TheScene.DisableRagdollEnd(Aggressor)
	RegisterForModEvent("AnimationEnd_DefeatPvic", "EndConsensual")
	TheScene.SetHook("DefeatPvic")
	sslThreadController Thread = TheScene.StartThread()
	If !Thread
		Restored()
	Endif
EndFunction
Event EndConsensual(string EventName, string argString, Float argNum, form sender)
	RessConfig.SetSatisfied(TheNext, Type = "Player Victim")
	TheNext.SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction
;	AdjustIntValue(TheNext, "RapedBy"+Player, 1)
	AdjustIntValue(TheNext, "RapedByInScene"+Player, 1)
	ShiftLast(TheNext)
	Actor[] Involved = SexLab.HookActors(argString)
	RessConfig.Weakenings(Player, "Player Victim")
	AnotherTurn(Player, Involved)
	TheNext = None
	DisablePlayerControls(0, 1, 1, 0, 1, 1, 0, 0) ; Re-disable some commands after SexLab, at this point the player should still be ai driven
	If SexLabConfig.RagdollEnd
		SetPlayerAiDriven(False) ; For the player to get up properly
		RegisterForAnimationEvent(Player, "GetUpEnd")
	Else
		Transition()
	Endif
;	UnregisterForModEvent("AnimationEnd_DefeatPvic")
EndEvent
Function BlowJob(Actor Victim, Actor Aggressor)
	RegisterForModEvent("AnimationEnd_DefeatPvic", "EndBJ")
	sslThreadModel Make = SexLab.NewThread()
	Actor[] Positions = RessConfig.MakeActorArray(Victim, Aggressor)
	Positions = SexLab.SortActors(Positions)
	sslBaseAnimation[] Anims = (SexLab.GetAnimationsByTags(2, "Blowjob,MF", "Vaginal,Anal,69"))
	If (Anims.length == 0)
		Anims = new sslBaseAnimation[2]
		Anims[0] = SexLab.GetAnimationByName("Arrok Blowjob")
		Anims[1] = SexLab.GetAnimationByName("DI Blowjob")
	Endif
	Make.SetAnimations(Anims)
	Make.AddActors(Positions)
	Make.DisableRagdollEnd(Aggressor)
	Make.DisableUndressAnimation(Victim, True)
	Make.DisableBedUse()
	Make.SetHook("DefeatPvic")
	sslThreadModel Thread = Make.StartThread()
EndFunction
Event EndBJ(string EventName, string argString, Float argNum, form sender)
	RessConfig.SetSatisfied(TheNext, Type = "Player Victim")
	TheNext.SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction
;	AdjustIntValue(TheNext, "RapedBy"+Player, 1)
	AdjustIntValue(TheNext, "RapedByInScene"+Player, 1)
	ShiftLast(TheNext)
	Actor[] Involved = SexLab.HookActors(argString)
;	RessConfig.Weakenings(Player, "Player Victim")
	AnotherTurn(Player, Involved)
	TheNext = None
	DisablePlayerControls(0, 1, 1, 0, 1, 1, 0, 0) ; Re-disable some commands after SexLab, at this point the player should still be ai driven
	If SexLabConfig.RagdollEnd
		SetPlayerAiDriven(False) ; For the player to get up properly
		RegisterForAnimationEvent(Player, "GetUpEnd")
	Else
		Transition()
	Endif
;	UnregisterForModEvent("AnimationEnd_DefeatPvic")
EndEvent
Event CollaEnd(string EventName, string argString, Float argNum, form sender)
	Actor TheVic = SexLab.HookVictim(argString)
	Int i 
	While (i < 5)
		If ((CollaVic[i].GetReference() As Actor) == TheVic)
			CollaVic[i].Clear()
			CollaAgg[i].Clear()
			CollaAggAdd[i].Clear()
			i = 5
		Endif
		i += 1
	EndWhile
	Actor[] Involved = SexLab.HookActors(argString)
	TheVic.SetFactionRank(RessConfig.DefeatFactions[0], 0)
	If ((GetState() == "FollowerWait") && McmConfig.CollateralAssault)
		Collateral() ; Start another collateral before the player get out of the waiting state
	Endif
	i = Involved.Length
	While (i > 0)
		i -= 1
		If (Involved[i] && (Involved[i] != TheVic))
;			DefeatConfig.Log("CollaEnd SetSatisfied & DefeatFactions[1] 0 on - "+Involved[i]) ; AggFaction
			ShiftLast(Involved[i])
			RessConfig.SetSatisfied(Involved[i], Type = "Player Victim")
			Involved[i].SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction
			AdjustIntValue(Involved[i], "RapedBy"+TheVic, 1)
		Endif
	EndWhile
	AnotherTurn(TheVic, Involved)
	If (McmConfig.bExhaustedPvic && (RandomInt(0, 1) == 0))
		RessConfig.Exhausted(TheVic, Duration = 60.0)
	Else
		RessConfig.Trauma(TheVic, Duration = 60.0)
	Endif
	TheVic.EvaluatePackage()
	RessConfig.Weakenings(TheVic, "Follower")
	If IsSurrender
		If (GetState() == "StruggleFree")
			TheNext = None
			If SetNextAgg()
				SetAdds()
				GoToState("Pursuit")
			Endif
		Endif
	Elseif (!Enough && !MiscScenes[1].IsPlaying() && McmConfig.CollateralAssault) ; SCEscape
		Collateral() ; another aggressor up?
	Endif
	UpdatePackages()
EndEvent
Event OnAnimationEvent(ObjectReference akSource, string asEventNaPlayer)
	If (akSource == Player)
		UnregisterForAnimationEvent(Player, "GetUpEnd")
		If Raped
			If NoTrans
				NoTrans = False
				RessConfig.DefeatPlayAnimation(Player, "Stand")
				If McmConfig.SlowDown
					RessConfig.MiscSpells[2].Cast(Player) ; DebuffSpeedSPL
				Endif
				Restored()
			Else
				Transition()
			Endif
		Else
			If Tied || AllowStaydown
				RessConfig.DefeatPlayAnimation(Player, "Stand")
			Endif
			Restored()
		Endif
;	Else
;		Actor TheVic = (akSource as Actor)
;		UnregisterForAnimationEvent(TheVic, "GetUpEnd")
;		If (McmConfig.bExhaustedPvic && (RandomInt(0, 1) == 0))
;			RessConfig.Exhausted(TheVic, Duration = 60.0)
;		Else
;			RessConfig.Trauma(TheVic, Duration = 60.0)
;		Endif
;		TheVic.EvaluatePackage()
;		RessConfig.Weakenings(TheVic, "Follower")
;		AnotherTurn(TheVic, InvolvedFollower)
;		If IsSurrender
;			If (GetState() == "StruggleFree")
;				TheNext = None
;				If SetNextAgg()
;					SetAdds()
;					GoToState("Pursuit")
;				Endif
;			Endif
;		Else
;			If (!Enough && McmConfig.CollateralAssault)
;				DefeatConfig.Log("Collateral - OnAnimationEvent (!Enough && McmConfig.CollateralAssault)")
;				Collateral() ; another client for the follower?
;			Endif
;		Endif
	Endif
EndEvent
Function AnotherTurn(Actor Victim, Actor[] InvolvedArray)
	If (McmConfig.AgainChance > 0)
		Int i
		Int n = InvolvedArray.Length
		While (i < n)
			If (InvolvedArray[i] && (InvolvedArray[i] != Victim))
				If (RandomInt(0, 100) < McmConfig.AgainChance)
					RessConfig.SetSatisfied(InvolvedArray[i], Satisfied = False)
					InvolvedArray[i].SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction
					ShiftLast(InvolvedArray[i])
				Endif
			Endif
			i += 1
		EndWhile
	Endif
EndFunction
Function ShiftLast(Actor Agg)
	Int AccSlot = Accomplices.Find(Agg)
	Int AggSlot = Aggressors.Find(Agg)
	If (AggSlot != -1)
		While (AggSlot < 5)
			If (AggSlot == 4) 
				Aggressors[AggSlot] = Agg
				Return
			Elseif Aggressors[AggSlot + 1]
				Aggressors[AggSlot] = Aggressors[AggSlot + 1]
			Else
				Aggressors[AggSlot] = Agg
				Return
			Endif
			AggSlot += 1
		EndWhile
	Elseif (AccSlot != -1)
		While (AccSlot < 5)
			If (AccSlot == 4) 
				Accomplices[AccSlot] = Agg
				Return
			Elseif Accomplices[AccSlot + 1]
				Accomplices[AccSlot] = Accomplices[AccSlot + 1]
			Else
				Accomplices[AccSlot] = Agg
				Return
			Endif
			AccSlot += 1
		EndWhile
	Endif
EndFunction
Function Transition()
	If StandingStruggle
		StandingStruggle = False
		AllowResist = McmConfig.bResistQTE
	Endif
	If McmConfig.DamageStamina
		Player.DamageActorValue("Stamina", (Player.GetActorValue("Stamina") / 2))
	Endif
	If SetNextAgg()
		If IsKnockout
			SetPlayerAiDriven()
			RessConfig.DefeatPlayAnimation(Player, "Unconscious")
		Elseif Tied || AllowStaydown
			SetPlayerAiDriven()
			RessConfig.DefeatPlayAnimation(Player, "Lie")
		Else
			SetPlayerAiDriven(False)	; Allow the player to run away
			If !RessConfig.IsClothed(Player)
				RessConfig.CoverSelf(Player)
			Endif
		Endif
		If (!Enough && McmConfig.CollateralAssault)
			Collateral()
		Endif
		SetAdds()
		GoToState("Pursuit")
	Else
		If IsKnockout	
			RessConfig.DefeatPlayAnimation(Player, "Unconscious")
		Endif
		SetPlayerAiDriven()
		Persuer = TheLast
		GoToState("AssaultMode")
	Endif
;	UnregisterForModEvent("AnimationEnd_DefeatPvic")
EndFunction
;===== STRIPPING =====
Function Strip(Actor Vic, Actor Agg)
	Form BodyArmor = Vic.GetWornForm(0x00000004)
	If (BodyArmor && BodyArmor.HasKeyWordString("BU_Equip"))
		DefeatUtil.BUBreakArmor(Vic, BodyArmor)
	Else
		Agg.SetAngle(0.0, 0.0, Agg.GetAngleZ() + Agg.GetHeadingAngle(Vic))
		If (Player.GetItemCount(MiscFormLists[0].GetAt(0) As Form) > 0) ; MiscStuff/Sack
			RessConfig.ActionQst.OptionOutOfBag(Player, True)
		Endif
		If !NoTrans
			PieceToStrip(Vic, Agg, McmConfig.SSPvicSet[1], Armor.GetMaskForSlot(McmConfig.SSPvic[0] As Int))
			PieceToStrip(Vic, Agg, McmConfig.SSPvicSet[2], Armor.GetMaskForSlot(McmConfig.SSPvic[1] As Int))
			PieceToStrip(Vic, Agg, McmConfig.SSPvicSet[3], Armor.GetMaskForSlot(McmConfig.SSPvic[2] As Int))
			PieceToStrip(Vic, Agg, McmConfig.SSPvicSet[4], Armor.GetMaskForSlot(McmConfig.SSPvic[3] As Int))
			PieceToStrip(Vic, Agg, McmConfig.SSPvicSet[5], Armor.GetMaskForSlot(McmConfig.SSPvic[4] As Int))
			Weapon Equipped = Vic.GetEquippedWeapon()
			PieceToStrip(Vic, Agg, McmConfig.SSPvicSet[0], 0, Equipped)
			Equipped = Vic.GetEquippedWeapon(True)
			PieceToStrip(Vic, Agg, McmConfig.SSPvicSet[0], 0, Equipped)
			Armor Shield = Vic.GetEquippedShield()
			PieceToStrip(Vic, Agg, McmConfig.SSPvicSet[0], 0, Shield)
		Endif
	Endif
EndFunction
Function StripRegister(Actor Target)
	If McmConfig.bRedressPvic
		Form Clothes
		Int i
		While (i < 5)
			If (McmConfig.SSNVNSet[i+1] == "$UNEQUIP")
				Clothes = Target.GetWornForm(Armor.GetMaskForSlot(McmConfig.SSNVN[i] As Int))
				If Clothes
					SetFormValue(Target, "DefeatVictimClothesNVN"+i+1, Clothes)
				Endif
			Endif
			i += 1
		EndWhile
	Endif
EndFunction
Function StripColla(Actor Vic, Actor Agg)
	RessConfig.SetEmptyOutfit(Vic)
	StripRegister(Vic)
	Agg.SetAngle(0.0, 0.0, Agg.GetAngleZ() + Agg.GetHeadingAngle(Vic))
	PieceToStrip(Vic, Agg, McmConfig.SSNVNSet[1], Armor.GetMaskForSlot(McmConfig.SSNVN[0] As Int))
	PieceToStrip(Vic, Agg, McmConfig.SSNVNSet[2], Armor.GetMaskForSlot(McmConfig.SSNVN[1] As Int))
	PieceToStrip(Vic, Agg, McmConfig.SSNVNSet[3], Armor.GetMaskForSlot(McmConfig.SSNVN[2] As Int))
	PieceToStrip(Vic, Agg, McmConfig.SSNVNSet[4], Armor.GetMaskForSlot(McmConfig.SSNVN[3] As Int))
	PieceToStrip(Vic, Agg, McmConfig.SSNVNSet[5], Armor.GetMaskForSlot(McmConfig.SSNVN[4] As Int))	
	Weapon Equipped = Vic.GetEquippedWeapon()
	PieceToStrip(Vic, Agg, McmConfig.SSNVNSet[0], 0, Equipped)
	Equipped = Vic.GetEquippedWeapon(True)
	PieceToStrip(Vic, Agg, McmConfig.SSNVNSet[0], 0, Equipped)
	Armor Shield = Vic.GetEquippedShield()
	PieceToStrip(Vic, Agg, McmConfig.SSNVNSet[0], 0, Shield)
EndFunction
Function PieceToStrip(Actor Vic, Actor Agg, String Way, Int Slot, Form Weapons = None, Float WaitTime = 1.5, String Animation = "DefeatPickUp")
	Form Equipped
	If Weapons
		Equipped = Weapons
	Else
		Equipped = Vic.GetWornForm(Slot)
	Endif
	If (Equipped && (Way != "$Disabled"))
		If !Equipped.HasKeyWordString("SexLabNoStrip")
			If (Slot == 0x00000004)
				Animation = "DefeatStripAnim"
				WaitTime = 2.5
			Endif
			SendAnimationEvent(Agg, Animation)
			Wait(WaitTime)
			If (Way == "$UNEQUIP")
				Vic.UnequipItem(Equipped, False, True)
			Elseif ((Way == "$STEAL") && !IsCreature)
				Vic.RemoveItem(Equipped, 1, True, Agg)
			Else
				MiscFormLists[1].AddForm(Equipped) ; StrippedStuff
				Vic.UnequipItem(Equipped, False, True)
				Vic.DropObject(Equipped)
			Endif
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
Function RecoverStuff(Actor Target)
	Cell c = Target.GetParentCell()
	Int NumRefs = c.GetNumRefs(26) ; 41 Weapon ; Armor = 26
	While NumRefs 
		NumRefs -= 1
		Form TheArmor = (c.GetNthRef(NumRefs, 26))
		If TheArmor
			Form BaseItem = (TheArmor As ObjectReference).GetBaseObject()
			If BaseItem
				If MiscFormLists[1].HasForm(BaseItem) ; StrippedStuff
		 			Target.AddItem(TheArmor, abSilent = True)
				Endif
			Endif
		Endif
	EndWhile
	NumRefs = c.GetNumRefs(41)
	While NumRefs 
		NumRefs -= 1
		Form TheWeapon = (c.GetNthRef(NumRefs, 41))
		If TheWeapon
;			DefeatConfig.Log("TheWeapon - "+TheWeapon)
			Form BaseItem = (TheWeapon As ObjectReference).GetBaseObject()
			If BaseItem
;				DefeatConfig.Log("BaseItem - "+BaseItem)
				If MiscFormLists[1].HasForm(BaseItem) ; StrippedStuff
		 			Target.AddItem(TheWeapon, abSilent = True)
				Endif
			Endif
		Endif
	EndWhile
EndFunction
State FollowerWait
	Event OnBeginState()
		If !IsKnockout
			FillDifficulty = 0.008
			StruggleBar()
		Endif
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnUpdate()
		If (StruggleBar.Percent >= 1.0)
			Restored()
			RessConfig.DefeatPlayAnimation(Player, "Stand")
			Return
		Else
			If !StillBusy()
				Wait(4.0)
				Enough = True
				GoToState("AssaultMode")
				Return
			Elseif (!IsKnockout && Supervisor())
				If Input.IsKeyPressed(StrafeL) || Input.IsKeyPressed(StrafeR)
					Notification("$An aggressor watches you.")
					StruggleBar.Percent -= 0.2
					If (StruggleBar.Percent < 0)
						StruggleBar.Percent = 0
					Endif
				Endif
			Endif
		Endif
		RegisterForSingleUpdate(2.0)
	EndEvent
	Event OnEndState()
		If !IsKnockout
			StruggleBar(False)
		Endif
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If ((KeyCode == StrafeL) && LeftRight)
			LeftRight = False
			StruggleBar.Percent += FillDifficulty
		Elseif ((KeyCode == StrafeR) && !LeftRight)
			LeftRight = True
			StruggleBar.Percent += FillDifficulty
		Endif
	EndEvent
EndState
Actor Function Supervisor()
	Int i
	While (i < 5)
		If (Aggressors[i] && CheckActor(Aggressors[i]) && Aggressors[i].HasLOS(Player))
			If (!Aggressors[i].HasKeywordString("SexLabActive") || !Aggressors[i].HasKeywordString("DefeatCollateral"))
				Return Aggressors[i]
			Endif
		Endif
		i += 1
	EndWhile
	i = 0
	While (i < 5)
		If (Accomplices[i] && CheckActor(Accomplices[i]) && Accomplices[i].HasLOS(Player))
			If (!Accomplices[i].HasKeywordString("SexLabActive") || !Accomplices[i].HasKeywordString("DefeatCollateral"))
				Return Accomplices[i]
			Endif
		Endif
		i += 1
	EndWhile
	Return None
EndFunction
Bool Function StillBusy()
	Int i
	While (i < 5)
		If (Accomplices[i] && CheckActor(Accomplices[i]))
			Int FactionRank = Accomplices[i].GetFactionRank(RessConfig.DefeatFactions[1]) ; AggFaction
;			DefeatConfig.Log("StillBusy Accomplices[i] - "+Accomplices[i]+" / FactionRank AggFaction - "+FactionRank+" / HasKeywordString SexLabActive - "+Accomplices[i].HasKeywordString("SexLabActive")+" / HasKeywordString DefeatCollateral - "+Accomplices[i].HasKeywordString("DefeatCollateral"))
			If (FactionRank == 3 || Accomplices[i].HasKeywordString("SexLabActive") || Accomplices[i].HasKeywordString("DefeatCollateral"))
				Return True
			Endif
		Endif
		i += 1
	EndWhile
	i = 0
	While (i < 5)
		If (Aggressors[i] && CheckActor(Aggressors[i]))
			Int FactionRank = Aggressors[i].GetFactionRank(RessConfig.DefeatFactions[1]) ; AggFaction
;			DefeatConfig.Log("StillBusy Aggressors[i] - "+Aggressors[i]+" / FactionRank AggFaction - "+FactionRank+" / HasKeywordString SexLabActive - "+Aggressors[i].HasKeywordString("SexLabActive")+" / HasKeywordString DefeatCollateral - "+Aggressors[i].HasKeywordString("DefeatCollateral"))
			If (FactionRank == 3 || Aggressors[i].HasKeywordString("SexLabActive") || Aggressors[i].HasKeywordString("DefeatCollateral"))
				Return True
			Endif
		Endif
		i += 1
	EndWhile
	i = 0
	While (i < 5)
		If (Followers[i] && CheckActor(Followers[i]))
			Int FactionRank = Followers[i].GetFactionRank(RessConfig.DefeatFactions[0]) ; DefeatFaction
;			DefeatConfig.Log("StillBusy Followers[i] HasKeywordString SexLabActive - "+Followers[i].HasKeywordString("SexLabActive"))
			If (FactionRank == 3) || Followers[i].HasKeywordString("SexLabActive")
				Return True
			Endif
		Endif
		i += 1
	EndWhile
	Return False
EndFunction
State StruggleFree
	Event OnBeginState()
		FillDifficulty = 0.01
		FillThreshold = 0.0
		If !IsMovementControlsEnabled()
			SetPlayerAiDriven()
			EnablePlayerControls(1, 0, 0, 0, 0, 0, 0, 0)
		Endif
		SendAnimationEvent(Player, "DefeatTieUpEnter")
		Wait(2.0)
		StruggleBar()
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnUpdate()
		If (StruggleBar.Percent > FillThreshold)
			SendAnimationEvent(Player, "DefeatZapWriStruggle06")
		Else
			SendAnimationEvent(Player, "DefeatTieUpIdle")
		Endif
		If (StruggleBar.Percent >= 1.0)
			SendAnimationEvent(Player, "DefeatTieUpExit")
			Wait(2)
			Restored()
		Endif
		FillThreshold = StruggleBar.Percent
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnEndState()
		StruggleBar(False)
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If ((KeyCode == StrafeL) && LeftRight)
			LeftRight = False
			StruggleBar.Percent += FillDifficulty
		Elseif ((KeyCode == StrafeR) && !LeftRight)
			LeftRight = True
			StruggleBar.Percent += FillDifficulty
		Endif
	EndEvent
EndState
State QTE 																	;===== STATE QTE : RESIST Function
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Actor Aggressor = (akAggressor As Actor)
		If (Aggressor && (Aggressors.Find(Aggressor) != -1) && (Accomplices.Find(Aggressor) != -1))
			RessConfig.AddCalmList(Aggressor, Player)
		Endif
	EndEvent
	Event OnBeginState()
		If ((McmConfig.QTEHKType == "$Attack") || UsingGamepad())
			StrafeL = Input.GetMappedKey("Left Attack/Block")
			StrafeR = Input.GetMappedKey("Right Attack/Block")
			If McmConfig.bQTEmess
				MiscMessages[1].ShowAsHelpMessage("QTEAtk", 2, 1, 1)
			Endif
		Else
			StrafeL = Input.GetMappedKey("Strafe Left")
			StrafeR = Input.GetMappedKey("Strafe Right")
			If McmConfig.bQTEmess
				MiscMessages[2].ShowAsHelpMessage("QTEStrafe", 2, 1, 1)
			Endif
		Endif
		RegisterForKey(StrafeL)
		RegisterForKey(StrafeR)
		RegisterForSingleUpdate(2.0)
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If UsingGamepad()
			If !QTEKeypressed
				If (KeyCode == StrafeL) || (KeyCode == StrafeR)
					QTEKeypressed = True
				Endif
			Endif
		Endif
	EndEvent
	Event OnKeyUp(Int KeyCode, Float HoldTime)
		If UsingGamepad()
			If QTEKeypressed
				If (KeyCode == StrafeL) || (KeyCode == StrafeR)
					QTEKeypressed = False
				Endif
			Endif
		Endif
	EndEvent
	Event OnUpdate()
		If (Input.IsKeyPressed(StrafeL) || Input.IsKeyPressed(StrafeR) || QTEKeypressed)
			UnregisterForKey(StrafeL)
			UnregisterForKey(StrafeR)
			QTEKeypressed = False
			RessConfig.SoundToPlay[8].Play(Player) ; Rescue
			UnregisterForUpdate()
			RessConfig.StruggleSceneTrigger(TheNext, Player, "Player Victim")
;			GoToState("Resist")
		Else
			UnregisterForKey(StrafeL)
			UnregisterForKey(StrafeR)
			UnregisterForUpdate()
			GotoState("")
			PreDownRape()
		Endif
	EndEvent
EndState
Function StruggleBar(Bool Display = True)
	If Display
		If ((McmConfig.QTEHKType == "$Attack") || UsingGamepad())
			StrafeL = Input.GetMappedKey("Left Attack/Block")
			StrafeR = Input.GetMappedKey("Right Attack/Block")
		Else
			StrafeL = Input.GetMappedKey("Strafe Left")
			StrafeR = Input.GetMappedKey("Strafe Right")
		Endif
		RegisterForKey(StrafeL)
		RegisterForKey(StrafeR)
		StruggleBar.Alpha = 100.0
	Else
		StruggleBar.Alpha = 0.0
		StruggleBar.Percent = 0.0
		FillDifficulty = 0.0
		UnregisterForKey(StrafeL)
		UnregisterForKey(StrafeR)
	EndIf
EndFunction
State PushAway 																	;===== Resist during sexlab animation
	Event OnBeginState()
		If ((McmConfig.QTEHKType == "$Attack") || UsingGamepad())
			StrafeL = Input.GetMappedKey("Left Attack/Block")
			StrafeR = Input.GetMappedKey("Right Attack/Block")
		Else
			StrafeL = Input.GetMappedKey("Strafe Left")
			StrafeR = Input.GetMappedKey("Strafe Right")
		Endif
		RegisterForKey(StrafeL)
		RegisterForKey(StrafeR)
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If (!SSpamGuard && ((KeyCode == StrafeL) || (KeyCode == StrafeR)))
			SSpamGuard = True
			Wait(1.0)
			If (Input.IsKeyPressed(StrafeL) && Input.IsKeyPressed(StrafeR))
				RessConfig.StrugglePushAwayTrigger(TheNext, Player)
				GoToState("")
			Endif
			SSpamGuard = False
		Endif
	EndEvent
	Event OnEndState()
		UnregisterForKey(StrafeL)
		UnregisterForKey(StrafeR)
	EndEvent
EndState
Function SetGetUpInRestored(Bool On = True)
	IsQTEKD = On
EndFunction
Function Restored()																		;===== RESTORED
	RessConfig.MiscSpells[5].Cast(Player, Player) ; ImmunitySPL
	If Player.HasSpell(RessConfig.MiscSpells[1]) ; DebuffConsSPL
		Player.RemoveSpell(RessConfig.MiscSpells[1]) ; DebuffConsSPL
	Endif
	If IsQTEKD
		RessConfig.DefeatPlayAnimation(Player, "Stand")
	Else
		SendAnimationEvent(Player, "BleedoutStop")
	Endif
	Int i
	While (i < 10)
		TheAggressors[i].Clear()
		If (i < 5)
			If Aggressors[i]
				SetIntValue(Aggressors[i], "RapedByInScene"+Player, 0) ; Reset rape count for this scene
			Endif
			Aggressors[i] = None
			Accomplices[i] = None
			Followers[i] = None
 			TheFollowers[i].Clear()
			CollaVic[i].Clear()
			CollaAgg[i].Clear()
			CollaAggAdd[i].Clear()
 		Endif
		i += 1
	EndWhile
	i = 0
	While (i < 4)
		If MiscScenes[i]
			MiscScenes[i].Stop()
		Endif
		i += 1
	EndWhile
	Message.ResetHelpMessage("QTEStrafe")
	Message.ResetHelpMessage("QTEAtk")
	SceneCenter.Clear()
	AliasLastAgg.Clear()
	AliasTheNext.Clear()
	AliasLastVic.Clear()
	RessConfig.FadeIn()
	IsSurrender = False
	SpamGuard = False
	SSpamGuard = False
	RessConfig.AWitness = None
	TheLast = None
	TheNext = None 
	AddOne = None
	AddTwo = None
	AddThree = None
	Stripped = False
	Raped = False
	Robbed = False
	ManualStart = False
	Enough = False
	NumRapes = 0
	ForcedScene = ""
	MiscFormLists[1].Revert() ; StrippedStuff
	If (StruggleBar.Alpha > 0.0)
		StruggleBar(False)
	Endif
;	If OwnerFaction
;		Player.RemoveFromFaction(OwnerFaction)
;		OwnerFaction = None
;	Endif
	CrimeGold = 0
	CrimeGoldViolent = 0
	PlayerFaction.Clear()
	Detect.Stop()
	SetPlayerAiDriven(False)
;	PlayerBase.SetInvulnerable(False)
	EnablePlayerControls()
	Player.SetAnimationVariableBool("bSprintOK", True)
	If !Player.IsDead() && (Player.GetActorValue("Health") < 10)
		Player.RestoreActorValue("Health", 10)
	Endif
;	Player.EnableAI()
	RessConfig.QSTStage = 0
	GoToState("Running")
	DefeatConfig.Log("Player victim - End scene, Restored.")
EndFunction 
Function CleanAggAliases()
	Int i
	While (i < 10)
		TheAggressors[i].Clear()
		i += 1
	EndWhile
EndFunction
Function SetSceneData()
	RessConfig.LastSceneAggressors = Aggressors
	RessConfig.LastSceneAccomplices = Accomplices
	RessConfig.LastSceneFollowers = Followers
	RessConfig.LastSceneTheLast = TheLast
	RessConfig.LastSceneRaped = Raped
	RessConfig.LastSceneRobbed = Robbed
EndFunction
Actor[] Function GetAggressors()
	Return Aggressors
EndFunction
Actor[] Function GetAccomplices()
	Return Accomplices
EndFunction
Actor[] Function GetFollowers()
	Return Followers
EndFunction
Actor Function GetLastAggressor()
	Return TheLast
EndFunction
Actor Function GetTheNext()
	Return TheNext
EndFunction
Function SetTheNext(Actor Aggressor)
	TheNext = Aggressor
EndFunction
Bool Function HasBeenRaped()
	Return Raped
EndFunction
Bool Function HasBeenRobbed()
	Return Robbed
EndFunction
Int Function GetScenecrimegold()
	Return CrimeGold
EndFunction
Int Function GetScenecrimegoldViolent()
	Return CrimeGoldViolent
EndFunction
Actor Function GetWitness()
	If AllowWitness
		RessConfig.DefeatRape.SendStoryEvent(None, Player, TheNext)
	Endif
	Wait(1)
	Return RessConfig.AWitness
EndFunction
Function AddAggressor(Actor Target, Int Slot)
	If !Aggressors[Slot]
		DefeatConfig.Log("AddAggressor, Target - "+Target+" / Slot - "+Slot)
		Aggressors[Slot] = Target
		TheAggressors[Slot].ForceRefTo(Target)
		Target.EvaluatePackage()
	Endif
EndFunction
Function AddAccomplice(Actor Target, Int Slot)
	If !Accomplices[Slot]
		DefeatConfig.Log("AddAccomplice, Target - "+Target+" / Slot - "+Slot)
		Accomplices[Slot] = Target
		TheAggressors[Slot + 5].ForceRefTo(Target)
		Target.EvaluatePackage()
	Endif
EndFunction
Bool Function RemoveAggressor(Actor Target)
	Int i = Aggressors.Find(Target)
	If (i != -1)
		If ((Aggressors[i] != TheNext) && (Aggressors[i] != TheLast))
			Aggressors[i] = None
			TheAggressors[i].Clear()
			NumAgg -= 1
			DefeatConfig.Log("RemoveAggressor Remove aggressor "+Target+" / Slot - "+i)
			Return True
		Endif
	Endif
	i = Accomplices.Find(Target)
	If (i != -1)
		If ((Accomplices[i] != TheNext) && (Accomplices[i] != TheLast))
			Accomplices[i] = None
			TheAggressors[i + 5].Clear()
			NumAgg -= 1
			DefeatConfig.Log("RemoveAggressor Remove accomplice - "+Target+" / Slot - "+i)
			Return True
		Endif
	Endif
	Return False
EndFunction
Actor Function IsThereNext()
	Return TheNext
EndFunction
Scriptname DefeatPostRscr extends Quest
{Script for post assault triggered quests}
DefeatConfig Property Defeat Auto
DefeatMCMscr Property McmConfig Auto
DefeatPAscr Property PostAssaultscr Auto
DialogueFollowerScript Property FollowerScr Auto
Import Game
Import Utility

Quest Property TheQuest Auto
String Property TheQuestName Auto
Bool Property ThroughDA = False Auto Hidden

GlobalVariable[] Property MiscGlobal Auto ; GameHour PlayerFollowerCount 
FormList[] Property MiscFormLists Auto
ReferenceAlias[] Property MiscAliasRefs Auto
LocationAlias[] Property MiscAliasLocs Auto
ObjectReference[] Property MiscRefs Auto
Scene[] Property MiscScenes Auto
Actor Property Player Auto
Actor[] Aggressors
Actor[] Followers
Actor SCAggressor
Actor SCVictim

Event OnInit()
	Aggressors = New Actor[5]
	Followers = New Actor[5]
EndEvent
Function DisableEnableControls(Bool Enable = True)
	If Enable
		EnablePlayerControls()
	Else
		DisablePlayerControls(abCamSwitch = True, abMenu = False)
	Endif
EndFunction
Function BeginQuest()
	Aggressors = Defeat.LastSceneAggressors 	;   / Get data from the current assault scene. (Register aggressors and partners into arrays created on this script for easy access.
	Followers = Defeat.LastSceneFollowers	 	; _/ 
	GoToState(TheQuestName)
EndFunction

State LeftForDead
	Event OnBeginState() ; Qst name : "Left For Dead" // The player and his followers wake up in the nearest wilderness. 
		SendModEvent("DefeatPostAssault", "LFDBegin")
		PostAssaultscr.PickSecondEvent() ; Pick a second event before the fade in
		ObjectReference TeleportRef = MiscAliasRefs[0].GetReference()
		Location LocationCurrent = MiscAliasLocs[0].GetLocation()
		;/	
		ObjectReference EdgeHold = MiscAliasRefs[1].GetReference()
		ObjectReference OutsideHold = MiscAliasRefs[2].GetReference()
		ObjectReference Map = MiscAliasRefs[3].GetReference()
		ObjectReference EdgeCity = MiscAliasRefs[4].GetReference()
		ObjectReference OutsideCity = MiscAliasRefs[5].GetReference()
		ObjectReference EdgeTown = MiscAliasRefs[6].GetReference()
		ObjectReference OutsideTown = MiscAliasRefs[7].GetReference()
		ObjectReference Edge = MiscAliasRefs[8].GetReference()
		ObjectReference Outside = MiscAliasRefs[9].GetReference()

		DefeatConfig.Log("LocationCurrent - "+LocationCurrent)
		If LocationCurrent
			DefeatConfig.Log("LocationCurrent Name - "+LocationCurrent.GetName())
		Endif
		DefeatConfig.Log("EdgeHold - "+EdgeHold)
		If EdgeHold
			DefeatConfig.Log("EdgeHold Location Name - "+EdgeHold.GetCurrentLocation().GetName())
		Endif
		DefeatConfig.Log("OutsideHold - "+OutsideHold)
		If OutsideHold
			DefeatConfig.Log("OutsideHold Location Name - "+OutsideHold.GetCurrentLocation().GetName())
		Endif	
		DefeatConfig.Log("Map - "+Map)
		If Map
			DefeatConfig.Log("Map Location Name - "+Map.GetCurrentLocation().GetName())
		Endif
		DefeatConfig.Log("EdgeCity - "+EdgeCity)
		If EdgeCity
			DefeatConfig.Log("EdgeCity Location Name - "+EdgeCity.GetCurrentLocation().GetName())
		Endif
		DefeatConfig.Log("OutsideCity - "+OutsideCity)
		If OutsideCity
			DefeatConfig.Log("OutsideCity Location Name - "+OutsideCity.GetCurrentLocation().GetName())
		Endif
		DefeatConfig.Log("EdgeTown - "+EdgeTown)
		If EdgeTown
			DefeatConfig.Log("EdgeTown Location Name - "+EdgeTown.GetCurrentLocation().GetName())
		Endif
		DefeatConfig.Log("OutsideTown- "+OutsideTown)
		If OutsideTown
			DefeatConfig.Log("OutsideTown Location Name - "+OutsideTown.GetCurrentLocation().GetName())
		Endif
		DefeatConfig.Log("Edge - "+Edge)
		If Edge
			DefeatConfig.Log("Edge Location Name - "+Edge.GetCurrentLocation().GetName())
		Endif
		DefeatConfig.Log("Outside - "+Outside)
		If Outside
			DefeatConfig.Log("Outside Location Name - "+Outside.GetCurrentLocation().GetName())
		Endif
		/;
		DefeatConfig.Log("LeftForDeadQst / Teleport to Ref - "+TeleportRef+" / BaseObject "+TeleportRef.GetBaseObject())
		If Defeat.LastSceneRaped
			Defeat.SexLab.AddCum(Player)
		Endif
		Player.MoveTo(TeleportRef)
		Wait(0.5)
;		FadeOutGame(False, True, 6, 3)
		MiscGlobal[0].Mod(RandomFloat(3, 6))
		TPFollowers(Player)
		Defeat.FadeIn(5.0)
;		RegisterForAnimationEvent(Player, "GetUpEnd")
		If ThroughDA
			ThroughDA = False
			SendModEvent("da_StartRecoverSequence", numArg = 9999.0)
		Else
			SetPlayerAiDriven(False)
			EnablePlayerControls()
			Defeat.DefeatPlayAnimation(Player, "Stand")
		Endif
		Stop()
	EndEvent
;	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
;		UnregisterForAnimationEvent(akSource, "GetUpEnd")
;		Defeat.CoverSelf(Player)
;		Stop()
;	EndEvent
EndState

State Defeated
	Event OnBeginState() ; The player and his followers wake up in the nearest inn. ; Qst name : "Defeated"
		SendModEvent("DefeatPostAssault", "DefeatedBegin")
		PostAssaultscr.PickSecondEvent() ; Pick a second event before the fade in
;/		Location TheInn = MiscAliasLocs[0].GetLocation()
		Location TheCity = MiscAliasLocs[1].GetLocation()
		Location TheTown = MiscAliasLocs[2].GetLocation()
		Location TheOther = MiscAliasLocs[3].GetLocation()
		DefeatConfig.Log("TheCity - "+TheCity)
		If TheCity
			DefeatConfig.Log("TheCity Name - "+TheCity.GetName())
		Endif
		DefeatConfig.Log("TheTown - "+TheTown)
		If TheTown
			DefeatConfig.Log("TheTown Name - "+TheTown.GetName())
		Endif
		DefeatConfig.Log("TheOther - "+TheOther)
		If TheOther
			DefeatConfig.Log("TheOther Name - "+TheOther.GetName())
		Endif
		DefeatConfig.Log("TheInn - "+TheInn)
		If TheInn
			DefeatConfig.Log("TheInn Name - "+TheInn.GetName())
		Endif
		If Player.IsInInterior()
			MiscGlobal[0].Mod(RandomFloat(4, 8))
		Else
			MiscGlobal[0].Mod(RandomFloat(2, 4))
		Endif/;
		If Defeat.LastSceneRaped
			Defeat.SexLab.AddCum(Player)
		Endif
		Actor InnKeeper = (MiscAliasRefs[1].GetReference() As Actor) ; TP ref
		ObjectReference Bed = MiscAliasRefs[0].GetReference()
		Player.MoveTo(Bed) ; Move the player to the nearest bed
		Wait(0.5)
		FadeOutGame(False, True, 6, 3) ; Fade In
		TPFollowers(InnKeeper)
		Defeat.Clothed = Defeat.IsClothed(Player)
		If !Defeat.Clothed ; Equip clothes given by the InnKeeper if naked
			Armor TheClothes = (MiscFormLists[0].GetAt(RandomInt(0, 6)) As Armor) ; Clothes list
			Player.AddItem(TheClothes, 1, True)
			Wait(0.25)
			Player.EquipItem(TheClothes, abSilent = True)
		Endif
		If ThroughDA
			ThroughDA = False
			SendModEvent("da_StartRecoverSequence", numArg = 9999.0)
		Endif
;		ObjectReference Bed = MiscAliasRefs[0].GetReference()
		Player.SetPosition(Bed.GetPositionX(), Bed.GetPositionY(), Bed.GetPositionZ())
		Player.SetAngle(Bed.GetAngleX(), Bed.GetAngleY(), Bed.GetAngleZ())
;		Defeat.DefeatPlayAnimation(Player, "Sit")
		Defeat.FadeIn(5.0)
		If !IsMovementControlsEnabled()
			SetPlayerAiDriven(False)
			EnablePlayerControls()
		Endif
;		Debug.SendAnimationEvent(Player, "IdleBedExitStart")
		Defeat.DefeatPlayAnimation(Player, "Stand")
		Stop()
	EndEvent
;	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
;		UnregisterForAnimationEvent(akSource, "GetUpEnd")
;	EndEvent
	Function Scene01()
	EndFunction
EndState

;/State BanditSequeste
	Event OnBeginState() ; Function BanditSequesterQst() ; BANDIT - The player and his followers are abducted in a hideout.
	; Choose random camp
	; Teleport
	; Start the quest objectives and timer for events
	EndEvent
EndState

State Sequestered
	Event OnBeginState()
		Player.MoveTo(LocationsM[0])
		FadeOutGame(False, True, 5, 1)
		MiscGlobal[0].Mod(RandomFloat(3, 6))
		TPFollowers(LocationsM[1])
		If ThroughDA
			ThroughDA = False
			Wait(3.0) ; Wait for the fade in
			SendModEvent("da_StartRecoverSequence")
		Else
			Wait(3.0) ; Wait for the fade in
			SetPlayerAiDriven()
			DisableEnableControls(False)
		Endif
	EndEvent
	Event OnUpdateGameTime() ; For scenes to happen
	;	If (GetStage() == 10)
	;		StartAScene()
	;	Else
	;		UnRegisterForUpdateGameTime()
	;	EndIf
	EndEvent
	Function Scene01()

	EndFunction
EndState

State Followerkidnapping
	Event OnBeginState()
		; MiscAliasRefs[0] = Victim ref
		; MiscAliasRefs[1] = Boss ref
		; MiscAliasRefs[2] = Victim Marker
		; MiscAliasRefs[3] = Vanilla follower alias ref
		If PostAssaultscr.Blackout ; Only if the quest is not a secondary quest
			FadeOutGame(False, True, 5, 1) ; Fade In
			MiscGlobal[0].Mod(RandomFloat(2, 4))
			If Defeat.LastSceneRaped
				Defeat.SexLab.AddCum(Player)
				Defeat.SexLab.ActorAdjustBy(Player, "Vaginal", RandomInt(2, 4))
				Defeat.SexLab.ActorAdjustBy(Player, "Anal", RandomInt(1, 2))
			Endif
		Endif
		Actor Victim = Followers[0]
		If Defeat.EFFon
			DefeatConfig.GetEFF().XFL_RemoveFollower(Victim, iSayLine = 1)
		Else
			If (MiscGlobal[1].GetValueInt() == 1) && ((MiscAliasRefs[0].GetReference() As Actor) == MiscAliasRefs[3].GetActorRef() as Actor) ;  Victim ref / Vanilla follower alias ref
				FollowerScr.DismissFollower(iSayLine = 0)
			Endif
		Endif
		MiscAliasRefs[0].ForceRefTo(Victim)
		Victim.MoveTo(MiscAliasRefs[2].GetReference()) ; Victim Marker
		Victim.RemoveAllItems((MiscAliasRefs[1].GetReference() As Actor)) ; Boss ref
		If PostAssaultscr.Blackout
			ForceThirdPerson()
	;		Defeat.DefeatPlayAnimation(Player, "Lie")
	;		Wait(4.0)
	;		Defeat.DefeatPlayAnimation(Player, "Stand")
			SetPlayerAiDriven(False)
			DisableEnableControls(False)
		Endif
		TheQuest.SetStage(10)
		TheQuest.SetObjectiveDisplayed(10, 1)
		TheQuest.SetObjectiveDisplayed(5, 1)
;		DefeatConfig.Log("VictimAlias - "+(MiscAliasRefs[0].GetReference() As Actor).GetLeveledActorBase().GetName()+" // MiscAliasRefs[3] - "+(MiscAliasRefs[3].GetReference() As Actor).GetLeveledActorBase().GetName()+" // CaptiveMAlias - "+CaptiveMAlias+" // BossAlias - "+(MiscAliasRefs[1].GetReference() As Actor).GetLeveledActorBase().GetName())
	EndEvent
EndState/;

Function TPFollowers(ObjectReference TheRef)
	Int i = 0
	While (i < 5)
		If Followers[i]
			If (i == 0)
				Followers[i].MoveTo(TheRef, 3)
			Elseif (i == 1)
				Followers[i].MoveTo(TheRef, 3, 3)
			Elseif (i == 2)
				Followers[i].MoveTo(TheRef, 0, 3)
			Elseif (i == 3)
				Followers[i].MoveTo(TheRef, -3)
			Elseif (i == 4)
				Followers[i].MoveTo(TheRef, -3, -3)
			Endif
		Endif
		i += 1
	EndWhile
EndFunction
Function Scene01()
EndFunction
Function Scene02()
EndFunction

;/Function Rape()
	RegisterForModEvent("AnimationEnd_DefeatPArape", "PostRapeEnd")
	sslThreadModel Make = SexLabUtil.NewThread()
	Make.AddActor(SCVictim, isVictim = True)
	Make.AddActor(SCAggressor)
	Make.DisableUndressAnimation(SCVictim)
	Make.DisableRagdollEnd(SCAggressor)
	Make.SetBedding(0)
	Make.SetHook("DefeatPostR")
	sslThreadController Thread = Make.StartThread()
EndFunction
Event PostRapeEnd(string EventName, string argString, Float argNum, form sender)	
	DefeatConfig.Log("Vic for trauma -> "+SCVictim.GetBaseObject().GetName())

	Defeat.DefeatPlayAnimation(SCVictim, "Lie")
	Wait(10.0)
	Defeat.DefeatPlayAnimation(SCVictim, "Stand")
	
	If (SCVictim == Player)
		DisableEnableControls()
	EndIf

	UnregisterForModEvent("AnimationEnd_DefeatPArape")
EndEvent/;
Scriptname DefeatPAscr Extends Quest

DefeatMCMscr Property McmConfig Auto
DefeatConfig Property Defeat Auto
DefeatPostRscr Property PostRScr Auto Hidden
DefeatPlayer Property PlayerScr Auto

Import Game
Import Utility
Import Debug

Quest[] Property PostAssaultQsts Auto Hidden
Actor Property Player Auto
Bool Property Blackout Auto Hidden
FormList Property ForbiddenLocList Auto
String CustomEvent
GlobalVariable GameHour

;;
ImageSpaceModifier Property ISFadeOut Auto

Function Install()
	PostAssaultQsts = New Quest[10]
	PostAssaultQsts[0] = (GetFormFromFile(0xC1173, "SexLabDefeat.esp") As Quest) 	; LeftForDeadQST
	PostAssaultQsts[1] = (GetFormFromFile(0xC16D8, "SexLabDefeat.esp") As Quest)	; DefeatedQST
	PostAssaultQsts[2] = (GetFormFromFile(0x10EFF0, "SexLabDefeat.esp") As Quest) 	; SequesteredQST
	PostAssaultQsts[3] = (GetFormFromFile(0xF8B09, "SexLabDefeat.esp") As Quest) 	; FollowerKidnappingQST
	GameHour = (GetFormFromFile(0x00038, "Skyrim.esm") As GlobalVariable)
EndFunction
Function Configure()
EndFunction

Function Escape()
	PlayerScr.SetGetUpInRestored(False)
	If PlayerScr.IsPlayerKnokedOut()
		PlayerScr.CleanAggAliases()
		Defeat.FadeIn(3.0)
		GameHour.Mod(RandomFloat(1, 2))
		Defeat.DefeatPlayAnimation(Player, "Sit")
		PlayerScr.MiscScenes[1].ForceStart() ; SCEscape
	Else
		If (McmConfig.bEscape == "$Trauma")
	;		Defeat.Fadein(3.0)
			PlayerScr.MiscScenes[1].ForceStart() ; SCEscape
		Else
			Wait(3.0)
			Defeat.DefeatPlayAnimation(Player, "Stand")
			PlayerScr.Restored()
		Endif
	Endif
EndFunction

Event DARecoverSequence(string eventName, string strArg, float numArg, Form sender)
;	DefeatConfig.Log("DARecoverSequence - Player.HasKeywordString(DefeatActive) - "+Player.HasKeywordString("DefeatActive"))
	If Player.HasKeywordString("DefeatActive")
		PlayerScr.Restored()
	Endif
	UnregisterForModEvent("da_StartRecoverSequence")
EndEvent

Function PickEvent()
	Blackout = True
	If (PlayerScr.ForcedScene == "")
		If (Defeat.LastSceneTheLast && Defeat.LastSceneTheLast.IsDead()) ; Check if the last aggressor is dead in case of double ko or something and then triggers a simple escape
			Escape()
			Return
		Endif
		
		If Defeat.DAon
			If (RandomInt(1, 100) < McmConfig.DAsChance)
				RegisterForModEvent("da_StartRecoverSequence", "DARecoverSequence")
				Int DA = ModEvent.Create("da_ForceBlackout")
				ModEvent.PushString(DA, "ForceBlackout")
				ModEvent.PushString(DA, "None")
				ModEvent.PushFloat(DA, 1.0)
				ModEvent.PushForm(DA, Defeat.LastSceneTheLast)
				If ModEvent.Send(DA)
					RegisterForSingleUpdate(10.0)
					Return
				Endif
			Endif
		Endif

		String[] Events = New String[10]
		Int n = -1
		Int i

		; vv Check conditions vv
		DefeatConfig.Log("Outcome // Defeat.TheEvilFaction - "+Defeat.TheEvilFaction+" / Raped - "+Defeat.LastSceneRaped+" / Robbed - "+Defeat.LastSceneRobbed)
		; ^^ Check conditions ^^

		String EvilFaction = Defeat.TheEvilFaction
		If ((EvilFaction != "") && (EvilFaction != "Evil"))
			; Register faction events
			If (Defeat.TheEvilFaction == "Guard")
				If McmConfig.PAbEnabled[0] ; Jailed
					Faction CrimeFaction = Defeat.LastSceneTheLast.GetCrimeFaction()
					If CrimeFaction
						If ((CrimeFaction.GetCrimeGold() > 0) || (CrimeFaction.GetCrimeGoldViolent() > 0))
							CrimeFaction.SendPlayerToJail()
							PlayerScr.Restored()
							Defeat.DefeatPlayAnimation(Player, "Stand")
							Return
						Endif
					Endif
				Endif
			Elseif (EvilFaction == "Bandit")

			Elseif (EvilFaction == "Forsworn")

			Elseif (EvilFaction == "Silver Hand")

			Elseif (EvilFaction == "Thalmor")

			Elseif (EvilFaction == "Vampire")

			Elseif (EvilFaction == "Warlock")

			Elseif (EvilFaction == "Necromancer")

			Elseif (EvilFaction == "Bloodkin")

			Endif
		Endif

	;	If !ForbiddenLoc(Me.GetCurrentLocation())
		; Register misc events
		If (Chance(0) && OnlyEnemy(0, EvilFaction != "") && OnlyRaped(0, Defeat.LastSceneRaped)) ; LeftForDeadQST
			n += 1
			i = Events.Find("")
			Events[i] = "Left For Dead"
		Endif
		If (Chance(1) && OnlyEnemy(1, EvilFaction != "") && OnlyRaped(1, Defeat.LastSceneRaped)) ; DefeatedQST
			n += 1
			i = Events.Find("")
			Events[i] = "Defeated"
		Endif
		If (Defeat.SimpleSlaveryon && Chance(2) && OnlyEnemy(2, EvilFaction != "") && OnlyRaped(2, Defeat.LastSceneRaped)) ; Simple slavery
			n += 1
			i = Events.Find("")
			Events[i] = "SSLV Entry"
		Endif

		DefeatConfig.Log("Events array // 1 - "+Events[0]+" / 2 - "+Events[1]+" / 3 - "+Events[2]+" / 4 - "+Events[3]+" / 5 - "+Events[4]+" / 6 - "+Events[5]+" / 7 - "+Events[6]+" / 8 - "+Events[7]+" / 9 - "+Events[8]+" / 10 - "+Events[9])
		If (n != -1) ; Nothing in the array to choose from
			TriggerEvent(Events, n)
		Else
			Escape()
		Endif
	Elseif ((PlayerScr.ForcedScene == "Left For Dead")) ; Tamriel
		TriggerEvent(TheEvent = PostAssaultQsts[0])
	Elseif (PlayerScr.ForcedScene == "Defeated")
		TriggerEvent(TheEvent = PostAssaultQsts[1])
	Elseif (PlayerScr.ForcedScene == "End")
		Escape()
	Else
		TriggerEvent(ForceEvent = PlayerScr.ForcedScene)
	Endif
EndFunction
Function PickSecondEvent() ; Triggers a second event for events that allows it.
	String[] Events = New String[10]
	Int n = -1
	Int i
	String EvilFaction = Defeat.TheEvilFaction
	If ((EvilFaction != "") && (EvilFaction != "Evil"))
		If (EvilFaction == "Bandit")							; =============== Bandit

		Elseif (EvilFaction == "Forsworn")

		Elseif (EvilFaction == "Silver Hand")

		Elseif (EvilFaction == "Thalmor")

		Elseif (EvilFaction == "Vampire")

		Elseif (EvilFaction == "Warlock")

		Elseif (EvilFaction == "Necromancer")

		Elseif (EvilFaction == "Bloodkin")

		Endif
	Endif
	DefeatConfig.Log("Second Events array // 1 - "+Events[0]+" / 2 - "+Events[1]+" / 3 - "+Events[2]+" / 4 - "+Events[3]+" / 5 - "+Events[4]+" / 6 - "+Events[5]+" / 7 - "+Events[6]+" / 8 - "+Events[7]+" / 9 - "+Events[8]+" / 10 - "+Events[9])
	If (n != -1) ; Nothing in the array to choose from
		TriggerEvent(Events, n, Blackout = False, Restored = False)
	Endif
EndFunction
Function TriggerEvent(String[] Events = None, Int n = 0, String ForceEvent = "", Quest TheEvent = None, Bool Blackout = True, Bool Restored = True)
	Bool DoEvent = False
	If (!TheEvent && (ForceEvent == ""))
		Int Rand = RandomInt(0, n)
		If ((Events[Rand] == "Left For Dead") && PostAssaultQsts[0].Start())
			DefeatConfig.Log("Post assault / TriggerEvent chosen - Left For Dead")
			TheEvent = PostAssaultQsts[0]
			DoEvent = True
		Elseif ((Events[Rand] == "Defeated") && PostAssaultQsts[1].Start())
			DefeatConfig.Log("Post assault / TriggerEvent chosen - Defeated")
			TheEvent = PostAssaultQsts[1]
			DoEvent = True
		Elseif ((Events[Rand] != "Left For Dead") && (Events[Rand] != "Defeated"))
			CustomEvent = Events[Rand]
			DefeatConfig.Log("Post assault / TriggerEvent chosen - "+CustomEvent)
			DoEvent = True
		Endif
	Else
		If TheEvent
			If TheEvent.Start()
				PlayerScr.SetGetUpInRestored(False)
				DefeatConfig.Log("Post assault / TriggerEvent forced event - "+TheEvent.GetName())
				DoEvent = True
			Endif
		Else
			CustomEvent = ForceEvent
		Endif
	Endif
	If DoEvent
		If Blackout
			BlackOut()
		Endif
		If !Defeat.LastSceneRobbed
			Defeat.GetStrippedItems(Player)
		Endif
		If TheEvent
	  		PostRScr = (TheEvent As DefeatPostRscr)
			PostRScr.BeginQuest()
		Else
			Defeat.FadeIn()
			SendModEvent(CustomEvent)
		Endif
		If Restored
			PlayerScr.Restored()
		Endif
	Elseif Blackout ; Make sure to not trigger escape for secondary events.
		DefeatConfig.Log("Post assault / No post assault events, trigger escape event")
		Escape()
	Endif
EndFunction

Bool Function ForbiddenLoc(Location TheLoc)
	If TheLoc
		Int n = TheLoc.GetNumKeywords()
		Int i
		While (i < n)
			If ForbiddenLocList.HasForm(TheLoc.GetNthKeyword(i))
				Return True
			Endif
			i += 1
		Endwhile
	Endif
	Return False
EndFunction

Bool Function Chance(Int Slot)
	Return (RandomInt(0, 100) < McmConfig.PAfrequency[Slot])
EndFunction
Bool Function OnlyEnemy(Int Slot, Bool IsEnemy)
	If !McmConfig.PAbOnlyEnemy[Slot]
		Return True
	Endif
	Return IsEnemy
EndFunction
Bool Function OnlyRaped(Int Slot, Bool BeenRaped)
	If !McmConfig.PAbOnlyRaped[Slot]
		Return True
	Endif
	Return BeenRaped
EndFunction
Bool Function OnlyEvil(Bool TheOption)
	Return (TheOption && (Defeat.TheEvilFaction == ""))
EndFunction
Bool Function OnlySecondary(Int Slot)
	Return McmConfig.PAbSecondary[Slot]
EndFunction

Function BlackOut()
	SendModEvent("DefeatPostAssault", "BlackOutBegin")
	Defeat.DefeatPlayAnimation(Player, "Lie")
;	Player.PushActorAway(Player, 0.1)
;	ISFadeOut.Apply()
	Defeat.FadeOut(3.0)
	Wait(3.0)
;	Wait(1)
;	FadeOutGame(True, True, 0, 3) ; Fade out
;	Wait(1)
;	FadeOutGame(False, True, 6, 3) ; Fade in
EndFunction
Event OnUpdate()
	If Player.HasKeywordString("DefeatActive")
		PlayerScr.Restored()
	Endif
EndEvent
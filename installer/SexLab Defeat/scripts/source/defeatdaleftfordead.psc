Scriptname DefeatDALeftForDead extends daymoyl_QuestTemplate  

DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto
DefeatPlayer Property PlayerScr Auto
DefeatPAscr Property PostAssaultscr Auto

Actor Property Player Auto

Bool Function QuestCondition(Location akLocation, Actor akAggressor, Actor akFollower)
{Condition that must be satisfied for the quest to fire.}
	If (akAggressor && RessConfig.OnOffPlayerVictim)
		If !PlayerScr.SceneCenter.GetReference()
			ObjectReference Marker
			If Player.IsInInterior()
				Marker = Game.FindClosestReferenceOfAnyTypeInListFromRef(PlayerScr.MiscFormLists[3], Player, 50000.0) ; DefeatMarkerListInt
				If Marker
					PlayerScr.SceneCenter.ForceRefTo(Marker)
				Endif
			Else
				Marker = Game.FindClosestReferenceOfAnyTypeInListFromRef(PlayerScr.MiscFormLists[2], Player, 50000.0) ; DefeatMarkerListExt
				If Marker
					PlayerScr.SceneCenter.ForceRefTo(Marker)
				Endif
			Endif
		Endif
		Return PlayerScr.SceneCenter.GetReference()
	Endif
	Return False
EndFunction

Bool Function QuestStart(Location CurrentLocation, Actor akAggressor, Actor akFollower)
{Starts the quest and returns true on success.}
	If Start()
		DefeatPostRscr PostRScr = ((Self As Quest) As DefeatPostRscr)
		PostRScr.ThroughDA = True
		If akFollower
			RessConfig.LastSceneFollowers[0] = akFollower
		Endif
		RessConfig.LastSceneAggressors[0] = akAggressor
		PostRScr.BeginQuest()
		Return True
	Endif
	Return False
EndFunction
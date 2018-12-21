Scriptname DefeatBurlapSackScr extends ObjectReference  

DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto
DefeatActionScr Property ActionQst Auto

Actor Property Player Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If (akNewContainer == Player)
		Form Sack = (RessConfig.MiscFormLists[0].GetAt(0) As Form) ; MiscStuff/Sack
		Player.EquipItem(Sack, True, True)
		Sack.SetName("Sack - "+(RessConfig.BurlapSackVictim.GetReference() As Actor).GetLeveledActorBase().GetName())
		ActionQst.GoToState("Carrying")
	Elseif (akOldContainer && !akNewContainer)
		If !Player.HasKeyWordString("DefeatActive")
			Player.AddItem(Self, abSilent = True)
			Player.EquipItem((RessConfig.MiscFormLists[0].GetAt(0) As Form), True, True) ; MiscStuff/Sack
		Else
			RessConfig.MiscReferences[3].MoveTo(Player) ; BurlapSackWorldMarker
			RessConfig.MiscReferences[4] = Self ; BurlapSackWorldForm
			ActionQst.GoToState("Running")
		Endif
	Else
		akNewContainer.RemoveItem((RessConfig.MiscFormLists[0].GetAt(0) As Form), akOtherContainer = akOldContainer) ; MiscStuff/Sack
	Endif
EndEvent
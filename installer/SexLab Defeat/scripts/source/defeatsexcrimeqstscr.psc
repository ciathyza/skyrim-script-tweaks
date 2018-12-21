Scriptname DefeatSexCrimeQSTscr extends Quest 

DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto
DefeatPlayer Property PlayerScr Auto

Actor Property Player Auto
ReferenceAlias[] Property MiscAliasRefs Auto
{0 - Victim / 1 - Aggressor / 2 - TheWitness / 3 - Accomplice / 4 - Guard / 5 - Friend}

Event OnInit()
	Actor Victim = (MiscAliasRefs[0].GetReference() As Actor)
	Actor Aggressor = (MiscAliasRefs[1].GetReference() As Actor)
	Actor Witness = (MiscAliasRefs[2].GetReference() As Actor)
	If ((Witness == MiscAliasRefs[5].GetReference()) || (Witness == MiscAliasRefs[6].GetReference())) ; Friend & Follower
		RessConfig.AWitness = Witness
		DefeatConfig.Log("Witness type friend/follower found - "+Witness+" / Name - "+Witness.GetLeveledActorBase().GetName())
		If Victim.HasKeywordString("SexLabActive")
			RessConfig.UILib.ShowNotification("${"+Witness.GetLeveledActorBase().GetName()+"} witnesses what is happenning!", "#CD4C4C")
			Witness.Say(RessConfig.TopicToSay[19], Victim) ; Witness comment
			Witness.StartCombat(Aggressor)
;			Aggressor.StartCombat(Witness)
		Endif
	Elseif (Witness == MiscAliasRefs[4].GetReference()) ; Guard
		RessConfig.AWitness = Witness
		DefeatConfig.Log("Witness type guard found - "+Witness+" / Name - "+Witness.GetLeveledActorBase().GetName())
		If Victim.HasKeywordString("SexLabActive")
			RessConfig.UILib.ShowNotification("${"+Witness.GetLeveledActorBase().GetName()+"} witnesses what is happenning!", "#CD4C4C")
			Witness.Say(RessConfig.TopicToSay[19], Victim) ; Witness comment
			Witness.StartCombat(Aggressor)
		Endif
	Elseif (Witness == MiscAliasRefs[3].GetReference()) ; Accomplice
		If Victim.HasKeywordString("SexLabActive")
			DefeatConfig.Log("Witness type accomplice - "+Witness+" / Name - "+Witness.GetLeveledActorBase().GetName())
			Int Slot = PlayerScr.GetAggressors().Find(None)
			If (Slot != -1)
				If RessConfig.IsSexualAssaulter(Witness, Player, True)
					RessConfig.UILib.ShowNotification("${"+Witness.GetLeveledActorBase().GetName()+"} witnesses what is happenning and decide to join!", "#CD4C4C")
					PlayerScr.AddAggressor(Witness, Slot)
					Witness.Say(RessConfig.TopicToSay[20], Player) ; Can I join
				Endif
			Endif
		Endif
	Endif
	Stop()
EndEvent
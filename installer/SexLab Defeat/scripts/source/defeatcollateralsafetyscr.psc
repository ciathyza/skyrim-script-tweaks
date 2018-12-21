Scriptname DefeatCollateralSafetyScr extends activemagiceffect  

DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto
DefeatPlayer Property PlayerScr Auto

ReferenceAlias Property CollaComment Auto
Actor Victim
Actor Aggressor
Actor TheAdd
Int Slot

Event OnEffectStart(Actor Target, Actor Caster)
	Victim = Target
	Aggressor = Caster
	Slot = GetSlot()
	TheAdd = PlayerScr.CollaAggAdd[Slot].GetReference() As Actor
	RegisterForSingleUpdate(1.0)
EndEvent
Event OnUpdate()
 	If (Aggressor.GetDistance(Victim) < 250.0)
 		RessConfig.FollowerHasBeenRapedBy = RessConfig.HasBeenRapedBy(Victim, Aggressor)
 		CollaComment.ForceRefIfEmpty(Victim)
 		If ((CollaComment.GetReference() As Actor) == Victim)
 			Aggressor.Say(RessConfig.TopicToSay[21], Victim)
 		Endif
 		CollaComment.Clear()
 		Utility.Wait(2.0)
		If McmConfig.DialoguesFollower
			Victim.Say(RessConfig.TopicToSay[3], Aggressor)
		Endif
		PlayerScr.StripColla(Victim, Aggressor)
		PlayerScr.CollateralRape(Victim, Aggressor, TheAdd)
		Return
	Endif
	Float Time = GetTimeElapsed()
	if (Time < 20.0)
		If (Time == 15.0)
			Aggressor.Moveto(Victim)
		Endif
		RegisterForSingleUpdate(1.0)
	Endif
EndEvent
Event OnEffectFinish(Actor Target, Actor Caster)
 	If (Caster.GetDistance(Victim) > 300.0)
		Target.RemoveFromFaction(RessConfig.DefeatFactions[0]) ; Exclude this follower as potential collateral since they can't be reached.
		Caster.SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction, reset aggressor state.
		If TheAdd
			TheAdd.SetFactionRank(RessConfig.DefeatFactions[1], 0) ; AggFaction, reset aggressor state.
		Endif
		PlayerScr.CollaVic[Slot].Clear()
		PlayerScr.CollaAgg[Slot].Clear()
		PlayerScr.CollaAggAdd[Slot].Clear()
		DefeatConfig.Log("Collateral victim "+Target+" can't be reached by "+Caster+", they will now be ignored.")
	Endif
EndEvent
Int Function GetSlot()
 	Int i 
	While (i < 5)
		If ((PlayerScr.CollaVic[i].GetReference() As Actor) == Victim)
			Return i
		Endif
		i += 1
	EndWhile
EndFunction
Scriptname DefeatLastInSackScr extends ReferenceAlias  

DefeatConfig Property RessConfig Auto
DefeatMCMscr Property McmConfig Auto
DefeatActionScr Property ActionScr Auto

;Event OnUnload()

;EndEvent
Function RegisterForNextHandOver()
	actor Victim = (GetReference() as Actor)
	location origin = Victim.GetEditorLocation()
	Victim.Kill()
	if origin
		locationAlias EditorLocAlias = (RessConfig.MiscQuests[2].GetAlias(61) as locationAlias)
		EditorLocAlias.ForceLocationTo(origin)
		quest DefeatEditorLoc = Game.GetFormFromFile(0x314dac7, "SexLabDefeat.esp") as quest
		if DefeatEditorLoc.start()
			Victim.MoveTo((DefeatEditorLoc.GetAlias(1) as referenceAlias).GetReference())
			DefeatEditorLoc.Stop()
		else
			Victim.SetPosition(0.0, 0.0, 0.0)
		endif
		EditorLocAlias.Clear()
	else
		Victim.SetPosition(0.0, 0.0, 0.0)
	endif
	If (McmConfig.SOHandoverCD > 0.0)
		RegisterForSingleUpdateGameTime(McmConfig.SOHandoverCD)
	Else
		Clear()
	Endif
EndFunction
;Event OnCellDetach()
;EndEvent
Event OnUpdateGameTime()
;	actor Victim = (GetReference() as Actor)
;	Victim.SetCriticalStage(Victim.CritStage_DisintegrateEnd)
	Clear()
EndEvent



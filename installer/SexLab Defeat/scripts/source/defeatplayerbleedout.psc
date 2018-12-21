Scriptname DefeatPlayerBleedOut extends ReferenceAlias

DefeatPlayer Property PlayerScr Auto

Event OnEnterBleedOut()
	if (GetReference() as actor).GetCurrentLocation().GetName() != "Apocrypha"
		PlayerScr.TriggerBleedOut()
	endif
EndEvent
Scriptname DCVR_LVA_GarterParadoxGuard extends ObjectReference  


Keyword Property Garter  Auto
Message Property GarterParadox  Auto




Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If (akBaseItem as Armor).HasKeyword(Garter)
		RemoveItem(akBaseItem, aiItemCount, akSourceContainer)
		GarterParadox.Show()

	EndIf

EndEvent
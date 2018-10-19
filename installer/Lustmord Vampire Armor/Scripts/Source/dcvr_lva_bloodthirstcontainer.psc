Scriptname DCVR_LVA_BloodthirstContainer extends ObjectReference  


Actor Property PlayerRef  Auto

Quest Property Bloodthirst  Auto
Potion Property BloodPotion  Auto
Message Property BloodthirstWarning  Auto




Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If (akSourceContainer == PlayerRef)
		If (akBaseItem == BloodPotion)
			If (Bloodthirst.GetStage() == 0)
				Bloodthirst.SetStage(10)

			ElseIf (Bloodthirst.GetStage() == 10) && ((Bloodthirst as DCVR_LVA_BloodthirstControllerQuest).BloodthirstActive == 0)
				(Bloodthirst as DCVR_LVA_BloodthirstControllerQuest).RegisterForSingleUpdate(0.1)

			EndIf

		Else
			RemoveItem(akBaseItem, aiItemCount, akSourceContainer)
			BloodthirstWarning.Show()

		EndIf

	Else
		RemoveItem(akBaseItem, aiItemCount, akSourceContainer)

	EndIf

EndEvent
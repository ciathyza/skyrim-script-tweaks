Scriptname DCVR_LVA_CorpseAlias extends ReferenceAlias  


Book Property SpellTome  Auto  




Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	If (akBaseItem == SpellTome)
		GetOwningQuest().SetStage(100)

	EndIf

EndEvent
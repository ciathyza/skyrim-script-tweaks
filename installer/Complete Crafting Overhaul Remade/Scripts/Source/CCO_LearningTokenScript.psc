Scriptname CCO_LearningTokenScript extends ObjectReference  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		CurrentVal = SmithingKnowledgeGlobal.GetValue() as int
		NewValue = CurrentVal + LearningVal
		SmithingKnowledgeGlobal.SetValue(NewValue)
		Game.GetPlayer().RemoveItem(myBase, 999, true)
		LearningMessage.show()
	EndIf
EndEvent
 
Int NewValue
Int CurrentVal
Int Property LearningVal Auto
GlobalVariable Property SmithingKnowledgeGlobal Auto
Message Property LearningMessage Auto
MiscObject Property myBase Auto




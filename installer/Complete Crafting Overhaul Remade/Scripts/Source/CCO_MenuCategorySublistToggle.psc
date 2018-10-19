Scriptname CCO_MenuCategorySublistToggle extends ObjectReference  


MiscObject Property ThisItem Auto
int property GV01Val Auto
Formlist Property GVList Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		Int numGV = GVList.GetSize() 
		While numGV >= 0
			numGV -= 1	
			GlobalVariable CurrentGV = GVList.Getat(numGV) As GlobalVariable
			CurrentGV.SetValue(GV01Val)
		EndWhile	
		Game.GetPlayer().RemoveItem(ThisItem, 1, true)
	EndIf
EndEvent

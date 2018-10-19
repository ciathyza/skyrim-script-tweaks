Scriptname CCO_MenuCategoryToggleScript extends ObjectReference  

MiscObject Property ThisItem Auto
GlobalVariable Property GV01 Auto
int property GV01Val Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		GV01.SetValue(GV01Val)
		Game.GetPlayer().RemoveItem(ThisItem, 1, true)
	EndIf
EndEvent
 
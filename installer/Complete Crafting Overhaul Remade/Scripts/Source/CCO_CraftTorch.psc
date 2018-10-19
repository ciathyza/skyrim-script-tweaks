Scriptname CCO_CraftTorch extends ObjectReference  

int property NumberCreated = 1 auto
Light Property Torch Auto
MiscObject Property myBase Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		Game.GetPlayer().AddItem(Torch, NumberCreated, true)
		Game.GetPlayer().RemoveItem(myBase, 999, true)
	EndIf
EndEvent
 



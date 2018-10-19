Scriptname CCO_SubCraftingItem extends ObjectReference  

MiscObject Property CraftedObject Auto
MiscObject Property myBase Auto
Int Property ItemCount = 1 Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		Game.GetPlayer().AddItem(CraftedObject, ItemCount, true)
		Game.GetPlayer().RemoveItem(myBase, 999, true)
	EndIf
EndEvent
 


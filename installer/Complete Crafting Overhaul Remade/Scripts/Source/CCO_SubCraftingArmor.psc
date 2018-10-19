Scriptname CCO_SubCraftingArmor extends ObjectReference  

int property NumberCreated = 1 auto
Armor Property CraftedObject Auto
MiscObject Property myBase Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		Game.GetPlayer().AddItem(CraftedObject, NumberCreated, true)
		Game.GetPlayer().RemoveItem(myBase, 999, true)
	EndIf
EndEvent
 

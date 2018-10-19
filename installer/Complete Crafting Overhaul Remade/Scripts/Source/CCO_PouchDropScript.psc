Scriptname CCO_PouchDropScript extends ObjectReference  

Armor Property CraftVersion Auto
Armor Property ThisVersion Auto
Actor Property PlayerRef Auto
Form MyBaseObject

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akOldContainer && !akNewContainer
		;MyBaseObject = CraftVersion.GetBaseObject()
		PlayerRef.PlaceAtMe(CraftVersion)
		Self.Disable()
		Self.Delete()
;		PlayerRef.RemoveItem(ThisVersion, 1, true)
;		PlayerRef.AddItem(CraftVersion, 1, true)
	endIf
endEvent

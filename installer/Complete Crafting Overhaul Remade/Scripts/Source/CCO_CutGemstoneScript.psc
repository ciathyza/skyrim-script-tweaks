Scriptname CCO_CutGemstoneScript extends ObjectReference  

MiscObject Property RegularGem Auto
MiscObject Property FlawlessGem Auto
MiscObject Property myBase Auto
GlobalVariable Property FlawlessGemChance Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		int random = Utility.RandomInt(1, 100)
		if random <= FlawlessGemChance.GetValue() as int
			Game.GetPlayer().AddItem(FlawlessGem, 1)
		else
			Game.GetPlayer().AddItem(RegularGem, 1)		
		endif
		Game.GetPlayer().RemoveItem(myBase, 999, true)
	EndIf
EndEvent
 

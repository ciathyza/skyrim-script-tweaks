Scriptname CCO_PouchEquip2OptScript extends ObjectReference  

Armor Property CraftVersion Auto
Armor Property OptionBR Auto
Armor Property OptionBL Auto
Armor Property EquipVersion Auto
Actor Property PlayerRef Auto
Message Property EquipOptions Auto

Event OnEquipped(Actor akActor)
	if akActor == PlayerRef
		Int iButton = EquipOptions.Show()
		PlayerRef.RemoveItem(CraftVersion, 1, true)
		If iButton == 0  
			EquipVersion = OptionBR
		ElseIf iButton == 1
			EquipVersion = OptionBL
		EndIf
		PlayerRef.AddItem(EquipVersion, 1, true)
		PlayerRef.EquipItem(EquipVersion, false, true)
		If !PlayerRef.IsOnMount()
			PlayerRef.QueueNiNodeUpdate()
		endif
	endif
EndEvent
Scriptname CCO_PouchEquip4OptScript extends ObjectReference  

Armor Property CraftVersion Auto
Armor Property OptionFR Auto
Armor Property OptionFL Auto
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
			EquipVersion = OptionFR
		ElseIf iButton == 1
			EquipVersion = OptionFL
		ElseIf iButton == 2
			EquipVersion = OptionBR
		ElseIf iButton == 3
			EquipVersion = OptionBL
		EndIf
		PlayerRef.AddItem(EquipVersion, 1, true)
		PlayerRef.EquipItem(EquipVersion, false, true)
		If !PlayerRef.IsOnMount()
			PlayerRef.QueueNiNodeUpdate()
		endif
	endif
EndEvent
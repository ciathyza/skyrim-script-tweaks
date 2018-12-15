Scriptname _WetBPAutoAdjust extends ObjectReference  

;====================================================================================

Armor Property _WetKnapsack Auto
Armor Property _WetKnapsack_Black Auto
Armor Property _WetKnapsack_Brown Auto
Armor Property _WetKnapsack_Red Auto
Armor Property _WetKnapsack_White Auto
Armor Property _WetKnapsackH Auto
Armor Property _WetKnapsackH_Black Auto
Armor Property _WetKnapsackH_Brown Auto
Armor Property _WetKnapsackH_Red Auto
Armor Property _WetKnapsackH_White Auto
Armor Property _WetKnapsackL Auto
Armor Property _WetKnapsackL_Black Auto
Armor Property _WetKnapsackL_Brown Auto
Armor Property _WetKnapsackL_Red Auto
Armor Property _WetKnapsackL_White Auto
Armor Property _WetKnapsackT Auto
Armor Property _WetKnapsackT_Black Auto
Armor Property _WetKnapsackT_Brown Auto
Armor Property _WetKnapsackT_Red Auto
Armor Property _WetKnapsackT_White Auto
Armor Property _WetRaisedKnapsack Auto
Armor Property _WetRaisedKnapsack_Black Auto
Armor Property _WetRaisedKnapsack_Brown Auto
Armor Property _WetRaisedKnapsack_Red Auto
Armor Property _WetRaisedKnapsack_White Auto
Armor Property _WetRaisedKnapsackH Auto
Armor Property _WetRaisedKnapsackH_Black Auto
Armor Property _WetRaisedKnapsackH_Brown Auto
Armor Property _WetRaisedKnapsackH_Red Auto
Armor Property _WetRaisedKnapsackH_White Auto
Armor Property _WetRaisedKnapsackL Auto
Armor Property _WetRaisedKnapsackL_Black Auto
Armor Property _WetRaisedKnapsackL_Brown Auto
Armor Property _WetRaisedKnapsackL_Red Auto
Armor Property _WetRaisedKnapsackL_White Auto
Armor Property _WetRaisedKnapsackT Auto
Armor Property _WetRaisedKnapsackT_Black Auto
Armor Property _WetRaisedKnapsackT_Brown Auto
Armor Property _WetRaisedKnapsackT_Red Auto
Armor Property _WetRaisedKnapsackT_White Auto

_WetQuestScript Property _WetQuest Auto

Actor targ

;====================================================================================

Function EquipBag(Armor One, Armor Two)
	targ.RemoveItem(One, 1, true)
	targ.RemoveItem(Two, 1, true)
	targ.AddItem(Two, 1, true)
	If targ == _WetQuest.PlayerRef
		targ.EquipItem(Two, false, true)
	Else
		targ.AddToFaction(_WetQuest._WetBPAutoFaction)
	EndIf
EndFunction

;====================================================================================

Event OnEquipped(Actor akActor)
	targ = akActor
	If targ && !targ.IsInFaction(_WetQuest._WetBPAutoFaction) && _WetQuest._WetSKSEInstalled.GetValue() as Int == 1
		Armor EquippedCloak = targ.GetWornForm(0x00010000) as Armor
		Utility.Wait(0.1)
		Armor EquippedBag = targ.GetWornForm(0x00020000) as Armor
		If EquippedBag
			If EquippedCloak && EquippedCloak.HasKeyword(_WetQuest.ArmorMaterialHide)
				If EquippedBag == _WetKnapsack
					EquipBag(_WetKnapsack, _WetRaisedKnapsack)
				ElseIf EquippedBag == _WetKnapsack_Black
					EquipBag(_WetKnapsack_Black, _WetRaisedKnapsack_Black)
				ElseIf EquippedBag == _WetKnapsack_Brown
					EquipBag(_WetKnapsack_Brown, _WetRaisedKnapsack_Brown)
				ElseIf EquippedBag == _WetKnapsack_Red
					EquipBag(_WetKnapsack_Red, _WetRaisedKnapsack_Red)
				ElseIf EquippedBag == _WetKnapsack_White
					EquipBag(_WetKnapsack_White, _WetRaisedKnapsack_White)
				ElseIf EquippedBag == _WetKnapsackH
					EquipBag(_WetKnapsackH, _WetRaisedKnapsackH)
				ElseIf EquippedBag == _WetKnapsackH_Black
					EquipBag(_WetKnapsackH_Black, _WetRaisedKnapsackH_Black)
				ElseIf EquippedBag == _WetKnapsackH_Brown
					EquipBag(_WetKnapsackH_Brown, _WetRaisedKnapsackH_Brown)
				ElseIf EquippedBag == _WetKnapsackH_Red
					EquipBag(_WetKnapsackH_Red, _WetRaisedKnapsackH_Red)
				ElseIf EquippedBag == _WetKnapsackH_White
					EquipBag(_WetKnapsackH_White, _WetRaisedKnapsackH_White)
				ElseIf EquippedBag == _WetKnapsackL
					EquipBag(_WetKnapsackL, _WetRaisedKnapsackL)
				ElseIf EquippedBag == _WetKnapsackL_Black
					EquipBag(_WetKnapsackL_Black, _WetRaisedKnapsackL_Black)
				ElseIf EquippedBag == _WetKnapsackL_Brown
					EquipBag(_WetKnapsackL_Brown, _WetRaisedKnapsackL_Brown)
				ElseIf EquippedBag == _WetKnapsackL_Red
					EquipBag(_WetKnapsackL_Red, _WetRaisedKnapsackL_Red)
				ElseIf EquippedBag == _WetKnapsackL_White
					EquipBag(_WetKnapsackL_White, _WetRaisedKnapsackL_White)
				ElseIf EquippedBag == _WetKnapsackT
					EquipBag(_WetKnapsackT, _WetRaisedKnapsackT)
				ElseIf EquippedBag == _WetKnapsackT_Black
					EquipBag(_WetKnapsackT_Black, _WetRaisedKnapsackT_Black)
				ElseIf EquippedBag == _WetKnapsackT_Brown
					EquipBag(_WetKnapsackT_Brown, _WetRaisedKnapsackT_Brown)
				ElseIf EquippedBag == _WetKnapsackT_Red
					EquipBag(_WetKnapsackT_Red, _WetRaisedKnapsackT_Red)
				ElseIf EquippedBag == _WetKnapsackT_White
					EquipBag(_WetKnapsackT_White, _WetRaisedKnapsackT_White)
				EndIf
			Else
				If EquippedBag == _WetRaisedKnapsack
					EquipBag(_WetRaisedKnapsack, _WetKnapsack)
				ElseIf EquippedBag == _WetRaisedKnapsack_Black
					EquipBag(_WetRaisedKnapsack_Black, _WetKnapsack_Black)
				ElseIf EquippedBag == _WetRaisedKnapsack_Brown
					EquipBag(_WetRaisedKnapsack_Brown, _WetKnapsack_Brown)
				ElseIf EquippedBag == _WetRaisedKnapsack_Red
					EquipBag(_WetRaisedKnapsack_Red, _WetKnapsack_Red)
				ElseIf EquippedBag == _WetRaisedKnapsack_White
					EquipBag(_WetRaisedKnapsack_White, _WetKnapsack_White)
				ElseIf EquippedBag == _WetRaisedKnapsackH
					EquipBag(_WetRaisedKnapsackH, _WetKnapsackH)
				ElseIf EquippedBag == _WetRaisedKnapsackH_Black
					EquipBag(_WetRaisedKnapsackH_Black, _WetKnapsackH_Black)
				ElseIf EquippedBag == _WetRaisedKnapsackH_Brown
					EquipBag(_WetRaisedKnapsackH_Brown, _WetKnapsackH_Brown)
				ElseIf EquippedBag == _WetRaisedKnapsackH_Red
					EquipBag(_WetRaisedKnapsackH_Red, _WetKnapsackH_Red)
				ElseIf EquippedBag == _WetRaisedKnapsackH_White
					EquipBag(_WetRaisedKnapsackH_White, _WetKnapsackH_White)
				ElseIf EquippedBag == _WetRaisedKnapsackL
					EquipBag(_WetRaisedKnapsackL, _WetKnapsackL)
				ElseIf EquippedBag == _WetRaisedKnapsackL_Black
					EquipBag(_WetRaisedKnapsackL_Black, _WetKnapsackL_Black)
				ElseIf EquippedBag == _WetRaisedKnapsackL_Brown
					EquipBag(_WetRaisedKnapsackL_Brown, _WetKnapsackL_Brown)
				ElseIf EquippedBag == _WetRaisedKnapsackL_Red
					EquipBag(_WetRaisedKnapsackL_Red, _WetKnapsackL_Red)
				ElseIf EquippedBag == _WetRaisedKnapsackL_White
					EquipBag(_WetRaisedKnapsackL_White, _WetKnapsackL_White)
				ElseIf EquippedBag == _WetRaisedKnapsackT
					EquipBag(_WetRaisedKnapsackT, _WetKnapsackT)
				ElseIf EquippedBag == _WetRaisedKnapsackT_Black
					EquipBag(_WetRaisedKnapsackT_Black, _WetKnapsackT_Black)
				ElseIf EquippedBag == _WetRaisedKnapsackT_Brown
					EquipBag(_WetRaisedKnapsackT_Brown, _WetKnapsackT_Brown)
				ElseIf EquippedBag == _WetRaisedKnapsackT_Red
					EquipBag(_WetRaisedKnapsackT_Red, _WetKnapsackT_Red)
				ElseIf EquippedBag == _WetRaisedKnapsackT_White
					EquipBag(_WetRaisedKnapsackT_White, _WetKnapsackT_White)
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

Event OnUnequipped(Actor akActor)
	If targ
		targ.RemoveFromFaction(_WetQuest._WetBPAutoFaction)
	EndIf
EndEvent
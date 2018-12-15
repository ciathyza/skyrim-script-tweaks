Scriptname _wetequipsurvival extends activemagiceffect  

;====================================================================================

Form RandomWaterskin

Armor RandomBackpack

_WetQuestScript Property _WetQuest Auto

Bool Cleaned
Bool IsTraveler

Actor targ

;====================================================================================

Function Clean()
	If !Cleaned && targ
		Cleaned = True
		If RandomBackpack
			targ.RemoveItem(RandomBackpack)
		EndIf
		If RandomWaterskin
			targ.RemoveItem(RandomWaterskin)
		EndIf
		targ.RemoveFromFaction(_WetQuest._WetIsTravelerFaction)
		targ.RemoveSpell(_WetQuest._WetNPCEquipSurvivalSpell)
		GoToState("Dead")
	EndIf
EndFunction

;====================================================================================

Function ChooseBackpack(FormList BackpackList, Int ListSize)
	Int iRandomIndex
	If IsTraveler
		iRandomIndex = Utility.RandomInt(1, ListSize) - 1
	Else
		iRandomIndex = Utility.RandomInt(1, ListSize * 4) - 1
	EndIf
	RandomBackpack = BackpackList.GetAt(iRandomIndex) as Armor
	If RandomBackpack
		targ.AddItem(RandomBackpack)
		targ.EquipItem(RandomBackpack, true)
	EndIf
EndFunction

Function ChooseBackpackLeatherAdjust()
	Utility.Wait(1.0)
	Armor EquippedCloak = targ.GetWornForm(0x00010000) as Armor
	If EquippedCloak && EquippedCloak.HasKeyword(_WetQuest.ArmorMaterialHide)
		ChooseBackpack(_WetQuest._WetBPLeatherFarList, _WetQuest.SurvLeatherBPFarSize)
	Else
		ChooseBackpack(_WetQuest._WetBPLeatherList, _WetQuest.SurvLeatherBPSize)
	EndIf
EndFunction

Function ChooseWaterskin()
	If _WetQuest.WaterskinList
		Int iRandomIndex
		If IsTraveler
			iRandomIndex = Utility.RandomInt(1, _WetQuest.WaterskinListSize * 3) - 1
		Else
			iRandomIndex = Utility.RandomInt(1, _WetQuest.WaterskinListSize * 6) - 1
		EndIf
		RandomWaterskin = _WetQuest.WaterskinList.GetAt(iRandomIndex)
		If RandomWaterskin
			targ.AddItem(RandomWaterskin)
			If _WetQuest.WaterskinEquipSpell
				targ.AddSpell(_WetQuest.WaterskinEquipSpell)
			EndIf
		EndIf
	EndIf
EndFunction

;====================================================================================
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	If targ.WornHasKeyword(_WetQuest.ClothingBody)
		targ.AddToFaction(_WetQuest._WetIsTravelerFaction)
		IsTraveler = True
	EndIf
	Utility.Wait(0.5)
	GoToState("Alive")
EndEvent

;====================================================================================

State Alive

	Event OnBeginState()
		Actor PlayerRef = _WetQuest.PlayerRef
		If PlayerRef.GetDistance(targ) as Int < 2048
			RegisterForSingleLOSLost(PlayerRef, targ)
		Else
			OnLostLOS(PlayerRef, targ)
		EndIf
	EndEvent

	Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
		If targ
			If _WetQuest.SurvGearOn
				If _WetQuest._WetSKSEInstalled.GetValue() as Int == 1 && _WetQuest.SurvBPOn && !targ.GetWornForm(0x00020000)
					If _WetQuest.CampfireInstalled
						Int BagChance = Utility.RandomInt(1, 100)
						If _WetQuest.IsInCold
							If BagChance < 61
								ChooseBackpack(_WetQuest._WetBPFurList, _WetQuest.SurvFurBPSize)
							Else
								ChooseBackpackLeatherAdjust()
							EndIf
						Else
							If BagChance < 71
								ChooseBackpackLeatherAdjust()
							Else
								ChooseBackpack(_WetQuest._WetBPFurList, _WetQuest.SurvFurBPSize)
							EndIf
						EndIf
					Else
						ChooseBackpackLeatherAdjust()
					EndIf
				EndIf
				If _WetQuest.SurvModItemsOn
					ChooseWaterskin()
				EndIf
			EndIf
		EndIf
	EndEvent

	Event OnCellDetach()
		Clean()
	EndEvent

	Event OnUnload()
		Clean()
	EndEvent

	Event OnDetachedFromCell()
		Clean()
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		Clean()
	EndEvent

	Event OnDying(Actor akKiller)
		Cleaned = True
		targ.RemoveFromFaction(_WetQuest._WetIsTravelerFaction)
		GoToState("Dead")
	EndEvent

EndState

State Dead
EndState

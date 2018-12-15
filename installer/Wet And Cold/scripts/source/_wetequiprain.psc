Scriptname _wetequiprain extends activemagiceffect  

;====================================================================================

Armor RandomHood
Armor RandomCloak

_WetQuestScript Property _WetQuest Auto

Bool Cleaned
Bool FollowerHoodOn
Bool NoHood
Bool NoCloak
Bool IsTraveler
Bool IsClothed

Actor targ

;====================================================================================

Function Clean(Bool ResetAnimation = True)
	If !Cleaned && targ
		Cleaned = True
		Armor[] wornArmor = GetWornArmor(targ)
		If RandomHood
			targ.RemoveItem(RandomHood)
			targ.RemoveFromFaction(_WetQuest._WetRainHoodFaction)
		EndIf
		If RandomCloak && !targ.IsEquipped(_WetQuest._WetCloakClippingArmorList)
			targ.RemoveItem(RandomCloak)
			targ.RemoveFromFaction(_WetQuest._WetRainCloakFaction)
		EndIf
		ReequipArmor(targ, wornArmor)
		targ.RemoveSpell(_WetQuest._WetNPCEquipRainSpell)
		GoToState("Dead")
	EndIf
EndFunction

;====================================================================================		EFF compatibility, credits to bluedanieru

Armor[] Function GetWornArmor(Actor target)
	If _WetQuest.EFFInstalled && FollowerHoodOn
		Armor[] wornForms = new Armor[30]
		int index
		int slotsChecked
		slotsChecked += 0x00100000
		slotsChecked += 0x00200000 ;ignore reserved slots
		slotsChecked += 0x80000000
	 
		int thisSlot = 0x01
		while (thisSlot < 0x80000000)
			if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
				Armor thisArmor = target.GetWornForm(thisSlot) as Armor
				if (thisArmor)
					wornForms[index] = thisArmor
					index += 1
					slotsChecked += thisArmor.GetSlotMask() ;add all slots this item covers to our slotsChecked variable
				else ;no armor was found on this slot
					slotsChecked += thisSlot
				endif
			endif
			thisSlot *= 2 ;double the number to move on to the next slot
		endWhile
		return wornForms
	EndIf
EndFunction

Function ReequipArmor(Actor target, Armor[] wornArmor)
	If _WetQuest.EFFInstalled && FollowerHoodOn
		int index = 0
		while(index < 30 && wornArmor[index])
			if(target.GetItemCount(wornArmor[index]) > 0 && !target.isEquipped(wornArmor[index]))
				target.equipItem(wornArmor[index])
			endif
			index += 1
		endWhile
	EndIf
EndFunction

;====================================================================================

Function RainChecks()
	If _WetQuest.WetHoodsOn && !targ.GetWornForm(0x00000002)
		NoHood = True
	EndIf
	If _WetQuest.WetCloaksOn && !targ.GetWornForm(0x00010000)
		NoCloak = True
	EndIf
	If NoHood || NoCloak
		If _WetQuest.ExcludeArgs
			Race tRace = targ.GetRace()
			If tRace != _WetQuest.ArgonianRace && tRace != _WetQuest.ArgonianRaceVampire
				GoToState("Alive")
			EndIf
		Else
			GoToState("Alive")
		EndIf
	EndIf
EndFunction

;====================================================================================

Function ChooseHood()
	Int iRandomIndex
	Int ListSize
	FormList HoodList
	If FollowerHoodOn && targ.IsPlayerTeammate()
		HoodList = _WetQuest._WetHoodRainFollowerList
		ListSize = _WetQuest.RainHoodFollowerSize
	ElseIf IsClothed
		HoodList = _WetQuest._WetHoodRainList
		ListSize = _WetQuest.RainHoodSize
	Else
		HoodList = _WetQuest._WetHoodRainFollowerList
		ListSize = _WetQuest.RainHoodFollowerSize
	EndIf
	iRandomIndex = Utility.RandomInt(1, ListSize) - 1
	RandomHood = HoodList.GetAt(iRandomIndex) as Armor
	If RandomHood
		targ.AddItem(RandomHood)
		targ.EquipItem(RandomHood, true)
		targ.AddToFaction(_WetQuest._WetRainHoodFaction)
	EndIf
EndFunction

Function ChooseCloak()
	If RandomHood && RandomHood.HasKeyWord(_WetQuest._WetIsScarf)
		Return
	EndIf
	Int EquipChance
	If _WetQuest.CurrentTime > 6 && _WetQuest.CurrentTime < 20
		If IsTraveler
			EquipChance = 4
		Else
			EquipChance = 6
		EndIf
	Else
		If IsTraveler
			EquipChance = 2
		Else
			EquipChance = 3
		EndIf
	EndIf
	Int iRandomIndex = Utility.RandomInt(1, _WetQuest.RainCloakSize * EquipChance) - 1
	If iRandomIndex < _WetQuest.RainCloakSize
		RandomCloak = _WetQuest._WetCloakRainList.GetAt(iRandomIndex) as Armor
		If RandomCloak
			targ.AddItem(RandomCloak)
			targ.EquipItem(RandomCloak, true)
			targ.AddToFaction(_WetQuest._WetRainCloakFaction)
		EndIf
	EndIf
EndFunction

;====================================================================================
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	If !_WetQuest.WetFollowersOnly
		If !_WetQuest.FollowerHoodOn
			If !targ.IsPlayerTeammate()
				FollowerHoodOn = False
				RainChecks()
			EndIf
		Else
			FollowerHoodOn = True
			RainChecks()
		EndIf
	ElseIf targ.IsPlayerTeammate()
		FollowerHoodOn = True
		RainChecks()
	EndIf
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
			Armor[] wornArmor = GetWornArmor(targ)
			If targ.WornHasKeyword(_WetQuest.ClothingBody)
				IsClothed = True
			EndIf
			If targ.IsInFaction(_WetQuest._WetIsTravelerFaction)
				IsTraveler = True
			EndIf
			If NoHood
				ChooseHood()
			EndIf
			If NoCloak
				ChooseCloak()
			EndIf
			ReequipArmor(targ, wornArmor)
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
		If targ
			targ.RemoveFromFaction(_WetQuest._WetRainHoodFaction)
			targ.RemoveFromFaction(_WetQuest._WetRainCloakFaction)
		EndIf
		GoToState("Dead")
	EndEvent

EndState

State Dead
EndState
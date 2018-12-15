Scriptname _wetequipash extends activemagiceffect  

;====================================================================================

Armor RandomCover
Armor RandomGoggles

GlobalVariable Property _WetIsAshStorm Auto

_WetQuestScript Property _WetQuest Auto

Bool Property IsAshStorm Auto
Bool NoCover
Bool NoGoggles
Bool Cleaned

Actor targ

;====================================================================================

Function Clean()
	If !Cleaned && targ
		Cleaned = True
		Armor[] wornArmor = GetWornArmor(targ)
		If RandomCover
			targ.RemoveItem(RandomCover)
		EndIf
		If RandomGoggles
			targ.RemoveItem(RandomGoggles)
		EndIf
		ReequipArmor(targ, wornArmor)
		targ.RemoveSpell(_WetQuest._WetNPCEquipAshSpell)
		GoToState("Dead")
	EndIf
EndFunction

;====================================================================================		EFF compatibility, credits to bluedanieru

Armor[] Function GetWornArmor(Actor target)
	If _WetQuest.EFFInstalled && _WetQuest.FollowerAshOn
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
	If _WetQuest.EFFInstalled && _WetQuest.FollowerAshOn
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

Function AshChecks()
	If _WetQuest.FaceCoversOn && !targ.GetWornForm(0x00001000) && !targ.GetWornForm(0x00004000)
		NoCover = True
	EndIf
	If _WetQuest.GogglesOn && !targ.GetWornForm(0x04000000)
		NoGoggles = True
	EndIf
	If NoCover || NoGoggles
		GoToState("Alive")
	EndIf
EndFunction

;====================================================================================

Function ChooseFaceCover()
	Int iRandomIndex
	iRandomIndex = Utility.RandomInt(1, _WetQuest.AshFaceCoverSize) - 1
	RandomCover = _WetQuest._WetFaceCoverAshList.GetAt(iRandomIndex) as Armor
	If RandomCover
		targ.AddItem(RandomCover)
		targ.EquipItem(RandomCover, true)
	EndIf
EndFunction

Function ChooseGoggles()
	FormList GogglesList
	Int iIndex
	Int GoggleChance = Utility.RandomInt(1, 30)
	If GoggleChance < 8
		GogglesList = _WetQuest._WetGogglesChitinList
		iIndex = _WetQuest.AshGogglesChitinSize
	ElseIf GoggleChance < 11
		GogglesList = _WetQuest._WetGogglesDwemerList
		iIndex = _WetQuest.AshGogglesDwemerSize
	EndIf
	If GogglesList
		Int iRandomIndex = Utility.RandomInt(1, iIndex) - 1
		RandomGoggles = GogglesList.GetAt(iRandomIndex) as Armor
		If RandomGoggles
			targ.AddItem(RandomGoggles)
			targ.EquipItem(RandomGoggles, true)
		EndIf
	EndIf
EndFunction

;====================================================================================
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	If IsAshStorm
		GoToState("IsAshStorm")
	Else
		If !_WetQuest.AshFollowersOnly
			If !_WetQuest.FollowerAshOn
				If !targ.IsPlayerTeammate()
					AshChecks()
				EndIf
			Else
				AshChecks()
			EndIf
		ElseIf targ.IsPlayerTeammate()
			AshChecks()
		EndIf
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
			If NoCover
				ChooseFaceCover()
			EndIf
			If NoGoggles
				ChooseGoggles()
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
		GoToState("Dead")
	EndEvent

EndState

;====================================================================================

State IsAshStorm

	Event OnBeginState()
		_WetIsAshStorm.SetValue(1)
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		_WetIsAshStorm.SetValue(0)
	EndEvent

EndState

State Dead
EndState
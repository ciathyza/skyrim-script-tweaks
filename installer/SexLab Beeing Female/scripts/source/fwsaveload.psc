;/ Decompiled by Champollion V1.0.1
Source   : FWSaveLoad.psc
Modified : 2017-01-13 12:05:02
Compiled : 2017-01-18 08:35:18
User     : admin
Computer : PATRICK
/;
scriptName FWSaveLoad extends Quest

;-- Properties --------------------------------------
fwcontroller property Controller auto
fwtextcontents property Contents auto
Float property SkipUpdateAfter = 60.0000 auto
fwsystem property System auto
Float property SpermDeleteTime = 50.0000 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Delete(actor Woman) global

	storageutil.UnsetFloatValue(Woman as form, "FW.LastUpdate")
	storageutil.UnsetFloatValue(Woman as form, "FW.StateEnterTime")
	storageutil.UnsetIntValue(Woman as form, "FW.CurrentState")
	storageutil.UnsetIntValue(Woman as form, "FW.Abortus")
	storageutil.UnsetFloatValue(Woman as form, "FW.AbortusTime")
	storageutil.UnsetFloatValue(Woman as form, "FW.UnbornHealth")
	storageutil.UnsetIntValue(Woman as form, "FW.NumChilds")
	storageutil.FormListClear(Woman as form, "FW.ChildFather")
	storageutil.FloatListClear(Woman as form, "FW.SpermTime")
	storageutil.FormListClear(Woman as form, "FW.SpermName")
	storageutil.FloatListClear(Woman as form, "FW.SpermAmount")
	storageutil.UnsetIntValue(Woman as form, "FW.Flags")
	storageutil.UnsetFloatValue(Woman as form, "FW.PainLevel")
	storageutil.UnsetFloatValue(Woman as form, "FW.Contraception")
	storageutil.UnsetFloatValue(Woman as form, "FW.ContraceptionTime")
	storageutil.UnsetIntValue(Woman as form, "FW.NumBirth")
	storageutil.UnsetIntValue(Woman as form, "FW.NumBabys")
	storageutil.UnsetFloatValue(Woman as form, "FW.PauseTime")
	storageutil.FormListRemove(none, "FW.SavedNPCs", Woman as form, false)
endFunction

function ResetNpcData(Bool bPlayer) global

	Int i = storageutil.FormListCount(none, "FW.SavedNPCs")
	actor p = game.GetPlayer()
	while i > 0
		i -= 1
		actor Woman = storageutil.FormListGet(none, "FW.SavedNPCs", i) as actor
		if Woman != p || bPlayer == true
			storageutil.UnsetFloatValue(Woman as form, "FW.StateEnterTime")
			storageutil.UnsetIntValue(Woman as form, "FW.CurrentState")
			storageutil.UnsetIntValue(Woman as form, "FW.Abortus")
			storageutil.UnsetFloatValue(Woman as form, "FW.AbortusTime")
			storageutil.UnsetFloatValue(Woman as form, "FW.UnbornHealth")
			storageutil.UnsetIntValue(Woman as form, "FW.NumChilds")
			storageutil.FormListClear(Woman as form, "FW.ChildFather")
			storageutil.FloatListClear(Woman as form, "FW.SpermTime")
			storageutil.FormListClear(Woman as form, "FW.SpermName")
			storageutil.FloatListClear(Woman as form, "FW.SpermAmount")
			storageutil.UnsetIntValue(Woman as form, "FW.Flags")
			storageutil.UnsetFloatValue(Woman as form, "FW.PainLevel")
			storageutil.UnsetFloatValue(Woman as form, "FW.Contraception")
			storageutil.UnsetFloatValue(Woman as form, "FW.ContraceptionTime")
			storageutil.UnsetIntValue(Woman as form, "FW.NumBirth")
			storageutil.UnsetIntValue(Woman as form, "FW.NumBabys")
			storageutil.UnsetFloatValue(Woman as form, "FW.PauseTime")
		endIf
	endWhile
	storageutil.FormListClear(none, "FW.SavedNPCs")
	if bPlayer == false
		storageutil.FormListAdd(none, "FW.SavedNPCs", p as form, true)
	endIf
endFunction

function deleteChildren() global

	Int c = storageutil.FormListCount(none, "FW.Babys")
	while c > 0
		c -= 1
		fwchildactor baby1 = storageutil.FormListGet(none, "FW.Babys", c) as fwchildactor
		fwchilditem baby2 = storageutil.FormListGet(none, "FW.Babys", c) as fwchilditem
		actor baby3 = storageutil.FormListGet(none, "FW.Babys", c) as actor
		if baby1 != none
			baby1.Delete()
		elseIf baby2 != none
			baby2.Delete()
		elseIf baby3 != none
			baby3.Delete()
		endIf
	endWhile
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	System = game.GetFormFromFile(3427, "BeeingFemale.esm") as fwsystem
	Contents = game.GetFormFromFile(15921, "BeeingFemale.esm") as fwtextcontents
	Controller = game.GetFormFromFile(6186, "BeeingFemale.esm") as fwcontroller
endFunction

Bool function hasWillBecomePregnant(actor Woman)

	Int xstate = storageutil.GetIntValue(Woman as form, "FW.CurrentState", 0)
	Float GT = utility.GetCurrentGameTime()
	if xstate >= 4
		return true
	endIf
	Int c = storageutil.FloatListCount(Woman as form, "FW.SpermTime")
	while c > 0
		c -= 1
		if storageutil.FloatListGet(Woman as form, "FW.SpermTime", c) + SpermDeleteTime < GT
			storageutil.FloatListRemoveAt(Woman as form, "FW.SpermTime", c)
			storageutil.FormListRemoveAt(Woman as form, "FW.SpermName", c)
			storageutil.FloatListRemoveAt(Woman as form, "FW.SpermAmount", c)
		endIf
	endWhile
endFunction

function Update(actor Woman)

	Float startTime = utility.GetCurrentRealTime()
	if System.GetType() != 77
		return 
	endIf
	if System.ModEnabled.GetType() != 9
		return 
	endIf
	if System.ModEnabled.GetValueInt() != 1
		return 
	endIf
	if storageutil.FormListFind(none, "FW.SavedNPCs", Woman as form) < 0
		Controller.CreateFemaleActor(Woman, false)
	else
		Float lu = storageutil.GetFloatValue(Woman as form, "FW.LastUpdate", 0.000000)
		if utility.GetCurrentGameTime() - lu > SkipUpdateAfter
			Controller.CreateFemaleActor(Woman, true)
			return 
		endIf
		if lu + 0.0500000 > utility.GetCurrentGameTime()
			return 
		endIf
		self.UpdatePerDay(Woman)
	endIf
	System.Message("FWSaveLoad::Update(" + Woman.GetLeveledActorBase().GetName() + ") " + (utility.GetCurrentRealTime() - startTime) as String + " sec", System.MSG_Debug, System.MSG_Trace)
endFunction

function UpdatePerDay(actor Woman)

	Float stateEnterTime = storageutil.GetFloatValue(Woman as form, "FW.StateEnterTime", 0.000000)
	Int CurrentState = storageutil.GetIntValue(Woman as form, "FW.CurrentState", 0)
	Float UnbornHealth = storageutil.GetFloatValue(Woman as form, "FW.UnbornHealth", 100.000)
	Float contraceptionTime = storageutil.GetFloatValue(Woman as form, "FW.ContraceptionTime", 0.000000)
	Float contraception = storageutil.GetFloatValue(Woman as form, "FW.Contraception", 0.000000)
	Bool bIsPregnant = CurrentState >= 4
	Float GT = utility.GetCurrentGameTime()
	Float cur = storageutil.GetFloatValue(Woman as form, "FW.LastUpdate", 0.000000)
	Float contraceptionDur = System.GetPillDuration(Woman)
	Bool bIsPlayer = Woman == game.GetPlayer()
	Int flag = storageutil.GetIntValue(Woman as form, "FW.Flags", 0)
	Bool bMayPregnant = math.LogicalAnd(flag, 1) == 1
	Bool bMayPMS = math.LogicalAnd(flag, 2) == 2
	Bool bHasContraceptionItems = self._hasContraceptionItems(Woman)
	Int i = 0
	Float[] fDur = new Float[9]
	while i < 9
		fDur[i] = System.getStateDuration(i, Woman)
		i += 1
	endWhile
	while cur < GT
		while cur - stateEnterTime >= fDur[CurrentState]
			stateEnterTime += fDur[CurrentState]
			CurrentState += 1
			if bIsPregnant && CurrentState > 8 || bIsPregnant == false && CurrentState > 3
				bIsPregnant = false
				CurrentState = 0
				flag = Controller.setAutoFlag(Woman)
				bMayPregnant = math.LogicalAnd(flag, 1) == 1
				bMayPMS = math.LogicalAnd(flag, 2) == 2
			endIf
		endWhile
		if bIsPregnant && CurrentState > 7 && Woman.Is3DLoaded() == true
			System.InstantBornChilds(Woman)
		endIf
		if bIsPregnant == false
			Float CurrentStatePercent = (cur - stateEnterTime) / fDur[CurrentState] * 100.000
			if bMayPregnant && CurrentState == 1 && CurrentStatePercent > 50.0000 || CurrentState == 2 && CurrentStatePercent < 20.0000
				Float tmpcontraception = fwutility.RangedFloat(contraception - (cur - contraceptionTime - contraceptionDur) * 24.0000, 0.000000, System.MaxContraception)
				if System.Controller.ActiveSpermImpregnationNoContraceptionTimed(Woman, cur, tmpcontraception)
					bIsPregnant = true
					CurrentState = 4
					stateEnterTime = cur
					if Woman.IsInFaction(System.FollowerFaction)
						System.Message(fwutility.StringReplace(System.Content.NPCIsPregnant, "{0}", Woman.GetLeveledActorBase().GetName()), System.MSG_Immersive, 0)
					elseIf Woman != game.GetPlayer()
						System.Message(fwutility.StringReplace(System.Content.NPCIsPregnant, "{0}", Woman.GetLeveledActorBase().GetName()), System.MSG_High, 0)
					endIf
				endIf
			endIf
			if bIsPlayer == false && bIsPregnant == false && bHasContraceptionItems
				if contraceptionTime + System.GetPillDuration(Woman) * 0.850000 < cur
					Int pill_i = System.Pill_Items.GetSize()
					while pill_i > 0
						pill_i -= 1
						if Woman.GetItemCount(System.Pill_Items.GetAt(pill_i)) > 0 && System.Pill_Items.GetAt(pill_i) as potion != none
							potion pill = System.Pill_Items.GetAt(pill_i) as potion
							Int fx_count = pill.GetNumEffects()
							while fx_count > 0
								fx_count -= 1
								if pill.GetNthEffectMagicEffect(fx_count) == System.Pill_Effect
									Float mag = pill.GetNthEffectMagnitude(fx_count)
									debug.Trace(Woman.GetLeveledActorBase().GetName() + " added contraception: " + mag as String + "%", 0)
									contraception = fwutility.MinFloat(System.MaxContraception, mag + contraception)
									contraceptionTime = cur
									Woman.RemoveItem(pill as form, 1, true, none)
									fx_count = 0
									pill_i = 0
									bHasContraceptionItems = self._hasContraceptionItems(Woman)
								endIf
							endWhile
						endIf
					endWhile
				endIf
			endIf
		endIf
		cur += 1.00000
	endWhile
	Controller.ChangeStateTimed(Woman, stateEnterTime, CurrentState)
	storageutil.SetFloatValue(Woman as form, "FW.UnbornHealth", UnbornHealth)
	storageutil.SetFloatValue(Woman as form, "FW.ContraceptionTime", contraceptionTime)
	storageutil.SetFloatValue(Woman as form, "FW.Contraception", contraception)
	storageutil.SetFloatValue(Woman as form, "FW.LastUpdate", GT)
	Controller.UpdateParentFaction(Woman)
	Int c = storageutil.FloatListCount(Woman as form, "FW.SpermTime")
	while c > 0
		c -= 1
		if storageutil.FloatListGet(Woman as form, "FW.SpermTime", c) + SpermDeleteTime < GT
			storageutil.FloatListRemoveAt(Woman as form, "FW.SpermTime", c)
			storageutil.FormListRemoveAt(Woman as form, "FW.SpermName", c)
			storageutil.FloatListRemoveAt(Woman as form, "FW.SpermAmount", c)
		endIf
	endWhile
endFunction

function __Update_Old(actor Woman)

	if storageutil.FormListFind(none, "FW.SavedNPCs", Woman as form) < 0
		Controller.CreateFemaleActor(Woman, false)
	else
		if storageutil.GetFloatValue(Woman as form, "FW.LastUpdate", 0.000000) + 0.100000 > utility.GetCurrentGameTime()
			return 
		endIf
		storageutil.SetFloatValue(Woman as form, "FW.LastUpdate", utility.GetCurrentGameTime())
		Bool bUpdate = true
		Float LastStateEnterTime = storageutil.GetFloatValue(Woman as form, "FW.StateEnterTime", 0.000000)
		Int CurrentState = storageutil.GetIntValue(Woman as form, "FW.CurrentState", 0)
		Float UnbornHealth = storageutil.GetFloatValue(Woman as form, "FW.UnbornHealth", 100.000)
		Int NextState = CurrentState + 1
		Bool bIsPregnant = CurrentState > 3
		Bool bIsPlayer = Woman == game.GetPlayer()
		Float currentTime = utility.GetCurrentGameTime()
		Float StateTime = currentTime - LastStateEnterTime
		Bool hasRelevantSperm = true
		Float[] fMenstruationDuration = new Float[4]
		Float[] fPregnancyDuration = new Float[5]
		Float fMaxMenstruationDays = 0.000000
		Int i = 0
		while i < 4
			fMenstruationDuration[i] = System.getStateDuration(i, Woman)
			fPregnancyDuration[i] = System.getStateDuration(i + 4, Woman)
			fMaxMenstruationDays += fMenstruationDuration[i]
			i += 1
		endWhile
		fPregnancyDuration[4] = System.getStateDuration(8, Woman)
		Float impregnationTimeStart = fMenstruationDuration[0] + fMenstruationDuration[1] / 0.500000
		Float impregnationTimeEnd = fMenstruationDuration[0] + fMenstruationDuration[1] + fMenstruationDuration[2] / 0.500000
		Float CycleEnterTime = 0.000000
		Float stateEnterTime = 0.000000
		Int StateAdded = 0
		while bUpdate
			if CurrentState > 8
				CurrentState = 0
				bIsPregnant = false
			endIf
			if bIsPregnant
				if StateTime > fPregnancyDuration[CurrentState - 4]
					StateTime -= fPregnancyDuration[CurrentState - 4]
					CurrentState += 1
					StateAdded += 1
				else
					bUpdate = false
				endIf
			elseIf StateTime > fMenstruationDuration[CurrentState]
				StateTime -= fMenstruationDuration[CurrentState]
				CurrentState += 1
				StateAdded += 1
				if CurrentState >= 4
					CurrentState = 0
				endIf
			else
				bUpdate = false
			endIf
			stateEnterTime = currentTime - StateTime
			if bIsPlayer == false
				debug.Trace(Woman.GetLeveledActorBase().GetName() + " Ask for Pill", 0)
				if storageutil.GetFloatValue(Woman as form, "FW.ContraceptionTime", 0.000000) + System.GetPillDuration(Woman) - 0.300000 < stateEnterTime && bIsPregnant == false
					debug.Trace(Woman.GetLeveledActorBase().GetName() + " request pill", 0)
					Int pill_i = System.Pill_Items.GetSize()
					while pill_i > 0
						pill_i -= 1
						if Woman.GetItemCount(System.Pill_Items.GetAt(pill_i)) > 0 && System.Pill_Items.GetAt(pill_i) as potion != none
							debug.Trace(Woman.GetLeveledActorBase().GetName() + " got pill item: " + System.Pill_Items.GetAt(pill_i) as String, 0)
							potion pill = System.Pill_Items.GetAt(pill_i) as potion
							Int fx_count = pill.GetNumEffects()
							while fx_count > 0
								fx_count -= 1
								if pill.GetNthEffectMagicEffect(fx_count) == System.Pill_Effect
									Float val = storageutil.GetFloatValue(Woman as form, "FW.Contraception", 0.000000)
									Float mag = pill.GetNthEffectMagnitude(fx_count)
									val += mag
									debug.Trace(Woman.GetLeveledActorBase().GetName() + " added contraception: " + mag as String, 0)
									storageutil.SetFloatValue(Woman as form, "FW.Contraception", fwutility.MinFloat(100.000, val))
									storageutil.SetFloatValue(Woman as form, "FW.ContraceptionTime", stateEnterTime)
									Woman.RemoveItem(pill as form, 1, true, none)
									fx_count = 0
									pill_i = 0
								endIf
							endWhile
						endIf
					endWhile
				endIf
			endIf
			if CurrentState == 2
				if System.Controller.ActiveSpermImpregnationTimed(Woman, stateEnterTime, false) == true
					bIsPregnant = true
					CurrentState = 4
				endIf
			elseIf CurrentState == 7
				CurrentState = 8
				System.InstantBornChilds(Woman)
			endIf
			Int numChilds = storageutil.GetIntValue(Woman as form, "FW.NumChilds", 0)
			if CurrentState >= 4
				if numChilds > 0
					bIsPregnant = true
				else
					bIsPregnant = false
				endIf
			endIf
			Int c = storageutil.FloatListCount(Woman as form, "FW.SpermTime")
			while c > 0
				c -= 1
				if storageutil.FloatListGet(Woman as form, "FW.SpermTime", c) + SpermDeleteTime < stateEnterTime || storageutil.FloatListGet(Woman as form, "FW.SpermAmount", c) < 0.100000
					storageutil.FloatListRemoveAt(Woman as form, "FW.SpermTime", c)
					storageutil.FormListRemoveAt(Woman as form, "FW.SpermName", c)
					storageutil.FloatListRemoveAt(Woman as form, "FW.SpermAmount", c)
				endIf
			endWhile
		endWhile
		String[] Cont = new String[3]
		Cont[0] = Woman.GetLeveledActorBase().GetName()
		Cont[1] = StateAdded as String
		Cont[2] = fwutility.getTimeString(utility.GetCurrentGameTime() - storageutil.GetFloatValue(Woman as form, "FW.StateEnterTime", 0.000000), true, "")
		System.Message(fwutility.ArrayReplace(Contents.StatesAddedForNPC, Cont), System.MSG_All, 0)
		storageutil.SetFloatValue(Woman as form, "FW.StateEnterTime", stateEnterTime)
		storageutil.SetintValue(Woman as form, "FW.CurrentState", CurrentState)
		if bIsPregnant == false
			storageutil.SetintValue(Woman as form, "FW.NumChilds", 0)
			storageutil.SetFloatValue(Woman as form, "FW.UnbornHealth", 0.000000)
		endIf
	endIf
endFunction

Bool function _hasContraceptionItems(actor Woman)

	Int pill_i = System.Pill_Items.GetSize()
	while pill_i > 0
		pill_i -= 1
		if Woman.GetItemCount(System.Pill_Items.GetAt(pill_i)) > 0 && System.Pill_Items.GetAt(pill_i) as potion != none
			return true
		endIf
	endWhile
	return false
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

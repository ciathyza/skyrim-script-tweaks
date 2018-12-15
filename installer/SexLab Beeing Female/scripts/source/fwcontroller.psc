;/ Decompiled by Champollion V1.0.1
Source   : FWController.psc
Modified : 2017-01-18 07:35:32
Compiled : 2017-01-18 08:35:30
User     : admin
Computer : PATRICK
/;
scriptName FWController extends Quest

;-- Properties --------------------------------------
Float property Sperm_Min_Amount_For_Impregnation
	Float function get()

		return 0.000900000
	endFunction
endproperty
Float property Sperm_Amount_For_Delete
	Float function get()

		return 0.000800000
	endFunction
endproperty
fwsystem property System auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Bool function ActiveSpermImpregnationTimed(actor Mother, Float Time, Bool bIgnoreContraception)

	System.Trace("FWController.ActiveSpermImpregnationTimed", Mother)
	if Mother != game.GetPlayer() && System.cfg.NPCCanBecomePregnant == false
		return false
	endIf
	Bool bCanBecomePregnant = self.canBecomePregnant(Mother)
	if bCanBecomePregnant == false
		return false
	endIf
	if bIgnoreContraception == false
		self.ContraceptionSpermKillTimed(Mother, Time)
	endIf
	if System.Controller.HasRelevantSpermTimed(Mother, Time, false)
		if System.Manager.ActorCanBecomePregnant(Mother) == true
			Int numChild = System.calculateNumChildren(Mother)
			if numChild == 0
				return false
			endIf
			actor[] a = System.Controller.GetRelevantSpermActorsTimed(Mother, Time, false, false)
			Float[] relevantSperm = self.GetRelevantSpermFloatTimed(Mother, Time, false, false)
			if relevantSperm.length == 0
				return false
			endIf
			Int c = relevantSperm.length
			if c == 0
				return false
			endIf
			Int i = 0
			Float relevanceTotal = 0.000000
			while i < c
				relevanceTotal += relevantSperm[i]
				i += 1
			endWhile
			storageutil.SetIntValue(Mother as form, "FW.NumChilds", numChild)
			actor[] Fathers = fwutility.ActorArray(numChild)
			while numChild > 0
				numChild -= 1
				Float rnd_r = utility.RandomFloat(0.000000, relevanceTotal)
				Int j = 0
				while rnd_r >= relevantSperm[j] && j < c
					rnd_r -= relevantSperm[j]
					j += 1
				endWhile
				storageutil.FormListAdd(Mother as form, "FW.ChildFather", a[j] as form, true)
				Fathers[numChild] = a[j]
			endWhile
			storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", 100.000)
			storageutil.UnsetIntValue(Mother as form, "FW.Abortus")
			System.Manager.OnImpregnate(Mother, Fathers.length, Fathers)
			self.ChangeStateTimed(Mother, Time, 4)
			return true
		endIf
	endIf
	return false
endFunction

Bool function ActiveSpermImpregnation(actor Mother, Bool bIgnoreContraception)

	System.Trace("FWController.ActiveSpermImpregnation", Mother)
	return self.ActiveSpermImpregnationTimed(Mother, utility.GetCurrentGameTime(), bIgnoreContraception)
endFunction

Bool function canBecomePMS(actor woman)

	System.Trace("FWController.canBecomePMS", woman)
	Int flag = storageutil.GetIntValue(woman as form, "FW.Flags", 0)
	return math.LogicalAnd(flag, 2) == 2
endFunction

function UnimpregnateState(actor Mother, Int Menstrual_Cycle_State)

	System.Trace("FW Debug: FWController.UnimpregnateState", Mother)
	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		self.CreateFemaleActor(Mother, false)
	endIf
	storageutil.FormListClear(Mother as form, "FW.ChildFather")
	storageutil.SetIntValue(Mother as form, "FW.NumChilds", 0)
	storageutil.UnsetIntValue(Mother as form, "FW.Abortus")
	storageutil.UnsetFloatValue(Mother as form, "FW.UnbornHealth")
	storageutil.UnsetFloatValue(Mother as form, "FW.AbortusTime")
	Int xMenstrual_Cycle_State = Menstrual_Cycle_State
	if xMenstrual_Cycle_State < 0 || xMenstrual_Cycle_State > 3
		xMenstrual_Cycle_State = 0
	endIf
	if Mother == game.GetPlayer()
		System.Player.NumChilds = 0
		System.Player.ChangeState(xMenstrual_Cycle_State)
		System.Player.SetBelly(false)
	else
		storageutil.SetFloatValue(Mother as form, "FW.StateEnterTime", utility.GetCurrentGameTime())
		storageutil.SetIntValue(Mother as form, "FW.CurrentState", xMenstrual_Cycle_State)
		Int flag = 0
		if System.canBecomePregnant(Mother)
			flag += 1
		endIf
		if System.canBecomePMS(Mother)
			flag += 2
		endIf
		storageutil.SetIntValue(Mother as form, "FW.Flags", flag)
		System.raiseModEventA("Update", Mother)
	endIf
endFunction

function ContraceptionSpermKill(actor woman)

	System.Trace("FWController.ContraceptionSpermKill", woman)
	self.ContraceptionSpermKillTimed(woman, utility.GetCurrentGameTime())
endFunction

Float function GetLastSexTime(actor a)

	Float L1 = storageutil.FloatListGet(a as form, "SexLabSkills", 17)
	Float L2 = storageutil.GetFloatValue(a as form, "FW.LastSexTime", 0.000000)
	if L1 > L2
		return L1
	else
		return L2
	endIf
endFunction

Float[] function GetRelevantSpermFloatTimed(actor woman, Float Time, Bool bShowTravelingSperm, Bool bSort)

	Float[] actorr
	System.Trace("FWController.GetRelevantSpermFloatTimed", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Int c = storageutil.FormListCount(woman as form, "FW.SpermName")
	if c == 0
		return actorr
	endIf
	while c > 0
		c -= 1
		Float STime = storageutil.FloatListGet(woman as form, "FW.SpermTime", c)
		actor SName = storageutil.FormListGet(woman as form, "FW.SpermName", c) as actor
		Float SAmou = storageutil.FloatListGet(woman as form, "FW.SpermAmount", c)
		Float maxSDuration = System.getMaleSpermDuration(SName)
		if STime + maxSDuration > Time && (STime + System.cfg.WashOutHourDelay < Time || bShowTravelingSperm == true) && SAmou >= self.Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
			Float SpermDurationPercent = (Time - STime) / maxSDuration
			Float xScale = 1.00000
			if SpermDurationPercent > 0.650000
				xScale -= SpermDurationPercent - 0.650000
			endIf
			actorr = fwutility.FloatArrayAppend(actorr, System.GetSpermRelevance(woman, SName) * SAmou * xScale)
		endIf
	endWhile
	if bSort == false
		Int bi = 1
		Int bc = actorr.length
		Bool bl = true
		while bi <= bc && bl
			bl = false
			Int bj = 0
			while bj < bc - 1
				if actorr[bj + 1] > actorr[bj]
					Float bf = actorr[bj]
					actorr[bj] = actorr[bj + 1]
					actorr[bj + 1] = bf
					bl = true
				endIf
				bj += 1
			endWhile
			bi += 1
		endWhile
	endIf
	return actorr
endFunction

Float function GetContraceptionDuration(actor woman)

	System.Trace("FWController.GetContraceptionDuration", woman)
	return self.GetContraceptionDurationTimed(woman, utility.GetCurrentGameTime())
endFunction

function showInfoBox(actor a)

	self.showRankedInfoBox(a, 100)
endFunction

function AddSperm(actor woman, actor PotentialFather, Float amount)

	System.Trace("FWController.AddSperm", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	storageutil.SetFloatValue(woman as form, "FW.LastSexTime", utility.GetCurrentGameTime())
	storageutil.SetFloatValue(PotentialFather as form, "FW.LastSexTime", utility.GetCurrentGameTime())
	Float tmp_amount = amount * System.Manager.ActorSpermAmountScale(PotentialFather)
	if !System.CheckIsLoreFriendlyMetting(woman, PotentialFather)
		tmp_amount = self.Sperm_Amount_For_Delete
	endIf
	storageutil.FloatListAdd(woman as form, "FW.SpermTime", utility.GetCurrentGameTime(), true)
	storageutil.FormListAdd(woman as form, "FW.SpermName", PotentialFather as form, true)
	storageutil.FloatListAdd(woman as form, "FW.SpermAmount", tmp_amount, true)
	if PotentialFather == game.GetPlayer()
		System.StateWidget.showTimed(PotentialFather as Bool)
	endIf
endFunction

Bool function canBecomePregnant(actor woman)

	Int flag = storageutil.GetIntValue(woman as form, "FW.Flags", 0)
	return math.LogicalAnd(flag, 1) == 1
endFunction

Bool function HasSpermInWoman(actor male, actor female, Bool bShowTravelingSperm)

	System.Trace("FWController.HasSpermInWoman", male)
	return self.HasSpermInWomanTimed(male, female, utility.GetCurrentGameTime(), bShowTravelingSperm)
endFunction

Bool function HasRelevantSpermTimed(actor woman, Float Time, Bool bShowTravelingSperm)

	System.Trace("FWController.HasRelevantSpermTimed", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Int c = storageutil.FormListCount(woman as form, "FW.SpermName")
	while c > 0
		c -= 1
		Float STime = storageutil.FloatListGet(woman as form, "FW.SpermTime", c)
		actor SName = storageutil.FormListGet(woman as form, "FW.SpermName", c) as actor
		Float SAmou = storageutil.FloatListGet(woman as form, "FW.SpermAmount", c)
		if STime + System.getMaleSpermDuration(SName) > Time && (STime + System.cfg.WashOutHourDelay < Time || bShowTravelingSperm) && SAmou >= self.Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
			return true
		endIf
	endWhile
	return false
endFunction

Bool function HasRelevantSperm(actor woman, Bool bShowTravelingSperm)

	System.Trace("FWController.HasRelevantSperm", woman)
	return self.HasRelevantSpermTimed(woman, utility.GetCurrentGameTime(), bShowTravelingSperm)
endFunction

function Pause(actor woman, Bool bPaused)

	System.Trace("FWController.Pause", woman)
	if bPaused == true
		storageutil.SetFloatValue(woman as form, "FW.PauseTime", utility.GetCurrentGameTime())
		if woman == game.GetPlayer()
			System.Player.PauseStartTime = utility.GetCurrentGameTime()
		endIf
	else
		Float start = storageutil.GetFloatValue(woman as form, "FW.StateEnterTime", 0.000000)
		Float Pause = storageutil.GetFloatValue(woman as form, "FW.PauseTime", 0.000000)
		storageutil.UnsetFloatValue(woman as form, "FW.PauseTime")
		Float cur = start + utility.GetCurrentGameTime() - Pause
		storageutil.SetFloatValue(woman as form, "FW.StateEnterTime", cur)
		if game.GetPlayer() == woman
			System.Player.stateEnterTime = cur
			System.Player.PauseStartTime = 0.000000
		else
			self.SendModEvent("BeeingFemale", "Update", woman.GetFormID() as Float)
		endIf
	endIf
endFunction

Float function getContraception(actor woman)

	return self.getContraceptionTimed(woman, utility.GetCurrentGameTime())
endFunction

function AbortusBaby(actor Mother)

	System.Trace("FWController.AbortusBaby", Mother)
	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		return 
	endIf
	Int S = storageutil.GetIntValue(Mother as form, "FW.CurrentState", 0)
	if S < 4 && S == 8
		return 
	endIf
	if storageutil.GetIntValue(Mother as form, "FW.NumChilds", 0) > 0
		storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", 0.000000)
		storageutil.SetIntValue(Mother as form, "FW.Abortus", 2)
		storageutil.SetFloatValue(Mother as form, "FW.AbortusTime", utility.GetCurrentGameTime())
		if game.GetPlayer() == Mother
			System.Player.checkAbortus()
		else
			self.SendModEvent("BeeingFemale", "checkAbortus", Mother.GetFormID() as Float)
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function HealBaby(actor Mother, Float Healing)

	System.Trace("FWController.HealBaby", Mother)
	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		return 
	endIf
	if storageutil.GetIntValue(Mother as form, "FW.Abortus", 0) > 1
		return 
	endIf
	Int S = storageutil.GetIntValue(Mother as form, "FW.CurrentState", 0)
	if S < 4 && S == 8
		return 
	endIf
	Float hp = storageutil.GetFloatValue(Mother as form, "FW.UnbornHealth", 100.000)
	if Healing > 0.000000
		Healing *= System.Manager.ActorBabyHealingScale(Mother)
	else
		Healing *= System.Manager.ActorBabyDamageScale(Mother)
	endIf
	if hp + Healing < 0.000000
		hp = 0.000000
	elseIf hp + Healing > 100.000
		hp = 100.000
	else
		hp += Healing
	endIf
	storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", hp)
	if game.GetPlayer() == Mother
		System.Player.checkAbortus()
	else
		self.SendModEvent("BeeingFemale", "checkAbortus", Mother.GetFormID() as Float)
	endIf
endFunction

actor[] function getWomansWithSperm(actor male, Bool bShowTravelingSperm)

	System.Trace("FWController.getWomansWithSperm", male)
	return self.getWomansWithSpermTimed(male, utility.GetCurrentGameTime(), bShowTravelingSperm)
endFunction

Int function RelevantSpermCountTimed(actor woman, Float Time, Bool bShowTravelingSperm)

	System.Trace("FWController.RelevantSpermCountTimed", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Int c = storageutil.FormListCount(woman as form, "FW.SpermName")
	Int j = 0
	while c > 0
		c -= 1
		Float STime = storageutil.FloatListGet(woman as form, "FW.SpermTime", c)
		actor SName = storageutil.FormListGet(woman as form, "FW.SpermName", c) as actor
		Float SAmou = storageutil.FloatListGet(woman as form, "FW.SpermAmount", c)
		if STime + System.getMaleSpermDuration(SName) > Time && (STime + System.cfg.WashOutHourDelay < Time || bShowTravelingSperm) && SAmou >= self.Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
			j += 1
		endIf
	endWhile
	return j
endFunction

Int function GetStoredFemaleCount()

	return storageutil.FormListCount(none, "FW.SavedNPCs")
endFunction

function ChangeState(actor female, Int state_number)

	System.Trace("FWController.ChangeState", female)
	if storageutil.FormListFind(none, "FW.SavedNPCs", female as form) < 0
		self.CreateFemaleActor(female, false)
	endIf
	if female != game.GetPlayer() && System.cfg.NPCCanBecomePregnant == false && state_number >= 4 && state_number < 10
		return 
	endIf
	Int abortus = storageutil.GetIntValue(female as form, "FW.Abortus", 0)
	if abortus > 1 && (state_number == 4 || state_number == 5 || state_number == 6) || abortus > 2 && state_number == 7
		return 
	endIf
	storageutil.SetIntValue(female as form, "FW.CurrentState", state_number)
	storageutil.SetFloatValue(female as form, "FW.StateEnterTime", utility.GetCurrentGameTime())
	self.setIrregulation(female, state_number)
	if game.GetPlayer() == female
		System.StateWidget.showTimed(true)
		System.Player.currentState = state_number
		System.Player.stateEnterTime = utility.GetCurrentGameTime()
	else
		self.SendModEvent("BeeingFemale", "Update", female.GetFormID() as Float)
	endIf
endFunction

function AbortusBabyTimed(actor Mother, Float Time)

	System.Trace("FWController.AbortusBabyTimed", Mother)
	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		return 
	endIf
	Int S = storageutil.GetIntValue(Mother as form, "FW.CurrentState", 0)
	if S < 4 && S == 8
		return 
	endIf
	if storageutil.GetIntValue(Mother as form, "FW.NumChilds", 0) > 0
		storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", 0.000000)
		storageutil.SetIntValue(Mother as form, "FW.Abortus", 2)
		storageutil.SetFloatValue(Mother as form, "FW.AbortusTime", Time)
		if game.GetPlayer() == Mother
			System.Player.checkAbortus()
		else
			self.SendModEvent("BeeingFemale", "checkAbortus", Mother.GetFormID() as Float)
		endIf
	endIf
endFunction

Float function getRelativePregnancyChanceTimed(actor woman, Float Time, actor man)

	Int WomanState = self.GetFemaleState(woman)
	Float stateEnterTime = self.GetStateEnterTime(woman)
	if WomanState >= 4
		return 0.0100000
	else
		Float Dur0 = System.GetStateDuration(0, woman)
		Float Dur1 = System.GetStateDuration(1, woman)
		Float Dur2 = System.GetStateDuration(2, woman)
		Float Dur3 = System.GetStateDuration(3, woman)
		Float DurT = Dur0 + Dur1 + Dur2 + Dur3
		Float EggTravel = System.getEggTravelingDuration(woman)
		Float SpermLifeTime = System.getMaleSpermDuration(man)
		Float SpermTravel = System.cfg.WashOutHourDelay
		Float curTime = 0.000000
		Bool bCanBecomePregnant = self.canBecomePregnant(woman)
		Float CurChance = 0.000000
		Float stateTime = Time - stateEnterTime + SpermTravel
		Float canBecomePregnantBonus = 0.000000
		if bCanBecomePregnant
			canBecomePregnantBonus = 1.00000
		else
			canBecomePregnantBonus = 0.0500000
		endIf
		Float newChance = 0.000000
		while curTime < SpermLifeTime
			newChance = 0.000000
			if WomanState == 0
				stateTime += 1.00000
				curTime += 1.00000
				if stateTime > Dur0
					stateTime -= Dur0
					WomanState = 1
				endIf
			elseIf WomanState == 1
				if stateTime > EggTravel * 1.20000
					newChance = 98.0000
				elseIf stateTime > EggTravel * 0.800000
					Float EggMax = EggTravel * 1.20000
					Float EggMin = EggTravel * 0.800000
					Float EggDif = EggMax - EggMin
					Float EggStart = stateTime - EggMin
					newChance = EggStart * 100.000 / EggDif
				endIf
				stateTime += 0.500000
				curTime += 0.500000
				if stateTime > Dur1
					stateTime -= Dur1
					WomanState = 2
				endIf
			elseIf WomanState == 2
				Float statePercent = 100.000 * stateTime / Dur2
				if statePercent < 65.0000
					newChance = System.LutealImpregnationTime(statePercent)
				endIf
				stateTime += 0.250000
				curTime += 0.250000
				if stateTime > Dur2
					stateTime -= Dur2
					WomanState = 3
				endIf
			elseIf WomanState == 3
				stateTime += 1.00000
				curTime += 1.00000
				if stateTime > Dur3
					stateTime -= Dur3
					WomanState = 0
					canBecomePregnantBonus = System.cfg.ConceiveChance / 105.000
				endIf
			endIf
			Float contraception = self.getContraceptionTimed(woman, Time + curTime)
			newChance *= canBecomePregnantBonus
			newChance *= (100.000 - contraception) / 100.000
			if newChance > CurChance
				CurChance = newChance
			endIf
		endWhile
		return fwutility.RangedFloat(CurChance, 0.500000, 97.0000) + utility.RandomFloat(0.000000, 2.50000)
	endIf
endFunction

actor[] function getFemalesImpregnatedFrom(actor male, Int max)

	if max > 128
		max = 128
	endIf
	actor[] res = fwutility.ActorArray(max)
	Int curRes = 0
	Int c = storageutil.FormListCount(none, "FW.SavedNPCs")
	while c > 0
		c -= 1
		actor female = storageutil.FormListGet(none, "FW.SavedNPCs", c) as actor
		if storageutil.FormListFind(female as form, "FW.SpermName", male as form) >= 0 || storageutil.FormListFind(female as form, "FW.ChildFather", male as form) >= 0
			System.Data.Update(female)
			Int female_state = storageutil.GetIntValue(female as form, "FW.CurrentState", 0)
			if female_state > 3 && female_state < 8
				if storageutil.FormListFind(female as form, "FW.ChildFather", male as form)
					res[curRes] = female
					curRes += 1
					if curRes >= max
						c = 0
					endIf
				endIf
			endIf
		endIf
	endWhile
	return fwutility.ActorArrayResize(res, curRes)
endFunction

Bool function setNumBabys(actor Mother, Int num)

	debug.Trace("FWController::setNumBabys(" + Mother.GetLeveledActorBase().GetName() + ", " + num as String + ")", 0)
	Int cur = storageutil.GetIntValue(Mother as form, "FW.NumChilds", 0)
	if cur == 0
		debug.Trace("- Actor not pregnant", 0)
		return false
	elseIf cur == num
		debug.Trace("- No changes", 0)
		return true
	elseIf cur < num
		debug.Trace("- Raise from " + cur as String + " to " + num as String + " Babys", 0)
		storageutil.SetIntValue(Mother as form, "FW.NumChilds", num)
		actor Father = storageutil.FormListGet(Mother as form, "FW.ChildFather", 0) as actor
		Int i = cur
		while i < cur
			debug.Trace("- Father for Baby " + i as String + " is " + Father.GetLeveledActorBase().GetName(), 0)
			storageutil.FormListAdd(Mother as form, "FW.ChildFather", Father as form, true)
			i += 1
		endWhile
		return true
	elseIf cur > num
		debug.Trace("- Drop from " + cur as String + " to " + num as String + " Babys", 0)
		storageutil.SetIntValue(Mother as form, "FW.NumChilds", num)
		Int i = storageutil.FormListCount(Mother as form, "FW.ChildFather")
		while i > num
			i -= 1
			debug.Trace("- Remove Father " + i as String + ": " + (storageutil.FormListGet(Mother as form, "FW.ChildFather", i) as actor).GetLeveledActorBase().GetName(), 0)
			storageutil.FormListRemoveAt(Mother as form, "FW.ChildFather", i)
		endWhile
		return true
	endIf
endFunction

Int function setFlag(actor woman, Bool bCanBecomePregnant, Bool bCanBecomePMS)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Int flag = 0
	if bCanBecomePregnant == true
		flag += 1
	endIf
	if bCanBecomePMS == true
		flag += 2
	endIf
	storageutil.SetIntValue(woman as form, "FW.Flags", flag)
	return flag
endFunction

Float function GetBabyHealth(actor woman)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	return storageutil.GetFloatValue(woman as form, "FW.UnbornHealth", 100.000)
endFunction

function AbortusState(actor Mother, Int Abortus_State)

	System.Trace("FWController.AbortusState", Mother)
	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		return 
	endIf
	Int S = storageutil.GetIntValue(Mother as form, "FW.CurrentState", 0)
	if S < 4 && S == 8
		return 
	endIf
	if storageutil.GetIntValue(Mother as form, "FW.NumChilds", 0) > 0
		storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", 0.000000)
		storageutil.SetIntValue(Mother as form, "FW.Abortus", Abortus_State)
		storageutil.SetFloatValue(Mother as form, "FW.AbortusTime", utility.GetCurrentGameTime())
		if game.GetPlayer() == Mother
			System.Player.checkAbortus()
		else
			self.SendModEvent("BeeingFemale", "checkAbortus", Mother.GetFormID() as Float)
		endIf
	endIf
endFunction

function WashOutSperm(actor woman, Int WashOutType, Float Strength)

	System.Trace("FWController.WashOutSperm", woman)
	Float chance = 0.000000
	if Strength <= 0.000000
		return 
	endIf
	if WashOutType == 0
		chance = System.cfg.WashOutChance
	elseIf WashOutType == 1
		chance = System.cfg.WashOutWaterChance
	elseIf WashOutType == 2
		chance = System.cfg.WashOutFluidChance
	endIf
	if chance > 0.000000
		Int c = storageutil.FormListCount(woman as form, "FW.SpermName")
		Int j = 0
		Float Time = utility.GetCurrentGameTime()
		while c > 0
			c -= 1
			Float rnd = utility.RandomFloat(1.00000e-005, 1.00000)
			Float STime = storageutil.FloatListGet(woman as form, "FW.SpermTime", c)
			if STime + System.Data.SpermDeleteTime > Time || STime + System.cfg.WashOutHourDelay >= Time
				if chance * Strength >= rnd
					storageutil.FloatListRemoveAt(woman as form, "FW.SpermTime", c)
					storageutil.FormListRemoveAt(woman as form, "FW.SpermName", c)
					storageutil.FloatListRemoveAt(woman as form, "FW.SpermAmount", c)
				elseIf utility.RandomInt(0, 100) > 34
					Float amount = storageutil.FloatListGet(woman as form, "FW.SpermAmount", c)
					amount -= utility.RandomFloat(0.000000, 0.150000 * Strength)
					if amount < self.Sperm_Min_Amount_For_Impregnation
						storageutil.FloatListRemoveAt(woman as form, "FW.SpermTime", c)
						storageutil.FormListRemoveAt(woman as form, "FW.SpermName", c)
						storageutil.FloatListRemoveAt(woman as form, "FW.SpermAmount", c)
					else
						storageutil.FloatListSet(woman as form, "FW.SpermAmount", c, amount)
					endIf
				endIf
			endIf
		endWhile
	endIf
endFunction

function Unimpregnate(actor Mother)

	System.Trace("FW Debug: FWController.Unimpregnate", Mother)
	self.UnimpregnateState(Mother, 0)
endFunction

Float function AddContraceptionTimed(actor woman, Float Time, Float value)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Float cDur = System.GetPillDuration(woman)
	Float cTime = storageutil.GetFloatValue(woman as form, "FW.ContraceptionTime", 0.000000)
	Float contraception = self.getContraceptionTimed(woman, Time)
	Float addValue = 0.000000
	if cTime == 0.000000
		addValue = value
	elseIf Time - cTime <= 0.000000
		return contraception
	elseIf cTime + cDur * 0.750000 < Time
		addValue = value
	else
		addValue = (Time - cTime) * value / cDur * 0.750000
	endIf
	if addValue < 2.00000
		addValue = 2.00000
	endIf
	Float new_contraception = contraception + addValue
	if contraception > System.MaxContraception
		new_contraception = System.MaxContraception
	elseIf contraception < 0.000000
		new_contraception = 0.000000
	endIf
	storageutil.SetFloatValue(woman as form, "FW.ContraceptionTime", Time)
	storageutil.SetFloatValue(woman as form, "FW.Contraception", new_contraception)
	if woman == game.GetPlayer()
		System.ContraceptionWidget.showTimed(true)
	endIf
	System.Manager.OnContraception(woman, addValue, contraception, new_contraception, Time - cTime)
	return new_contraception
endFunction

actor function GetStoredFemale(Int Position)

	if Position < 0 || Position >= storageutil.FormListCount(none, "FW.SavedNPCs")
		return none
	endIf
	return storageutil.FormListGet(none, "FW.SavedNPCs", Position) as actor
endFunction

Int function GetNextState(actor female)

	if storageutil.FormListFind(none, "FW.SavedNPCs", female as form) < 0
		self.CreateFemaleActor(female, false)
	endIf
	Int cs = self.GetFemaleState(female)
	if cs == 0 || cs == 1 || cs == 2
		return cs + 1
	elseIf (System.cfg.NPCCanBecomePregnant == true || game.GetPlayer() == female) && cs < 7 && cs > 3
		return cs + 1
	else
		return 0
	endIf
endFunction

Bool function ActiveSpermImpregnationNoContraceptionTimed(actor Mother, Float Time, Float contraception)

	System.Trace("FWController.ActiveSpermImpregnationContraceptionTimed", Mother)
	if Mother != game.GetPlayer() && System.cfg.NPCCanBecomePregnant == false
		return false
	endIf
	Bool bCanBecomePregnant = self.canBecomePregnant(Mother)
	if bCanBecomePregnant == false
		return false
	endIf
	Int sa = storageutil.FormListCount(Mother as form, "FW.SpermName")
	while sa > 0
		sa -= 1
		Float amo = storageutil.FloatListGet(Mother as form, "FW.SpermAmount", sa)
		if amo > 0.300000
			Float rnd2
			Int rnd1 = utility.RandomInt(0, 3)
			if rnd1 == 0
				rnd2 = utility.RandomFloat(1.00000, 95.0000)
			elseIf rnd1 == 1
				rnd2 = utility.RandomFloat(10.0000, 100.000)
			elseIf rnd1 == 2
				rnd2 = utility.RandomFloat(20.0000, 100.000)
			elseIf rnd1 == 3
				rnd2 = utility.RandomFloat(40.0000, 100.000)
			endIf
			if contraception > rnd2
				storageutil.FloatListSet(Mother as form, "FW.SpermAmount", sa, 0.100000)
			endIf
		endIf
	endWhile
	if System.Controller.HasRelevantSpermTimed(Mother, Time, false)
		if System.Manager.ActorCanBecomePregnant(Mother) == true
			Int numChild = System.calculateNumChildren(Mother)
			if numChild == 0
				return false
			endIf
			actor[] a = System.Controller.GetRelevantSpermActorsTimed(Mother, Time, false, false)
			Float[] relevantSperm = self.GetRelevantSpermFloatTimed(Mother, Time, false, false)
			if relevantSperm.length == 0
				return false
			endIf
			Float relevanceTotal = 0.000000
			Int c = relevantSperm.length
			if c == 0
				return false
			endIf
			Int i = 0
			while i < c
				relevanceTotal += relevantSperm[i]
				i += 1
			endWhile
			storageutil.SetIntValue(Mother as form, "FW.NumChilds", numChild)
			actor[] Fathers = fwutility.ActorArray(numChild)
			while numChild > 0
				numChild -= 1
				Float rnd_r = utility.RandomFloat(0.000000, relevanceTotal)
				Int j = 0
				while rnd_r > relevantSperm[j]
					rnd_r -= relevantSperm[j]
					j += 1
				endWhile
				storageutil.FormListAdd(Mother as form, "FW.ChildFather", a[j] as form, true)
				Fathers[numChild] = a[j]
			endWhile
			storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", 100.000)
			System.Manager.OnImpregnate(Mother, Fathers.length, Fathers)
			self.ChangeStateTimed(Mother, Time, 4)
			return true
		endIf
	endIf
	return false
endFunction

Float[] function GetRelevantSpermFloat(actor woman, Bool bShowTravelingSperm, Bool bSort)

	System.Trace("FWController.GetRelevantSpermFloat", woman)
	return self.GetRelevantSpermFloatTimed(woman, utility.GetCurrentGameTime(), bShowTravelingSperm, bSort)
endFunction

Bool function IsPregnant(actor woman)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	return storageutil.GetIntValue(woman as form, "FW.CurrentState", 0) >= 4
endFunction

actor[] function getWomansWithSpermTimed(actor male, Float Time, Bool bShowTravelingSperm)

	Float SpermDuration = System.getMaleSpermDuration(male)
	actor[] tmp = new actor[128]
	Int femaleCount = storageutil.FormListCount(none, "FW.SavedNPCs")
	Int i = 0
	Int c = 0
	while i < femaleCount && c < 128
		actor woman = storageutil.FormListGet(none, "FW.SavedNPCs", i) as actor
		if storageutil.FormListFind(woman as form, "FW.SpermName", male as form) >= 0
			Int j = storageutil.FormListCount(woman as form, "FW.SpermName")
			while j > 0 && c < 128
				j -= 1
				if storageutil.FormListGet(woman as form, "FW.SpermName", j) == male as form
					Float STime = storageutil.FloatListGet(woman as form, "FW.SpermTime", j)
					if STime + SpermDuration > Time && (STime + System.cfg.WashOutHourDelay < Time || bShowTravelingSperm)
						tmp[c] = woman
						c += 1
						j = 0
					endIf
				endIf
			endWhile
		endIf
		i += 1
	endWhile
	actor[] res = fwutility.ActorArray(c)
	i = 0
	while i < c
		res[i] = tmp[i]
		i += 1
	endWhile
	return res
endFunction

function SetBabyHealth(actor Mother, Float value)

	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		return 
	endIf
	if storageutil.GetIntValue(Mother as form, "FW.Abortus", 0) > 1
		return 
	endIf
	Int S = storageutil.GetIntValue(Mother as form, "FW.CurrentState", 0)
	if S < 4 && S == 8
		return 
	endIf
	if value < 0.000000
		value = 0.000000
	elseIf value > 100.000
		value = 100.000
	endIf
	storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", value)
	if game.GetPlayer() == Mother
		System.Player.checkAbortus()
		System.BabyHealthWidget.showTimed(Mother as Bool)
	else
		self.SendModEvent("BeeingFemale", "checkAbortus", Mother.GetFormID() as Float)
	endIf
endFunction

function ChangeStateTimed(actor female, Float Time, Int state_number)

	System.Trace("FWController.ChangeStateTimed", female)
	if storageutil.FormListFind(none, "FW.SavedNPCs", female as form) < 0
		self.CreateFemaleActor(female, false)
	endIf
	if female != game.GetPlayer() && System.cfg.NPCCanBecomePregnant == false && state_number >= 4 && state_number < 10
		return 
	endIf
	self.setIrregulation(female, state_number)
	storageutil.SetIntValue(female as form, "FW.CurrentState", state_number)
	storageutil.SetFloatValue(female as form, "FW.StateEnterTime", Time)
	if game.GetPlayer() == female
		System.Player.currentState = state_number
		System.Player.stateEnterTime = Time
	else
		self.SendModEvent("BeeingFemale", "Update", female.GetFormID() as Float)
	endIf
endFunction

function __deprecated__showRankedInfoBox(actor target, Int Rank)

	String targetName
	String S = ""
	if target == game.GetPlayer()
		targetName = System.Content.InfoSpell_You
	else
		targetName = target.GetLeveledActorBase().GetName()
	endIf
	if target as fwchildactor != none
		fwchildactor child = target as fwchildactor
		if child.Mother == none && child.Father == none
			S += System.Content.InfoSpell_UnknownParents + "\n"
		elseIf child.Mother == none && child.Father != none
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildFatherIs, child.Father.GetLeveledActorBase().GetName(), "", "", "", "", "") + "\n"
		elseIf child.Mother != none && child.Father == none
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildMotherIs, child.Mother.GetLeveledActorBase().GetName(), "", "", "", "", "") + "\n"
		else
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildParents, child.Mother.GetLeveledActorBase().GetName(), child.Father.GetLeveledActorBase().GetName(), "", "", "", "") + "\n"
		endIf
		S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildWasBorn, System.cfg.GetTimeString(child.Age, false, "", true), "", "", "", "", "") + "\n"
		if child.IsVampire == true
			if child.GetLeveledActorBase().GetSex() == 0
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildVampire, System.Content.InfoSpell_He, "", "", "", "", "") + "\n"
			else
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildVampire, System.Content.InfoSpell_She, "", "", "", "", "") + "\n"
			endIf
		endIf
		if child.Follow != none
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildFollows, child.Follow.GetLeveledActorBase().GetName(), "", "", "", "", "") + "\n"
		endIf
		if child.Order == 0
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder00, "", "", "", "", "") + "\n"
		elseIf child.Order == 1
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder01, "", "", "", "", "") + "\n"
		elseIf child.Order == 2
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder02, "", "", "", "", "") + "\n"
		elseIf child.Order == 3
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder03, "", "", "", "", "") + "\n"
		elseIf child.Order == 4
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder04, "", "", "", "", "") + "\n"
		elseIf child.Order == 5
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder05, "", "", "", "", "") + "\n"
		elseIf child.Order == 6
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder06, "", "", "", "", "") + "\n"
		endIf
		if child.Order as Float != child.GetActorValue("Variable06")
			S += "WARNING: Var6 and order are different (" + child.Order as String + " / " + child.GetActorValue("Variable06") as String + ")\n"
		endIf
		if (child.Order == 0 || child.Order == 1) && child.GetActorValue("WaitingForPlayer") == 0.000000
			S += "WARNING: Not Waiting for Player when having Order: " + child.Order as String + "\n"
		elseIf child.Order != 0 && child.Order != 1 && child.GetActorValue("WaitingForPlayer") == 1.00000
			S += "WARNING: Waiting for Player when having Order: " + child.Order as String + "\n"
		endIf
		S += "Current Package: " + child.GetCurrentPackage().GetName() + "(" + child.GetCurrentPackage().GetFormID() as String + ")\n"
		S += "Relationship Rank with Player: " + child.GetRelationShipRank(game.GetPlayer()) as String + "\n"
	endIf
	if target.GetLeveledActorBase().GetSex() == 0
		Int validateMale = System.IsValidateMaleActor(target, false)
		if validateMale <= 0
			if validateMale == -1
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason1, targetName, "", "", "", "", ""), System.MSG_ALWAYS, System.MSG_Box)
			elseIf validateMale == -2
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason2, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			elseIf validateMale == -3
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason3, targetName, System.Content.InfoSpell_Female, "", "", "", ""), System.MSG_Debug, System.MSG_Box)
			elseIf validateMale == -4
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason4, targetName, "", "", "", "", ""), System.MSG_Debug, System.MSG_Box)
			elseIf validateMale == -5
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason5, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			elseIf validateMale == -6
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason6, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			elseIf validateMale == -7
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason7, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			elseIf validateMale == -8
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason8, targetName, "", "", "", "", ""), System.MSG_Low, System.MSG_Box)
			elseIf validateMale == -9
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason9, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			endIf
			return 
		endIf
		if Rank <= 0
			if self.HasSpermInWoman(target, none, true) == true
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotSpermInWoman, targetName, "", "", "", "", "") + "\n"
			else
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotNoSpermInWoman, targetName, "", "", "", "", "") + "\n"
			endIf
		else
			Float SpermDuration = System.getMaleSpermDuration(target)
			Float curTime = utility.GetCurrentGameTime()
			String spermNames = ""
			String pregnantNames = ""
			Int SpermCount = 0
			Int PregnantCount = 0
			Bool PlayerSperm = false
			Bool PlayerPregnant = false
			Int c = storageutil.FormListCount(none, "FW.SavedNPCs")
			while c > 0
				c -= 1
				actor female = storageutil.FormListGet(none, "FW.SavedNPCs", c) as actor
				if storageutil.FormListFind(female as form, "FW.SpermName", target as form) >= 0
					Int sperm_index = storageutil.FormListCount(female as form, "FW.SpermName")
					while sperm_index > 0
						sperm_index -= 1
						if storageutil.FormListGet(female as form, "FW.SpermName", sperm_index) == target as form
							if storageutil.FloatListGet(female as form, "FW.SpermTime", sperm_index) + SpermDuration > curTime
								sperm_index = 0
								if SpermCount > 0
									spermNames += ", "
								endIf
								if female == game.GetPlayer()
									PlayerSperm = true
									spermNames += System.Content.InfoSpell_You
								else
									spermNames += female.GetLeveledActorBase().GetName()
								endIf
								SpermCount += 1
							endIf
						endIf
					endWhile
					if Rank >= 50
						System.Data.Update(female)
						Int female_state = storageutil.GetIntValue(female as form, "FW.CurrentState", 0)
						if female_state > 3 && female_state < 8
							if PregnantCount > 0
								pregnantNames += ", "
							endIf
							if female == game.GetPlayer()
								pregnantNames += System.Content.InfoSpell_You
								PlayerPregnant = true
							else
								pregnantNames += female.GetLeveledActorBase().GetName()
							endIf
							PregnantCount += 1
						endIf
					endIf
				endIf
			endWhile
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotNumSpermInWoman, targetName, SpermCount as String, "", "", "", "") + "\n\n"
			String shortname = System.Content.InfoSpell_He
			if target == game.GetPlayer()
				shortname = System.Content.InfoSpell_You
			endIf
			if SpermCount > 0 && game.GetPlayer().GetLeveledActorBase().GetSex() == 1
				if PlayerSperm == true
					S += fwutility.MultiStringReplace(System.Content.InfoSpell_CameInsideYou, shortname, System.Content.InfoSpell_Yes, "", "", "", "") + "\n"
				else
					S += fwutility.MultiStringReplace(System.Content.InfoSpell_CameInsideYou, shortname, System.Content.InfoSpell_No, "", "", "", "") + "\n"
				endIf
			endIf
			if Rank >= 20 && SpermCount > 0
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CameInsideNames, shortname, spermNames, "", "", "", "") + "\n\n"
			endIf
			if Rank >= 50 && Rank < 60
				if PregnantCount > 0
					S += fwutility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedAnyWoman, shortname, spermNames, "", "", "", "") + "\n"
				endIf
			elseIf Rank >= 60 && (Rank < 80 || PregnantCount == 0)
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedNumWoman, shortname, PregnantCount as String, "", "", "", "") + "\n"
			endIf
			if Rank >= 70 && PregnantCount > 0
				if PlayerPregnant == true
					S += fwutility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedYou, shortname, System.Content.InfoSpell_Yes, "", "", "", "") + "\n"
				else
					S += fwutility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedYou, shortname, System.Content.InfoSpell_No, "", "", "", "") + "\n"
				endIf
			endIf
			if Rank >= 80 && PregnantCount > 0
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedWoman, shortname, PregnantCount as String, pregnantNames, "", "", "") + "\n"
			endIf
		endIf
	else
		Int Validate = System.IsValidateFemaleActor(target, false)
		if Validate <= 0
			if Validate == -1
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason1, targetName, "", "", "", "", ""), System.MSG_ALWAYS, System.MSG_Box)
			elseIf Validate == -2
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason2, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			elseIf Validate == -3
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason3, targetName, System.Content.InfoSpell_Male, "", "", "", ""), System.MSG_Debug, System.MSG_Box)
			elseIf Validate == -4
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason4, targetName, "", "", "", "", ""), System.MSG_Debug, System.MSG_Box)
			elseIf Validate == -5
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason5, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			elseIf Validate == -6
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason6, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			elseIf Validate == -7
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason7, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			elseIf Validate == -8
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason8, targetName, "", "", "", "", ""), System.MSG_Low, System.MSG_Box)
			elseIf Validate == -9
				System.Message(fwutility.MultiStringReplace(System.Content.ForbiddenReason9, targetName, "", "", "", "", ""), System.MSG_High, System.MSG_Box)
			endIf
			return 
		endIf
		System.Data.Update(target)
		Int stateID = storageutil.GetIntValue(target as form, "FW.CurrentState", 0)
		Int flag = storageutil.GetIntValue(target as form, "FW.Flags", 0)
		actor[] spermnames = fwutility.ActorArrayUnique(self.GetRelevantSpermActors(target, true, true))
		if Rank < 20
			if self.HasRelevantSperm(target, true) == true
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotSpermInside, targetName, "", "", "", "", "") + "\n"
			else
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotNoSpermInside, targetName, "", "", "", "", "") + "\n"
			endIf
		elseIf spermnames.length == 0
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotNoSpermInside, targetName, "", "", "", "", "") + "\n"
		elseIf spermnames.length == 1 && spermnames[0] == game.GetPlayer() && Rank > 20
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotYourSpermInside, targetName, "", "", "", "", "") + "\n"
		elseIf spermnames.length == 1
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotOneSpermInside, targetName, "", "", "", "", "") + "\n"
		else
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_GotMoreSpermInside, targetName, spermnames.length as String, "", "", "", "") + "\n"
		endIf
		if Rank >= 35
			if stateID == 0
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID0, "", "", "", "", "")
			elseIf stateID == 1
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID1, "", "", "", "", "")
			elseIf stateID == 2
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID2, "", "", "", "", "")
			elseIf stateID == 3
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID3, "", "", "", "", "")
			elseIf stateID == 4
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID4, "", "", "", "", "")
			elseIf stateID == 5
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID5, "", "", "", "", "")
			elseIf stateID == 6
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID6, "", "", "", "", "")
			elseIf stateID == 7
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID7, "", "", "", "", "")
			elseIf stateID == 8
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID8, "", "", "", "", "")
			elseIf stateID == 20
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID20, "", "", "", "", "")
			elseIf stateID == 21
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID21, "", "", "", "", "")
			else
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateUnknown, "", "", "", "", "")
			endIf
			if Rank > 40 && self.IsPaused(target) == false
				Float stateDur = System.GetStateDuration(stateID, target)
				Float xStateDelay = utility.GetCurrentGameTime() - storageutil.GetFloatValue(target as form, "FW.StateEnterTime", 0.000000)
				S += " " + fwutility.MultiStringReplace(System.Content.InfoSpell_StateSince, fwutility.GetTimeString(xStateDelay, true, ""), "", "", "", "", "") + "\n"
				if Rank > 65
					S += fwutility.MultiStringReplace(System.Content.InfoSpell_StateDuration, fwutility.GetTimeString(stateDur, true, ""), "", "", "", "", "")
					if Rank > 95
						S += " (" + fwutility.GetPercentage(self.GetStatePercentage(target), 1, true) + "%)\n"
					else
						S += "\n"
					endIf
				endIf
			else
				S += "\n"
			endIf
		endIf
		if Rank >= 5 && Rank < 25
			if stateID > 4 && stateID < 8
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_LooksPregnant, System.Content.InfoSpell_Yes, "", "", "", "", "") + "\n"
			elseIf stateID <= 4
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_LooksPregnant, System.Content.InfoSpell_No, "", "", "", "", "") + "\n"
			elseIf stateID == 8
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_LooksPregnant, System.Content.InfoSpell_NotAnymore, "", "", "", "", "") + "\n"
			endIf
		elseIf Rank >= 25
			if stateID >= 4 && stateID < 8
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_IsPregnant, System.Content.InfoSpell_Yes, "", "", "", "", "") + "\n"
			elseIf stateID < 4
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_IsPregnant, System.Content.InfoSpell_No, "", "", "", "", "") + "\n"
			elseIf stateID == 8
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_IsPregnant, System.Content.InfoSpell_NotAnymore, "", "", "", "", "") + "\n"
			endIf
		endIf
		if Rank >= 95 && stateID < 4
			if math.LogicalOr(flag, 1) == flag
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CanBecomePregnant, System.Content.InfoSpell_Yes, "", "", "", "", "") + " (" + math.Floor(self.getRelativePregnancyChance(target, none)) as String + "%)\n"
			else
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CanBecomePregnant, System.Content.InfoSpell_No, "", "", "", "", "") + " (" + math.Floor(self.getRelativePregnancyChance(target, none)) as String + "%)\n"
			endIf
		elseIf Rank >= 80 && stateID < 4
			if math.LogicalOr(flag, 1) == flag
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CanBecomePregnant, System.Content.InfoSpell_Yes, "", "", "", "", "") + "\n"
			else
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_CanBecomePregnant, System.Content.InfoSpell_No, "", "", "", "", "") + "\n"
			endIf
		endIf
		if stateID >= 4 && stateID < 8
			if Rank > 60
				Int NumChilds = storageutil.GetIntValue(target as form, "FW.NumChilds", 0)
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_PregnantWithNumOfBabys, NumChilds as String, "", "", "", "", "") + "\n"
				if Rank > 95
					if NumChilds > 1
						S += fwutility.MultiStringReplace(System.Content.InfoSpell_UnbornBabiesHealth, (storageutil.GetFloatValue(target as form, "FW.UnbornHealth", 0.000000) as Int) as String, "", "", "", "", "") + "\n"
					else
						S += fwutility.MultiStringReplace(System.Content.InfoSpell_UnbornBabyHealth, (storageutil.GetFloatValue(target as form, "FW.UnbornHealth", 0.000000) as Int) as String, "", "", "", "", "") + "\n"
					endIf
				endIf
			endIf
		elseIf Rank > 33 && Rank < 55
			if storageutil.GetFloatValue(target as form, "FW.Contraception", 0.000000) > 5.00000
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_Contraception, System.Content.InfoSpell_Yes, "", "", "", "", "") + "\n"
			else
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_Contraception, System.Content.InfoSpell_No, "", "", "", "", "") + "\n"
			endIf
		elseIf Rank >= 55
			Float concep = storageutil.GetFloatValue(target as form, "FW.Contraception", 0.000000)
			if concep > 0.000000
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_Contraception, (concep as Int) as String + "%", "", "", "", "", "") + "\n"
			else
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_Contraception, System.Content.InfoSpell_No, "", "", "", "", "") + "\n"
			endIf
			Float lastTimeConcep = storageutil.GetFloatValue(target as form, "FW.ContraceptionTime", 0.000000)
			if Rank > 75 && lastTimeConcep > 0.000000
				S += fwutility.MultiStringReplace(System.Content.InfoSpell_LastContraception, fwutility.GetTimeString(utility.GetCurrentGameTime() - lastTimeConcep, true, ""), "", "", "", "", "") + "\n"
			endIf
		endIf
		if Rank >= 50 && spermnames.length > 0
			Int c = spermnames.length
			Bool bSpermFromPlayer = false
			Bool bHasNames = false
			String xSpermNames = ""
			while c > 0
				c -= 1
				if spermnames[c] == game.GetPlayer()
					bSpermFromPlayer = true
				elseIf spermnames[c] != none
					if bHasNames == true
						xSpermNames += ", "
					endIf
					if spermnames[c].GetLeveledActorBase().GetName() == ""
						xSpermNames += spermnames[c].GetActorBase().GetName()
					else
						xSpermNames += spermnames[c].GetLeveledActorBase().GetName()
					endIf
					bHasNames = true
				endIf
			endWhile
			if bSpermFromPlayer == true
				if bHasNames == true
					xSpermNames += " " + System.Content.InfoSpell_AndYou
				else
					xSpermNames += System.Content.InfoSpell_You
				endIf
			endIf
			S += fwutility.MultiStringReplace(System.Content.InfoSpell_SpermNames, xSpermNames, "", "", "", "", "") + "\n"
		endIf
	endIf
	System.Message(S, System.MSG_ALWAYS, System.MSG_Box)
endFunction

Int function GetNumBirth(actor woman)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	return storageutil.GetIntValue(woman as form, "FW.NumBirth", 0)
endFunction

function showRankedInfoBox(actor target, Int Rank)

	String[] ent
	System.InfoMenuBlur()
	ui.OpenCustomMenu("BeeingFemale/BeeingFemaleInfo", 0)
	Int iValidate = System.IsValidateActor(target, false)
	if target as fwchildactor != none
		fwchildactor child = target as fwchildactor
		child.InitChild()
		ent = new String[9]
		ent[0] = "3"
		ent[1] = child.Name + " " + child.GetLastName()
		if child.Mother == none && child.Father == none
			ent[2] = "$FW_INFOWINDOW_UnknownParents"
		elseIf child.Father == none
			ent[2] = "$FW_INFOWINDOW_ChildMotherIs{" + child.Mother.GetDisplayName() + "}"
		elseIf child.Mother == none
			ent[2] = "$FW_INFOWINDOW_ChildFatherIs{" + child.Father.GetDisplayName() + "}"
		else
			ent[2] = "$FW_INFOWINDOW_ChildParents{" + child.Mother.GetDisplayName() + "}{" + child.Father.GetDisplayName() + "}"
		endIf
		if child.GetLeveledActorBase().GetSex() == 0
			ent[3] = "m"
		else
			ent[3] = "f"
		endIf
		ent[4] = math.Floor(child.Age) as String
		ent[5] = child.Order as String
		ent[6] = child.GetLevel() as String
		ent[7] = ((child.GetActorValuePercentage("Experience") * 100.000) as Int) as String
		location loc = child.GetCurrentLocation()
		if loc != none
			ent[8] = loc.GetName()
		else
			ent[8] = "$FW_INFOWINDOW_UnknownLocation"
		endIf
	elseIf iValidate < 0 || target.GetLeveledActorBase() == none
		ent = new String[3]
		ent[0] = "4"
		ent[1] = target.GetLeveledActorBase().GetName()
		ent[2] = (iValidate * -1) as String
	elseIf target.GetLeveledActorBase().GetSex() == 0
		ent = new String[5]
		ent[0] = "2"
		ent[1] = target.GetLeveledActorBase().GetName()
		ent[2] = math.Floor(self.GetVirility(target) * 100.000) as String
		ent[3] = fwutility.getActorListNames(self.getFemalesWithSpermFrom(target, 20), false)
		ent[4] = fwutility.getActorListNames(self.getFemalesImpregnatedFrom(target, 5), false)
	else
		System.Data.Update(target)
		if self.IsPregnant(target) == false
			actor[] a = self.GetRelevantSpermActors(target, true, true)
			ent = new String[9]
			ent[0] = "0"
			ent[1] = target.GetLeveledActorBase().GetName()
			ent[2] = self.GetFemaleState(target) as String
			ent[3] = (utility.GetCurrentGameTime() - self.GetStateEnterTime(target)) as String
			ent[4] = (System.GetStateDuration(self.GetFemaleState(target), target) as Int) as String
			ent[5] = (self.getContraception(target) as Int) as String
			ent[6] = self.GetContraceptionDuration(target) as String
			ent[7] = self.getRelativePregnancyChance(target, none) as String
			ent[8] = fwutility.getActorListNames(a, false)
		else
			ent = new String[8]
			ent[0] = "1"
			ent[1] = target.GetLeveledActorBase().GetName()
			ent[2] = self.GetFemaleState(target) as String
			ent[3] = (utility.GetCurrentGameTime() - self.GetStateEnterTime(target)) as String
			ent[4] = (System.GetStateDuration(self.GetFemaleState(target), target) as Int) as String
			ent[5] = self.getNumBabys(target) as String
			ent[6] = (self.GetBabyHealth(target) as Int) as String
			ent[7] = fwutility.getActorListNames(self.getFathers(target, 8), true)
		endIf
	endIf
	ui.InvokeStringA("CustomMenu", "_root.FWInfoMenu.initData", ent)
endFunction

Float function GetDaysSinceLastSex(actor a)

	Float LastSexTime = 0.000000
	Float L1 = storageutil.FloatListGet(a as form, "SexLabSkills", 17)
	Float L2 = storageutil.GetFloatValue(a as form, "FW.LastSexTime", 0.000000)
	if L1 > L2
		LastSexTime = L1
	else
		LastSexTime = L2
	endIf
	return utility.GetCurrentGameTime() - LastSexTime
endFunction

actor[] function getMalesInWoman(actor female, Int max)

	if max > 128
		max = 128
	endIf
	Float curTime = utility.GetCurrentGameTime()
	actor[] res = fwutility.ActorArray(max)
	Int c = storageutil.FormListCount(female as form, "FW.SpermNames")
	Int i = 0
	Int curRes = 0
	while i < c
		actor a = storageutil.FormListGet(female as form, "FW.SpermNames", i) as actor
		Float t = storageutil.FloatListGet(female as form, "FW.SpermTime", i)
		Float m = storageutil.FloatListGet(female as form, "FW.SpermAmount", i)
		debug.Notification(a.GetLeveledActorBase().GetName() + " " + t as String + " -- " + m as String)
		if a != none && m >= self.Sperm_Min_Amount_For_Impregnation
			Float sDur = System.getMaleSpermDuration(a)
			debug.Notification(curTime as String + " - " + t as String + " < " + sDur as String + " | " + (curTime - t) as String + " < " + sDur as String)
			if curTime - t < sDur
				res[curRes] = a
				curRes += 1
				if curRes >= max
					c = 0
				endIf
			endIf
		endIf
		i += 1
	endWhile
	return fwutility.ActorArrayResize(res, curRes)
endFunction

actor[] function getFathers(actor Mother, Int max)

	if max > 128
		max = 128
	endIf
	actor[] res = fwutility.ActorArray(max)
	Int c = storageutil.FormListCount(Mother as form, "FW.ChildFather")
	Int i = 0
	Int curRes = 0
	while i < c
		actor a = storageutil.FormListGet(Mother as form, "FW.ChildFather", i) as actor
		if a != none
			res[curRes] = a
			curRes += 1
			if curRes >= max
				c = 0
			endIf
		endIf
		i += 1
	endWhile
	return fwutility.ActorArrayResize(res, curRes)
endFunction

Bool function HasSpermInWomanTimed(actor male, actor female, Float Time, Bool bShowTravelingSperm)

	if storageutil.FormListFind(none, "FW.SavedNPCs", female as form) < 0 && female != none
		self.CreateFemaleActor(female, false)
	endIf
	Float SpermDuration = System.getMaleSpermDuration(male)
	if female == none
		Int femaleCount = storageutil.FormListCount(none, "FW.SavedNPCs")
		while femaleCount > 0
			femaleCount -= 1
			actor tmpFemale = storageutil.FormListGet(none, "FW.SavedNPCs", femaleCount) as actor
			Int i = storageutil.FormListFind(tmpFemale as form, "FW.SpermName", male as form)
			if i > 0
				Int j = storageutil.FormListCount(tmpFemale as form, "FW.SpermName")
				while j > 0
					j -= 1
					if storageutil.FormListGet(tmpFemale as form, "FW.SpermName", j) == male as form
						Float STime = storageutil.FloatListGet(tmpFemale as form, "FW.SpermTime", j)
						if STime + SpermDuration > Time && (STime + System.cfg.WashOutHourDelay < Time || bShowTravelingSperm)
							return true
						endIf
					endIf
				endWhile
			endIf
		endWhile
	else
		Int i = storageutil.FormListFind(female as form, "FW.SpermName", male as form)
		if i >= 0
			Int j = storageutil.FormListCount(female as form, "FW.SpermName")
			while j > 0
				j -= 1
				if storageutil.FormListGet(female as form, "FW.SpermName", j) == male as form
					Float stime = storageutil.FloatListGet(female as form, "FW.SpermTime", j)
					if stime + SpermDuration > Time && (stime + System.cfg.WashOutHourDelay < Time || bShowTravelingSperm)
						return true
					endIf
				endIf
			endWhile
		endIf
	endIf
	return false
endFunction

Int function GetFemaleState(actor woman)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	return storageutil.GetIntValue(woman as form, "FW.CurrentState", 0)
endFunction

Float function GetVirility(actor male)

	Float virility = 0.000000
	if System.cfg.MaleVirilityRecovery > 0.000000
		Float L1 = storageutil.FloatListGet(male as form, "SexLabSkills", 17)
		Float L2 = storageutil.GetFloatValue(male as form, "FW.LastSexTime", 0.000000)
		Float LastSexTime = 0.000000
		if L1 > L2
			LastSexTime = L1
		else
			LastSexTime = L2
		endIf
		if LastSexTime <= 0.000000
			virility = 1.00000
		else
			virility = fwutility.ClampFloat(utility.GetCurrentGameTime() - LastSexTime / System.cfg.MaleVirilityRecovery * System.Manager.ActorMaleRecoveryScale(male), 0.0200000, 1.00000)
		endIf
	else
		virility = 1.00000
	endIf
	return virility
endFunction

Float function GetStatePercentage(actor woman)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Int stateID = storageutil.GetIntValue(woman as form, "FW.CurrentState", 0)
	Float duration = System.GetStateDuration(stateID, woman)
	if duration > 0.000000
		return (utility.GetCurrentGameTime() - self.GetStateEnterTime(woman)) / duration
	endIf
	return 0.000000
endFunction

Bool function ActiveSpermImpregnationContraception(actor Mother, Float contraception)

	System.Trace("FWController.ActiveSpermImpregnationContraception", Mother)
	return self.ActiveSpermImpregnationNoContraceptionTimed(Mother, utility.GetCurrentGameTime(), contraception)
endFunction

Float function SetContraceptionTimed(actor woman, Float Time, Float value)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	storageutil.SetFloatValue(woman as form, "FW.ContraceptionTime", Time)
	storageutil.SetFloatValue(woman as form, "FW.Contraception", value)
	if woman == game.GetPlayer()
		System.ContraceptionWidget.showTimed(true)
	endIf
	return value
endFunction

function AbortusStateTimed(actor Mother, Float Time, Int Abortus_State)

	System.Trace("FWController.AbortusStateTimed", Mother)
	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		return 
	endIf
	Int S = storageutil.GetIntValue(Mother as form, "FW.CurrentState", 0)
	if S < 4 && S == 8
		return 
	endIf
	if storageutil.GetIntValue(Mother as form, "FW.NumChilds", 0) > 0
		storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", 0.000000)
		storageutil.SetIntValue(Mother as form, "FW.Abortus", Abortus_State)
		storageutil.SetFloatValue(Mother as form, "FW.AbortusTime", Time)
		if game.GetPlayer() == Mother
			System.Player.checkAbortus()
		else
			self.SendModEvent("BeeingFemale", "checkAbortus", Mother.GetFormID() as Float)
		endIf
	endIf
endFunction

Float function getRelativePregnancyChance(actor woman, actor man)

	return self.getRelativePregnancyChanceTimed(woman, utility.GetCurrentGameTime(), man)
endFunction

function UpdateParentFaction(actor ParentActor)

	System.Trace("FWController.UpdateParentFaction", ParentActor)
endFunction

Float function getLastChildBornTime(actor ParentActor)

	System.Trace("FWController.getLastChildBornTime", ParentActor)
	return storageutil.GetFloatValue(ParentActor as form, "FW.LastBornChildTime", 0.000000)
endFunction

Float function GetContraceptionDurationTimed(actor woman, Float Time)

	System.Trace("FWController.GetContraceptionDurationTimed", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		return 0.000000
	endIf
	Float cDur = System.GetPillDuration(woman)
	Float cTime = storageutil.GetFloatValue(woman as form, "FW.ContraceptionTime", 0.000000)
	if cTime + cDur > Time
		return 0.000000
	else
		return cDur - cTime + cDur - Time
	endIf
endFunction

actor[] function getFemalesWithSpermFrom(actor male, Int max)

	if max > 128
		max = 128
	endIf
	actor[] res = fwutility.ActorArray(max)
	Int curRes = 0
	Float SpermDuration = System.getMaleSpermDuration(male)
	Float curTime = utility.GetCurrentGameTime()
	Int c = fwutility.MinInt(storageutil.FormListCount(none, "FW.SavedNPCs"), max)
	while c > 0
		c -= 1
		actor female = storageutil.FormListGet(none, "FW.SavedNPCs", c) as actor
		if storageutil.FormListFind(female as form, "FW.SpermName", male as form) >= 0
			Int sperm_index = storageutil.FormListCount(female as form, "FW.SpermName")
			while sperm_index > 0
				sperm_index -= 1
				if storageutil.FormListGet(female as form, "FW.SpermName", sperm_index) == male as form
					if storageutil.FloatListGet(female as form, "FW.SpermTime", sperm_index) + SpermDuration > curTime
						sperm_index = 0
						res[curRes]
						curRes += 1
						if curRes >= max
							c = 0
						endIf
					endIf
				endIf
			endWhile
		endIf
	endWhile
	return fwutility.ActorArrayResize(res, curRes)
endFunction

function AddSpermTimed(actor woman, Float Time, actor PotentialFather, Float amount)

	System.Trace("FWController.AddSpermTimed", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	storageutil.SetFloatValue(woman as form, "FW.LastSexTime", utility.GetCurrentGameTime())
	storageutil.SetFloatValue(PotentialFather as form, "FW.LastSexTime", utility.GetCurrentGameTime())
	Float tmp_amount = amount * System.Manager.ActorSpermAmountScale(PotentialFather)
	if !System.CheckIsLoreFriendlyMetting(woman, PotentialFather)
		tmp_amount = self.Sperm_Amount_For_Delete
	endIf
	storageutil.FloatListAdd(woman as form, "FW.SpermTime", Time, true)
	storageutil.FormListAdd(woman as form, "FW.SpermName", PotentialFather as form, true)
	storageutil.FloatListAdd(woman as form, "FW.SpermAmount", tmp_amount, true)
	if PotentialFather == game.GetPlayer()
		System.StateWidget.showTimed(PotentialFather as Bool)
	endIf
endFunction

function RemoveAllSperm(actor woman)

	System.Trace("FWController.RemoveAllSperm", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		return 
	endIf
	storageutil.FormListClear(woman as form, "FW.SpermName")
	storageutil.FloatListClear(woman as form, "FW.SpermTime")
	storageutil.FloatListClear(woman as form, "FW.SpermAmount")
endFunction

function GiveBirth(actor Mother)

	Form[] dropedItems
	System.Trace("FW Debug: FWController.GiveBirth", Mother)
	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		return 
	endIf
	Int NumChilds = storageutil.GetIntValue(Mother as form, "FW.NumChilds", 0)
	if NumChilds == 0
		return 
	endIf
	System.Manager.OnGiveBirthStart(Mother)
	Mother.EvaluatePackage()
	Float UnbornHealth = storageutil.GetFloatValue(Mother as form, "FW.UnbornHealth", 100.000)
	actor[] ChildFather = fwutility.ActorArray(NumChilds)
	Int k = NumChilds
	while k > 0
		k -= 1
		ChildFather[k] = storageutil.FormListGet(Mother as form, "FW.ChildFather", k) as actor
	endWhile
	Float IntervalBabyScale = System.Manager.getActorDuration_BabySpawn(Mother)
	Float IntervalLaborScale = System.Manager.getActorDuration_BetweenLaborPains(Mother)
	Float BirthPainDamageScale = System.getDamageScale(4, Mother)
	Float DamageScale = 1.00000 * BirthPainDamageScale
	if Mother.IsOnMount() == true
		Mother.Dismount()
		Mother.SetVehicle(none)
		utility.Wait(3.00000)
	endIf
	if Mother == game.GetPlayer()
		fwutility.LockPlayer()
		System.Manager.StartCamera()
	else
		Mother.SetDontMove(true)
	endIf
	if System.cfg.PlayAnimations
		dropedItems = System.StripActor(Mother)
		Bool useBed = System.LayDown(Mother)
		if useBed == true
			DamageScale -= 0.100000
		endIf
	endIf
	objectreference MaraShrine = game.FindClosestReferenceOfTypeFromRef(System.MaraShrineObject as form, Mother as objectreference, 300.000)
	if MaraShrine != none
		DamageScale -= 0.100000
	endIf
	objectreference ArkayShrine = game.FindClosestReferenceOfTypeFromRef(System.ArkayShrineObject as form, Mother as objectreference, 300.000)
	if ArkayShrine != none
		DamageScale -= 0.300000
	endIf
	if System.cfg.PlayAnimations
		utility.Wait(3.00000 * IntervalLaborScale)
		debug.SendAnimationEvent(Mother as objectreference, "Birth_S1")
		System.Mimik(Mother, "Pained", 50, true)
		System.PlayPainSound(Mother, 30.0000)
		System.doDamage(Mother, 8.00000 * DamageScale, 10, 0.000000)
		utility.Wait(3.00000 * IntervalLaborScale)
	endIf
	System.Mimik(Mother, "Pained", 60, true)
	System.PlayPainSound(Mother, 40.0000)
	System.doDamage(Mother, 11.0000 * DamageScale, 10, 0.000000)
	Int NumBirth = storageutil.GetIntValue(Mother as form, "FW.NumBirth", 0)
	Int NumBabys = storageutil.GetIntValue(Mother as form, "FW.NumBabys", 0)
	NumBirth += 1
	NumBabys += NumChilds
	storageutil.SetIntValue(Mother as form, "FW.NumBirth", NumBirth)
	storageutil.SetIntValue(Mother as form, "FW.NumBabys", NumBabys)
	fwutility.ActorAddSpell(Mother, System.Effect_VaginalBloodLow, false, true)
	while NumChilds > 0
		NumChilds -= 1
		utility.Wait(4.00000 * IntervalBabyScale)
		System.Mimik(Mother, "Pained", 30, true)
		if System.cfg.PlayAnimations
			debug.SendAnimationEvent(Mother as objectreference, "Birth_S2")
			utility.Wait(1.00000)
			Int j = 8
			debug.SendAnimationEvent(Mother as objectreference, "Birth_S3")
			System.Mimik(Mother, "Pained", 40, true)
			while j > 0
				System.PlayPainSound(Mother, 30.0000)
				System.doDamage(Mother, 9.00000 * DamageScale, 10, 0.000000)
				utility.Wait(2.00000 * IntervalBabyScale)
				j -= 1
			endWhile
			System.Mimik(Mother, "Pained", 20, true)
			utility.Wait(2.00000 * IntervalBabyScale)
			System.Mimik(Mother, "Pained", 80, true)
		else
			Int j = 4
			while j > 0
				System.doDamage(Mother, 16.0000 * DamageScale, 10, 0.000000)
				utility.Wait(1.00000 * IntervalBabyScale)
				j -= 1
			endWhile
		endIf
		System.PlayPainSound(Mother, 60.0000)
		System.doDamage(Mother, 18.0000 * DamageScale, 9, 0.000000)
		Float HealthRnd = utility.RandomFloat(0.000000, 35.0000)
		if UnbornHealth > HealthRnd || System.cfg.abortus == false
			fwutility.ActorAddSpell(Mother, System.Effect_VaginalBloodBig, false, true)
			System.SpawnChild(Mother, ChildFather[NumChilds])
		else
			System.Message("You've born a dead child...", System.MSG_ALWAYS, 0)
		endIf
		if System.cfg.PlayAnimations
			utility.Wait(1.00000)
			debug.SendAnimationEvent(Mother as objectreference, "Birth_S1")
		endIf
		utility.Wait(2.00000)
		System.Mimik(Mother, "Pained", 80, true)
		storageutil.SetIntValue(Mother as form, "FW.NumChilds", NumChilds)
		if NumChilds == 0
			self.SetBelly(Mother, true)
		else
			self.SetBelly(Mother, false)
		endIf
		utility.Wait(3.00000 * IntervalBabyScale)
	endWhile
	System.Mimik(Mother, "Happy", 30, true)
	storageutil.UnsetFloatValue(Mother as form, "FW.UnbornHealth")
	storageutil.FormListClear(Mother as form, "FW.ChildFather")
	storageutil.UnsetFloatValue(Mother as form, "FW.AbortusTime")
	utility.Wait(2.00000)
	if System.cfg.PlayAnimations
		System.GetUp(Mother)
		System.UnstripActor(Mother, dropedItems)
	endIf
	System.Manager.OnGiveBirthEnd(Mother)
	Mother.EvaluatePackage()
	if Mother == game.GetPlayer()
		fwutility.UnlockPlayer()
		System.Manager.StopCamera()
	else
		Mother.SetDontMove(false)
		Mother.AddItem(System.ContraceptionMid as form, 3, false)
		Mother.AddItem(System.ContraceptionLow as form, 12, false)
	endIf
	System.Mimik(Mother, "", 50, true)
	storageutil.SetIntValue(Mother as form, "FW.CurrentState", 8)
	storageutil.SetFloatValue(Mother as form, "FW.StateEnterTime", utility.GetCurrentGameTime())
	self.SendModEvent("BeeingFemale", "Update", Mother.GetFormID() as Float)
endFunction

Float function getContraceptionTimed(actor woman, Float Time)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		return 0.000000
	endIf
	Float contraception = storageutil.GetFloatValue(woman as form, "FW.Contraception", 0.000000)
	if contraception <= 0.000000
		return 0.000000
	elseIf contraception > System.MaxContraception
		contraception = System.MaxContraception
	endIf
	Float cTime = storageutil.GetFloatValue(woman as form, "FW.ContraceptionTime", 0.000000)
	Float cDur = System.GetPillDuration(woman)
	Float res = contraception - (Time - cTime - cDur) * 24.0000
	return fwutility.RangedFloat(res, 0.000000, contraception)
endFunction

function setIrregulation(actor female, Int state_number)

	System.Trace("FWController.setIrregulation", female)
	Float newIrregulation = 1.00000
	if System.IrregulationChance(female, state_number) > utility.RandomFloat(0.000000, 1.01000)
		newIrregulation *= System.IrregulationValue(female, state_number)
	endIf
	storageutil.SetFloatValue(female as form, "FW.Irregulation", newIrregulation)
endFunction

function SetBelly(actor woman, Bool ForceNPC)

	System.Trace("FWController.SetBelly", woman)
	if woman == game.GetPlayer()
		System.Player.SetBelly(false)
	elseIf ForceNPC == true
		System.raiseModEventA("Belly", woman)
	endIf
endFunction

function ContraceptionSpermKillTimed(actor woman, Float Time)

	System.Trace("FWController.ContraceptionSpermKillTimed", woman)
	Float contraception = self.getContraceptionTimed(woman, Time)
	Int c = storageutil.FormListCount(woman as form, "FW.SpermName")
	while c > 0
		c -= 1
		Float amo = storageutil.FloatListGet(woman as form, "FW.SpermAmount", c)
		if amo > self.Sperm_Min_Amount_For_Impregnation
			Float rnd2
			Int rnd1 = utility.RandomInt(0, 3)
			if rnd1 == 0
				rnd2 = utility.RandomFloat(1.00000, 95.0000)
			elseIf rnd1 == 1
				rnd2 = utility.RandomFloat(10.0000, 100.000)
			elseIf rnd1 == 2
				rnd2 = utility.RandomFloat(20.0000, 100.000)
			elseIf rnd1 == 3
				rnd2 = utility.RandomFloat(40.0000, 100.000)
			endIf
			if contraception > rnd2
				storageutil.FloatListSet(woman as form, "FW.SpermAmount", c, self.Sperm_Min_Amount_For_Impregnation)
			elseIf contraception > 20.0000
				storageutil.FloatListSet(woman as form, "FW.SpermAmount", c, amo - contraception * 0.00200000)
			endIf
		endIf
	endWhile
endFunction

Int function setCanBecomePregnant(actor woman, Bool bActive)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Int flag = storageutil.GetIntValue(woman as form, "FW.Flags", 0)
	if math.LogicalAnd(flag, 1) == 1 && bActive == false
		flag -= 1
	elseIf math.LogicalAnd(flag, 1) != 1 && bActive == true
		flag += 1
	endIf
	storageutil.SetIntValue(woman as form, "FW.Flags", flag)
	return flag
endFunction

function DamageBaby(actor Mother, Float Damage)

	System.Trace("FWController.DamageBaby", Mother)
	if storageutil.FormListFind(none, "FW.SavedNPCs", Mother as form) < 0
		return 
	endIf
	if storageutil.GetIntValue(Mother as form, "FW.Abortus", 0) > 1
		return 
	endIf
	Int S = storageutil.GetIntValue(Mother as form, "FW.CurrentState", 0)
	if S < 4 && S == 8
		return 
	endIf
	Float hp = storageutil.GetFloatValue(Mother as form, "FW.UnbornHealth", 100.000)
	if Damage > 0.000000
		Damage *= System.Manager.ActorBabyDamageScale(Mother)
	else
		Damage *= System.Manager.ActorBabyHealingScale(Mother)
	endIf
	if Damage > 0.000000
		if System.cfg.Difficulty == 0
			Damage *= 0.400000
		elseIf System.cfg.Difficulty == 1
			Damage *= 0.700000
		elseIf System.cfg.Difficulty == 3
			Damage *= 1.30000
		elseIf System.cfg.Difficulty == 4
			Damage *= 1.70000
		endIf
	endIf
	if hp - Damage < 0.000000
		hp = 0.000000
	elseIf hp - Damage > 100.000
		hp = 100.000
	else
		hp -= Damage
	endIf
	storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", hp)
	if game.GetPlayer() == Mother
		System.Player.checkAbortus()
		System.BabyHealthWidget.showTimed(Mother as Bool)
	else
		self.SendModEvent("BeeingFemale", "checkAbortus", Mother.GetFormID() as Float)
	endIf
endFunction

function Impregnate(actor Mother, actor Father, Int NumChilds)

	System.Trace("FWController.Impregnate", Mother)
	if Mother != game.GetPlayer() && System.cfg.NPCCanBecomePregnant == false
		return 
	endIf
	if !System.CheckIsLoreFriendlyMetting(Mother, Father)
		return 
	endIf
	actor[] f = fwutility.ActorArray(NumChilds)
	Int i = 0
	while i < NumChilds
		f[i] = Father
		i += 1
	endWhile
	self.ImpregnateA(Mother, f, NumChilds)
endFunction

actor[] function GetRelevantSpermActorsTimed(actor woman, Float Time, Bool bShowTravelingSperm, Bool bSort)

	actor[] actors
	System.Trace("FWController.GetRelevantSpermActorsTimed", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Int c = storageutil.FormListCount(woman as form, "FW.SpermName")
	Bool bFirst = true
	if c == 0
		return actors
	endIf
	if bSort == false || c == 1
		while c > 0
			c -= 1
			Float STime = storageutil.FloatListGet(woman as form, "FW.SpermTime", c)
			actor SName = storageutil.FormListGet(woman as form, "FW.SpermName", c) as actor
			Float SAmou = storageutil.FloatListGet(woman as form, "FW.SpermAmount", c)
			Float maxSDuration = System.getMaleSpermDuration(SName)
			if STime + maxSDuration > Time && (STime + System.cfg.WashOutHourDelay < Time || bShowTravelingSperm == true) && SAmou >= self.Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
				if bFirst == true
					actors = new actor[1]
					actors[0] = SName
					bFirst = false
				else
					actors = fwutility.ActorArrayAppend(actors, SName, 1)
				endIf
			endIf
		endWhile
	else
		Float[] actorr
		while c > 0
			c -= 1
			Float stime = storageutil.FloatListGet(woman as form, "FW.SpermTime", c)
			actor sname = storageutil.FormListGet(woman as form, "FW.SpermName", c) as actor
			Float samou = storageutil.FloatListGet(woman as form, "FW.SpermAmount", c)
			Float maxsduration = System.getMaleSpermDuration(sname)
			if stime + maxsduration > Time && (stime + System.cfg.WashOutHourDelay < Time || bShowTravelingSperm == true) && samou >= self.Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, sname)
				Float SpermDurationPercent = (Time - stime) / maxsduration
				Float xScale = 1.00000
				if SpermDurationPercent > 0.650000
					xScale -= SpermDurationPercent - 0.650000
				endIf
				if bFirst == true
					actors = new actor[1]
					actors[0] = sname
					actorr = new Float[1]
					actorr[0] = System.GetSpermRelevance(woman, sname) * samou * xScale
					bFirst = false
				else
					actors = fwutility.ActorArrayAppend(actors, sname, 1)
					actorr = fwutility.FloatArrayAppend(actorr, System.GetSpermRelevance(woman, sname) * samou * xScale)
				endIf
			endIf
		endWhile
		Int bi = 1
		Int bc = actors.length
		Bool bl = true
		while bi <= bc && bl
			bl = false
			Int bj = 0
			while bj < bc - 1
				if actorr[bj + 1] > actorr[bj]
					actor ba = actors[bj]
					actors[bj] = actors[bj + 1]
					actors[bj + 1] = ba
					Float bf = actorr[bj]
					actorr[bj] = actorr[bj + 1]
					actorr[bj + 1] = bf
					bl = true
				endIf
				bj += 1
			endWhile
			bi += 1
		endWhile
	endIf
	return actors
endFunction

Int function getNumBabys(actor Mother)

	return storageutil.GetIntValue(Mother as form, "FW.NumChilds", 0)
endFunction

Int function setCanBecomePMS(actor woman, Bool bActive)

	System.Trace("FWController.setCanBecomePMS", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	Int flag = storageutil.GetIntValue(woman as form, "FW.Flags", 0)
	if math.LogicalAnd(flag, 2) == 2 && bActive == false
		flag -= 2
	elseIf math.LogicalAnd(flag, 2) != 2 && bActive == true
		flag += 2
	endIf
	storageutil.SetIntValue(woman as form, "FW.Flags", flag)
	return flag
endFunction

Bool function IsPaused(actor woman)

	System.Trace("FWController.IsPaused", woman)
	return storageutil.GetFloatValue(woman as form, "FW.PauseTime", 0.000000) > 0.000000
endFunction

Float function AddContraception(actor woman, Float value)

	return self.AddContraceptionTimed(woman, utility.GetCurrentGameTime(), value)
endFunction

function ImpregnateA(actor Mother, actor[] Fathers, Int NumChilds)

	System.Trace("FWController.ImpregnateA", Mother)
	if Mother != game.GetPlayer() && System.cfg.NPCCanBecomePregnant == false
		return 
	endIf
	Int cSperm = Fathers.length
	Int xNumChilds = NumChilds
	if xNumChilds <= 0
		xNumChilds = System.calculateNumChildren(game.GetPlayer())
	endIf
	storageutil.FormListClear(Mother as form, "FW.ChildFather")
	storageutil.SetIntValue(Mother as form, "FW.NumChilds", xNumChilds)
	while xNumChilds > 0
		xNumChilds -= 1
		actor tFather = Fathers[utility.RandomInt(0, cSperm - 1)]
		if System.CheckIsLoreFriendlyMetting(Mother, tFather)
			storageutil.FormListAdd(Mother as form, "FW.ChildFather", tFather as form, true)
		endIf
	endWhile
	storageutil.SetFloatValue(Mother as form, "FW.UnbornHealth", 100.000)
	storageutil.UnsetIntValue(Mother as form, "FW.Abortus")
	System.Manager.OnImpregnate(Mother, NumChilds, Fathers)
	self.ChangeState(Mother, 4)
endFunction

; Skipped compiler generated GotoState

actor[] function GetRelevantSpermActors(actor woman, Bool bShowTravelingSperm, Bool bSort)

	System.Trace("FWController.GetRelevantSpermActors", woman)
	return self.GetRelevantSpermActorsTimed(woman, utility.GetCurrentGameTime(), bShowTravelingSperm, bSort)
endFunction

Int function setAutoFlag(actor woman)

	return self.setFlag(woman, System.canBecomePregnant(woman), System.canBecomePMS(woman))
endFunction

Float function GetStateEnterTime(actor woman)

	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		self.CreateFemaleActor(woman, false)
	endIf
	return storageutil.GetFloatValue(woman as form, "FW.StateEnterTime", 0.000000)
endFunction

function RemoveSperm(actor woman, actor PotentialFather)

	System.Trace("FWController.RemoveSperm", woman)
	if storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) < 0
		return 
	endIf
	Int c = storageutil.FormListCount(woman as form, "FW.SpermName")
	while c > 0
		c -= 1
		if storageutil.FormListGet(woman as form, "FW.SpermName", c) == PotentialFather as form
			storageutil.FormListRemoveAt(woman as form, "FW.SpermName", c)
			storageutil.FloatListRemoveAt(woman as form, "FW.SpermTime", c)
			storageutil.FloatListRemoveAt(woman as form, "FW.SpermAmount", c)
		endIf
	endWhile
endFunction

Float function SetContraception(actor woman, Float value)

	return self.SetContraceptionTimed(woman, utility.GetCurrentGameTime(), value)
endFunction

Bool function CreateFemaleActor(actor woman, Bool force_new)

	System.Trace("FWController.CreateFemaleActor", woman)
	if System.CloakingSpellEnabled.GetValueInt() != 1 || System.ModEnabled.GetValueInt() != 1
		return false
	endIf
	if woman == none
		return false
	endIf
	if System.IsValidateFemaleActor(woman, false) <= 0
		return false
	endIf
	Bool hasSaved = storageutil.FormListFind(none, "FW.SavedNPCs", woman as form) >= 0
	if hasSaved == true && force_new == false
		return true
	endIf
	System.Message("Creating new woman stats for: " + woman.GetLeveledActorBase().GetName(), System.MSG_All, 0)
	Int stateID = utility.RandomInt(0, 3)
	Float currentTime = utility.GetCurrentGameTime()
	Float stateDuration = System.GetStateDuration(stateID, woman)
	Float stateEnterTime = currentTime - utility.RandomFloat(0.000000, stateDuration - 0.500000)
	if woman == game.GetPlayer()
		stateID = 0
		stateEnterTime = currentTime - utility.RandomFloat(0.000000, stateDuration / 2.00000)
	endIf
	Int flag = 0
	if System.canBecomePregnant(woman)
		flag += 1
	endIf
	if System.canBecomePMS(woman)
		flag += 2
	endIf
	storageutil.SetIntValue(woman as form, "FW.CurrentState", stateID)
	storageutil.SetFloatValue(woman as form, "FW.StateEnterTime", stateEnterTime)
	storageutil.SetFloatValue(woman as form, "FW.LastUpdate", currentTime)
	storageutil.SetIntValue(woman as form, "FW.Flags", flag)
	if hasSaved == false || force_new == true
		storageutil.FormListAdd(none, "FW.SavedNPCs", woman as form, true)
	endIf
	return true
endFunction

Int function RelevantSpermCount(actor woman, Bool bShowTravelingSperm)

	System.Trace("FWController.RelevantSpermCount", woman)
	return self.RelevantSpermCountTimed(woman, utility.GetCurrentGameTime(), bShowTravelingSperm)
endFunction

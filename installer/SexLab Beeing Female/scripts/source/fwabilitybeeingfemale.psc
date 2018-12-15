;/ Decompiled by Champollion V1.0.1
Source   : FWAbilityBeeingFemale.psc
Modified : 2017-01-18 07:35:31
Compiled : 2017-01-18 08:36:45
User     : admin
Computer : PATRICK
/;
scriptName FWAbilityBeeingFemale extends FWAbilityBeeingBase

;-- Properties --------------------------------------
Int property abortus = 0 auto hidden
Float property stateDamageScale = 1.00000 auto hidden
Bool property canBecomePregnantThisCycle = false auto hidden
Float property UnbornHealth = 0.000000 auto hidden
Float[] property BaseBellySize auto hidden
Float property stateEnterTime auto hidden
Float property LH = 0.000000 auto hidden
Float property UpdateDelay = 0.000000 auto hidden
Float property BaseWeight auto hidden
Int property nextState = 1 auto hidden
Float property AbortusTime = 0.000000 auto hidden
fwtextcontents property Contents auto
Int property LaborPainsStep = 0 auto
Bool property canBecomePMSThisCycle = false auto hidden
Int property NumChilds = 0 auto hidden
Float property PauseStartTime = 0.000000 auto hidden
Int property currentState = 0 auto hidden
Float[] property BaseBreastSize auto hidden

;-- Variables ---------------------------------------
Float oldUpdateDelay = 0.000000
Float SleepingStart
Bool Abortus_Fiber = false
Float AddedBreastSize = 0.000000
Bool Abortus_Infection = false
Float ContraceptionPill = 0.000000
Float LastBabyHealing
Bool bHasPMS = false
Float StateDaysRemaining = 0.000000
Float AddedBellySize = 0.000000
Int lastTypeOfScaling = -1
Float ContraceptionTime = 0.000000
Float SitStart
Form[] dropedItems
Float AddedWeight = 0.000000
Float CurrentStatePercent = 0.000000
Float _onUpdateGameTimeDelay = 1.00000

;-- Functions ---------------------------------------

function BeeingFemale(String eventName, String strArg, Float numArg, Form sender)

	if eventName == "BeeingFemale"
		if strArg == "TestScale" && (sender == ActorRef as Form || sender as Actor == none)
			debug.Notification("Test Scaling for " + ActorRef.GetLeveledActorBase().GetName())
			self.TestScale(numArg)
		elseIf numArg == ActorRef.GetFormID() as Float || sender == ActorRef as Form
			if strArg == "CheckAbortus"
				self.CheckAbortus()
			elseIf strArg == "Update"
				self.InitValues()
			elseIf strArg == "Belly"
				self.SetBelly(true)
			elseIf strArg == "Birth"
				self.SetBelly(true)
			elseIf strArg == "ConceptionChance"
				if numArg == 1.00000 && IsPlayer == true || numArg == 2.00000 && IsFollower == true || numArg == 3.00000 && IsFollower == false
					System.Controller.setAutoFlag(ActorRef)
				endIf
			elseIf strArg == "Dispel"
				self.Dispel()
			endIf
		endIf
	endIf
endFunction

function onPotionFunction(potion Item)

	; Empty function
endFunction

; Skipped compiler generated GetState

function CheckRandomSexPartner()

	; Empty function
endFunction

function TestScale(Float Scale)

	if System.cfg.VisualScaling == 1
		if lastTypeOfScaling == 2
			self.UpdateNodes2(0.000000, 0.000000)
		elseIf lastTypeOfScaling == 3
			self.UpdateWeight(0.000000)
		elseIf lastTypeOfScaling == 4
			
		endIf
		self.UpdateNodes(Scale * System.cfg.BellyMaxScale, Scale * System.cfg.BreastsMaxScale)
	elseIf System.cfg.VisualScaling == 2
		if lastTypeOfScaling == 1
			self.UpdateNodes(0.000000, 0.000000)
		elseIf lastTypeOfScaling == 3
			self.UpdateWeight(0.000000)
		elseIf lastTypeOfScaling == 4
			
		endIf
		self.UpdateNodes2(Scale * System.cfg.BellyMaxScale, Scale * System.cfg.BreastsMaxScale)
	elseIf System.cfg.VisualScaling == 3
		if lastTypeOfScaling == 1
			self.UpdateNodes(0.000000, 0.000000)
		elseIf lastTypeOfScaling == 2
			self.UpdateNodes2(0.000000, 0.000000)
		elseIf lastTypeOfScaling == 4
			
		endIf
		Float MaxAdditionalWeight = fwutility.MinFloat(System.cfg.WeightGainMax as Float, 100.000 - BaseWeight)
		Float addWeight = Scale * MaxAdditionalWeight
		self.UpdateWeight(addWeight)
	endIf
	utility.Wait(10.0000)
	debug.Notification("Reset Belly for " + ActorRef.GetLeveledActorBase().GetName())
	self.SetBelly(true)
endFunction

function EquipNapkin()

	if System.GlobalMenstruating.GetValueInt() == 1
		if ActorRef.GetItemCount(System.Sanitary_Napkin_Normal as Form) > 1 && ActorRef.IsEquipped(System.Sanitary_Napkin_Normal as Form) == false
			Form ax = ActorRef.GetWornForm(System.Sanitary_Napkin_Normal.GetSlotMask())
			if ax != none
				ActorRef.UnEquipItem(ax, false, false)
			endIf
			ActorRef.EquipItem(System.Sanitary_Napkin_Bloody as Form, false, true)
		endIf
	endIf
endFunction

function OnPlayerLoadGame()

	Float startTime = utility.GetCurrentGameTime()
	if bInit == true && bInitSpell == true && self as activemagiceffect != none && self.isFormValid()
		utility.WaitMenuMode(2.00000)
		self.SetBelly(false)
		self.RegisterForSingleUpdate(5.00000)
		self.UnregisterForModEvent("BeeingFemale")
		self.RegisterForModEvent("BeeingFemale", "BeeingFemale")
		if oldUpdateDelay > 0.000000
			self.RegisterForSingleUpdateGameTime(oldUpdateDelay)
		else
			self.InitState()
		endIf
		self.getLastSeenNPCs()
	endIf
	System.Message("FWAbilityBeeingFemale::OnPlayerLoadGame() " + (utility.GetCurrentRealTime() - startTime) as String + " sec", System.MSG_All, System.MSG_Trace)
endFunction

function InitState()

	Int ObjectiveID
	String StateName
	Bool bStateFound = true
	if currentState == 0
		UpdateDelay = 4.00000
		StateName = "Follicular_State"
		ObjectiveID = 0
		nextState = 1
	elseIf currentState == 1
		UpdateDelay = 1.00000
		StateName = "Ovulation_State"
		ObjectiveID = 1
		nextState = 2
	elseIf currentState == 2
		UpdateDelay = 1.00000
		StateName = "Luteal_State"
		ObjectiveID = 2
		nextState = 3
	elseIf currentState == 3
		UpdateDelay = 1.00000
		StateName = "Menstruation_State"
		ObjectiveID = 3
		nextState = 0
	elseIf currentState == 4
		UpdateDelay = 3.00000
		StateName = "PregnancyFirst_State"
		ObjectiveID = 4
		nextState = 5
	elseIf currentState == 5
		UpdateDelay = 3.00000
		StateName = "PregnancySecond_State"
		ObjectiveID = 5
		nextState = 6
	elseIf currentState == 6
		UpdateDelay = 1.00000
		StateName = "PregnancyThird_State"
		ObjectiveID = 6
		nextState = 7
	elseIf currentState == 7
		UpdateDelay = 0.200000
		StateName = "LaborPains_State"
		ObjectiveID = 7
		nextState = 8
	elseIf currentState == 8
		UpdateDelay = 1.00000
		StateName = "Replanish_State"
		ObjectiveID = 8
		nextState = 0
	else
		bStateFound = false
	endIf
	if IsPlayer
		System.GlobalPlayerState.SetValue(currentState as Float)
	endIf
	if self as activemagiceffect != none
		if oldUpdateDelay != UpdateDelay && bInit == true && bInitSpell == true
			self.UnregisterForUpdateGameTime()
			if UpdateDelay > 0.000000 && System.cfg.PlayerTimer
				self.RegisterForUpdateGameTime(UpdateDelay)
			endIf
			oldUpdateDelay = UpdateDelay
		endIf
		if bStateFound
			self.onExitState()
			stateEnterTime = utility.GetCurrentGameTime()
			CurrentStatePercent = 0.000000
			StateDaysRemaining = System.getStateDuration(currentState, ActorRef)
			self.GotoState(StateName)
			self.castStateSpell()
			self.onEnterState()
			System.raiseModEvent("stateChanged", self)
		else
			System.Message(fwutility.StringReplace(Contents.StateNotFound, "{0}", StateName), System.MSG_Error, 0)
		endIf
	endIf
endFunction

function changeState(Int newState)

	if abortus > 1 && (newState == 4 || newState == 5 || newState == 6) || abortus > 2 && newState == 7
		return 
	endIf
	currentState = newState
	storageutil.SetIntValue(ActorRef as Form, "FW.CurrentState", currentState)
	storageutil.SetFloatValue(ActorRef as Form, "FW.StateEnterTime", utility.GetCurrentGameTime())
	storageutil.SetFloatValue(ActorRef as Form, "FW.LastUpdate", utility.GetCurrentGameTime())
	self.InitState()
endFunction

function onCastSpellFunction(spell SpellID)

	; Empty function
endFunction

function OnUpdateGameTime()

	Float startTime = utility.GetCurrentGameTime()
	Float currentTime = utility.GetCurrentGameTime()
	if System.IsActorPregnantByChaurus(ActorRef)
		System.Controller.Pause(ActorRef, true)
		self.GotoState("PregnantChaurus_State")
		self.RegisterForSingleUpdateGameTime(oldUpdateDelay)
		return 
	endIf
	self.GetStorageVariable()
	Float stateDuration = System.getStateDuration(currentState, ActorRef)
	if stateDuration > 0.000000
		CurrentStatePercent = (currentTime - stateEnterTime) * 100.000 / stateDuration
		StateDaysRemaining = stateDuration - currentTime - stateEnterTime
		if currentTime >= stateEnterTime + stateDuration
			self.changeState(nextState)
		endIf
		System.Manager.onUpdateFunction(ActorRef, currentState, CurrentStatePercent)
	else
		CurrentStatePercent = 0.000000
		System.Manager.onUpdateFunction(ActorRef, currentState, 0.000000)
	endIf
	if IsPlayer
		System.Message("OnUpdateGameTime " + ActorRef.GetLeveledActorBase().GetName() + ": " + currentState as String + " at " + CurrentStatePercent as String + "% (Dur: " + stateDuration as String + ")", System.MSG_Debug, 0)
	else
		System.Message("OnUpdateGameTime " + ActorRef.GetLeveledActorBase().GetName() + ": " + currentState as String + " at " + CurrentStatePercent as String + "% (Dur: " + stateDuration as String + ")", System.MSG_All, 0)
	endIf
	if currentState >= 4 && currentState < 20
		self.SetBelly(false)
		self.AbortusPains()
	endIf
	if IsPlayer
		if System.Player == none
			System.Player = self
			System.PlayerMale = none
		endIf
		System.GlobalPlayerState.SetValue(currentState as Float)
		System.GlobalPlayerStatePercent.SetValue(CurrentStatePercent)
	endIf
	if !IsPlayer && currentState < 4 && ActorRef.Is3DLoaded()
		if NumChilds > 0
			System.InstantBornChilds(ActorRef)
			NumChilds = 0
		endIf
	endIf
	self.onUpdateFunction()
	System.Message("FWAbilityBeeingFemale::OnUpdateGameTime(" + ActorRef.GetLeveledActorBase().GetName() + ") " + (utility.GetCurrentRealTime() - startTime) as String + " sec", System.MSG_All, System.MSG_Trace)
	self.RegisterForSingleUpdateGameTime(oldUpdateDelay)
endFunction

function EquipTampon()

	if System.GlobalMenstruating.GetValueInt() == 1
		if ActorRef.GetItemCount(System.Tampon_Normal as Form) > 1 && ActorRef.IsEquipped(System.Tampon_Normal as Form) == false
			Form ax = ActorRef.GetWornForm(System.Tampon_Normal.GetSlotMask())
			if ax != none
				ActorRef.UnEquipItem(ax, false, false)
			endIf
			ActorRef.EquipItem(System.Tampon_Bloody as Form, false, true)
		endIf
	endIf
endFunction

function OnSpellCast(Form akSpell)

	if akSpell as spell != none
		self.onCastSpellFunction(akSpell as spell)
	elseIf akSpell as potion != none
		potion p = akSpell as potion
		self.onPotionFunction(p)
	endIf
	if System.BadSpellList as Bool && System.BadSpellList.Find(akSpell) > 0 && currentState >= 4 && currentState < 20
		if IsPlayer
			System.Message(fwutility.StringReplace(Contents.AlcoholNotGoodForYourBaby, "{0}", ActorRefBase.GetName()), System.MSG_Low, 0)
		else
			System.Message(fwutility.StringReplace(Contents.AlcoholNotGoodForNPCBaby, "{0}", ActorRefBase.GetName()), System.MSG_High, 0)
		endIf
		System.Controller.DamageBaby(ActorRef, 8.00000)
	endIf
	parent.OnSpellCast(akSpell)
endFunction

function OnSleepStop(Bool abInterrupted)

	if SleepingStart > 0.000000
		Float SleepDur = utility.GetCurrentGameTime() - SleepingStart
		System.Controller.HealBaby(ActorRef, SleepDur * 1.30000)
	endIf
	SleepingStart = 0.000000
	parent.OnSleepStop(abInterrupted)
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)

	if bInitSpell == true && self.isFormValid()
		self.ResetBelly()
		self.onExitState()
	endIf
	parent.DispelEffectIfAble()
endFunction

function OnUpdate()

	if ActorRef.IsSwimming()
		System.Controller.WashOutSperm(ActorRef, 1, 0.800000)
	endIf
	if self as FWAbilityBeeingFemale != none
		parent.OnUpdate()
		self.RegisterForSingleUpdate(5.00000)
	endIf
endFunction

; Skipped compiler generated GotoState

function InitValues()

	System.Data.Update(ActorRef)
	self.GetStorageVariable()
	self.InitState()
endFunction

function GetStorageVariable()

	stateEnterTime = storageutil.GetFloatValue(ActorRef as Form, "FW.StateEnterTime", utility.GetCurrentGameTime())
	currentState = storageutil.GetIntValue(ActorRef as Form, "FW.CurrentState", 0)
	UnbornHealth = storageutil.GetFloatValue(ActorRef as Form, "FW.UnbornHealth", 100.000)
	NumChilds = storageutil.GetIntValue(ActorRef as Form, "FW.NumChilds", 0)
	AbortusTime = storageutil.GetFloatValue(ActorRef as Form, "FW.AbortusTime", 0.000000)
	abortus = storageutil.GetIntValue(ActorRef as Form, "FW.Abortus", 0)
endFunction

Bool function isFormValid()

	return ActorRef as Form != none && ActorRefBase as actorbase != none
endFunction

function onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	self.onHitFunction(akAggressor, akSource, akProjectile, abPowerAttack, abSneakAttack, abBashAttack, abHitBlocked)
	parent.onHit(akAggressor, akSource, akProjectile, abPowerAttack, abSneakAttack, abBashAttack, abHitBlocked)
endFunction

function addLastSeenNPC(Actor a)

	if System.IsValidateMaleActor(a, false) > 0 && !a.GetRace().HasKeywordString("ActorTypeCreature")
		Int pos = storageutil.FormListFind(ActorRef as Form, "FW.LastSeenNPCs", a as Form)
		if pos == -1
			storageutil.FormListAdd(ActorRef as Form, "FW.LastSeenNPCs", a as Form, true)
			storageutil.FloatListAdd(ActorRef as Form, "FW.LastSeenNPCsTime", utility.GetCurrentGameTime(), true)
		else
			storageutil.FloatListSet(ActorRef as Form, "FW.LastSeenNPCsTime", pos, utility.GetCurrentGameTime())
		endIf
	endIf
endFunction

Float function timeRemaining()

	if System.getStateDuration(currentState, ActorRef) > 0.000000
		return System.getStateDuration(currentState, ActorRef) - utility.GetCurrentGameTime() - stateEnterTime
	else
		return utility.GetCurrentGameTime() - stateEnterTime
	endIf
endFunction

function AbortusPains()

	if System.cfg.abortus == false
		return 
	endIf
	if abortus > 0
		Float Abortus_DamageScale = System.getDamageScale(5, ActorRef)
		if abortus == 2 && utility.RandomInt(0, 10) > 6
			System.Blur(utility.RandomFloat(0.300000, 1.00000), System.iModPainLow)
		elseIf abortus == 3 && utility.RandomInt(0, 10) > 3
			System.Blur(utility.RandomFloat(0.400000, 1.00000), System.iModPainMiddle)
			System.PlayPainSound(ActorRef, 30.0000)
			System.DoDamage(ActorRef, 3.00000 * Abortus_DamageScale, 14, 0.000000)
		elseIf abortus == 4 && utility.RandomInt(0, 10) > 7
			System.Blur(utility.RandomFloat(0.400000, 0.800000), System.iModPainMiddle)
			System.PlayPainSound(ActorRef, 30.0000)
			System.DoDamage(ActorRef, 2.00000 * Abortus_DamageScale, 14, 0.000000)
		elseIf abortus == 5 && utility.RandomInt(0, 10) > 5
			System.Blur(utility.RandomFloat(0.400000, 0.800000), System.iModPainMiddle)
			System.PlayPainSound(ActorRef, 30.0000)
			System.DoDamage(ActorRef, 4.00000 * Abortus_DamageScale, 14, 0.000000)
		elseIf abortus == 6 && utility.RandomInt(0, 10) > 4
			if utility.RandomInt(0, 10) > 7
				System.Blur(utility.RandomFloat(0.400000, 0.600000), System.iModPainHigh)
			else
				System.Blur(utility.RandomFloat(0.400000, 0.800000), System.iModPainMiddle)
			endIf
			System.PlayPainSound(ActorRef, 30.0000)
			System.DoDamage(ActorRef, 2.00000 * Abortus_DamageScale, 14, 0.000000)
			utility.Wait(5.00000)
		endIf
		if Abortus_Fiber == true
			fwutility.ActorAddSpell(ActorRef, System.FeverSpell, false, false)
		endIf
		if Abortus_Infection == true
			fwutility.ActorAddSpell(ActorRef, System.InfectionSpell, false, false)
		endIf
		if System.GlobalMenstruating.GetValueInt() == 1
			if utility.RandomInt(0, 10) > 8
				fwutility.ActorAddSpell(ActorRef, System.Effect_VaginalBloodHigh, false, false)
			else
				fwutility.ActorAddSpell(ActorRef, System.Effect_VaginalBloodLow, false, false)
			endIf
		endIf
		utility.Wait(1.00000)
		self.CheckAbortus()
	endIf
endFunction

function OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	System.Manager.OnMagicEffectApply(ActorRef, akCaster, akEffect)
endFunction

function UpdateNodes(Float afAddedBellySize, Float afAddedBreastSize)

	if ActorRef != none
		if BaseBellySize.length == 2 && System.cfg.BellyScale == true
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC Belly", true)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC Belly", afAddedBellySize + BaseBellySize[0], true)
			endIf
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC Belly", false)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC Belly", afAddedBellySize + BaseBellySize[1], false)
			endIf
			AddedBellySize = afAddedBellySize
		endIf
		if BaseBreastSize.length == 8 && System.cfg.BreastScale == true
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC L Breast", true)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC L Breast", afAddedBreastSize + BaseBreastSize[0], true)
			endIf
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC L Breast", false)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC L Breast", afAddedBreastSize + BaseBreastSize[1], false)
			endIf
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC R Breast", true)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC R Breast", afAddedBreastSize + BaseBreastSize[2], true)
			endIf
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC R Breast", false)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC R Breast", afAddedBreastSize + BaseBreastSize[3], false)
			endIf
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC L Breast01", true)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC L Breast01", afAddedBreastSize + BaseBreastSize[4], true)
			endIf
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC L Breast01", false)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC L Breast01", afAddedBreastSize + BaseBreastSize[5], false)
			endIf
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC R Breast01", true)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC R Breast01", afAddedBreastSize + BaseBreastSize[6], true)
			endIf
			if netimmerse.HasNode(ActorRef as ObjectReference, "NPC R Breast01", false)
				netimmerse.SetNodeScale(ActorRef as ObjectReference, "NPC R Breast01", afAddedBreastSize + BaseBreastSize[7], false)
			endIf
			AddedBreastSize = afAddedBreastSize
		endIf
		if !ActorRef.IsOnMount()
			ActorRef.QueueNiNodeUpdate()
		endIf
	endIf
endFunction

function onHitFunction(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	; Empty function
endFunction

function onUpdateFunction()

	; Empty function
endFunction

function SetBelly(Bool bForce)

	Float startTime = utility.GetCurrentGameTime()
	if (currentState < 4 || currentState >= 20) && bForce == false
		return 
	endIf
	if System.cfg.VisualScaling > 0
		Int stateID = currentState
		Float ScaleBelly = 0.000000
		Float ScaleBreast = 0.000000
		if stateID == 4
			ScaleBelly = System.GetPhaseScale(0, 0) * CurrentStatePercent / 100.000
			ScaleBreast = System.GetPhaseScale(1, 0) * CurrentStatePercent / 100.000
		elseIf stateID == 5
			ScaleBelly = System.GetPhaseScale(0, 0) + System.GetPhaseScale(0, 1) * CurrentStatePercent / 100.000
			ScaleBreast = System.GetPhaseScale(1, 0) + System.GetPhaseScale(1, 1) * CurrentStatePercent / 100.000
		elseIf stateID == 6
			ScaleBelly = System.GetPhaseScale(0, 0) + System.GetPhaseScale(0, 1) + System.GetPhaseScale(0, 2) * CurrentStatePercent / 100.000
			ScaleBreast = System.GetPhaseScale(0, 0) + System.GetPhaseScale(1, 1) + System.GetPhaseScale(1, 2) * CurrentStatePercent / 100.000
		elseIf stateID == 7
			ScaleBelly = 1.00000
			ScaleBreast = 1.00000
		elseIf stateID == 8
			ScaleBelly = fwutility.MaxFloat(0.000000, (33.0000 - CurrentStatePercent) / 100.000)
			ScaleBreast = fwutility.MaxFloat(0.000000, (100.000 - CurrentStatePercent) / 100.000)
		endIf
		if NumChilds > 1 && stateID < 8
			ScaleBelly *= math.Pow(1.15000, (NumChilds - 1) as Float)
			ScaleBreast *= math.Pow(1.08000, (NumChilds - 1) as Float)
		endIf
		if System.cfg.VisualScaling == 1
			if lastTypeOfScaling == 2
				self.UpdateNodes2(0.000000, 0.000000)
			elseIf lastTypeOfScaling == 3
				self.UpdateWeight(0.000000)
			elseIf lastTypeOfScaling == 4
				
			endIf
			self.UpdateNodes(ScaleBelly * System.cfg.BellyMaxScale, ScaleBreast * System.cfg.BreastsMaxScale)
		elseIf System.cfg.VisualScaling == 2
			if lastTypeOfScaling == 1
				self.UpdateNodes(0.000000, 0.000000)
			elseIf lastTypeOfScaling == 3
				self.UpdateWeight(0.000000)
			elseIf lastTypeOfScaling == 4
				
			endIf
			self.UpdateNodes2(ScaleBelly * System.cfg.BellyMaxScale, ScaleBreast * System.cfg.BreastsMaxScale)
		elseIf System.cfg.VisualScaling == 3
			if lastTypeOfScaling == 1
				self.UpdateNodes(0.000000, 0.000000)
			elseIf lastTypeOfScaling == 2
				self.UpdateNodes2(0.000000, 0.000000)
			elseIf lastTypeOfScaling == 4
				
			endIf
			Float MaxAdditionalWeight = fwutility.MinFloat(System.cfg.WeightGainMax as Float, 100.000 - BaseWeight)
			Float addWeight = ScaleBelly * MaxAdditionalWeight
			self.UpdateWeight(addWeight)
		endIf
		lastTypeOfScaling = System.cfg.VisualScaling
	elseIf lastTypeOfScaling != System.cfg.VisualScaling
		self.ResetBelly()
		lastTypeOfScaling = System.cfg.VisualScaling
	endIf
	System.Message("FWAbilityBeeingFemale::SetBelly(" + ActorRef.GetLeveledActorBase().GetName() + ") " + (utility.GetCurrentRealTime() - startTime) as String + " sec", System.MSG_All, System.MSG_Trace)
endFunction

function castAbortus(Float Strength, Bool AllowBleedOut)

	if System.cfg.abortus == false
		return 
	endIf
	if IsPlayer
		fwutility.LockPlayer()
	endIf
	Bool bIsVaginalBleedingEmitter = false
	System.Blur(1.00000, System.AbortusImod)
	utility.Wait(1.00000)
	if AllowBleedOut
		debug.SendAnimationEvent(ActorRef as ObjectReference, "IdleForceDefaultState")
		debug.SendAnimationEvent(ActorRef as ObjectReference, "BleedOutStart")
		utility.Wait(2.00000)
		if ActorRef.WornHasKeyword(keyword.GetKeyword("ArmorCuirass")) == false && ActorRef.WornHasKeyword(keyword.GetKeyword("ClothingBody"))
			fwutility.EquipItem(ActorRef, System.VaginalBleeding as Form)
			bIsVaginalBleedingEmitter = true
		endIf
	endIf
	System.Effect_VaginalBloodBig.Cast(ActorRef as ObjectReference, ActorRef as ObjectReference)
	Int i = utility.RandomInt(6, 9)
	Float Abortus_DamageScale = System.getDamageScale(5, ActorRef)
	while i > 0
		i -= 1
		System.PlayPainSound(ActorRef, 30.0000)
		System.DoDamage(ActorRef, Strength * Abortus_DamageScale, 14, 0.000000)
		utility.Wait(1.50000)
	endWhile
	if bIsVaginalBleedingEmitter == true
		fwutility.UnEquipItem(ActorRef, System.VaginalBleeding as Form)
		utility.Wait(2.00000)
	endIf
	if ActorRef == game.GetPlayer()
		System.Message(fwutility.StringReplace(Contents.YouHaveLostYourChild, "{0}", ActorRef.GetLeveledActorBase().GetName()), System.MSG_Immersive, 0)
		utility.Wait(1.00000)
	else
		System.Message(fwutility.StringReplace(Contents.NPCHasLostItsChild, "{0}", ActorRef.GetLeveledActorBase().GetName()), System.MSG_Immersive, 0)
	endIf
	if AllowBleedOut
		debug.SendAnimationEvent(ActorRef as ObjectReference, "BleedOutStop")
	endIf
	storageutil.SetIntValue(ActorRef as Form, "FW.NumChilds", 0)
	storageutil.UnsetFloatValue(ActorRef as Form, "FW.UnbornHealth")
	storageutil.FormListClear(ActorRef as Form, "FW.ChildFather")
	storageutil.UnsetFloatValue(ActorRef as Form, "FW.AbortusTime")
	storageutil.UnsetIntValue(ActorRef as Form, "FW.Abortus")
	utility.Wait(1.00000)
	if IsPlayer
		fwutility.UnlockPlayer()
	endIf
	self.changeState(8)
endFunction

function castStateSpell()

	Int i = 0
	if !ActorRef
		return 
	endIf
	while i <= 8
		if currentState == i
			if ActorRef.HasSpell(System.StatCycleID_List[i] as Form) == false
				ActorRef.AddSpell(System.StatCycleID_List[i], false)
			endIf
		elseIf ActorRef.HasSpell(System.StatCycleID_List[i] as Form)
			ActorRef.RemoveSpell(System.StatCycleID_List[i])
		endIf
		i += 1
	endWhile
	if currentState >= 0 && currentState < 4
		if ActorRef.HasSpell(System.StatMenstruationCycle as Form) == false
			ActorRef.AddSpell(System.StatMenstruationCycle, false)
		endIf
		if ActorRef.HasSpell(System.StatPregnancyCycle as Form)
			ActorRef.RemoveSpell(System.StatPregnancyCycle)
		endIf
	elseIf currentState >= 4 && currentState < 20
		if ActorRef.HasSpell(System.StatMenstruationCycle as Form)
			ActorRef.RemoveSpell(System.StatMenstruationCycle)
		endIf
		if ActorRef.HasSpell(System.StatPregnancyCycle as Form) == false
			ActorRef.AddSpell(System.StatPregnancyCycle, false)
		endIf
	else
		if ActorRef.HasSpell(System.StatMenstruationCycle as Form)
			ActorRef.RemoveSpell(System.StatMenstruationCycle)
		endIf
		if ActorRef.HasSpell(System.StatPregnancyCycle as Form)
			ActorRef.RemoveSpell(System.StatPregnancyCycle)
		endIf
	endIf
endFunction

function getLastSeenNPCs()

	Int Searches = 5
	Actor p = game.GetPlayer()
	Actor a = game.FindClosestActorFromRef(ActorRef as ObjectReference, 2500.00)
	if a != p
		self.addLastSeenNPC(a)
	endIf
	while Searches > 0
		Searches -= 1
		a = game.FindRandomActorFromRef(ActorRef as ObjectReference, 2500.00)
		if a != p
			self.addLastSeenNPC(a)
		endIf
	endWhile
	Int c = storageutil.FormListCount(ActorRef as Form, "FW.LastSeenNPCs")
	Float t = utility.GetCurrentGameTime()
	while c > 0
		c -= 1
		Float tt = storageutil.FloatListGet(ActorRef as Form, "FW.LastSeenNPCsTime", c)
		Actor ta = storageutil.FormListGet(ActorRef as Form, "FW.LastSeenNPCs", c) as Actor
		if ta == none || ta.IsDead()
			storageutil.FormListRemoveAt(ActorRef as Form, "FW.LastSeenNPCsTime", c)
			storageutil.FormListRemoveAt(ActorRef as Form, "FW.LastSeenNPCs", c)
		elseIf tt < t - 2.00000
			if !ActorRef.IsInLocation(ta.GetCurrentLocation())
				storageutil.FloatListRemoveAt(ActorRef as Form, "FW.LastSeenNPCsTime", c)
				storageutil.FormListRemoveAt(ActorRef as Form, "FW.LastSeenNPCs", c)
			endIf
		endIf
	endWhile
endFunction

function OnSit(ObjectReference akFurniture)

	SitStart = utility.GetCurrentGameTime()
endFunction

function UpdateWeight(Float afAddedWeight)

	Float NewWeight = fwutility.ClampFloat(BaseWeight + afAddedWeight, 0.000000, 100.000)
	Float NeckDelta = (ActorRefBase.GetWeight() - NewWeight) / 100.000
	if NeckDelta as Bool && !ActorRef.IsOnMount()
		ActorRefBase.SetWeight(NewWeight)
		ActorRef.UpdateWeight(NeckDelta)
		ActorRef.QueueNiNodeUpdate()
		AddedWeight = NewWeight - BaseWeight
	endIf
endFunction

function OnDeath(Actor akKiller)

	if ActorRef == game.GetPlayer()
		System.Controller.DamageBaby(ActorRef, 92.0000)
	else
		fwsaveload.Delete(ActorRef)
	endIf
	parent.OnDeath(akKiller)
endFunction

function OnGetUp(ObjectReference akFurniture)

	if SitStart > 0.000000
		Float SitDur = utility.GetCurrentGameTime() - SitStart
		System.Controller.HealBaby(ActorRef, SitDur * 0.500000)
	endIf
	SitStart = 0.000000
endFunction

function onEnterState()

	; Empty function
endFunction

function ResetBelly()

	if lastTypeOfScaling == 1
		self.UpdateNodes(0.000000, 0.000000)
	elseIf lastTypeOfScaling == 2
		self.UpdateNodes2(0.000000, 0.000000)
	elseIf lastTypeOfScaling == 3
		self.UpdateWeight(0.000000)
	endIf
endFunction

function OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)

	SleepingStart = utility.GetCurrentGameTime()
	parent.OnSleepStart(afSleepStartTime, afDesiredSleepEndTime)
endFunction

function castMentrualBlood()

	if !ActorRef || System.GlobalMenstruating.GetValueInt() != 1
		return 
	endIf
	if ActorRef.IsEquipped(System.Sanitary_Napkin_Normal as Form) || ActorRef.IsEquipped(System.Tampon_Normal as Form)
		if ActorRef.IsEquipped(System.Sanitary_Napkin_Normal as Form)
			if IsPlayer == true
				System.Message(System.Content.YourPantys, System.MSG_Low, 0)
				ActorRef.UnEquipItem(System.Sanitary_Napkin_Normal as Form, false, true)
				ActorRef.RemoveItem(System.Sanitary_Napkin_Normal as Form, 1, true, none)
				ActorRef.addItem(System.Sanitary_Napkin_Bloody as Form, 1, true)
				ActorRef.EquipItem(System.Sanitary_Napkin_Bloody as Form, false, true)
			else
				System.Message(fwutility.StringReplace(System.Content.NPCPantys, "{0}", ActorRef.GetLeveledActorBase().GetName()), System.MSG_Debug, 0)
				ActorRef.UnEquipItem(System.Sanitary_Napkin_Normal as Form, false, true)
				ActorRef.RemoveItem(System.Sanitary_Napkin_Normal as Form, 1, true, none)
				ActorRef.addItem(System.Sanitary_Napkin_Bloody as Form, 1, true)
				ActorRef.EquipItem(System.Sanitary_Napkin_Bloody as Form, false, true)
				utility.WaitGameTime(0.500000)
				self.EquipNapkin()
			endIf
		elseIf IsPlayer == true
			System.Message(System.Content.YourTampon, System.MSG_Low, 0)
			ActorRef.UnEquipItem(System.Tampon_Normal as Form, false, true)
			ActorRef.RemoveItem(System.Tampon_Normal as Form, 1, true, none)
			ActorRef.addItem(System.Tampon_Bloody as Form, 1, true)
			ActorRef.EquipItem(System.Tampon_Bloody as Form, false, true)
		else
			System.Message(fwutility.StringReplace(System.Content.NPCTampon, "{0}", ActorRef.GetLeveledActorBase().GetName()), System.MSG_Debug, 0)
			ActorRef.UnEquipItem(System.Tampon_Normal as Form, false, true)
			ActorRef.RemoveItem(System.Tampon_Normal as Form, 1, true, none)
			ActorRef.addItem(System.Tampon_Bloody as Form, 1, true)
			ActorRef.EquipItem(System.Tampon_Bloody as Form, false, true)
			utility.WaitGameTime(0.500000)
			self.EquipTampon()
		endIf
	elseIf utility.RandomInt(0, 10) > 8 && System.Effect_VaginalBloodHigh as Bool
		fwutility.ActorAddSpell(ActorRef, System.Effect_VaginalBloodHigh, false, true)
	elseIf System.Effect_VaginalBloodLow
		fwutility.ActorAddSpell(ActorRef, System.Effect_VaginalBloodLow, false, true)
	endIf
endFunction

function UpdateNodes2(Float afAddedBellySize, Float afAddedBreastSize)

	if ActorRef != none
		if System.cfg.BellyScale == true
			if afAddedBellySize > 0.000000
				nioverride.AddNodeTransformScale(ActorRef as ObjectReference, true, true, "NPC Belly", "BeeingFemale", afAddedBellySize + 1.00000)
				nioverride.AddNodeTransformScale(ActorRef as ObjectReference, false, true, "NPC Belly", "BeeingFemale", afAddedBellySize + 1.00000)
			else
				nioverride.RemoveNodeTransformScale(ActorRef as ObjectReference, true, true, "NPC Belly", "BeeingFemale")
				nioverride.RemoveNodeTransformScale(ActorRef as ObjectReference, false, true, "NPC Belly", "BeeingFemale")
			endIf
			nioverride.UpdateNodeTransform(ActorRef as ObjectReference, true, true, "NPC Belly")
			nioverride.UpdateNodeTransform(ActorRef as ObjectReference, false, true, "NPC Belly")
		endIf
		if System.cfg.BreastScale == true
			if afAddedBreastSize > 0.000000
				nioverride.AddNodeTransformScale(ActorRef as ObjectReference, true, true, "NPC L Breast", "BeeingFemale", afAddedBreastSize + 1.00000)
				nioverride.AddNodeTransformScale(ActorRef as ObjectReference, false, true, "NPC L Breast", "BeeingFemale", afAddedBreastSize + 1.00000)
				nioverride.AddNodeTransformScale(ActorRef as ObjectReference, true, true, "NPC R Breast", "BeeingFemale", afAddedBreastSize + 1.00000)
				nioverride.AddNodeTransformScale(ActorRef as ObjectReference, false, true, "NPC R Breast", "BeeingFemale", afAddedBreastSize + 1.00000)
				nioverride.UpdateNodeTransform(ActorRef as ObjectReference, true, true, "NPC L Breast")
				nioverride.UpdateNodeTransform(ActorRef as ObjectReference, false, true, "NPC R Breast")
			else
				nioverride.RemoveNodeTransformScale(ActorRef as ObjectReference, true, true, "NPC L Breast", "BeeingFemale")
				nioverride.RemoveNodeTransformScale(ActorRef as ObjectReference, false, true, "NPC L Breast", "BeeingFemale")
				nioverride.RemoveNodeTransformScale(ActorRef as ObjectReference, true, true, "NPC R Breast", "BeeingFemale")
				nioverride.RemoveNodeTransformScale(ActorRef as ObjectReference, false, true, "NPC R Breast", "BeeingFemale")
			endIf
			nioverride.UpdateNodeTransform(ActorRef as ObjectReference, true, true, "NPC L Breast")
			nioverride.UpdateNodeTransform(ActorRef as ObjectReference, false, true, "NPC L Breast")
			nioverride.UpdateNodeTransform(ActorRef as ObjectReference, true, true, "NPC R Breast")
			nioverride.UpdateNodeTransform(ActorRef as ObjectReference, false, true, "NPC R Breast")
		endIf
	endIf
endFunction

function GetBaseMeasurements(Bool bInitMeasurements)

	if bInitMeasurements || BaseBellySize.length != 2
		BaseBellySize = new Float[2]
		BaseBellySize[0] = 1.00000
		BaseBellySize[1] = 1.00000
	endIf
	if bInitMeasurements || BaseBreastSize.length != 8
		BaseBreastSize = new Float[8]
		BaseBreastSize[0] = 1.00000
		BaseBreastSize[1] = 1.00000
		BaseBreastSize[2] = 1.00000
		BaseBreastSize[3] = 1.00000
		BaseBreastSize[4] = 1.00000
		BaseBreastSize[5] = 1.00000
		BaseBreastSize[6] = 1.00000
		BaseBreastSize[7] = 1.00000
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC Belly", true)
		BaseBellySize[0] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC Belly", true)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC Belly", false)
		BaseBellySize[1] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC Belly", false)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC L Breast", true)
		BaseBreastSize[0] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC L Breast", true)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC L Breast", false)
		BaseBreastSize[1] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC L Breast", false)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC R Breast", true)
		BaseBreastSize[2] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC R Breast", true)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC R Breast", false)
		BaseBreastSize[3] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC R Breast", false)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC L Breast01", true)
		BaseBreastSize[4] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC L Breast01", true)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC L Breast01", false)
		BaseBreastSize[5] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC L Breast01", false)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC R Breast01", true)
		BaseBreastSize[6] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC R Breast01", true)
	endIf
	if netimmerse.HasNode(ActorRef as ObjectReference, "NPC R Breast01", false)
		BaseBreastSize[7] = netimmerse.GetNodeScale(ActorRef as ObjectReference, "NPC R Breast01", false)
	endIf
	BaseWeight = ActorRefBase.GetWeight()
	if !bInitMeasurements
		BaseBellySize[0] = BaseBellySize[0] - AddedBellySize
		BaseBellySize[1] = BaseBellySize[1] - AddedBellySize
		BaseBreastSize[0] = BaseBreastSize[0] - AddedBreastSize
		BaseBreastSize[1] = BaseBreastSize[1] - AddedBreastSize
		BaseBreastSize[2] = BaseBreastSize[2] - AddedBreastSize
		BaseBreastSize[3] = BaseBreastSize[3] - AddedBreastSize
		BaseBreastSize[4] = BaseBreastSize[4] - AddedBreastSize
		BaseBreastSize[5] = BaseBreastSize[5] - AddedBreastSize
		BaseBreastSize[6] = BaseBreastSize[6] - AddedBreastSize
		BaseBreastSize[7] = BaseBreastSize[7] - AddedBreastSize
		BaseWeight -= AddedWeight
	endIf
endFunction

function OnEffectStart(Actor target, Actor caster)

	Float startTime = utility.GetCurrentGameTime()
	ActorRef = target
	ActorRefBase = target.GetLeveledActorBase()
	IsPlayer = target == game.GetPlayer()
	if target == none || System.ModEnabled.GetValueInt() != 1
		ActorRef.RemoveSpell(System.BeeingFemaleSpell)
		ActorRef.DispelSpell(System.BeeingFemaleSpell)
		return 
	elseIf target.GetLeveledActorBase() == none
		ActorRef.RemoveSpell(System.BeeingFemaleSpell)
		ActorRef.DispelSpell(System.BeeingFemaleSpell)
		return 
	endIf
	if System.IsValidateFemaleActor(ActorRef, false) < 0
		ActorRef.RemoveSpell(System.BeeingFemaleSpell)
		ActorRef.DispelSpell(System.BeeingFemaleSpell)
		return 
	endIf
	if !System.NpcMentruation() && !IsPlayer
		System.Message(fwutility.StringReplace(Contents.BeeingFemaleMissedOn2, "{0}", ActorRefBase.GetName()), System.MSG_Debug, 0)
		ActorRef.RemoveSpell(System.BeeingFemaleSpell)
		ActorRef.DispelSpell(System.BeeingFemaleSpell)
		return 
	endIf
	if IsPlayer == true
		System.PlayerMale = none
		System.Player = self
	endIf
	IsFollower = target.IsInFaction(System.FollowerFaction) && IsPlayer == false
	self.GetBaseMeasurements(true)
	bInitSpell = true
	System.RegisterFWCache(self)
	if self as activemagiceffect != none
		(self as activemagiceffect).RegisterForUpdate(5.00000)
		(self as activemagiceffect).RegisterForModEvent("BeeingFemale", "BeeingFemale")
		(self as activemagiceffect).RegisterForSleep()
		if oldUpdateDelay > 0.000000
			(self as activemagiceffect).RegisterForUpdateGameTime(oldUpdateDelay)
		else
			self.InitState()
		endIf
	endIf
	self.equipChild()
	self.CheckRandomSexPartner()
	self.InitValues()
	if Contents != none
		System.Message(fwutility.StringReplace(Contents.BeeingFemaleCastedOn, "{0}", ActorRef.GetLeveledActorBase().GetName()), System.MSG_All, 0)
	endIf
	self.getLastSeenNPCs()
	parent.OnEffectStart(target, caster)
	System.Message("FWAbilityBeeingFemale::OnEffectStart(" + ActorRef.GetLeveledActorBase().GetName() + ") " + (utility.GetCurrentRealTime() - startTime) as String + " sec", System.MSG_All, System.MSG_Trace)
endFunction

function onExitState()

	; Empty function
endFunction

Bool function CheckAbortus()

	if System.cfg.abortus == false
		return false
	endIf
	if currentState < 4 && currentState == 8
		return false
	endIf
	Float hp = storageutil.GetFloatValue(ActorRef as Form, "FW.UnbornHealth", 100.000)
	NumChilds = storageutil.GetIntValue(ActorRef as Form, "FW.NumChilds", 0)
	AbortusTime = storageutil.GetFloatValue(ActorRef as Form, "FW.AbortusTime", 0.000000)
	abortus = storageutil.GetIntValue(ActorRef as Form, "FW.Abortus", 0)
	Float trimesterTimeDay = System.getStateDuration(currentState, ActorRef) / 89.0000
	if hp < 8.00000 && NumChilds > 0 && abortus <= 2
		if abortus == 0 && hp > 0.000000
			storageutil.SetIntValue(ActorRef as Form, "FW.Abortus", 1)
			storageutil.SetFloatValue(ActorRef as Form, "FW.AbortusTime", utility.GetCurrentGameTime())
		elseIf abortus == 0 && hp <= 0.000000
			storageutil.SetIntValue(ActorRef as Form, "FW.Abortus", 2)
			storageutil.SetFloatValue(ActorRef as Form, "FW.AbortusTime", utility.GetCurrentGameTime())
			storageutil.SetFloatValue(ActorRef as Form, "FW.UnbornHealth", 0.000000)
		elseIf abortus == 1 && utility.GetCurrentGameTime() - AbortusTime > trimesterTimeDay * 2.00000 && AbortusTime > 0.000000 && hp <= 4.00000
			storageutil.SetIntValue(ActorRef as Form, "FW.Abortus", 2)
			storageutil.SetFloatValue(ActorRef as Form, "FW.AbortusTime", utility.GetCurrentGameTime())
			storageutil.SetFloatValue(ActorRef as Form, "FW.UnbornHealth", 0.000000)
		elseIf abortus == 2 && utility.GetCurrentGameTime() - AbortusTime > trimesterTimeDay * 3.00000 && AbortusTime > 0.000000
			Int randomAbortus = utility.RandomInt(0, 50)
			Float infectChance = 0.000000
			Float fiberChance = 0.000000
			if randomAbortus < 13 && CurrentStatePercent < 14.0000 && currentState == 4
				storageutil.SetIntValue(ActorRef as Form, "FW.Abortus", 4)
				storageutil.SetFloatValue(ActorRef as Form, "FW.AbortusTime", utility.GetCurrentGameTime())
				fiberChance = 0.200000
				infectChance = 0.100000
			elseIf randomAbortus < 41 && currentState == 4
				storageutil.SetIntValue(ActorRef as Form, "FW.Abortus", 3)
				storageutil.SetFloatValue(ActorRef as Form, "FW.AbortusTime", utility.GetCurrentGameTime())
				fiberChance = 8.10000
				infectChance = 0.620000
			elseIf currentState == 4
				storageutil.SetIntValue(ActorRef as Form, "FW.Abortus", 5)
				storageutil.SetFloatValue(ActorRef as Form, "FW.AbortusTime", utility.GetCurrentGameTime())
				fiberChance = 0.350000
				infectChance = 0.210000
			elseIf currentState > 4 && currentState < 20
				storageutil.SetIntValue(ActorRef as Form, "FW.Abortus", 6)
				storageutil.SetFloatValue(ActorRef as Form, "FW.AbortusTime", utility.GetCurrentGameTime())
				fiberChance = 0.710000
				infectChance = 0.430000
			endIf
			Abortus_Fiber = fiberChance > utility.RandomFloat(0.000000, 1.00000)
			Abortus_Infection = infectChance > utility.RandomFloat(0.000000, 1.00000)
		endIf
		return true
	elseIf abortus == 3 && utility.GetCurrentGameTime() - AbortusTime > trimesterTimeDay * 12.0000 && AbortusTime > 0.000000
		self.castAbortus(5.00000, true)
		return true
	elseIf abortus == 4 && utility.GetCurrentGameTime() - AbortusTime > trimesterTimeDay * 11.0000 && AbortusTime > 0.000000
		self.castAbortus(3.00000, true)
		return true
	elseIf abortus == 5 && utility.GetCurrentGameTime() - AbortusTime > trimesterTimeDay * 13.0000 && AbortusTime > 0.000000
		self.castAbortus(4.00000, true)
		return true
	elseIf abortus == 6 && utility.GetCurrentGameTime() - AbortusTime > trimesterTimeDay * 16.0000 && AbortusTime > 0.000000
		self.castAbortus(4.00000, true)
		return true
	elseIf hp >= 10.0000 && abortus < 2
		storageutil.UnsetIntValue(ActorRef as Form, "FW.Abortus")
		storageutil.UnsetFloatValue(ActorRef as Form, "FW.AbortusTime")
	endIf
	return false
endFunction

;-- State -------------------------------------------
state pregnancythrid_state

	function onHitFunction(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

		if (abPowerAttack || abSneakAttack || abBashAttack) && !abHitBlocked
			System.Controller.DamageBaby(ActorRef, utility.RandomFloat(0.000000, 2.00000))
		endIf
	endFunction

	function onPotionFunction(potion p)

		Int c = p.GetNumEffects()
		while c > 0
			c -= 1
			if p.GetNthEffectMagicEffect(c).HasKeywordString("MagicAlchRestoreHealth")
				System.Controller.HealBaby(ActorRef, p.GetNthEffectMagnitude(c) / 10.0000)
			endIf
			if p.GetNthEffectMagicEffect(c).HasKeywordString("MagicAlchHarmful")
				System.Controller.DamageBaby(ActorRef, p.GetNthEffectMagnitude(c) / 10.0000)
			endIf
		endWhile
	endFunction

	function onExitState()

		fwutility.ActorRemoveSpell(ActorRef, System.Effect_Vorwehen)
		System.Manager.RemoveCME(ActorRef, 7)
	endFunction

	function onUpdateFunction()

		if CurrentStatePercent > 90.0000
			fwutility.ActorAddSpell(ActorRef, System.Effect_Vorwehen, false, false)
		endIf
		if CurrentStatePercent > 75.0000 && utility.RandomInt(0, 10) > 4
			Int rnd = utility.RandomInt(0, 10)
			if rnd < 6
				System.Message("Breast Milk1 (" + ActorRef.GetLeveledActorBase().GetName() + ")", System.MSG_All, 0)
				fwutility.ActorAddSpell(ActorRef, System.Effect_BreastMilk1, false, true)
			elseIf rnd < 10
				System.Message("Breast Milk2 (" + ActorRef.GetLeveledActorBase().GetName() + ")", System.MSG_All, 0)
				fwutility.ActorAddSpell(ActorRef, System.Effect_BreastMilk2, false, true)
			else
				System.Message("Breast Milk3 (" + ActorRef.GetLeveledActorBase().GetName() + ")", System.MSG_All, 0)
				fwutility.ActorAddSpell(ActorRef, System.Effect_BreastMilk3, false, true)
			endIf
		endIf
		self.CheckAbortus()
		if utility.RandomInt(0, 100) > 60
			Float intensity = utility.RandomFloat(0.500000, 1.00000)
			game.shakeController(intensity, intensity, utility.RandomFloat(0.200000, 1.00000))
		endIf
		Float GT = utility.GetCurrentGameTime()
		Int HealAmount = math.Floor(GT - LastBabyHealing) * 5
		if HealAmount > 0
			System.Controller.HealBaby(ActorRef, HealAmount as Float)
			LastBabyHealing = GT
		endIf
	endFunction

	function onEnterState()

		System.Manager.RemoveCME(ActorRef, 6)
		System.Manager.CastCME(ActorRef, 7, System.cfg.PMSEffects)
	endFunction
endState

;-- State -------------------------------------------
state Ovulation_State

	function onExitState()

		fwutility.ActorRemoveSpell(ActorRef, System.Effect_Mittelschmerz)
		System.Manager.RemoveCME(ActorRef, 1)
		bHasPMS == false
	endFunction

	function onUpdateFunction()

		if CurrentStatePercent > 40.0000
			fwutility.ActorRemoveSpell(ActorRef, System.Effect_Mittelschmerz)
		else
			fwutility.ActorAddSpell(ActorRef, System.Effect_Mittelschmerz, false, false)
		endIf
		if CurrentStatePercent >= 50.0000
			Int rnd = utility.RandomInt(0, 15)
			if rnd < 7
				if System.Controller.ActiveSpermImpregnation(ActorRef, false) == true
					fwutility.ActorRemoveSpell(ActorRef, System.Effect_Mittelschmerz)
					self.changeState(4)
				endIf
			endIf
		endIf
	endFunction

	function onEnterState()

		System.Manager.RemoveCME(ActorRef, 0)
		fwutility.ActorAddSpell(ActorRef, System.Effect_Mittelschmerz, false, false)
		System.Manager.CastCME(ActorRef, 1, System.cfg.PMSEffects)
		bHasPMS == false
	endFunction
endState

;-- State -------------------------------------------
state PregnantChaurus_State

	function onUpdateFunction()

		if System.IsActorPregnantByChaurus(ActorRef) == false
			System.Controller.Pause(ActorRef, false)
			if currentState < 4 || currentState == 8
				self.changeState(3)
			elseIf currentState == 4
				self.castAbortus(3.00000, true)
			elseIf currentState == 5
				self.castAbortus(4.00000, true)
			elseIf currentState == 6 || currentState == 7
				self.castAbortus(5.00000, true)
			else
				self.changeState(3)
			endIf
		endIf
	endFunction
endState

;-- State -------------------------------------------
state LaborPains_State

	function onExitState()

		fwutility.ActorRemoveSpell(ActorRef, System.Effect_Eroeffnungswehen)
		fwutility.ActorRemoveSpell(ActorRef, System.Effect_Presswehen)
		System.Manager.RemoveCME(ActorRef, 8)
	endFunction

	function onUpdateFunction()

		if CurrentStatePercent >= 50.0000 && CurrentStatePercent < 95.0000 && ActorRef.HasSpell(System.Effect_Presswehen as Form) == false
			fwutility.ActorRemoveSpell(ActorRef, System.Effect_Eroeffnungswehen)
			fwutility.ActorAddSpell(ActorRef, System.Effect_Presswehen, false, false)
			System.Controller.GiveBirth(ActorRef)
			return 
		elseIf CurrentStatePercent >= 95.0000
			System.InstantBornChilds(ActorRef)
			self.changeState(8)
			return 
		elseIf CurrentStatePercent < 50.0000 && ActorRef.HasSpell(System.Effect_Eroeffnungswehen as Form) == false
			fwutility.ActorAddSpell(ActorRef, System.Effect_Eroeffnungswehen, false, false)
		endIf
	endFunction

	function onEnterState()

		System.Manager.RemoveCME(ActorRef, 7)
		System.Manager.CastCME(ActorRef, 8, System.cfg.PMSEffects)
		if CurrentStatePercent >= 50.0000 && CurrentStatePercent < 95.0000 && ActorRef.HasSpell(System.Effect_Presswehen as Form) == false
			fwutility.ActorRemoveSpell(ActorRef, System.Effect_Eroeffnungswehen)
			fwutility.ActorAddSpell(ActorRef, System.Effect_Presswehen, false, false)
			System.Controller.GiveBirth(ActorRef)
			return 
		elseIf CurrentStatePercent >= 95.0000
			System.InstantBornChilds(ActorRef)
			self.changeState(8)
			return 
		elseIf CurrentStatePercent < 50.0000
			fwutility.ActorAddSpell(ActorRef, System.Effect_Eroeffnungswehen, false, false)
			if ActorRef == game.GetPlayer()
				fwutility.LockPlayer()
				System.Message(Contents.YourPregnantWaterBreaks, System.MSG_Immersive, 0)
			else
				System.Message(fwutility.StringReplace(Contents.NPCPregnantWaterBreaks, "{0}", ActorRef.GetLeveledActorBase().GetName()), System.MSG_Low, 0)
			endIf
			fwutility.EquipItem(ActorRef, System.AmnioticFluid as Form)
			utility.Wait(8.00000)
			fwutility.UnEquipItem(ActorRef, System.AmnioticFluid as Form)
			if ActorRef == game.GetPlayer()
				fwutility.UnlockPlayer()
			endIf
		endIf
	endFunction
endState

;-- State -------------------------------------------
state PregnancySecond_State

	function onHitFunction(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

		if (abPowerAttack || abSneakAttack || abBashAttack) && !abHitBlocked
			System.Controller.DamageBaby(ActorRef, utility.RandomFloat(0.000000, 3.00000))
		endIf
	endFunction

	function onPotionFunction(potion p)

		Int c = p.GetNumEffects()
		while c > 0
			c -= 1
			if p.GetNthEffectMagicEffect(c).HasKeywordString("MagicAlchRestoreHealth")
				System.Controller.HealBaby(ActorRef, p.GetNthEffectMagnitude(c) / 10.0000)
			endIf
			if p.GetNthEffectMagicEffect(c).HasKeywordString("MagicAlchHarmful")
				System.Controller.DamageBaby(ActorRef, p.GetNthEffectMagnitude(c) / 10.0000)
			endIf
		endWhile
	endFunction

	function onUpdateFunction()

		self.CheckAbortus()
		Float GT = utility.GetCurrentGameTime()
		Int HealAmount = math.Floor(GT - LastBabyHealing) * 3
		if HealAmount > 0
			System.Controller.HealBaby(ActorRef, HealAmount as Float)
			LastBabyHealing = GT
		endIf
	endFunction

	function onExitState()

		System.Manager.RemoveCME(ActorRef, 6)
	endFunction

	function onEnterState()

		System.Manager.RemoveCME(ActorRef, 5)
		System.Manager.CastCME(ActorRef, 6, System.cfg.PMSEffects)
	endFunction
endState

;-- State -------------------------------------------
state Follicular_State

	function onExitState()

		ActorRef.RemoveSpell(System.Effect_Vorwehen)
		System.Manager.RemoveCME(ActorRef, 0)
		bHasPMS == false
	endFunction

	function onEnterState()

		System.Manager.RemoveCME(ActorRef, -1)
		if ActorRef == game.GetPlayer()
			System.Controller.setAutoFlag(ActorRef)
		endIf
		System.Manager.CastCME(ActorRef, 0, System.cfg.PMSEffects)
		bHasPMS == false
	endFunction
endState

;-- State -------------------------------------------
state Luteal_State

	function onExitState()

		System.Manager.RemoveCME(ActorRef, 2)
		System.Manager.RemoveCME(ActorRef, 3)
		bHasPMS = false
	endFunction

	function onUpdateFunction()

		if CurrentStatePercent < 65.0000
			Float rnd = utility.RandomFloat(0.000000, 100.000)
			Float chance = System.LutealImpregnationTime(CurrentStatePercent)
			if chance > rnd
				if System.Controller.ActiveSpermImpregnation(ActorRef, false) == true
					System.Manager.RemoveCME(ActorRef, 3)
					self.changeState(4)
					return 
				endIf
			endIf
		endIf
		if CurrentStatePercent > 75.0000
			if bHasPMS == false && System.Controller.canBecomePMS(ActorRef) == true
				System.Message("Cast PMS for " + ActorRef.GetLeveledActorBase().GetName(), System.MSG_Debug, 0)
				System.Manager.CastCME(ActorRef, 3, System.cfg.PMSEffects)
				bHasPMS = true
			endIf
			if !IsPlayer && ActorRef.GetItemCount(System.Tampon_Normal as Form) <= 2
				ActorRef.addItem(System.Tampon_Normal as Form, 6, false)
			endIf
		endIf
	endFunction

	function onEnterState()

		System.Manager.RemoveCME(ActorRef, 1)
		System.Manager.CastCME(ActorRef, 2, System.cfg.PMSEffects)
		bHasPMS = false
		if CurrentStatePercent > 75.0000
			if bHasPMS == false && System.Controller.canBecomePMS(ActorRef) == true
				bHasPMS = true
				System.Message("Cast PMS for " + ActorRef.GetLeveledActorBase().GetName(), System.MSG_Debug, 0)
				System.Manager.CastCME(ActorRef, 3, System.cfg.PMSEffects)
				System.Message("Casted", System.MSG_Debug, 0)
			endIf
		endIf
	endFunction
endState

;-- State -------------------------------------------
state Replanish_State

	function onExitState()

		fwutility.ActorRemoveSpell(ActorRef, System.Effect_Nachwehen)
		fwutility.ActorRemoveSpell(ActorRef, System.FeverSpell)
		fwutility.ActorRemoveSpell(ActorRef, System.InfectionSpell)
		self.ResetBelly()
		System.Controller.setAutoFlag(ActorRef)
	endFunction

	function onUpdateFunction()

		if CurrentStatePercent >= 4.00000
			fwutility.ActorRemoveSpell(ActorRef, System.Effect_Nachwehen)
		else
			fwutility.ActorAddSpell(ActorRef, System.Effect_Nachwehen, false, false)
		endIf
		if CurrentStatePercent >= 2.00000 && ActorRef.HasSpell(System.FeverSpell as Form)
			fwutility.ActorRemoveSpell(ActorRef, System.FeverSpell)
		endIf
		if CurrentStatePercent < 20.0000 && utility.RandomInt(0, 10) > 4
			Int rnd = utility.RandomInt(0, 10)
			if rnd < 6
				System.Message("Breast Milk1 (" + ActorRef.GetLeveledActorBase().GetName() + ")", System.MSG_All, 0)
				fwutility.ActorAddSpell(ActorRef, System.Effect_BreastMilk1, false, true)
			elseIf rnd < 10
				System.Message("Breast Milk2 (" + ActorRef.GetLeveledActorBase().GetName() + ")", System.MSG_All, 0)
				fwutility.ActorAddSpell(ActorRef, System.Effect_BreastMilk2, false, true)
			else
				System.Message("Breast Milk3 (" + ActorRef.GetLeveledActorBase().GetName() + ")", System.MSG_All, 0)
				fwutility.ActorAddSpell(ActorRef, System.Effect_BreastMilk3, false, true)
			endIf
		endIf
	endFunction

	function onEnterState()

		System.Manager.RemoveCME(ActorRef, -1)
		System.Manager.CastCME(ActorRef, 9, System.cfg.PMSEffects)
		self.SetBelly(false)
		self.equipChild()
		if ActorRef.GetItemCount(System.ContraceptionLow as Form) <= 1 && IsPlayer == false
			ActorRef.addItem(System.ContraceptionLow as Form, 10, false)
		endIf
		if CurrentStatePercent < 4.00000
			fwutility.ActorAddSpell(ActorRef, System.Effect_Nachwehen, false, false)
		endIf
	endFunction
endState

;-- State -------------------------------------------
state pregnantunknown_state

	function SetBelly(Bool bForce)

		; Empty function
	endFunction
endState

;-- State -------------------------------------------
state PregnancyFirst_State

	function onHitFunction(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

		if (abPowerAttack || abSneakAttack || abBashAttack) && !abHitBlocked
			System.Controller.DamageBaby(ActorRef, utility.RandomFloat(2.00000, 7.00000))
		endIf
	endFunction

	function onPotionFunction(potion p)

		Int c = p.GetNumEffects()
		while c > 0
			c -= 1
			if p.GetNthEffectMagicEffect(c).HasKeywordString("MagicAlchRestoreHealth")
				System.Controller.HealBaby(ActorRef, p.GetNthEffectMagnitude(c) / 5.00000)
			endIf
			if p.GetNthEffectMagicEffect(c).HasKeywordString("MagicAlchHarmful")
				System.Controller.DamageBaby(ActorRef, p.GetNthEffectMagnitude(c) / 10.0000)
			endIf
		endWhile
	endFunction

	function onUpdateFunction()

		self.CheckAbortus()
		Float GT = utility.GetCurrentGameTime()
		Int HealAmount = math.Floor(GT - LastBabyHealing)
		if HealAmount > 0
			System.Controller.HealBaby(ActorRef, HealAmount as Float)
			LastBabyHealing = GT
		endIf
	endFunction

	function onExitState()

		System.Manager.RemoveCME(ActorRef, 5)
	endFunction

	function onEnterState()

		System.Manager.RemoveCME(ActorRef, 4)
		System.Manager.CastCME(ActorRef, 5, System.cfg.PMSEffects)
	endFunction
endState

;-- State -------------------------------------------
state Menstruation_State

	function onExitState()

		fwutility.ActorRemoveSpell(ActorRef, System.Effect_MenstruationCramps)
		System.Controller.setAutoFlag(ActorRef)
		System.Manager.RemoveCME(ActorRef, -1)
	endFunction

	function onUpdateFunction()

		self.EquipNapkin()
		if utility.RandomInt(1, 24) <= 6
			self.castMentrualBlood()
		endIf
		if !IsPlayer && ActorRef.GetItemCount(System.Tampon_Normal as Form) <= 2
			ActorRef.addItem(System.Tampon_Normal as Form, 6, false)
		endIf
		self.EquipNapkin()
	endFunction

	function onEnterState()

		self.EquipNapkin()
		fwutility.ActorAddSpell(ActorRef, System.Effect_MenstruationCramps, false, false)
		System.Manager.RemoveCME(ActorRef, 3)
		System.Manager.RemoveCME(ActorRef, 2)
		System.Manager.CastCME(ActorRef, 4, System.cfg.PMSEffects)
		bHasPMS = false
	endFunction
endState

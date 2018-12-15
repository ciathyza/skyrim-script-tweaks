;/ Decompiled by Champollion V1.0.1
Source   : FWShowStats.psc
Modified : 2016-12-06 03:52:40
Compiled : 2017-01-18 08:35:17
User     : admin
Computer : PATRICK
/;
scriptName FWShowStats extends ActiveMagicEffect

;-- Properties --------------------------------------
fwcontroller property Controller auto
Int property Magnetude = 100 auto

;-- Variables ---------------------------------------
Bool bInit = false
actor ActorRef

;-- Functions ---------------------------------------

function printMaleInformations()

	if ActorRef.GetLeveledActorBase() != none
		debug.Trace("BeeingMale Saved Data for: " + ActorRef.GetLeveledActorBase().GetName(), 0)
	else
		debug.Trace("BeeingMale Saved Data for: " + ActorRef.GetName(), 0)
	endIf
	self.PrintLinked()
	debug.Trace("-----------------------------------------------------------------", 0)
endFunction

function printChildInformations()

	if ActorRef.GetLeveledActorBase() != none
		debug.Trace("BeeingChild Saved Data for: " + ActorRef.GetLeveledActorBase().GetName(), 0)
	else
		debug.Trace("BeeingChild Saved Data for: " + ActorRef.GetName(), 0)
	endIf
	debug.Trace("Child Name: " + storageutil.GetStringValue(ActorRef as form, "FW.Child.Name", ""), 0)
	debug.Trace("Child last Update: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.LastUpdate", 0.000000) as String, 0)
	actor Mother = storageutil.GetFormValue(ActorRef as form, "FW.Child.Mother", none) as actor
	actor Father = storageutil.GetFormValue(ActorRef as form, "FW.Child.Father", none) as actor
	if Mother != none
		if Mother.GetLeveledActorBase() != none
			debug.Trace("Mother: " + Mother.GetLeveledActorBase().GetName(), 0)
		else
			debug.Trace("Mother: #" + Mother.GetName(), 0)
		endIf
	else
		debug.Trace("Mother: <NONE>", 0)
	endIf
	if Father != none
		if Father.GetLeveledActorBase() != none
			debug.Trace("Father: " + Father.GetLeveledActorBase().GetName(), 0)
		else
			debug.Trace("Father: #" + Father.GetName(), 0)
		endIf
	else
		debug.Trace("Father: <NONE>", 0)
	endIf
	debug.Trace("Level: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.Level", 0.000000) as String, 0)
	debug.Trace("Experience: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatExperience", 0.000000) as String, 0)
	debug.Trace("Stats:", 0)
	debug.Trace("Comprehension: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatComprehension", 0.000000) as String, 0)
	debug.Trace("Destruction: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatDestruction", 0.000000) as String, 0)
	debug.Trace("Illusion: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatIllusion", 0.000000) as String, 0)
	debug.Trace("Conjuration: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatConjuration", 0.000000) as String, 0)
	debug.Trace("Restoration: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatRestoration", 0.000000) as String, 0)
	debug.Trace("Alteration: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatAlteration", 0.000000) as String, 0)
	debug.Trace("Block: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatBlock", 0.000000) as String, 0)
	debug.Trace("OneHanded: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatOneHanded", 0.000000) as String, 0)
	debug.Trace("TwoHanded: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatTwoHanded", 0.000000) as String, 0)
	debug.Trace("Marksman: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatMarksman", 0.000000) as String, 0)
	debug.Trace("Sneak: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatSneak", 0.000000) as String, 0)
	debug.Trace("Magicka: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatMagicka", 0.000000) as String, 0)
	debug.Trace("CarryWeight: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatCarryWeight", 0.000000) as String, 0)
	debug.Trace("Health: " + storageutil.GetFloatValue(ActorRef as form, "FW.Child.StatHealth", 0.000000) as String, 0)
	debug.Trace("Perks:", 0)
	Int sc = storageutil.FormListCount(ActorRef as form, "FW.Child.Perks")
	while sc > 0
		sc -= 1
		spell S = storageutil.FormListGet(ActorRef as form, "FW.Child.Perks", sc) as spell
		if S != none
			debug.Trace(S.GetName(), 0)
		else
			debug.Trace("Unknown Perk", 0)
		endIf
	endWhile
	self.PrintLinked()
	debug.Trace("-----------------------------------------------------------------", 0)
endFunction

function OnInit()

	bInit = true
	self.execute()
endFunction

; Skipped compiler generated GotoState

function OnEffectStart(actor akTarget, actor akCaster)

	if akTarget == none && akCaster.GetAngleX() > 85.0000
		ActorRef = game.GetPlayer()
		self.execute()
	elseIf akTarget != none
		ActorRef = akTarget
		self.execute()
	endIf
endFunction

function printFemaleInformations()

	Int i = 0
	Int cChildFather = storageutil.FormListCount(ActorRef as form, "FW.ChildFather")
	Int cSpermTime = storageutil.FloatListCount(ActorRef as form, "FW.SpermTime")
	Int cSpermName = storageutil.FormListCount(ActorRef as form, "FW.SpermName")
	Int cSpermAmmount = storageutil.FloatListCount(ActorRef as form, "FW.SpermAmount")
	Int cBornChildFather = storageutil.FormListCount(ActorRef as form, "FW.BornChildFather")
	Int cBornChildTime = storageutil.FloatListCount(ActorRef as form, "FW.BornChildTime")
	debug.Trace("-----------------------------------------------------------------", 0)
	if ActorRef.GetLeveledActorBase() != none
		debug.Trace("BeeingFemale Saved Data for: " + ActorRef.GetLeveledActorBase().GetName(), 0)
	else
		debug.Trace("BeeingFemale Saved Data for: #" + ActorRef.GetName(), 0)
	endIf
	debug.Trace("Current Game Time: " + utility.GetCurrentGameTime() as String, 0)
	debug.Trace("-----------------------------------------------------------------", 0)
	debug.Trace(" FW.LastUpdate :  " + storageutil.GetFloatValue(ActorRef as form, "FW.LastUpdate", 0.000000) as String, 0)
	debug.Trace(" FW.StateEnterTime :  " + storageutil.GetFloatValue(ActorRef as form, "FW.StateEnterTime", 0.000000) as String + " [" + fwutility.GetTimeString(utility.GetCurrentGameTime() - storageutil.GetFloatValue(ActorRef as form, "FW.StateEnterTime", 0.000000), true, "") + "]", 0)
	debug.Trace(" FW.CurrentState :  " + storageutil.GetIntValue(ActorRef as form, "FW.CurrentState", 0) as String, 0)
	debug.Trace(" FW.Abortus :  " + storageutil.GetIntValue(ActorRef as form, "FW.Abortus", 0) as String, 0)
	debug.Trace(" FW.AbortusTime :  " + storageutil.GetFloatValue(ActorRef as form, "FW.AbortusTime", 0.000000) as String + " [" + fwutility.GetTimeString(utility.GetCurrentGameTime() - storageutil.GetFloatValue(ActorRef as form, "FW.AbortusTime", 0.000000), true, "") + "]", 0)
	debug.Trace(" FW.UnbornHealth :  " + storageutil.GetFloatValue(ActorRef as form, "FW.UnbornHealth", 0.000000) as String, 0)
	debug.Trace(" FW.NumChilds :  " + storageutil.GetIntValue(ActorRef as form, "FW.NumChilds", 0) as String, 0)
	i = 0
	while i < cChildFather
		actor a = storageutil.FormListGet(ActorRef as form, "FW.ChildFather", i) as actor
		if a != none
			if a.GetLeveledActorBase() != none
				debug.Trace(" FW.ChildFather[" + i as String + "] :  " + a.GetLeveledActorBase().GetName(), 0)
			else
				debug.Trace(" FW.ChildFather[" + i as String + "] :  #" + a.GetName(), 0)
			endIf
		endIf
		i += 1
	endWhile
	i = 0
	while i < cSpermTime
		debug.Trace(" FW.SpermTime[" + i as String + "] :  " + storageutil.FloatListGet(ActorRef as form, "FW.SpermTime", i) as String + " [" + fwutility.GetTimeString(utility.GetCurrentGameTime() - storageutil.FloatListGet(ActorRef as form, "FW.SpermTime", i), true, "") + "]", 0)
		i += 1
	endWhile
	i = 0
	while i < cSpermName
		actor a = storageutil.FormListGet(ActorRef as form, "FW.SpermName", i) as actor
		if a != none
			if a.GetLeveledActorBase() != none
				debug.Trace(" FW.SpermName[" + i as String + "] :  " + a.GetLeveledActorBase().GetName(), 0)
			else
				debug.Trace(" FW.SpermName[" + i as String + "] :  #" + a.GetName(), 0)
			endIf
		endIf
		i += 1
	endWhile
	i = 0
	while i < cSpermAmmount
		debug.Trace(" FW.SpermAmount[" + i as String + "] :  " + storageutil.FloatListGet(ActorRef as form, "FW.SpermAmount", i) as String, 0)
		i += 1
	endWhile
	debug.Trace(" FW.Flags :  " + storageutil.GetIntValue(ActorRef as form, "FW.Flags", 0) as String, 0)
	debug.Trace(" FW.PainLevel :  " + storageutil.GetFloatValue(ActorRef as form, "FW.PainLevel", 0.000000) as String, 0)
	debug.Trace(" FW.Contraception :  " + storageutil.GetFloatValue(ActorRef as form, "FW.Contraception", 0.000000) as String, 0)
	debug.Trace(" FW.ContraceptionTime :  " + storageutil.GetFloatValue(ActorRef as form, "FW.ContraceptionTime", 0.000000) as String + " [" + fwutility.GetTimeString(utility.GetCurrentGameTime() - storageutil.GetFloatValue(ActorRef as form, "FW.ContraceptionTime", 0.000000), true, "") + "]", 0)
	debug.Trace(" FW.NumBirth :  " + storageutil.GetIntValue(ActorRef as form, "FW.NumBirth", 0) as String, 0)
	debug.Trace(" FW.NumBabys :  " + storageutil.GetIntValue(ActorRef as form, "FW.NumBabys", 0) as String, 0)
	debug.Trace(" FW.PauseTime :  " + storageutil.GetFloatValue(ActorRef as form, "FW.PauseTime", 0.000000) as String + " [" + fwutility.GetTimeString(utility.GetCurrentGameTime() - storageutil.GetFloatValue(ActorRef as form, "FW.PauseTime", 0.000000), true, "") + "]", 0)
	debug.Trace(" FW.LastBornChildTime :  " + storageutil.GetFloatValue(ActorRef as form, "FW.LastBornChildTime", 0.000000) as String + " [" + fwutility.GetTimeString(utility.GetCurrentGameTime() - storageutil.GetFloatValue(ActorRef as form, "FW.LastBornChildTime", 0.000000), true, "") + "]", 0)
	i = 0
	while i < cBornChildFather
		actor a = storageutil.FormListGet(ActorRef as form, "FW.BornChildFather", i) as actor
		if a != none
			if a.GetLeveledActorBase() != none
				debug.Trace(" FW.BornChildFather[" + i as String + "] :  " + a.GetLeveledActorBase().GetName(), 0)
			else
				debug.Trace(" FW.BornChildFather[" + i as String + "] :  #" + a.GetName(), 0)
			endIf
		endIf
		i += 1
	endWhile
	i = 0
	while i < cBornChildTime
		debug.Trace(" FW.BornChildTime[" + i as String + "] :  " + storageutil.FloatListGet(ActorRef as form, "FW.BornChildTime", i) as String + " [" + fwutility.GetTimeString(utility.GetCurrentGameTime() - storageutil.FloatListGet(ActorRef as form, "FW.BornChildTime", i), true, "") + "]", 0)
		i += 1
	endWhile
	self.PrintLinked()
	debug.Trace("-----------------------------------------------------------------", 0)
endFunction

; Skipped compiler generated GetState

function execute()

	if ActorRef == none || bInit == false
		return 
	endIf
	if ActorRef.HasSpell(Controller.System.BeeingFemaleSpell as form)
		if ActorRef.HasMagicEffect(Controller.System.BeeingFemaleSpell.GetNthEffectMagicEffect(0)) == false
			ActorRef.RemoveSpell(Controller.System.BeeingFemaleSpell)
		endIf
	endIf
	if ActorRef.HasSpell(Controller.System.BeeingMaleSpell as form)
		if ActorRef.HasMagicEffect(Controller.System.BeeingMaleSpell.GetNthEffectMagicEffect(0)) == false
			ActorRef.RemoveSpell(Controller.System.BeeingMaleSpell)
		endIf
	endIf
	if ActorRef.HasSpell(Controller.System.BeeingFemaleSpell as form) == false && Controller.System.IsValidateActor(ActorRef, false) as Bool
		fwutility.ActorAddSpell(ActorRef, Controller.System.BeeingFemaleSpell, false, false)
	elseIf ActorRef.HasSpell(Controller.System.BeeingMaleSpell as form) == false && Controller.System.IsValidateMaleActor(ActorRef, false) as Bool
		if ActorRef.HasMagicEffect(Controller.System.BeeingMaleSpell.GetNthEffectMagicEffect(0)) == false
			ActorRef.RemoveSpell(Controller.System.BeeingMaleSpell)
		endIf
		fwutility.ActorAddSpell(ActorRef, Controller.System.BeeingMaleSpell, false, false)
	endIf
	Controller.showRankedInfoBox(ActorRef, Magnetude)
	if Controller.System.cfg.Messages == 0
		if ActorRef as fwchildactor != none
			self.printChildInformations()
		elseIf ActorRef.GetLeveledActorBase() != none
			if ActorRef.GetLeveledActorBase().GetSex() == 0
				self.printMaleInformations()
			else
				self.printFemaleInformations()
			endIf
		endIf
	endIf
endFunction

function PrintLinked()

	Int cChain = ActorRef.countLinkedRefChain(none, 100)
	Int i = 0
	objectreference lnkRef = ActorRef.GetLinkedRef(none)
	if lnkRef != none
		debug.Trace("Linked References: " + lnkRef.GetName() + " [" + lnkRef.GetFormID() as String + "]", 0)
	else
		debug.Trace("Linked References: <NONE>", 0)
	endIf
	debug.Trace("Linked Ref Chains: " + cChain as String, 0)
	while i < cChain
		objectreference lnk = ActorRef.GetNthLinkedRef(i)
		debug.Trace(i as String + ": " + lnk.GetName() + " [" + lnk.GetFormID() as String + "]", 0)
		i += 1
	endWhile
endFunction

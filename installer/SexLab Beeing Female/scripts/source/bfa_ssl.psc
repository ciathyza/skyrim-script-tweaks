;/ Decompiled by Champollion V1.0.1
Source   : BFA_ssl.psc
Modified : 2017-01-15 03:43:12
Compiled : 2017-01-15 06:28:34
User     : admin
Computer : PATRICK
/;
scriptName BFA_ssl extends FWAddOn_Misc

;-- Properties --------------------------------------
fwsystem property System auto

;-- Variables ---------------------------------------
SexLabFramework SexLab
Int TryRegisterCount = 0
sslThreadLibrary Lib
Bool bSexLab

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

Bool function IsSSLActive()

	return bSexLab
endFunction

function Refresh(String strArg, FWAddOnManager sender)

	self.OnGameLoad()
endFunction

function OnGiveBirthEnd(actor Mother)

	if bSexLab == true
		Mother.RemoveFromFaction(SexLab.AnimatingFaction)
	endIf
endFunction

function OnMimik(actor ActorRef, String ExpressionName, Int Strength, Bool bClear)

	if bSexLab == false
		return 
	endIf
	if bClear
		SexLab.ClearMFG(ActorRef)
	endIf
	if ExpressionName != ""
		if SexLab.GetExpressionByName(ExpressionName) != none
			SexLab.GetExpressionByName(ExpressionName).Apply(ActorRef, Strength, 1)
		endIf
	endIf
endFunction

function OnGameLoad()

	if System == none
		System = self.GetSystem()
	endIf
	bSexLab = false
	SexLab = none
	Lib = none
	self.UnregisterForAllModEvents()
	TryRegisterCount = 0
	self.RegisterForSingleUpdate(5.00000)
endFunction

Bool function FixSexLab()

	if bSexLab == false
		return false
	endIf
	if SexLab == none
		SexLab = game.GetFormFromFile(3426, "SexLab.esm") as SexLabFramework
		if SexLab == none
			return false
		endIf
	endIf
	return true
endFunction

function OnGiveBirthStart(actor Mother)

	if bSexLab == true
		Mother.SetFactionRank(SexLab.AnimatingFaction, 1)
	endIf
endFunction

Bool function OnPainSound(actor Mother)

	; Empty function
endFunction

ObjectReference function OnGetBedRef(actor ActorRef)

	if bSexLab == false
		return none
	endIf
	game.FindClosestReferenceOfAnyTypeInListFromRef(SexLab.Config.BedsList, ActorRef as ObjectReference, 600.000)
endFunction

function OnUpdate()

	Int idx = game.GetModCount()
	String modName = ""
	while idx > 0
		idx -= 1
		modName = game.GetModName(idx)
		if modName == "SexLab.esm"
			SexLab = game.GetFormFromFile(3426, modName) as SexLabFramework
			Lib = game.GetFormFromFile(3426, modName) as sslThreadLibrary
			bSexLab = true
			self.RegisterForModEvent("OrgasmStart", "onSexLabOrgasm")
			TryRegisterCount = 0
			return 
		endIf
	endWhile
	if !(TryRegisterCount > 10)
		self.RegisterForSingleUpdate(5.00000)
		TryRegisterCount -= 1
	endIf
endFunction

Bool function OnAllowFFCum(actor WomanToAdd, actor denor)

	if bSexLab == false
		return false
	endIf
	return SexLab.Config.AllowFFCum
endFunction

Bool function OnPlayPainSound(actor ActorRef, Float Strength)

	if bSexLab == false
		return false
	endIf
	sslbasevoice voice = SexLab.PickVoice(ActorRef)
	if voice
		voice.Moan(ActorRef, Strength as Int, true)
		return true
	endIf
endFunction

Form[] function OnStripActor(actor ActorRef)

	if bSexLab == true
		return SexLab.StripActor(ActorRef, none, true, false)
	endIf
endFunction

; Skipped compiler generated GetState

Bool function IsActive()

	return bSexLab
endFunction

function Trace(String S)

	debug.Trace(S, 0)
endFunction

function onSexLabOrgasm(String hookName, String argString, Float argNum, form sender)

	if SexLab == none
		if self.FixSexLab() == false
			return 
		endIf
	endIf
	sslthreadcontroller ssl_controller = SexLab.HookController(argString)
	if ssl_controller == none
		return 
	endIf
	sslbaseanimation animation = ssl_controller.animation
	if animation == none
		return 
	endIf
	Bool relevantAnimation = false
	if animation.HasTag("Vaginal")
		relevantAnimation = true
	endIf
	if animation.HasTag("Anal")
		if utility.RandomInt(1, 100) <= System.cfg.NoVaginalCumChance
			relevantAnimation = true
		endIf
	endIf
	if System.cfg.CreatureSperm && !relevantAnimation
		if animation.HasTag("Creature") && animation.HasTag("Bestiality") && !animation.HasTag("Oral") && (animation.HasTag("Missionary") || animation.HasTag("Doggystyle") || animation.HasTag("Holding") || animation.HasTag("MMMMF") || animation.HasTag("MMMF") || animation.HasTag("MMF"))
			relevantAnimation = true
		else
			relevantAnimation = false
		endIf
	endIf
	if relevantAnimation
		actor tmpActor
		Float amount = 1.00000
		Int c = animation.PositionCount
		actor Female = none
		actor Male = none
		Int i = 0
		while i < c
			tmpActor = ssl_controller.Positions[i]
			if Female == none && tmpActor != none && tmpActor.GetLeveledActorBase().GetSex() == 1
				Female = tmpActor
			elseIf Male == none && tmpActor != none && tmpActor.GetLeveledActorBase().GetSex() == 0
				Male = tmpActor
			endIf
			if Female != none && Male != none
				i = c
			else
				i += 1
			endIf
		endWhile
		if !Male && SexLab.Config.AllowFFCum == true
			i = 0
			while i < c
				tmpActor = ssl_controller.Positions[i]
				if Male == none && tmpActor != none && tmpActor != Female && tmpActor.GetLeveledActorBase().GetSex() == 1
					Male = tmpActor
				endIf
				if Male != none
					i = c
				else
					i += 1
				endIf
			endWhile
		endIf
		if !Male
			return 
		endIf
		if !Female
			Female = ssl_controller.GetVictim()
		endIf
		Bool bCondom = System.CheckForCondome(Female, Male)
		if Female as Bool && Male as Bool && bCondom == false
			if Male.GetLeveledActorBase().GetSex() == 0
				if System.IsValidateMaleActor(Male, false) < 0
					return 
				endIf
			elseIf System.IsValidateFemaleActor(Male, false) < 0
				return 
			endIf
			if Female.GetLeveledActorBase().GetSex() == 0
				if System.IsValidateMaleActor(Female, false) < 0
					return 
				endIf
			elseIf System.IsValidateFemaleActor(Female, false) < 0
				return 
			endIf
			if System.DeviceActive == true
				if Female.IsEquipped(System.DeviceBelt as form) == true
					return 
				endIf
			endIf
			self.Trace("8. Add sperm")
			if Female.HasSpell(System.BeeingFemaleSpell as form) == false && System.IsValidateFemaleActor(Female, false) > 0
				fwutility.ActorAddSpell(Female, System.BeeingFemaleSpell, false, false)
			endIf
			Float virility = System.Controller.GetVirility(Male)
			amount = utility.RandomFloat(virility * 0.750000, virility * 1.10000)
			if amount > 1.00000
				amount = 1.00000
			endIf
			amount = System.Manager.getSpermAmount(Female, Male, amount)
			if Female.HasSpell(System.BeeingFemaleSpell as form) == false
				System.Message(fwutility.StringReplace(System.Content.NoBeeingFemaleSpell, "{0}", Female.GetLeveledActorBase().GetName()), System.MSG_Immersive, 0)
			endIf
			if Male == game.GetPlayer()
				System.Message(fwutility.StringReplace(System.Content.YouCameInsideNPC, "{0}", Female.GetLeveledActorBase().GetName()), System.MSG_Immersive, 0)
			elseIf Female == game.GetPlayer()
				System.Message(fwutility.StringReplace(System.Content.NPCCameInsideYou, "{0}", Male.GetLeveledActorBase().GetName()), System.MSG_Immersive, 0)
			else
				String[] astring = new String[2]
				astring[0] = Male.GetLeveledActorBase().GetName()
				astring[1] = Female.GetLeveledActorBase().GetName()
				System.Message(fwutility.ArrayReplace(System.Content.NPCCameInsideNPC, astring), System.Msg_High, 0)
			endIf
			if amount > 0.000000
				System.Controller.AddSperm(Female, Male, amount)
			endIf
		endIf
	endIf
endFunction

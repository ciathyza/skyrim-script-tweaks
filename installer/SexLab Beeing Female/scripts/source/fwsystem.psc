;/ Decompiled by Champollion V1.0.1
Source   : FWSystem.psc
Modified : 2017-01-18 07:35:31
Compiled : 2017-01-18 08:35:09
User     : admin
Computer : PATRICK
/;
scriptName FWSystem extends Quest

;-- Properties --------------------------------------
spell property ChaurusBreeder auto hidden
imagespacemodifier property iModPainLow auto
Int property MSG_Always hidden
	Int function get()

		return 99
	endFunction
endproperty
Int property MSG_High hidden
	Int function get()

		return 2
	endFunction
endproperty
spell property Effect_Nachwehen auto
fwprogresswidget property Progress auto
spell property Effect_BreastMilk2 auto
Bool property HearthFiresActive = false auto hidden
imagespacemodifier property AbortusImod auto
Int property ChildFollowerFactionRank4 = 0 auto
armor property Sanitary_Napkin_Bloody auto
spell property Effect_Mittelschmerz auto
faction property PlayerMarriedFaction auto
faction property ForbiddenFaction auto
Int property ChildFollowerFactionRank = 0 auto
fwabilitybeeingmale property PlayerMale auto hidden
spell property Effect_VaginalBloodLow auto
globalvariable property GlobalPlayerState auto
imagespacemodifier property MenuImageSpace auto
formlist property BadSpellList auto
spell property StatMenstruationCycle auto
scroll[] property StartUpScrolls auto
leveleditem[] property PillStor_Types auto
Int property LoadState auto hidden
objectreference[] property VendorMisc auto hidden
formlist property Pill_Items auto
fwsaveload property Data auto
spell property BeeingFemaleInfoSpell auto
activator property MaraShrineObject auto
armor property AmnioticFluid auto
spell property StatPregnancyCycle auto
fwabilitybeeingfemale[] property FWCached auto hidden
Int property MaxBabyPregnantWith hidden
	Int function get()

		return 6
	endFunction
endproperty
fwwidgetcontroller property WidgetController auto
Int property ChildFollowerFactionRank3 = 0 auto
Int property MSG_All hidden
	Int function get()

		return 0
	endFunction
endproperty
fwstatewidget property StateWidget auto
scroll property CallChildren1 auto
imagespacemodifier property iModPainHigh auto
Int[] property CheatAddFather auto hidden
spell property Effect_Eroeffnungswehen auto
Int property MSG_Error hidden
	Int function get()

		return 5
	endFunction
endproperty
magiceffect[] property BabyHealingMagicEffects auto
soulgem property BabyGem auto
Int property MSG_Note hidden
	Int function get()

		return 0
	endFunction
endproperty
Int property MSG_Immersive hidden
	Int function get()

		return 4
	endFunction
endproperty
Bool property EstrusActive = false auto hidden
Int property MSG_Low hidden
	Int function get()

		return 3
	endFunction
endproperty
spell property BeeingFemaleSpell auto
potion property ContraceptionLow auto
Int property MSG_Debug hidden
	Int function get()

		return 1
	endFunction
endproperty
spell property InfectionSpell auto
race[] property MountableRace auto
spell property Effect_Presswehen auto
magiceffect property WashOut_Effect auto
fwcontroller property Controller auto
fwbabyitemlist property BabyItemList auto
spell property Effect_BreastMilk3 auto
imagespacemodifier property iModPainMiddle auto
objectreference[] property VendorAlchemy auto hidden
magiceffect property Pill_Effect auto
Bool property DeviceActive = false auto hidden
spell property Effect_VaginalBloodBig auto
fwabilitybeeingfemale property Player auto hidden
fwpantywidget property PantyWidget auto
armor property Tampon_Bloody auto
activator property ArkayShrineObject auto
Int property MSG_Box hidden
	Int function get()

		return 1
	endFunction
endproperty
spell[] property StatCycleID_List auto
Int property UpdateState auto hidden
imagespacemodifier property DefaultBlur auto
book[] property PlayerBooks auto
armor property VaginalBleeding auto
fwchildsettings property ChildSettings auto
Quest property ChildFinder auto
Int property ChildFollowerFactionRank5 = 0 auto
fwaddonmanager property Manager auto
Float property Version auto
Float property MaxContraceptionTime hidden
	Float function get()

		return 2.00000
	endFunction
endproperty
spell property Effect_BreastMilk1 auto
faction property ChildFollowerFaction5 auto
faction property ChildFollowerFaction4 auto
Int property MSG_Trace hidden
	Int function get()

		return 2
	endFunction
endproperty
globalvariable property GlobalMenstruating auto
spell property Effect_Vorwehen auto
Int property ChildFollowerFactionRank2 = 0 auto
spell property Effect_MenstruationCramps auto
spell property FeverSpell auto
globalvariable property GlobalPlayerStatePercent auto
faction property ParentFaction auto
formlist property WashOut_List auto
globalvariable property ModEnabled auto
fwbabyhealthwidget property BabyHealthWidget auto
fwcontraceptionwidget property ContraceptionWidget auto
armor property Tampon_Normal auto
spell property BeeingMaleSpell auto
fwcouplewidget property CoupleWidget auto
fwsystemconfig property cfg auto
armor property DeviceBelt auto hidden
armor property Sanitary_Napkin_Normal auto
faction property ChildFollowerFaction3 auto
Float property MaxContraception hidden
	Float function get()

		return 98.0000
	endFunction
endproperty
fwtextcontents property Content auto
faction property FollowerFaction auto
faction property ChildFollowerFaction2 auto
scroll property CallChildren2 auto
faction property ChildFollowerFaction auto
imagespacemodifier property AbortusFever auto
objectreference[] property VendorSpells auto hidden
spell property Effect_VaginalBloodHigh auto
globalvariable property CloakingSpellEnabled auto
potion property ContraceptionMid auto
Int property lastStage auto hidden

;-- Variables ---------------------------------------
Int curRefreshWoman
Bool bFirstRun = true
Bool bCheckGiveSpermToNPCs = false
Int FWCacheID = 0
Bool bMessageEnabledAfterNewGameStarted = false
Bool bInitDone = false
Bool animationsOK = true
Int lastStage = -1
Int PlayerBleedOut
Float fLastUpdateGameTime
Float EggTravelingDuration_Percentage = 0.700000
Int FWCacheMax = 15
Float lastStoreUpdate
Float _version

;-- Functions ---------------------------------------

String function getRandomChildName(Int Sex) global

	String S = fwutility.getRandomName(Sex)
	if S != ""
		return S
	endIf
	fwtextcontents xCont = game.GetFormFromFile(15921, "BeeingFemale.esm") as fwtextcontents
	return xCont.BabyBlankName
endFunction

function CreateChildEnchantment(objectreference fwchild, actor Mother, actor Father) global

	Int[] durations
	Int[] areas
	Float[] magnitudes
	magiceffect[] effects
	Int num = utility.RandomInt(0, 100)
	if num > 90
		effects = new magiceffect[4]
		magnitudes = new Float[4]
		areas = new Int[4]
		durations = new Int[4]
		areas[0] = 0
		areas[1] = 0
		areas[2] = 0
		areas[3] = 0
		durations[0] = 0
		durations[1] = 0
		durations[2] = 0
		durations[3] = 0
	elseIf num > 70
		effects = new magiceffect[3]
		magnitudes = new Float[3]
		areas = new Int[3]
		durations = new Int[3]
		areas[0] = 0
		areas[1] = 0
		areas[2] = 0
		durations[0] = 0
		durations[1] = 0
		durations[2] = 0
	elseIf num > 40
		effects = new magiceffect[2]
		magnitudes = new Float[2]
		areas = new Int[2]
		durations = new Int[2]
		areas[0] = 0
		areas[1] = 0
		durations[0] = 0
		durations[1] = 0
	else
		effects = new magiceffect[1]
		magnitudes = new Float[1]
		areas = new Int[1]
		durations = new Int[1]
		areas[0] = 0
		durations[0] = 0
	endIf
	Int c = effects.length
	Int efx_c = fwutility.GetFileCount("Enchantments", "ini")
	while c > 0
		c -= 1
		Int ID = utility.RandomInt(0, efx_c - 1)
		String efx_file = fwutility.GetFileName("Enchantments", "ini", ID)
		String efx_ModName = fwutility.GetIniCString("Enchantments", efx_file, "Enchantments", "modFile", "")
		Int efx_FormID = fwutility.GetIniCInt("Enchantments", efx_file, "Enchantments", "form", 0)
		Float efx_Min = fwutility.GetIniCInt("Enchantments", efx_file, "Enchantments", "power_min", 0) as Float
		Float efx_Max = fwutility.GetIniCInt("Enchantments", efx_file, "Enchantments", "power_max", 0) as Float
		effects[c] = game.GetFormFromFile(efx_FormID, efx_ModName) as magiceffect
		magnitudes[c] = utility.RandomFloat(efx_Min, efx_Max)
	endWhile
	fwchild.CreateEnchantment(1.00000, effects, magnitudes, areas, durations)
endFunction

objectreference function SubSpawnChildItem(armor mo, Int gender, actor Mother, actor Father) global

	objectreference obj = Mother.PlaceAtMe(mo as form, 1, false, false)
	if obj != none
		objectreference obj2 = FWSystem.ChildItemSetup(obj as form, gender, Mother, Father)
		FWSystem.CreateChildEnchantment(obj2, Mother, Father)
		utility.Wait(1.00000)
		Mother.AddItem(obj2 as form, 1, false)
		Mother.EquipItem(obj2 as form, false, true)
	endIf
endFunction

form function StripSlot(actor ActorRef, Int Slot) global

	form ItemRef = ActorRef.GetWornForm(Slot)
	if ItemRef
		ActorRef.UnequipItem(ItemRef, false, true)
		return ItemRef
	endIf
	return none
endFunction

objectreference function ChildItemSetup(form frm, Int gender, actor Mother, actor Father) global

	String mName = "None"
	String fName = "None"
	String oName = "None"
	objectreference obj = frm as objectreference
	if Mother != none
		mName = Mother.GetLeveledActorBase().GetName()
	endIf
	if Father != none
		fName = Father.GetLeveledActorBase().GetName()
	endIf
	if obj != none
		oName = Father.GetDisplayName()
	elseIf frm != none
		oName = "Form." + frm.GetName()
	endIf
	fwchildarmor obj2 = obj as fwchildarmor
	if Father != none
		storageutil.SetFormValue(obj as form, "FW.Child.Father", Father as form)
	endIf
	if Mother != none
		storageutil.SetFormValue(obj as form, "FW.Child.Mother", Mother as form)
	endIf
	if gender == -1
		Int xflag = storageutil.GetIntValue(obj as form, "FW.Child.Flag", 0)
		if math.LogicalAnd(xflag, 4) == 4
			gender = 1
		else
			gender = 0
		endIf
	endIf
	String childName = FWSystem.getRandomChildName(gender)
	if obj2 != none
		if Mother == none
			Mother = storageutil.GetFormValue(obj as form, "FW.Child.Mother", none) as actor
		endIf
		if Father == none
			Father = storageutil.GetFormValue(obj as form, "FW.Child.Father", none) as actor
		endIf
		fwbabyitemlist xBabyItemList = game.GetFormFromFile(6197, "BeeingFemale.esm") as fwbabyitemlist
		obj2.Name = childName
		obj2.SetSex(gender)
		obj2.SetVampire(false)
		obj2.SetParent(Mother, Father)
		obj2.ChildRace = xBabyItemList.LastRace
		obj2.SetName(childName)
		obj2.SetDisplayName(childName, false)
		return obj2 as objectreference
	elseIf obj != none
		obj.SetName(childName)
		obj.SetDisplayName(childName, false)
		return obj
	endIf
endFunction

function refreshObjective()

	; Empty function
endFunction

Bool function LayDown(actor a)

	objectreference BedRef = Manager.OnGetBedRef(a)
	if BedRef != none
		if !BedRef.IsFurnitureInUse(true)
			a.MoveTo(BedRef, 0.000000, 0.000000, 0.000000, true)
			a.SetAngle(BedRef.getAngleX(), BedRef.getAngleY(), BedRef.getAngleZ())
			utility.Wait(1.00000)
			debug.SendAnimationEvent(a as objectreference, "LayDownBirth")
			utility.Wait(3.60000)
			return true
		endIf
	endIf
	debug.SendAnimationEvent(a as objectreference, "LayDownBirth")
	utility.Wait(3.60000)
	return false
endFunction

Float function getDamageScale(Int DamageType, actor a)

	return Manager.getActorDamageScale(DamageType, a)
endFunction

Float function GetSpermRelevance(actor female, actor male)

	Float result = 1.00000
	if female != none && male != none
		if female.HasFamilyRelationship(male) == true
			result += 0.100000
		endIf
		if female.HasParentRelationship(male) == true
			result -= 0.150000
		endIf
		Int relationship = female.GetRelationshipRank(male)
		result *= ((relationship + 14) / 13) as Float
	endIf
	return result
endFunction

function CheckOtherMods()

	Bool bEstrusWasActive = EstrusActive
	Bool bDeviceWasActive = DeviceActive
	ChaurusBreeder = none
	DeviceBelt = none
	EstrusActive = false
	DeviceActive = false
	HearthFiresActive = false
	Bool SSL_installed = false
	Int idx = game.GetModCount()
	String modName = ""
	while idx > 0
		idx -= 1
		modName = game.GetModName(idx)
		if modName == "EstrusChaurus.esp"
			ChaurusBreeder = game.GetFormFromFile(102689, modName) as spell
			EstrusActive = true
			if bEstrusWasActive == false
				self.Message(Content.EstrusCharusFound, self.MSG_Debug, 0)
			endIf
		elseIf modName == "HearthFires.esm"
			HearthFiresActive = true
		elseIf modName == "Devious Devices - Assets.esm"
			DeviceBelt = game.GetFormFromFile(4817, modName) as armor
			DeviceActive = true
		elseIf modName == "SexLab.esm"
			SSL_installed = true
		endIf
	endWhile
	if SSL_installed == false
		cfg.CreatureSperm = false
	endIf
endFunction

function raiseModEventA(String EventName, actor a)

	self.SendModEvent("BeeingFemale", EventName, a.GetFormID() as Float)
endFunction

function InstantBornChilds(actor a)

	Int numChilds = storageutil.GetIntValue(a as form, "FW.NumChilds", numChilds)
	if numChilds == 0
		return 
	endIf
	Float BabyHealth = storageutil.GetFloatValue(a as form, "FW.UnbornHealth", 100.000)
	while numChilds > 0
		numChilds -= 1
		Float rndHealth = utility.RandomFloat(1.00000, 25.0000)
		if BabyHealth > rndHealth
			self.SpawnChild(a, storageutil.FormListGet(a as form, "FW.ChildFather", numChilds) as actor)
		endIf
	endWhile
	storageutil.FormListClear(a as form, "FW.ChildFather")
	storageutil.SetIntValue(a as form, "FW.NumChilds", 0)
	storageutil.UnsetIntValue(a as form, "FW.Abortus")
	storageutil.UnsetFloatValue(a as form, "FW.UnbornHealth")
	storageutil.UnsetFloatValue(a as form, "FW.AbortusTime")
endFunction

function PlayerTimer(Bool enabled)

	if Player == none
		return 
	endIf
	if enabled == true
		Controller.Pause(game.GetPlayer(), false)
		Player.OnUpdateFunction()
	else
		Controller.Pause(game.GetPlayer(), true)
	endIf
endFunction

fwabilitybeeingfemale function getBeeingFemaleSpell(actor woman)

	Int j = 0
	while j < FWCacheMax
		if FWCached[j].ActorRef == woman
			return FWCached[j]
		endIf
		j += 1
	endWhile
	return none
endFunction

Float function LutealImpregnationTime(Float CurrentStatePercent)

	Float res = 90.0000 - CurrentStatePercent * 1.66667
	if res < 0.000000
		return 0.000000
	else
		return res
	endIf
endFunction

Float function ModuloOne(Float v)
{Returns a float of (v % 1)}

	return v - math.Floor(v) as Float
endFunction

String function console_PrintRaceBaby(Bool bLog, race r, String Baby)

	Int c = storageutil.FormListCount(r as form, "FW.AddOn." + Baby)
	if c > 0
		String S = Baby + ": "
		Bool bFirst = true
		while c > 0
			c -= 1
			if !bFirst
				S += ", "
			endIf
			form f = storageutil.FormListGet(r as form, "FW.AddOn." + Baby, c)
			if f != none
				S += f.GetName() + " [" + fwutility.Hex(f.GetFormID(), 8) + "]"
				bFirst = false
			endIf
		endWhile
		if bFirst
			debug.Trace("- " + Baby + ": none - All are nothing", 0)
			return ""
		else
			debug.Trace("- " + S, 0)
			return "\n" + S
		endIf
	elseIf bLog
		debug.Trace("- " + Baby + ": none", 0)
		return ""
	endIf
endFunction

function OnUpdateGameTime()

	if cfg.ImpregnateActive
		self.CheckGiveSpermToNPCs()
	endIf
	self.RegisterForSingleUpdateGameTime(1.00000)
endFunction

; Skipped compiler generated GotoState

Bool function CanBecomePregnant(actor woman)

	Float Chance = cfg.ConceiveChanceNPC
	if game.GetPlayer() == woman
		Chance = cfg.ConceiveChance
	elseIf woman.IsInFaction(FollowerFaction)
		Chance = cfg.ConceiveChanceFollower
	endIf
	Chance *= Manager.PregnancyChanceActorScale(woman)
	if utility.RandomFloat(0.000000, 100.000) < Chance
		return true
	else
		return false
	endIf
endFunction

function showBornMessage(actor Mother, actor Father, Int Sex)

	if Father == game.GetPlayer()
		if Sex == 0
			self.Message(fwutility.StringReplace(Content.NPCFatherBornHealthyBoy, "{0}", Mother.GetLeveledActorBase().GetName()), self.MSG_Always, self.MSG_Box)
		else
			self.Message(fwutility.StringReplace(Content.NPCFatherBornHealthyGirl, "{0}", Mother.GetLeveledActorBase().GetName()), self.MSG_Always, self.MSG_Box)
		endIf
	elseIf Mother == game.GetPlayer()
		if Sex == 0
			self.Message(Content.YouBornHealthyBoy, self.MSG_All, self.MSG_Box)
		else
			self.Message(Content.YouBornHealthyGirl, self.MSG_All, self.MSG_Box)
		endIf
	elseIf Mother.IsInFaction(FollowerFaction)
		if Sex == 0
			self.Message(fwutility.StringReplace(Content.NPCBornHealthyBoy, "{0}", Mother.GetLeveledActorBase().GetName()), self.MSG_Immersive, self.MSG_Box)
		else
			self.Message(fwutility.StringReplace(Content.NPCBornHealthyGirl, "{0}", Mother.GetLeveledActorBase().GetName()), self.MSG_Always, self.MSG_Box)
		endIf
	elseIf Mother != game.GetPlayer()
		if Sex == 0
			self.Message(fwutility.StringReplace(Content.NPCBornHealthyBoy, "{0}", Mother.GetLeveledActorBase().GetName()), self.MSG_High, 0)
		else
			self.Message(fwutility.StringReplace(Content.NPCBornHealthyGirl, "{0}", Mother.GetLeveledActorBase().GetName()), self.MSG_Always, self.MSG_Box)
		endIf
	endIf
endFunction

function CheckGiveSpermToNPCs()
{Check if it's time to randomly add some sperm to some NPCs}

	Float startTime = utility.GetCurrentRealTime()
	if bCheckGiveSpermToNPCs
		return 
	endIf
	bCheckGiveSpermToNPCs = true
	Float cur = utility.GetCurrentGameTime()
	if fLastUpdateGameTime < 1.00000
		fLastUpdateGameTime = utility.GetCurrentGameTime()
		bCheckGiveSpermToNPCs = false
		return 
	endIf
	Float Dur = cur - fLastUpdateGameTime
	Float HoursSinceSex = 0.000000
	if Dur > 0.0100000
		Bool bFound = false
		if Dur > 1.00000
			bFound = true
		else
			Float SpanMin = self.ModuloOne(cur - Dur) * 24.0000
			if SpanMin < 0.000000
				SpanMin = 0.000000
			endIf
			Float SpanMax = self.ModuloOne(cur) * 24.0000
			if SpanMax > SpanMin
				bFound = SpanMin < cfg.ImpregnateTime as Float && SpanMax >= cfg.ImpregnateTime as Float
			elseIf SpanMin >= SpanMax
				bFound = SpanMin > cfg.ImpregnateTime as Float && SpanMax <= cfg.ImpregnateTime as Float
			endIf
		endIf
		Int success = 0
		if bFound
			Float cur24Time = self.ModuloOne(cur)
			if cur24Time >= cfg.ImpregnateTime as Float
				HoursSinceSex = cur24Time - cfg.ImpregnateTime as Float
			else
				HoursSinceSex = cur24Time + (24 - cfg.ImpregnateTime) as Float
			endIf
			Int c = storageutil.FormListCount(none, "FW.SavedNPCs")
			Int i = cfg.ImpregnateCount
			while i > 0
				i -= 1
				Int rnd = utility.RandomInt(1, c) - 1
				actor f = storageutil.FormListGet(none, "FW.SavedNPCs", rnd) as actor
				if f != none
					self.Message("[" + (cfg.ImpregnateCount - i) as String + "/" + cfg.ImpregnateCount as String + "] " + fwutility.StringReplace(Content.CheckGiveSperm, "{0}", f.GetLeveledActorBase() as String), self.MSG_Debug, self.MSG_Trace)
					if self.CheckGiveSpermToNPC(f, utility.GetCurrentGameTime() - HoursSinceSex + utility.RandomFloat(-0.0318000, 0.0208000))
						success += 1
					endIf
				endIf
			endWhile
		endIf
		if success > 0
			self.Message(fwutility.StringReplace(Content.SpermAdded, "{0}", success as String), self.MSG_Debug, 0)
		endIf
		fLastUpdateGameTime = utility.GetCurrentGameTime()
	endIf
	bCheckGiveSpermToNPCs = false
endFunction

Int function IsValidateFemaleActor(actor a, Bool bIgnoreRelevance)

	if a == none
		return -10
	endIf
	if a.GetLeveledActorBase() == none
		return -11
	endIf
	if a.IsInFaction(ForbiddenFaction) || a.HasKeywordString("SexLabForbid")
		return -1
	endIf
	if a.IsDead()
		return -2
	endIf
	if a.GetLeveledActorBase().GetSex() == 0
		return -3
	endIf
	if a.GetLeveledActorBase().IsUnique() == false
		return -4
	endIf
	if game.GetPlayer() == a && cfg.RelevantPlayer == false && bIgnoreRelevance == false
		return -5
	elseIf game.GetPlayer() != a
		if a.IsInFaction(FollowerFaction) && cfg.RelevantFollower == false && bIgnoreRelevance == false
			return -6
		endIf
		if a.IsInFaction(FollowerFaction) == false && cfg.RelevantNPC == false && bIgnoreRelevance == false
			return -7
		endIf
	endIf
	race ActorRace = a.GetLeveledActorBase().GetRace()
	String RaceName = ActorRace.GetName() + miscutil.GetRaceEditorID(ActorRace)
	if ActorRace.HasKeywordString("ActorTypeCreature") && cfg.CreatureSperm == false
		return -11
	endIf
	if ActorRace.IsRaceFlagSet(4) || stringutil.Find(RaceName, "Child", 0) != -1 || stringutil.Find(RaceName, "Little", 0) != -1 || stringutil.Find(RaceName, "117", 0) != -1 || stringutil.Find(RaceName, "Monli", 0) != -1 && a.GetScale() < 0.930000 || stringutil.Find(RaceName, "Elin", 0) != -1 || stringutil.Find(RaceName, "Enfant", 0) != -1
		return -8
	elseIf stringutil.Find(RaceName, "Elder", 0) != -1
		return -9
	endIf
	if game.GetPlayer() == a
		return 1
	elseIf a.IsInFaction(FollowerFaction)
		return 2
	else
		return 3
	endIf
endFunction

function OnGameLoad(Bool bIsModReset)

	cfg.bForceMenu = false
	LoadState = 1
	if bFirstRun == true
		self.Message(Content.InitBF, self.MSG_Always, 0)
	elseIf cfg.Messages <= 1
		
	endIf
	LoadState = 2
	self.UnregisterForAllModEvents()
	self.UnregisterForUpdateGameTime()
	self.UnregisterForUpdate()
	self.UnregisterForMenu("Console")
	LoadState = 3
	self.RegisterForMenu("Console")
	self.SetImportantItems()
	Content.LoadContent()
	if bFirstRun == true || cfg.Messages <= 1
		self.Message(Content.Req_BF, self.MSG_Always, 0)
	endIf
	LoadState = 4
	if stringutil.SubString(debug.GetVersionNumber(), 0, 3) as Float < 1.90000
		ModEnabled.SetValueInt(0)
		CloakingSpellEnabled.SetValueInt(0)
		if bFirstRun == true || cfg.Messages <= 1
			
		endIf
		LoadState = 5
		self.Message(Content.Req_Skyrim, self.MSG_Always, self.MSG_Box)
		return 
	elseIf skse.GetVersionRelease() == 0
		ModEnabled.SetValueInt(0)
		CloakingSpellEnabled.SetValueInt(0)
		if bFirstRun == true || cfg.Messages <= 1
			
		endIf
		LoadState = 6
		self.Message(Content.Req_SKSE, self.MSG_Always, self.MSG_Box)
		return 
	elseIf skse.GetScriptVersionRelease() < 48
		ModEnabled.SetValueInt(0)
		CloakingSpellEnabled.SetValueInt(0)
		if bFirstRun == true || cfg.Messages <= 1
			
		endIf
		LoadState = 7
		self.Message(Content.Req_SKSEScript, self.MSG_Always, self.MSG_Box)
		return 
	elseIf skse.GetPluginVersion("papyrusutil plugin") == -1
		ModEnabled.SetValueInt(0)
		CloakingSpellEnabled.SetValueInt(0)
		if bFirstRun == true || cfg.Messages <= 1
			
		endIf
		LoadState = 8
		self.Message(Content.Req_PapyrusUtil, self.MSG_Always, self.MSG_Box)
		return 
	elseIf skse.GetPluginVersion("BeeingFemale") == -1
		ModEnabled.SetValueInt(0)
		CloakingSpellEnabled.SetValueInt(0)
		if bFirstRun == true || cfg.Messages <= 1
			
		endIf
		LoadState = 9
		self.Message(Content.Req_BeeingFemaleNative + " -1/" + fwversion.GetNativeVersion() as String, self.MSG_Always, self.MSG_Box)
		return 
	elseIf skse.GetPluginVersion("BeeingFemale") < fwversion.GetNativeVersion()
		ModEnabled.SetValueInt(0)
		CloakingSpellEnabled.SetValueInt(0)
		if bFirstRun == true || cfg.Messages <= 1
			
		endIf
		LoadState = 10
		self.Message(fwutility.MultiStringReplace(Content.Req_BeeingFemaleNativeUpdate, skse.GetPluginVersion("BeeingFemale") as String, fwversion.GetNativeVersion() as String, "", "", "", "") + " " + skse.GetPluginVersion("BeeingFemale") as String + "/" + fwversion.GetNativeVersion() as String, self.MSG_Always, self.MSG_Box)
		return 
	endIf
	LoadState = 11
	if fnis.VersionCompare(5, 4, 2, false) < 0
		if animationsOK == true
			debug.Notification(Content.FNISNotInstalled)
		endIf
		cfg.PlayAnimations = false
		animationsOK = false
		LoadState = 12
	else
		if animationsOK == false || bFirstRun == true
			debug.Notification(Content.FNISUsing)
		endIf
		animationsOK = true
		LoadState = 14
	endIf
	if bFirstRun
		LoadState = 15
		self.initArrays()
		LoadState = 16
		self.giveStartupSpells()
		LoadState = 17
		self.giveStartupItems(0)
		LoadState = 18
		self.initDrinkStor()
	endIf
	LoadState = 19
	cfg.LoadWidgetProfile("")
	LoadState = 20
	if bFirstRun == true || cfg.Messages <= 1
		
	endIf
	LoadState = 21
	self.CheckOtherMods()
	LoadState = 22
	if bFirstRun == true || cfg.Messages <= 1
		
	endIf
	LoadState = 23
	CoupleWidget.enabled = false
	if bFirstRun == true || cfg.Messages <= 1
		
	endIf
	LoadState = 24
	actor PA = game.GetPlayer()
	LoadState = 25
	utility.WaitMenuMode(2.00000)
	LoadState = 26
	self.RegisterForModEvent("AddActorSperm", "onAddActorSperm")
	self.RegisterForModEvent("AddSperm", "onAddActorSperm")
	self.RegisterForModEvent("BeeingFemale", "onBeeingFemaleCommand")
	self.RegisterForModEvent("consolecommand", "onBeeingFemaleConsole")
	LoadState = 27
	self.RegisterForSingleUpdateGameTime(1.00000)
	LoadState = 28
	bCheckGiveSpermToNPCs = false
	if bFirstRun == true || cfg.Messages <= 1
		
	endIf
	LoadState = 29
	if Player != none && PA.GetLeveledActorBase().GetSex() == 1 && !bIsModReset
		LoadState = 30
		Player.OnPlayerLoadGame()
		LoadState = 31
	elseIf PlayerMale != none && PA.GetLeveledActorBase().GetSex() == 0 && !bIsModReset
		LoadState = 32
		PlayerMale.OnPlayerLoadGame()
		LoadState = 33
	else
		LoadState = 34
		self.ReNewSpells()
		LoadState = 35
	endIf
	LoadState = 36
	ChildSettings.OnGameLoad()
	LoadState = 37
	cfg.OnLoadGame()
	LoadState = 38
	Manager.OnGameLoad()
	LoadState = 40
	if bFirstRun == true || cfg.Messages <= 1
		
	endIf
	LoadState = 41
	if cfg.UpdateInterval < 10.0000
		LoadState = 42
		cfg.UpdateInterval = 10.0000
	endIf
	if cfg.UpdateIntervalEnabled == true
		LoadState = 43
		self.RegisterForSingleUpdate(cfg.UpdateInterval)
	endIf
	LoadState = 44
	if bFirstRun == true || cfg.Messages <= 1
		
	endIf
	LoadState = 45
	Int childCount = storageutil.FormListCount(none, "FW.Babys")
	LoadState = 46
	while childCount > 0
		childCount -= 1
		form frm = storageutil.FormListGet(none, "FW.Babys", childCount)
		if frm as fwchildactor == none && frm as fwchilditem == none
			storageutil.FormListRemoveAt(none, "FW.Babys", childCount)
		endIf
	endWhile
	LoadState = 47
	ModEnabled.SetValueInt(1)
	CloakingSpellEnabled.SetValueInt(1)
	LoadState = 48
	self.UpdateHotKey()
	LoadState = 49
	if bFirstRun as Bool || bIsModReset
		bFirstRun = false
		self.Message(Content.InstallComplete, self.MSG_Always, 0)
		LoadState = 50
	elseIf cfg.Messages <= 1
		self.Message(Content.LoadingComplete, self.MSG_Always, 0)
		LoadState = 51
	endIf
	LoadState = 0
endFunction

function Blur(Float Strength, imagespacemodifier Effect)

	DefaultBlur.Remove()
	if Effect == none
		DefaultBlur.Apply(Strength)
	else
		Effect.Apply(Strength)
	endIf
endFunction

Int function calculateNumChildren(actor woman)

	Int result = 1
	Float counter = 1.00000e+006
	Float Chance = utility.RandomFloat(0.000000, counter)
	Int i = 0
	Float MaxBabys = cfg.MaxBabys as Float * Manager.ActorMaxBabse(woman)
	Float MaxBabyChance = Manager.ActorMaxChance(woman)
	if MaxBabys < 1.00000
		MaxBabys = 1.00000
	endIf
	while i < 6
		counter /= cfg.MultipleThreshold as Float * MaxBabyChance
		if counter > Chance
			result += 1
		endIf
		i += 1
	endWhile
	if result > math.Floor(MaxBabys)
		result = math.Floor(MaxBabys)
	endIf
	if result > self.MaxBabyPregnantWith
		result = self.MaxBabyPregnantWith
	endIf
	return result
endFunction

function UpdateHotKey()

	StateWidget.updateConfig()
	ContraceptionWidget.updateConfig()
	BabyHealthWidget.updateConfig()
	WidgetController.updateConfig()
endFunction

Bool function CheckForCondome(actor woman, actor man)

	return Manager.CheckForCondome(woman, man)
endFunction

Float function getMaleSpermDuration(actor a)

	if a == none
		return cfg.SpermDuration
	else
		Float sd = Manager.ActorMaleSpermDurationScale(a)
		if sd <= 0.000000
			return cfg.SpermDuration
		else
			return cfg.SpermDuration * sd
		endIf
	endIf
endFunction

Bool function CheckIsLoreFriendlyRequired(actor a)

	return a.GetRace().HasKeywordString("IsBeastRace")
endFunction

; Skipped compiler generated GetState

Int function IsValidateActor(actor a, Bool bIgnoreRelevance)

	if a == none
		return -10
	endIf
	if a.GetLeveledActorBase() == none
		return -11
	endIf
	if a.GetLeveledActorBase().GetSex() == 0
		return self.IsValidateMaleActor(a, bIgnoreRelevance)
	elseIf a.GetLeveledActorBase().GetSex() == 1
		return self.IsValidateFemaleActor(a, bIgnoreRelevance)
	endIf
endFunction

Bool function CanBecomePMS(actor woman)

	Float Chance = cfg.PMSChance * Manager.PMSChanceActorScale(woman)
	if utility.RandomFloat(0.000000, 100.000) < Chance
		return true
	else
		return false
	endIf
endFunction

Float function getPainLevel(Int stateID)

	if stateID == 1
		return utility.RandomFloat(0.100000, 2.50000)
	elseIf stateID == 3
		return utility.RandomFloat(0.100000, 2.50000)
	endIf
endFunction

function initArrays()

	CheatAddFather = new Int[27]
	CheatAddFather[0] = 78965
	CheatAddFather[1] = 714617
	CheatAddFather[2] = 78668
	CheatAddFather[3] = 78730
	CheatAddFather[4] = 131136
	CheatAddFather[5] = 81982
	CheatAddFather[6] = 78468
	CheatAddFather[7] = 418221
	CheatAddFather[8] = 80745
	CheatAddFather[9] = 78675
	CheatAddFather[10] = 78704
	CheatAddFather[11] = 548164
	CheatAddFather[12] = 513657
	CheatAddFather[13] = 216473
	CheatAddFather[14] = 234064
	CheatAddFather[15] = 879320
	CheatAddFather[16] = 113501
	CheatAddFather[17] = 104795
	CheatAddFather[18] = 244774
	CheatAddFather[19] = 111541
	CheatAddFather[20] = 115627
	CheatAddFather[21] = 80798
	CheatAddFather[22] = 115100
	CheatAddFather[23] = 78976
	CheatAddFather[24] = 111055
	CheatAddFather[25] = 315691
	CheatAddFather[26] = 78488
	FWCached = new fwabilitybeeingfemale[15]
	FWCacheMax = FWCached.length
endFunction

function OnInit()

	FWCached = new fwabilitybeeingfemale[15]
	if !bInitDone
		bInitDone = true
		self.RegisterForSingleUpdate(15.0000)
	endIf
endFunction

function PlayBleedOut(actor a)

	if a.GetSitState() == 0 && a.IsOnMount() == false
		if a.IsWeaponDrawn()
			a.SheatheWeapon()
		endIf
		if game.GetPlayer() == a
			if PlayerBleedOut == 0
				debug.SendAnimationEvent(a as objectreference, "IdleForceDefaultState")
				debug.SendAnimationEvent(a as objectreference, "BleedOutStart")
			endIf
			PlayerBleedOut += 1
		else
			debug.SendAnimationEvent(a as objectreference, "IdleForceDefaultState")
			debug.SendAnimationEvent(a as objectreference, "BleedOutStart")
		endIf
	endIf
endFunction

String function getValidateMessage(Int ID)

	if ID == -1
		return Content.ForbiddenReason1
	elseIf ID == -2
		return Content.ForbiddenReason2
	elseIf ID == -3
		return Content.ForbiddenReason3
	elseIf ID == -4
		return Content.ForbiddenReason4
	elseIf ID == -5
		return Content.ForbiddenReason5
	elseIf ID == -6
		return Content.ForbiddenReason6
	elseIf ID == -7
		return Content.ForbiddenReason7
	elseIf ID == -8
		return Content.ForbiddenReason8
	elseIf ID == -9
		return Content.ForbiddenReason9
	elseIf ID == -10
		return Content.ForbiddenReason10
	elseIf ID == -11
		return Content.ForbiddenReason11
	endIf
endFunction

function initDrinkStor()

	; Empty function
endFunction

function CheckPlayerSex()

	actor p = game.GetPlayer()
	if p.GetLeveledActorBase().GetSex() == 0
		if Player != none
			p.RemoveSpell(BeeingFemaleSpell)
			p.DispelSpell(BeeingFemaleSpell)
			Player = none
		endIf
		if PlayerMale == none
			p.AddSpell(BeeingMaleSpell, true)
		endIf
	elseIf p.GetLeveledActorBase().GetSex() == 1
		if PlayerMale != none
			p.RemoveSpell(BeeingMaleSpell)
			p.DispelSpell(BeeingMaleSpell)
			PlayerMale = none
		endIf
		if Player == none
			p.AddSpell(BeeingFemaleSpell, true)
		endIf
	endIf
endFunction

function giveStartupItems(Int oldVersion)

	actor PlayerActor = game.GetPlayer()
	if oldVersion <= 2
		PlayerActor.AddItem(PlayerBooks[0] as form, 1, true)
		PlayerActor.AddItem(PlayerBooks[1] as form, 1, true)
		PlayerActor.AddItem(PlayerBooks[2] as form, 1, true)
		PlayerActor.AddItem(PlayerBooks[3] as form, 1, true)
	endIf
	if oldVersion <= 9
		PlayerActor.AddItem(StartUpScrolls[0] as form, 3, true)
		PlayerActor.AddItem(StartUpScrolls[1] as form, 1, true)
	endIf
endFunction

function stopBleedOut(actor a)

	if game.GetPlayer() == a
		PlayerBleedOut -= 1
		if PlayerBleedOut == 0
			debug.SendAnimationEvent(a as objectreference, "BleedOutStop")
			debug.SendAnimationEvent(a as objectreference, "IdleForceDefaultState")
		endIf
	else
		debug.SendAnimationEvent(a as objectreference, "BleedOutStop")
		debug.SendAnimationEvent(a as objectreference, "IdleForceDefaultState")
	endIf
endFunction

Form[] function StripActor(actor ActorRef)

	Form[] f = Manager.OnStripActor(ActorRef)
	if f.length > 0
		return f
	endIf
	Form[] Stripped = new Form[21]
	form ItemRef = ActorRef.GetEquippedWeapon(false) as form
	if ItemRef
		ActorRef.UnequipItemEX(ItemRef, 1, false)
		Stripped[0] = ItemRef
	endIf
	ItemRef = ActorRef.GetEquippedWeapon(true) as form
	if ItemRef
		ActorRef.UnequipItemEX(ItemRef, 2, false)
		Stripped[1] = ItemRef
	endIf
	Stripped[2] = FWSystem.StripSlot(ActorRef, 30)
	Stripped[3] = FWSystem.StripSlot(ActorRef, 31)
	Stripped[4] = FWSystem.StripSlot(ActorRef, 32)
	Stripped[5] = FWSystem.StripSlot(ActorRef, 33)
	Stripped[6] = FWSystem.StripSlot(ActorRef, 34)
	Stripped[7] = FWSystem.StripSlot(ActorRef, 37)
	Stripped[8] = FWSystem.StripSlot(ActorRef, 38)
	Stripped[9] = FWSystem.StripSlot(ActorRef, 39)
	Stripped[10] = FWSystem.StripSlot(ActorRef, 41)
	Stripped[11] = FWSystem.StripSlot(ActorRef, 45)
	Stripped[12] = FWSystem.StripSlot(ActorRef, 46)
	Stripped[13] = FWSystem.StripSlot(ActorRef, 47)
	Stripped[14] = FWSystem.StripSlot(ActorRef, 49)
	Stripped[15] = FWSystem.StripSlot(ActorRef, 53)
	Stripped[16] = FWSystem.StripSlot(ActorRef, 54)
	Stripped[17] = FWSystem.StripSlot(ActorRef, 56)
	Stripped[18] = FWSystem.StripSlot(ActorRef, 57)
	Stripped[19] = FWSystem.StripSlot(ActorRef, 58)
	Stripped[20] = FWSystem.StripSlot(ActorRef, 59)
	return Stripped
endFunction

actor function SpawnChildActor(actor Mother, actor Father)

	Bool bIsPlayerChild = false
	if Mother == game.GetPlayer() || Father == game.GetPlayer()
		bIsPlayerChild = true
	endIf
	Int gender = utility.RandomInt(0, 100)
	if gender < 53
		gender = 0
	else
		gender = 1
	endIf
	actorbase newChildBase = BabyItemList.getBabyActor(Mother, Father, gender)
	if newChildBase == none
		return none
	endIf
	if (utility.RandomInt(1, 2) == 1 || Mother == none) && Father != none
		newChildBase.SetHairColor(Father.GetLeveledActorBase().GetHairColor())
	elseIf Mother != none
		newChildBase.SetHairColor(Mother.GetLeveledActorBase().GetHairColor())
	endIf
	Int i = 0
	while i < 20
		if (utility.RandomInt(1, 2) == 1 || Mother == none) && Father != none
			newChildBase.SetFaceMorph(Father.GetLeveledActorBase().GetFaceMorph(i), i)
		elseIf Mother != none
			newChildBase.SetFaceMorph(Mother.GetLeveledActorBase().GetFaceMorph(i), i)
		endIf
		i += 1
	endWhile
	actor newChild = Mother.PlaceActorAtMe(newChildBase, 4, none)
	if newChild != none
		String childName = FWSystem.getRandomChildName(gender)
		newChild.MoveTo(Mother as objectreference, 50.0000, 50.0000, 10.0000, true)
		newChild.QueueNiNodeUpdate()
		newChild.MakePlayerFriend()
		if Mother != none
			newChild.SetRelationshipRank(Mother, 2)
			Mother.SetRelationshipRank(newChild, 2)
		endIf
		if Father != none
			newChild.SetRelationshipRank(Father, 2)
			Father.SetRelationshipRank(newChild, 2)
		endIf
		if Mother == game.GetPlayer() || Father == game.GetPlayer()
			if ChildFollowerFaction != none
				newChild.SetFactionRank(ChildFollowerFaction, ChildFollowerFactionRank)
			endIf
			if ChildFollowerFaction2 != none
				newChild.SetFactionRank(ChildFollowerFaction2, ChildFollowerFactionRank2)
			endIf
			if ChildFollowerFaction3 != none
				newChild.SetFactionRank(ChildFollowerFaction3, ChildFollowerFactionRank3)
			endIf
			if ChildFollowerFaction4 != none
				newChild.SetFactionRank(ChildFollowerFaction4, ChildFollowerFactionRank4)
			endIf
			if ChildFollowerFaction5 != none
				newChild.SetFactionRank(ChildFollowerFaction5, ChildFollowerFactionRank5)
			endIf
			newChild.SetPlayerTeammate(true, false)
			if Mother == game.GetPlayer()
				ChildSettings.SetOtherParentAlias(Father as objectreference, true)
			else
				ChildSettings.SetOtherParentAlias(Mother as objectreference, true)
			endIf
		else
			newChild.SetRelationshipRank(game.GetPlayer(), 2)
		endIf
		if bIsPlayerChild == true
			if HearthFiresActive == true
				faction f1 = game.GetFormFromFile(17040, "HearthFires.esm") as faction
				faction f2 = game.GetFormFromFile(17072, "HearthFires.esm") as faction
				newChild.SetFactionRank(f1, 25)
				newChild.SetFactionRank(f2, 1)
			endIf
		endIf
		newChild.EnableAI(true)
		newChild.EvaluatePackage()
		fwchildactor fwchild = newChild as fwchildactor
		if fwchild != none
			fwchild.ChildRace = BabyItemList.LastRace
			if gender == 0
				fwchild.SetAV("Comprehension", 5.00000)
				fwchild.SetAV("Destruction", 10.0000)
				fwchild.SetAV("Illusion", 10.0000)
				fwchild.SetAV("Conjuration", 10.0000)
				fwchild.SetAV("Restoration", 10.0000)
				fwchild.SetAV("Alteration", 10.0000)
				fwchild.SetAV("Block", 10.0000)
				fwchild.SetAV("OneHanded", 10.0000)
				fwchild.SetAV("TwoHanded", 10.0000)
				fwchild.SetAV("Marksman", 5.00000)
				fwchild.SetAV("Sneak", 10.0000)
				fwchild.SetAV("Magicka", 15.0000)
				fwchild.SetAV("CarryWeight", 35.0000)
				fwchild.SetAV("Health", 80.0000)
				fwchild.SetAV("SpeedMult", 100.000)
				fwchild.SetAV("HealRate", 0.600000)
				fwchild.SetAV("MagickaRate", 1.40000)
				fwchild.SetAV("StaminaRate", 2.80000)
			else
				fwchild.SetAV("Comprehension", 10.0000)
				fwchild.SetAV("Destruction", 10.0000)
				fwchild.SetAV("Illusion", 10.0000)
				fwchild.SetAV("Conjuration", 10.0000)
				fwchild.SetAV("Restoration", 10.0000)
				fwchild.SetAV("Alteration", 10.0000)
				fwchild.SetAV("Block", 10.0000)
				fwchild.SetAV("OneHanded", 5.00000)
				fwchild.SetAV("TwoHanded", 5.00000)
				fwchild.SetAV("Marksman", 10.0000)
				fwchild.SetAV("Sneak", 10.0000)
				fwchild.SetAV("Magicka", 35.0000)
				fwchild.SetAV("CarryWeight", 15.0000)
				fwchild.SetAV("Health", 80.0000)
				fwchild.SetAV("SpeedMult", 95.0000)
				fwchild.SetAV("HealRate", 0.500000)
				fwchild.SetAV("MagickaRate", 1.60000)
				fwchild.SetAV("StaminaRate", 2.80000)
			endIf
			fwchild.Mother = Mother
			fwchild.Father = Father
			fwchild.Name = childName
			fwchild.Sex = gender
			fwchild.IsVampire = false
			fwchild.SetLevel(1)
			fwchild.DayOfBirth = utility.GetCurrentGameTime()
			fwchild.Order_WaitAndPlay()
			if Father != none
				if Father.GetLeveledActorBase().IsUnique()
					if Mother.HasFamilyRelationship(Father) == true || Mother.GetRelationshipRank(Father) == 4 && utility.RandomInt(0, 10) > 7
						fwchild.UseFathersLastName = true
					else
						fwchild.UseFathersLastName = false
					endIf
				else
					fwchild.UseFathersLastName = false
				endIf
			else
				fwchild.UseFathersLastName = false
			endIf
			fwchild.InitChild()
		else
			newChild.SetDisplayName(childName, false)
			newChild.SetName(childName)
		endIf
	endIf
	self.showBornMessage(Mother, Father, newChild.GetLeveledActorBase().GetSex())
	return newChild
endFunction

function InfoMenuBlur()

	self.RegisterForModEvent("InfoMenuClosed", "onInfoMenuClosed")
	MenuImageSpace.Apply(1.00000)
endFunction

function UnstripActor(actor ActorRef, Form[] Striped)

	Int hand = 1
	Int i = Striped.length
	while i > 0
		i -= 1
		hand = self.UnstripSlot(ActorRef, Striped[i], hand)
	endWhile
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	UpdateState = 1
	String BFVersion = fwversion.GetVersionString() + "." + fwversion.GetMCMVersion() as String
	self.Message(fwutility.StringReplace(Content.Updated, "{0}", BFVersion), self.MSG_Always, 0)
	cfg = game.GetFormFromFile(6184, "BeeingFemale.esm") as fwsystemconfig
	Content = game.GetFormFromFile(15921, "BeeingFemale.esm") as fwtextcontents
	Data = game.GetFormFromFile(6183, "BeeingFemale.esm") as fwsaveload
	Manager = game.GetFormFromFile(6185, "BeeingFemale.esm") as fwaddonmanager
	Controller = game.GetFormFromFile(6186, "BeeingFemale.esm") as fwcontroller
	BabyItemList = game.GetFormFromFile(6197, "BeeingFemale.esm") as fwbabyitemlist
	ModEnabled = game.GetFormFromFile(75277, "BeeingFemale.esm") as globalvariable
	CloakingSpellEnabled = game.GetFormFromFile(7590, "BeeingFemale.esm") as globalvariable
	GlobalPlayerState = game.GetFormFromFile(396483, "BeeingFemale.esm") as globalvariable
	GlobalPlayerStatePercent = game.GetFormFromFile(396484, "BeeingFemale.esm") as globalvariable
	GlobalMenstruating = game.GetFormFromFile(411836, "BeeingFemale.esm") as globalvariable
	ChildSettings = game.GetFormFromFile(111186, "BeeingFemale.esm") as fwchildsettings
	MenuImageSpace = game.GetFormFromFile(185981, "BeeingFemale.esm") as imagespacemodifier
	StateWidget = game.GetFormFromFile(97347, "BeeingFemale.esm") as fwstatewidget
	ContraceptionWidget = game.GetFormFromFile(102860, "BeeingFemale.esm") as fwcontraceptionwidget
	BabyHealthWidget = game.GetFormFromFile(104239, "BeeingFemale.esm") as fwbabyhealthwidget
	WidgetController = game.GetFormFromFile(179016, "BeeingFemale.esm") as fwwidgetcontroller
	PantyWidget = game.GetFormFromFile(371568, "BeeingFemale.esm") as fwpantywidget
	CoupleWidget = game.GetFormFromFile(385453, "BeeingFemale.esm") as fwcouplewidget
	Progress = game.GetFormFromFile(416013, "BeeingFemale.esm") as fwprogresswidget
	UpdateState = 16
	Content.Upgrade(oldVersion, newVersion)
	UpdateState = 32
	cfg.Upgrade(oldVersion, newVersion)
	UpdateState = 48
	self.giveStartupItems(oldVersion)
	UpdateState = 64
	ContraceptionWidget.Upgrade(oldVersion, newVersion)
	UpdateState = 80
	BabyHealthWidget.Upgrade(oldVersion, newVersion)
	UpdateState = 96
	StateWidget.Upgrade(oldVersion, newVersion)
	UpdateState = 112
	ChildSettings.Upgrade(oldVersion, newVersion)
	UpdateState = 128
	Manager.Upgrade(oldVersion, newVersion)
	UpdateState = 144
	Data.Upgrade(oldVersion, newVersion)
	UpdateState = 160
	Int c = storageutil.FormListCount(none, "FW.Babys")
	while c > 0
		c -= 1
		if storageutil.FormListGet(none, "FW.Babys", c) as fwchildactorplayer != none
			(storageutil.FormListGet(none, "FW.Babys", c) as fwchildactorplayer).Upgrade(oldVersion, newVersion)
		elseIf storageutil.FormListGet(none, "FW.Babys", c) as fwchildactor != none
			(storageutil.FormListGet(none, "FW.Babys", c) as fwchildactor).Upgrade(oldVersion, newVersion)
		endIf
	endWhile
	UpdateState = 0
	self.Message(Content.UpdateComplete, self.MSG_Always, 0)
endFunction

function raiseModEvent(String EventName, fwabilitybeeingfemale base)

	self.SendModEvent("BeeingFemale", EventName, base.ActorRef.GetFormID() as Float)
endFunction

String function console_PrintRace(Bool bLog, race r, String type)

	if storageutil.HasFloatValue(r as form, "FW.AddOn." + type) == true
		Float f = storageutil.GetFloatValue(r as form, "FW.AddOn." + type, 1.00000)
		if bLog
			debug.Trace("- " + type + ": " + f as String, 0)
		endIf
		if f != 1.00000
			return "\n- " + type + ": " + f as String
		endIf
	elseIf bLog
		debug.Trace("- " + type + ": " + "1.0", 0)
	endIf
	return ""
endFunction

Float function GetPhaseScale(Int NodeSet, Int PhaseID)

	if cfg.VisualScalingKind == 0
		return fwscalingsettings.Realistic(NodeSet, PhaseID)
	elseIf cfg.VisualScalingKind == 1
		return fwscalingsettings.Linear(NodeSet, PhaseID)
	elseIf cfg.VisualScalingKind == 2
		return fwscalingsettings.Immediately(NodeSet, PhaseID)
	elseIf cfg.VisualScalingKind == 3
		return fwscalingsettings.Breasts(NodeSet, PhaseID)
	elseIf cfg.VisualScalingKind == 4
		return fwscalingsettings.Belly(NodeSet, PhaseID)
	elseIf cfg.VisualScalingKind == 5
		return fwscalingsettings.Late(NodeSet, PhaseID)
	endIf
	return 0.000000
endFunction

Int function IsValidateMaleActor(actor a, Bool bIgnoreRelevance)

	if a == none
		return -10
	endIf
	if a.GetLeveledActorBase() == none
		return -11
	endIf
	if a.IsInFaction(ForbiddenFaction) || a.HasKeywordString("SexLabForbid")
		return -1
	endIf
	if a.IsDead()
		return -2
	endIf
	if a.GetLeveledActorBase().GetSex() == 1
		return -3
	endIf
	race ActorRace = a.GetLeveledActorBase().GetRace()
	String RaceName = ActorRace.GetName() + miscutil.GetRaceEditorID(ActorRace)
	if ActorRace.HasKeywordString("ActorTypeCreature") && cfg.CreatureSperm == false
		return -11
	endIf
	if ActorRace.IsRaceFlagSet(4) || stringutil.Find(RaceName, "Child", 0) != -1 || stringutil.Find(RaceName, "Little", 0) != -1 || stringutil.Find(RaceName, "117", 0) != -1 || stringutil.Find(RaceName, "Monli", 0) != -1 && a.GetScale() < 0.930000 || stringutil.Find(RaceName, "Elin", 0) != -1 || stringutil.Find(RaceName, "Enfant", 0) != -1
		return -8
	endIf
	if game.GetPlayer() == a
		return 1
	elseIf a.IsInFaction(FollowerFaction)
		return 2
	else
		return 3
	endIf
endFunction

Float function GetPillDuration(actor a)

	return 4.00000 * Manager.getActorContraceptionDuration(a)
endFunction

function ReNewSpells()

	actor PA = game.GetPlayer()
	if PA.HasSpell(BeeingFemaleSpell as form)
		PA.RemoveSpell(BeeingFemaleSpell)
	endIf
	if PA.HasSpell(BeeingMaleSpell as form)
		PA.RemoveSpell(BeeingMaleSpell)
	endIf
	self.giveStartupSpells()
endFunction

Bool function setObjective(Int ID)

	; Empty function
endFunction

function onAddActorSperm(String hookName, actor woman, actor Donor)

	actor m
	actor w
	if Donor != none
		if Donor.GetLeveledActorBase().GetSex() == 0 && self.IsValidateMaleActor(Donor, false) > 0
			m = Donor
		elseIf Donor.GetLeveledActorBase().GetSex() == 1
			if Manager.OnAllowFFCum(w, m) == true && self.IsValidateFemaleActor(Donor, false) > 0
				m = Donor
			endIf
		endIf
	endIf
	if woman != none
		if self.IsValidateFemaleActor(woman, false) > 0
			w = woman
		endIf
	endIf
	Bool bCanAdd = true
	if woman == none
		bCanAdd = false
	endIf
	if m == none
		bCanAdd = false
	endIf
	if DeviceActive == true
		if woman.IsEquipped(DeviceBelt as form) == true
			bCanAdd = false
		endIf
	endIf
	if bCanAdd == true
		Controller.AddSperm(w, m, 1.00000)
	endIf
endFunction

function OnMenuClose(String menuName)

	if menuName == "Console"
		self.UnregisterForKey(28)
		self.UnregisterForKey(156)
	endIf
endFunction

function OnMenuOpen(String menuName)

	if menuName == "Console"
		self.RegisterForKey(28)
		self.RegisterForKey(156)
	endIf
endFunction

Int function UnstripSlot(actor ActorRef, form ItemRef, Int hand)

	if ItemRef
		Int type = ItemRef.GetType()
		if type == 22 || type == 82
			ActorRef.EquipSpell(ItemRef as spell, hand)
		else
			ActorRef.EquipItem(ItemRef, false, true)
		endIf
		hand -= (hand == 1 && (type == 41 || type == 31 || type == 22 || type == 82)) as Int
	endIf
	return hand
endFunction

function Mimik(actor a, String ExpressionName, Int Strength, Bool bClear)

	Manager.OnMimik(a, ExpressionName, Strength, bClear)
endFunction

function RegisterFluid(potion Fluid)

	Int c = Fluid.GetNumEffects()
	while c > 0
		c -= 1
		if Fluid.GetNthEffectMagicEffect(c) == Pill_Effect && Pill_Items.HasForm(Fluid as form) == false
			Pill_Items.AddForm(Fluid as form)
		endIf
		if Fluid.GetNthEffectMagicEffect(c) == WashOut_Effect && WashOut_List.HasForm(Fluid as form) == false
			WashOut_List.AddForm(Fluid as form)
		endIf
	endWhile
endFunction

Bool function Message(String akMessage, Int aiPriority, Int aiType)

	if bMessageEnabledAfterNewGameStarted == false
		Quest q = game.GetFormFromFile(210731, "Skyrim.esm") as Quest
		if q.IsCompleted() || q.IsObjectiveCompleted(30) || q.GetCurrentStageID() >= 300
			bMessageEnabledAfterNewGameStarted = true
		endIf
	endIf
	if cfg.Messages <= aiPriority
		if aiType == self.MSG_Box && (bMessageEnabledAfterNewGameStarted == true || aiPriority == self.MSG_Always)
			if game.GetPlayer().GetCombatState() == 0
				debug.MessageBox(akMessage)
			else
				debug.Notification(akMessage)
			endIf
		elseIf aiType == self.MSG_Note && (bMessageEnabledAfterNewGameStarted == true || aiPriority == self.MSG_Always)
			debug.Notification(akMessage)
		elseIf aiType == self.MSG_Trace
			debug.Trace(akMessage, 0)
		elseIf bMessageEnabledAfterNewGameStarted == false
			debug.Trace("BeeingFemale Message: " + akMessage, 0)
		endIf
		return true
	endIf
	return false
endFunction

function PlayPainSound(actor a, Float Strength)

	if a.Is3DLoaded()
		if Manager.OnPlayPainSound(a, Strength) == false
			
		endIf
		a.CreateDetectionEvent(a, fwutility.RangedFloat(Strength, 30.0000, 100.000) as Int)
	endIf
endFunction

function SpawnChild(actor Mother, actor Father)

	Int BabysForTheActor = storageutil.GetIntValue(Mother as form, "FW.NumBabys", 0)
	storageutil.SetIntValue(Mother as form, "FW.NumBabys", BabysForTheActor + 1)
	if Mother != game.GetPlayer() && cfg.NPCBornChild == false
		return 
	endIf
	form Baby = none
	if Mother == game.GetPlayer() || Father == game.GetPlayer()
		if cfg.BabySpawn == 0
			return 
		elseIf cfg.BabySpawn == 1
			Baby = self.SpawnChildActor(Mother, Father) as form
		elseIf cfg.BabySpawn == 2
			Baby = self.SpawnChildItem(Mother, Father) as form
		elseIf cfg.BabySpawn == 3 && BabyGem != none
			Mother.AddItem(BabyGem as form, 1, false)
		endIf
	elseIf cfg.BabySpawnNPC == 0
		return 
	elseIf cfg.BabySpawnNPC == 1
		Baby = self.SpawnChildActor(Mother, Father) as form
	elseIf cfg.BabySpawnNPC == 2
		Baby = self.SpawnChildItem(Mother, Father) as form
	elseIf cfg.BabySpawnNPC == 3 && BabyGem != none
		Mother.AddItem(BabyGem as form, 1, false)
	endIf
	if Baby != none
		storageutil.FormListAdd(none, "FW.Babys", Baby, true)
	endIf
	storageutil.SetFloatValue(Mother as form, "FW.LastBornChildTime", utility.GetCurrentGameTime())
	storageutil.SetFloatValue(Father as form, "FW.LastBornChildTime", utility.GetCurrentGameTime())
	storageutil.FormListAdd(Mother as form, "FW.BornChildFather", Father as form, true)
	storageutil.FloatListAdd(Mother as form, "FW.BornChildTime", utility.GetCurrentGameTime(), true)
	Controller.UpdateParentFaction(Mother)
	Controller.UpdateParentFaction(Father)
	Manager.OnBabySpawn(Mother, Father)
endFunction

function doDamage(actor a, Float Percentage, Int DamageType, Float OptionalArgument)

	Float ScaleDamage = 1.00000
	Bool IsPlayer = a == game.GetPlayer()
	if IsPlayer
		if cfg.Difficulty == 0
			ScaleDamage = 0.400000
		elseIf cfg.Difficulty == 1
			ScaleDamage = 0.700000
		elseIf cfg.Difficulty == 3
			ScaleDamage = 1.30000
		elseIf cfg.Difficulty == 4
			ScaleDamage = 1.70000
		endIf
	elseIf cfg.NPCFeelPain
		ScaleDamage = 0.600000
	endIf
	Percentage *= ScaleDamage
	Percentage = Manager.OnDoDamage(a, Percentage, DamageType, OptionalArgument)
	if !IsPlayer && cfg.NPCFeelPain == false
		Percentage = 0.000000
	elseIf Percentage < 1.00000
		Percentage = 1.00000
	elseIf Percentage > 50.0000
		Percentage = 50.0000
	endIf
	Float efxDage = Percentage
	if !IsPlayer && Percentage > 2.00000
		efxDage = Percentage / 3.00000
	endIf
	Manager.OnDoDamageStart(a, Percentage, DamageType, OptionalArgument)
	if IsPlayer || cfg.NPCFeelPain
		Int steps
		Float DamageLeft = efxDage
		if Percentage < 10.0000
			steps = 1
		elseIf Percentage < 20.0000
			steps = 2
		elseIf Percentage < 30.0000
			steps = 3
		elseIf Percentage < 40.0000
			steps = 4
		elseIf Percentage < 50.0000
			steps = 5
		elseIf Percentage < 60.0000
			steps = 6
		elseIf Percentage < 70.0000
			steps = 7
		elseIf Percentage < 80.0000
			steps = 8
		elseIf Percentage < 90.0000
			steps = 9
		else
			steps = 10
		endIf
		while steps > 0
			if DamageLeft > 10.0000
				a.DamageActorValue("Health", a.GetBaseActorValue("Health") / 100.000 * 10.0000)
				DamageLeft -= 10.0000
			else
				a.DamageActorValue("Health", a.GetBaseActorValue("Health") / 100.000 * DamageLeft)
			endIf
			utility.Wait(0.500000)
			steps -= 1
		endWhile
	else
		utility.Wait(efxDage / 10.0000 + 1.00000)
	endIf
	utility.Wait(3.00000)
	Manager.OnDoDamageEnd(a, Percentage, DamageType, OptionalArgument)
endFunction

function giveStartupSpells()

	actor PA = game.GetPlayer()
	if (PA.GetLeveledActorBase().GetSex() == 0 || cfg.RelevantPlayer == false) && PA.HasSpell(BeeingFemaleSpell as form) == false
		fwutility.ActorRemoveSpell(PA, BeeingFemaleSpell)
	elseIf (PA.GetLeveledActorBase().GetSex() == 1 || cfg.RelevantPlayer == false) && PA.HasSpell(BeeingMaleSpell as form) == false
		fwutility.ActorRemoveSpell(PA, BeeingMaleSpell)
	endIf
	if PA.GetLeveledActorBase().GetSex() == 0 && PA.HasSpell(BeeingMaleSpell as form) == false && cfg.RelevantPlayer == true
		fwutility.ActorAddSpell(PA, BeeingMaleSpell, false, false)
	elseIf PA.GetLeveledActorBase().GetSex() == 1 && PA.HasSpell(BeeingFemaleSpell as form) == false && cfg.RelevantPlayer == true
		fwutility.ActorAddSpell(PA, BeeingFemaleSpell, false, false)
	endIf
endFunction

function onInfoMenuClosed(String hookName, String argString, Float argNum, form sender)

	MenuImageSpace.Remove()
	self.UnregisterForModEvent("InfoMenuClosed")
endFunction

function OnKeyDown(Int keyCode)

	if keyCode == 28 || keyCode == 156
		Int cmdCount = ui.GetInt("Console", "_global.Console.ConsoleInstance.Commands.length")
		if cmdCount > 0
			cmdCount -= 1
			String cmdLine = ui.GetString("Console", "_global.Console.ConsoleInstance.Commands." + cmdCount as String)
			String msg = ""
			if cmdLine != ""
				Bool bSuccess = false
				Bool bUsedPlayer = false
				actor a = game.GetCurrentConsoleRef() as actor
				actor target = a
				if a == none
					a = game.GetPlayer()
					target = a
				endIf
				Int validate = self.IsValidateFemaleActor(target, false)
				String[] cmd = stringutil.Split(cmdLine, " ")
				if stringutil.GetLength(cmd[0]) > 7
					if stringutil.SubString(cmd[0], 0, 7) == "player."
						bUsedPlayer = true
						cmd[0] = stringutil.SubString(cmd[0], 7, 0)
						a = game.GetPlayer()
					endIf
				endIf
				if cmd[0] == "givetampon" || cmd[0] == "givetampons" || cmd[0] == "addtampon" || cmd[0] == "addtampons" || cmd[0] == "bf:givetampon" || cmd[0] == "bf:givetampons" || cmd[0] == "bf:addtampon" || cmd[0] == "bf:addtampons"
					Int c = 1
					if cmd.length > 1
						c = cmd[1] as Int
					endIf
					a.AddItem(Tampon_Normal as form, c, true)
					msg = "Gave " + c as String + "x Tampons to " + a.GetDisplayName()
					bSuccess = true
				elseIf cmd[0] == "givecontraception" || cmd[0] == "AddContraception" || cmd[0] == "bf:givecontraception" || cmd[0] == "bf:addcontraception"
					Int c = 1
					if cmd.length > 1
						c = cmd[1] as Int
					endIf
					a.AddItem(ContraceptionLow as form, c, true)
					msg = "Gave " + c as String + "x Contraception Fluid to " + a.GetDisplayName()
					bSuccess = true
				elseIf cmd[0] == "bf:state"
					if validate > 0
						Int fstate = Controller.GetFemaleState(a)
						if cmd.length > 1
							Int tmpState = cmd[1] as Int
							if tmpState >= 0 && tmpState < 9
								if Controller.IsPregnant(a)
									if tmpState < 4
										Controller.unimpregnate(a)
									endIf
									Controller.ChangeState(a, tmpState)
									fstate = tmpState
								elseIf tmpState >= 4
									msg = "Cant's switch from none-pregnant to pregnant"
								else
									Controller.ChangeState(a, tmpState)
									fstate = tmpState
								endIf
							else
								msg = tmpState as String + " is not a validate state"
							endIf
						endIf
						if fstate == 0
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID0, "", "", "", "")
						elseIf fstate == 1
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID1, "", "", "", "")
						elseIf fstate == 2
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID2, "", "", "", "")
						elseIf fstate == 3
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID3, "", "", "", "")
						elseIf fstate == 4
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID4, "", "", "", "")
						elseIf fstate == 5
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID5, "", "", "", "")
						elseIf fstate == 6
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID6, "", "", "", "")
						elseIf fstate == 7
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID7, "", "", "", "")
						elseIf fstate == 8
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID8, "", "", "", "")
						elseIf fstate == 20
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID20, "", "", "", "")
						elseIf fstate == 21
							msg = fwutility.MultiStringReplace(Content.SwitchState, a.GetDisplayName(), Content.StateID21, "", "", "", "")
						endIf
					else
						msg = self.getValidateMessage(validate)
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:contraception" || cmd[0] == "contraception"
					if validate > 0
						if cmd.length > 1
							Int val = cmd[0] as Int
							if val < 0
								val = 0
							elseIf val > 100
								val = 100
							endIf
							Controller.SetContraception(a, val as Float)
							msg = fwutility.MultiStringReplace(Content.ActorHasContraception, a.GetDisplayName(), val as String, "", "", "", "")
						else
							msg = fwutility.MultiStringReplace(Content.ActorHasContraception, a.GetDisplayName(), Controller.GetContraception(a) as String, "", "", "", "")
						endIf
					else
						msg = self.getValidateMessage(validate)
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:addsperm" || cmd[0] == "AddSperm"
					if game.GetPlayer() != a
						if self.IsValidateFemaleActor(game.GetPlayer(), false) > 0 && self.IsValidateMaleActor(target, false) > 0
							Controller.AddSperm(game.GetPlayer(), a, 1.00000)
							msg = fwutility.StringReplace(Content.NPCCameInsideYou, target.GetDisplayName(), "{0}")
						elseIf self.IsValidateMaleActor(game.GetPlayer(), false) > 0 && validate > 0
							Controller.AddSperm(a, game.GetPlayer(), 1.00000)
							msg = fwutility.StringReplace(Content.YouCameInsideNPC, target.GetDisplayName(), "{0}")
						elseIf self.IsValidateFemaleActor(game.GetPlayer(), false) as Bool && validate > 0
							if bUsedPlayer
								Controller.AddSperm(game.GetPlayer(), target, 1.00000)
								msg = fwutility.StringReplace(Content.NPCCameInsideYou, target.GetDisplayName(), "{0}")
							else
								Controller.AddSperm(a, game.GetPlayer(), 1.00000)
								msg = fwutility.StringReplace(Content.YouCameInsideNPC, target.GetDisplayName(), "{0}")
							endIf
						endIf
						bSuccess = true
					endIf
				elseIf cmd[0] == "bf:impregnate" || cmd[0] == "impregnate"
					Int iCount = 1
					if cmd.length > 1
						iCount = cmd[1] as Int
						if iCount <= 0
							iCount = 1
						elseIf iCount > self.MaxBabyPregnantWith
							iCount = self.MaxBabyPregnantWith
						endIf
					endIf
					if game.GetPlayer() != target
						if self.IsValidateFemaleActor(game.GetPlayer(), false) > 0 && self.IsValidateMaleActor(target, false) > 0
							Controller.impregnate(game.GetPlayer(), target, iCount * Manager.ActorMaxBabse(game.GetPlayer()) as Int)
							msg = fwutility.StringReplace(Content.NPCCameInsideYou, target.GetDisplayName(), "{0}") + "\n" + Content.YouArePregnant + "\n"
						elseIf self.IsValidateMaleActor(game.GetPlayer(), false) > 0 && validate > 0
							Controller.impregnate(a, game.GetPlayer(), iCount * Manager.ActorMaxBabse(a) as Int)
							msg = fwutility.StringReplace(Content.YouCameInsideNPC, target.GetDisplayName(), "{0}") + "\n" + fwutility.StringReplace(Content.NPCIsPregnant, target.GetDisplayName(), "{0}") + "\n"
						elseIf self.IsValidateFemaleActor(game.GetPlayer(), false) as Bool && validate > 0
							if bUsedPlayer
								Controller.impregnate(game.GetPlayer(), target, iCount * Manager.ActorMaxBabse(game.GetPlayer()) as Int)
								msg = fwutility.StringReplace(Content.NPCCameInsideYou, target.GetDisplayName(), "{0}") + "\n" + Content.YouArePregnant + "\n"
							else
								Controller.impregnate(target, game.GetPlayer(), iCount * Manager.ActorMaxBabse(target) as Int)
								msg = fwutility.StringReplace(Content.YouCameInsideNPC, target.GetDisplayName(), "{0}") + "\n" + fwutility.StringReplace(Content.NPCIsPregnant, target.GetDisplayName(), "{0}") + "\n"
							endIf
						endIf
					else
						msg += "No NpcMentruation selected"
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:damagebaby" || cmd[0] == "DamageBaby"
					if validate > 0
						if cmd.length > 1
							Int val = cmd[0] as Int
							if val < 0
								val = 0
							elseIf val > 100
								val = 100
							endIf
							Controller.DamageBaby(a, val as Float)
							msg = fwutility.MultiStringReplace(Content.BabyHealth, a.GetDisplayName(), Controller.GetBabyHealth(a) as String, "", "", "", "")
						endIf
					else
						msg = self.getValidateMessage(validate)
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:babyhealth" || cmd[0] == "BabyHealth"
					if validate > 0
						if cmd.length > 1
							Int val = cmd[0] as Int
							if val < 0
								val = 0
							elseIf val > 100
								val = 100
							endIf
							Controller.SetBabyHealth(a, val as Float)
							msg = fwutility.MultiStringReplace(Content.BabyHealth, a.GetDisplayName(), val as String, "", "", "", "")
						else
							msg = fwutility.MultiStringReplace(Content.BabyHealth, a.GetDisplayName(), Controller.GetBabyHealth(a) as String, "", "", "", "")
						endIf
					else
						msg = self.getValidateMessage(validate)
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:forcebirth" || cmd[0] == "forcebirth"
					if validate > 0
						Int tmpstate = Controller.GetFemaleState(a)
						if tmpstate >= 4 && tmpstate < 7
							Controller.GiveBirth(a)
						else
							msg = fwutility.StringReplace(Content.ActorNotPregnant, a.GetDisplayName(), "{0}")
						endIf
					else
						msg = self.getValidateMessage(validate)
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:code"
					msg = fwutility.Hex(LoadState, 2) + " " + fwutility.Hex(UpdateState, 2) + " " + fwutility.Hex(ChildSettings.LoadingState, 2) + " " + fwutility.Hex(Manager.LoadingState, 2) + " " + fwutility.Hex(cfg.GetPageResetJobID(), 2)
					if Manager.SLoadingRace != "" || Manager.SLoadingCME != "" || Manager.SLoadingMisc != ""
						msg += " [" + Manager.SLoadingRace + ";" + Manager.SLoadingCME + ";" + Manager.SLoadingMisc + "]"
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:resetnpc" || cmd[0] == "resetnpc"
					if target.HasSpell(BeeingFemaleSpell as form)
						target.RemoveSpell(BeeingFemaleSpell)
					endIf
					if target.HasSpell(BeeingMaleSpell as form)
						target.RemoveSpell(BeeingMaleSpell)
					endIf
					Manager.removeCME(a, -1)
					fwsaveload.Delete(target)
					if self.IsValidateFemaleActor(target, false) > 0
						target.AddSpell(BeeingFemaleSpell, true)
					elseIf self.IsValidateMaleActor(target, false) > 0
						target.AddSpell(BeeingMaleSpell, true)
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:canbecomepregnant" || cmd[0] == "CanBecomePregnant"
					if cmd.length > 1
						Bool bActive = false
						if cmd[1] == "1" || cmd[1] == "true" || cmd[1] == "yes"
							bActive = true
						endIf
						Controller.setCanBecomePregnant(a, bActive)
					elseIf Controller.CanBecomePregnant(a)
						msg = a.GetLeveledActorBase().GetName() + " can become pregnant\n"
					else
						msg = a.GetLeveledActorBase().GetName() + " can not become pregnant in this cycle\n"
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:canbecomepms" || cmd[0] == "CanBecomePMS"
					if cmd.length > 1
						Bool bactive = false
						if cmd[1] == "1" || cmd[1] == "true" || cmd[1] == "yes"
							bactive = true
						endIf
						Controller.setCanBecomePMS(a, bactive)
					elseIf Controller.CanBecomePMS(a)
						msg = a.GetLeveledActorBase().GetName() + " can become PMS\n"
					else
						msg = a.GetLeveledActorBase().GetName() + " can not become PMS in this cycle\n"
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:unimpregnate" || cmd[0] == "unimpregnate"
					Controller.unimpregnate(a)
					bSuccess = true
				elseIf cmd[0] == "bf:cme" || cmd[0] == "cme"
					if cmd.length == 1
						msg += self.console_PrintCME("all", false)
					elseIf cmd.length == 2
						if fwutility.toLower(cmd[1]) == "log"
							msg += self.console_PrintCME("all", true)
						else
							msg += self.console_PrintCME(cmd[1], false)
						endIf
					elseIf fwutility.toLower(cmd[2]) == "log"
						msg += self.console_PrintCME(cmd[1], true)
					else
						msg += self.console_PrintCME(cmd[1], false)
					endIf
					msg += "\n"
					bSuccess = true
				elseIf cmd[0] == "bf:race" || cmd[0] == "race"
					Bool bLog = false
					if cmd.length > 1
						if cmd[1] == "log"
							bLog = true
						endIf
					endIf
					race r = target.GetLeveledActorBase().GetRace()
					msg = "RaceAddOn Informations for " + r.GetName()
					debug.Trace("RaceAddOn Informations for " + r.GetName(), 0)
					msg += self.console_PrintRaceBaby(bLog, r, "BabyActor_Female")
					msg += self.console_PrintRaceBaby(bLog, r, "BabyActor_Male")
					msg += self.console_PrintRaceBaby(bLog, r, "BabyActor_FemalePlayer")
					msg += self.console_PrintRaceBaby(bLog, r, "BabyActor_MalePlayer")
					msg += self.console_PrintRaceBaby(bLog, r, "BabyArmor_Female")
					msg += self.console_PrintRaceBaby(bLog, r, "BabyArmor_Male")
					msg += self.console_PrintRace(bLog, r, "ChanceToBecomePregnant")
					msg += self.console_PrintRace(bLog, r, "ContraceptionDuration")
					msg += self.console_PrintRace(bLog, r, "Duration_01_Follicular")
					msg += self.console_PrintRace(bLog, r, "Duration_02_Ovulation")
					msg += self.console_PrintRace(bLog, r, "Duration_03_Luteal")
					msg += self.console_PrintRace(bLog, r, "Duration_04_Menstruation")
					msg += self.console_PrintRace(bLog, r, "Duration_05_Trimester1")
					msg += self.console_PrintRace(bLog, r, "Duration_06_Trimester2")
					msg += self.console_PrintRace(bLog, r, "Duration_07_Trimester3")
					msg += self.console_PrintRace(bLog, r, "Duration_08_Recovery")
					msg += self.console_PrintRace(bLog, r, "Duration_10_SecondsBetweenLaborPains")
					msg += self.console_PrintRace(bLog, r, "Duration_11_SecondsBetweenBabySpawn")
					msg += self.console_PrintRace(bLog, r, "Duration_MaleSperm")
					msg += self.console_PrintRace(bLog, r, "Irregulation_Chance_Scale")
					msg += self.console_PrintRace(bLog, r, "Irregulation_Value_Scale")
					msg += self.console_PrintRace(bLog, r, "Max_CME_EffectScale")
					msg += self.console_PrintRace(bLog, r, "Multiple_Threshold_Chance")
					msg += self.console_PrintRace(bLog, r, "Multiple_Threshold_Max_Babys")
					msg += self.console_PrintRace(bLog, r, "Pain_Abortus")
					msg += self.console_PrintRace(bLog, r, "Pain_GivingBirth")
					msg += self.console_PrintRace(bLog, r, "Pain_LaborPains")
					msg += self.console_PrintRace(bLog, r, "Pain_Menstruation")
					msg += self.console_PrintRace(bLog, r, "Pain_Mittelschmerz")
					msg += self.console_PrintRace(bLog, r, "Pain_Phase_CyclePains")
					msg += self.console_PrintRace(bLog, r, "Pain_Phase_PregnantPains")
					msg += self.console_PrintRace(bLog, r, "Pain_PMS")
					msg += self.console_PrintRace(bLog, r, "PMS_ChanceScale")
					msg += self.console_PrintRace(bLog, r, "Size_Belly_Max")
					msg += self.console_PrintRace(bLog, r, "Size_Belly_Max_Multiple")
					msg += self.console_PrintRace(bLog, r, "Size_Breasts_Max")
					msg += self.console_PrintRace(bLog, r, "Size_Breasts_Max_Multiple")
					msg += self.console_PrintRace(bLog, r, "Sperm_Amount_Scale")
					msg += self.console_PrintRace(bLog, r, "Baby_Healing_Scale")
					msg += self.console_PrintRace(bLog, r, "Baby_Damage_Scale")
					msg += self.console_PrintRace(bLog, r, "Male_Recovery_Scale")
					msg += "\n"
					bSuccess = true
				elseIf cmd[0] == "bf:addon"
					if cmd.length > 1
						if cmd[1] == "refresh"
							if cmd.length > 2
								if cmd[2] == "?"
									msg += "1 = Misc AddOn\n"
									msg += "2 = Race AddOn\n"
									msg += "4 = CME AddOn\n"
									msg += "---------------\n"
									msg += "3 = Misc + Race AddOn\n"
									msg += "5 = Misc + CME AddOn\n"
									msg += "6 = Race + CME AddOn\n"
									msg += "7 = Misc + Race + CME AddOn\n"
								elseIf fwutility.toLower(cmd[2]) == "misc"
									Manager.RefreshAddOn(1)
								elseIf fwutility.toLower(cmd[2]) == "race"
									Manager.RefreshAddOn(2)
								elseIf fwutility.toLower(cmd[2]) == "cme"
									Manager.RefreshAddOn(4)
								else
									Manager.RefreshAddOn(cmd[2] as Int)
								endIf
							else
								Manager.RefreshAddOn(127)
							endIf
						elseIf cmd[1] == "clear"
							if cmd.length > 2
								if cmd[2] == "?"
									msg += "1 = Misc AddOn\n"
									msg += "2 = Race AddOn\n"
									msg += "4 = CME AddOn\n"
									msg += "---------------\n"
									msg += "3 = Misc + Race AddOn\n"
									msg += "5 = Misc + CME AddOn\n"
									msg += "6 = Race + CME AddOn\n"
									msg += "7 = Misc + Race + CME AddOn\n"
								elseIf fwutility.toLower(cmd[2]) == "misc"
									Manager.clear(1)
								elseIf fwutility.toLower(cmd[2]) == "race"
									Manager.clear(2)
								elseIf fwutility.toLower(cmd[2]) == "cme"
									Manager.clear(4)
								else
									Manager.clear(cmd[2] as Int)
								endIf
							else
								Manager.clear(127)
							endIf
						else
							msg += "AddOn Command not found\n"
						endIf
					else
						msg += "AddOn command list:\n"
						msg += " addon refresh ?\n"
						msg += " addon refresh [<id>]\n"
						msg += " addon clear ?\n"
						msg += " addon clear [<id>]\n"
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:test"
					msg += "Language: " + fwutility.SwitchString(Content.InstallComplete == "", "False", "true") + "\n"
					if Content.InstallComplete == ""
						Content.LoadContent()
						msg += "Language Reload: " + fwutility.SwitchString(Content.InstallComplete == "", "False", "true") + "\n"
					endIf
					msg += "Language Info: " + fwtextcontents.getLangSize() as String + " byte; Code: " + fwtextcontents.getErrorCode() as String + "; " + fwtextcontents.getFilePath() + "\n"
					actor ar = game.GetCurrentConsoleRef() as actor
					if ar == none
						msg += "Belly: Testing Belly for all loaded Female Actors for 10 sec\n"
						self.SendModEvent("BeeingFemale", "TestScale", 1.00000)
					elseIf ar == game.GetPlayer() && ar.GetLeveledActorBase().GetSex() == 1 && Player != none
						msg += "Belly: Testing Belly for Player Actors for 10 sec\n"
						Player.TestScale(1.00000)
					else
						msg += "Belly: Testing Belly for '" + ar.GetLeveledActorBase().GetName() + "' for 10 sec\n"
						ar.SendModEvent("BeeingFemale", "TestScale", 1.00000)
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:export"
					if cmd.length == 1
						msg += "Exporting AddOns from the given mod\n  bf:export <modName> [<export prefix>]\n  bf:export BeeingFemale.esm BF_\n"
					else
						cmd[1] = fwutility.StringReplace(cmd[1], "%20", " ")
						debug.Trace("Exporting BeeingFemale AddOns", 0)
						debug.Trace("- Mod: " + cmd[1], 0)
						Int exported = 0
						String prefix = ""
						if cmd.length >= 3
							prefix = cmd[2]
						endIf
						Int c = fwutility.GetQuestObjectCount(cmd[1])
						debug.Trace("- Number Of Quests: " + c as String, 0)
						while c > 0
							c -= 1
							Quest q = fwutility.GetQuestObject(cmd[1], c)
							if q as fwaddonbase != none
								debug.Trace("- Export: " + q.GetName() + " [0x" + fwutility.Hex(q.GetFormID() % 16777216, 6) + "]", 0)
								if fwaddonmanager.Export(q as fwaddonbase, prefix, 127)
									exported += 1
								endIf
							endIf
						endWhile
						debug.Trace("- Export done, " + exported as String + " AddOns exported", 0)
						msg += exported as String + " AddOns exported\n"
					endIf
					bSuccess = true
				elseIf cmd[0] == "bf:setbabys"
					if cmd.length < 2
						msg += "Set the number of babys the woman is pregnant with\nbf:setbabys <num>\n"
					elseIf validate > 0
						if Controller.setNumBabys(target, cmd[1] as Int)
							msg += "Set number of babys " + target.GetLeveledActorBase().GetName() + " is pregnant with to " + cmd[1] + "\n"
						else
							msg += "Failed to set babys for " + target.GetLeveledActorBase().GetName() + " to " + cmd[1] + "\n"
						endIf
					else
						msg += target.GetLeveledActorBase().GetName() + " is not a validate female\n"
					endIf
					bSuccess = true
				elseIf a as fwchildactor != none && cmd.length == 3
					fwchildactor Child = a as fwchildactor
					if cmd[0] == "SetAV" || cmd[0] == "setactorvalue"
						Child.setactorvalue(cmd[1], cmd[2] as Float)
					elseIf cmd[0] == "modav" || cmd[0] == "modactorvalue"
						Child.modactorvalue(cmd[1], cmd[2] as Float)
					endIf
				endIf
				if bSuccess == true
					utility.WaitMenuMode(0.100000)
					String history = ui.GetString("Console", "_global.Console.ConsoleInstance.CommandHistory.text")
					Int iHistory = stringutil.GetLength(history) - 1
					Bool bRunning = true
					while iHistory > 0 && bRunning == true
						if stringutil.AsOrd(stringutil.GetNthChar(history, iHistory - 1)) == 13
							bRunning = false
						else
							iHistory -= 1
						endIf
					endWhile
					if iHistory <= 0
						ui.SetString("Console", "_global.Console.ConsoleInstance.CommandHistory.text", "")
					else
						ui.SetString("Console", "_global.Console.ConsoleInstance.CommandHistory.text", stringutil.SubString(history, 0, iHistory))
					endIf
				endIf
				if msg != ""
					ui.InvokeString("Console", "_global.Console.AddHistory", msg)
				endIf
			endIf
		endIf
	endIf
endFunction

Float function getEggTravelingDuration(actor a)

	Float x = self.getStateDuration(1, a) * EggTravelingDuration_Percentage
	if x < 1.10000
		return 1.01000
	else
		return x
	endIf
endFunction

function SetImportantItems()

	cfg = game.GetFormFromFile(6184, "BeeingFemale.esm") as fwsystemconfig
	Content = game.GetFormFromFile(15921, "BeeingFemale.esm") as fwtextcontents
	Controller = game.GetFormFromFile(6186, "BeeingFemale.esm") as fwcontroller
	CoupleWidget = game.GetFormFromFile(385453, "BeeingFemale.esm") as fwcouplewidget
	Data = game.GetFormFromFile(6183, "BeeingFemale.esm") as fwsaveload
	ChildSettings = game.GetFormFromFile(111186, "BeeingFemale.esm") as fwchildsettings
	Manager = game.GetFormFromFile(6185, "BeeingFemale.esm") as fwaddonmanager
	ModEnabled = game.GetFormFromFile(75277, "BeeingFemale.esm") as globalvariable
	CloakingSpellEnabled = game.GetFormFromFile(7590, "BeeingFemale.esm") as globalvariable
	Progress = game.GetFormFromFile(416013, "BeeingFemale.esm") as fwprogresswidget
	StateWidget = game.GetFormFromFile(97347, "BeeingFemale.esm") as fwstatewidget
	WidgetController = game.GetFormFromFile(179016, "BeeingFemale.esm") as fwwidgetcontroller
	BabyHealthWidget = game.GetFormFromFile(104239, "BeeingFemale.esm") as fwbabyhealthwidget
	PantyWidget = game.GetFormFromFile(371568, "BeeingFemale.esm") as fwpantywidget
	BabyItemList = game.GetFormFromFile(6197, "BeeingFemale.esm") as fwbabyitemlist
	CoupleWidget = game.GetFormFromFile(385453, "BeeingFemale.esm") as fwcouplewidget
	cfg.System = game.GetFormFromFile(3426, "BeeingFemale.esm") as FWSystem
	cfg.Content = game.GetFormFromFile(15921, "BeeingFemale.esm") as fwtextcontents
	ChildSettings.Manager = game.GetFormFromFile(6185, "BeeingFemale.esm") as fwaddonmanager
	Controller.System = game.GetFormFromFile(3426, "BeeingFemale.esm") as FWSystem
	PantyWidget.System = game.GetFormFromFile(3426, "BeeingFemale.esm") as FWSystem
	StateWidget.System = game.GetFormFromFile(3426, "BeeingFemale.esm") as FWSystem
	BabyHealthWidget.System = game.GetFormFromFile(3426, "BeeingFemale.esm") as FWSystem
	ContraceptionWidget.System = game.GetFormFromFile(3426, "BeeingFemale.esm") as FWSystem
	AbortusFever = game.GetFormFromFile(8978, "BeeingFemale.esm") as imagespacemodifier
	AbortusImod = game.GetFormFromFile(8977, "BeeingFemale.esm") as imagespacemodifier
	DefaultBlur = game.GetFormFromFile(354, "BeeingFemale.esm") as imagespacemodifier
	AmnioticFluid = game.GetFormFromFile(8978, "BeeingFemale.esm") as armor
	ArkayShrineObject = game.GetFormFromFile(464980, "Skyrim.esm") as activator
	BabyGem = game.GetFormFromFile(32485, "BeeingFemale.esm") as soulgem
	BeeingFemaleInfoSpell = game.GetFormFromFile(10366, "BeeingFemale.esm") as spell
	BeeingFemaleSpell = game.GetFormFromFile(7588, "BeeingFemale.esm") as spell
	BeeingMaleSpell = game.GetFormFromFile(7586, "BeeingFemale.esm") as spell
	ContraceptionLow = game.GetFormFromFile(14537, "BeeingFemale.esm") as potion
	ContraceptionMid = game.GetFormFromFile(14539, "BeeingFemale.esm") as potion
endFunction

function onAddSperm(String hookName, String argString, Float argNum, form sender)

	actor woman
	actor man
	if sender as actor != none
		if (sender as actor).GetLeveledActorBase().GetSex() == 0 && self.IsValidateMaleActor(sender as actor, false) > 0
			man = sender as actor
		elseIf (sender as actor).GetLeveledActorBase().GetSex() == 1
			if Manager.OnAllowFFCum(woman, sender as actor) == true && self.IsValidateFemaleActor(sender as actor, false) > 0
				man = sender as actor
			endIf
		endIf
	elseIf argString != ""
		Int iStr = argString as Int
		if iStr > 0
			actor aStr = game.GetForm(iStr) as actor
			if aStr != none
				if aStr.GetLeveledActorBase().GetSex() == 0 && self.IsValidateMaleActor(aStr, false) > 0
					man = aStr
				elseIf aStr.GetLeveledActorBase().GetSex() == 1
					if Manager.OnAllowFFCum(woman, aStr) == true && self.IsValidateFemaleActor(aStr, false) > 0
						man = aStr
					endIf
				endIf
			endIf
		endIf
	endIf
	if game.GetForm(argNum as Int) as actor != none
		if self.IsValidateFemaleActor(game.GetForm(argNum as Int) as actor, false) > 0
			woman = game.GetForm(argNum as Int) as actor
		endIf
	endIf
	Bool bCanAdd = true
	if woman == none
		bCanAdd = false
	endIf
	if man == none
		bCanAdd = false
	endIf
	if DeviceActive == true
		if woman.IsEquipped(DeviceBelt as form) == true
			bCanAdd = false
		endIf
	endIf
	if bCanAdd == true
		Controller.AddSperm(woman, man, 1.00000)
	endIf
endFunction

Bool function CheckGiveSpermToNPC(actor f, Float GameTime)
{Adds sperm to the given woman}

	Bool bFInPlayerLoc
	if f == none
		return false
	endIf
	Bool IsCreatureF = f.GetRace().HasKeywordString("ActorTypeCreature")
	Bool IsSpouseF = f.IsInFaction(PlayerMarriedFaction)
	Bool IsFollowerF = f.IsInFaction(FollowerFaction)
	if IsCreatureF && cfg.CreatureSperm == false
		return false
	endIf
	if IsSpouseF && cfg.ImpregnatePlayerSpouse == false
		return false
	endIf
	if IsFollowerF
		return false
	endIf
	Bool res = false
	location PlayerLoc = game.GetPlayer().GetCurrentLocation()
	if PlayerLoc != none
		bFInPlayerLoc = f.IsInLocation(PlayerLoc)
	else
		bFInPlayerLoc = false
	endIf
	if Controller.GetDaysSinceLastSex(f) > 0.500000 && bFInPlayerLoc == false
		if f.GetLeveledActorBase().GetSex() == 1
			if f != game.GetPlayer()
				Actor[] males
				String JsonFile = "../../../BeeingFemale/Couples/" + fwutility.GetJsonFile(f as form)
				Int ca = jsonutil.FormListCount(JsonFile, "Affairs")
				Int cp = jsonutil.FormListCount(JsonFile, "Partners")
				Int cn = storageutil.FormListCount(f as form, "FW.LastSeenNPCs")
				if cfg.ImpregnateHusband && jsonutil.HasFormValue(JsonFile, "Husband")
					males = fwutility.ActorArrayAppend(males, jsonutil.GetFormValue(JsonFile, "Husband", none) as actor, 10)
				endIf
				if cfg.ImpregnateAffairs && ca > 0
					while ca > 0
						ca -= 1
						males = fwutility.ActorArrayAppend(males, jsonutil.FormListGet(JsonFile, "Affairs", ca) as actor, 4)
					endWhile
				endIf
				if cfg.ImpregnatePartners && ca > 0
					while cp > 0
						cp -= 1
						males = fwutility.ActorArrayAppend(males, jsonutil.FormListGet(JsonFile, "Partners", cp) as actor, 2)
					endWhile
				endIf
				if cfg.ImpregnateLastNPC && cn > 0
					while cn > 0
						cn -= 1
						males = fwutility.ActorArrayAppend(males, storageutil.FormListGet(f as form, "FW.LastSeenNPCs", cn) as actor, 1)
					endWhile
				endIf
				if males.length > 0
					Int try = 3
					while try > 0
						try -= 1
						Int rnd = utility.RandomInt(0, males.length - 1)
						actor m = males[rnd]
						if m != none
							Bool bMInPlayerLoc = false
							if PlayerLoc != none
								bMInPlayerLoc = m.IsInLocation(PlayerLoc)
							else
								bMInPlayerLoc = false
							endIf
							if !bMInPlayerLoc
								if Controller.GetDaysSinceLastSex(m) > 0.300000
									if self.IsValidateMaleActor(m, false) > 0
										if m.GetRelationshipRank(f) >= 0
											Bool IsCreatureM = m.GetRace().HasKeywordString("ActorTypeCreature")
											Bool IsSpouseM = m.IsInFaction(PlayerMarriedFaction)
											Bool IsFollowerM = m.IsInFaction(FollowerFaction)
											if IsCreatureM == false || cfg.CreatureSperm == true
												if IsSpouseM == false || cfg.ImpregnatePlayerSpouse == true
													if IsFollowerM == false
														Controller.AddSperm(f, m, 1.00000)
														try = 0
														res = true
														self.Message(fwutility.MultiStringReplace(Content.SpermAdded, f.GetLeveledActorBase().GetName(), m.GetLeveledActorBase().GetName(), "", "", "", ""), self.MSG_High, 0)
													endIf
												endIf
											endIf
										endIf
									endIf
								endIf
							endIf
						endIf
					endWhile
				endIf
			endIf
		endIf
	endIf
	return res
endFunction

Float function getStateDuration(Int Step, actor woman)

	if Step == 0
		return cfg.FollicularDuration as Float * Manager.getActorDurationScale(Step, woman) * storageutil.GetFloatValue(woman as form, "FW.Irregulation", 1.00000)
	elseIf Step == 1
		return cfg.OvulationDuration as Float * Manager.getActorDurationScale(Step, woman) * storageutil.GetFloatValue(woman as form, "FW.Irregulation", 1.00000)
	elseIf Step == 2
		return cfg.LutealDuration as Float * Manager.getActorDurationScale(Step, woman) * storageutil.GetFloatValue(woman as form, "FW.Irregulation", 1.00000)
	elseIf Step == 3
		return cfg.MenstrualDuration as Float * Manager.getActorDurationScale(Step, woman) * storageutil.GetFloatValue(woman as form, "FW.Irregulation", 1.00000)
	elseIf Step == 4
		return cfg.Trimster1Duration as Float * Manager.getActorDurationScale(Step, woman) * storageutil.GetFloatValue(woman as form, "FW.Irregulation", 1.00000)
	elseIf Step == 5
		return cfg.Trimster2Duration as Float * Manager.getActorDurationScale(Step, woman) * storageutil.GetFloatValue(woman as form, "FW.Irregulation", 1.00000)
	elseIf Step == 6
		return cfg.Trimster3Duration as Float * Manager.getActorDurationScale(Step, woman) * storageutil.GetFloatValue(woman as form, "FW.Irregulation", 1.00000)
	elseIf Step == 7
		return 1.00000
	elseIf Step == 8
		return cfg.ReplanishDuration as Float * Manager.getActorDurationScale(Step, woman) * storageutil.GetFloatValue(woman as form, "FW.Irregulation", 1.00000)
	else
		return 0.000000
	endIf
endFunction

String function console_PrintCME(String phase, Bool bLog)

	String S = "== CME Info for " + phase + " =="
	if bLog
		debug.Trace("== CME Info " + phase + "==", 0)
	endIf
	phase = fwutility.toLower(phase)
	if phase == "0" || phase == "all" || phase == "follicularphase" || phase == "follicular"
		S += self.console_PrintCME_h(bLog, "follicularphase")
	endIf
	if phase == "1" || phase == "all" || phase == "ovulation"
		S += self.console_PrintCME_h(bLog, "ovulation")
	endIf
	if phase == "2" || phase == "all" || phase == "lutealphase" || phase == "luteal"
		S += self.console_PrintCME_h(bLog, "lutealphase")
	endIf
	if phase == "3" || phase == "all" || phase == "pms"
		S += self.console_PrintCME_h(bLog, "pms")
	endIf
	if phase == "4" || phase == "all" || phase == "menstruation"
		S += self.console_PrintCME_h(bLog, "menstruation")
	endIf
	if phase == "5" || phase == "all" || phase == "trimester1" || phase == "1st trimester"
		S += self.console_PrintCME_h(bLog, "trimester1")
	endIf
	if phase == "6" || phase == "all" || phase == "trimester2" || phase == "2nd trimester"
		S += self.console_PrintCME_h(bLog, "trimester2")
	endIf
	if phase == "7" || phase == "all" || phase == "trimester3" || phase == "3rd trimester"
		S += self.console_PrintCME_h(bLog, "trimester3")
	endIf
	if phase == "8" || phase == "all" || phase == "laborpains" || phase == "labor"
		S += self.console_PrintCME_h(bLog, "laborpains")
	endIf
	if phase == "9" || phase == "all" || phase == "recovery"
		S += self.console_PrintCME_h(bLog, "recovery")
	endIf
	return S
endFunction

function onBeeingFemaleCommand(String hookName, String argString, Float argNum, form sender)

	if hookName == "BeeingFemale" && sender as actor != none
		actor a = sender as actor
		Int iNum = argNum as Int
		Int validateF = self.IsValidateFemaleActor(a, false)
		Int validateM = self.IsValidateMaleActor(a, false)
		if argString == "AddContraception" && argNum > 0.000000 && validateF > 0
			Controller.AddContraception(a, argNum)
		elseIf argString == "AddSperm" && argNum > 0.000000
			form f1 = game.GetForm(argNum as Int)
			if f1
				actor a2 = f1 as actor
				Int validateF2 = self.IsValidateFemaleActor(a2, false)
				Int validateM2 = self.IsValidateMaleActor(a2, false)
				if a2
					if validateF > 0 && validateF2 > 0
						Controller.AddSperm(a, a2, 1.00000)
					elseIf validateM > 0 && validateF2 > 0
						Float virility = Controller.GetVirility(a)
						Float amount = utility.RandomFloat(virility * 0.750000, virility * 1.10000)
						if amount > 1.00000
							amount = 1.00000
						endIf
						amount = Manager.getSpermAmount(a2, a, amount)
						Controller.AddSperm(a2, a, amount)
					elseIf validateF > 0 && validateM2 as Bool
						Float virility = Controller.GetVirility(a2)
						Float amount = utility.RandomFloat(virility * 0.750000, virility * 1.10000)
						if amount > 1.00000
							amount = 1.00000
						endIf
						amount = Manager.getSpermAmount(a, a2, amount)
						Controller.AddSperm(a, a2, amount)
					endIf
				endIf
			endIf
		elseIf argString == "WashOutSperm" && argNum > 0.000000 && validateF > 0
			Controller.WashOutSperm(a, 2, argNum)
		elseIf argString == "ChangeState" && iNum >= 0 && iNum < 9 && validateF > 0
			Controller.ChangeState(a, iNum)
		elseIf argString == "InfoBox"
			Controller.showRankedInfoBox(a, iNum)
		elseIf argString == "DamageBaby" && validateF > 0
			Controller.DamageBaby(a, argNum)
		elseIf argString == "HealBaby" && validateF > 0
			Controller.DamageBaby(a, argNum)
		elseIf argString == "CanBecomePregnant" && validateF > 0
			Controller.setCanBecomePregnant(a, argNum == 1.00000)
		elseIf argString == "CanBecomePMS" && validateF > 0
			Controller.setCanBecomePMS(a, argNum == 1.00000)
		endIf
	endIf
endFunction

function getUp(actor a)

	utility.WaitMenuMode(0.000000)
	if a == game.GetPlayer()
		game.DisablePlayerControls(true, true, true, true, false, true, true, false, 0)
	endIf
	debug.SendAnimationEvent(a as objectreference, "GetupBirth")
	utility.Wait(3.50000)
	debug.SendAnimationEvent(a as objectreference, "IdleForceDefaultState")
	if a == game.GetPlayer()
		game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
	endIf
endFunction

Float function IrregulationValue(actor woman, Int state_number)

	Float max = Manager.IrregulationValue(woman, state_number)
	Float min = 1.00000
	if max > 1.50000
		max = 1.50000
	endIf
	if max <= 0.000000
		return 1.00000
	elseIf max < 1.00000
		min = max
		max = fwutility.MaxFloat(0.300000, 1.00000 / max)
	else
		min = fwutility.MaxFloat(0.300000, 1.00000 / max)
	endIf
	if min < max
		return utility.RandomFloat(min, max)
	else
		return utility.RandomFloat(max, min)
	endIf
endFunction

function OnUpdate()

	if bFirstRun
		self.OnGameLoad(false)
	else
		Int i = 10
		actor female = none
		while i > 0 && female == none
			i -= 1
			female = storageutil.FormListGet(none, "FW.SavedNPCs", curRefreshWoman) as actor
			curRefreshWoman += 1
			if curRefreshWoman > storageutil.FormListCount(none, "FW.SavedNPCs")
				curRefreshWoman = 0
			endIf
		endWhile
		if female != none && female != game.GetPlayer()
			Float t = utility.GetCurrentRealTime()
			Data.Update(female)
		endIf
	endIf
	self.RegisterForSingleUpdate(cfg.UpdateInterval)
endFunction

Bool function NpcMentruation()

	return true
endFunction

function Trace(String msg, actor a)

	; Empty function
endFunction

Bool function CheckIsLoreFriendlyMetting(actor w, actor m)

	if cfg.ImpregnateLoreFriendly == true
		if w.GetRace() != m.GetRace()
			if self.CheckIsLoreFriendlyRequired(w) || self.CheckIsLoreFriendlyRequired(m)
				return false
			endIf
		endIf
	endIf
	return true
endFunction

Float function IrregulationChance(actor woman, Int state_number)

	return cfg.IrregulationChance * Manager.IrregulationChance(woman, state_number)
endFunction

Bool function IsActorPregnantByChaurus(actor woman)

	if EstrusActive == true
		if ChaurusBreeder != none
			return woman.HasSpell(ChaurusBreeder as form)
		endIf
	endIf
	return false
endFunction

armor function SpawnChildItem(actor Mother, actor Father)

	Int gender = utility.RandomInt(0, 100)
	if gender < 53
		gender = 0
	else
		gender = 1
	endIf
	armor mo = BabyItemList.getBabyArmor(Mother, Father, gender)
	if mo == none
		self.Message(Content.NoChildItem, self.MSG_Debug, 0)
		return none
	endIf
	FWSystem.SubSpawnChildItem(mo, gender, Mother, Father)
	self.showBornMessage(Mother, Father, gender)
	return mo
endFunction

String function console_PrintCME_h(Bool bLog, String phase)

	String r = ""
	Int c = storageutil.FormListCount(none, "FW.AddOn.Always_" + phase)
	r += "\n- Always " + phase + " (" + c as String + ")"
	if bLog
		debug.Trace("- Always " + phase + " (" + c as String + ")", 0)
	endIf
	if c > 0
		while c > 0
			c -= 1
			r += "\n- - " + storageutil.FormListGet(none, "FW.AddOn.Always_" + phase, c).GetName() + "\n"
			if bLog
				debug.Trace("- - " + storageutil.FormListGet(none, "FW.AddOn.Always_" + phase, c).GetName(), 0)
			endIf
		endWhile
	endIf
	c = storageutil.FormListCount(none, "FW.AddOn.Sometimes_" + phase)
	r += "\n- Sometimes " + phase + " (" + c as String + ")"
	if bLog
		debug.Trace("- Sometimes " + phase + " (" + c as String + ")", 0)
	endIf
	if c > 0
		while c > 0
			c -= 1
			r += "\n- - " + storageutil.FormListGet(none, "FW.AddOn.Sometimes_" + phase, c).GetName()
			if bLog
				debug.Trace("- - " + storageutil.FormListGet(none, "FW.AddOn.Sometimes_" + phase, c).GetName(), 0)
			endIf
		endWhile
	endIf
	return r
endFunction

function RegisterFWCache(fwabilitybeeingfemale FW_MagicEffect)

	if FWCacheMax == 0
		FWCached = new fwabilitybeeingfemale[15]
		FWCacheMax = FWCached.length
	endIf
	Int i = FWCacheID
	Int j = 0
	while j < FWCacheMax
		if FWCached[j] == FW_MagicEffect
			return 
		endIf
		j += 1
	endWhile
	FWCacheID = (FWCacheID + 1) % FWCacheMax
	FWCached[i] = FW_MagicEffect
endFunction

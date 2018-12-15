;/ Decompiled by Champollion V1.0.1
Source   : FWChildSettings.psc
Modified : 2017-01-13 16:21:13
Compiled : 2017-01-18 08:35:35
User     : admin
Computer : PATRICK
/;
scriptName FWChildSettings extends Quest

;-- Properties --------------------------------------
imagespacemodifier property MenuImageSpace auto
idle property IdleStuddy auto
faction property Faction_MaySleep auto
Int property LoadingState auto hidden
faction property Faction_OtherParent auto
static property MeetPointForm auto
faction property PlayerFaction auto
fwaddonmanager property Manager auto
String[] property ChildPerkFile auto hidden
idle property IdleMagic auto
Bool[] property ChildPerkEnabled auto hidden
formlist property AttackSpells auto
Int[] property ChildPerkY auto hidden
Int[] property ChildPerkRank auto hidden
Bool[] property ChildPerkBool auto hidden
Int[] property ChildPerkX auto hidden
idle property IdleRead auto
Quest property ChildDialogueQuest auto
formlist property HealSpells auto
formlist property SummonSpells auto
Int property MaxLevelsPerCombat
	Int function get()

		return 10
	endFunction
endproperty
Int property ParentRelationShipLevel = 3 auto
faction property Faction_Job auto
formlist property Factions_To_Transfer auto
spell property LevelUpFX auto
formlist property ShildSpells auto
faction property Faction_WantsToPlay auto
Int property SkillpointsPerLevel
	Int function get()

		return 5
	endFunction
endproperty

;-- Variables ---------------------------------------
FWChildActor[] PlayerChildren
Int lastInitPerk = 0
Int rankIndex = 0
FWChildActor menuChild

;-- Functions ---------------------------------------

Int function ChildMaxLevel() global

	return 150
endFunction

function GetBeeingFemaleChildStats(String hookName, String argString, Float argNum, form Sender)

	self.UnregisterForModEvent("GetBeeingFemaleChildStats")
	Float[] intA = new Float[21]
	intA[0] = menuChild.GetLevel() as Float
	intA[1] = menuChild.getExp()
	intA[2] = self.getExperience(menuChild.GetLevel())
	intA[3] = menuChild.calculateSkillPoints() as Float
	intA[4] = menuChild.calculatePerkPoints() as Float
	intA[5] = menuChild.GetActorValue("Comprehension")
	intA[6] = menuChild.GetActorValue("Destruction")
	intA[7] = menuChild.GetActorValue("Illusion")
	intA[8] = menuChild.GetActorValue("Conjuration")
	intA[9] = menuChild.GetActorValue("Magicka")
	intA[10] = menuChild.GetActorValue("Restoration")
	intA[11] = menuChild.GetActorValue("Alteration")
	intA[12] = menuChild.GetActorValue("Block")
	intA[13] = menuChild.GetActorValue("CarryWeight")
	intA[14] = menuChild.GetActorValue("OneHanded")
	intA[15] = menuChild.GetActorValue("TwoHanded")
	intA[16] = menuChild.GetActorValue("Marksman")
	intA[17] = menuChild.GetActorValue("Sneak")
	intA[18] = menuChild.GetActorValue("Health")
	Int numPerks = 0
	Int numPerkE = 0
	Int i = 0
	while i < 128
		if ChildPerkFile[i] != "" && ChildPerkEnabled[i] == true
			numPerks += 1
			numPerkE += ChildPerkRank[i]
		endIf
		i += 1
	endWhile
	intA[19] = numPerks as Float
	intA[21] = numPerkE as Float
	ui.InvokeFloatA("CustomMenu", "_root.childSkillDial.initChildInt", intA)
	ui.Invoke("CustomMenu", "_root.childSkillDial.initDone")
endFunction

function ChildSkillMenuClosed(String hookName, String argString, Float argNum, form Sender)

	self.UnregisterForModEvent("GetBeeingFemaleChildData")
	self.UnregisterForModEvent("GetBeeingFemaleChildStats")
	self.UnregisterForModEvent("ChildActorSkilled")
	self.UnregisterForModEvent("ChildSkillMenuClosed")
	self.UnregisterForModEvent("ChildLoadPerkData")
	if menuChild.IsLearning == false
		menuChild.CheckInventory()
	endIf
	MenuImageSpace.Remove()
	menuChild = none
endFunction

function GetBeeingFemaleChildData(String hookName, String argString, Float argNum, form Sender)

	self.UnregisterForModEvent("GetBeeingFemaleChildData")
	ui.InvokeNumber("CustomMenu", "_root.childSkillDial.setPlatform", (game.UsingGamepad() as Int) as Float)
	String[] strA = new String[15]
	strA[0] = menuChild.Name
	strA[1] = menuChild.GetLastName()
	strA[2] = ""
	strA[3] = ""
	if menuChild.Mother != none && menuChild.Mother.GetLeveledActorBase() as Bool
		strA[4] = menuChild.Mother.GetLeveledActorBase().GetName()
		strA[5] = menuChild.Mother.GetLeveledActorBase().GetRace().GetName()
	else
		strA[4] = "$GAME_CONTENT_InfoSpell_UnknownParent"
		strA[5] = "$GAME_CONTENT_InfoSpell_UnknownParentRace"
	endIf
	if menuChild.Father != none && menuChild.Father.GetLeveledActorBase() as Bool
		strA[6] = menuChild.Father.GetLeveledActorBase().GetName()
		strA[7] = menuChild.Father.GetLeveledActorBase().GetRace().GetName()
	else
		strA[6] = "$GAME_CONTENT_InfoSpell_UnknownParent"
		strA[7] = "$GAME_CONTENT_InfoSpell_UnknownParentRace"
	endIf
	if menuChild.HasMagicka == true
		strA[8] = "y"
	else
		strA[8] = "n"
	endIf
	if menuChild.CanWearWeapons == true
		strA[9] = "y"
	else
		strA[9] = "n"
	endIf
	String sAlteration = ""
	String sConjuration = ""
	String sDestruction = ""
	String sIllusion = ""
	String sRestoration = ""
	Int c = menuChild.GetSpellCount()
	while c > 0
		c -= 1
		spell S = menuChild.GetNthSpell(c)
		if S.GetNumEffects() > 0 && S.GetMagickaCost() > 0
			String sk = S.GetNthEffectMagicEffect(0).GetAssociatedSkill()
			if sk == "Alteration"
				sAlteration += S.GetName() + "|"
			elseIf sk == "Conjuration"
				sConjuration += S.GetName() + "|"
			elseIf sk == "Destruction"
				sDestruction += S.GetName() + "|"
			elseIf sk == "Illusion"
				sIllusion += S.GetName() + "|"
			elseIf sk == "Restoration"
				sRestoration += S.GetName() + "|"
			endIf
		endIf
	endWhile
	strA[10] = sAlteration
	strA[11] = sConjuration
	strA[12] = sDestruction
	strA[13] = sIllusion
	strA[14] = sRestoration
	ui.InvokeInt("CustomMenu", "_root.childSkillDial.setChild", menuChild.GetFormID())
	fwsystemconfig cfg = game.GetFormFromFile(6184, fwutility.modFile("BeeingFemale")) as fwsystemconfig
	Bool debugMode = false
	if cfg != none
		debugMode = cfg.Messages <= 0
	endIf
	ui.InvokeBool("CustomMenu", "_root.childSkillDial.DebugMode", debugMode)
	ui.InvokeStringA("CustomMenu", "_root.childSkillDial.initChild", strA)
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	; Empty function
endFunction

String function GetModFile()

	Int i = game.GetModCount()
	while i > 0
		i -= 1
		if game.GetModName(i) == "BeeingFemale.esm"
			return "BeeingFemale.esm"
		elseIf game.GetModName(i) == "BeeingFemale.esp"
			return "BeeingFemale.esp"
		endIf
	endWhile
endFunction

function AddChildPerk(String NewChildPerk)

	LoadingState = 14
	if NewChildPerk == ""
		return 
	endIf
	LoadingState = 15
	Int i = 0
	if ChildPerkFile.length < 128
		self.initArray()
	endIf
	LoadingState = 16
	while i < 128
		if ChildPerkFile[i] == NewChildPerk
			return 
		endIf
		i += 1
	endWhile
	LoadingState = 17
	i = 0
	while i < 128
		LoadingState = 18
		if ChildPerkFile[i] == ""
			LoadingState = 19
			ChildPerkFile[i] = NewChildPerk
			ChildPerkX[i] = fwutility.getIniCInt("ChildPerk", NewChildPerk, "General", "PositionX", 0)
			ChildPerkY[i] = fwutility.getIniCInt("ChildPerk", NewChildPerk, "General", "PositionY", 0)
			ChildPerkRank[i] = fwutility.getIniCInt("ChildPerk", NewChildPerk, "General", "Ranks", 0)
			ChildPerkBool[i] = fwutility.getIniCBool("ChildPerk", NewChildPerk, "General", "UseAll", false)
			ChildPerkEnabled[i] = fwutility.getIniCBool("ChildPerk", NewChildPerk, "General", "Enabled", true)
			LoadingState = 20
			return 
		endIf
		i += 1
	endWhile
	LoadingState = 21
endFunction

function OnGameLoad()

	LoadingState = 1
	self.ResetChildPerks()
	LoadingState = 0
endFunction

Int[] function getPerkRequirement(String S, Int rank)

	Int[] r = new Int[14]
	r[0] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredLevel", 0)
	r[1] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredAlteration", 0)
	r[2] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredConjuration", 0)
	r[3] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredDestruction", 0)
	r[4] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredIllusion", 0)
	r[5] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredRestoration", 0)
	r[6] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredArchery", 0)
	r[7] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredOneHanded", 0)
	r[8] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredTwoHanded", 0)
	r[9] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredSneak", 0)
	r[10] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredHealth", 0)
	r[11] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredMagicka", 0)
	r[12] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredComprehension", 0)
	r[13] = fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredBlock", 0)
endFunction

; Skipped compiler generated GotoState

function RegisterChildPerk()

	LoadingState = 12
	Int c = fwutility.GetFileCount("ChildPerk", "ini")
	LoadingState = 13
	while c > 0
		c -= 1
		String fn = fwutility.GetFileName("ChildPerk", "ini", c)
		self.AddChildPerk(fn)
	endWhile
	LoadingState = 22
	Manager.RegisterChildPerk(self)
	LoadingState = 23
	self.SendModEvent("BeeingFemale", "RegisterChildPerk", 0.000000)
	LoadingState = 24
endFunction

function ResetChildPerks()

	self.initArray()
	Int i = 0
	LoadingState = 10
	while i < 128
		ChildPerkFile[i] = ""
		ChildPerkBool[i] = false
		ChildPerkRank[i] = 0
		ChildPerkX[i] = 0
		ChildPerkY[i] = 0
		ChildPerkEnabled[i] = false
		i += 1
	endWhile
	LoadingState = 11
	self.RegisterChildPerk()
	LoadingState = 25
endFunction

function OnUpdateGameTime()

	if PlayerChildren.length < 128
		return 
	endIf
	Int i = 128
	while i > 0
		i -= 1
		if PlayerChildren[i] != none
			if PlayerChildren[i].PlayerLastSeen > 0.000000
				if PlayerChildren[i].GetActorValue(self.OrderAV()) < 10.0000 && utility.GetCurrentGameTime() - PlayerChildren[i].PlayerLastSeen > 1.00000 || PlayerChildren[i].GetActorValue(self.OrderAV()) == 12.0000 && utility.GetCurrentGameTime() - PlayerChildren[i].PlayerLastSeen > 2.00000
					debug.Notification(PlayerChildren[i].GetDisplayName() + " is going home")
					PlayerChildren[i].Order_GoHome()
				endIf
			endIf
		endIf
	endWhile
endFunction

Float function getExperience(Int Level)

	return ((Level + 80) * Level / 200 * 45 + 15 + Level * 4) as Float
endFunction

function SetMeetPoint(ObjectReference or)

	if MeetPointForm == none
		MeetPointForm = game.GetFormFromFile(524505, "skyrim.esm") as static
	endIf
	referencealias ra = ChildDialogueQuest.GetAliasByName("MeetPoint") as referencealias
	ObjectReference xor = none
	if ra == none
		xor = game.GetPlayer().PlaceAtMe(MeetPointForm as form, 1, false, false)
	else
		xor = ra.GetReference()
	endIf
	if xor != none
		if or == none
			xor.MoveTo(or, 0.000000, 0.000000, 0.000000, true)
		else
			xor.MoveTo(game.GetPlayer() as ObjectReference, 0.000000, 0.000000, 0.000000, true)
		endIf
		(ChildDialogueQuest.GetAliasByName("MeetPoint") as referencealias).ForceRefTo(xor)
	endIf
endFunction

function OpenSkillMenu(FWChildActor ChildToUse)

	if ChildToUse == none
		return 
	endIf
	ChildToUse.HasMagicka = true
	ChildToUse.CanWearWeapons = true
	MenuImageSpace.Apply(1.00000)
	menuChild = ChildToUse
	menuChild.calculateSkillPoints()
	self.RegisterForModEvent("GetBeeingFemaleChildData", "GetBeeingFemaleChildData")
	self.RegisterForModEvent("GetBeeingFemaleChildStats", "GetBeeingFemaleChildStats")
	self.RegisterForModEvent("ChildActorSkilled", "ChildActorSkilled")
	self.RegisterForModEvent("ChildSkillMenuClosed", "ChildSkillMenuClosed")
	self.RegisterForModEvent("ChildActorPerk", "ChildActorPerk")
	self.RegisterForModEvent("ChildLoadPerkData", "ChildLoadPerkData")
	lastInitPerk = 0
	rankIndex = 0
	ui.OpenCustomMenu("BeeingFemale/BeeingFemaleChildSkill", 0)
endFunction

function SetOtherParentAlias(ObjectReference NewOtherParent, Bool bOnlyIfEmpty)

	if NewOtherParent != none
		if bOnlyIfEmpty
			(ChildDialogueQuest.GetAliasByName("OtherParent") as referencealias).ForceRefIfEmpty(NewOtherParent)
		else
			(ChildDialogueQuest.GetAliasByName("OtherParent") as referencealias).ForceRefTo(NewOtherParent)
		endIf
	else
		Quest q = game.GetFormFromFile(136066, "skyrim.esm") as Quest
		if q != none
			if bOnlyIfEmpty
				(ChildDialogueQuest.GetAliasByName("OtherParent") as referencealias).ForceRefIfEmpty((q.GetAliasByName("LoveInterest") as referencealias).GetReference())
			else
				(ChildDialogueQuest.GetAliasByName("OtherParent") as referencealias).ForceRefTo((q.GetAliasByName("LoveInterest") as referencealias).GetReference())
			endIf
		endIf
	endIf
endFunction

function AddPlayerChild(FWChildActor NewChild)

	Int i = 128
	Int nextInsertID = -1
	if PlayerChildren.length < 128
		self.initArray()
	endIf
	while i > 0
		i -= 1
		if PlayerChildren[i] == NewChild
			return 
		elseIf PlayerChildren[i] != none
			nextInsertID = i
		endIf
	endWhile
	if nextInsertID > -1 && nextInsertID < 128
		PlayerChildren[nextInsertID] = NewChild
	endIf
	self.UnregisterForUpdateGameTime()
	self.RegisterForUpdateGameTime(1.00000)
endFunction

function initArray()

	LoadingState = 2
	if PlayerChildren.length < 128
		PlayerChildren = new FWChildActor[128]
	endIf
	LoadingState = 3
	if ChildPerkX.length < 128
		ChildPerkX = new Int[128]
	endIf
	LoadingState = 4
	if ChildPerkY.length < 128
		ChildPerkY = new Int[128]
	endIf
	LoadingState = 5
	if ChildPerkRank.length < 128
		ChildPerkRank = new Int[128]
	endIf
	LoadingState = 6
	if ChildPerkBool.length < 128
		ChildPerkBool = new Bool[128]
	endIf
	LoadingState = 7
	if ChildPerkFile.length < 128
		ChildPerkFile = new String[128]
	endIf
	LoadingState = 8
	if ChildPerkEnabled.length < 128
		ChildPerkEnabled = new Bool[128]
	endIf
	LoadingState = 9
endFunction

function ChildActorSkilled(String hookName, String argString, Float argNum, form Sender)

	if Sender == menuChild as form
		if argString == "Regeneration"
			
		elseIf argString == "SpeedBonus"
			menuChild.SetActorValue("SpeedMult", 100.000 + argNum / 2.00000)
		else
			menuChild.SetActorValue(argString, argNum)
		endIf
	endIf
endFunction

function ChildLoadPerkData(String hookName, String argString, Float argNum, form Sender)

	Int i = lastInitPerk
	while i < 128
		if ChildPerkFile[i] != "" && ChildPerkEnabled[i] == true
			Int currentRank = 0
			Int pos = storageutil.StringListFind(menuChild as form, "FW.Child.Perks", ChildPerkFile[i])
			if pos >= 0
				currentRank = storageutil.IntListGet(menuChild as form, "FW.Child.PerksLevel", pos)
			endIf
			String[] a = new String[7]
			String perkFile = ChildPerkFile[i]
			Int c = ChildPerkRank[i]
			Int k = 0
			while k < c
				k += 1
				String SpellModFile = fwutility.modFile(fwutility.getIniCString("ChildPerk", perkFile, "rank" + k as String, "ModName", ""))
				Int SpellFormID = fwutility.getIniCInt("ChildPerk", perkFile, "rank" + k as String, "FormID", 0)
				spell S = game.GetFormFromFile(SpellFormID, SpellModFile) as spell
				if S != none
					String[] ent = new String[5]
					String bEnabled = "y"
					String desc = fwutility.getIniCString("ChildPerk", perkFile, "rank" + k as String, "Description", S.GetName())
					if S.GetNumEffects() > 0
						desc = fwutility.StringReplace(desc, "<mag>", "<font color='#ffffff'>" + (S.GetNthEffectMagnitude(0) as Int) as String + "</font>")
						desc = fwutility.StringReplace(desc, "<dur>", "<font color='#ffffff'>" + S.GetNthEffectDuration(0) as String + " sec</font>")
						desc = fwutility.StringReplace(desc, "<mag%>", "<font color='#ffffff'>" + (S.GetNthEffectMagnitude(0) as Int) as String + "%</font>")
						desc = fwutility.StringReplace(desc, "<dur%>", "<font color='#ffffff'>" + S.GetNthEffectDuration(0) as String + "%</font>")
					else
						desc = fwutility.StringReplace(desc, "<mag>", "<font color='#ffffff'>0</font>")
						desc = fwutility.StringReplace(desc, "<dur>", "<font color='#ffffff'>0 sec</font>")
						desc = fwutility.StringReplace(desc, "<mag%>", "<font color='#ffffff'>0%</font>")
						desc = fwutility.StringReplace(desc, "<dur%>", "<font color='#ffffff'>0%</font>")
					endIf
					Int cs = 10
					while cs > 0
						cs -= 1
						if cs < S.GetNumEffects()
							desc = fwutility.StringReplace(desc, "<mag " + (cs + 1) as String + ">", "<font color='#ffffff'>" + (S.GetNthEffectMagnitude(cs) as Int) as String + "</font>")
							desc = fwutility.StringReplace(desc, "<dur " + (cs + 1) as String + ">", "<font color='#ffffff'>" + S.GetNthEffectDuration(cs) as String + " sec</font>")
							desc = fwutility.StringReplace(desc, "<mag " + (cs + 1) as String + "%>", "<font color='#ffffff'>" + (S.GetNthEffectMagnitude(cs) as Int) as String + "%</font>")
							desc = fwutility.StringReplace(desc, "<dur " + (cs + 1) as String + "%>", "<font color='#ffffff'>" + S.GetNthEffectDuration(cs) as String + "%</font>")
						else
							desc = fwutility.StringReplace(desc, "<mag " + (cs + 1) as String + ">", "<font color='#ffffff'>0</font>")
							desc = fwutility.StringReplace(desc, "<dur " + (cs + 1) as String + ">", "<font color='#ffffff'>0 sec</font>")
							desc = fwutility.StringReplace(desc, "<mag " + (cs + 1) as String + "%>", "<font color='#ffffff'>0%</font>")
							desc = fwutility.StringReplace(desc, "<dur " + (cs + 1) as String + "%>", "<font color='#ffffff'>0%</font>")
						endIf
					endWhile
					ent[0] = (rankIndex + k - 1) as String
					ent[1] = fwutility.getIniCString("ChildPerk", perkFile, "rank" + k as String, "Name", "")
					ent[2] = desc
					ent[3] = bEnabled
					ent[4] = self.getPerkRequirementString(perkFile, k)
					if ent[1] == ""
						ent[1] = S.GetName()
					endIf
					ui.InvokeStringA("CustomMenu", "_root.childSkillDial.AddPerkEntry", ent)
				endIf
			endWhile
			a[0] = ChildPerkFile[i]
			a[1] = i as String
			a[2] = ChildPerkX[i] as String
			a[3] = ChildPerkY[i] as String
			a[4] = currentRank as String
			a[5] = rankIndex as String
			a[6] = ChildPerkRank[i] as String
			ui.InvokeStringA("CustomMenu", "_root.childSkillDial.AddPerkA", a)
			rankIndex += ChildPerkRank[i]
			lastInitPerk = i + 1
			return 
		endIf
		i += 1
	endWhile
	ui.Invoke("CustomMenu", "_root.childSkillDial.PerksTransmittet")
endFunction

function RemovePlayerChild(FWChildActor ChildToRemove)

	if PlayerChildren.length < 128
		return 
	endIf
	Int i = 128
	while i > 0
		i -= 1
		if PlayerChildren[i] == ChildToRemove
			PlayerChildren[i] = none
			return 
		endIf
	endWhile
endFunction

; Skipped compiler generated GetState

String function getPerkRequirementString(String S, Int rank)

	return fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredLevel", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredAlteration", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredConjuration", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredDestruction", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredIllusion", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredRestoration", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredArchery", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredOneHanded", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredTwoHanded", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredSneak", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredHealth", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredMagicka", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredComprehension", 0) as String + ";" + fwutility.getIniCInt("ChildPerk", S, "rank" + rank as String, "RequiredBlock", 0) as String
endFunction

String function OrderAV()

	return "JumpingBonus"
endFunction

function SetHouseAlias()

	Int i = game.GetModCount()
	Quest q = game.GetFormFromFile(136066, "skyrim.esm") as Quest
	while i > 0
		i -= 1
		if game.GetModName(i) == "HearthFires.esm"
			i = 0
			Quest qHF = game.GetFormFromFile(17076, "HearthFires.esm") as Quest
			if qHF != none
				if qHF.IsActive()
					locationalias LocAlias = qHF.GetAliasByName("CurrentHomeHouse") as locationalias
					if LocAlias != none
						(ChildDialogueQuest.GetAliasByName("PlayerHomeLoc") as locationalias).ForceLocationTo(LocAlias.GetLocation())
					elseIf q != none
						(ChildDialogueQuest.GetAliasByName("PlayerHomeLoc") as locationalias).ForceLocationTo((q.GetAliasByName("CurrentMarriageHouse") as locationalias).GetLocation())
					endIf
					if q != none
						(ChildDialogueQuest.GetAliasByName("PlayerHome") as referencealias).ForceRefTo((q.GetAliasByName("HouseCenter") as referencealias).GetReference())
					endIf
					return 
				endIf
			endIf
		endIf
	endWhile
	if q != none
		(ChildDialogueQuest.GetAliasByName("PlayerHomeLoc") as locationalias).ForceLocationTo((q.GetAliasByName("CurrentMarriageHouse") as locationalias).GetLocation())
		(ChildDialogueQuest.GetAliasByName("PlayerHome") as referencealias).ForceRefTo((q.GetAliasByName("HouseCenter") as referencealias).GetReference())
	endIf
endFunction

function ChildActorPerk(String hookName, String argString, Float argNum, form Sender)

	if Sender == menuChild as form
		Int i = 128
		Int perkIndex = -1
		while i > 0
			i -= 1
			if argString == ChildPerkFile[i]
				perkIndex = i
				i = 0
			endIf
		endWhile
		if perkIndex >= -1
			Int pos = storageutil.StringListFind(menuChild as form, "FW.Child.Perks", argString)
			if pos == -1
				storageutil.StringListAdd(menuChild as form, "FW.Child.Perks", argString, true)
				storageutil.IntListAdd(menuChild as form, "FW.Child.PerksLevel", argNum as Int, true)
			else
				storageutil.IntListSet(menuChild as form, "FW.Child.PerksLevel", pos, argNum as Int)
			endIf
			menuChild.handlePerk(perkIndex)
		endIf
	endIf
endFunction

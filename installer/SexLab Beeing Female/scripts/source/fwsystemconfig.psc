;/ Decompiled by Champollion V1.0.1
Source   : FWSystemConfig.psc
Modified : 2017-01-18 07:35:35
Compiled : 2017-01-18 08:35:06
User     : admin
Computer : PATRICK
/;
scriptName FWSystemConfig extends SKI_ConfigBase

;-- Properties --------------------------------------
Float property SpermDuration = 2.00000 auto hidden
Float property WashOutHourDelay = 0.250000 auto hidden
Bool property PlayerTimer = true auto hidden

Int property FW_MENU_PAGE_AddOn
	Int function get()

		return 6
	endFunction
endproperty

Bool property BreastScale = true auto hidden
Int property MultipleThreshold = 85 auto hidden
String property WidgetProfile = "default.ini" auto hidden
Int property LutealDuration = 5 auto hidden
Bool property ImpregnateAffairs = true auto hidden
Int property KeyStateWidget = 9 auto hidden
Bool property ImpregnatePlayerSleep = true auto hidden
Int property FW_MENU_PAGE_Children
	Int function get()

		return 5
	endFunction
endproperty
Int property FW_MENU_PAGE_Cycle
	Int function get()

		return 1
	endFunction
endproperty
Bool property ImpregnateHusband = true auto hidden
Bool property bForceMenu = false auto hidden
Int property ImpregnateCount = 10 auto hidden
Float property ConceiveChanceFollower = 40.0000 auto hidden
Bool property NPCHaveItems = true auto hidden
Float property MaleVirilityRecovery = 1.00000 auto hidden
Float property MenstrualCramps = 35.0000 auto hidden
Int property FW_MENU_PAGE_Pregnancy
	Int function get()

		return 2
	endFunction
endproperty
Int property Messages = 3 auto hidden
Bool property NPCFeelPain = false auto hidden
Int property Trimster1Duration = 10 auto hidden
Float property WashOutWaterChance = 0.0200000 auto hidden
Bool property SexModInstalled
	Bool function get()

		return bSexModInstalled
	endFunction
endproperty
fwsystem property System auto
Int property ImpregnateTime = 3 auto hidden
Int property ReplanishDuration = 30 auto hidden
Bool property NPCMenstrualNoTalk = true auto hidden
Bool property ImpregnatePartners = true auto hidden
Int property MaxBabys = 3 auto hidden
Int property OvulationDuration = 2 auto hidden
Float property BellyMaxScale = 4.20000 auto hidden
Int property FW_MENU_PAGE_Impregnate
	Int function get()

		return 3
	endFunction
endproperty
Int property NoVaginalCumChance = 3 auto hidden
Float property PMSChance = 25.0000 auto hidden
Bool property ImpregnateActive = true auto hidden
Bool property NPCMenstrualMood = true auto hidden
Bool property ImpregnateLastNPC = false auto hidden
Int property VisualScalingKind = 0 auto hidden
Int property ImpregnatePlayerChance = 30 auto hidden
Int[] property Compatible auto hidden
Int property Trimster3Duration = 10 auto hidden
Bool property bChangeDuration = true auto hidden
Bool property bPlayerInfoSpell = true auto hidden
Bool property UpdateIntervalEnabled = true auto hidden
Int property Difficulty = 2 auto hidden
Bool property NPCBornChild = false auto hidden
Bool property RelevantNPC = true auto hidden
Bool property ImpregnatePlayerFollower = true auto hidden
Bool property ImpregnateLastPlayerNPCs = true auto hidden
Bool property ImpregnatePlayerAmbient = false auto hidden
Int property Trimster2Duration = 10 auto hidden
Bool property ImpregnatePlayerHusband = true auto hidden
Int property FW_MENU_PAGE_System
	Int function get()

		return 9
	endFunction
endproperty
Int property VisualScaling = 1 auto hidden
Bool property CreatureSperm = true auto hidden
Bool property abortus = true auto hidden
Bool property RelevantFollower = true auto hidden
Bool property NPCMenstruationBlood = true auto hidden
Bool property ChildrenMayCry = true auto hidden
Int property MenstrualDuration = 2 auto hidden
Int property FW_MENU_PAGE_Cheat
	Int function get()

		return 8
	endFunction
endproperty
Int property BabySpawnNPC = 2 auto hidden
Int property WeightGainMax = 50 auto hidden
Bool property RelevantPlayer = true auto hidden
Int property PMSEffects = 6 auto hidden
Float property ConceiveChanceNPC = 40.0000 auto hidden
Int property BabySpawn = 2 auto hidden
Float property ConceiveChance = 40.0000 auto hidden
Float property WashOutFluidChance = 0.750000 auto hidden
Int property FW_MENU_PAGE_Male
	Int function get()

		return 4
	endFunction
endproperty
Int property FollicularDuration = 5 auto hidden
Float property irregulationChance = 9.00000 auto hidden
Int property FW_MENU_PAGE_Settings
	Int function get()

		return 0
	endFunction
endproperty
Int property FW_MENU_PAGE_Info
	Int function get()

		return 7
	endFunction
endproperty
Bool property ImpregnateLoreFriendly = true auto hidden
Float property BreastsMaxScale = 0.400000 auto hidden
fwtextcontents property Content auto
Bool property BellyScale = true auto hidden
Bool property NPCCanBecomePregnant = true auto hidden
Float property UpdateInterval = 30.0000 auto hidden
Float property WashOutChance = 0.000000 auto hidden
Bool property ImpregnatePlayerSpouse = false auto hidden
Bool property PlayAnimations = false auto hidden

;-- Variables ---------------------------------------
Int ImpregnateCountDef = 10
Int WeightGainMaxDef = 50
Bool bASX = false
Int DifficultyDef = 2
String[] VisualScalingOptions
Bool ImpregnatePlayerFollowerDef = true
Int AddOnActiveRaces = -1
Int[] UI_AddOnMisc
Float SpermDurationDef = 2.00000
Bool BreastScaleDef = true
Bool bEstrus = false
Int AddOnActiveMisc = -1
Bool[] CompatiblityActive
Int MenstrualDurationDef = 2
Bool ImpregnatePlayerHusbandDef = true
Int[] UI_SpermInside
Float WashOutWaterChanceDef = 0.100000
Int MultipleThresholdDef = 85
Float irregulationChanceDef = 4.00000
String[] UIS_AddOnRaces
Bool ImpregnateHusbandDef = true
Int[] UI_AddOnPMS
Bool RelevantFollowerDef = true
Bool bFlowerGirls = false
Bool UpdateIntervalEnabledDef = true
Bool bAP = false
String[] perkTestResult
Float MenstrualCrampsDef = 35.0000
Bool bMenstruationBloodDef = true
Int ReplanishDurationDef = 10
Bool bBathingInSkyrim = false
Bool bRunUpdateAllWoman = false
Int[] UI_TestPerk
Float WashOutHourDelayDef = 0.250000
Bool ImpregnatePlayerSleepDef = true
Int OvulationDurationDef = 2
Bool ImpregnatePartnersDef = true
Int MaxBabysDef = 3
Float MaleVirilityRecoveryDef = 1.00000
String[] MessagesHighlightTexts
Bool bHAnimations = false
String[] VisualScalingHighlightTexts
Bool bSexLab = false
Bool bSexModInstalled = false
String[] perkTestResultText
Int lastPerkTested = -1
Bool RelevantNPCDef = true
Int selectedPerk = -1
Int BabySpawnNPCDef = 2
Int AddOnActiveCME = -1
Bool RelevantPlayerDef = true
Int[] CompatiblityDefaultValue
String[] CompatiblityModNames
Int CompatiblityModCount = 0
String[] CompatibleHighlightTexts
String[] CompatibleOptions
Int ImpregnatePlayerChanceDef = 30
String[] VisualScalingKindOptions
Bool bOSA = false
Bool CreatureSpermDef = true
Bool ImpregnatePlayerSpouseDef = false
Bool PlayAnimationsDef = false
String[] DifficultyHighlightTexts
String[] DifficultyOptions
Int ImpregnateTimeDef = 3
Int AddOnActiveRacesGroup = -1
Float ConceiveChanceNPCDef = 40.0000
Int BabySpawnDef = 2
Float WashOutFluidChanceDef = 0.600000
String WidgetProfileDef = "default.ini"
Float UpdateIntervalDef = 30.0000
String[] VisualScalingKindHighlightTexts
String[] BabySpawnHighlightTexts
Bool ImpregnatePlayerAmbientDef = false
String[] MessagesOptions
Int[] UI_AddOnRaces
Bool ImpregnateLoreFriendlyDef = true
Bool ImpregnateLastNPCDef = false
Bool ChildrenMayCryDef = true
Bool ImpregnateActiveDef = true
Bool BellyScaleDef = true
Bool ImpregnateAffairsDef = true
Float WashOutChanceDef = 0.000000
Bool PlayerTimerDef = true
Bool NPCBornChildDef = false
Int UI_AddOnBack
Bool NPCMenstrualNoTalkDef = true
Bool NPCCanBecomePregnantDef = true
Bool NPCMenstruationBloodDef = true
Float BreastsMaxScaleDef = 0.400000
Bool NPCFeelPainDef = false
Bool NPCMenstrualMoodDef = true
Bool bTestPerkRan = false
Bool abortusDef = true
Int VisualScalingKindDef = 0
Int UI_Activator
Bool ImpregnateLastPlayerNPCsDef = true
String[] UIS_AddOnRacesGroup
String[] UIS_AddOnCME
Float BellyMaxScaleDef = 4.20000
Int NoVaginalCumChanceDef = 3
Int LutealDurationDef = 5
Bool NPCHaveItemsDef = true
Int[] CompatiblityRank
Int[] UI_AddOnCME
Int[] UI_Child
Int Trimster3DurationDef = 10
String[] BabySpawnOptions
Int Trimster1DurationDef = 10
Int[] UI_Compatible
Bool bTestPerkMode = false
Int PMSEffectsDef = 6
Int MessagesDef = 3
Int PageResetJobID = 0
Int KeyStateWidgetDef = 9
Int VisualScalingDef = 1
String[] UIS_AddOnMisc
Float ConceiveChanceDef = 40.0000
Int FollicularDurationDef = 5
Float PMSChanceDef = 25.0000
Int Trimster2DurationDef = 10
Float ConceiveChanceFollowerDef = 40.0000

;-- Functions ---------------------------------------

function OnLoadGame()

	bTestPerkMode = false
	bTestPerkRan = false
	selectedPerk = -1
	lastPerkTested = -1
	AddOnActiveRaces = -1
	AddOnActiveCME = -1
	AddOnActiveMisc = -1
	bRunUpdateAllWoman = false
	self.CheckForSexMods()
endFunction

function LoadProfileIfExists(String File)

	Int c = fwutility.GetFileCount("Profile", "json")
	if c > 126
		c = 126
	endIf
	while c > 0
		c -= 1
		String f = fwutility.GetFileName("Profile", "json", c)
		if f == File || f == File + ".json"
			self.LoadProfile(f)
			return 
		endIf
	endWhile
endFunction

String function getCurrentProfile()

	Int c = fwutility.GetFileCount("Profile", "json")
	if c > 126
		c = 126
	endIf
	while c > 0
		c -= 1
		String f = fwutility.GetFileName("Profile", "json", c)
		if self.IsProfile(f)
			return f
		endIf
	endWhile
	return "$GAME_CONTENT_StateUnknown"
endFunction

function CheckNextPerk_Async(String hookName, String argString, Float argNum, form sender)

	self.UnregisterForModEvent("FWSystemConfig_Async_Call")
	self.CheckNextPerk()
endFunction

String function getContraceptionTime()

	if System.Controller.getContraception(game.GetPlayer()) > 1.50000
		Float cTime = storageutil.GetFloatValue(game.GetPlayer() as form, "FW.ContraceptionTime", 0.000000)
		Float GT = utility.GetCurrentGameTime()
		Float cDur = System.MaxContraceptionTime
		return self.GetTimeString(cTime + cDur - GT, true, "$FW_MENU_OPTIONS_Contraception_delay", false)
	else
		return "$FW_MENU_OPTIONS_Contraception_none"
	endIf
endFunction

function OnOptionDefault(Int a_option)

	if self.CurrentPage == Pages[self.FW_MENU_PAGE_System]
		Int index = UI_Compatible.find(a_option, 0)
		if index >= 0
			Compatible[index] = CompatiblityDefaultValue[index]
			self.SetMenuOptionValue(a_option, CompatibleOptions[Compatible[index]], false)
		endIf
	endIf
endFunction

function ResetSystem(Bool ResetBaseSystem)

	if ResetBaseSystem
		System.Stop()
	endIf
	Int i = System.ChildSettings.ChildPerkFile.length
	while i > 0
		i -= 1
		System.ChildSettings.ChildPerkX[i] = 0
		System.ChildSettings.ChildPerkY[i] = 0
		System.ChildSettings.ChildPerkRank[i] = 0
		System.ChildSettings.ChildPerkBool[i] = false
		System.ChildSettings.ChildPerkFile[i] = ""
	endWhile
	System.Controller.Stop()
	System.Manager.Stop()
	System.Content.Stop()
	System.BabyItemList.Stop()
	System.StateWidget.Stop()
	System.ContraceptionWidget.Stop()
	System.BabyHealthWidget.Stop()
	System.ChildSettings.Stop()
	if System.Player != none
		System.Player.dispel()
	endIf
	if System.PlayerMale != none
		System.PlayerMale.dispel()
	endIf
	if ResetBaseSystem
		System.Start()
	endIf
	Int WaitforSystem = 5
	while WaitforSystem > 0
		WaitforSystem -= 1
		if System.IsRunning()
			WaitforSystem = 0
		endIf
	endWhile
	System.Controller.Start()
	System.Manager.Start()
	System.Content.Start()
	System.BabyItemList.Start()
	System.StateWidget.Start()
	System.ContraceptionWidget.Start()
	System.BabyHealthWidget.Start()
	System.ChildSettings.Start()
	System.ChildSettings.ResetChildPerks()
	System.StateWidget.OnWidgetReset()
	System.ContraceptionWidget.OnWidgetReset()
	System.BabyHealthWidget.OnWidgetReset()
	Int ac = self.GetNumAliases()
	Bool bFoundPlayer = false
	while ac > 0
		ac -= 1
		referencealias ra = self.GetNthAlias(ac) as referencealias
		if ra.GetActorReference() != none
			(ra as fwplayeralias).OnModReset()
			if ra.GetActorReference() == game.GetPlayer()
				bFoundPlayer = true
			endIf
		endIf
	endWhile
	if bFoundPlayer == false
		debug.Notification(Content.Req_PlayerNotFoundOnRef)
		debug.Notification(Content.FixProblem)
		(self.GetAlias(0) as referencealias).ForceRefTo(game.GetPlayer() as objectreference)
	endIf
	System.initArrays()
	System.refreshObjective()
	System.CheckPlayerSex()
	System.UnregisterForAllModEvents()
	System.RegisterForModEvent("OrgasmStart", "onSexLabOrgasm")
	System.RegisterForModEvent("AddActorSperm", "onAddActorSperm")
	System.RegisterForModEvent("AddSperm", "onAddActorSperm")
	System.RegisterForModEvent("BeeingFemale", "onBeeingFemaleCommand")
	System.ModEnabled.SetValueInt(1)
	System.CloakingSpellEnabled.SetValueInt(1)
	System.Manager.ClearRaceAddOns()
	System.Manager.ClearCMEAddOns()
	System.Manager.ClearMiscAddOns()
	self.SendModEvent("FWAddOnRefresh", "", 0.000000)
	System.Content.LoadContent()
	System.ChildSettings.RegisterChildPerk()
	System.ReNewSpells()
	System.OnGameLoad(true)
endFunction

Int function GetCompatibleIndexByRank(Int Rank, Int index)

	if Rank == 0
		return 0
	elseIf Rank == 1
		return 1
	elseIf Rank == 2
		if index == 0
			return 0
		elseIf index == 1
			return 2
		elseIf index == 2
			return 3
		endIf
	endIf
endFunction

function OnConfigOpen()

	bTestPerkRan = false
	bTestPerkMode = false
	selectedPerk = -1
	lastPerkTested = -1
	Int i = 0
	while i < 128
		perkTestResult[i] = "Progress"
		perkTestResultText[i] = ""
		i += 1
	endWhile
endFunction

String function GetJobTitle(actor target)

	if target == none
		if System.Player != none
			if System.Player.currentState >= 4 && System.Player.currentState < 20
				if System.Player.currentState <= 6
					return "$FW_MENU_OPTIONS_ForceBirth"
				else
					return "$FW_MENU_OPTIONS_SpeedUpRecovery"
				endIf
			elseIf System.Player.currentState >= 20
				return "$FW_MENU_OPTIONS_Locked"
			else
				return "$FW_MENU_OPTIONS_Impregnation"
			endIf
		endIf
	else
		Int npcState = System.Controller.GetFemaleState(target)
		if npcState >= 4 && npcState < 20
			if npcState <= 6
				return "$FW_MENU_OPTIONS_ForceBirth"
			else
				return "$FW_MENU_OPTIONS_SpeedUpRecovery"
			endIf
		elseIf npcState >= 20
			return "$FW_MENU_OPTIONS_Locked"
		else
			return "$FW_MENU_OPTIONS_Impregnation"
		endIf
	endIf
	return "$FW_MENU_OPTIONS_None"
endFunction

function CheckNextPerk()

	lastPerkTested += 1
	if System.ChildSettings.ChildPerkFile[lastPerkTested] == ""
		Int tmp = lastPerkTested
		while tmp > 0
			tmp -= 1
			self.SetOptionFlags(UI_TestPerk[tmp], self.OPTION_FLAG_NONE, false)
		endWhile
		return 
	endIf
	perkTestResult[lastPerkTested] = "$FW_MENU_BASIC_Checking"
	self.SetTextOptionValue(UI_TestPerk[lastPerkTested], "$FW_MENU_BASIC_Checking", false)
	String File = System.ChildSettings.ChildPerkFile[lastPerkTested]
	Int posX = System.ChildSettings.ChildPerkX[lastPerkTested]
	Int posY = System.ChildSettings.ChildPerkY[lastPerkTested]
	Int ranks = System.ChildSettings.ChildPerkRank[lastPerkTested]
	Bool bUseAll = System.ChildSettings.ChildPerkBool[lastPerkTested]
	Bool bEnabled = System.ChildSettings.ChildPerkEnabled[lastPerkTested]
	Bool bSuccess = true
	String res = "General;"
	if ranks < 1
		bSuccess = false
		res += "<font color='#ff0000'>-</font> No ranks set;"
	elseIf ranks > 30
		bSuccess = false
		res += "<font color='#ff0000'>-</font> to many ranks set (max 30);"
	endIf
	if posX < 0
		bSuccess = false
		res += "<font color='#ff0000'>-</font> X-Position must be greater 0;"
	elseIf posX > 1000
		bSuccess = false
		res += "<font color='#ff0000'>-</font> X-Position must be less 1000;"
	endIf
	if posY < 0
		bSuccess = false
		res += "<font color='#ff0000'>-</font> Y-Position must be greater 0;"
	elseIf posY > 100
		bSuccess = false
		res += "<font color='#ff0000'>-</font> Y-Position must be less 100;"
	endIf
	Bool bFound = false
	Int j = 0
	Int c = System.ChildSettings.ChildPerkFile.length
	while j < c
		if j != lastPerkTested
			if System.ChildSettings.ChildPerkX[j] > posX - 3 && System.ChildSettings.ChildPerkX[j] < posX + 3
				if System.ChildSettings.ChildPerkY[j] > posY - 10 && System.ChildSettings.ChildPerkY[j] < posY + 10
					bSuccess = false
					res += "<font color='#ff0000'>-</font> To Close to " + System.ChildSettings.ChildPerkFile[j] + ";"
				endIf
			endIf
		endIf
		j += 1
	endWhile
	if bSuccess == true
		res += "<font color='#00ff00'>-</font> General properties are OK;"
	endIf
	Int i = 0
	while i < ranks
		i += 1
		String modFile = fwutility.getIniCString("ChildPerk", File, "Rank" + i as String, "ModName", "")
		String rModFile = fwutility.modFile(modFile)
		Int rFormID = fwutility.getIniCInt("ChildPerk", File, "Rank" + i as String, "FormID", 0)
		Int[] req = System.ChildSettings.getPerkRequirement(File, i)
		Bool bRankSuccess = false
		res += "Rank " + i as String + ";"
		if modFile == ""
			res += "<font color='#ff0000'>-</font> Does not have a mod file;"
		endIf
		if rModFile == "" && modFile != ""
			res += "<font color='#ff0000'>-</font> Can't find the Mod File;"
		endIf
		if rFormID < 0
			res += "<font color='#ff0000'>-</font> Has a negative form id;"
		elseIf rFormID > 16777215
			bRankSuccess = false
			res += "<font color='#ff0000'>-</font> The form id is to huge;"
		endIf
		if rModFile != "" && rFormID > 0 && rFormID <= 16777215
			form f = game.GetFormFromFile(rFormID, rModFile)
			String rName = fwutility.getIniCString("ChildPerk", File, "Rank" + i as String, "Name", f.GetName())
			if f == none
				res += "<font color='#ff0000'>-</font> Can't find the Form;"
			elseIf f as spell == none && f as armor == none && f as faction == none && f as shout == none
				res += "<font color='#00FF00'>-</font> Form Name: '" + f.GetName() + "';<font color='#ff0000'>-</font> Form is of the wrong type;"
				res += "<font color='#00FF00'>-</font> Form Type: " + fwutility.getTypeString(f.GetType()) + ";"
			else
				res += "<font color='#00FF00'>-</font> Form Name: '" + f.GetName() + "';"
				res += "<font color='#00FF00'>-</font> Form Type: " + fwutility.getTypeString(f.GetType()) + ";"
				bRankSuccess = true
			endIf
		endIf
		if req[0] > 100
			res += "<font color='#ff0000'>-</font> Req. Level to high (max 120);"
		endIf
		if req[1] > 100
			res += "<font color='#ff0000'>-</font> Req. Alteration to high (max 100);"
		endIf
		if req[2] > 100
			res += "<font color='#ff0000'>-</font> Req. Conjuration to high (max 100);"
		endIf
		if req[3] > 100
			res += "<font color='#ff0000'>-</font> Req. Destruction to high (max 100);"
		endIf
		if req[4] > 100
			res += "<font color='#ff0000'>-</font> Req. Illusion to high (max 100);"
		endIf
		if req[5] > 100
			res += "<font color='#ff0000'>-</font> Req. Restoration to high (max 100);"
		endIf
		if req[6] > 100
			res += "<font color='#ff0000'>-</font> Req. Archery to high (max 100);"
		endIf
		if req[7] > 100
			res += "<font color='#ff0000'>-</font> Req. OneHanded to high (max 100);"
		endIf
		if req[8] > 100
			res += "<font color='#ff0000'>-</font> Req. TwoHanded to high (max 100);"
		endIf
		if req[9] > 100
			res += "<font color='#ff0000'>-</font> Req. Sneak to high (max 100);"
		endIf
		if req[10] > 200
			res += "<font color='#ff0000'>-</font> Req. Health to high (max 200);"
		endIf
		if req[11] > 200
			res += "<font color='#ff0000'>-</font> Req. Magicka to high (max 200);"
		endIf
		if req[12] > 100
			res += "<font color='#ff0000'>-</font> Req. Comprehension to high (max 100);"
		endIf
		if req[13] > 100
			res += "<font color='#ff0000'>-</font> Req. Block to high (max 100);"
		endIf
		if bRankSuccess == true
			res += "<font color='#00FF00'>-</font> Rank is OK;"
		else
			bSuccess = false
			res += "<font color='#ff0000'>-</font> Rank was failed;"
		endIf
	endWhile
	perkTestResultText[lastPerkTested] = res
	if bSuccess == true
		self.SetTextOptionValue(UI_TestPerk[lastPerkTested], "$FW_MENU_BASIC_Success", false)
		perkTestResult[lastPerkTested] = "$FW_MENU_BASIC_Success"
	else
		self.SetTextOptionValue(UI_TestPerk[lastPerkTested], "$FW_MENU_BASIC_Failed", false)
		perkTestResult[lastPerkTested] = "$FW_MENU_BASIC_Failed"
	endIf
	self.CheckNextPerk()
endFunction

Int function getContraception()

	Float res = System.Controller.getContraception(game.GetPlayer())
	return res as Int
endFunction

function OnOptionMenuOpen(Int a_option)

	if self.CurrentPage == Pages[self.FW_MENU_PAGE_System]
		Int index = UI_Compatible.find(a_option, 0)
		if index >= 0
			self.SetMenuDialogDefaultIndex(CompatiblityDefaultValue[index])
			self.SetMenuDialogOptions(self.GetCompatibleOptions(index))
			self.SetMenuDialogStartIndex(Compatible[index])
		endIf
	endIf
endFunction

function SetDifficultyOptions()

	if DifficultyOptions.length != 5
		DifficultyOptions = new String[5]
	endIf
	if DifficultyHighlightTexts.length != 5
		DifficultyHighlightTexts = new String[5]
	endIf
	DifficultyOptions[0] = "$FW_MENU_OPTIONS_DifficultyPainless"
	DifficultyHighlightTexts[0] = "$FW_MENUTXT_OPTIONS_DifficultyPainless"
	DifficultyOptions[1] = "$FW_MENU_OPTIONS_DifficultyEasy"
	DifficultyHighlightTexts[1] = "$FW_MENUTXT_OPTIONS_DifficultyEasy"
	DifficultyOptions[2] = "$FW_MENU_OPTIONS_DifficultyNormal"
	DifficultyHighlightTexts[2] = "$FW_MENUTXT_OPTIONS_DifficultyNormal"
	DifficultyOptions[3] = "$FW_MENU_OPTIONS_DifficultyAdvanced"
	DifficultyHighlightTexts[3] = "$FW_MENUTXT_OPTIONS_DifficultyAdvanced"
	DifficultyOptions[4] = "$FW_MENU_OPTIONS_DifficultyHeavy"
	DifficultyHighlightTexts[4] = "$FW_MENUTXT_OPTIONS_DifficultyHeavy"
endFunction

function SetCompatibleOptions()

	if CompatibleOptions.length != 6
		CompatibleOptions = new String[6]
	endIf
	if CompatibleHighlightTexts.length != 6
		CompatibleHighlightTexts = new String[6]
	endIf
	CompatibleOptions[0] = "$FW_MENU_OPTIONS_Compatible_None"
	CompatibleHighlightTexts[0] = "$FW_MENUTXT_OPTIONS_Compatible_None"
	CompatibleOptions[1] = "$FW_MENU_OPTIONS_Compatible_Full"
	CompatibleHighlightTexts[1] = "$FW_MENUTXT_OPTIONS_Compatible_Full"
	CompatibleOptions[2] = "$FW_MENU_OPTIONS_Compatible_ChangeBFState"
	CompatibleHighlightTexts[2] = "$FW_MENUTXT_OPTIONS_Compatible_ChangeBFState"
	CompatibleOptions[3] = "$FW_MENU_OPTIONS_Compatible_ForbideBFPregnancy"
	CompatibleHighlightTexts[3] = "$FW_MENUTXT_OPTIONS_Compatible_ForbideBFPregnancy"
	CompatibleOptions[4] = "$FW_MENU_OPTIONS_Compatible_ForbideEachotherPregnancy"
	CompatibleHighlightTexts[4] = "$FW_MENUTXT_OPTIONS_Compatible_ForbideEachotherPregnancy"
	CompatibleOptions[5] = "$FW_MENU_OPTIONS_Compatible_OverwriteOther"
	CompatibleHighlightTexts[5] = "$FW_MENUTXT_OPTIONS_Compatible_OverwriteOther"
endFunction

function SetVisualScalingKindOptions()

	if VisualScalingKindOptions.length != 6
		VisualScalingKindOptions = new String[6]
	endIf
	if VisualScalingKindHighlightTexts.length != 6
		VisualScalingKindHighlightTexts = new String[6]
	endIf
	VisualScalingKindOptions[0] = "$FW_MENU_OPTIONS_VisualScaleKind_Realistic"
	VisualScalingKindHighlightTexts[0] = "$FW_MENUTXT_OPTIONS_VisualScaleKind_Realistic"
	VisualScalingKindOptions[1] = "$FW_MENU_OPTIONS_VisualScaleKind_Linear"
	VisualScalingKindHighlightTexts[1] = "$FW_MENUTXT_OPTIONS_VisualScaleKind_Linear"
	VisualScalingKindOptions[2] = "$FW_MENU_OPTIONS_VisualScaleKind_Immediately"
	VisualScalingKindHighlightTexts[2] = "$FW_MENUTXT_OPTIONS_VisualScaleKind_Immediately"
	VisualScalingKindOptions[3] = "$FW_MENU_OPTIONS_VisualScaleKind_Breasts"
	VisualScalingKindHighlightTexts[3] = "$FW_MENUTXT_OPTIONS_VisualScaleKind_Breasts"
	VisualScalingKindOptions[4] = "$FW_MENU_OPTIONS_VisualScaleKind_Belly"
	VisualScalingKindHighlightTexts[4] = "$FW_MENUTXT_OPTIONS_VisualScaleKind_Belly"
	VisualScalingKindOptions[5] = "$FW_MENU_OPTIONS_VisualScaleKind_Late"
	VisualScalingKindHighlightTexts[5] = "$FW_MENUTXT_OPTIONS_VisualScaleKind_Late"
endFunction

Int function GetPageResetJobID()

	return PageResetJobID
endFunction

Bool function CurrentProfileExists()

	Int c = fwutility.GetFileCount("Profile", "json")
	if c > 126
		c = 126
	endIf
	while c > 0
		c -= 1
		String f = fwutility.GetFileName("Profile", "json", c)
		if self.IsProfile(f)
			return true
		endIf
	endWhile
	return false
endFunction

Int function getCompatiblity_Animation()

	if fwversion.GetAnimationVersion() == 0
		return 0
	elseIf fwversion.GetAnimationVersion() < fwversion.GetAnimationVersionRequired()
		return 2
	else
		return 1
	endIf
endFunction

String function MenstruationPainString()

	if System.Player.stateDamageScale == 0.000000
		return " - "
	elseIf System.Player.stateDamageScale < 0.300000
		return "$FW_MENU_OPTIONS_Painless"
	elseIf System.Player.stateDamageScale < 0.600000
		return "$FW_MENU_OPTIONS_Humane"
	elseIf System.Player.stateDamageScale < 1.00000
		return "$FW_MENU_OPTIONS_Easy"
	elseIf System.Player.stateDamageScale < 1.50000
		return "$FW_MENU_OPTIONS_Hurts"
	elseIf System.Player.stateDamageScale < 1.80000
		return "$FW_MENU_OPTIONS_Painful"
	elseIf System.Player.stateDamageScale < 2.20000
		return "$FW_MENU_OPTIONS_VeryPainful"
	else
		return "$FW_MENU_OPTIONS_Dolorous"
	endIf
endFunction

Int function getCompatiblity_Skyrim()

	String v = debug.GetVersionNumber()
	String f = stringutil.SubString(v, 0, 3)
	if f as Float >= 1.90000
		return 1
	endIf
	return 2
endFunction

function LoadWidgetProfile(String ProfileName)

	if ProfileName != ""
		WidgetProfile = ProfileName
	endIf
	if WidgetProfile == ""
		WidgetProfile = WidgetProfileDef
	endIf
	if System.StateWidget != none
		System.StateWidget.CFG_HAnchor = fwutility.getIniCString("HUD", WidgetProfile, "StateWidget", "HAnchor", System.StateWidget.CFG_HAnchor)
		System.StateWidget.CFG_VAnchor = fwutility.getIniCString("HUD", WidgetProfile, "StateWidget", "VAnchor", System.StateWidget.CFG_VAnchor)
		utility.WaitMenuMode(0.100000)
		System.StateWidget.CFG_PosX = fwutility.getIniCInt("HUD", WidgetProfile, "StateWidget", "PositionX", System.StateWidget.CFG_PosX)
		System.StateWidget.CFG_PosY = fwutility.getIniCInt("HUD", WidgetProfile, "StateWidget", "PositionY", System.StateWidget.CFG_PosY)
		System.StateWidget.CFG_Enabled = fwutility.getIniCBool("HUD", WidgetProfile, "StateWidget", "Enabled", System.StateWidget.CFG_Enabled)
		System.StateWidget.CFG_Alpha = fwutility.getIniCInt("HUD", WidgetProfile, "StateWidget", "Alpha", System.StateWidget.CFG_Alpha)
		System.StateWidget.CFG_FillDirection = fwutility.getIniCString("HUD", WidgetProfile, "StateWidget", "FillDirection", System.StateWidget.CFG_FillDirection)
		System.StateWidget.CFG_Color = fwutility.getIniCInt("HUD", WidgetProfile, "StateWidget", "Color", System.StateWidget.CFG_Color)
		System.StateWidget.CFG_DarkColor = fwutility.getIniCInt("HUD", WidgetProfile, "StateWidget", "DarkColor", System.StateWidget.CFG_DarkColor)
		System.StateWidget.CFG_FlashColor = fwutility.getIniCInt("HUD", WidgetProfile, "StateWidget", "FlashColor", System.StateWidget.CFG_FlashColor)
		System.StateWidget.CFG_IconPosition = fwutility.getIniCString("HUD", WidgetProfile, "StateWidget", "IconPosition", System.StateWidget.CFG_IconPosition)
	else
		debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  StateWidget configuration", 0)
	endIf
	if System.ContraceptionWidget != none
		System.ContraceptionWidget.CFG_HAnchor = fwutility.getIniCString("HUD", WidgetProfile, "ContraceptionWidget", "HAnchor", System.ContraceptionWidget.CFG_HAnchor)
		System.ContraceptionWidget.CFG_VAnchor = fwutility.getIniCString("HUD", WidgetProfile, "ContraceptionWidget", "VAnchor", System.ContraceptionWidget.CFG_VAnchor)
		utility.WaitMenuMode(0.100000)
		System.ContraceptionWidget.CFG_PosX = fwutility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "PositionX", System.ContraceptionWidget.CFG_PosX)
		System.ContraceptionWidget.CFG_PosY = fwutility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "PositionY", System.ContraceptionWidget.CFG_PosY)
		System.ContraceptionWidget.CFG_Enabled = fwutility.getIniCBool("HUD", WidgetProfile, "ContraceptionWidget", "Enabled", System.ContraceptionWidget.CFG_Enabled)
		System.ContraceptionWidget.CFG_Alpha = fwutility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "Alpha", System.ContraceptionWidget.CFG_Alpha)
		System.ContraceptionWidget.CFG_FillDirection = fwutility.getIniCString("HUD", WidgetProfile, "ContraceptionWidget", "FillDirection", System.ContraceptionWidget.CFG_FillDirection)
		System.ContraceptionWidget.CFG_Color = fwutility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "Color", System.ContraceptionWidget.CFG_Color)
		System.ContraceptionWidget.CFG_DarkColor = fwutility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "DarkColor", System.ContraceptionWidget.CFG_DarkColor)
		System.ContraceptionWidget.CFG_FlashColor = fwutility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "FlashColor", System.ContraceptionWidget.CFG_FlashColor)
		System.ContraceptionWidget.CFG_IconPosition = fwutility.getIniCString("HUD", WidgetProfile, "ContraceptionWidget", "IconPosition", System.ContraceptionWidget.CFG_IconPosition)
	else
		debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  ContraceptionWidget configuration", 0)
	endIf
	if System.BabyHealthWidget != none
		System.BabyHealthWidget.CFG_HAnchor = fwutility.getIniCString("HUD", WidgetProfile, "IconWidget", "HAnchor", System.BabyHealthWidget.CFG_HAnchor)
		System.BabyHealthWidget.CFG_VAnchor = fwutility.getIniCString("HUD", WidgetProfile, "IconWidget", "VAnchor", System.BabyHealthWidget.CFG_VAnchor)
		utility.WaitMenuMode(0.100000)
		System.BabyHealthWidget.CFG_PosX = fwutility.getIniCInt("HUD", WidgetProfile, "IconWidget", "PositionX", System.BabyHealthWidget.CFG_PosX)
		System.BabyHealthWidget.CFG_PosY = fwutility.getIniCInt("HUD", WidgetProfile, "IconWidget", "PositionY", System.BabyHealthWidget.CFG_PosY)
		System.BabyHealthWidget.CFG_Enabled = fwutility.getIniCBool("HUD", WidgetProfile, "IconWidget", "Enabled", System.BabyHealthWidget.CFG_Enabled)
		System.BabyHealthWidget.CFG_Alpha = fwutility.getIniCInt("HUD", WidgetProfile, "IconWidget", "Alpha", System.BabyHealthWidget.CFG_Alpha)
	else
		debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  BabyHealthWidget configuration", 0)
	endIf
	if System.PantyWidget != none
		System.PantyWidget.CFG_HAnchor = fwutility.getIniCString("HUD", WidgetProfile, "PantyWidget", "HAnchor", System.PantyWidget.CFG_HAnchor)
		System.PantyWidget.CFG_VAnchor = fwutility.getIniCString("HUD", WidgetProfile, "PantyWidget", "VAnchor", System.PantyWidget.CFG_VAnchor)
		utility.WaitMenuMode(0.100000)
		System.PantyWidget.CFG_PosX = fwutility.getIniCInt("HUD", WidgetProfile, "PantyWidget", "PositionX", System.PantyWidget.CFG_PosX)
		System.PantyWidget.CFG_PosY = fwutility.getIniCInt("HUD", WidgetProfile, "PantyWidget", "PositionY", System.PantyWidget.CFG_PosY)
		System.PantyWidget.CFG_Enabled = fwutility.getIniCBool("HUD", WidgetProfile, "PantyWidget", "Enabled", System.PantyWidget.CFG_Enabled)
		System.PantyWidget.CFG_Alpha = fwutility.getIniCInt("HUD", WidgetProfile, "PantyWidget", "Alpha", System.PantyWidget.CFG_Alpha)
	else
		debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  PantyWidget configuration", 0)
	endIf
	if System.Progress != none
		System.Progress.CFG_HAnchor = fwutility.getIniCString("HUD", WidgetProfile, "ProgressWidget", "HAnchor", System.Progress.CFG_HAnchor)
		System.Progress.CFG_VAnchor = fwutility.getIniCString("HUD", WidgetProfile, "ProgressWidget", "VAnchor", System.Progress.CFG_VAnchor)
		utility.WaitMenuMode(0.100000)
		System.Progress.CFG_PosX = fwutility.getIniCInt("HUD", WidgetProfile, "ProgressWidget", "PositionX", System.Progress.CFG_PosX)
		System.Progress.CFG_PosY = fwutility.getIniCInt("HUD", WidgetProfile, "ProgressWidget", "PositionY", System.Progress.CFG_PosY)
		System.Progress.CFG_Enabled = fwutility.getIniCBool("HUD", WidgetProfile, "ProgressWidget", "Enabled", System.Progress.CFG_Enabled)
		System.Progress.CFG_Alpha = fwutility.getIniCInt("HUD", WidgetProfile, "ProgressWidget", "Alpha", System.Progress.CFG_Alpha)
	else
		debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  Progress configuration", 0)
	endIf
	if System.CoupleWidget != none
		System.CoupleWidget.CFG_HAnchor = fwutility.getIniCString("HUD", WidgetProfile, "CoupleWidget", "HAnchor", System.CoupleWidget.CFG_HAnchor)
		System.CoupleWidget.CFG_VAnchor = fwutility.getIniCString("HUD", WidgetProfile, "CoupleWidget", "VAnchor", System.CoupleWidget.CFG_VAnchor)
		utility.WaitMenuMode(0.100000)
		System.CoupleWidget.CFG_PosX = fwutility.getIniCInt("HUD", WidgetProfile, "CoupleWidget", "PositionX", System.CoupleWidget.CFG_PosX)
		System.CoupleWidget.CFG_PosY = fwutility.getIniCInt("HUD", WidgetProfile, "CoupleWidget", "PositionY", System.CoupleWidget.CFG_PosY)
		System.CoupleWidget.CFG_Enabled = fwutility.getIniCBool("HUD", WidgetProfile, "CoupleWidget", "Enabled", System.CoupleWidget.CFG_Enabled)
		System.CoupleWidget.CFG_Alpha = fwutility.getIniCInt("HUD", WidgetProfile, "CoupleWidget", "Alpha", System.CoupleWidget.CFG_Alpha)
	else
		debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  CoupleWidget configuration", 0)
	endIf
endFunction

Int function DrawCME2(Int offset, String Header, String f, String phase, Bool bIsCurrentPhase, actor PlayerRef)

	String s1 = fwutility.getIniCString("AddOn", f, "AddOn", "Always_" + phase, "")
	String s2 = fwutility.getIniCString("AddOn", f, "AddOn", "Sometimes_" + phase, "")
	Int i = 0
	Bool bDrawedHeader = false
	if s1 != ""
		String[] saSpells1 = stringutil.Split(s1, ",")
		Int c1 = saSpells1.length
		while c1 > 0
			c1 -= 1
			spell S = fwutility.GetFormFromString(saSpells1[c1]) as spell
			if S != none
				if bDrawedHeader == false
					self.AddHeaderOption(Header, 0)
					offset += 2
					bDrawedHeader = true
				endIf
				self.SetCursorPosition(offset + i)
				if bIsCurrentPhase && PlayerRef.hasSpell(S as form)
					self.AddTextOption(S.GetName(), S.GetNthEffectMagicEffect(0).GetName(), self.OPTION_FLAG_NONE)
				else
					self.AddTextOption(S.GetName(), S.GetNthEffectMagicEffect(0).GetName(), self.OPTION_FLAG_DISABLED)
				endIf
				i += 1
			endIf
		endWhile
	endIf
	if s2 != ""
		String[] saSpells2 = stringutil.Split(s2, ",")
		Int c2 = saSpells2.length
		while c2 > 0
			c2 -= 1
			spell s = fwutility.GetFormFromString(saSpells2[c2]) as spell
			if s != none
				if bDrawedHeader == false
					self.AddHeaderOption(Header, 0)
					offset += 2
					bDrawedHeader = true
				endIf
				self.SetCursorPosition(offset + i)
				if bIsCurrentPhase && PlayerRef.hasSpell(s as form)
					self.AddTextOption(s.GetName(), s.GetNthEffectMagicEffect(0).GetName(), self.OPTION_FLAG_NONE)
				else
					self.AddTextOption(s.GetName(), s.GetNthEffectMagicEffect(0).GetName(), self.OPTION_FLAG_DISABLED)
				endIf
				i += 1
			endIf
		endWhile
	endIf
	offset += i
	offset += offset % 2
	return offset
endFunction

function ReloadWidgetProfile()

	self.LoadWidgetProfile(WidgetProfile)
endFunction

function OnOptionSelect(Int option)

	if self.CurrentPage == Pages[self.FW_MENU_PAGE_Info]
		if System.PlayerMale != none
			Int i = UI_SpermInside.find(option, 0)
			if i >= 0
				actor PlayerMaleActor = game.GetPlayer()
				actor[] females = System.Controller.getWomansWithSperm(PlayerMaleActor, true)
				System.Controller.showRankedInfoBox(females[i], 100)
			endIf
		endIf
	elseIf self.CurrentPage == Pages[self.FW_MENU_PAGE_Children]
		Int index = UI_Child.find(option, 0)
		Int c = storageutil.FormListCount(none, "FW.Babys")
		Int i = 0
		Int n = 0
		actor Player = game.GetPlayer()
		while i < c
			fwchildactor ca = storageutil.FormListGet(none, "FW.Babys", i) as fwchildactor
			if ca != none
				if ca as fwchildactorplayer != none || storageutil.GetFormValue(ca as form, "FW.Child.Mother", none) == Player as form || storageutil.GetFormValue(ca as form, "FW.Child.Father", none) == Player as form
					if n == index
						i = c
						System.Controller.showRankedInfoBox(ca as actor, 100)
						return 
					endIf
					n += 1
				endIf
			endIf
			i += 1
		endWhile
	elseIf self.CurrentPage == Pages[self.FW_MENU_PAGE_Cheat] && bTestPerkMode == true
		Int index = UI_TestPerk.find(option, 0)
		selectedPerk = index
		self.ForcePageReset()
	elseIf self.CurrentPage == Pages[self.FW_MENU_PAGE_AddOn]
		if AddOnActiveRaces == -1 && AddOnActiveCME == -1 && AddOnActiveMisc == -1
			Int index = UI_AddOnRaces.find(option, 0)
			Int i = 0
			if index >= 0
				AddOnActiveRaces = index
				self.ForcePageReset()
				return 
			endIf
			index = UI_AddOnCME.find(option, 0)
			if index >= 0
				AddOnActiveCME = index
				self.ForcePageReset()
				return 
			endIf
			index = UI_AddOnMisc.find(option, 0)
			if index >= 0
				AddOnActiveMisc = index
				self.ForcePageReset()
				return 
			endIf
		elseIf option == UI_Activator
			self.SetOptionFlags(option, self.OPTION_FLAG_DISABLED, false)
			if AddOnActiveRaces >= 0
				Bool bActive = !fwutility.getIniCBool("AddOn", UIS_AddOnRaces[AddOnActiveRaces], "AddOn", "Enabled", false)
				fwutility.setIniCBool("AddOn", UIS_AddOnRaces[AddOnActiveRaces], "AddOn", "Enabled", bActive)
				self.SetToggleOptionValue(option, bActive, false)
			elseIf AddOnActiveCME >= 0
				Bool bactive = !fwutility.getIniCBool("AddOn", UIS_AddOnCME[AddOnActiveCME], "AddOn", "Enabled", false)
				fwutility.setIniCBool("AddOn", UIS_AddOnCME[AddOnActiveCME], "AddOn", "Enabled", bactive)
				self.SetToggleOptionValue(option, bactive, false)
			elseIf AddOnActiveMisc >= 0
				Bool bactive = !fwutility.getIniCBool("AddOn", UIS_AddOnMisc[AddOnActiveMisc], "AddOn", "Enabled", false)
				fwutility.setIniCBool("AddOn", UIS_AddOnMisc[AddOnActiveMisc], "AddOn", "Enabled", bactive)
				self.SetToggleOptionValue(option, bactive, false)
				Int i = System.Manager.iMisc
				while i > 0
					i -= 1
					if System.Manager.sMisc[i] == UIS_AddOnMisc[AddOnActiveMisc]
						if bactive == true
							System.Manager.misc[i].OnAddOnActivate()
						else
							System.Manager.misc[i].OnAddOnDeactivate()
						endIf
						i = 0
					endIf
				endWhile
			endIf
			AddOnActiveRaces = -1
			AddOnActiveCME = -1
			AddOnActiveMisc = -1
			System.Manager.RefreshAddOn(127)
			self.SetOptionFlags(option, self.OPTION_FLAG_NONE, false)
			self.ForcePageReset()
		elseIf option == UI_AddOnBack
			AddOnActiveRaces = -1
			AddOnActiveCME = -1
			AddOnActiveMisc = -1
			self.ForcePageReset()
		endIf
	endIf
endFunction

function OnConfigInit()

	self.ResetConfigArrays()
endFunction

function ResetMenuArrays()

	self.SetBabySpawnOptions()
	self.SetDifficultyOptions()
	self.SetMessagesOptions()
	self.SetVisualScalingOptions()
	self.SetVisualScalingKindOptions()
	self.SetCompatibleOptions()
endFunction

function CheckForSexMods()

	bSexModInstalled = false
	bSexLab = false
	bAP = false
	bFlowerGirls = false
	bEstrus = false
	bOSA = false
	bBathingInSkyrim = false
	bASX = false
	bHAnimations = false
	Int c = game.GetModCount()
	while c > 0
		c -= 1
		String m = game.GetModName(c)
		if m == "SexLab.esm"
			bSexModInstalled = true
			bSexLab = true
		elseIf m == "OSA.esm"
			bSexModInstalled = true
			bOSA = true
		elseIf m == "AP Skyrim.esm"
			bSexModInstalled = true
			bAP = true
		elseIf m == "zzEstrus.esp"
			bEstrus = true
		elseIf m == "Bathing in Skyrim - Main.esp"
			bBathingInSkyrim = true
		elseIf m == "ASX_Spells.esp"
			bSexModInstalled = true
			bASX = true
		elseIf m == "HAnimations.esp"
			bSexModInstalled = true
			bHAnimations = true
		elseIf m == "FlowerGirls.esp"
			bSexModInstalled = true
			bFlowerGirls = true
		elseIf m == "Schlongs of Skyrim - Core.esm" || m == "Scent of Sex.esp" || m == "HentaiCreatures.esp" || m == "SLAnimLoader.esp" || m == "FemaleWerewolf.esp"
			bSexModInstalled = true
		endIf
	endWhile
endFunction

function SetBabySpawnOptions()

	if BabySpawnOptions.length != 4
		BabySpawnOptions = new String[4]
	endIf
	if BabySpawnHighlightTexts.length != 4
		BabySpawnHighlightTexts = new String[4]
	endIf
	BabySpawnOptions[0] = "$FW_MENU_OPTIONS_None"
	BabySpawnHighlightTexts[0] = "$FW_MENUTXT_OPTIONS_BabySpawnNone"
	BabySpawnOptions[1] = "$FW_MENU_OPTIONS_BabyActor"
	BabySpawnHighlightTexts[1] = "$FW_MENUTXT_OPTIONS_BabySpawnActor"
	BabySpawnOptions[2] = "$FW_MENU_OPTIONS_BabyItem"
	BabySpawnHighlightTexts[2] = "$FW_MENUTXT_OPTIONS_BabySpawnItem"
	BabySpawnOptions[3] = "$FW_MENU_OPTIONS_BabySoul"
	BabySpawnHighlightTexts[3] = "$FW_MENUTXT_OPTIONS_BabySpawnSoul"
endFunction

Int function getCompatiblity_PapyrusUtil()

	if SKSE.GetPluginVersion("papyrusutil plugin") == -1
		return 0
	endIf
	return 1
endFunction

Int function getCompatiblity_SKSE()

	if SKSE.GetVersionRelease() == 0
		return 0
	elseIf SKSE.GetScriptVersionRelease() < 48
		return 2
	else
		return 1
	endIf
endFunction

function OnOptionMenuAccept(Int a_option, Int a_index)

	if self.CurrentPage == Pages[self.FW_MENU_PAGE_System]
		Int index = UI_Compatible.find(a_option, 0)
		if index >= 0
			Compatible[index] = self.GetCompatibleIndexByRank(index, a_index)
			self.SetMenuOptionValue(a_option, CompatibleOptions[Compatible[index]], false)
		endIf
	endIf
endFunction

function OnPageReset(String page)

	self.RegisterForUpdate(10.0000)
	Int LoadingStateSystem = fwutility.SwitchInt(System == none, 255, System.LoadState)
	Int UpdateStateSystem = fwutility.SwitchInt(System == none, 255, System.UpdateState)
	Int LoadingStateChildSettings = fwutility.SwitchInt(System.ChildSettings == none, 255, System.ChildSettings.LoadingState)
	Int LoadingStateManager = fwutility.SwitchInt(System.Manager == none, 255, System.Manager.LoadingState)
	if (System.LoadState > 0 || UpdateStateSystem > 0 || LoadingStateChildSettings > 0 || LoadingStateManager > 0 || PageResetJobID > 0) && bForceMenu == false
		self.SetTitleText("Beeing Female v" + fwversion.GetVersionString())
		self.AddTextOption("Beeing Female is loading...", "", 0)
		self.AddTextOption("Loading Code:", fwutility.Hex(LoadingStateSystem, 2) + " " + fwutility.Hex(UpdateStateSystem, 2) + " " + fwutility.Hex(LoadingStateChildSettings, 2) + " " + fwutility.Hex(LoadingStateManager, 2) + " " + fwutility.Hex(PageResetJobID, 2), 0)
		self.AddEmptyOption()
		self.AddTextOptionST("TextForceMenu", "$FW_MENU_SETTINGS_ForceMenu", "", 0)
		return 
	endIf
	PageResetJobID = 1
	if System.ModEnabled.GetValueInt() == 0 && System.CloakingSpellEnabled.GetValueInt() == 0 && bForceMenu == false
		self.SetTitleText("Beeing Female v" + fwversion.GetVersionString())
		self.AddTextOption("Beeing Female is Disabled", "", 0)
		self.AddEmptyOption()
		self.AddTextOptionST("TextForceMenu", "$FW_MENU_SETTINGS_ForceMenu", "", 0)
		return 
	endIf
	PageResetJobID = 2
	if page != Pages[self.FW_MENU_PAGE_Cheat]
		selectedPerk = -1
		bTestPerkMode = false
	endIf
	PageResetJobID = 2
	if page != Pages[self.FW_MENU_PAGE_AddOn]
		AddOnActiveRaces = -1
		AddOnActiveCME = -1
		AddOnActiveMisc = -1
	endIf
	PageResetJobID = 3
	Bool bSSL = System.Manager.IsAddOnActive("BF_SSL")
	PageResetJobID = 4
	Bool bPlayerAllowed = System.IsValidateActor(game.GetPlayer(), true) > 0
	Bool bPlayerIsFemale = game.GetPlayer().GetLeveledActorBase().GetSex() == 1
	PageResetJobID = 5
	if !bSSL
		CreatureSperm = false
	endIf
	if page == ""
		if self.SexModInstalled == true
			PageResetJobID = 6
			self.LoadCustomContent("beeingfemale/beeingfemale.dds", 60.0000, 31.0000)
		else
			PageResetJobID = 7
			self.LoadCustomContent("beeingfemale/beeingfemale2.dds", 60.0000, 31.0000)
		endIf
		PageResetJobID = 8
		self.SetTitleText("Beeing Female v" + fwversion.GetVersionString())
		PageResetJobID = 9
		self.ResetMenuArrays()
	else
		PageResetJobID = 10
		self.UnloadCustomContent()
	endIf
	PageResetJobID = 11
	Int optionFlag = self.OPTION_FLAG_NONE
	Float currentTime = utility.GetCurrentGameTime()
	Int i = 0
	Int j = 0
	PageResetJobID = 12
	if page == Pages[self.FW_MENU_PAGE_Settings]
		PageResetJobID = 13
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$FW_MENU_SETTINGS_Settings", 0)
		self.AddMenuOptionST("MenuDifficulty", "$FW_MENU_SETTINGS_Difficulty", DifficultyOptions[Difficulty], 0)
		self.AddMenuOptionST("MenuMessages", "$FW_MENU_SETTINGS_Messages", MessagesOptions[Messages], 0)
		if System.Player != none
			self.AddToggleOptionST("TogglePlayerTimer", "$FW_MENU_SETTINGS_PlayerTimer", PlayerTimer, 0)
		endIf
		if bPlayerInfoSpell == true && System.BeeingFemaleInfoSpell != none
			self.AddToggleOptionST("ToggleShowStatsSpell", "$FW_MENU_SETTINGS_StatsSpell", game.GetPlayer().hasSpell(System.BeeingFemaleInfoSpell as form), 0)
		endIf
		self.AddToggleOptionST("ToggleAbortus", "$FW_MENU_PREGNANCY_Abortus", abortus, optionFlag)
		self.AddToggleOptionST("TogglePlayAnimations", "$FW_MENU_SETTINGS_PlayAnimations", PlayAnimations, self.OPTION_FLAG_NONE)
		self.AddToggleOptionST("ToggleImpregnateLoreFriendly", "$FW_MENU_Impregnate_LoreFriendly", ImpregnateLoreFriendly, self.OPTION_FLAG_NONE)
		if bSSL
			self.AddHeaderOption("$FW_MENU_SETTINGS_Creature", 0)
			self.AddToggleOptionST("ToggleCreatureSperm", "$FW_MENU_SETTINGS_CreatureSperm", CreatureSperm, self.OPTION_FLAG_NONE)
		endIf
		self.AddHeaderOption("$FW_MENU_SETTINGS_Key", 0)
		self.AddKeyMapOptionST("KeyMapShowState", "$FW_MENU_SETTINGS_ShowStatesKey", KeyStateWidget, 0)
		self.SetCursorPosition(1)
		self.AddHeaderOption("$FW_MENU_SETTINGS_Relevant", 0)
		if bPlayerIsFemale == true
			self.AddToggleOptionST("ToggleRelevantPlayer", "$FW_MENU_SETTINGS_RelevantPlayer", RelevantPlayer, fwutility.SwitchInt(bPlayerAllowed, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		else
			self.AddToggleOptionST("ToggleRelevantPlayerDisabled", "$FW_MENU_SETTINGS_RelevantPlayer", false, self.OPTION_FLAG_DISABLED)
		endIf
		self.AddToggleOptionST("ToggleRelevantFollower", "$FW_MENU_SETTINGS_RelevantFollower", RelevantFollower, 0)
		self.AddToggleOptionST("ToggleRelevantNPC", "$FW_MENU_SETTINGS_RelevantNPC", RelevantNPC, 0)
		self.AddHeaderOption("$FW_MENU_SETTINGS_NPCSettings", 0)
		self.AddToggleOptionST("ToggleNPCPregnancy", "$FW_MENU_SETTINGS_NPCPregnant", NPCCanBecomePregnant, 0)
		self.AddToggleOptionST("ToggleNPCPains", "$FW_MENU_SETTINGS_NPCPain", NPCFeelPain, 0)
		self.AddToggleOptionST("ToggleNPCBleeding", "$FW_MENU_SETTINGS_NPCBleed", NPCMenstruationBlood, 0)
		self.AddToggleOptionST("ToggleNPCMood", "$FW_MENU_SETTINGS_NPCMood", NPCMenstrualMood, 0)
		self.AddToggleOptionST("ToggleNPCNoTalk", "$FW_MENU_SETTINGS_NPCWayward", NPCMenstrualNoTalk, 0)
		self.AddToggleOptionST("ToggleNPCBabySpawn", "$FW_MENU_SETTINGS_NPCSpawnBabies", NPCBornChild, 0)
		self.AddToggleOptionST("ToggleNPCHaveItems", "$FW_MENU_SETTINGS_NPCHaveItems", NPCHaveItems, 0)
	elseIf page == Pages[self.FW_MENU_PAGE_Cycle]
		PageResetJobID = 14
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$FW_MENU_CYCLE_PhaseDurations", 0)
		self.AddSliderOptionST("SliderFollicularDuration", "$FW_MENU_CYCLE_FollicularPhase", FollicularDuration as Float, "$FW_MENU_BASIC_Days", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderOvulationDuration", "$FW_MENU_CYCLE_Ovulation", OvulationDuration as Float, "$FW_MENU_BASIC_Days", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderLutealDuration", "$FW_MENU_CYCLE_LutealPhase", LutealDuration as Float, "$FW_MENU_BASIC_Days", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderMenstruationDuration", "$FW_MENU_CYCLE_Menstruation", MenstrualDuration as Float, "$FW_MENU_BASIC_Days", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderIrregulationChance", "$FW_MENU_CYCLE_IrregulationChance", irregulationChance, "{1}%", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddEmptyOption()
		self.AddHeaderOption("$FW_MENU_CYCLE_TitleMenstruation", 0)
		self.AddSliderOptionST("SliderPMSChance", "$FW_MENU_CYCLE_PMSChance", PMSChance, "{1}%", 0)
		self.AddSliderOptionST("SliderPMSNoEffects", "$FW_MENU_CYCLE_PMSEffects", PMSEffects as Float, "$FW_MENU_BASIC_Effects", 0)
		self.AddToggleOptionST("ToggleMenstrualBlood", "$FW_MENU_CYCLE_MenstrualBlood", System.GlobalMenstruating.GetValueInt() == 1, 0)
		self.AddSliderOptionST("SliderMenstrualCrampsChance", "$FW_MENU_CYCLE_MenstrualCramps", MenstrualCramps, "{1}%", 0)
		self.SetCursorPosition(1)
		self.AddHeaderOption("$FW_MENU_CYCLE_Conception", 0)
		self.AddSliderOptionST("SliderConceptionChance", "$FW_MENU_CYCLE_ConceiveChance", ConceiveChance, "{1}%", fwutility.SwitchInt(bPlayerAllowed && RelevantPlayer as Bool && bPlayerIsFemale, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderConceptionChanceFollower", "$FW_MENU_CYCLE_ConceiveChanceFollower", ConceiveChanceFollower, "{1}%", fwutility.SwitchInt(RelevantFollower, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderConceptionChanceNPC", "$FW_MENU_CYCLE_ConceiveChanceNPC", ConceiveChanceNPC, "{1}%", fwutility.SwitchInt(RelevantNPC, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddEmptyOption()
		self.AddHeaderOption("$FW_MENU_CYCLE_WashingOutSperm", 0)
		self.AddSliderOptionST("SliderWashOutDelay", "$FW_MENU_CYCLE_MaximumSpermAge", WashOutHourDelay * 24.0000, "$FW_MENU_BASIC_DecHours", 0)
		self.AddSliderOptionST("SliderWashOutChance", "$FW_MENU_CYCLE_UnassistedSafeZone", ((WashOutChance * 100.000) as Int) as Float, "{1}%", 0)
		self.AddSliderOptionST("SliderWashOutWaterChance", "$FW_MENU_CYCLE_WaterAssistedSafeZone", ((WashOutWaterChance * 100.000) as Int) as Float, "{1}%", 0)
		self.AddSliderOptionST("SliderWashOutFluidChance", "$FW_MENU_CYCLE_AntiSpermEssenceSafeZone", ((WashOutFluidChance * 100.000) as Int) as Float, "{1}%", 0)
	elseIf page == Pages[self.FW_MENU_PAGE_Pregnancy]
		PageResetJobID = 15
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$FW_MENU_PREGNANCY_PregnancyDuration", 0)
		self.AddSliderOptionST("SliderTrimester1Duration", "$FW_MENU_PREGNANCY_1Trimester", Trimster1Duration as Float, "$FW_MENU_BASIC_Days", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderTrimester2Duration", "$FW_MENU_PREGNANCY_2Trimester", Trimster2Duration as Float, "$FW_MENU_BASIC_Days", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderTrimester3Duration", "$FW_MENU_PREGNANCY_3Trimester", Trimster3Duration as Float, "$FW_MENU_BASIC_Days", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddSliderOptionST("SliderRecoveryDuration", "$FW_MENU_PREGNANCY_RecoveryPhase", ReplanishDuration as Float, "$FW_MENU_BASIC_Days", fwutility.SwitchInt(bChangeDuration, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.AddEmptyOption()
		self.AddHeaderOption("$FW_MENU_PREGNANCY_Multiples", 0)
		self.AddSliderOptionST("SliderMultiplesThreshold", "$FW_MENU_PREGNANCY_MultiplesChance", MultipleThreshold as Float, "1:{0}", 0)
		self.AddSliderOptionST("SliderMultiplesNoMax", "$FW_MENU_PREGNANCY_MaxMultiples", MaxBabys as Float, "$FW_MENU_BASIC_Baby", 0)
		self.AddHeaderOption("$FW_MENU_PREGNANCY_General", 0)
		self.AddMenuOptionST("MenuBabySpawn", "$FW_MENU_PREGNANCY_SpawnType", BabySpawnOptions[BabySpawn], self.OPTION_FLAG_NONE)
		self.AddMenuOptionST("MenuBabySpawnNPC", "$FW_MENU_PREGNANCY_SpawnTypeNPC", BabySpawnOptions[BabySpawnNPC], fwutility.SwitchInt(RelevantFollower as Bool || RelevantNPC as Bool, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
		self.SetCursorPosition(1)
		self.AddHeaderOption("$FW_MENU_PREGNANCY_VisualScaling", 0)
		self.AddMenuOptionST("MenuVisualScaling", "$FW_MENU_PREGNANCY_VisualScalingType", VisualScalingOptions[VisualScaling], 0)
		self.AddMenuOptionST("MenuScalingKind", "$FW_MENU_PREGNANCY_VisualScalingKind", VisualScalingKindOptions[VisualScalingKind], 0)
		optionFlag = self.OPTION_FLAG_DISABLED
		if VisualScaling == 1 || VisualScaling == 2
			optionFlag = self.OPTION_FLAG_NONE
		endIf
		self.AddEmptyOption()
		self.AddHeaderOption("$FW_MENU_PREGNANCY_NodeScalingOptions", 0)
		self.AddToggleOptionST("ToggleBellyScale", "$FW_MENU_PREGNANCY_BellyScale", BellyScale, optionFlag)
		self.AddToggleOptionST("ToggleBreastScale", "$FW_MENU_PREGNANCY_BreastScale", BreastScale, optionFlag)
		optionFlag = self.OPTION_FLAG_DISABLED
		if (VisualScaling == 1 || VisualScaling == 2 || VisualScaling == 4) && BellyScale == true
			optionFlag = self.OPTION_FLAG_NONE
		endIf
		self.AddSliderOptionST("SliderBellyScaleMax", "$FW_MENU_PREGNANCY_BellyMaxScale", BellyMaxScale, "{1}", optionFlag)
		optionFlag = self.OPTION_FLAG_DISABLED
		if (VisualScaling == 1 || VisualScaling == 2 || VisualScaling == 4) && BreastScale == true
			optionFlag = self.OPTION_FLAG_NONE
		endIf
		self.AddSliderOptionST("SliderBreastScaleMax", "$FW_MENU_PREGNANCY_BreastsMaxScale", BreastsMaxScale, "{1}", optionFlag)
		optionFlag = self.OPTION_FLAG_DISABLED
		if VisualScaling == 3
			optionFlag = self.OPTION_FLAG_NONE
		endIf
		self.AddEmptyOption()
		self.AddHeaderOption("$FW_MENU_PREGNANCY_WeightScalingOptions", 0)
		self.AddSliderOptionST("SliderWeightGainMax", "$FW_MENU_PREGNANCY_MaxWeightGain", WeightGainMax as Float, "{0}", optionFlag)
	elseIf page == Pages[self.FW_MENU_PAGE_Impregnate]
		PageResetJobID = 16
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		optionFlag = self.OPTION_FLAG_DISABLED
		if ImpregnateActive as Bool && (RelevantNPC as Bool || RelevantFollower as Bool)
			optionFlag = self.OPTION_FLAG_NONE
		endIf
		self.AddHeaderOption("$FW_MENU_Impregnate_RandomNpc", 0)
		if RelevantNPC as Bool || RelevantFollower as Bool
			self.AddToggleOptionST("ToggleImpregnateActive", "$FW_MENU_Impregnate_Activate", ImpregnateActive, self.OPTION_FLAG_NONE)
		else
			self.AddTextOption("$FW_MENU_Impregnate_ActivateDis1", "", self.OPTION_FLAG_DISABLED)
			self.AddTextOption("$FW_MENU_Impregnate_ActivateDis2", "", self.OPTION_FLAG_DISABLED)
			self.AddToggleOptionST("ToggleImpregnateActive", "$FW_MENU_Impregnate_Activate", ImpregnateActive, self.OPTION_FLAG_DISABLED)
		endIf
		self.AddSliderOptionST("SliderImpregnateTime", "$FW_MENU_Impregnate_Time", ImpregnateTime as Float, "$FW_MENU_BASIC_Time", optionFlag)
		self.AddSliderOptionST("SliderImpregnateCount", "$FW_MENU_Impregnate_Count", ImpregnateCount as Float, "$FW_MENU_BASIC_NPCs", optionFlag)
		self.AddEmptyOption()
		self.AddHeaderOption("$FW_MENU_Impregnate_Who", 0)
		self.AddToggleOptionST("ToggleImpregnateHusband", "$FW_MENU_Impregnate_Husband", ImpregnateHusband, optionFlag)
		self.AddToggleOptionST("ToggleImpregnateAffairs", "$FW_MENU_Impregnate_Affairs", ImpregnateAffairs, optionFlag)
		self.AddToggleOptionST("ToggleImpregnatePartners", "$FW_MENU_Impregnate_Partners", ImpregnatePartners, optionFlag)
		self.AddToggleOptionST("ToggleImpregnateLastNPC", "$FW_MENU_Impregnate_LastNPC", ImpregnateLastNPC, optionFlag)
		self.AddToggleOptionST("ToggleImpregnatePlayerSpouse", "$FW_MENU_Impregnate_PlayerSpouse", ImpregnatePlayerSpouse, optionFlag)
		self.SetCursorPosition(1)
		self.AddHeaderOption("$FW_MENU_Impregnate_Player", 0)
		if RelevantPlayer as Bool && bPlayerIsFemale
			PageResetJobID = 17
			if ImpregnatePlayerSleep
				optionFlag = self.OPTION_FLAG_NONE
			else
				optionFlag = self.OPTION_FLAG_DISABLED
			endIf
			self.AddToggleOptionST("ToggleImpregnatePlayerSleep", "$FW_MENU_Impregnate_PlayerSleep", ImpregnatePlayerSleep, self.OPTION_FLAG_NONE)
			self.AddSliderOptionST("SliderImpregnatePlayerChance", "$FW_MENU_Impregnate_PlayerChance", ImpregnatePlayerChance as Float, "{0}%", optionFlag)
			self.AddToggleOptionST("ToggleImpregnatePlayerHusband", "$FW_MENU_Impregnate_PlayerHusband", ImpregnatePlayerHusband, optionFlag)
			self.AddToggleOptionST("ToggleImpregnatePlayerFollower", "$FW_MENU_Impregnate_PlayerFollower", ImpregnatePlayerFollower, optionFlag)
			self.AddToggleOptionST("ToggleImpregnateLastPlayerNPCs", "$FW_MENU_Impregnate_PlayerNPCs", ImpregnateLastPlayerNPCs, optionFlag)
			self.AddToggleOptionST("ToggleImpregnatePlayerAmbient", "$FW_MENU_Impregnate_PlayerAmbient", ImpregnatePlayerAmbient, optionFlag)
		else
			PageResetJobID = 18
			self.AddTextOption("$FW_INFOWINDOW_ForbiddenReason5", "", self.OPTION_FLAG_DISABLED)
			self.AddToggleOptionST("ToggleImpregnatePlayerSleep", "$FW_MENU_Impregnate_PlayerSleep", ImpregnatePlayerSleep, self.OPTION_FLAG_DISABLED)
			self.AddSliderOptionST("SliderImpregnatePlayerChance", "$FW_MENU_Impregnate_PlayerChance", ImpregnatePlayerChance as Float, "{0}%", self.OPTION_FLAG_DISABLED)
			self.AddToggleOptionST("ToggleImpregnatePlayerHusband", "$FW_MENU_Impregnate_PlayerHusband", ImpregnatePlayerHusband, self.OPTION_FLAG_DISABLED)
			self.AddToggleOptionST("ToggleImpregnatePlayerFollower", "$FW_MENU_Impregnate_PlayerFollower", ImpregnatePlayerFollower, self.OPTION_FLAG_DISABLED)
			self.AddToggleOptionST("ToggleImpregnateLastPlayerNPCs", "$FW_MENU_Impregnate_PlayerNPCs", ImpregnateLastPlayerNPCs, self.OPTION_FLAG_DISABLED)
			self.AddToggleOptionST("ToggleImpregnatePlayerAmbient", "$FW_MENU_Impregnate_PlayerAmbient", ImpregnatePlayerAmbient, self.OPTION_FLAG_DISABLED)
		endIf
	elseIf page == Pages[self.FW_MENU_PAGE_Male]
		PageResetJobID = 19
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$FW_MENU_MEN_Sperm", 0)
		self.AddSliderOptionST("SliderMaleVirility", "$FW_MENU_MEN_MaleVirility", ((MaleVirilityRecovery * 24.0000) as Int) as Float, "$FW_MENU_BASIC_Hours", 0)
		self.AddSliderOptionST("SliderSpermDuration", "$FW_MENU_MEN_SpermDuration", SpermDuration, "$FW_MENU_BASIC_DecDays", 0)
		if bSSL
			self.AddSliderOptionST("SliderNoVaginalCumChance", "$FW_MENU_MEN_NoVaginalCumChance", NoVaginalCumChance as Float, "{0}%", 0)
		endIf
		self.SetCursorPosition(1)
	elseIf page == Pages[self.FW_MENU_PAGE_Children]
		PageResetJobID = 20
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$FW_MENU_CHILDREN_Settings", 0)
		self.AddToggleOptionST("ToggleBabyMayCry", "$FW_MENU_CHILDREN_MayCry", ChildrenMayCry, self.OPTION_FLAG_NONE)
		self.SetCursorPosition(1)
		self.AddHeaderOption("$FW_MENU_CHILDREN_YourChildren", 0)
		Int c = storageutil.FormListCount(none, "FW.Babys")
		Int ind = 0
		Int n = 0
		actor Player = game.GetPlayer()
		PageResetJobID = 21
		while ind < c
			fwchildactor ca = storageutil.FormListGet(none, "FW.Babys", ind) as fwchildactor
			if ca != none
				if ca as fwchildactorplayer != none || storageutil.GetFormValue(ca as form, "FW.Child.Mother", none) == Player as form || storageutil.GetFormValue(ca as form, "FW.Child.Father", none) == Player as form
					UI_Child[n] = self.AddTextOption(ca.GetDisplayName(), "", 0)
					n += 1
				endIf
			endIf
			ind += 1
		endWhile
	elseIf page == Pages[self.FW_MENU_PAGE_AddOn]
		PageResetJobID = 22
		Int offset = 0
		if AddOnActiveRaces >= 0
			String f = UIS_AddOnRaces[AddOnActiveRaces]
			Bool bAddOnEnabled = fwutility.getIniCBool("AddOn", f, "AddOn", "Enabled", false)
			Bool bAddOnLocked = fwutility.getIniCBool("AddOn", f, "AddOn", "locked", false)
			String sAddOnName = fwutility.getIniCString("AddOn", f, "AddOn", "Name", "")
			String sAddOnType = fwutility.getIniCString("AddOn", f, "AddOn", "type", "")
			String author = fwutility.getIniCString("AddOn", f, "AddOn", "author", f)
			String required = fwutility.getIniCString("AddOn", f, "AddOn", "required", "")
			Bool bUse = true
			if required != ""
				String[] requiredA = stringutil.Split(required, ",")
				if fwutility.AreModsInstalled(requiredA) == false
					bUse = false
				endIf
			endIf
			self.SetCursorFillMode(self.LEFT_TO_RIGHT)
			self.SetCursorPosition(offset)
			self.AddHeaderOption("Race AddOn: " + sAddOnName, 0)
			UI_AddOnBack = self.AddTextOption("", "$FW_MENU_ADDON_Back", 0)
			UI_Activator = self.AddToggleOption("$FW_MENU_ADDON_Activate", (bAddOnEnabled || bAddOnLocked) && bUse, fwutility.SwitchInt(bAddOnLocked || !bUse, self.OPTION_FLAG_DISABLED, self.OPTION_FLAG_NONE))
			offset += 4
			self.SetCursorPosition(offset)
			if author != ""
				self.AddTextOption("$FW_MENU_ADDON_Author", author, self.OPTION_FLAG_DISABLED)
				offset += 4
				self.SetCursorPosition(offset)
			else
				offset += 2
				self.SetCursorPosition(offset)
			endIf
			self.AddHeaderOption("$FW_MENU_ADDON_RaceList", 0)
			offset += 2
			i = 0
			Int xRaces = fwutility.getIniInt("AddOn", f, "races", 0)
			Int racesListed = 0
			keyword keywordVampire = keyword.GetKeyword("Vampire")
			keyword keywordBeast = keyword.GetKeyword("IsBeastRace")
			keyword keywordCreature = keyword.GetKeyword("ActorTypeCreature")
			if xRaces == 0
				String ids = fwutility.getIniCString("AddOn", f, "AddOn", "id", "")
				if ids != ""
					String[] saRaces = stringutil.Split(ids, ",")
					Int c2 = saRaces.length
					while c2 > 0
						c2 -= 1
						race r = fwutility.GetFormFromString(saRaces[c2]) as race
						if r != none && racesListed < 80
							String strR = r.GetName()
							if r.HasKeyword(keywordVampire)
								strR += "[Vampire]"
							endIf
							if r.HasKeyword(keywordBeast)
								strR += "[Beast]"
							endIf
							if r.IsChildRace()
								strR += "<font color='#ff0000'>[Child]</font>"
							endIf
							if r.HasKeyword(keywordCreature)
								strR += "[Creature]"
							endIf
							self.SetCursorPosition(offset + i)
							self.AddTextOption(strR, "", 0)
							i += 1
							racesListed += 1
						endIf
					endWhile
				endIf
			else
				while xRaces > 0
					String ids = fwutility.getIniCString("AddOn", f, "race" + xRaces as String, "id", "")
					if ids != ""
						String[] saraces = stringutil.Split(ids, ",")
						Int c2 = saraces.length
						while c2 > 0
							c2 -= 1
							race r = fwutility.GetFormFromString(saraces[c2]) as race
							if r != none && racesListed < 80
								String strr = r.GetName() + " "
								if r.HasKeyword(keywordVampire)
									strr += "[Vampire]"
								endIf
								if r.HasKeyword(keywordBeast)
									strr += "[Beast]"
								endIf
								if r.IsChildRace()
									strr += "<font color='#ff0000'>[Child]</font>"
								endIf
								if r.HasKeyword(keywordCreature)
									strr += "[Creature]"
								endIf
								self.SetCursorPosition(offset + i)
								self.AddTextOption(strr, "", 0)
								i += 1
								racesListed += 1
							endIf
						endWhile
					endIf
					xRaces -= 1
				endWhile
			endIf
			if !bUse
				offset += i + 2
				offset += offset % 2
				self.SetCursorPosition(offset)
				String[] requireda = stringutil.Split(required, ",")
				Int k = requireda.length
				while k > 0
					k -= 1
					if fwutility.IsModInstalled(requireda[k]) == false
						self.AddTextOption("<font color='#ff0000'>" + requireda[k] + "</font>", "", 0)
					endIf
				endWhile
			endIf
		elseIf AddOnActiveCME >= 0
			String f = UIS_AddOnCME[AddOnActiveCME]
			Bool baddonenabled = fwutility.getIniCBool("AddOn", f, "AddOn", "Enabled", false)
			Bool baddonlocked = fwutility.getIniCBool("AddOn", f, "AddOn", "locked", false)
			String saddonname = fwutility.getIniCString("AddOn", f, "AddOn", "Name", "")
			String saddontype = fwutility.getIniCString("AddOn", f, "AddOn", "type", "")
			String author = fwutility.getIniCString("AddOn", f, "AddOn", "author", f)
			String required = fwutility.getIniCString("AddOn", f, "AddOn", "required", "")
			Bool buse = true
			if required != ""
				String[] requireda = stringutil.Split(required, ",")
				if fwutility.AreModsInstalled(requireda) == false
					buse = false
				endIf
			endIf
			actor ply = game.GetPlayer()
			self.SetCursorFillMode(self.LEFT_TO_RIGHT)
			self.SetCursorPosition(offset)
			self.AddHeaderOption("CME AddOn: " + saddonname, 0)
			UI_AddOnBack = self.AddTextOption("", "$FW_MENU_ADDON_Back", 0)
			UI_Activator = self.AddToggleOption("$FW_MENU_ADDON_Activate", (baddonenabled || baddonlocked) && buse, fwutility.SwitchInt(baddonlocked || !buse, self.OPTION_FLAG_DISABLED, self.OPTION_FLAG_NONE))
			offset += 4
			self.SetCursorPosition(offset)
			if author != ""
				self.AddTextOption("$FW_MENU_ADDON_Author", author, self.OPTION_FLAG_DISABLED)
				offset += 4
				self.SetCursorPosition(offset)
			else
				offset += 2
				self.SetCursorPosition(offset)
			endIf
			self.AddHeaderOption("$FW_MENU_ADDON_Effects", 0)
			offset += 2 + offset % 2
			i = 0
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "FollicularPhase", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Ovulation", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "LuthealPhase", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "PMS", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Menstruation", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Trimester1", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Trimester2", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Trimester3", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "LaborPains", System.Player.currentState == 0, ply)
			offset = self.DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Recovery", System.Player.currentState == 0, ply)
			if !buse
				offset += 4
				offset += offset % 2
				self.SetCursorPosition(offset)
				String[] requireda = stringutil.Split(required, ",")
				Int k = requireda.length
				while k > 0
					k -= 1
					if fwutility.IsModInstalled(requireda[k]) == false
						self.AddTextOption("<font color='#ff0000'>" + requireda[k] + "</font>", "", 0)
					endIf
				endWhile
			endIf
		elseIf AddOnActiveMisc >= 0
			String f = UIS_AddOnMisc[AddOnActiveMisc]
			Bool baddonenabled = fwutility.getIniCBool("AddOn", f, "AddOn", "Enabled", false)
			Bool baddonlocked = fwutility.getIniCBool("AddOn", f, "AddOn", "locked", false)
			String saddonname = fwutility.getIniCString("AddOn", f, "AddOn", "Name", "")
			String saddontype = fwutility.getIniCString("AddOn", f, "AddOn", "type", "")
			String author = fwutility.getIniCString("AddOn", f, "AddOn", "author", f)
			String required = fwutility.getIniCString("AddOn", f, "AddOn", "required", "")
			Bool buse = true
			if required != ""
				String[] requireda = stringutil.Split(required, ",")
				if fwutility.AreModsInstalled(requireda) == false
					buse = false
				endIf
			endIf
			self.SetCursorFillMode(self.LEFT_TO_RIGHT)
			self.SetCursorPosition(offset)
			self.AddHeaderOption("Misc AddOn: " + saddonname, 0)
			UI_AddOnBack = self.AddTextOption("", "$FW_MENU_ADDON_Back", 0)
			UI_Activator = self.AddToggleOption("$FW_MENU_ADDON_Activate", (baddonenabled || baddonlocked) && buse, fwutility.SwitchInt(baddonlocked || !buse, self.OPTION_FLAG_DISABLED, self.OPTION_FLAG_NONE))
			offset += 4
			self.SetCursorPosition(offset)
			if author != ""
				self.AddTextOption("$FW_MENU_ADDON_Author", author, self.OPTION_FLAG_DISABLED)
			endIf
			if !buse
				offset += 4
				offset += offset % 2
				self.SetCursorPosition(offset)
				String[] requireda = stringutil.Split(required, ",")
				Int k = requireda.length
				while k > 0
					k -= 1
					if fwutility.IsModInstalled(requireda[k]) == false
						self.AddTextOption("<font color='#ff0000'>" + requireda[k] + "</font>", "", 0)
					endIf
				endWhile
			endIf
		else
			Int iFCount = fwutility.GetFileCount("AddOn", "ini")
			Int iCMisc = 0
			Int iCRace = 0
			Int iCCME = 0
			UIS_AddOnCME = new String[128]
			UIS_AddOnMisc = new String[128]
			UIS_AddOnRaces = new String[128]
			Bool[] bEMisc = new Bool[128]
			Bool[] bERace = new Bool[128]
			Bool[] bECME = new Bool[128]
			String[] sNMisc = new String[128]
			String[] sNRace = new String[128]
			String[] sNCME = new String[128]
			String[] regGroup = new String[128]
			Int cGroup = 0
			while iFCount > 0
				iFCount -= 1
				String f = fwutility.GetFileName("AddOn", "ini", iFCount)
				Bool baddonenabled = fwutility.getIniCBool("AddOn", f, "AddOn", "Enabled", false)
				Bool baddonlocked = fwutility.getIniCBool("AddOn", f, "AddOn", "locked", false)
				Bool bAddOnHidden = fwutility.getIniCBool("AddOn", f, "AddOn", "hidden", false)
				String saddonname = fwutility.getIniCString("AddOn", f, "AddOn", "Name", f)
				String saddontype = fwutility.getIniCString("AddOn", f, "AddOn", "type", "")
				String required = fwutility.getIniCString("AddOn", f, "AddOn", "required", "")
				Bool buse = true
				if required != ""
					String[] requireda = stringutil.Split(required, ",")
					if fwutility.AreModsInstalled(requireda) == false
						buse = false
					endIf
				endIf
				if bAddOnHidden == false && saddonname != ""
					if saddontype == "race" || saddontype == "race" || saddontype == "race" || saddontype == "race"
						UIS_AddOnRaces[iCRace] = f
						bERace[iCRace] = (baddonenabled || baddonlocked) && buse
						sNRace[iCRace] = fwutility.SwitchString(saddonname == "", f, saddonname)
						iCRace += 1
					elseIf saddontype == "cme" || saddontype == "cme" || saddontype == "cme" || saddontype == "cme"
						UIS_AddOnCME[iCCME] = f
						bECME[iCCME] = (baddonenabled || baddonlocked) && buse
						sNCME[iCCME] = fwutility.SwitchString(saddonname == "", f, saddonname)
						iCCME += 1
					elseIf saddontype == "misc" || saddontype == "misc" || saddontype == "misc" || saddontype == "misc"
						UIS_AddOnMisc[iCMisc] = f
						bEMisc[iCMisc] = (baddonenabled || baddonlocked) && buse
						sNMisc[iCMisc] = fwutility.SwitchString(saddonname == "", f, saddonname)
						iCMisc += 1
					endIf
				endIf
			endWhile
			self.SetCursorFillMode(self.LEFT_TO_RIGHT)
			i = 0
			j = 0
			while i < iCRace
				self.SetCursorPosition(offset + 2 + i)
				UI_AddOnRaces[i] = self.AddToggleOption(sNRace[i], bERace[i], 0)
				i += 1
			endWhile
			self.SetCursorPosition(offset)
			self.AddHeaderOption("$FW_MENU_ADDON_Race", 0)
			if Messages <= 1
				self.SetCursorPosition(offset + 1)
				self.AddTextOption("", iCRace as String, 0)
			endIf
			offset += i + i % 2 + 4
			self.SetCursorPosition(offset + 2)
			i = 0
			while i < iCCME
				self.SetCursorPosition(offset + 2 + i)
				UI_AddOnCME[i] = self.AddToggleOption(sNCME[i], bECME[i], 0)
				i += 1
			endWhile
			self.SetCursorPosition(offset)
			self.AddHeaderOption("$FW_MENU_ADDON_CME", 0)
			if Messages <= 1
				self.SetCursorPosition(offset + 1)
				self.AddTextOption("", iCCME as String, 0)
			endIf
			offset += i + i % 2 + 4
			self.SetCursorPosition(offset + 2)
			i = 0
			while i < iCMisc
				self.SetCursorPosition(offset + 2 + i)
				UI_AddOnMisc[i] = self.AddToggleOption(sNMisc[i], bEMisc[i], 0)
				i += 1
			endWhile
			self.SetCursorPosition(offset)
			self.AddHeaderOption("$FW_MENU_ADDON_Misc", 0)
			if Messages <= 1
				self.SetCursorPosition(offset + 1)
				self.AddTextOption("", iCMisc as String, 0)
			endIf
		endIf
	elseIf page == Pages[self.FW_MENU_PAGE_Info]
		PageResetJobID = 31
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$FW_MENU_INFO_PlayerCharacterInformation", 0)
		if System.PlayerMale != none
			actor PlayerMaleActor = game.GetPlayer()
			actor[] females = System.Controller.getWomansWithSperm(PlayerMaleActor, true)
			Int c = 0
			PageResetJobID = 32
			while c < females.length
				if females[c] != none
					if females[c].GetLeveledActorBase() != none
						UI_SpermInside[c] = self.AddTextOption(females[c].GetLeveledActorBase().GetName(), "", 0)
					endIf
				endIf
				c += 1
			endWhile
		elseIf System.Player != none
			PageResetJobID = 33
			if System.Player.currentState >= 4 && System.Player.currentState < 20
				self.AddTextOption("$FW_MENU_INFO_Pregnant", "$FW_MENU_BASIC_Yes", 0)
				self.AddTextOption("$FW_MENU_INFO_CurrentState", fwutility.getStateNameTranslated(System.Player.currentState), 0)
				self.AddTextOption("$FW_MENU_INFO_NumberOfChildren", self.getNumberOfChilds(), 0)
				Float UnbornHealth = storageutil.GetFloatValue(game.GetPlayer() as form, "FW.UnbornHealth", 100.000)
				Int abortusPhase = storageutil.GetIntValue(game.GetPlayer() as form, "FW.Abortus", 0)
				if abortusPhase == 0
					self.AddTextOption("$FW_MENU_INFO_UnbornsHealth", UnbornHealth as String + "%", 0)
				else
					self.AddTextOption("$FW_MENU_INFO_Abortus", "$FW_MENU_OPTIONS_Abortus" + abortusPhase as String, 0)
				endIf
			elseIf System.Player.currentState >= 20 && System.Player.currentState < 40
				self.AddTextOption("$FW_MENU_INFO_Pregnant", "$FW_MENU_BASIC_Yes", 0)
				self.AddTextOption("$FW_MENU_INFO_CurrentState", fwutility.getStateNameTranslated(System.Player.currentState), 0)
			else
				self.AddTextOption("$FW_MENU_INFO_Pregnant", "$FW_MENU_BASIC_No", 0)
				self.AddTextOption("$FW_MENU_INFO_CurrentState", fwutility.getStateNameTranslated(System.Player.currentState), 0)
				self.AddTextOption("$FW_MENU_INFO_PregnancyChance", math.Floor(System.Controller.getRelativePregnancyChance(game.GetPlayer(), none)) as String + "%", 0)
			endIf
			if System.Controller.IsPaused(game.GetPlayer()) == true
				self.AddTextOption("$FW_MENU_INFO_TimeRemaining", "$FW_MENU_OPTIONS_Paused", 0)
			else
				self.AddTextOption("$FW_MENU_INFO_TimeRemaining", self.getRemainingTime(true), 0)
			endIf
			self.AddEmptyOption()
			self.AddTextOption("$FW_MENU_INFO_ContraceptionHormones", self.getContraception() as String + "%", 0)
			self.AddTextOption("$FW_MENU_INFO_ContraceptionTime", self.getContraceptionTime(), 0)
			self.AddEmptyOption()
			self.AddHeaderOption("$FW_MENU_INFO_StateInformation", 0)
			if System.Player.currentState >= 0 && System.Player.currentState < 4
				if System.Player.currentState == 1
					self.AddTextOption("$FW_MENU_INFO_EggState", self.GetEggState(), 0)
					self.AddTextOption("$FW_MENU_INFO_OvulationPain", self.OvulationPainString(), 0)
				elseIf System.Player.currentState == 3
					self.AddTextOption("$FW_MENU_INFO_MenstrualPain", self.MenstruationPainString(), 0)
				endIf
			elseIf System.Player.currentState >= 4 && System.Player.currentState < 20
				if game.GetPlayer().hasSpell(System.Effect_Vorwehen as form) == true
					self.AddTextOption("$FW_MENU_INFO_Vorwehen", "", 0)
				endIf
				if game.GetPlayer().hasSpell(System.Effect_Eroeffnungswehen as form) == true
					self.AddTextOption("$FW_MENU_INFO_Eroeffnungswehen", "", 0)
				endIf
				if game.GetPlayer().hasSpell(System.Effect_Presswehen as form) == true
					self.AddTextOption("$FW_MENU_INFO_Presswehen", "", 0)
				endIf
				if game.GetPlayer().hasSpell(System.Effect_Nachwehen as form) == true
					self.AddTextOption("$FW_MENU_INFO_Nachwehen", "", 0)
				endIf
				if System.Player.currentState == 7
					
				endIf
			endIf
			self.SetCursorPosition(1)
			self.AddHeaderOption("$FW_MENU_INFO_TotalSperm", 0)
			actor xPlayer = game.GetPlayer()
			i = 0
			j = 1
			Int c = storageutil.FormListCount(xPlayer as form, "FW.SpermName")
			PageResetJobID = 34
			while i < c
				if storageutil.FloatListGet(xPlayer as form, "FW.SpermAmount", i) > 0.000000 && storageutil.FormListGet(xPlayer as form, "FW.SpermName", i) as actor != none && currentTime - storageutil.FloatListGet(xPlayer as form, "FW.SpermTime", i) <= System.cfg.SpermDuration
					UI_SpermInside[j - 1] = self.AddTextOption("(" + j as String + ") " + (storageutil.FormListGet(xPlayer as form, "FW.SpermName", i) as actor).GetLeveledActorBase().GetName(), self.GetTimeString(currentTime - storageutil.FloatListGet(xPlayer as form, "FW.SpermTime", i), true, "-", true), 0)
					j += 1
				endIf
				i += 1
			endWhile
		else
			PageResetJobID = 35
			System.ReNewSpells()
			self.AddTextOption("$FW_MENU_INFO_PlayerCharacterInformation", "$FW_MENU_OPTIONS_None", 0)
		endIf
	elseIf page == Pages[self.FW_MENU_PAGE_Cheat]
		PageResetJobID = 36
		actor targetNpc = game.GetCurrentCrosshairRef() as actor
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		if bTestPerkMode == false
			PageResetJobID = 37
			self.SetCursorPosition(0)
			self.AddHeaderOption("$FW_MENU_CHEAT_Reset", 0)
			self.AddTextOptionST("TextResetPC", "$FW_MENU_CHEAT_ResetPC", "$FW_MENU_OPTIONS_Reset", 0)
			if targetNpc != none
				if targetNpc.hasSpell(System.BeeingFemaleSpell as form)
					self.AddHeaderOption(targetNpc.GetDisplayName(), 0)
					self.AddTextOptionST("TextResetNPC", "$FW_MENU_CHEAT_ResetNPC", "$FW_MENU_OPTIONS_Reset", 0)
					self.AddTextOptionST("TextUpdateNPC", "$FW_MENU_CHEAT_Update", "$FW_MENU_OPTIONS_Refresh", 0)
				else
					self.AddTextOptionST("TextResetPCBreastBellyScale", "$FW_MENU_CHEAT_ResetPCBreastBellyScale", "$FW_MENU_OPTIONS_Reset", 0)
					self.AddEmptyOption()
				endIf
			else
				self.AddTextOptionST("TextResetPCBreastBellyScale", "$FW_MENU_CHEAT_ResetPCBreastBellyScale", "$FW_MENU_OPTIONS_Reset", 0)
				self.AddEmptyOption()
			endIf
			self.AddHeaderOption("$FW_MENU_CHEAT_Update", 0)
			self.AddToggleOptionST("ToggleUpdateInterval", "$FW_MENU_CHEAT_UpdateInterval", UpdateIntervalEnabled, 0)
			if UpdateIntervalEnabled
				self.AddSliderOptionST("SliderUpdateInterval", "$FW_MENU_CHEAT_Interval", UpdateInterval, "$FW_MENU_BASIC_Seconds", 0)
			else
				self.AddSliderOptionST("SliderUpdateInterval", "$FW_MENU_CHEAT_Interval", UpdateInterval, "$FW_MENU_BASIC_Seconds", self.OPTION_FLAG_DISABLED)
			endIf
			self.AddTextOptionST("TextUpdateAll", "$FW_MENU_CHEAT_UpdateAll", "$FW_MENU_OPTIONS_Refresh", 0)
			self.AddTextOptionST("TextResetNPCs", "$FW_MENU_CHEAT_ResetNPC", "$FW_MENU_OPTIONS_Reset", 0)
			self.AddTextOptionST("TextNoSavedNPCs", "$FW_MENU_CHEAT_SavedNPC", storageutil.FormListCount(none, "FW.SavedNPCs") as String, 0)
			if Messages <= System.MSG_Debug
				self.AddTextOptionST("TextCheckChildPerks", "$FW_MENU_CHEAT_TestPerks", "", 0)
				self.AddTextOptionST("TextSpawnChildren", "$FW_MENU_CHEAT_SpawnChildren", "", 0)
			endIf
			self.AddToggleOptionST("ToggleCoupleWidget", "$FW_MENU_CHEAT_CoupleMaker", System.CoupleWidget.Enabled, 0)
			self.SetCursorPosition(1)
			if System.PlayerMale != none
				self.AddHeaderOption("$FW_MENU_CHEAT_Cheats", 0)
				self.AddTextOption("For now, there are no", "", 0)
				self.AddTextOption("cheats for male characters.", "", 0)
			elseIf System.Player != none
				self.AddHeaderOption("$FW_MENU_CHEAT_Cheats", 0)
				if Messages > System.MSG_Debug
					self.AddTextOption("$FW_MENU_CHEAT_Disabled", "", 0)
					self.AddEmptyOption()
					self.AddTextOption("$FW_MENU_CHEAT_DisabledMsg1", "", 0)
					self.AddTextOption("$FW_MENU_CHEAT_DisabledMsg2", "", 0)
					self.AddTextOption("$FW_MENU_CHEAT_DisabledMsg3", "", 0)
					self.AddTextOption("$FW_MENU_CHEAT_DisabledMsg4", "", 0)
				else
					optionFlag = fwutility.SwitchInt(System.Player.currentState >= 4 && System.Player.currentState < 20, self.OPTION_FLAG_DISABLED, self.OPTION_FLAG_NONE)
					self.AddToggleOptionST("TogglePlayerFertility", "$FW_MENU_CHEAT_CanBecomePregnant", System.Controller.canBecomePregnant(game.GetPlayer()), optionFlag)
					self.AddToggleOptionST("TogglePlayerPMS", "$FW_MENU_CHEAT_CanBecomePMS", System.Controller.canBecomePMS(game.GetPlayer()), optionFlag)
					self.AddEmptyOption()
					optionFlag = self.OPTION_FLAG_NONE
					self.AddTextOptionST("TextChangeState", "$FW_MENU_CHEAT_ChangeState", fwutility.getStateNameTranslated(System.Player.nextState), 0)
					optionFlag = self.OPTION_FLAG_NONE
					self.AddTextOptionST("TextJobToDo", "$FW_MENU_CHEAT_JobToDo", self.GetJobTitle(none), 0)
					fwchildactor targetChild = game.GetCurrentCrosshairRef() as fwchildactor
					if targetNpc != none
						self.AddHeaderOption(targetNpc.GetDisplayName(), 0)
						if targetChild != none
							self.AddTextOptionST("TextChildAddLevel", "$FW_MENU_CHEAT_ChildAddLevel", targetChild.GetLevel() as String, fwutility.SwitchInt(targetChild.GetLevel() < fwchildsettings.ChildMaxLevel(), self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
						elseIf targetNpc.GetLeveledActorBase().GetSex() == 1
							self.AddTextOptionST("TextNpcChangeState", "$FW_MENU_CHEAT_ChangeState", fwutility.getStateNameTranslated(System.Controller.GetNextState(targetNpc)), 0)
							self.AddTextOptionST("TextNpcJobToDo", "$FW_MENU_CHEAT_JobToDo", self.GetJobTitle(targetNpc), fwutility.SwitchInt(NPCCanBecomePregnant, self.OPTION_FLAG_NONE, self.OPTION_FLAG_DISABLED))
						endIf
					endIf
					actor p = game.GetPlayer()
					self.AddHeaderOption("StorageUtil - " + p.GetLeveledActorBase().GetName(), 0)
					self.AddTextOption("FW.LastUpdate", storageutil.GetFloatValue(p as form, "FW.LastUpdate", 0.000000) as String, 0)
					self.AddTextOption("FW.StateEnterTime", storageutil.GetFloatValue(p as form, "FW.StateEnterTime", 0.000000) as String, 0)
					self.AddTextOption("FW.CurrentState", storageutil.GetIntValue(p as form, "FW.CurrentState", 0) as String, 0)
					self.AddTextOption("FW.Abortus", storageutil.GetIntValue(p as form, "FW.Abortus", 0) as String, 0)
					self.AddTextOption("FW.AbortusTime", storageutil.GetFloatValue(p as form, "FW.AbortusTime", 0.000000) as String, 0)
					self.AddTextOption("FW.UnbornHealth", storageutil.GetFloatValue(p as form, "FW.UnbornHealth", 0.000000) as String, 0)
					self.AddTextOption("FW.NumChilds", storageutil.GetIntValue(p as form, "FW.NumChilds", 0) as String, 0)
					Int iFW = 0
					Int cFW = storageutil.GetIntValue(p as form, "FW.NumChilds", 0)
					PageResetJobID = 38
					while iFW < cFW
						actor a = storageutil.FormListGet(p as form, "FW.ChildFather", iFW) as actor
						if a != none
							self.AddTextOption("FW.ChildFather[" + iFW as String + "]", a.GetLeveledActorBase().GetName(), 0)
						endIf
						iFW += 1
					endWhile
					self.AddTextOption("FW.Flags", storageutil.GetIntValue(p as form, "FW.Flags", 0) as String, 0)
					self.AddTextOption("FW.PainLevel", storageutil.GetFloatValue(p as form, "FW.PainLevel", 0.000000) as String, 0)
					self.AddTextOption("FW.Contraception", storageutil.GetFloatValue(p as form, "FW.Contraception", 0.000000) as String, 0)
					self.AddTextOption("FW.ContraceptionTime", storageutil.GetFloatValue(p as form, "FW.ContraceptionTime", 0.000000) as String, 0)
					self.AddTextOption("FW.NumBirth", storageutil.GetIntValue(p as form, "FW.NumBirth", 0) as String, 0)
					self.AddTextOption("FW.NumBabys", storageutil.GetIntValue(p as form, "FW.NumBabys", 0) as String, 0)
					self.AddTextOption("FW.PauseTime", storageutil.GetFloatValue(p as form, "FW.PauseTime", 0.000000) as String, 0)
					self.AddTextOption("FW.LastBornChildTime", storageutil.GetFloatValue(p as form, "FW.LastBornChildTime", 0.000000) as String, 0)
					iFW = 0
					cFW = storageutil.FloatListCount(p as form, "FW.SpermTime")
					PageResetJobID = 39
					while iFW < cFW
						self.AddTextOption("FW.SpermName[" + iFW as String + "]", (storageutil.FormListGet(p as form, "FW.SpermName", iFW) as actor).GetLeveledActorBase().GetName(), 0)
						self.AddTextOption("FW.SpermTime[" + iFW as String + "]", storageutil.FloatListGet(p as form, "FW.SpermTime", iFW) as String, 0)
						self.AddTextOption("FW.SpermAmount[" + iFW as String + "]", storageutil.FloatListGet(p as form, "FW.SpermAmount", iFW) as String, 0)
						iFW += 1
					endWhile
				endIf
			endIf
		else
			PageResetJobID = 40
			if selectedPerk == -1
				self.SetCursorFillMode(self.LEFT_TO_RIGHT)
				self.AddHeaderOption("$FW_MENU_CHEAT_TestPerk", 0)
				self.AddTextOptionST("TextLeaveAddOnTest", "", "$FW_MENU_ADDON_Back", 0)
				Int flg = self.OPTION_FLAG_DISABLED
				if bTestPerkRan == true
					flg = self.OPTION_FLAG_NONE
				endIf
				Int k = 0
				PageResetJobID = 41
				while k < 120
					if System.ChildSettings.ChildPerkFile[k] != ""
						String x1 = System.ChildSettings.ChildPerkFile[k]
						String x2 = perkTestResult[k]
						UI_TestPerk[k] = self.AddTextOption(x1, x2, flg)
					endIf
					k += 1
				endWhile
				if bTestPerkRan == false
					bTestPerkRan = true
					lastPerkTested = -1
					self.RegisterForModEvent("FWSystemConfig_Async_Call", "CheckNextPerk_Async")
					self.SendModEvent("FWSystemConfig_Async_Call", "", 0.000000)
				endIf
			else
				self.SetCursorFillMode(self.TOP_TO_BOTTOM)
				self.SetCursorPosition(0)
				self.AddHeaderOption("$FW_MENU_CHEAT_TestPerk", 0)
				self.AddHeaderOption(System.ChildSettings.ChildPerkFile[selectedPerk], 0)
				Int items = 0
				String res = perkTestResultText[selectedPerk]
				PageResetJobID = 42
				if res != ""
					String[] tres = stringutil.Split(res, ";")
					if tres.length > 1
						Int k = 1
						self.AddTextOption("[General]", "", self.OPTION_FLAG_DISABLED)
						PageResetJobID = 43
						while k < tres.length
							if items < 120
								self.AddTextOption(tres[k], "", self.OPTION_FLAG_DISABLED)
								items += 1
								k += 1
							else
								self.AddTextOption("More errors were logged", "", 0)
								k = 999
							endIf
						endWhile
					endIf
				endIf
				PageResetJobID = 44
				self.SetCursorPosition(1)
				self.AddTextOptionST("TextLeaveAddOnTest", "", "$FW_MENU_ADDON_Back", 0)
				self.AddEmptyOption()
			endIf
		endIf
	elseIf page == Pages[self.FW_MENU_PAGE_System]
		PageResetJobID = 45
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		Int mc = game.GetModCount()
		String BFVersion = fwversion.GetVersionString()
		PageResetJobID = 46
		while mc > 0
			mc -= 1
			String modFName = game.GetModName(mc)
			if modFName == "BeeingFemale.esp"
				BFVersion += " DEV"
				mc = 0
			endIf
		endWhile
		self.AddHeaderOption("$FW_MENU_SYSTEM_Version", 0)
		self.AddTextOption("$FW_MENU_SYSTEM_VersionBF", fwversion.GetVersionString(), 0)
		if CurrentVersion != fwversion.GetMCMVersion()
			self.AddTextOption("$FW_MENU_SYSTEM_VersionMCM", CurrentVersion as String + "/" + fwversion.GetMCMVersion() as String, 0)
		else
			self.AddTextOption("$FW_MENU_SYSTEM_VersionMCM", CurrentVersion as String, 0)
		endIf
		if game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") != fwversion.GetAnimationVersionRequired()
			self.AddTextOption("$FW_MENU_SETTINGS_PlayAnimations", game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") as String + "/" + fwversion.GetAnimationVersionRequired() as String, 0)
		else
			self.AddTextOption("$FW_MENU_SETTINGS_PlayAnimations", game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") as String, 0)
		endIf
		self.AddHeaderOption("$FW_MENU_SYSTEM", 0)
		self.AddTextOptionST("TextRefreshAddOn", "$FW_MENU_CHEAT_RefreshAddOn", "$FW_MENU_OPTIONS_Refresh", 0)
		self.AddTextOptionST("TextResetSystem", "$FW_MENU_SYSTEM_Reset", "$FW_MENU_OPTIONS_Execute", 0)
		self.AddTextOptionST("TextUninstall", "$FW_MENU_SYSTEM_Uninstall", "$FW_MENU_OPTIONS_Execute", 0)
		self.AddHeaderOption("$FW_MENU_SYSTEM_Profile", 0)
		if fwutility.GetFileCount("Profile", "json") > 0
			self.AddMenuOptionST("MenuProfileLoad", "$FW_MENU_SYSTEM_ProfileLoad", self.getCurrentProfile(), self.OPTION_FLAG_NONE)
		else
			self.AddMenuOptionST("MenuProfileLoad", "$FW_MENU_SYSTEM_ProfileLoad", "", self.OPTION_FLAG_DISABLED)
		endIf
		self.AddTextOptionST("TextProfileSave", "$FW_MENU_SYSTEM_ProfileSave", "", 0)
		if fwutility.GetFileCount("HUD", "ini") > 1
			self.AddMenuOptionST("MenuWidgetProfile", "$FW_MENU_SYSTEM_WidgetProfile", WidgetProfile, self.OPTION_FLAG_NONE)
		else
			self.AddMenuOptionST("MenuWidgetProfile", "$FW_MENU_SYSTEM_WidgetProfile", WidgetProfileDef, self.OPTION_FLAG_DISABLED)
		endIf
		PageResetJobID = 47
		self.SetCursorPosition(1)
		String[] cTxt = new String[4]
		cTxt[0] = "$FW_MENU_OPTIONS_Compatible_None"
		cTxt[1] = "$FW_MENU_OPTIONS_Compatible_Full"
		cTxt[2] = "$FW_MENU_OPTIONS_Overdue"
		cTxt[3] = "$FW_MENU_OPTIONS_Compatible_NOT_INSTALLED"
		self.AddHeaderOption("$FW_MENU_SYSTEM_Compatible", 0)
		self.AddTextOption("Skyrim " + debug.GetVersionNumber(), cTxt[self.getCompatiblity_Skyrim()], self.OPTION_FLAG_DISABLED)
		self.AddTextOption("SKSE", cTxt[self.getCompatiblity_SKSE()], self.OPTION_FLAG_DISABLED)
		self.AddTextOption("Papyrus Util", cTxt[self.getCompatiblity_PapyrusUtil()], self.OPTION_FLAG_DISABLED)
		self.AddTextOption("Fore new Idle Skyrim", cTxt[self.getCompatiblity_FNIS()], self.OPTION_FLAG_DISABLED)
		self.AddTextOption("BeeingFemale Animations", cTxt[self.getCompatiblity_Animation()], self.OPTION_FLAG_DISABLED)
		if bBathingInSkyrim
			Bool bBiS = System.Manager.IsAddOnActive("BF_BathingInSkyrim")
			if bBiS == true
				self.AddTextOption("Bathing in Skyrim", cTxt[1], self.OPTION_FLAG_DISABLED)
			else
				self.AddTextOption("Bathing in Skyrim", cTxt[0], self.OPTION_FLAG_DISABLED)
			endIf
		else
			self.AddTextOption("Bathing in Skyrim", cTxt[3], self.OPTION_FLAG_DISABLED)
		endIf
		if bSexLab
			PageResetJobID = 48
			if bSSL
				PageResetJobID = 49
				self.AddTextOption("SexLab Framework", cTxt[1], self.OPTION_FLAG_DISABLED)
			else
				PageResetJobID = 50
				self.AddTextOption("SexLab Framework", cTxt[0], self.OPTION_FLAG_DISABLED)
			endIf
		endIf
		PageResetJobID = 51
		if bAP
			if fwutility.ScriptHasString("aasexorgasimscaipt", "BeeingFemale")
				self.AddTextOption("Animated Prostitution", cTxt[1], self.OPTION_FLAG_DISABLED)
			else
				self.AddTextOption("Animated Prostitution", cTxt[0], self.OPTION_FLAG_DISABLED)
			endIf
		endIf
		if bFlowerGirls
			if fwutility.ScriptHasString("dxPerformSexScript", "BeeingFemale") || fwutility.ScriptHasString("dxFlowerGirlsScript", "BeeingFemale") || fwutility.ScriptHasString("dxAnimationSceneScript", "BeeingFemale") || fwutility.ScriptHasString("dxAnimationControllerScript", "BeeingFemale") || fwutility.ScriptHasString("dxAnimatePairEffect", "BeeingFemale")
				self.AddTextOption("Flower Girls", cTxt[1], self.OPTION_FLAG_DISABLED)
			else
				self.AddTextOption("Flower Girls", cTxt[0], self.OPTION_FLAG_DISABLED)
			endIf
		endIf
		if bASX
			self.AddTextOption("ASX - Spells", cTxt[0], self.OPTION_FLAG_DISABLED)
		endIf
	endIf
	PageResetJobID = 0
	self.UnregisterForUpdate()
endFunction

function OnVersionUpdate(Int version)

	System = game.GetFormFromFile(3427, "BeeingFemale.esm") as fwsystem
	Content = game.GetFormFromFile(15921, "BeeingFemale.esm") as fwtextcontents
	if CurrentVersion < fwversion.GetMCMVersion() && CurrentVersion > 1
		System.Upgrade(CurrentVersion, fwversion.GetMCMVersion())
		CurrentVersion = fwversion.GetMCMVersion()
	endIf
endFunction

Int function getCompatiblity_FNIS()

	if fnis.VersionCompare(5, 4, 2, false) < 0
		return 0
	endIf
	return 1
endFunction

function ResetConfigArrays()

	UI_AddOnRaces = new Int[128]
	UI_AddOnPMS = new Int[128]
	UI_AddOnCME = new Int[128]
	UI_AddOnMisc = new Int[128]
	UI_SpermInside = new Int[128]
	UI_Child = new Int[128]
	UI_TestPerk = new Int[128]
	perkTestResultText = new String[128]
	perkTestResult = new String[128]
	Int i = 0
	while i < 128
		perkTestResult[i] = "Progress"
		perkTestResultText[i] = ""
		i += 1
	endWhile
	Pages = new String[10]
	Pages[self.FW_MENU_PAGE_Settings] = "$FW_MENU_PAGE_Settings"
	Pages[self.FW_MENU_PAGE_Cycle] = "$FW_MENU_PAGE_Cycle"
	Pages[self.FW_MENU_PAGE_Pregnancy] = "$FW_MENU_PAGE_Pregnancy"
	Pages[self.FW_MENU_PAGE_Impregnate] = "$FW_MENU_PAGE_Impregnate"
	Pages[self.FW_MENU_PAGE_Male] = "$FW_MENU_PAGE_Male"
	Pages[self.FW_MENU_PAGE_Children] = "$FW_MENU_PAGE_Children"
	Pages[self.FW_MENU_PAGE_AddOn] = "$FW_MENU_PAGE_AddOn"
	Pages[self.FW_MENU_PAGE_Info] = "$FW_MENU_PAGE_Info"
	Pages[self.FW_MENU_PAGE_Cheat] = "$FW_MENU_PAGE_Cheat"
	Pages[self.FW_MENU_PAGE_System] = "$FW_MENU_PAGE_System"
	self.ResetMenuArrays()
endFunction

Int function GetVersion()

	return fwversion.GetMCMVersion()
endFunction

String function OvulationPainString()

	if System.Player.stateDamageScale == 0.000000
		return " - "
	elseIf System.Player.stateDamageScale < 0.300000
		return "$FW_MENU_OPTIONS_Painless"
	elseIf System.Player.stateDamageScale < 0.600000
		return "$FW_MENU_OPTIONS_Humane"
	elseIf System.Player.stateDamageScale < 1.00000
		return "$FW_MENU_OPTIONS_Easy"
	elseIf System.Player.stateDamageScale < 1.50000
		return "$FW_MENU_OPTIONS_Hurts"
	elseIf System.Player.stateDamageScale < 1.80000
		return "$FW_MENU_OPTIONS_Painful"
	elseIf System.Player.stateDamageScale < 2.20000
		return "$FW_MENU_OPTIONS_VeryPainful"
	else
		return "$FW_MENU_OPTIONS_Dolorous"
	endIf
endFunction

function SetMessagesOptions()

	if MessagesOptions.length != 6
		MessagesOptions = new String[6]
	endIf
	if MessagesHighlightTexts.length != 6
		MessagesHighlightTexts = new String[6]
	endIf
	MessagesOptions[0] = "$FW_MENU_OPTIONS_MessageAll"
	MessagesHighlightTexts[0] = "$FW_MENUTXT_OPTIONS_MessageAll"
	MessagesOptions[1] = "$FW_MENU_OPTIONS_MessageDebug"
	MessagesHighlightTexts[1] = "$FW_MENUTXT_OPTIONS_MessageDebug"
	MessagesOptions[2] = "$FW_MENU_OPTIONS_MessageHigh"
	MessagesHighlightTexts[2] = "$FW_MENUTXT_OPTIONS_MessageHigh"
	MessagesOptions[3] = "$FW_MENU_OPTIONS_MessageLow"
	MessagesHighlightTexts[3] = "$FW_MENUTXT_OPTIONS_MessageLow"
	MessagesOptions[4] = "$FW_MENU_OPTIONS_MessageImmersion"
	MessagesHighlightTexts[4] = "$FW_MENUTXT_OPTIONS_MessageImmersion"
	MessagesOptions[5] = "$FW_MENU_OPTIONS_None"
	MessagesHighlightTexts[5] = "$FW_MENUTXT_OPTIONS_MessageNone"
endFunction

function InitCompatiblity()

	CompatiblityModCount = 7
	CompatiblityModNames = new String[7]
	CompatiblityDefaultValue = new Int[7]
	CompatiblityRank = new Int[7]
	CompatiblityActive = new Bool[7]
	CompatiblityModNames[0] = "Estrus Chaurus"
	CompatiblityDefaultValue[0] = 3
	CompatiblityRank[0] = 2
	CompatiblityActive[0] = true
	CompatiblityModNames[1] = "Fates des bebes"
	CompatiblityDefaultValue[1] = 0
	CompatiblityRank[1] = 0
	CompatiblityActive[1] = true
	CompatiblityModNames[2] = "Fill her up"
	CompatiblityDefaultValue[2] = 0
	CompatiblityRank[2] = 0
	CompatiblityActive[2] = true
	CompatiblityModNames[3] = "SexLab Hormones"
	CompatiblityDefaultValue[3] = 0
	CompatiblityRank[3] = 1
	CompatiblityActive[3] = true
	CompatiblityModNames[4] = "Simple Pregnancy"
	CompatiblityDefaultValue[4] = 0
	CompatiblityRank[4] = 0
	CompatiblityActive[4] = true
	CompatiblityModNames[5] = "Hentai Pregnancy"
	CompatiblityDefaultValue[5] = 0
	CompatiblityRank[5] = 0
	CompatiblityActive[5] = true
	CompatiblityModNames[6] = "Soulgem Oven"
	CompatiblityDefaultValue[6] = 0
	CompatiblityRank[6] = 0
	CompatiblityActive[6] = true
	if Compatible.length != 7
		System.Message(System.Content.Compatiblity_Reset, 1, 0)
		Compatible = new Int[7]
		Int i = 0
		while i < CompatiblityModCount
			Compatible[i] = CompatiblityDefaultValue[i]
			i += 1
		endWhile
	endIf
	if UI_Compatible.length != 7
		UI_Compatible = new Int[7]
	endIf
endFunction

Bool function IsProfile(String File)

	String S = "../../../BeeingFemale/Profile/" + File
	Bool bContinue = true
	if bContinue == true
		bContinue = false
		if FollicularDuration == jsonutil.GetIntValue(S, "CYCLE_FollicularDuration", FollicularDuration) && OvulationDuration == jsonutil.GetIntValue(S, "CYCLE_OvulationDuration", OvulationDuration) && LutealDuration == jsonutil.GetIntValue(S, "CYCLE_LutealDuration", LutealDuration) && MenstrualDuration == jsonutil.GetIntValue(S, "CYCLE_MenstrualDuration", MenstrualDuration) && Trimster1Duration == jsonutil.GetIntValue(S, "PREGNANCY_Trimster1Duration", Trimster1Duration) && Trimster2Duration == jsonutil.GetIntValue(S, "PREGNANCY_Trimster2Duration", Trimster2Duration) && Trimster3Duration == jsonutil.GetIntValue(S, "PREGNANCY_Trimster3Duration", Trimster3Duration) && ReplanishDuration == jsonutil.GetIntValue(S, "PREGNANCY_ReplanishDuration", ReplanishDuration)
			bContinue = true
		endIf
	endIf
	if bContinue == true
		bContinue = false
		if PMSChance == jsonutil.GetFloatValue(S, "CYCLE_PMS_Chance", PMSChance) && MenstrualCramps == jsonutil.GetFloatValue(S, "CYCLE_MenstrualCramps", MenstrualCramps) && irregulationChance == jsonutil.GetFloatValue(S, "CYCLE_IrregulationChance", irregulationChance) && ConceiveChance == jsonutil.GetFloatValue(S, "CYCLE_ConceiveChance_Player", ConceiveChance) && ConceiveChanceFollower == jsonutil.GetFloatValue(S, "CYCLE_ConceiveChance_Follower", ConceiveChanceFollower) && ConceiveChanceNPC == jsonutil.GetFloatValue(S, "CYCLE_ConceiveChance_NPC", ConceiveChanceNPC) && WashOutChance == jsonutil.GetFloatValue(S, "CYCLE_WashOutChance", WashOutChance) && WashOutWaterChance == jsonutil.GetFloatValue(S, "CYCLE_WashOutWaterChance", WashOutWaterChance) && WashOutFluidChance == jsonutil.GetFloatValue(S, "CYCLE_WashOutFluidChance", WashOutFluidChance) && ImpregnatePlayerChance == jsonutil.GetIntValue(S, "IMPREGNATE_Player_Chance", ImpregnatePlayerChance) && NoVaginalCumChance == jsonutil.GetIntValue(S, "MEN_NoVaginalCumChance", NoVaginalCumChance)
			bContinue = true
		endIf
	endIf
	if bContinue == true
		bContinue = false
		if Messages == jsonutil.GetIntValue(S, "GENERAL_Message_Mode", Messages) && Difficulty == jsonutil.GetIntValue(S, "GENERAL_Difficulty", Difficulty) && PMSEffects == jsonutil.GetIntValue(S, "CYCLE_Num_PMS_Effects", PMSEffects) && WashOutHourDelay == jsonutil.GetFloatValue(S, "CYCLE_WashOutHourDelay", WashOutHourDelay) && MultipleThreshold == jsonutil.GetIntValue(S, "PREGNANCY_MultipleThreshold", MultipleThreshold) && BellyMaxScale == jsonutil.GetFloatValue(S, "PREGNANCY_BellyMaxScale", BellyMaxScale) && BreastsMaxScale == jsonutil.GetFloatValue(S, "PREGNANCY_BreastsMaxScale", BreastsMaxScale) && WeightGainMax == jsonutil.GetIntValue(S, "PREGNANCY_WeightGainMax", WeightGainMax) && MaxBabys == jsonutil.GetIntValue(S, "PREGNANCY_MaxBabys", MaxBabys) && BabySpawn == jsonutil.GetIntValue(S, "PREGNANCY_BabySpawn_Player", BabySpawn) && BabySpawnNPC == jsonutil.GetIntValue(S, "PREGNANCY_BabySpawn_NPC", BabySpawnNPC) && ImpregnateTime == jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Time", ImpregnateTime) && ImpregnateCount == jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Count", ImpregnateCount) && SpermDuration == jsonutil.GetFloatValue(S, "MEN_SpermDuration", SpermDuration) && MaleVirilityRecovery == jsonutil.GetFloatValue(S, "MEN_MaleVirilityRecovery", MaleVirilityRecovery) && UpdateInterval == jsonutil.GetFloatValue(S, "SYSTEM_UpdateInterval", UpdateInterval) && KeyStateWidget == jsonutil.GetIntValue(S, "GENERAL_HotKey", KeyStateWidget) && VisualScaling == jsonutil.GetIntValue(S, "PREGNANCY_VisualScaling", VisualScaling)
			bContinue = true
		endIf
	endIf
	if bContinue == true
		Bool tmpPlayerTimer = jsonutil.GetIntValue(S, "GENERAL_PlayerTimer", fwutility.SwitchInt(PlayerTimer, 1, 0)) == 1
		Bool tmpRelevantPlayer = jsonutil.GetIntValue(S, "GENERAL_RelevantPlayer", fwutility.SwitchInt(RelevantPlayer, 1, 0)) == 1
		Bool tmpRelevantFollower = jsonutil.GetIntValue(S, "GENERAL_RelevantFollower", fwutility.SwitchInt(RelevantFollower, 1, 0)) == 1
		Bool tmpRelevantNPC = jsonutil.GetIntValue(S, "GENERAL_RelevantNPC", fwutility.SwitchInt(RelevantNPC, 1, 0)) == 1
		Bool tmpPlayAnimations = jsonutil.GetIntValue(S, "GENERAL_PlayAnimations", fwutility.SwitchInt(PlayAnimations, 1, 0)) == 1
		Bool tmpabortus = jsonutil.GetIntValue(S, "PREGNANCY_Abortus", fwutility.SwitchInt(abortus, 1, 0)) == 1
		Bool tmpVisualScalingKind = jsonutil.GetIntValue(S, "PREGNANCY_VisualScalingKind", VisualScalingKind) as Bool
		Bool tmpBellyScale = jsonutil.GetIntValue(S, "PREGNANCY_BellyScale", fwutility.SwitchInt(BellyScale, 1, 0)) == 1
		Bool tmpBreastScale = jsonutil.GetIntValue(S, "PREGNANCY_BreastScale", fwutility.SwitchInt(BreastScale, 1, 0)) == 1
		bContinue = false
		if tmpPlayerTimer == PlayerTimer && tmpRelevantPlayer == RelevantPlayer && tmpRelevantFollower == RelevantFollower && tmpRelevantNPC == RelevantNPC && tmpPlayAnimations == PlayAnimations && tmpabortus == abortus && tmpVisualScalingKind == VisualScalingKind as Bool && tmpBellyScale == BellyScale && tmpBreastScale == BreastScale
			bContinue = true
		endIf
	endIf
	if bContinue == true
		Bool tmpNPCCanBecomePregnant = jsonutil.GetIntValue(S, "NPC_CanBecomePregnant", fwutility.SwitchInt(NPCCanBecomePregnant, 1, 0)) == 1
		Bool tmpNPCFeelPain = jsonutil.GetIntValue(S, "NPC_FeelPain", fwutility.SwitchInt(NPCFeelPain, 1, 0)) == 1
		Bool tmpNPCMenstruationBlood = jsonutil.GetIntValue(S, "NPC_MenstruationBlood", fwutility.SwitchInt(NPCMenstruationBlood, 1, 0)) == 1
		Bool tmpNPCMenstrualMood = jsonutil.GetIntValue(S, "NPC_MenstrualMood", fwutility.SwitchInt(NPCMenstrualMood, 1, 0)) == 1
		Bool tmpNPCMenstrualNoTalk = jsonutil.GetIntValue(S, "NPC_MenstrualNoTalk", fwutility.SwitchInt(NPCMenstrualNoTalk, 1, 0)) == 1
		Bool tmpNPCBornChild = jsonutil.GetIntValue(S, "NPC_BornChild", fwutility.SwitchInt(NPCBornChild, 1, 0)) == 1
		Bool tmpChildrenMayCry = jsonutil.GetIntValue(S, "CHILDREN_MayCry", fwutility.SwitchInt(ChildrenMayCry, 1, 0)) == 1
		Bool tmpUpdateIntervalEnabled = jsonutil.GetIntValue(S, "SYSTEM_UpdateIntervalEnabled", fwutility.SwitchInt(UpdateIntervalEnabled, 1, 0)) == 1
		bContinue = false
		if tmpNPCCanBecomePregnant == NPCCanBecomePregnant && tmpNPCFeelPain == NPCFeelPain && tmpNPCMenstruationBlood == NPCMenstruationBlood && tmpNPCMenstrualMood == NPCMenstrualMood && tmpNPCMenstrualNoTalk == NPCMenstrualNoTalk && tmpNPCBornChild == NPCBornChild && tmpChildrenMayCry == ChildrenMayCry && tmpUpdateIntervalEnabled == UpdateIntervalEnabled
			bContinue = true
		endIf
	endIf
	if bContinue == true
		Bool tmpImpregnateActive = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Active", fwutility.SwitchInt(ImpregnateActive, 1, 0)) == 1
		Bool tmpImpregnateHusband = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Husband", fwutility.SwitchInt(ImpregnateHusband, 1, 0)) == 1
		Bool tmpImpregnateAffairs = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Affairs", fwutility.SwitchInt(ImpregnateAffairs, 1, 0)) == 1
		Bool tmpImpregnatePartners = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Partners", fwutility.SwitchInt(ImpregnatePartners, 1, 0)) == 1
		Bool tmpImpregnateLastNPC = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_LastNPC", fwutility.SwitchInt(ImpregnateLastNPC, 1, 0)) == 1
		Bool tmpImpregnatePlayerSpouse = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_PlayerSpouse", fwutility.SwitchInt(ImpregnatePlayerSpouse, 1, 0)) == 1
		Bool tmpImpregnatePlayerSleep = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Sleep", fwutility.SwitchInt(ImpregnatePlayerSleep, 1, 0)) == 1
		Bool tmpImpregnatePlayerHusband = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Husband", fwutility.SwitchInt(ImpregnatePlayerHusband, 1, 0)) == 1
		Bool tmpImpregnatePlayerFollower = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Follower", fwutility.SwitchInt(ImpregnatePlayerFollower, 1, 0)) == 1
		Bool tmpImpregnateLastPlayerNPCs = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Last_NPCs", fwutility.SwitchInt(ImpregnateLastPlayerNPCs, 1, 0)) == 1
		Bool tmpImpregnatePlayerAmbient = jsonutil.GetIntValue(S, "IMPREGNATE_PlayerAmbient", fwutility.SwitchInt(ImpregnatePlayerAmbient, 1, 0)) == 1
		bContinue = false
		if tmpImpregnateActive == ImpregnateActive && tmpImpregnateHusband == ImpregnateHusband && tmpImpregnateAffairs == ImpregnateAffairs && tmpImpregnatePartners == ImpregnatePartners && tmpImpregnateLastNPC == ImpregnateLastNPC && tmpImpregnatePlayerSpouse == ImpregnatePlayerSpouse && tmpImpregnatePlayerSleep == ImpregnatePlayerSleep && tmpImpregnatePlayerSleep == ImpregnatePlayerSleep && tmpImpregnatePlayerHusband == ImpregnatePlayerHusband && tmpImpregnatePlayerFollower == ImpregnatePlayerFollower && tmpImpregnateLastPlayerNPCs == ImpregnateLastPlayerNPCs && tmpImpregnatePlayerAmbient == ImpregnatePlayerAmbient
			bContinue = true
		endIf
	endIf
	return bContinue
endFunction

function OnUpdate()

	self.ForcePageReset()
endFunction

function LoadProfile(String File)

	String S = "../../../BeeingFemale/Profile/" + File
	Messages = jsonutil.GetIntValue(S, "GENERAL_Message_Mode", Messages)
	PlayerTimer = jsonutil.GetIntValue(S, "GENERAL_PlayerTimer", fwutility.SwitchInt(PlayerTimer, 1, 0)) == 1
	Difficulty = jsonutil.GetIntValue(S, "GENERAL_Difficulty", Difficulty)
	RelevantPlayer = jsonutil.GetIntValue(S, "GENERAL_RelevantPlayer", fwutility.SwitchInt(RelevantPlayer, 1, 0)) == 1
	RelevantFollower = jsonutil.GetIntValue(S, "GENERAL_RelevantFollower", fwutility.SwitchInt(RelevantFollower, 1, 0)) == 1
	RelevantNPC = jsonutil.GetIntValue(S, "GENERAL_RelevantNPC", fwutility.SwitchInt(RelevantNPC, 1, 0)) == 1
	KeyStateWidget = jsonutil.GetIntValue(S, "GENERAL_HotKey", KeyStateWidget)
	PlayAnimations = jsonutil.GetIntValue(S, "GENERAL_PlayAnimations", fwutility.SwitchInt(PlayAnimations, 1, 0)) == 1
	FollicularDuration = jsonutil.GetIntValue(S, "CYCLE_FollicularDuration", FollicularDuration)
	OvulationDuration = jsonutil.GetIntValue(S, "CYCLE_OvulationDuration", OvulationDuration)
	LutealDuration = jsonutil.GetIntValue(S, "CYCLE_LutealDuration", LutealDuration)
	MenstrualDuration = jsonutil.GetIntValue(S, "CYCLE_MenstrualDuration", MenstrualDuration)
	PMSChance = jsonutil.GetFloatValue(S, "CYCLE_PMS_Chance", PMSChance)
	MenstrualCramps = jsonutil.GetFloatValue(S, "CYCLE_MenstrualCramps", MenstrualCramps)
	PMSEffects = jsonutil.GetIntValue(S, "CYCLE_Num_PMS_Effects", PMSEffects)
	irregulationChance = jsonutil.GetFloatValue(S, "CYCLE_IrregulationChance", irregulationChance)
	ConceiveChance = jsonutil.GetFloatValue(S, "CYCLE_ConceiveChance_Player", ConceiveChance)
	ConceiveChanceFollower = jsonutil.GetFloatValue(S, "CYCLE_ConceiveChance_Follower", ConceiveChanceFollower)
	ConceiveChanceNPC = jsonutil.GetFloatValue(S, "CYCLE_ConceiveChance_NPC", ConceiveChanceNPC)
	WashOutChance = jsonutil.GetFloatValue(S, "CYCLE_WashOutChance", WashOutChance)
	WashOutWaterChance = jsonutil.GetFloatValue(S, "CYCLE_WashOutWaterChance", WashOutWaterChance)
	WashOutFluidChance = jsonutil.GetFloatValue(S, "CYCLE_WashOutFluidChance", WashOutFluidChance)
	WashOutHourDelay = jsonutil.GetFloatValue(S, "CYCLE_WashOutHourDelay", WashOutHourDelay)
	Trimster1Duration = jsonutil.GetIntValue(S, "PREGNANCY_Trimster1Duration", Trimster1Duration)
	Trimster2Duration = jsonutil.GetIntValue(S, "PREGNANCY_Trimster2Duration", Trimster2Duration)
	Trimster3Duration = jsonutil.GetIntValue(S, "PREGNANCY_Trimster3Duration", Trimster3Duration)
	ReplanishDuration = jsonutil.GetIntValue(S, "PREGNANCY_ReplanishDuration", ReplanishDuration)
	MultipleThreshold = jsonutil.GetIntValue(S, "PREGNANCY_MultipleThreshold", MultipleThreshold)
	abortus = jsonutil.GetIntValue(S, "PREGNANCY_Abortus", fwutility.SwitchInt(abortus, 1, 0)) == 1
	VisualScaling = jsonutil.GetIntValue(S, "PREGNANCY_VisualScaling", VisualScaling)
	VisualScalingKind = jsonutil.GetIntValue(S, "PREGNANCY_VisualScalingKind", VisualScalingKind)
	BellyScale = jsonutil.GetIntValue(S, "PREGNANCY_BellyScale", fwutility.SwitchInt(BellyScale, 1, 0)) == 1
	BreastScale = jsonutil.GetIntValue(S, "PREGNANCY_BreastScale", fwutility.SwitchInt(BreastScale, 1, 0)) == 1
	BellyMaxScale = jsonutil.GetFloatValue(S, "PREGNANCY_BellyMaxScale", BellyMaxScale)
	BreastsMaxScale = jsonutil.GetFloatValue(S, "PREGNANCY_BreastsMaxScale", BreastsMaxScale)
	WeightGainMax = jsonutil.GetIntValue(S, "PREGNANCY_WeightGainMax", WeightGainMax)
	MaxBabys = jsonutil.GetIntValue(S, "PREGNANCY_MaxBabys", MaxBabys)
	BabySpawn = jsonutil.GetIntValue(S, "PREGNANCY_BabySpawn_Player", BabySpawn)
	BabySpawnNPC = jsonutil.GetIntValue(S, "PREGNANCY_BabySpawn_NPC", BabySpawnNPC)
	NPCCanBecomePregnant = jsonutil.GetIntValue(S, "NPC_CanBecomePregnant", fwutility.SwitchInt(NPCCanBecomePregnant, 1, 0)) == 1
	NPCFeelPain = jsonutil.GetIntValue(S, "NPC_FeelPain", fwutility.SwitchInt(NPCFeelPain, 1, 0)) == 1
	NPCMenstruationBlood = jsonutil.GetIntValue(S, "NPC_MenstruationBlood", fwutility.SwitchInt(NPCMenstruationBlood, 1, 0)) == 1
	NPCMenstrualMood = jsonutil.GetIntValue(S, "NPC_MenstrualMood", fwutility.SwitchInt(NPCMenstrualMood, 1, 0)) == 1
	NPCMenstrualNoTalk = jsonutil.GetIntValue(S, "NPC_MenstrualNoTalk", fwutility.SwitchInt(NPCMenstrualNoTalk, 1, 0)) == 1
	NPCBornChild = jsonutil.GetIntValue(S, "NPC_BornChild", fwutility.SwitchInt(NPCBornChild, 1, 0)) == 1
	ChildrenMayCry = jsonutil.GetIntValue(S, "CHILDREN_MayCry", fwutility.SwitchInt(ChildrenMayCry, 1, 0)) == 1
	ImpregnateActive = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Active", fwutility.SwitchInt(ImpregnateActive, 1, 0)) == 1
	ImpregnateHusband = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Husband", fwutility.SwitchInt(ImpregnateHusband, 1, 0)) == 1
	ImpregnateAffairs = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Affairs", fwutility.SwitchInt(ImpregnateAffairs, 1, 0)) == 1
	ImpregnatePartners = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Partners", fwutility.SwitchInt(ImpregnatePartners, 1, 0)) == 1
	ImpregnateLastNPC = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_LastNPC", fwutility.SwitchInt(ImpregnateLastNPC, 1, 0)) == 1
	ImpregnatePlayerSpouse = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_PlayerSpouse", fwutility.SwitchInt(ImpregnatePlayerSpouse, 1, 0)) == 1
	ImpregnatePlayerSleep = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Sleep", fwutility.SwitchInt(ImpregnatePlayerSleep, 1, 0)) == 1
	ImpregnatePlayerHusband = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Husband", fwutility.SwitchInt(ImpregnatePlayerHusband, 1, 0)) == 1
	ImpregnatePlayerFollower = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Follower", fwutility.SwitchInt(ImpregnatePlayerFollower, 1, 0)) == 1
	ImpregnateLastPlayerNPCs = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Last_NPCs", fwutility.SwitchInt(ImpregnateLastPlayerNPCs, 1, 0)) == 1
	ImpregnatePlayerAmbient = jsonutil.GetIntValue(S, "IMPREGNATE_PlayerAmbient", fwutility.SwitchInt(ImpregnatePlayerAmbient, 1, 0)) == 1
	ImpregnateTime = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Time", ImpregnateTime)
	ImpregnateCount = jsonutil.GetIntValue(S, "IMPREGNATE_NPC_Count", ImpregnateCount)
	ImpregnatePlayerChance = jsonutil.GetIntValue(S, "IMPREGNATE_Player_Chance", ImpregnatePlayerChance)
	SpermDuration = jsonutil.GetFloatValue(S, "MEN_SpermDuration", SpermDuration)
	MaleVirilityRecovery = jsonutil.GetFloatValue(S, "MEN_MaleVirilityRecovery", MaleVirilityRecovery)
	NoVaginalCumChance = jsonutil.GetIntValue(S, "MEN_NoVaginalCumChance", NoVaginalCumChance)
	UpdateInterval = jsonutil.GetFloatValue(S, "SYSTEM_UpdateInterval", UpdateInterval)
	UpdateIntervalEnabled = jsonutil.GetIntValue(S, "SYSTEM_UpdateIntervalEnabled", fwutility.SwitchInt(UpdateIntervalEnabled, 1, 0)) == 1
endFunction

String[] function GetCompatibleOptions(Int Rank)

	String[] res
	if Rank == 0
		res = new String[1]
		res[0] = "$FW_MENU_OPTIONS_Compatible_None"
	elseIf Rank == 1
		res = new String[1]
		res[0] = "$FW_MENUTXT_OPTIONS_Compatible_Full"
	elseIf Rank == 2
		res = new String[3]
		res[0] = "$FW_MENU_OPTIONS_Compatible_None"
		res[1] = "$FW_MENU_OPTIONS_Compatible_ChangeBFState"
		res[2] = "$FW_MENUTXT_OPTIONS_Compatible_ForbideEachotherPregnancy"
	endIf
	return res
endFunction

function OnOptionHighlight(Int option)

	if self.CurrentPage == Pages[self.FW_MENU_PAGE_AddOn]
		if AddOnActiveRaces == -1 && AddOnActiveCME == -1 && AddOnActiveMisc == -1
			Int index = UI_AddOnRaces.find(option, 0)
			if index >= 0
				self.SetInfoText(UIS_AddOnRaces[index] + " AddOn: " + fwutility.getIniCString("AddOn", UIS_AddOnRaces[index], "AddOn", "description", ""))
				return 
			endIf
			index = UI_AddOnCME.find(option, 0)
			if index >= 0
				self.SetInfoText(UIS_AddOnCME[index] + " AddOn: " + fwutility.getIniCString("AddOn", UIS_AddOnCME[index], "AddOn", "description", ""))
				return 
			endIf
			index = UI_AddOnMisc.find(option, 0)
			if index >= 0
				self.SetInfoText(UIS_AddOnMisc[index] + " AddOn: " + fwutility.getIniCString("AddOn", UIS_AddOnMisc[index], "AddOn", "description", ""))
				return 
			endIf
		elseIf option == UI_AddOnBack
			self.SetInfoText("$FW_MENU_ADDON_Back")
			return 
		elseIf option == UI_Activator
			self.SetInfoText("")
			return 
		endIf
	elseIf self.CurrentPage == Pages[self.FW_MENU_PAGE_System]
		Int index = UI_Compatible.find(option, 0)
		if index >= 0
			self.SetInfoText(CompatibleHighlightTexts[index])
			return 
		endIf
	endIf
endFunction

String function SaveProfile(String FileName)

	String sx = FileName
	if sx == ""
		sx = fwutility.getNextAutoFile("Profile", "Custom ", "json")
	endIf
	if sx == ""
		sx = "Custom.json"
	endIf
	String S = "../../../BeeingFemale/Profile/" + sx
	jsonutil.SetIntValue(S, "GENERAL_Message_Mode", Messages)
	jsonutil.SetIntValue(S, "GENERAL_PlayerTimer", fwutility.SwitchInt(PlayerTimer, 1, 0))
	jsonutil.SetIntValue(S, "GENERAL_Difficulty", Difficulty)
	jsonutil.SetIntValue(S, "GENERAL_RelevantPlayer", fwutility.SwitchInt(RelevantPlayer, 1, 0))
	jsonutil.SetIntValue(S, "GENERAL_RelevantFollower", fwutility.SwitchInt(RelevantFollower, 1, 0))
	jsonutil.SetIntValue(S, "GENERAL_RelevantNPC", fwutility.SwitchInt(RelevantNPC, 1, 0)) == 1
	jsonutil.SetIntValue(S, "GENERAL_HotKey", KeyStateWidget)
	jsonutil.SetIntValue(S, "GENERAL_PlayAnimations", fwutility.SwitchInt(PlayAnimations, 1, 0))
	jsonutil.SetIntValue(S, "CYCLE_FollicularDuration", FollicularDuration)
	jsonutil.SetIntValue(S, "CYCLE_OvulationDuration", OvulationDuration)
	jsonutil.SetIntValue(S, "CYCLE_LutealDuration", LutealDuration)
	jsonutil.SetIntValue(S, "CYCLE_MenstrualDuration", MenstrualDuration)
	jsonutil.SetFloatValue(S, "CYCLE_PMS_Chance", PMSChance)
	jsonutil.SetFloatValue(S, "CYCLE_MenstrualCramps", MenstrualCramps)
	jsonutil.SetIntValue(S, "CYCLE_Num_PMS_Effects", PMSEffects)
	jsonutil.SetFloatValue(S, "CYCLE_IrregulationChance", irregulationChance)
	jsonutil.SetFloatValue(S, "CYCLE_ConceiveChance_Player", ConceiveChance)
	jsonutil.SetFloatValue(S, "CYCLE_ConceiveChance_Follower", ConceiveChanceFollower)
	jsonutil.SetFloatValue(S, "CYCLE_ConceiveChance_NPC", ConceiveChanceNPC)
	jsonutil.SetFloatValue(S, "CYCLE_WashOutChance", WashOutChance)
	jsonutil.SetFloatValue(S, "CYCLE_WashOutWaterChance", WashOutWaterChance)
	jsonutil.SetFloatValue(S, "CYCLE_WashOutFluidChance", WashOutFluidChance)
	jsonutil.SetFloatValue(S, "CYCLE_WashOutHourDelay", WashOutHourDelay)
	jsonutil.SetIntValue(S, "PREGNANCY_Trimster1Duration", Trimster1Duration)
	jsonutil.SetIntValue(S, "PREGNANCY_Trimster2Duration", Trimster2Duration)
	jsonutil.SetIntValue(S, "PREGNANCY_Trimster3Duration", Trimster3Duration)
	jsonutil.SetIntValue(S, "PREGNANCY_ReplanishDuration", ReplanishDuration)
	jsonutil.SetIntValue(S, "PREGNANCY_MultipleThreshold", MultipleThreshold)
	jsonutil.SetIntValue(S, "PREGNANCY_Abortus", fwutility.SwitchInt(abortus, 1, 0))
	jsonutil.SetIntValue(S, "PREGNANCY_VisualScaling", VisualScaling)
	jsonutil.SetIntValue(S, "PREGNANCY_VisualScalingKind", VisualScalingKind)
	jsonutil.SetIntValue(S, "PREGNANCY_BellyScale", fwutility.SwitchInt(BellyScale, 1, 0))
	jsonutil.SetIntValue(S, "PREGNANCY_BreastScale", fwutility.SwitchInt(BreastScale, 1, 0))
	jsonutil.SetFloatValue(S, "PREGNANCY_BellyMaxScale", BellyMaxScale)
	jsonutil.SetFloatValue(S, "PREGNANCY_BreastsMaxScale", BreastsMaxScale)
	jsonutil.SetIntValue(S, "PREGNANCY_WeightGainMax", WeightGainMax)
	jsonutil.SetIntValue(S, "PREGNANCY_MaxBabys", MaxBabys)
	jsonutil.SetIntValue(S, "PREGNANCY_BabySpawn_Player", BabySpawn)
	jsonutil.SetIntValue(S, "PREGNANCY_BabySpawn_NPC", BabySpawnNPC)
	jsonutil.SetIntValue(S, "NPC_CanBecomePregnant", fwutility.SwitchInt(NPCCanBecomePregnant, 1, 0))
	jsonutil.SetIntValue(S, "NPC_FeelPain", fwutility.SwitchInt(NPCFeelPain, 1, 0))
	jsonutil.SetIntValue(S, "NPC_MenstruationBlood", fwutility.SwitchInt(NPCMenstruationBlood, 1, 0))
	jsonutil.SetIntValue(S, "NPC_MenstrualMood", fwutility.SwitchInt(NPCMenstrualMood, 1, 0))
	jsonutil.SetIntValue(S, "NPC_MenstrualNoTalk", fwutility.SwitchInt(NPCMenstrualNoTalk, 1, 0))
	jsonutil.SetIntValue(S, "NPC_BornChild", fwutility.SwitchInt(NPCBornChild, 1, 0))
	jsonutil.SetIntValue(S, "CHILDREN_MayCry", fwutility.SwitchInt(ChildrenMayCry, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_NPC_Active", fwutility.SwitchInt(ImpregnateActive, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_NPC_Husband", fwutility.SwitchInt(ImpregnateHusband, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_NPC_Affairs", fwutility.SwitchInt(ImpregnateAffairs, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_NPC_Partners", fwutility.SwitchInt(ImpregnatePartners, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_NPC_LastNPC", fwutility.SwitchInt(ImpregnateLastNPC, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_NPC_PlayerSpouse", fwutility.SwitchInt(ImpregnatePlayerSpouse, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_Player_Sleep", fwutility.SwitchInt(ImpregnatePlayerSleep, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_Player_Husband", fwutility.SwitchInt(ImpregnatePlayerHusband, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_Player_Follower", fwutility.SwitchInt(ImpregnatePlayerFollower, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_Player_Last_NPCs", fwutility.SwitchInt(ImpregnateLastPlayerNPCs, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_PlayerAmbient", fwutility.SwitchInt(ImpregnatePlayerAmbient, 1, 0))
	jsonutil.SetIntValue(S, "IMPREGNATE_NPC_Time", ImpregnateTime)
	jsonutil.SetIntValue(S, "IMPREGNATE_NPC_Count", ImpregnateCount)
	jsonutil.SetIntValue(S, "IMPREGNATE_Player_Chance", ImpregnatePlayerChance)
	jsonutil.SetFloatValue(S, "MEN_SpermDuration", SpermDuration)
	jsonutil.SetFloatValue(S, "MEN_MaleVirilityRecovery", MaleVirilityRecovery)
	jsonutil.SetIntValue(S, "MEN_NoVaginalCumChance", NoVaginalCumChance)
	jsonutil.SetFloatValue(S, "SYSTEM_UpdateInterval", UpdateInterval)
	jsonutil.SetIntValue(S, "SYSTEM_UpdateIntervalEnabled", fwutility.SwitchInt(UpdateIntervalEnabled, 1, 0))
	jsonutil.Save(S, false)
	return sx
endFunction

function ResetActorBaseSettings(actor a)

	a.SetAnimationVariableBool("bSprintOK", true)
	a.ClearExpressionOverride()
	a.AllowPCDialogue(a.GetRace().AllowPCDialogue())
	fwutility.ActorRemoveSpells(a, System.StatCycleID_List)
	fwutility.ActorRemoveSpell(a, System.StatMenstruationCycle)
	fwutility.ActorRemoveSpell(a, System.StatPregnancyCycle)
	System.Manager.removeCME(a, -1)
endFunction

String function GetEggState()

	if System.Player as Bool && System.Player.currentState == 1
		if utility.GetCurrentGameTime() - System.Player.stateEnterTime < OvulationDuration as Float * 0.500000
			return "$FW_MENU_OPTIONS_Travelling"
		else
			return "$FW_MENU_OPTIONS_InUterus"
		endIf
	endIf
endFunction

String function getNumberOfChilds()

	if System.Player.currentState >= 4 && System.Player.currentState < 20
		if System.Player.currentState >= 5
			return System.Player.NumChilds as String
		else
			return "$FW_MENU_OPTIONS_UnknownChildNumber"
		endIf
	endIf
endFunction

Int function GetJobID(actor target)

	if target == none
		if System.Player
			if System.Player.currentState >= 4 && System.Player.currentState < 20
				if System.Player.currentState >= 4 && System.Player.currentState < 7
					return 1
				else
					return 2
				endIf
			elseIf System.Player.currentState >= 20
				return 3
			else
				return 0
			endIf
		endIf
	else
		Int npcState = System.Controller.GetFemaleState(target)
		if npcState >= 4 && npcState < 20
			if npcState >= 4 && npcState < 7
				return 1
			else
				return 2
			endIf
		elseIf npcState >= 20
			return 3
		else
			return 0
		endIf
	endIf
	return -1
endFunction

; Skipped compiler generated GotoState

function Upgrade(Int oldVersion, Int newVersion)

	System.UpdateState = 33
	self.ResetConfigArrays()
	System.UpdateState = 34
	if oldVersion < 9
		if Difficulty == 2
			Difficulty = 3
		elseIf Difficulty == 1
			Difficulty = 2
		else
			Difficulty = 0
		endIf
	endIf
endFunction

String function GetTimeString(Float akTime, Bool akShortFormat, String akNegativeText, Bool bShowMinutes)

	String sign = ""
	if akTime < 0.000000
		if akNegativeText != ""
			return akNegativeText
		endIf
		sign = "-"
		akTime *= -1.00000
	endIf
	String timeString = ""
	Int val = akTime as Int
	if val != 0
		if akShortFormat
			timeString += fwutility.StringReplace(Content.Day_Short, "{0}", val as String)
		elseIf val == 1
			timeString += fwutility.StringReplace(Content.Day, "{0}", val as String)
		else
			timeString += fwutility.StringReplace(Content.Days, "{0}", val as String)
		endIf
	endIf
	akTime = (akTime - val as Float) * 24.0000
	val = akTime as Int
	if val != 0
		if akShortFormat
			timeString += fwutility.StringReplace(Content.Hour_Short, "{0}", val as String)
		elseIf val == 1
			timeString += fwutility.StringReplace(Content.Hour, "{0}", val as String)
		else
			timeString += fwutility.StringReplace(Content.Hours, "{0}", val as String)
		endIf
	endIf
	akTime = (akTime - val as Float) * 60.0000
	val = akTime as Int
	if val != 0 && bShowMinutes == true
		if akShortFormat
			timeString += fwutility.StringReplace(Content.Minute_Short, "{0}", val as String)
		elseIf val == 1
			timeString += fwutility.StringReplace(Content.Minute, "{0}", val as String)
		else
			timeString += fwutility.StringReplace(Content.Minutes, "{0}", val as String)
		endIf
	endIf
	return sign + timeString
endFunction

function SetVisualScalingOptions()

	if VisualScalingOptions.length != 4
		VisualScalingOptions = new String[4]
	endIf
	if VisualScalingHighlightTexts.length != 4
		VisualScalingHighlightTexts = new String[4]
	endIf
	VisualScalingOptions[0] = "$FW_MENU_OPTIONS_None"
	VisualScalingHighlightTexts[0] = "$FW_MENUTXT_OPTIONS_VisualScalingNone"
	VisualScalingOptions[1] = "$FW_MENU_OPTIONS_VisualScaleSkeleton"
	VisualScalingHighlightTexts[1] = "$FW_MENUTXT_OPTIONS_VisualScalingSkel"
	VisualScalingOptions[2] = "$FW_MENU_OPTIONS_VisualScaleSkeletonNi"
	VisualScalingHighlightTexts[2] = "$FW_MENUTXT_OPTIONS_VisualScalingSkelNi"
	VisualScalingOptions[3] = "$FW_MENU_OPTIONS_VisualScaleWeight"
	VisualScalingHighlightTexts[3] = "$FW_MENUTXT_OPTIONS_VisualScalingWeight"
endFunction

; Skipped compiler generated GetState

String function getRemainingTime(Bool mayBeZero)

	String signed = ""
	Float xtime = System.Player.timeRemaining()
	if xtime < 0.000000 && mayBeZero == true
		signed = " - "
		xtime *= -1.00000
	elseIf xtime < 0.000000 && mayBeZero == false
		return "$FW_MENU_OPTIONS_Overdue"
	endIf
	Int Days = math.Floor(xtime)
	xtime -= Days as Float
	Int Hour = math.Floor(24.0000 * xtime)
	Int min = math.Floor(60.0000 * (24.0000 * xtime - Hour as Float))
	return signed + Days as String + "d " + Hour as String + "h " + min as String + "m"
endFunction

;-- State -------------------------------------------
state ToggleImpregnateLastNPC

	function OnSelectST()

		ImpregnateLastNPC = !ImpregnateLastNPC
		self.SetToggleOptionValueST(ImpregnateLastNPC, false, "")
	endFunction

	function OnDefaultST()

		ImpregnateLastNPC = ImpregnateLastNPCDef
		self.SetToggleOptionValueST(ImpregnateLastNPC, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_LastNPC")
	endFunction
endState

;-- State -------------------------------------------
state SliderMaleVirility

	function OnDefaultST()

		MaleVirilityRecovery = MaleVirilityRecoveryDef
		self.SetSliderOptionValueSt(MaleVirilityRecovery * 24.0000, "$FW_MENU_BASIC_Hours", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		MaleVirilityRecovery = math.Floor(value) as Float / 24.0000
		self.SetSliderOptionValueSt(MaleVirilityRecovery * 24.0000, "$FW_MENU_BASIC_Hours", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_MEN_MaleVirility")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(((MaleVirilityRecovery * 24.0000) as Int) as Float)
		self.SetSliderDialogDefaultValue(((MaleVirilityRecoveryDef * 24.0000) as Int) as Float)
		self.SetSliderDialogRange(1.00000, 48.0000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state SliderBellyScaleMax

	function OnDefaultST()

		BellyMaxScale = BellyMaxScaleDef
		self.SetSliderOptionValueSt(BellyMaxScale, "{1}", false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
	endFunction

	function OnSliderAcceptST(Float value)

		BellyMaxScale = value
		self.SetSliderOptionValueSt(BellyMaxScale, "{1}", false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_BellyMaxScale")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(BellyMaxScale)
		self.SetSliderDialogDefaultValue(BellyMaxScaleDef)
		self.SetSliderDialogRange(0.000000, 8.00000)
		self.SetSliderDialogInterval(0.100000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleBabyMayCry

	function OnSelectST()

		ChildrenMayCry = !ChildrenMayCry
		self.SetToggleOptionValueST(ChildrenMayCry, false, "")
	endFunction

	function OnDefaultST()

		ChildrenMayCry = ChildrenMayCryDef
		self.SetToggleOptionValueST(ChildrenMayCry, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHILDREN_ChildrenMayCry")
	endFunction
endState

;-- State -------------------------------------------
state SliderWashOutWaterChance

	function OnDefaultST()

		WashOutWaterChance = WashOutWaterChanceDef
		self.SetSliderOptionValueSt(WashOutWaterChance * 100.000, "{1}%", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		WashOutWaterChance = value / 100.000
		self.SetSliderOptionValueSt(WashOutWaterChance * 100.000, "{1}%", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_WaterAssistedSafeZone")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(WashOutWaterChance * 100.000)
		self.SetSliderDialogDefaultValue(WashOutWaterChanceDef * 100.000)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state TextSpawnChildren

	function OnSelectST()

		Int cRace = storageutil.FormListCount(none, "FW.AddOn.Races")
		while cRace > 0
			cRace -= 1
			race r = storageutil.FormListGet(none, "FW.AddOn.Races", cRace) as race
			Int cFemale = storageutil.FormListCount(r as form, "FW.AddOn.BabyArmor_Female")
			Int cMale = storageutil.FormListCount(r as form, "FW.AddOn.BabyArmor_Male")
			while cFemale > 0
				cFemale -= 1
				fwsystem.SubSpawnChildItem(storageutil.FormListGet(r as form, "FW.AddOn.BabyArmor_Female", cFemale) as armor, 1, game.GetPlayer(), game.GetPlayer())
			endWhile
			while cMale > 0
				cMale -= 1
				fwsystem.SubSpawnChildItem(storageutil.FormListGet(r as form, "FW.AddOn.BabyArmor_Male", cMale) as armor, 1, game.GetPlayer(), game.GetPlayer())
			endWhile
		endWhile
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_SpawnChildren")
	endFunction
endState

;-- State -------------------------------------------
state TogglePlayerTimer

	function OnSelectST()

		PlayerTimer = !PlayerTimer
		System.PlayerTimer(PlayerTimer)
		self.SetToggleOptionValueST(PlayerTimer, false, "")
	endFunction

	function OnDefaultST()

		PlayerTimer = PlayerTimerDef
		System.PlayerTimer(PlayerTimer)
		self.SetToggleOptionValueST(PlayerTimer, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_PlayerTimer")
	endFunction
endState

;-- State -------------------------------------------
state SliderWashOutDelay

	function OnDefaultST()

		WashOutHourDelay = WashOutHourDelayDef
		self.SetSliderOptionValueSt(WashOutHourDelay * 24.0000, "$FW_MENU_BASIC_DecHours", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		WashOutHourDelay = value / 24.0000
		self.SetSliderOptionValueSt(WashOutHourDelay * 24.0000, "$FW_MENU_BASIC_DecHours", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_MaximumSpermAge")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(WashOutHourDelay * 24.0000)
		self.SetSliderDialogDefaultValue(WashOutHourDelayDef * 24.0000)
		self.SetSliderDialogRange(0.000000, 24.0000)
		self.SetSliderDialogInterval(0.200000)
	endFunction
endState

;-- State -------------------------------------------
state MenuWidgetProfile

	function OnMenuAcceptST(Int index)

		if index > 0
			String FileName = fwutility.GetFileName("HUD", "ini", index - 1)
			WidgetProfile = FileName
			self.SetMenuOptionValueST(FileName, false, "")
			self.LoadWidgetProfile(FileName)
		endIf
	endFunction

	function OnMenuOpenST()

		Int c = fwutility.GetFileCount("HUD", "ini")
		if c > 126
			c = 126
		endIf
		String[] Files = fwutility.StringArray(c + 1)
		Files[0] = "$FW_MENU_OPTIONS_None"
		Int si = 0
		while c > 0
			c -= 1
			Files[c + 1] = fwutility.GetFileName("HUD", "ini", c)
			if Files[c + 1] == WidgetProfile
				si = c + 1
			endIf
		endWhile
		self.SetMenuDialogOptions(Files)
		self.SetMenuDialogStartIndex(si)
	endFunction

	function OnDefaultST()

		String FileName = WidgetProfileDef
		WidgetProfile = FileName
		self.SetMenuOptionValueST(FileName, false, "")
		self.LoadWidgetProfile(FileName)
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SYSTEM_WidgetProfile")
	endFunction
endState

;-- State -------------------------------------------
state toggleshowchildfinder

	function OnSelectST()

		if System.ChildFinder.IsObjectiveDisplayed(1) == true
			System.ChildFinder.SetStage(0)
			System.ChildFinder.SetObjectiveDisplayed(1, false, false)
			System.ChildFinder.SetActive(false)
			System.Stop()
			self.SetToggleOptionValueST(false, false, "")
		else
			System.ChildFinder.SetActive(true)
			System.ChildFinder.Start()
			System.ChildFinder.Reset()
			System.ChildFinder.SetStage(1)
			System.ChildFinder.SetObjectiveDisplayed(1, true, false)
			self.SetToggleOptionValueST(true, false, "")
		endIf
	endFunction

	function OnDefaultST()

		System.ChildFinder.SetObjectiveDisplayed(1, false, false)
		System.ChildFinder.SetActive(false)
		System.Stop()
		self.SetToggleOptionValueST(false, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_ChildFinder")
	endFunction
endState

;-- State -------------------------------------------
state MenuDifficulty

	function OnMenuAcceptST(Int index)

		Difficulty = index
		self.SetMenuOptionValueST(DifficultyOptions[Difficulty], false, "")
		self.SetInfoText(DifficultyHighlightTexts[Difficulty])
	endFunction

	function OnMenuOpenST()

		self.SetMenuDialogDefaultIndex(DifficultyDef)
		self.SetMenuDialogOptions(DifficultyOptions)
		self.SetMenuDialogStartIndex(Difficulty)
	endFunction

	function OnDefaultST()

		Difficulty = DifficultyDef
		self.SetMenuOptionValueST(DifficultyOptions[Difficulty], false, "")
		self.SetInfoText(DifficultyHighlightTexts[Difficulty])
	endFunction

	function OnHighlightST()

		self.SetInfoText(DifficultyHighlightTexts[Difficulty])
	endFunction
endState

;-- State -------------------------------------------
state TextNpcChangeState

	function OnSelectST()

		if System.Player
			actor f = game.GetCurrentCrosshairRef() as actor
			if f.GetLeveledActorBase().GetSex() == 1
				System.Controller.changeState(f, System.Controller.GetNextState(f))
				System.Controller.SetBelly(f, true)
				self.ForcePageReset()
			endIf
		endIf
	endFunction
endState

;-- State -------------------------------------------
state TextForceMenu

	function OnSelectST()

		PageResetJobID = 0
		bForceMenu = true
		self.ForcePageReset()
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_ForceMenu")
	endFunction
endState

;-- State -------------------------------------------
state MenuScalingKind

	function OnMenuAcceptST(Int index)

		VisualScalingKind = index
		self.SetMenuOptionValueST(VisualScalingKindOptions[VisualScalingKind], false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
		self.SetInfoText(VisualScalingKindHighlightTexts[VisualScalingKind])
		self.SendModEvent("BeeingFemale", "Belly", 0.000000)
	endFunction

	function OnMenuOpenST()

		self.SetMenuDialogDefaultIndex(VisualScalingKindDef)
		self.SetMenuDialogOptions(VisualScalingKindOptions)
		self.SetMenuDialogStartIndex(VisualScalingKind)
	endFunction

	function OnDefaultST()

		VisualScalingKind = VisualScalingKindDef
		self.SetMenuOptionValueST(VisualScalingKindOptions[VisualScalingKind], false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
		self.SetInfoText(VisualScalingKindHighlightTexts[VisualScalingKind])
		self.SendModEvent("BeeingFemale", "Belly", 0.000000)
	endFunction

	function OnHighlightST()

		self.SetInfoText(VisualScalingKindHighlightTexts[VisualScalingKind])
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnatePlayerSleep

	function OnSelectST()

		ImpregnatePlayerSleep = !ImpregnatePlayerSleep
		self.SetToggleOptionValueST(ImpregnatePlayerSleep, false, "")
		Int opt = self.OPTION_FLAG_DISABLED
		if ImpregnatePlayerSleep
			opt = self.OPTION_FLAG_NONE
		endIf
		self.SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerHusband")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerFollower")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnateLastPlayerNPCs")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerAmbient")
		self.SetOptionFlagsST(opt, false, "SliderImpregnatePlayerChance")
	endFunction

	function OnDefaultST()

		ImpregnatePlayerSleep = ImpregnatePlayerSleepDef
		self.SetToggleOptionValueST(ImpregnatePlayerSleep, false, "")
		Int opt = self.OPTION_FLAG_DISABLED
		if ImpregnatePlayerSleep
			opt = self.OPTION_FLAG_NONE
		endIf
		self.SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerHusband")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerFollower")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnateLastPlayerNPCs")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerAmbient")
		self.SetOptionFlagsST(opt, false, "SliderImpregnatePlayerChance")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_UpdateInterval")
	endFunction
endState

;-- State -------------------------------------------
state TextCheckChildPerks

	function OnSelectST()

		Int i = 0
		while i < 128
			perkTestResult[i] = "Progress"
			perkTestResultText[i] = ""
			i += 1
		endWhile
		bTestPerkMode = true
		selectedPerk = -1
		lastPerkTested = -1
		self.ForcePageReset()
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_TestPerks")
	endFunction
endState

;-- State -------------------------------------------
state SliderWeightGainMax

	function OnDefaultST()

		WeightGainMax = WeightGainMaxDef
		self.SetSliderOptionValueSt(WeightGainMax as Float, "{0}", false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
	endFunction

	function OnSliderAcceptST(Float value)

		WeightGainMax = value as Int
		self.SetSliderOptionValueSt(WeightGainMax as Float, "{0}", false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_MaxWeightGain")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(WeightGainMax as Float)
		self.SetSliderDialogDefaultValue(WeightGainMaxDef as Float)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleBreastScale

	function OnSelectST()

		BreastScale = !BreastScale
		self.SetToggleOptionValueST(BreastScale, false, "")
		if BreastScale == true
			self.SetOptionFlagsST(self.OPTION_FLAG_NONE, true, "SliderBreastScaleMax")
		else
			self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, true, "SliderBreastScaleMax")
		endIf
	endFunction

	function OnDefaultST()

		BreastScale = BreastScaleDef
		self.SetToggleOptionValueST(BreastScale, false, "")
		if BreastScale == true
			self.SetOptionFlagsST(self.OPTION_FLAG_NONE, true, "SliderBreastScaleMax")
		else
			self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, true, "SliderBreastScaleMax")
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_BreastScale")
	endFunction
endState

;-- State -------------------------------------------
state SliderImpregnateCount

	function OnDefaultST()

		ImpregnateCount = ImpregnateCountDef
		self.SetSliderOptionValueSt(ImpregnateCount as Float, "$FW_MENU_BASIC_NPCs", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		ImpregnateCount = value as Int
		self.SetSliderOptionValueSt(ImpregnateCount as Float, "$FW_MENU_BASIC_NPCs", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_Count")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(ImpregnateCount as Float)
		self.SetSliderDialogDefaultValue(ImpregnateCountDef as Float)
		self.SetSliderDialogRange(0.000000, 50.0000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state TextNpcJobToDo

	function OnSelectST()

		actor target = game.GetCurrentCrosshairRef() as actor
		if target.GetLeveledActorBase().GetSex() == 0
			return 
		endIf
		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		if target
			Int jobID = self.GetJobID(target)
			if jobID == 0
				Bool bHasSperm = System.Controller.HasRelevantSperm(target, false)
				if bHasSperm == true || System.CheatAddFather.length > 0
					actor[] donors
					Int cSperm = 0
					if bHasSperm == false
						donors = new actor[1]
						donors[0] = game.GetForm(System.CheatAddFather[utility.RandomInt(0, System.CheatAddFather.length - 1)]) as actor
						cSperm = 1
					else
						donors = System.Controller.GetRelevantSpermActors(target, false, true)
						cSperm = donors.length
					endIf
					Int i = System.calculateNumChildren(target)
					storageutil.FormListClear(target as form, "FW.ChildFather")
					storageutil.SetIntValue(target as form, "FW.NumChilds", i)
					while i > 0
						i -= 1
						storageutil.FormListAdd(target as form, "FW.ChildFather", donors[utility.RandomInt(0, cSperm - 1)] as form, true)
					endWhile
					System.Controller.changeState(target, 4)
				endIf
			elseIf jobID == 1
				System.Controller.changeState(target, 7)
				System.Controller.GiveBirth(target)
				System.Controller.SetBelly(target, true)
			elseIf jobID == 2
				System.Player.NumChilds = 0
				storageutil.FormListClear(target as form, "FW.ChildFather")
				storageutil.SetIntValue(target as form, "FW.NumChilds", 0)
				storageutil.UnsetIntValue(target as form, "FW.Abortus")
				storageutil.UnsetFloatValue(target as form, "FW.UnbornHealth")
				System.Controller.changeState(target, 0)
				System.Controller.SetBelly(target, true)
			endIf
			self.ForcePageReset()
		endIf
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction
endState

;-- State -------------------------------------------
state ToggleNPCBleeding

	function OnSelectST()

		NPCMenstruationBlood = !NPCMenstruationBlood
		self.SetToggleOptionValueST(NPCMenstruationBlood, false, "")
	endFunction

	function OnDefaultST()

		NPCMenstruationBlood = NPCMenstruationBloodDef
		self.SetToggleOptionValueST(NPCMenstruationBlood, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_NPCBleed")
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnateLastPlayerNPCs

	function OnSelectST()

		ImpregnateLastPlayerNPCs = !ImpregnateLastPlayerNPCs
		self.SetToggleOptionValueST(ImpregnateLastPlayerNPCs, false, "")
	endFunction

	function OnDefaultST()

		ImpregnateLastPlayerNPCs = ImpregnateLastPlayerNPCsDef
		self.SetToggleOptionValueST(ImpregnateLastPlayerNPCs, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_PlayerNPCs")
	endFunction
endState

;-- State -------------------------------------------
state MenuBabySpawnNPC

	function OnMenuAcceptST(Int index)

		BabySpawnNPC = index
		self.SetMenuOptionValueST(BabySpawnOptions[BabySpawnNPC], false, "")
		self.SetInfoText(BabySpawnHighlightTexts[BabySpawnNPC])
	endFunction

	function OnMenuOpenST()

		self.SetMenuDialogDefaultIndex(BabySpawnNPCDef)
		self.SetMenuDialogOptions(BabySpawnOptions)
		self.SetMenuDialogStartIndex(BabySpawnNPC)
	endFunction

	function OnDefaultST()

		BabySpawnNPC = BabySpawnNPCDef
		self.SetMenuOptionValueST(BabySpawnOptions[BabySpawnNPC], false, "")
		self.SetInfoText(BabySpawnHighlightTexts[BabySpawnNPC])
	endFunction

	function OnHighlightST()

		self.SetInfoText(BabySpawnHighlightTexts[BabySpawnNPC])
	endFunction
endState

;-- State -------------------------------------------
state ToggleNPCMood

	function OnSelectST()

		NPCMenstrualMood = !NPCMenstrualMood
		self.SetToggleOptionValueST(NPCMenstrualMood, false, "")
	endFunction

	function OnDefaultST()

		NPCMenstrualMood = NPCMenstrualMoodDef
		self.SetToggleOptionValueST(NPCMenstrualMood, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_NPCMood")
	endFunction
endState

;-- State -------------------------------------------
state TogglePlayerPMS

	function OnSelectST()

		System.Player.canBecomePMSThisCycle = !System.Player.canBecomePMSThisCycle
		System.Controller.setCanBecomePMS(game.GetPlayer(), System.Player.canBecomePMSThisCycle)
		self.SetToggleOptionValueST(System.Player.canBecomePMSThisCycle, false, "")
	endFunction
endState

;-- State -------------------------------------------
state TextResetPC

	function OnSelectST()

		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		if self.ShowMessage("$FW_MESSAGE_CONTENT_ResetPlayer", true, "$FW_MESSAGE_OPTION_Reset", "$Cancel")
			if game.GetPlayer().hasSpell(System.BeeingFemaleSpell as form)
				game.GetPlayer().RemoveSpell(System.BeeingFemaleSpell)
			endIf
			if game.GetPlayer().hasSpell(System.BeeingMaleSpell as form)
				game.GetPlayer().RemoveSpell(System.BeeingMaleSpell)
			endIf
			fwsaveload.Delete(game.GetPlayer())
			System.giveStartupItems(0)
			System.giveStartupSpells()
		endIf
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_ResetPlayer")
	endFunction
endState

;-- State -------------------------------------------
state ToggleRelevantNPC

	function OnSelectST()

		RelevantNPC = !RelevantNPC
		self.SetToggleOptionValueST(RelevantNPC, false, "")
	endFunction

	function OnDefaultST()

		RelevantNPC = RelevantNPCDef
		self.SetToggleOptionValueST(RelevantNPC, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_RelevantNPC")
	endFunction
endState

;-- State -------------------------------------------
state MenuMessages

	function OnMenuAcceptST(Int index)

		Messages = index
		self.SetMenuOptionValueST(MessagesOptions[Messages], false, "")
		System.refreshObjective()
		self.SetInfoText(MessagesHighlightTexts[Messages])
	endFunction

	function OnMenuOpenST()

		self.SetMenuDialogDefaultIndex(MessagesDef)
		self.SetMenuDialogOptions(MessagesOptions)
		self.SetMenuDialogStartIndex(Messages)
	endFunction

	function OnDefaultST()

		Messages = MessagesDef
		self.SetMenuOptionValueST(MessagesOptions[Messages], false, "")
		System.refreshObjective()
		self.SetInfoText(MessagesHighlightTexts[Messages])
	endFunction

	function OnHighlightST()

		self.SetInfoText(MessagesHighlightTexts[Messages])
	endFunction
endState

;-- State -------------------------------------------
state TogglePlayAnimations

	function OnSelectST()

		if fnis.VersionCompare(5, 4, 2, false) < 0
			self.ShowMessage(Content.FNISTXTNotInstalled, false, "$OK", "$Cancel")
			PlayAnimations = false
		elseIf game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") < fwversion.GetAnimationVersion()
			self.ShowMessage(Content.FNISTXTOverdue, false, "$OK", "$Cancel")
			PlayAnimations = false
		else
			PlayAnimations = !PlayAnimations
		endIf
		self.SetToggleOptionValueST(PlayAnimations, false, "")
	endFunction

	function OnDefaultST()

		if PlayAnimationsDef == true
			if fnis.VersionCompare(5, 4, 2, false) < 0
				self.ShowMessage(Content.FNISTXTNotInstalled, false, "$OK", "$Cancel")
				PlayAnimations = false
			elseIf game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") < fwversion.GetAnimationVersion()
				self.ShowMessage(Content.FNISTXTOverdue, false, "$OK", "$Cancel")
				PlayAnimations = false
			else
				PlayAnimations = PlayAnimationsDef
			endIf
		else
			PlayAnimations = PlayAnimationsDef
		endIf
		self.SetToggleOptionValueST(PlayAnimations, false, "")
	endFunction

	function OnHighlightST()

		if fnis.VersionCompare(5, 4, 2, false) < 0
			self.SetInfoText("$GAME_CONTENT_FNIS_TXTNotInstalled")
		elseIf game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") < fwversion.GetAnimationVersion()
			self.SetInfoText("$GAME_CONTENT_FNIS_TXTOverdue")
		else
			self.SetInfoText("$FW_MENUTXT_SETTINGS_PlayAnimations")
		endIf
	endFunction
endState

;-- State -------------------------------------------
state TextResetNPC

	function OnSelectST()

		actor target = game.GetCurrentCrosshairRef() as actor
		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		if target.hasSpell(System.BeeingFemaleSpell as form)
			target.RemoveSpell(System.BeeingFemaleSpell)
		endIf
		if target.hasSpell(System.BeeingMaleSpell as form)
			target.RemoveSpell(System.BeeingMaleSpell)
		endIf
		fwsaveload.Delete(target)
		if System.IsValidateFemaleActor(target, false) > 0
			target.AddSpell(System.BeeingFemaleSpell, true)
		elseIf System.IsValidateMaleActor(target, false) > 0
			target.AddSpell(System.BeeingMaleSpell, true)
		endIf
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_ResetPlayer")
	endFunction
endState

;-- State -------------------------------------------
state SliderConceptionChanceNPC

	function OnDefaultST()

		ConceiveChanceNPC = ConceiveChanceNPCDef
		self.SetSliderOptionValueSt(ConceiveChanceNPC, "{1}%", false, "")
		self.SendModEvent("BeeingFemale", "ConceptionChance", 3.00000)
	endFunction

	function OnSliderAcceptST(Float value)

		ConceiveChanceNPC = value
		self.SetSliderOptionValueSt(ConceiveChanceNPC, "{1}%", false, "")
		self.SendModEvent("BeeingFemale", "ConceptionChance", 3.00000)
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_ConceiveChanceNPC")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(ConceiveChanceNPC)
		self.SetSliderDialogDefaultValue(ConceiveChanceNPC)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleNPCBabySpawn

	function OnSelectST()

		NPCBornChild = !NPCBornChild
		self.SetToggleOptionValueST(NPCBornChild, false, "")
	endFunction

	function OnDefaultST()

		NPCBornChild = NPCBornChildDef
		self.SetToggleOptionValueST(NPCBornChild, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_NPCSpawnBabies")
	endFunction
endState

;-- State -------------------------------------------
state TextResetNPCs

	function OnSelectST()

		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		if self.ShowMessage("$FW_MESSAGE_CONTENT_ResetNPC", true, "$FW_MESSAGE_OPTION_Reset", "$Cancel")
			fwsaveload.ResetNpcData(false)
			self.SetTextOptionValueST(storageutil.FormListCount(none, "fw_storedNPC") as String, true, "")
		endIf
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_ResetNPC")
	endFunction
endState

;-- State -------------------------------------------
state TextUpdateNPC

	function OnSelectST()

		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		actor target = game.GetCurrentCrosshairRef() as actor
		if System.IsValidateFemaleActor(target, false) > 0
			System.Data.Update(target)
		endIf
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_ResetPlayer")
	endFunction
endState

;-- State -------------------------------------------
state SliderMenstruationDuration

	function OnDefaultST()

		MenstrualDuration = MenstrualDurationDef
		self.SetSliderOptionValueSt(MenstrualDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		MenstrualDuration = value as Int
		self.SetSliderOptionValueSt(MenstrualDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_Menstruation")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(MenstrualDuration as Float)
		self.SetSliderDialogDefaultValue(MenstrualDurationDef as Float)
		self.SetSliderDialogRange(2.00000, 20.0000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state TextResetPCBreastBellyScale

	function OnSelectST()

		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		actor Player = game.GetPlayer()
		if Player.hasSpell(System.BeeingFemaleSpell as form)
			System.Player.BaseBellySize = new Float[2]
			System.Player.BaseBellySize[0] = 1.00000
			System.Player.BaseBellySize[1] = 1.00000
			System.Player.BaseBreastSize = new Float[8]
			System.Player.BaseBreastSize[0] = 1.00000
			System.Player.BaseBreastSize[1] = 1.00000
			System.Player.BaseBreastSize[2] = 1.00000
			System.Player.BaseBreastSize[3] = 1.00000
			System.Player.BaseBreastSize[4] = 1.00000
			System.Player.BaseBreastSize[5] = 1.00000
			System.Player.BaseBreastSize[6] = 1.00000
			System.Player.BaseBreastSize[7] = 1.00000
		endIf
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_ResetBreastBellyScale")
	endFunction
endState

;-- State -------------------------------------------
state SliderConceptionChance

	function OnDefaultST()

		ConceiveChance = ConceiveChanceDef
		self.SetSliderOptionValueSt(ConceiveChance, "{1}%", false, "")
		System.Controller.setAutoFlag(game.GetPlayer())
	endFunction

	function OnSliderAcceptST(Float value)

		ConceiveChance = value
		self.SetSliderOptionValueSt(ConceiveChance, "{1}%", false, "")
		System.Controller.setAutoFlag(game.GetPlayer())
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_ConceiveChance")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(ConceiveChance)
		self.SetSliderDialogDefaultValue(ConceiveChance)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleNPCPains

	function OnSelectST()

		NPCFeelPain = !NPCFeelPain
		self.SetToggleOptionValueST(NPCFeelPain, false, "")
	endFunction

	function OnDefaultST()

		NPCFeelPain = NPCFeelPainDef
		self.SetToggleOptionValueST(NPCFeelPain, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_NPCPain")
	endFunction
endState

;-- State -------------------------------------------
state ToggleUpdateInterval

	function OnSelectST()

		UpdateIntervalEnabled = !UpdateIntervalEnabled
		self.SetToggleOptionValueST(UpdateIntervalEnabled, false, "")
		if UpdateIntervalEnabled == true
			self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "SliderUpdateInterval")
			System.UnregisterForUpdate()
			if UpdateInterval < 10.0000
				UpdateInterval = 10.0000
			endIf
			System.RegisterForUpdate(UpdateInterval)
		else
			self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "SliderUpdateInterval")
			System.UnregisterForUpdate()
		endIf
	endFunction

	function OnDefaultST()

		UpdateIntervalEnabled = UpdateIntervalEnabledDef
		self.SetToggleOptionValueST(UpdateIntervalEnabled, false, "")
		if UpdateIntervalEnabled == true
			self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "SliderUpdateInterval")
			System.UnregisterForUpdate()
			if UpdateInterval < 10.0000
				UpdateInterval = 10.0000
			endIf
			System.RegisterForUpdate(UpdateInterval)
		else
			self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "SliderUpdateInterval")
			System.UnregisterForUpdate()
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_UpdateInterval")
	endFunction
endState

;-- State -------------------------------------------
state TextRefreshAddOn

	function OnSelectST()

		System.Manager.Clear(7)
		System.Manager.RefreshAddOn(127)
		System.ChildSettings.ResetChildPerks()
		System.OnGameLoad(true)
	endFunction
endState

;-- State -------------------------------------------
state SliderWashOutFluidChance

	function OnDefaultST()

		WashOutFluidChance = WashOutFluidChanceDef
		self.SetSliderOptionValueSt(WashOutFluidChance * 100.000, "{1}%", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		WashOutFluidChance = value / 100.000
		self.SetSliderOptionValueSt(WashOutFluidChance * 100.000, "{1}%", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_AntiSpermEssenceSafeZone")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(WashOutFluidChance * 100.000)
		self.SetSliderDialogDefaultValue(WashOutFluidChanceDef * 100.000)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state TextUpdateAll

	function OnSelectST()

		if self.ShowMessage("$FW_MESSAGE_CONTENT_UpdateNPC", true, "$FW_MESSAGE_OPTION_Update", "$Cancel")
			Int c = storageutil.FormListCount(none, "FW.SavedNPCs")
			if c <= 0
				return 
			endIf
			System.Progress.Icon = System.Progress.ICN_Update
			System.Progress.Job = "Update ..."
			System.Progress.showWidget()
			self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
			Int i = 0
			self.SetTextOptionValueST("0%", false, "")
			bRunUpdateAllWoman = true
			while i < c && bRunUpdateAllWoman == true
				System.Progress.Icon = System.Progress.ICN_Update
				actor woman = storageutil.FormListGet(none, "FW.SavedNPCs", i) as actor
				if woman
					System.Progress.Job = "Update " + woman.GetLeveledActorBase().GetName()
					ui.InvokeString("Journal Menu", "_root.Menu_mc.setInfoText", "Update: " + woman.GetLeveledActorBase().GetName())
					if woman == none || woman.IsDead() || woman.GetLeveledActorBase().GetSex() == 0
						fwsaveload.Delete(woman)
					else
						System.Data.UpdatePerDay(woman)
					endIf
					System.Progress
				else
					storageutil.FormListRemoveAt(none, "FW.SavedNPCs", i)
					self.SetTextOptionValueST(c as String, true, "")
					c -= 1
					i -= 1
				endIf
				Int percent = i * 100 / c
				self.SetTextOptionValueST(percent as String + "%", false, "")
				System.Progress.percent = percent
				i += 1
			endWhile
			bRunUpdateAllWoman = false
			self.SetTextOptionValueST("$FW_MENU_OPTIONS_Refresh", false, "")
			self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
			System.Progress.hideWidget()
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_UpdateAll")
	endFunction
endState

;-- State -------------------------------------------
state SliderFollicularDuration

	function OnDefaultST()

		FollicularDuration = FollicularDurationDef
		self.SetSliderOptionValueSt(FollicularDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		FollicularDuration = value as Int
		self.SetSliderOptionValueSt(FollicularDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_FollicularPhase")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(FollicularDuration as Float)
		self.SetSliderDialogDefaultValue(FollicularDurationDef as Float)
		self.SetSliderDialogRange(2.00000, 20.0000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state SliderTrimester1Duration

	function OnDefaultST()

		Trimster1Duration = Trimster1DurationDef
		self.SetSliderOptionValueSt(Trimster1Duration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		Trimster1Duration = value as Int
		self.SetSliderOptionValueSt(Trimster1Duration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_1Trimester")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(Trimster1Duration as Float)
		self.SetSliderDialogDefaultValue(Trimster1DurationDef as Float)
		self.SetSliderDialogRange(2.00000, 100.000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnatePlayerFollower

	function OnSelectST()

		ImpregnatePlayerFollower = !ImpregnatePlayerFollower
		self.SetToggleOptionValueST(ImpregnatePlayerFollower, false, "")
	endFunction

	function OnDefaultST()

		ImpregnatePlayerFollower = ImpregnatePlayerFollowerDef
		self.SetToggleOptionValueST(ImpregnatePlayerFollower, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_PlayerFollower")
	endFunction
endState

;-- State -------------------------------------------
state SliderPMSChance

	function OnDefaultST()

		PMSChance = PMSChanceDef
		self.SetSliderOptionValueSt(PMSChance, "{1}%", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		PMSChance = value
		self.SetSliderOptionValueSt(PMSChance, "{1}%", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_PMSChance")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(PMSChance)
		self.SetSliderDialogDefaultValue(PMSChanceDef)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnateAffairs

	function OnSelectST()

		ImpregnateAffairs = !ImpregnateAffairs
		self.SetToggleOptionValueST(ImpregnateAffairs, false, "")
	endFunction

	function OnDefaultST()

		ImpregnateAffairs = ImpregnateAffairsDef
		self.SetToggleOptionValueST(ImpregnateAffairs, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_Affairs")
	endFunction
endState

;-- State -------------------------------------------
state SliderPMSNoEffects

	function OnDefaultST()

		PMSEffects = PMSEffectsDef
		self.SetSliderOptionValueSt(PMSEffects as Float, "$FW_MENU_BASIC_Effects", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		PMSEffects = value as Int
		self.SetSliderOptionValueSt(PMSEffects as Float, "$FW_MENU_BASIC_Effects", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_PMSEffects")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(PMSEffects as Float)
		self.SetSliderDialogDefaultValue(PMSEffectsDef as Float)
		self.SetSliderDialogRange(1.00000, 20.0000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state TextResetSystem

	function OnSelectST()

		self.SetTextOptionValueST("$FW_MESSAGE_OPTION_Wait", false, "")
		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		self.ResetSystem(true)
		self.SetTextOptionValueST("$FW_MENU_OPTIONS_Execute", false, "")
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SYSTEM_Reset")
	endFunction
endState

;-- State -------------------------------------------
state TextProfileSave

	function OnSelectST()

		if self.CurrentProfileExists()
			System.Message("Profile already exists", System.MSG_Always, System.MSG_Box)
		else
			String S = self.SaveProfile("")
			if S == ""
				System.Message("Failed to save Profile", System.MSG_Always, System.MSG_Box)
			else
				System.Message("Profile Saved\n" + S, System.MSG_Always, System.MSG_Box)
				self.SetTextOptionValueST(S, false, "MenuProfileLoad")
			endIf
		endIf
	endFunction
endState

;-- State -------------------------------------------
state ToggleMenstrualBlood

	function OnSelectST()

		if System.GlobalMenstruating.GetValueInt() == 1
			self.SetToggleOptionValueST(false, false, "")
			System.GlobalMenstruating.SetValueInt(0)
		else
			self.SetToggleOptionValueST(true, false, "")
			System.GlobalMenstruating.SetValueInt(1)
		endIf
		System.PantyWidget.UpdateContent()
	endFunction

	function OnDefaultST()

		if bMenstruationBloodDef == false
			self.SetToggleOptionValueST(false, false, "")
			System.GlobalMenstruating.SetValueInt(0)
		else
			self.SetToggleOptionValueST(true, false, "")
			System.GlobalMenstruating.SetValueInt(1)
		endIf
		System.PantyWidget.UpdateContent()
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_MenstrualBlood")
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnatePlayerAmbient

	function OnSelectST()

		ImpregnatePlayerAmbient = !ImpregnatePlayerAmbient
		self.SetToggleOptionValueST(ImpregnatePlayerAmbient, false, "")
	endFunction

	function OnDefaultST()

		ImpregnatePlayerAmbient = ImpregnatePlayerAmbientDef
		self.SetToggleOptionValueST(ImpregnatePlayerAmbient, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_PlayerAmbient")
	endFunction
endState

;-- State -------------------------------------------
state ToggleShowStatsSpell

	function OnSelectST()

		actor Player = game.GetPlayer()
		if Player.hasSpell(System.BeeingFemaleInfoSpell as form)
			Player.RemoveSpell(System.BeeingFemaleInfoSpell)
		else
			Player.AddSpell(System.BeeingFemaleInfoSpell, true)
		endIf
		self.SetToggleOptionValueST(Player.hasSpell(System.BeeingFemaleInfoSpell as form), false, "")
	endFunction

	function OnDefaultST()

		actor Player = game.GetPlayer()
		if !Player.hasSpell(System.BeeingFemaleInfoSpell as form)
			Player.AddSpell(System.BeeingFemaleInfoSpell, true)
		endIf
		self.SetToggleOptionValueST(Player.hasSpell(System.BeeingFemaleInfoSpell as form), false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_StatsSpell")
	endFunction
endState

;-- State -------------------------------------------
state SliderIrregulationChance

	function OnDefaultST()

		irregulationChance = irregulationChanceDef
		self.SetSliderOptionValueSt(irregulationChance, "{1}%", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		irregulationChance = value
		self.SetSliderOptionValueSt(irregulationChance, "{1}%", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_IrregulationChance")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(irregulationChance)
		self.SetSliderDialogDefaultValue(irregulationChanceDef)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state SliderTrimester2Duration

	function OnDefaultST()

		Trimster2Duration = Trimster2DurationDef
		self.SetSliderOptionValueSt(Trimster2Duration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		Trimster2Duration = value as Int
		self.SetSliderOptionValueSt(Trimster2Duration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_2Trimester")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(Trimster2Duration as Float)
		self.SetSliderDialogDefaultValue(Trimster2DurationDef as Float)
		self.SetSliderDialogRange(2.00000, 100.000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleRelevantPlayer

	function OnSelectST()

		RelevantPlayer = !RelevantPlayer
		self.SetToggleOptionValueST(RelevantPlayer, false, "")
	endFunction

	function OnDefaultST()

		RelevantPlayer = RelevantPlayerDef
		self.SetToggleOptionValueST(RelevantPlayer, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_RelevantPlayer")
	endFunction
endState

;-- State -------------------------------------------
state MenuProfileLoad

	function OnMenuAcceptST(Int index)

		if index > 0
			String FileName = fwutility.GetFileName("Profile", "json", index - 1)
			self.SetMenuOptionValueST(FileName, false, "")
			self.LoadProfile(FileName)
		endIf
	endFunction

	function OnMenuOpenST()

		Int c = fwutility.GetFileCount("Profile", "json")
		if c > 126
			c = 126
		endIf
		String[] Files = fwutility.StringArray(c + 1)
		Files[0] = "$FW_MENU_OPTIONS_None"
		while c > 0
			c -= 1
			Files[c + 1] = fwutility.GetFileName("Profile", "json", c)
		endWhile
		self.SetMenuDialogOptions(Files)
		self.SetMenuDialogStartIndex(0)
	endFunction

	function OnDefaultST()

		; Empty function
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SYSTEM_ProfileLoad")
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnatePartners

	function OnSelectST()

		ImpregnatePartners = !ImpregnatePartners
		self.SetToggleOptionValueST(ImpregnatePartners, false, "")
	endFunction

	function OnDefaultST()

		ImpregnatePartners = ImpregnatePartnersDef
		self.SetToggleOptionValueST(ImpregnatePartners, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_Partners")
	endFunction
endState

;-- State -------------------------------------------
state KeyMapShowState

	function OnDefaultST()

		KeyStateWidget = KeyStateWidgetDef
		self.SetKeyMapOptionValueST(KeyStateWidgetDef, false, "")
		System.UpdateHotKey()
	endFunction

	function OnKeyMapChangeST(Int keyCode, String conflictControl, String conflictName)

		KeyStateWidget = keyCode
		self.SetKeyMapOptionValueST(keyCode, false, "")
		System.UpdateHotKey()
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_ShowStatesKey")
	endFunction
endState

;-- State -------------------------------------------
state SliderMultiplesNoMax

	function OnDefaultST()

		MaxBabys = MaxBabysDef
		self.SetSliderOptionValueSt(MaxBabys as Float, "$FW_MENU_BASIC_Baby", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		MaxBabys = value as Int
		self.SetSliderOptionValueSt(MaxBabys as Float, "$FW_MENU_BASIC_Baby", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_MaxMultiples")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue((MaxBabys as Int) as Float)
		self.SetSliderDialogDefaultValue((MaxBabysDef as Int) as Float)
		self.SetSliderDialogRange(1.00000, System.MaxBabyPregnantWith as Float)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state TextChildAddLevel

	function OnSelectST()

		fwchildactor ch = game.GetCurrentCrosshairRef() as fwchildactor
		if ch.GetLevel() >= fwchildsettings.ChildMaxLevel()
			self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		else
			ch.AddLevel(1)
			self.SetTextOptionValueST(ch.GetLevel() as String, false, "")
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_ChildAddLevel")
	endFunction
endState

;-- State -------------------------------------------
state TextLeaveAddOnTest

	function OnSelectST()

		if selectedPerk == -1
			bTestPerkMode = false
		else
			bTestPerkMode = true
			selectedPerk = -1
		endIf
		self.ForcePageReset()
	endFunction

	function OnHighlightST()

		; Empty function
	endFunction
endState

;-- State -------------------------------------------
state SliderLutealDuration

	function OnDefaultST()

		LutealDuration = LutealDurationDef
		self.SetSliderOptionValueSt(LutealDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		LutealDuration = value as Int
		self.SetSliderOptionValueSt(LutealDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_LutealPhase")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(LutealDuration as Float)
		self.SetSliderDialogDefaultValue(LutealDurationDef as Float)
		self.SetSliderDialogRange(2.00000, 20.0000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleNPCHaveItems

	function OnSelectST()

		NPCHaveItems = !NPCHaveItems
		self.SetToggleOptionValueST(NPCHaveItems, false, "")
	endFunction

	function OnDefaultST()

		NPCHaveItems = NPCHaveItemsDef
		self.SetToggleOptionValueST(NPCHaveItems, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_NPCHaveItems")
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnateHusband

	function OnSelectST()

		ImpregnateHusband = !ImpregnateHusband
		self.SetToggleOptionValueST(ImpregnateHusband, false, "")
	endFunction

	function OnDefaultST()

		ImpregnateHusband = ImpregnateHusbandDef
		self.SetToggleOptionValueST(ImpregnateHusband, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_Husband")
	endFunction
endState

;-- State -------------------------------------------
state SliderNoVaginalCumChance

	function OnDefaultST()

		NoVaginalCumChance = NoVaginalCumChanceDef
		self.SetSliderOptionValueSt(NoVaginalCumChance as Float, "{0}", false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
	endFunction

	function OnSliderAcceptST(Float value)

		NoVaginalCumChance = value as Int
		self.SetSliderOptionValueSt(NoVaginalCumChance as Float, "{0}", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_MEN_NoVaginalCumChance")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(NoVaginalCumChance as Float)
		self.SetSliderDialogDefaultValue(NoVaginalCumChanceDef as Float)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state SliderSpermDuration

	function OnDefaultST()

		SpermDuration = SpermDurationDef
		self.SetSliderOptionValueSt(SpermDuration, "$FW_MENU_BASIC_DecDays", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		SpermDuration = value
		self.SetSliderOptionValueSt(SpermDuration, "$FW_MENU_BASIC_DecDays", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_MEN_SpermDuration")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(SpermDuration)
		self.SetSliderDialogDefaultValue(SpermDurationDef)
		self.SetSliderDialogRange(0.500000, 8.80000)
		self.SetSliderDialogInterval(0.250000)
	endFunction
endState

;-- State -------------------------------------------
state SliderImpregnatePlayerChance

	function OnDefaultST()

		ImpregnatePlayerChance = ImpregnatePlayerChanceDef
		self.SetSliderOptionValueSt(ImpregnatePlayerChance as Float, "{0}%", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		ImpregnatePlayerChance = value as Int
		self.SetSliderOptionValueSt(ImpregnatePlayerChance as Float, "{0}%", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_PlayerChance")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(ImpregnatePlayerChance as Float)
		self.SetSliderDialogDefaultValue(ImpregnatePlayerChanceDef as Float)
		self.SetSliderDialogRange(1.00000, 100.000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state SliderTrimester3Duration

	function OnDefaultST()

		Trimster3Duration = Trimster3DurationDef
		self.SetSliderOptionValueSt(Trimster3Duration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		Trimster3Duration = value as Int
		self.SetSliderOptionValueSt(Trimster3Duration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_3Trimester")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(Trimster3Duration as Float)
		self.SetSliderDialogDefaultValue(Trimster3DurationDef as Float)
		self.SetSliderDialogRange(2.00000, 100.000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleBellyScale

	function OnSelectST()

		BellyScale = !BellyScale
		self.SetToggleOptionValueST(BellyScale, false, "")
		if BellyScale == true
			self.SetOptionFlagsST(self.OPTION_FLAG_NONE, true, "SliderBellyScaleMax")
		else
			self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, true, "SliderBellyScaleMax")
		endIf
	endFunction

	function OnDefaultST()

		BellyScale = BellyScaleDef
		self.SetToggleOptionValueST(BellyScale, false, "")
		if BellyScale == true
			self.SetOptionFlagsST(self.OPTION_FLAG_NONE, true, "SliderBellyScaleMax")
		else
			self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, true, "SliderBellyScaleMax")
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_BellyScale")
	endFunction
endState

;-- State -------------------------------------------
state TextJobToDo

	function OnSelectST()

		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		if System.Player
			Int jobID = self.GetJobID(none)
			if jobID == 0
				Bool bHasSperm = System.Controller.HasRelevantSperm(game.GetPlayer(), false)
				if bHasSperm == true || System.CheatAddFather.length > 0
					actor[] donors
					Int cSperm = 0
					if bHasSperm == false
						donors = new actor[1]
						donors[0] = game.GetForm(System.CheatAddFather[utility.RandomInt(0, System.CheatAddFather.length - 1)]) as actor
						cSperm = 1
					else
						donors = System.Controller.GetRelevantSpermActors(game.GetPlayer(), false, true)
						cSperm = donors.length
					endIf
					System.Player.NumChilds = System.calculateNumChildren(game.GetPlayer())
					Int i = System.Player.NumChilds
					storageutil.FormListClear(game.GetPlayer() as form, "FW.ChildFather")
					storageutil.SetIntValue(game.GetPlayer() as form, "FW.NumChilds", i)
					while i > 0
						i -= 1
						actor a = donors[utility.RandomInt(0, cSperm - 1)]
						if a == none
							game.GetForm(System.CheatAddFather[utility.RandomInt(0, System.CheatAddFather.length - 1)]) as actor
						endIf
						storageutil.FormListAdd(game.GetPlayer() as form, "FW.ChildFather", a as form, true)
					endWhile
					System.Player.changeState(4)
				endIf
			elseIf jobID == 1
				System.Player.changeState(7)
				System.Player.SetBelly(false)
				System.Controller.GiveBirth(game.GetPlayer())
			elseIf jobID == 2
				System.Player.NumChilds = 0
				storageutil.FormListClear(game.GetPlayer() as form, "FW.ChildFather")
				storageutil.SetIntValue(game.GetPlayer() as form, "FW.NumChilds", 0)
				storageutil.UnsetIntValue(game.GetPlayer() as form, "FW.Abortus")
				storageutil.UnsetFloatValue(game.GetPlayer() as form, "FW.UnbornHealth")
				System.Player.changeState(0)
				System.Player.SetBelly(false)
			endIf
			self.ForcePageReset()
		endIf
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction
endState

;-- State -------------------------------------------
state SliderConceptionChanceFollower

	function OnDefaultST()

		ConceiveChanceFollower = ConceiveChanceFollowerDef
		self.SetSliderOptionValueSt(ConceiveChanceFollower, "{1}%", false, "")
		self.SendModEvent("BeeingFemale", "ConceptionChance", 2.00000)
	endFunction

	function OnSliderAcceptST(Float value)

		ConceiveChanceFollower = value
		self.SetSliderOptionValueSt(ConceiveChanceFollower, "{1}%", false, "")
		self.SendModEvent("BeeingFemale", "ConceptionChance", 2.00000)
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_ConceiveChanceFollower")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(ConceiveChanceFollower)
		self.SetSliderDialogDefaultValue(ConceiveChanceFollower)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state SliderRecoveryDuration

	function OnDefaultST()

		ReplanishDuration = ReplanishDurationDef
		self.SetSliderOptionValueSt(ReplanishDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		ReplanishDuration = value as Int
		self.SetSliderOptionValueSt(ReplanishDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_RecoveryPhase")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(ReplanishDuration as Float)
		self.SetSliderDialogDefaultValue(ReplanishDurationDef as Float)
		self.SetSliderDialogRange(2.00000, 300.000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnateLoreFriendly

	function OnSelectST()

		ImpregnateLoreFriendly = !ImpregnateLoreFriendly
		self.SetToggleOptionValueST(ImpregnateLoreFriendly, false, "")
	endFunction

	function OnDefaultST()

		ImpregnateLoreFriendly = ImpregnateLoreFriendlyDef
		self.SetToggleOptionValueST(ImpregnateLoreFriendly, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_LoreFriendly")
	endFunction
endState

;-- State -------------------------------------------
state ToggleAbortus

	function OnSelectST()

		abortus = !abortus
		self.SetToggleOptionValueST(abortus, false, "")
	endFunction

	function OnDefaultST()

		abortus = abortusDef
		self.SetToggleOptionValueST(abortus, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_Abortus")
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnatePlayerHusband

	function OnSelectST()

		ImpregnatePlayerHusband = !ImpregnatePlayerHusband
		self.SetToggleOptionValueST(ImpregnatePlayerHusband, false, "")
	endFunction

	function OnDefaultST()

		ImpregnatePlayerHusband = ImpregnatePlayerHusbandDef
		self.SetToggleOptionValueST(ImpregnatePlayerHusband, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_PlayerHusband")
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnateActive

	function OnSelectST()

		ImpregnateActive = !ImpregnateActive
		self.SetToggleOptionValueST(ImpregnateActive, false, "")
		Int opt = self.OPTION_FLAG_DISABLED
		if ImpregnateActive
			opt = self.OPTION_FLAG_NONE
		endIf
		self.SetOptionFlagsST(opt, false, "ToggleImpregnateHusband")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnateAffairs")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnatePartners")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnateLastNPC")
		self.SetOptionFlagsST(opt, false, "SliderImpregnateTime")
		self.SetOptionFlagsST(opt, false, "SliderImpregnateCount")
	endFunction

	function OnDefaultST()

		ImpregnateActive = ImpregnateActiveDef
		self.SetToggleOptionValueST(ImpregnateActive, false, "")
		Int opt = self.OPTION_FLAG_DISABLED
		if ImpregnateActive
			opt = self.OPTION_FLAG_NONE
		endIf
		self.SetOptionFlagsST(opt, false, "ToggleImpregnateHusband")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnateAffairs")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnatePartners")
		self.SetOptionFlagsST(opt, false, "ToggleImpregnateLastNPC")
		self.SetOptionFlagsST(opt, false, "SliderImpregnateTime")
		self.SetOptionFlagsST(opt, false, "SliderImpregnateCount")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_Activate")
	endFunction
endState

;-- State -------------------------------------------
state MenuBabySpawn

	function OnMenuAcceptST(Int index)

		BabySpawn = index
		self.SetMenuOptionValueST(BabySpawnOptions[BabySpawn], false, "")
		self.SetInfoText(BabySpawnHighlightTexts[BabySpawn])
	endFunction

	function OnMenuOpenST()

		self.SetMenuDialogDefaultIndex(BabySpawnDef)
		self.SetMenuDialogOptions(BabySpawnOptions)
		self.SetMenuDialogStartIndex(BabySpawn)
	endFunction

	function OnDefaultST()

		BabySpawn = BabySpawnDef
		self.SetMenuOptionValueST(BabySpawnOptions[BabySpawn], false, "")
		self.SetInfoText(BabySpawnHighlightTexts[BabySpawn])
	endFunction

	function OnHighlightST()

		self.SetInfoText(BabySpawnHighlightTexts[BabySpawn])
	endFunction
endState

;-- State -------------------------------------------
state ToggleNPCPregnancy

	function OnSelectST()

		NPCCanBecomePregnant = !NPCCanBecomePregnant
		self.SetToggleOptionValueST(NPCCanBecomePregnant, false, "")
	endFunction

	function OnDefaultST()

		NPCCanBecomePregnant = NPCCanBecomePregnantDef
		self.SetToggleOptionValueST(NPCCanBecomePregnant, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_NPCPregnant")
	endFunction
endState

;-- State -------------------------------------------
state SliderWashOutChance

	function OnDefaultST()

		WashOutChance = WashOutChanceDef
		self.SetSliderOptionValueSt(WashOutChance * 100.000, "{1}%", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		WashOutChance = value / 100.000
		self.SetSliderOptionValueSt(WashOutChance * 100.000, "{1}%", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_WashingOutSperm")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(WashOutChance * 100.000)
		self.SetSliderDialogDefaultValue(WashOutChanceDef * 100.000)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state SliderImpregnateTime

	function OnDefaultST()

		ImpregnateTime = ImpregnateTimeDef
		self.SetSliderOptionValueSt(UpdateInterval, "$FW_MENU_BASIC_Time", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		ImpregnateTime = value as Int
		self.SetSliderOptionValueSt(ImpregnateTime as Float, "$FW_MENU_BASIC_Time", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_Time")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(ImpregnateTime as Float)
		self.SetSliderDialogDefaultValue(ImpregnateTimeDef as Float)
		self.SetSliderDialogRange(0.000000, 23.0000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleNPCNoTalk

	function OnSelectST()

		NPCMenstrualNoTalk = !NPCMenstrualNoTalk
		self.SetToggleOptionValueST(NPCMenstrualNoTalk, false, "")
	endFunction

	function OnDefaultST()

		NPCMenstrualNoTalk = NPCMenstrualNoTalkDef
		self.SetToggleOptionValueST(NPCMenstrualNoTalk, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_NPCWayward")
	endFunction
endState

;-- State -------------------------------------------
state ToggleImpregnatePlayerSpouse

	function OnSelectST()

		ImpregnatePlayerSpouse = !ImpregnatePlayerSpouse
		self.SetToggleOptionValueST(ImpregnatePlayerSpouse, false, "")
	endFunction

	function OnDefaultST()

		ImpregnatePlayerSpouse = ImpregnatePlayerSpouseDef
		self.SetToggleOptionValueST(ImpregnatePlayerSpouse, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_Impregnate_PlayerSpouse")
	endFunction
endState

;-- State -------------------------------------------
state SliderMultiplesThreshold

	function OnDefaultST()

		MultipleThreshold = MultipleThresholdDef
		self.SetSliderOptionValueSt(MultipleThreshold as Float, "1:{0}", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		MultipleThreshold = value as Int
		self.SetSliderOptionValueSt(MultipleThreshold as Float, "1:{0}", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_MultiplesChance")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue((MultipleThreshold as Int) as Float)
		self.SetSliderDialogDefaultValue((MultipleThresholdDef as Int) as Float)
		self.SetSliderDialogRange(1.00000, 200.000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleCreatureSperm

	function OnSelectST()

		CreatureSperm = !CreatureSperm
		self.SetToggleOptionValueST(CreatureSperm, false, "")
	endFunction

	function OnDefaultST()

		CreatureSperm = CreatureSpermDef
		self.SetToggleOptionValueST(CreatureSperm, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_CreatureSperm")
	endFunction
endState

;-- State -------------------------------------------
state SliderOvulationDuration

	function OnDefaultST()

		OvulationDuration = OvulationDurationDef
		self.SetSliderOptionValueSt(OvulationDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		OvulationDuration = value as Int
		self.SetSliderOptionValueSt(OvulationDuration as Float, "$FW_MENU_BASIC_Days", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_Ovulation")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(OvulationDuration as Float)
		self.SetSliderDialogDefaultValue(OvulationDurationDef as Float)
		self.SetSliderDialogRange(2.00000, 20.0000)
		self.SetSliderDialogInterval(1.00000)
	endFunction
endState

;-- State -------------------------------------------
state TextUninstall

	function OnSelectST()

		self.SetOptionFlagsST(self.OPTION_FLAG_DISABLED, false, "")
		self.SetTextOptionValueST("$FW_MESSAGE_OPTION_Wait", false, "")
		if self.ShowMessage("$FW_MESSAGE_CONTENT_Uninstall", true, "$FW_MESSAGE_OPTION_Uninstall", "$Cancel")
			System.ModEnabled.SetValueInt(0)
			System.CloakingSpellEnabled.SetValueInt(0)
			alias playerAlias = System.GetAlias(0)
			if playerAlias != none
				playerAlias.UnregisterForUpdate()
			endIf
			if System.Player != none
				System.Player.ResetBelly()
				System.Player.UnregisterForUpdate()
				System.Player.UnregisterForUpdateGameTime()
			endIf
			if game.GetPlayer().hasSpell(System.BeeingFemaleSpell as form) == true
				game.GetPlayer().RemoveSpell(System.BeeingFemaleSpell)
			endIf
			if game.GetPlayer().hasSpell(System.BeeingMaleSpell as form) == true
				game.GetPlayer().RemoveSpell(System.BeeingMaleSpell)
			endIf
			System.Player = none
			System.PlayerMale = none
			self.SendModEvent("BeeingFemale", "dispel", 0.000000)
			fwsaveload.Delete(game.GetPlayer())
			fwsaveload.ResetNpcData(true)
			fwsaveload.deleteChildren()
			System.Manager.OnUninstall()
			System.Manager.ClearRaceAddOns()
			System.Manager.ClearCMEAddOns()
			System.Manager.ClearMiscAddOns()
			self.ShowMessage("$FW_MESSAGE_CONTENT_CloseMenu", false, "$Accept", "$Cancel")
			utility.Wait(5.00000)
			System.Message(System.Content.UninstallComplete, System.MSG_Always, System.MSG_Box)
		endIf
		self.SetTextOptionValueST("$FW_MESSAGE_OPTION_Execute", false, "")
		self.SetOptionFlagsST(self.OPTION_FLAG_NONE, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SYSTEM_Uninstall")
	endFunction
endState

;-- State -------------------------------------------
state ToggleRelevantFollower

	function OnSelectST()

		RelevantFollower = !RelevantFollower
		self.SetToggleOptionValueST(RelevantFollower, false, "")
	endFunction

	function OnDefaultST()

		RelevantFollower = RelevantFollowerDef
		self.SetToggleOptionValueST(RelevantFollower, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_SETTINGS_RelevantFollower")
	endFunction
endState

;-- State -------------------------------------------
state TogglePlayerFertility

	function OnSelectST()

		System.Player.canBecomePregnantThisCycle = !System.Player.canBecomePregnantThisCycle
		System.Controller.setCanBecomePregnant(game.GetPlayer(), System.Player.canBecomePregnantThisCycle)
		self.SetToggleOptionValueST(System.Player.canBecomePregnantThisCycle, false, "")
	endFunction
endState

;-- State -------------------------------------------
state SliderUpdateInterval

	function OnDefaultST()

		UpdateInterval = UpdateIntervalDef
		self.SetSliderOptionValueSt(UpdateInterval, "$FW_MENU_BASIC_Seconds", false, "")
		System.UnregisterForUpdate()
		if UpdateInterval < 10.0000
			UpdateInterval = 10.0000
		endIf
		if UpdateIntervalEnabled == true
			System.RegisterForUpdate(UpdateInterval)
		endIf
	endFunction

	function OnSliderAcceptST(Float value)

		UpdateInterval = value
		self.SetSliderOptionValueSt(UpdateInterval, "$FW_MENU_BASIC_Seconds", false, "")
		System.UnregisterForUpdate()
		if UpdateInterval < 10.0000
			UpdateInterval = 10.0000
		endIf
		if UpdateIntervalEnabled == true
			System.RegisterForUpdate(UpdateInterval)
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_UpdateInterval")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(UpdateInterval)
		self.SetSliderDialogDefaultValue(UpdateIntervalDef)
		self.SetSliderDialogRange(10.0000, 60.0000)
		self.SetSliderDialogInterval(5.00000)
	endFunction
endState

;-- State -------------------------------------------
state ToggleCoupleWidget

	function OnSelectST()

		System.CoupleWidget.Enabled = !System.CoupleWidget.Enabled
		self.SetToggleOptionValueST(System.CoupleWidget.Enabled, false, "")
	endFunction

	function OnDefaultST()

		System.CoupleWidget.Enabled = false
		self.SetToggleOptionValueST(System.CoupleWidget.Enabled, false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CHEAT_CoupleMaker")
	endFunction
endState

;-- State -------------------------------------------
state TextChangeState

	function OnSelectST()

		if System.Player
			System.Player.changeState(System.Player.nextState)
			System.Player.SetBelly(false)
			self.ForcePageReset()
		endIf
	endFunction
endState

;-- State -------------------------------------------
state MenuVisualScaling

	function OnMenuAcceptST(Int index)

		VisualScaling = index
		self.SetMenuOptionValueST(VisualScalingOptions[VisualScaling], false, "")
		Int optionFlag = self.OPTION_FLAG_DISABLED
		if VisualScaling == 1 || VisualScaling == 2
			optionFlag = self.OPTION_FLAG_NONE
		endIf
		self.SetOptionFlagsST(optionFlag, true, "ToggleBellyScale")
		self.SetOptionFlagsST(optionFlag, true, "ToggleBreastScale")
		self.SetOptionFlagsST(optionFlag, true, "SliderBellyScaleMax")
		self.SetOptionFlagsST(optionFlag, true, "SliderBreastScaleMax")
		optionFlag = self.OPTION_FLAG_DISABLED
		if VisualScaling == 3
			optionFlag = self.OPTION_FLAG_NONE
		endIf
		self.SetOptionFlagsST(optionFlag, false, "SliderWeightGainMax")
		if System.Player
			System.Player.SetBelly(false)
		endIf
		self.SetInfoText(VisualScalingHighlightTexts[VisualScaling])
	endFunction

	function OnMenuOpenST()

		self.SetMenuDialogDefaultIndex(VisualScalingDef)
		self.SetMenuDialogOptions(VisualScalingOptions)
		self.SetMenuDialogStartIndex(VisualScaling)
	endFunction

	function OnDefaultST()

		VisualScaling = VisualScalingDef
		self.SetMenuOptionValueST(VisualScalingOptions[VisualScaling], false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
		self.SetInfoText(VisualScalingHighlightTexts[VisualScaling])
	endFunction

	function OnHighlightST()

		self.SetInfoText(VisualScalingHighlightTexts[VisualScaling])
	endFunction
endState

;-- State -------------------------------------------
state SliderMenstrualCrampsChance

	function OnDefaultST()

		MenstrualCramps = MenstrualCrampsDef
		self.SetSliderOptionValueSt(MenstrualCramps, "{1}%", false, "")
	endFunction

	function OnSliderAcceptST(Float value)

		MenstrualCramps = value
		self.SetSliderOptionValueSt(MenstrualCramps, "{1}%", false, "")
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_CYCLE_MenstrualCramps")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(MenstrualCramps)
		self.SetSliderDialogDefaultValue(MenstrualCrampsDef)
		self.SetSliderDialogRange(0.000000, 100.000)
		self.SetSliderDialogInterval(0.500000)
	endFunction
endState

;-- State -------------------------------------------
state SliderBreastScaleMax

	function OnDefaultST()

		BreastsMaxScale = BreastsMaxScaleDef
		self.SetSliderOptionValueSt(BreastsMaxScale, "{2}", false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
	endFunction

	function OnSliderAcceptST(Float value)

		BreastsMaxScale = value
		self.SetSliderOptionValueSt(BreastsMaxScale, "{2}", false, "")
		if System.Player
			System.Player.SetBelly(false)
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText("$FW_MENUTXT_PREGNANCY_BreastsMaxScale")
	endFunction

	function OnSliderOpenST()

		self.SetSliderDialogStartValue(BreastsMaxScale)
		self.SetSliderDialogDefaultValue(BreastsMaxScaleDef)
		self.SetSliderDialogRange(0.000000, 3.00000)
		self.SetSliderDialogInterval(0.0100000)
	endFunction
endState

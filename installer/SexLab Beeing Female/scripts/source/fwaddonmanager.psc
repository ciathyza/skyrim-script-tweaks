;/ Decompiled by Champollion V1.0.1
Source   : FWAddOnManager.psc
Modified : 2017-01-18 11:00:46
Compiled : 2017-01-18 11:00:48
User     : admin
Computer : PATRICK
/;
scriptName FWAddOnManager extends Quest

;-- Properties --------------------------------------
Int property iRaces = 0 auto hidden
Int property LoadingStateCME hidden
	Int function get()

		return _LoadingStateCME
	endFunction
endproperty
Int property iCME = 0 auto hidden
Int property LoadingState hidden
	Int function get()

		return _LoadingState
	endFunction
endproperty
String[] property sMisc auto hidden
Int property iMisc = 0 auto hidden
String[] property sRaces auto hidden
String[] property sCME auto hidden
Int property ADDON_TYPE_ALL
	Int function get()

		return 127
	endFunction
endproperty
fwaddon_misc[] property Misc auto hidden
String property SLoadingMisc hidden
	String function get()

		return _SLoadingMisc
	endFunction
endproperty
String property SLoadingRace hidden
	String function get()

		return _SLoadingRace
	endFunction
endproperty
Int property ADDON_TYPE_RACE
	Int function get()

		return 2
	endFunction
endproperty
Bool[] property bMisc auto hidden
Bool[] property bRaces auto hidden
fwaddon_race[] property Races auto hidden
Int property ADDON_TYPE_CME
	Int function get()

		return 4
	endFunction
endproperty
String property SLoadingCME hidden
	String function get()

		return _SLoadingCME
	endFunction
endproperty
Bool[] property bCME auto hidden
Int property ADDON_TYPE_MISC
	Int function get()

		return 1
	endFunction
endproperty
Int property LoadingStateMisc hidden
	Int function get()

		return _LoadingStateMisc
	endFunction
endproperty
fwtextcontents property Contents auto
fwaddon_cyclemagiceffect[] property CME auto hidden
Int property LoadingStateRace hidden
	Int function get()

		return _LoadingStateRace
	endFunction
endproperty

;-- Variables ---------------------------------------
FWAddOn_Misc usedCameraAddOn
Int _LoadingState
String _SLoadingMisc
Int _LoadingStateMisc
String _SLoadingCME
String _SLoadingRace
Int _LoadingStateCME
Int _LoadingStateRace
String AddOnFolderHash = ""

;-- Functions ---------------------------------------

function _Export_RaceHandler(fwaddon_race q, String fName, String cat) global

	fwutility.setIniCString("AddOn", fName, cat, "id", fwutility.GetStringFromRaces(q.RaceID))
	if q.BabyMesh_Female != none
		fwutility.setIniCString("AddOn", fName, cat, "BabyMesh_Female", fwutility.GetStringFromForm(q.BabyMesh_Female as form))
	endIf
	if q.BabyArmor_Female != none
		fwutility.setIniCString("AddOn", fName, cat, "BabyArmor_Female", fwutility.GetStringFromForm(q.BabyArmor_Female as form))
	endIf
	if q.BabyActor_Female != none
		fwutility.setIniCString("AddOn", fName, cat, "BabyActor_Female", fwutility.GetStringFromForm(q.BabyActor_Female as form))
	endIf
	if q.BabyActor_FemalePlayer != none
		fwutility.setIniCString("AddOn", fName, cat, "BabyActor_FemalePlayer", fwutility.GetStringFromForm(q.BabyActor_FemalePlayer as form))
	endIf
	if q.BabyMesh_Male != none
		fwutility.setIniCString("AddOn", fName, cat, "BabyMesh_Male", fwutility.GetStringFromForm(q.BabyMesh_Male as form))
	endIf
	if q.BabyArmor_Male != none
		fwutility.setIniCString("AddOn", fName, cat, "BabyArmor_Male", fwutility.GetStringFromForm(q.BabyArmor_Male as form))
	endIf
	if q.BabyActor_Male != none
		fwutility.setIniCString("AddOn", fName, cat, "BabyActor_Male", fwutility.GetStringFromForm(q.BabyActor_Male as form))
	endIf
	if q.BabyActor_MalePlayer != none
		fwutility.setIniCString("AddOn", fName, cat, "BabyActor_MalePlayer", fwutility.GetStringFromForm(q.BabyActor_MalePlayer as form))
	endIf
	if q.Female_Force_This_Baby
		fwutility.setIniCBool("AddOn", fName, cat, "Female_Force_This_Baby", q.Female_Force_This_Baby)
	endIf
	if q.DisablePregnancy
		fwutility.setIniCBool("AddOn", fName, cat, "DisablePregnancy", q.DisablePregnancy)
	endIf
	if q.Duration_01_Follicular > 0.000000 && q.Duration_01_Follicular != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_01_Follicular", q.Duration_01_Follicular)
	endIf
	if q.Duration_02_Ovulation > 0.000000 && q.Duration_02_Ovulation != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_02_Ovulation", q.Duration_02_Ovulation)
	endIf
	if q.Duration_03_Luteal > 0.000000 && q.Duration_03_Luteal != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_03_Luteal", q.Duration_03_Luteal)
	endIf
	if q.Duration_04_Menstruation > 0.000000 && q.Duration_04_Menstruation != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_04_Menstruation", q.Duration_04_Menstruation)
	endIf
	if q.Duration_05_Trimester1 > 0.000000 && q.Duration_05_Trimester1 != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_05_Trimester1", q.Duration_05_Trimester1)
	endIf
	if q.Duration_06_Trimester2 > 0.000000 && q.Duration_06_Trimester2 != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_06_Trimester2", q.Duration_06_Trimester2)
	endIf
	if q.Duration_07_Trimester3 > 0.000000 && q.Duration_07_Trimester3 != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_07_Trimester3", q.Duration_07_Trimester3)
	endIf
	if q.Duration_08_Recovery > 0.000000 && q.Duration_08_Recovery != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_08_Recovery", q.Duration_08_Recovery)
	endIf
	if q.Duration_10_SecondsBetweenLaborPains > 0.000000 && q.Duration_10_SecondsBetweenLaborPains != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_10_SecondsBetweenLaborPains", q.Duration_10_SecondsBetweenLaborPains)
	endIf
	if q.Duration_11_SecondsBetweenBabySpawn > 0.000000 && q.Duration_11_SecondsBetweenBabySpawn != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_11_SecondsBetweenBabySpawn", q.Duration_11_SecondsBetweenBabySpawn)
	endIf
	if q.Duration_MaleSperm > 0.000000 && q.Duration_MaleSperm != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Duration_MaleSperm", q.Duration_MaleSperm)
	endIf
	if q.Pain_Mittelschmerz > 0.000000 && q.Pain_Mittelschmerz != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Pain_Mittelschmerz", q.Pain_Mittelschmerz)
	endIf
	if q.Pain_Menstruation > 0.000000 && q.Pain_Menstruation != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Pain_Menstruation", q.Pain_Menstruation)
	endIf
	if q.Pain_PMS > 0.000000 && q.Pain_PMS != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Pain_PMS", q.Pain_PMS)
	endIf
	if q.Pain_LaborPains > 0.000000 && q.Pain_LaborPains != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Pain_LaborPains", q.Pain_LaborPains)
	endIf
	if q.Pain_GivingBirth > 0.000000 && q.Pain_GivingBirth != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Pain_GivingBirth", q.Pain_GivingBirth)
	endIf
	if q.Pain_Abortus > 0.000000 && q.Pain_Abortus != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Pain_Abortus", q.Pain_Abortus)
	endIf
	if q.Pain_Phase_CyclePains > 0.000000 && q.Pain_Phase_CyclePains != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Pain_Phase_CyclePains", q.Pain_Phase_CyclePains)
	endIf
	if q.Pain_Phase_PregnantPains > 0.000000 && q.Pain_Phase_PregnantPains != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Pain_Phase_PregnantPains", q.Pain_Phase_PregnantPains)
	endIf
	if q.Max_CME_EffectsScale > 0.000000 && q.Max_CME_EffectsScale != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Max_CME_EffectsScale", q.Max_CME_EffectsScale)
	endIf
	if q.ChanceToBecomePregnantScale > 0.000000 && q.ChanceToBecomePregnantScale != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "ChanceToBecomePregnantScale", q.ChanceToBecomePregnantScale)
	endIf
	if q.Sizes_Belly_Max > 0.000000 && q.Sizes_Belly_Max != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Sizes_Belly_Max", q.Sizes_Belly_Max)
	endIf
	if q.Sizes_Breasts_Max > 0.000000 && q.Sizes_Breasts_Max != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Sizes_Breasts_Max", q.Sizes_Breasts_Max)
	endIf
	if q.Sizes_Belly_Max_Multiple > 0.000000 && q.Sizes_Belly_Max_Multiple != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Sizes_Belly_Max_Multiple", q.Sizes_Belly_Max_Multiple)
	endIf
	if q.Sizes_Breasts_Max_Multiple > 0.000000 && q.Sizes_Breasts_Max_Multiple != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Sizes_Breasts_Max_Multiple", q.Sizes_Breasts_Max_Multiple)
	endIf
	if q.Multiple_Threshold_Chance > 0.000000 && q.Multiple_Threshold_Chance != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Multiple_Threshold_Chance", q.Multiple_Threshold_Chance)
	endIf
	if q.Multiple_Threshold_Max_Babys > 0.000000 && q.Multiple_Threshold_Max_Babys != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Multiple_Threshold_Max_Babys", q.Multiple_Threshold_Max_Babys)
	endIf
	if q.Irregulation_Chance_Scale > 0.000000 && q.Irregulation_Chance_Scale != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Irregulation_Chance_Scale", q.Irregulation_Chance_Scale)
	endIf
	if q.Irregulation_Value_Scale > 0.000000 && q.Irregulation_Value_Scale != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "Irregulation_Value_Scale", q.Irregulation_Value_Scale)
	endIf
	if q.ContraceptionDuration > 0.000000 && q.ContraceptionDuration != 1.00000
		fwutility.setIniCFloat("AddOn", fName, cat, "ContraceptionDuration", q.ContraceptionDuration)
	endIf
endFunction

Bool function Export_CME(fwaddon_cyclemagiceffect q, String Prefix) global

	if q == none
		return false
	endIf
	String fName = Prefix + q.GetName() + ".ini"
	fwutility.setIniString("AddOn", fName, "name", q.GetName())
	fwutility.setIniString("AddOn", fName, "description", q.AddOnDescription)
	fwutility.setIniString("AddOn", fName, "author", q.AddOnAuthor)
	fwutility.setIniString("AddOn", fName, "type", "CME")
	fwutility.setIniString("AddOn", fName, "required", fwutility.GetModFromForm(q as form, true))
	fwutility.setIniBool("AddOn", fName, "enabled", true)
	fwutility.setIniBool("AddOn", fName, "locked", q.AddOnLocked)
	fwutility.setIniBool("AddOn", fName, "hidden", !q.AddOnVisible)
	if q.Always_FollicularPhase.length > 0
		fwutility.setIniString("AddOn", fName, "Always_FollicularPhase", fwutility.GetStringFromSpells(q.Always_FollicularPhase))
	endIf
	if q.Always_Ovulation.length > 0
		fwutility.setIniString("AddOn", fName, "Always_Ovulation", fwutility.GetStringFromSpells(q.Always_Ovulation))
	endIf
	if q.Always_LuthealPhase.length > 0
		fwutility.setIniString("AddOn", fName, "Always_LuthealPhase", fwutility.GetStringFromSpells(q.Always_LuthealPhase))
	endIf
	if q.Always_PMS.length > 0
		fwutility.setIniString("AddOn", fName, "Always_PMS", fwutility.GetStringFromSpells(q.Always_PMS))
	endIf
	if q.Always_Menstruation.length > 0
		fwutility.setIniString("AddOn", fName, "Always_Menstruation", fwutility.GetStringFromSpells(q.Always_Menstruation))
	endIf
	if q.Always_Trimester1.length > 0
		fwutility.setIniString("AddOn", fName, "Always_Trimester1", fwutility.GetStringFromSpells(q.Always_Trimester1))
	endIf
	if q.Always_Trimester2.length > 0
		fwutility.setIniString("AddOn", fName, "Always_Trimester2", fwutility.GetStringFromSpells(q.Always_Trimester2))
	endIf
	if q.Always_Trimester3.length > 0
		fwutility.setIniString("AddOn", fName, "Always_Trimester3", fwutility.GetStringFromSpells(q.Always_Trimester3))
	endIf
	if q.Always_LaborPains.length > 0
		fwutility.setIniString("AddOn", fName, "Always_LaborPains", fwutility.GetStringFromSpells(q.Always_LaborPains))
	endIf
	if q.Always_Recovery.length > 0
		fwutility.setIniString("AddOn", fName, "Always_Recovery", fwutility.GetStringFromSpells(q.Always_Recovery))
	endIf
	if q.Sometimes_FollicularPhase.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_FollicularPhase", fwutility.GetStringFromSpells(q.Sometimes_FollicularPhase))
	endIf
	if q.Sometimes_Ovulation.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_Ovulation", fwutility.GetStringFromSpells(q.Sometimes_Ovulation))
	endIf
	if q.Sometimes_LuthealPhase.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_LuthealPhase", fwutility.GetStringFromSpells(q.Sometimes_LuthealPhase))
	endIf
	if q.Sometimes_PMS.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_PMS", fwutility.GetStringFromSpells(q.Sometimes_PMS))
	endIf
	if q.Sometimes_Menstruation.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_Menstruation", fwutility.GetStringFromSpells(q.Sometimes_Menstruation))
	endIf
	if q.Sometimes_Trimester1.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_Trimester1", fwutility.GetStringFromSpells(q.Sometimes_Trimester1))
	endIf
	if q.Sometimes_Trimester2.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_Trimester2", fwutility.GetStringFromSpells(q.Sometimes_Trimester2))
	endIf
	if q.Sometimes_Trimester3.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_Trimester3", fwutility.GetStringFromSpells(q.Sometimes_Trimester3))
	endIf
	if q.Sometimes_LaborPains.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_LaborPains", fwutility.GetStringFromSpells(q.Sometimes_LaborPains))
	endIf
	if q.Sometimes_Recovery.length > 0
		fwutility.setIniString("AddOn", fName, "Sometimes_Recovery", fwutility.GetStringFromSpells(q.Sometimes_Recovery))
	endIf
	return true
endFunction

Bool function Export(FWAddOnBase q, String Prefix, Int type) global

	Bool bRes = false
	if q as FWAddOn_Misc != none && math.LogicalAnd(type, 1) == 1
		if FWAddOnManager.Export_Misc(q as FWAddOn_Misc, Prefix)
			bRes = true
		endIf
	endIf
	if q as fwaddon_race != none && math.LogicalAnd(type, 2) == 2
		if FWAddOnManager.Export_Race(q as fwaddon_race, Prefix)
			bRes = true
		endIf
	endIf
	if q as fwaddon_cyclemagiceffect != none && math.LogicalAnd(type, 4) == 4
		if FWAddOnManager.Export_CME(q as fwaddon_cyclemagiceffect, Prefix)
			bRes = true
		endIf
	endIf
	return bRes
endFunction

Bool function Export_Misc(FWAddOn_Misc q, String Prefix) global

	if q == none
		return false
	endIf
	String fName = Prefix + q.GetName() + ".ini"
	fwutility.setIniString("AddOn", fName, "name", q.GetName())
	fwutility.setIniString("AddOn", fName, "description", q.AddOnDescription)
	fwutility.setIniString("AddOn", fName, "author", q.AddOnAuthor)
	fwutility.setIniString("AddOn", fName, "type", "Misc")
	fwutility.setIniString("AddOn", fName, "required", fwutility.GetModFromForm(q as form, true))
	fwutility.setIniBool("AddOn", fName, "enabled", true)
	fwutility.setIniBool("AddOn", fName, "locked", q.AddOnLocked)
	fwutility.setIniBool("AddOn", fName, "hidden", !q.AddOnVisible)
	fwutility.setIniString("AddOn", fName, "modFile", fwutility.GetModFromForm(q as form, true))
	fwutility.setIniString("AddOn", fName, "form", "0x" + fwutility.Hex(q.GetFormID() % 16777216, 6))
	return true
endFunction

Bool function Export_Race(fwaddon_race q, String Prefix) global

	if q == none
		return false
	endIf
	String fName = Prefix + fwutility.GetModFromForm(q as form, false) + ".ini"
	fwutility.setIniString("AddOn", fName, "name", fwutility.GetModFromForm(q as form, false))
	fwutility.setIniString("AddOn", fName, "description", q.AddOnDescription)
	fwutility.setIniString("AddOn", fName, "author", q.AddOnAuthor)
	fwutility.setIniString("AddOn", fName, "type", "race")
	fwutility.setIniString("AddOn", fName, "required", fwutility.GetModFromForm(q as form, true))
	fwutility.setIniBool("AddOn", fName, "enabled", true)
	fwutility.setIniBool("AddOn", fName, "locked", q.AddOnLocked)
	fwutility.setIniBool("AddOn", fName, "hidden", !q.AddOnVisible)
	Int xRaces = fwutility.getIniInt("AddOn", fName, "Races", 0)
	xRaces += 1
	fwutility.setIniString("AddOn", fName, "Races", xRaces as String)
	FWAddOnManager._Export_RaceHandler(q, fName, "race" + xRaces as String)
	utility.WaitMenuMode(0.100000)
	return true
endFunction

function OnUninstall()

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnUninstall()
		endIf
		i += 1
	endWhile
endFunction

function OnGameLoad()

	_LoadingState = 1
	String H = fwutility.GetDirectoryHash("AddOn")
	Bool bAddOnMiscOK = true
	Int i = 0
	while i < iMisc
		if Misc[i] == none
			bAddOnMiscOK = false
		endIf
		i += 1
	endWhile
	if H != AddOnFolderHash || bAddOnMiscOK == false
		self.RefreshAddOnH(127)
	endIf
	bAddOnMiscOK = true
	i = 0
	while i < iMisc
		if Misc[i] == none
			bAddOnMiscOK = false
		endIf
		i += 1
	endWhile
	_LoadingState = 128
	if bAddOnMiscOK
		i = 0
		while i < iMisc
			_LoadingState = 129
			Misc[i].OnGameLoad()
			_LoadingState = 130
			i += 1
		endWhile
	endIf
	_LoadingState = 144
	i = 0
	actor p = game.GetPlayer()
	_LoadingState = 145
	self.RecastSpell2(p, "FollicularPhase")
	_LoadingState = 146
	self.RecastSpell2(p, "Ovulation")
	_LoadingState = 147
	self.RecastSpell2(p, "LuthealPhase")
	_LoadingState = 148
	self.RecastSpell2(p, "PMS")
	_LoadingState = 149
	self.RecastSpell2(p, "Menstruation")
	_LoadingState = 150
	self.RecastSpell2(p, "Trimester1")
	_LoadingState = 151
	self.RecastSpell2(p, "Trimester2")
	_LoadingState = 152
	self.RecastSpell2(p, "Trimester3")
	_LoadingState = 153
	self.RecastSpell2(p, "Recovery")
	_LoadingState = 0
endFunction

function castCMEEffect(actor akActor, Int EffectID, Int MaxEffectNumber)

	if akActor == none
		return 
	endIf
	Float maxEffects = utility.RandomInt(1, MaxEffectNumber) as Float
	race RaceID = akActor.GetLeveledActorBase().GetRace()
	maxEffects *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Max_CME_EffectsScale", 1.00000)
	if maxEffects <= 0.000000
		maxEffects = 1.00000
	endIf
	String sName = ""
	if EffectID == 0
		sName = "Follicular"
	elseIf EffectID == 1
		sName = "Ovulation"
	elseIf EffectID == 2
		sName = "LuthealPhase"
	elseIf EffectID == 3
		sName = "PMS"
	elseIf EffectID == 4
		sName = "Menstruation"
	elseIf EffectID == 5
		sName = "Trimester1"
	elseIf EffectID == 6
		sName = "Trimester2"
	elseIf EffectID == 7
		sName = "Trimester3"
	elseIf EffectID == 8
		sName = "LaborPains"
	elseIf EffectID == 9
		sName = "Recovery"
	endIf
	if sName != ""
		Int cmeCount = storageutil.FormListCount(none, "FW.AddOn.Sometimes_" + sName)
		if cmeCount > 0
			if maxEffects >= cmeCount as Float
				while maxEffects > 0.000000
					maxEffects -= 1.00000
					Int sID = utility.RandomInt(0, cmeCount - 1)
					spell spl = storageutil.FormListGet(none, "FW.AddOn.Sometimes_" + sName, sID) as spell
					if spl != none
						fwutility.ActorAddSpell(akActor, spl, false, false)
					endIf
				endWhile
			else
				Int iMaxEffects = math.Ceiling(maxEffects)
				while iMaxEffects > 0
					iMaxEffects -= 1
					spell spl = storageutil.FormListGet(none, "FW.AddOn.Sometimes_" + sName, iMaxEffects) as spell
					if spl != none
						fwutility.ActorAddSpell(akActor, spl, false, false)
					endIf
				endWhile
			endIf
		endIf
	endIf
endFunction

function AddRaceAddOnArrayToList(race r, String n, String cat, String valueName)

	String S = fwutility.getIniCString("AddOn", n, cat, valueName, "")
	if S != ""
		String[] ss = stringutil.Split(S, ",")
		Int c = ss.length
		if storageutil.GetIntValue(r as form, "FW.AddOn.Female_Force_This_Baby", 0) == 0
			while c > 0
				c -= 1
				if ss[c] != ""
					form itm = fwutility.GetFormFromString(ss[c])
					if itm != none
						if storageutil.FormListHas(r as form, "FW.AddOn." + valueName, itm) == false
							storageutil.FormListAdd(r as form, "FW.AddOn." + valueName, itm, true)
						endIf
					endIf
				endIf
			endWhile
		else
			while c > 0
				c -= 1
				if ss[c] != ""
					form itm = fwutility.GetFormFromString(ss[c])
					if itm != none
						storageutil.FormListClear(r as form, "FW.AddOn." + valueName)
						storageutil.FormListAdd(r as form, "FW.AddOn." + valueName, itm, true)
					endIf
				endIf
			endWhile
		endIf
	endIf
endFunction

Float function getRaceDurationScale(Int Step, race RaceID)

	if Step == 7
		return result
	endIf
	Float result = 1.00000
	if Step == 0
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_01_Follicular", 1.00000)
	elseIf Step == 1
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_02_Ovulation", 1.00000)
	elseIf Step == 2
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_03_Luteal", 1.00000)
	elseIf Step == 3
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_04_Menstruation", 1.00000)
	elseIf Step == 4
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_05_Trimester1", 1.00000)
	elseIf Step == 5
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_06_Trimester2", 1.00000)
	elseIf Step == 6
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_07_Trimester3", 1.00000)
	elseIf Step == 8
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_08_Recovery", 1.00000)
	endIf
	if result < 0.200000
		return 0.200000
	else
		return result
	endIf
endFunction

function RefreshAddOn(Int type)

	self.RefreshAddOnH(type)
	_LoadingState = 0
endFunction

Bool function IsAddOnActive(String AddOnName)

	Bool bActive = fwutility.getIniBool("AddOn", AddOnName + ".ini", "enabled", false)
	if bActive
		String t = fwutility.getIniString("AddOn", AddOnName + ".ini", "type", "")
		if t == "Misc" || t == "Misc" || t == "Misc"
			Int c = iMisc
			while c > 0
				c -= 1
				if fwutility.toLower(sMisc[c]) == fwutility.toLower(AddOnName) + ".ini"
					if Misc[c] != none
						Bool bAddOnActive = Misc[c].IsActive()
						return bAddOnActive
					endIf
				endIf
			endWhile
			return false
		endIf
	endIf
	return bActive
endFunction

function RefreshAddOnH(Int type)

	_LoadingState = 32
	if math.LogicalAnd(type, 2) == 2
		self.ResetAllRaceAddOns()
	endIf
	self.Clear(type)
	Int c = fwutility.GetFileCount("AddOn", "ini")
	_LoadingState = 33
	AddOnFolderHash = fwutility.GetDirectoryHash("AddOn")
	_LoadingState = 34
	while c > 0
		_LoadingState = 48
		c -= 1
		String n = fwutility.GetFileName("AddOn", "ini", c)
		if fwutility.getIniCBool("AddOn", n, "AddOn", "enabled", false) || fwutility.getIniCBool("AddOn", n, "AddOn", "locked", false)
			_LoadingState = 49
			String required = fwutility.getIniCString("AddOn", n, "AddOn", "required", "")
			Bool bUse = true
			if required != ""
				String[] requiredA = stringutil.Split(required, ",")
				if fwutility.AreModsInstalled(requiredA) == false
					bUse = false
				endIf
			endIf
			_LoadingState = 50
			if bUse
				_LoadingState = 51
				String t = fwutility.toLower(fwutility.getIniCString("AddOn", n, "AddOn", "type", ""))
				_LoadingState = 52
				if t == "Misc" && math.LogicalAnd(type, 1) == 1
					_LoadingState = 64
					String modName = fwutility.getIniCString("AddOn", n, "AddOn", "modFile", "")
					_LoadingState = 65
					Int formID = fwutility.getIniCInt("AddOn", n, "AddOn", "form", 0)
					_LoadingState = 66
					if modName != "" && fwutility.IsModInstalled(modName) && formID > 0
						_LoadingState = 67
						FWAddOn_Misc tmp = game.GetFormFromFile(formID, modName) as FWAddOn_Misc
						if tmp != none
							sMisc[iMisc] = n
							Misc[iMisc] = tmp
							iMisc += 1
						endIf
						_LoadingState = 68
					endIf
					_LoadingState = 69
				elseIf t == "race" && math.LogicalAnd(type, 2) == 2
					String sRaceCount = fwutility.getIniString("AddOn", n, "Races", "")
					Int RaceCount = 0
					if sRaceCount != ""
						RaceCount = sRaceCount as Int
					endIf
					if RaceCount == 0
						self.AddRaceAddOnCat(n, "AddOn")
					else
						while RaceCount > 0
							self.AddRaceAddOnCat(n, "race" + RaceCount as String)
							RaceCount -= 1
						endWhile
					endIf
				elseIf t == "CME" && math.LogicalAnd(type, 4) == 4
					_LoadingState = 112
					self.AddCME(n, "Always_FollicularPhase")
					self.AddCME(n, "Always_LaborPains")
					self.AddCME(n, "Always_LutealPhase")
					self.AddCME(n, "Always_Menstruation")
					_LoadingState = 113
					self.AddCME(n, "Always_Ovulation")
					self.AddCME(n, "Always_PMS")
					self.AddCME(n, "Always_Recovery")
					_LoadingState = 114
					self.AddCME(n, "Always_Trimester1")
					self.AddCME(n, "Always_Trimester2")
					self.AddCME(n, "Always_Trimester3")
					_LoadingState = 115
					self.AddCME(n, "Sometimes_FollicularPhase")
					self.AddCME(n, "Sometimes_LaborPains")
					self.AddCME(n, "Sometimes_LutealPhase")
					_LoadingState = 116
					self.AddCME(n, "Sometimes_Menstruation")
					self.AddCME(n, "Sometimes_Ovulation")
					self.AddCME(n, "Sometimes_PMS")
					_LoadingState = 117
					self.AddCME(n, "Sometimes_Recovery")
					self.AddCME(n, "Sometimes_Trimester1")
					self.AddCME(n, "Sometimes_Trimester2")
					_LoadingState = 118
					self.AddCME(n, "Sometimes_Trimester3")
				endIf
			endIf
		endIf
	endWhile
endFunction

Float function RaceSizeScaler(Int type, race RaceID)

	Float result = 1.00000
	if type == 0
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Sizes_Belly_Max", 1.00000)
	elseIf type == 1
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Sizes_Breasts_Max", 1.00000)
	elseIf type == 2
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Sizes_Belly_Max_Multiple", 1.00000)
	elseIf type == 3
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Sizes_Breasts_Max_Multiple", 1.00000)
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

function RecastSpell2(actor a, String S)

	if stringutil.Substring(S, 0, 7) == "Always_" || stringutil.Substring(S, 0, 10) == "Sometimes_"
		Int i = storageutil.FormListCount(none, "FW.AddOn." + S)
		while i > 0
			i -= 1
			spell spl = storageutil.FormListGet(none, "FW.AddOn." + S, i) as spell
			if a.HasSpell(spl as form)
				a.DispelSpell(spl)
				a.AddSpell(spl, true)
			endIf
		endWhile
	else
		Int i = storageutil.FormListCount(none, "FW.AddOn.Always_" + S)
		while i > 0
			i -= 1
			spell spl = storageutil.FormListGet(none, "FW.AddOn.Always_" + S, i) as spell
			if a.HasSpell(spl as form)
				a.DispelSpell(spl)
				a.AddSpell(spl, true)
			endIf
		endWhile
		i = storageutil.FormListCount(none, "FW.AddOn.Sometimes_" + S)
		while i > 0
			i -= 1
			spell spl = storageutil.FormListGet(none, "FW.AddOn.Sometimes_" + S, i) as spell
			if a.HasSpell(spl as form)
				a.DispelSpell(spl)
				a.AddSpell(spl, true)
			endIf
		endWhile
	endIf
endFunction

Float function RaceMaleRecoveryScale(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Male_Recovery_Scale", 1.00000)
	if result < 0.300000
		return 0.300000
	else
		return result
	endIf
endFunction

actorbase function GetBabyActor(race ParentRace, Int Gender)

	actorbase m = none
	String sGender = "BabyActor_Male"
	if Gender == 1
		sGender = "BabyActor_Female"
	endIf
	Int c = storageutil.FormListCount(ParentRace as form, "FW.AddOn." + sGender)
	if c > 0
		Int r = utility.RandomInt(0, c - 1)
		m = storageutil.FormListGet(ParentRace as form, "FW.AddOn." + sGender, r) as actorbase
		if m != none
			return m
		endIf
		while c > 0
			c -= 1
			m = storageutil.FormListGet(ParentRace as form, "FW.AddOn." + sGender, c) as actorbase
			if m != none
				return m
			endIf
		endWhile
	endIf
	return none
endFunction

function OnGiveBirth(actor akMother, Int iChildCount)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnGiveBirth(akMother, iChildCount)
		endIf
		i += 1
	endWhile
endFunction

Float function ActorBabyHealingScale(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.RaceBabyHealingScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

miscobject function GetBabyItem(race ParentRace, Int Gender)

	miscobject m = none
	String sGender = "BabyMesh_Male"
	if Gender == 1
		sGender = "BabyMesh_Female"
	endIf
	Int c = storageutil.FormListCount(ParentRace as form, "FW.AddOn." + sGender)
	if c > 0
		Int r = utility.RandomInt(0, c - 1)
		m = storageutil.FormListGet(ParentRace as form, "FW.AddOn." + sGender, r) as miscobject
		if m != none
			return m
		endIf
		while c > 0
			c -= 1
			m = storageutil.FormListGet(ParentRace as form, "FW.AddOn." + sGender, c) as miscobject
			if m != none
				return m
			endIf
		endWhile
	endIf
	return none
endFunction

Float function getActorDurationScale(Int Step, actor a)

	Float result = 1.00000
	if a != none && a.GetActorBase() != none && a.GetActorBase().GetRace() != none
		result *= self.getRaceDurationScale(Step, a.GetActorBase().GetRace())
	endIf
	if result < 0.200000
		return 0.200000
	else
		return result
	endIf
endFunction

function OnCameInside(actor akFemale, actor akMale)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnCameInside(akFemale, akMale)
		endIf
		i += 1
	endWhile
endFunction

function OnContraception(actor woman, Float amount, Float ValueBefore, Float ValueAfter, Float TimeAgo)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnContraception(woman, amount, ValueBefore, ValueAfter, TimeAgo)
		endIf
		i += 1
	endWhile
endFunction

function OnDoDamageStart(actor woman, Float amount, Int DamageType, Float OptionalArgument)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnDoDamageStart(woman, amount, DamageType, OptionalArgument)
		endIf
		i += 1
	endWhile
endFunction

Float function ActorSpermAmountScale(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.RaceSpermAmountScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function getRaceDuration_BetweenLaborPains(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_10_SecondsBetweenLaborPains", 1.00000)
	if result < 0.300000
		return 0.300000
	else
		return result
	endIf
endFunction

function AddRaceAddOnValue(race r, String n, String cat, String valueName)

	Float v = fwutility.getIniCFloat("AddOn", n, cat, valueName, 1.00000)
	if v > 0.000000 && v < 10.0000
		Float oldVal = storageutil.GetFloatValue(r as form, "FW.AddOn." + valueName, 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn." + valueName, oldVal * v)
	endIf
endFunction

armor function GetBabyArmor(race ParentRace, Int Gender)

	armor m = none
	String sGender = "BabyMesh_Male"
	if Gender == 1
		sGender = "BabyArmor_Female"
	endIf
	Int c = storageutil.FormListCount(ParentRace as form, "FW.AddOn." + sGender)
	if c > 0
		Int r = utility.RandomInt(0, c - 1)
		m = storageutil.FormListGet(ParentRace as form, "FW.AddOn." + sGender, r) as armor
		if m != none
			return m
		endIf
		while c > 0
			c -= 1
			m = storageutil.FormListGet(ParentRace as form, "FW.AddOn." + sGender, c) as armor
			if m != none
				return m
			endIf
		endWhile
	endIf
	return none
endFunction

function OnPotionDrink(actor akMother, potion akPotion)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnPotionDrink(akMother, akPotion)
		endIf
		i += 1
	endWhile
endFunction

Float function getSpermAmount(actor akFemale, actor akMale, Float amount)

	Int i = 1
	Float tamount = amount
	while i < iMisc
		if Misc[i] != none
			tamount = Misc[i].getSpermAmount(akFemale, akMale, tamount)
		endIf
		i += 1
	endWhile
	return tamount
endFunction

function StopCamera()

	if usedCameraAddOn != none
		usedCameraAddOn.StopCamera()
		usedCameraAddOn = none
	endIf
	debug.Trace("Camera stoped", 0)
endFunction

function OnSpellCast(actor akMother, spell akSpell)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnSpellCast(akMother, akSpell)
		endIf
		i += 1
	endWhile
endFunction

Bool function OnPainSound(actor akMother)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			if Misc[i].OnPainSound(akMother)
				return true
			endIf
		endIf
		i += 1
	endWhile
	return false
endFunction

Float function getActorDamageScale(Int DamageType, actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.getRaceDamageScale(DamageType, a.GetActorBase().GetRace())
	endIf
	if result < 0.0500000
		return 0.0500000
	else
		return result
	endIf
endFunction

function AddRaceAddOn(race r, String n, String cat)

	if !storageutil.FormListHas(none, "FW.AddOn.Races", r as form)
		storageutil.FormListAdd(none, "FW.AddOn.Races", r as form, true)
	endIf
	if fwutility.getIniCBool("AddOn", n, cat, "Female_Force_This_Baby", false)
		storageutil.SetIntValue(r as form, "FW.AddOn.Female_Force_This_Baby", 1)
	endIf
	if fwutility.getIniCBool("AddOn", n, cat, "DisablePregnancy", false)
		storageutil.SetIntValue(r as form, "FW.AddOn.DisablePregnancy", 1)
	endIf
	self.AddRaceAddOnArrayToList(r, n, cat, "BabyActor_Female")
	self.AddRaceAddOnArrayToList(r, n, cat, "BabyActor_Male")
	self.AddRaceAddOnArrayToList(r, n, cat, "BabyActor_FemalePlayer")
	self.AddRaceAddOnArrayToList(r, n, cat, "BabyActor_MalePlayer")
	self.AddRaceAddOnArrayToList(r, n, cat, "BabyArmor_Female")
	self.AddRaceAddOnArrayToList(r, n, cat, "BabyArmor_Male")
	self.AddRaceAddOnValue(r, n, cat, "ChanceToBecomePregnant")
	self.AddRaceAddOnValue(r, n, cat, "ContraceptionDuration")
	self.AddRaceAddOnValue(r, n, cat, "Duration_01_Follicular")
	self.AddRaceAddOnValue(r, n, cat, "Duration_02_Ovulation")
	self.AddRaceAddOnValue(r, n, cat, "Duration_03_Luteal")
	self.AddRaceAddOnValue(r, n, cat, "Duration_04_Menstruation")
	self.AddRaceAddOnValue(r, n, cat, "Duration_05_Trimester1")
	self.AddRaceAddOnValue(r, n, cat, "Duration_06_Trimester2")
	self.AddRaceAddOnValue(r, n, cat, "Duration_07_Trimester3")
	self.AddRaceAddOnValue(r, n, cat, "Duration_08_Recovery")
	self.AddRaceAddOnValue(r, n, cat, "Duration_10_SecondsBetweenLaborPains")
	self.AddRaceAddOnValue(r, n, cat, "Duration_11_SecondsBetweenBabySpawn")
	self.AddRaceAddOnValue(r, n, cat, "Duration_MaleSperm")
	self.AddRaceAddOnValue(r, n, cat, "Irregulation_Chance_Scale")
	self.AddRaceAddOnValue(r, n, cat, "Irregulation_Value_Scale")
	self.AddRaceAddOnValue(r, n, cat, "Max_CME_EffectScale")
	self.AddRaceAddOnValue(r, n, cat, "Multiple_Threshold_Chance")
	self.AddRaceAddOnValue(r, n, cat, "Multiple_Threshold_Max_Babys")
	self.AddRaceAddOnValue(r, n, cat, "Pain_Abortus")
	self.AddRaceAddOnValue(r, n, cat, "Pain_GivingBirth")
	self.AddRaceAddOnValue(r, n, cat, "Pain_LaborPains")
	self.AddRaceAddOnValue(r, n, cat, "Pain_Menstruation")
	self.AddRaceAddOnValue(r, n, cat, "Pain_Mittelschmerz")
	self.AddRaceAddOnValue(r, n, cat, "Pain_Phase_CyclePains")
	self.AddRaceAddOnValue(r, n, cat, "Pain_Phase_PregnantPains")
	self.AddRaceAddOnValue(r, n, cat, "Pain_PMS")
	self.AddRaceAddOnValue(r, n, cat, "PMS_ChanceScale")
	self.AddRaceAddOnValue(r, n, cat, "Size_Belly_Max")
	self.AddRaceAddOnValue(r, n, cat, "Size_Belly_Max_Multiple")
	self.AddRaceAddOnValue(r, n, cat, "Size_Breasts_Max")
	self.AddRaceAddOnValue(r, n, cat, "Size_Breasts_Max_Multiple")
	self.AddRaceAddOnValue(r, n, cat, "Sperm_Amount_Scale")
	self.AddRaceAddOnValue(r, n, cat, "Baby_Healing_Scale")
	self.AddRaceAddOnValue(r, n, cat, "Baby_Damage_Scale")
	self.AddRaceAddOnValue(r, n, cat, "Male_Recovery_Scale")
endFunction

Float function ActorSizeScaler(Int type, actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.RaceSizeScaler(type, a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function getRaceDuration_BabySpawn(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_11_SecondsBetweenBabySpawn", 1.00000)
	if result < 0.300000
		return 0.300000
	else
		return result
	endIf
endFunction

actor function OnSleepSexStop(actor p, actor aSexPartner)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			aSexPartner = Misc[i].OnSleepSexStart(p, aSexPartner)
		endIf
		i += 1
	endWhile
	return aSexPartner
endFunction

function ClearCMEAddOns()

	storageutil.FormListClear(none, "FW.AddOn.Always_FollicularPhase")
	storageutil.FormListClear(none, "FW.AddOn.Always_LaborPains")
	storageutil.FormListClear(none, "FW.AddOn.Always_LutealPhase")
	storageutil.FormListClear(none, "FW.AddOn.Always_Menstruation")
	storageutil.FormListClear(none, "FW.AddOn.Always_Ovulation")
	storageutil.FormListClear(none, "FW.AddOn.Always_PMS")
	storageutil.FormListClear(none, "FW.AddOn.Always_Recovery")
	storageutil.FormListClear(none, "FW.AddOn.Always_Trimester1")
	storageutil.FormListClear(none, "FW.AddOn.Always_Trimester2")
	storageutil.FormListClear(none, "FW.AddOn.Always_Trimester3")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_FollicularPhase")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_LaborPains")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_LutealPhase")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_Menstruation")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_Ovulation")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_PMS")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_Recovery")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_Trimester1")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_Trimester2")
	storageutil.FormListClear(none, "FW.AddOn.Sometimes_Trimester3")
endFunction

function ResetRaceAddOns(race r)

	if r != none
		storageutil.FormListClear(r as form, "FW.AddOn.BabyActor_Female")
		storageutil.FormListClear(r as form, "FW.AddOn.BabyActor_Male")
		storageutil.FormListClear(r as form, "FW.AddOn.BabyActor_FemalePlayer")
		storageutil.FormListClear(r as form, "FW.AddOn.BabyActor_MalePlayer")
		storageutil.FormListClear(r as form, "FW.AddOn.BabyArmor_Female")
		storageutil.FormListClear(r as form, "FW.AddOn.BabyArmor_Male")
		storageutil.SetIntValue(r as form, "FW.AddOn.DisablePregnancy", 0)
		storageutil.SetIntValue(r as form, "FW.AddOn.Female_Force_This_Baby", 0)
		storageutil.SetFloatValue(r as form, "FW.AddOn.ChanceToBecomePregnant", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.ContraceptionDuration", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_01_Follicular", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_02_Ovulation", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_03_Luteal", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_04_Menstruation", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_05_Trimester1", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_06_Trimester2", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_07_Trimester3", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_08_Recovery", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_10_SecondsBetweenLaborPains", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_11_SecondsBetweenBabySpawn", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Duration_MaleSperm", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Irregulation_Chance_Scale", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Irregulation_Value_Scale", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Max_CME_EffectScale", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Multiple_Threshold_Chance", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Multiple_Threshold_Max_Babys", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Pain_Abortus", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Pain_GivingBirth", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Pain_LaborPains", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Pain_Menstruation", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Pain_Mittelschmerz", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Pain_Phase_CyclePains", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Pain_Phase_PregnantPains", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Pain_PMS", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.PMS_ChanceScale", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Size_Belly_Max", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Size_Belly_Max_Multiple", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Size_Breasts_Max", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Size_Breasts_Max_Multiple", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Sperm_Amount_Scale", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Baby_Healing_Scale", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Baby_Damage_Scale", 1.00000)
		storageutil.SetFloatValue(r as form, "FW.AddOn.Male_Recovery_Scale", 1.00000)
	endIf
endFunction

Bool function OnAllowFFCum(actor WomanToAdd, actor denor)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			if Misc[i].OnAllowFFCum(WomanToAdd, denor)
				return true
			endIf
		endIf
		i += 1
	endWhile
	return false
endFunction

Bool function OnPlayPainSound(actor ActorRef, Float Strength)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			if Misc[i].OnPlayPainSound(ActorRef, Strength)
				return true
			endIf
		endIf
		i += 1
	endWhile
	return false
endFunction

; Skipped compiler generated GotoState

ObjectReference function OnGetBedRef(actor ActorRef)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			ObjectReference or = Misc[i].OnGetBedRef(ActorRef)
			if or != none
				return or
			endIf
		endIf
		i += 1
	endWhile
	return none
endFunction

function OnExitState(actor akFemale, Int iState)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnExitState(akFemale, iState)
		endIf
		i += 1
	endWhile
endFunction

function OnMimik(actor ActorRef, String ExpressionName, Int Strength, Bool bClear)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnMimik(ActorRef, ExpressionName, Strength, bClear)
		endIf
		i += 1
	endWhile
endFunction

Float function OnDoDamage(actor woman, Float amount, Int DamageType, Float OptionalArgument)

	Int i = 0
	Float xAmount = amount
	while i < iMisc
		if Misc[i] != none
			Float tamount = Misc[i].OnDoDamage(woman, xAmount, DamageType, OptionalArgument)
			if tamount >= 0.000000
				xAmount = tamount
			endIf
		endIf
		i += 1
	endWhile
	if xAmount >= 0.000000
		return xAmount
	else
		return 0.000000
	endIf
endFunction

function OnEnterState(actor akFemale, Int iState)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnEnterState(akFemale, iState)
		endIf
		i += 1
	endWhile
endFunction

function OnInit()

	Misc = new fwaddon_misc[128]
	sMisc = new String[128]
	self.OnGameLoad()
endFunction

function OnMagicEffectApply(actor akWoman, ObjectReference akCaster, MagicEffect akEffect)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnMagicEffectApply(akWoman, akCaster, akEffect)
		endIf
		i += 1
	endWhile
endFunction

function StartCamera()

	if usedCameraAddOn != none
		debug.Trace("There was a camera already running (" + usedCameraAddOn.GetName() + ") - camera stoped", 0)
		self.StopCamera()
	endIf
	fwaddon_misc[] cams = new fwaddon_misc[64]
	Int i = 0
	Int j = 0
	while i < iMisc && j < 64
		if Misc[i].HasCamera
			cams[j] = Misc[i]
			j += 1
		endIf
		i += 1
	endWhile
	if j <= 0
		
	elseIf j == 1
		usedCameraAddOn = cams[0]
	else
		Int camID = utility.RandomInt(1, j) - 1
		usedCameraAddOn = cams[camID]
	endIf
	if usedCameraAddOn != none
		debug.Trace("Using camera " + usedCameraAddOn.GetName() + " - start it", 0)
		usedCameraAddOn.StartCamera()
	endIf
endFunction

function OnDoDamageEnd(actor woman, Float amount, Int DamageType, Float OptionalArgument)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnDoDamageEnd(woman, amount, DamageType, OptionalArgument)
		endIf
		i += 1
	endWhile
endFunction

Float function RaceSpermAmountScale(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Sperm_Amount_Scale", 1.00000)
	if result < 0.300000
		return 0.300000
	else
		return result
	endIf
endFunction

Float function PMSChanceActorScale(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.PMSChanceRaceScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

function ClearMiscAddOns()

	Misc = new fwaddon_misc[128]
	sMisc = new String[128]
	bMisc = new Bool[128]
	iMisc = 0
endFunction

function RegisterChildPerk(FWChildSettings childSettings)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnRegisterChildPerk(childSettings)
		endIf
		i += 1
	endWhile
endFunction

Bool function CheckForCondome(actor woman, actor Man)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			if Misc[i].CheckForCondome(woman, Man) == true
				return true
			endIf
		endIf
		i += 1
	endWhile
	return false
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	if oldVersion < 20900
		
	endIf
endFunction

function ResetAllRaceAddOns()

	Int c = storageutil.FormListCount(none, "FW.AddOn.Races")
	while c > 0
		c -= 1
		race r = storageutil.FormListGet(none, "FW.AddOn.Races", c) as race
		self.ResetRaceAddOns(r)
	endWhile
endFunction

function OnImpregnate(actor woman, Int NumChildren, Actor[] ChildFathers)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnImpregnate(woman, NumChildren, ChildFathers)
		endIf
		i += 1
	endWhile
endFunction

Form[] function OnStripActor(actor ActorRef)

	Form[] fAll
	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Form[] f = Misc[i].OnStripActor(ActorRef)
			fAll = fwutility.FormArrayConcat(fAll, f)
		endIf
		i += 1
	endWhile
	return fAll
endFunction

function AddCME(String n, String valueName)

	String S = fwutility.getIniCString("AddOn", n, "AddOn", valueName, "")
	if S != ""
		String[] ss = stringutil.Split(S, ",")
		Int c = ss.length
		while c > 0
			c -= 1
			spell itm = fwutility.GetFormFromString(ss[c]) as spell
			if itm != none
				storageutil.FormListAdd(none, "FW.AddOn." + valueName, itm as form, true)
			endIf
		endWhile
	endIf
endFunction

function OnGiveBirthEnd(actor akMother)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnGiveBirthEnd(akMother)
		endIf
		i += 1
	endWhile
endFunction

function OnGiveBirthStart(actor akMother)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnGiveBirthStart(akMother)
		endIf
		i += 1
	endWhile
endFunction

Float function PregnancyChanceRaceScale(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.ChanceToBecomePregnantScale", 1.00000)
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

function OnLaborPain(actor akFemale)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnLaborPain(akFemale)
		endIf
		i += 1
	endWhile
endFunction

function removeCME(actor a, Int EffectID)

	if EffectID == -1
		fwutility.ActorRemoveSpellsS(a, "Always_FollicularPhase")
		fwutility.ActorRemoveSpellsS(a, "Always_Ovulation")
		fwutility.ActorRemoveSpellsS(a, "Always_LuthealPhase")
		fwutility.ActorRemoveSpellsS(a, "Always_PMS")
		fwutility.ActorRemoveSpellsS(a, "Always_Menstruation")
		fwutility.ActorRemoveSpellsS(a, "Always_Trimester1")
		fwutility.ActorRemoveSpellsS(a, "Always_Trimester2")
		fwutility.ActorRemoveSpellsS(a, "Always_Trimester3")
		fwutility.ActorRemoveSpellsS(a, "Always_LaborPains")
		fwutility.ActorRemoveSpellsS(a, "Always_Recovery")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_FollicularPhase")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Ovulation")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_LuthealPhase")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_PMS")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Menstruation")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Trimester1")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Trimester2")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Trimester3")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_LaborPains")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Recovery")
	elseIf EffectID == 0
		fwutility.ActorRemoveSpellsS(a, "Always_FollicularPhase")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_FollicularPhase")
	elseIf EffectID == 1
		fwutility.ActorRemoveSpellsS(a, "Always_Ovulation")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Ovulation")
	elseIf EffectID == 2
		fwutility.ActorRemoveSpellsS(a, "Always_LuthealPhase")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_LuthealPhase")
	elseIf EffectID == 3
		fwutility.ActorRemoveSpellsS(a, "Always_PMS")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_PMS")
	elseIf EffectID == 4
		fwutility.ActorRemoveSpellsS(a, "Always_Menstruation")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Menstruation")
	elseIf EffectID == 5
		fwutility.ActorRemoveSpellsS(a, "Always_Trimester1")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Trimester1")
	elseIf EffectID == 6
		fwutility.ActorRemoveSpellsS(a, "Always_Trimester2")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Trimester2")
	elseIf EffectID == 7
		fwutility.ActorRemoveSpellsS(a, "Always_Trimester3")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Trimester3")
	elseIf EffectID == 8
		fwutility.ActorRemoveSpellsS(a, "Always_LaborPains")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_LaborPains")
	elseIf EffectID == 9
		fwutility.ActorRemoveSpellsS(a, "Always_Recovery")
		fwutility.ActorRemoveSpellsS(a, "Sometimes_Recovery")
	endIf
endFunction

Float function PMSChanceRaceScale(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.PMS_ChanceScale", 1.00000)
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function getActorDuration_BabySpawn(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.getRaceDuration_BabySpawn(a.GetActorBase().GetRace())
	endIf
	if result < 0.300000
		return 0.300000
	else
		return result
	endIf
endFunction

function OnBabySpawn(actor akMother, actor akFather)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnBabySpawn(akMother, akFather)
		endIf
		i += 1
	endWhile
endFunction

Float function IrregulationValue(actor woman, Int state_number)

	Int i = 0
	Float result = 1.00000
	race RaceID = woman.GetLeveledActorBase().GetRace()
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Irregulation_Value_Scale", 1.00000)
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

function castCME(actor a, Int EffectID, Int NumEffects)

	if EffectID == 0
		fwutility.ActorAddSpellsS(a, "Always_FollicularPhase", false, false)
	elseIf EffectID == 1
		fwutility.ActorAddSpellsS(a, "Always_Ovulation", false, false)
	elseIf EffectID == 2
		fwutility.ActorAddSpellsS(a, "Always_LuthealPhase", false, false)
	elseIf EffectID == 3
		fwutility.ActorAddSpellsS(a, "Always_PMS", false, false)
	elseIf EffectID == 4
		fwutility.ActorAddSpellsS(a, "Always_Menstruation", false, false)
	elseIf EffectID == 5
		fwutility.ActorAddSpellsS(a, "Always_Trimester1", false, false)
	elseIf EffectID == 6
		fwutility.ActorAddSpellsS(a, "Always_Trimester2", false, false)
	elseIf EffectID == 7
		fwutility.ActorAddSpellsS(a, "Always_Trimester3", false, false)
	elseIf EffectID == 8
		fwutility.ActorAddSpellsS(a, "Always_LaborPains", false, false)
	elseIf EffectID == 9
		fwutility.ActorAddSpellsS(a, "Always_Recovery", false, false)
	endIf
	self.castCMEEffect(a, EffectID, NumEffects)
endFunction

Bool function RaceCanBecomePregnant(race RaceID)

	return storageutil.GetFloatValue(RaceID as form, "FW.AddOn.ChanceToBecomePregnantScale", 1.00000) == 1.00000
endFunction

actorbase function GetPlayerBabyActor(race ParentRace, Int Gender)

	actorbase m = none
	String sGender = "BabyActor_MalePlayer"
	if Gender == 1
		sGender = "BabyActor_FemalePlayer"
	endIf
	Int c = storageutil.FormListCount(ParentRace as form, "FW.AddOn." + sGender)
	if c > 0
		Int r = utility.RandomInt(0, c - 1)
		m = storageutil.FormListGet(ParentRace as form, "FW.AddOn." + sGender, r) as actorbase
		if m != none
			return m
		endIf
		while c > 0
			c -= 1
			m = storageutil.FormListGet(ParentRace as form, "FW.AddOn." + sGender, c) as actorbase
			if m != none
				return m
			endIf
		endWhile
	endIf
	return none
endFunction

actor function OnSleepSexStart(actor p, actor aSexPartner)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			aSexPartner = Misc[i].OnSleepSexStart(p, aSexPartner)
		endIf
		i += 1
	endWhile
	return aSexPartner
endFunction

Float function RaceMaxChance(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Multiple_Threshold_Chance", 1.00000)
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

function Clear(Int type)

	AddOnFolderHash = ""
	if math.LogicalAnd(type, 1) == 1
		self.ClearMiscAddOns()
	endIf
	if math.LogicalAnd(type, 2) == 2
		self.ClearRaceAddOns()
	endIf
	if math.LogicalAnd(type, 4) == 4
		self.ClearCMEAddOns()
	endIf
endFunction

function OnUpdateFunction(actor akFemale, Int iState, Float StatePercentage)

	Int i = 0
	while i < iMisc
		if Misc[i] != none
			Misc[i].OnUpdateFunction(akFemale, iState, StatePercentage)
		endIf
		i += 1
	endWhile
endFunction

Float function getRaceContraceptionDuration(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.ContraceptionDuration", 1.00000)
	if result < 1.00000
		return 1.00000
	elseIf result > 8.00000
		return 8.00000
	else
		return result
	endIf
endFunction

Float function ActorBabyDamageScale(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.RaceBabyDamageScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

; Skipped compiler generated GetState

Float function ActorMaleSpermDurationScale(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.RaceMaleSpermDurationScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Bool function ActorCanBecomePregnant(actor a)

	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		return self.RaceCanBecomePregnant(a.GetActorBase().GetRace())
	endIf
	return true
endFunction

function AddRaceAddOnCat(String n, String cat)

	String ids = fwutility.getIniCString("AddOn", n, cat, "id", "")
	if ids != ""
		String[] saRaces = stringutil.Split(ids, ",")
		Int c2 = saRaces.length
		while c2 > 0
			c2 -= 1
			race r = fwutility.GetFormFromString(saRaces[c2]) as race
			if r != none
				self.AddRaceAddOn(r, n, cat)
			endIf
		endWhile
	endIf
endFunction

Float function RaceBabyHealingScale(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Baby_Healing_Scale", 1.00000)
	if result < 0.300000
		return 0.300000
	else
		return result
	endIf
endFunction

Float function RaceBabyDamageScale(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Baby_Damage_Scale", 1.00000)
	if result < 0.300000
		return 0.300000
	else
		return result
	endIf
endFunction

Float function ActorMaxChance(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.RaceMaxChance(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function getRaceDamageScale(Int DamageType, race RaceID)

	Float result = 1.00000
	if DamageType == 0
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Mittelschmerz", 1.00000)
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Phase_CyclePains", 1.00000)
	elseIf DamageType == 1
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Mittelschmerz", 1.00000)
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Phase_CyclePains", 1.00000)
	elseIf DamageType == 2
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_PMS", 1.00000)
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Phase_CyclePains", 1.00000)
	elseIf DamageType == 3
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_LaborPains", 1.00000)
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Phase_PregnantPains", 1.00000)
	elseIf DamageType == 4
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOnPain_GivingBirthPain_PMS", 1.00000)
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Phase_PregnantPains", 1.00000)
	elseIf DamageType == 5
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Abortus", 1.00000)
		result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Pain_Phase_PregnantPains", 1.00000)
	endIf
	if result < 0.0500000
		return 0.0500000
	else
		return result
	endIf
endFunction

Float function PregnancyChanceActorScale(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.PMSChanceRaceScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function getActorDuration_BetweenLaborPains(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.getRaceDuration_BetweenLaborPains(a.GetActorBase().GetRace())
	endIf
	if result < 0.300000
		return 0.300000
	else
		return result
	endIf
endFunction

FWAddOn_Misc function GetMiscAddOn(String AddOnName)

	Int i = 0
	while i < iMisc
		if Misc[i].GetName() == AddOnName
			return Misc[i]
		endIf
		i += 1
	endWhile
endFunction

Float function RaceMaleSpermDurationScale(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Duration_MaleSperm", 1.00000)
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function ActorMaxBabse(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.RaceMaxBabse(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function getActorContraceptionDuration(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.getRaceContraceptionDuration(a.GetActorBase().GetRace())
	endIf
	if result < 1.00000
		return 1.00000
	else
		return result
	endIf
endFunction

function ClearRaceAddOns()

	Int c = storageutil.FormListCount(none, "FW.AddOn.Races")
	while c > 0
		c -= 1
		race r = storageutil.FormListGet(none, "FW.AddOn.Races", c) as race
		if r == none
			storageutil.FormListClear(r as form, "FW.AddOn.BabyActor_Female")
			storageutil.FormListClear(r as form, "FW.AddOn.BabyActor_Male")
			storageutil.FormListClear(r as form, "FW.AddOn.BabyActor_FemalePlayer")
			storageutil.FormListClear(r as form, "FW.AddOn.BabyActor_MalePlayer")
			storageutil.FormListClear(r as form, "FW.AddOn.BabyArmor_Female")
			storageutil.FormListClear(r as form, "FW.AddOn.BabyArmor_Male")
			storageutil.UnsetIntValue(r as form, "FW.AddOn.DisablePregnancy")
			storageutil.UnsetIntValue(r as form, "FW.AddOn.Female_Force_This_Baby")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.ChanceToBecomePregnant")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.ContraceptionDuration")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_01_Follicular")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_02_Ovulation")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_03_Luteal")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_04_Menstruation")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_05_Trimester1")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_06_Trimester2")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_07_Trimester3")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_08_Recovery")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_10_SecondsBetweenLaborPains")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_11_SecondsBetweenBabySpawn")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Duration_MaleSperm")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Irregulation_Chance_Scale")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Irregulation_Value_Scale")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Max_CME_EffectScale")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Multiple_Threshold_Chance")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Multiple_Threshold_Max_Babys")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Pain_Abortus")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Pain_GivingBirth")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Pain_LaborPains")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Pain_Menstruation")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Pain_Mittelschmerz")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Pain_Phase_CyclePains")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Pain_Phase_PregnantPains")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Pain_PMS")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.PMS_ChanceScale")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Size_Belly_Max")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Size_Belly_Max_Multiple")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Size_Breasts_Max")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Size_Breasts_Max_Multiple")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Sperm_Amount_Scale")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Baby_Healing_Scale")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Baby_Damage_Scale")
			storageutil.UnsetFloatValue(r as form, "FW.AddOn.Male_Recovery_Scale")
		endIf
	endWhile
	storageutil.UnsetFloatValue(none, "FW.AddOn.Races")
endFunction

Float function IrregulationChance(actor woman, Int state_number)

	Int i = 0
	Float result = 1.00000
	race RaceID = woman.GetLeveledActorBase().GetRace()
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Irregulation_Chance_Scale", 1.00000)
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function RaceMaxBabse(race RaceID)

	Float result = 1.00000
	result *= storageutil.GetFloatValue(RaceID as form, "FW.AddOn.Multiple_Threshold_Max_Babys", 1.00000)
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

Float function ActorMaleRecoveryScale(actor a)

	Float result = 1.00000
	if a as Bool && a.GetActorBase() as Bool && a.GetActorBase().GetRace() as Bool
		result *= self.RaceMaleRecoveryScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.100000
		return 0.100000
	else
		return result
	endIf
endFunction

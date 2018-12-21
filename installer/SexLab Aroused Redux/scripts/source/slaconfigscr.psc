Scriptname slaConfigScr extends SKI_ConfigBase  

Actor          Property slaMostArousedActorInLocation     Auto hidden
Actor          Property slaNakedActor                     Auto hidden
Actor          Property slaPuppetActor                    Auto
Bool           Property bDisabled             =    false  Auto Hidden
bool           Property femaleAnimation       =    false  Auto hidden
Bool           Property IsCloakEffect                     Auto
Bool           Property IsDesireSpell         =    false  Auto
Bool           Property IsExtendedNPCNaked                Auto
Bool           Property IsNakedOnly           =    true   Auto Hidden
Bool           Property IsUseSOS                          Auto
bool           Property maleAnimation         =    false  Auto hidden
bool           Property useLOS                =    false  Auto hidden
Bool           Property wantsPurging          =    false  Auto Hidden
Float          Property cellScanFreq          =    120.00 Auto hidden
Float          Property DefaultExposureRate   =    2.0    Auto hidden
Float          Property TimeRateHalfLife                  Auto hidden
Int            Property NotificationKey       =    44     Auto hidden
Int            Property SexOveruseEffect      =    5      Auto hidden
Int            Property slaArousalOfMostArousedActorInLoc Auto
Int[]          Property slaSlotMaskValues                 Auto hidden
Keyword        Property kArmorCuirass                     Auto
Keyword        Property kClothingBody                     Auto
slaInternalScr Property slaUtil                           Auto

Actor Player

; OIDs
Int UseSOSOID
Int CloakEffectOID
Int DesireSpellOID
Int ExbitionistOID
Int ExtendedNPCNakedOID
Int BlockArousalOID
Int LockArousalOID
Int TimeRateHalfLifeOID
Int SetExposureOID
Int DefaultExposureRateOID
Int ArousalExposureRateOID
Int NotificationKeyOID
Int GenderPreferenceOID
Int SetTimeRateOID
Int SexOveruseEffectOID
int cellScanFreqOID
int wantsPurgingOID
int maleAnimationOID
int femaleAnimationOID
int useLOSOID
int nakedOnlyOID
int bDisabledOID

Int[] EmptyIntArray
Int[] CurrentArmorListOID
String[] GenderPreferenceList
Form[] EmptyFormArray
Form[] DisplayedFormArray
slaMainScr slaMain 


Int Function GetVersion()
	return 28
EndFunction


Event OnVersionUpdate(int a_version)
	; a_version is the new version, CurrentVersion is the old version	
	If (((a_version >= 7) && (CurrentVersion < 7)) || (Pages.length < 4))
		;Debug.Trace(self + ": Updating MCM menus to version " + a_version)
		Pages = new string[4]
		Pages[0] = "$SLA_Settings"
		Pages[1] = "$SLA_Status"
		Pages[2] = "$SLA_PuppetMaster"
		Pages[3] = "$SLA_CurrentArmorList"
		
		GenderPreferenceList = new string[4]
		GenderPreferenceList[0] = "$SLA_Male"
		GenderPreferenceList[1] = "$SLA_Female"
		GenderPreferenceList[2] = "$SLA_Both"
		GenderPreferenceList[3] = "$SLA_UseSexLab"
		
		InitSlotMaskValues()
	EndIf
	if((CurrentVersion > 0) && (CurrentVersion < 28))
		debug.notification("Updating Aroused Redux to version " + GetVersion() + "...")
		sla_ConfigHelper helper = Quest.getQuest("sla_ConfigHelper") as sla_ConfigHelper
		helper.resetAllQuests()
;	else
;		debug.notification("Sexlab Aroused Redux version " + GetVersion() + "...")
	endif
EndEvent


event OnGameReload()
	slaMain = Quest.GetQuest("sla_Main") As slaMainScr
	slaMain.Maintenance()
    parent.OnGameReload() ; Don't forget to call the parent!
endEvent


Function ResetToDefault()
	;Debug.Trace(self + ": Reset to Default")

	slaUtil                           = Quest.GetQuest("sla_Internal") As slaInternalScr
	slaPuppetActor                    = Game.GetPlayer()
	slaNakedActor                     = None
	slaMostArousedActorInLocation     = None
	slaArousalOfMostArousedActorInLoc = 0
	IsCloakEffect                     = true
	IsDesireSpell                     = false
	IsUseSOS                          = false
	IsExtendedNPCNaked                = false
	TimeRateHalfLife                  = 2.0
	SexOveruseEffect                  = 5
	DefaultExposureRate               = 2.0
	NotificationKey                   = 44
	cellScanFreq                      = 120
	
	Pages = new string[4]
	Pages[0] = "$SLA_Settings"
	Pages[1] = "$SLA_Status"
	Pages[2] = "$SLA_PuppetMaster"
	Pages[3] = "$SLA_CurrentArmorList"
		
	GenderPreferenceList = new string[4]
	GenderPreferenceList[0] = "$SLA_Male"
	GenderPreferenceList[1] = "$SLA_Female"
	GenderPreferenceList[2] = "$SLA_Both"
	GenderPreferenceList[3] = "$SLA_UseSexLab"
		
	InitSlotMaskValues()
EndFunction


Event OnPageReset(string page)
	; Load custom logo in DDS format
	If (page == "")
		int xOffset = 376 - (284 / 2)
		LoadCustomContent("sexlabaroused.dds", xOffset, 0)
		return
	else
		UnloadCustomContent()
	EndIf
	
	If (page == "$SLA_Settings")
		slaMain = Quest.GetQuest("sla_Main") As slaMainScr
		cellScanFreq = slaMain.updateFrequency
		if(cellScanFreq < 10)
			cellScanFreq = 120
		endif
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddTextOption("$SLA_Version" , "" + GetVersion() + "(" + slaUtil.GetVersion() + ")", OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddHeaderOption("$SLA_General")
		NotificationKeyOID = AddKeyMapOption("$SLA_StatusKey", NotificationKey)
		DesireSpellOID = AddToggleOption("$SLA_EnableDesire", IsDesireSpell)
		;CloakEffectOID = AddToggleOption("$SLA_EnableCloak", IsCloakEffect)
		wantsPurgingOID = AddToggleOption("$SLA_WantsPurging", wantsPurging)
		maleAnimationOID = AddToggleOption("$SLA_EnableMaleAnimation", maleAnimation)
		femaleAnimationOID = AddToggleOption("$SLA_EnableFemaleAnimation", femaleAnimation)
		useLOSOID = AddToggleOption("$SLA_UseLOS", useLOS)
		nakedOnlyOID = AddToggleOption("$SLA_IsNakedOnly", IsNakedOnly)
		bDisabledOID = AddToggleOption("$SLA_Disabled", bDisabled)
		ExtendedNPCNakedOID = AddToggleOption("$SLA_ExtendedNPCNaked", IsExtendedNPCNaked)
		UseSOSOID = AddToggleOption("$SLA_EnableSOS", IsUseSOS)
		SetCursorPosition(1) ; Move cursor to top right position
		AddHeaderOption("$SLA_Arousal")
		DefaultExposureRateOID = AddSliderOption("$SLA_DefaultExposureRate", DefaultExposureRate, "{1}")
		TimeRateHalfLifeOID = AddSliderOption("$SLA_TimeRateHalfLife", TimeRateHalfLife, "{1}")
		SexOveruseEffectOID = AddSliderOption("$SLA_SexOverUseEffect", SexOveruseEffect, "{0}")
		cellScanFreqOID = AddSliderOption("$SLA_CellScanFreq", cellScanFreq, "{0}")
	ElseIf (page == "$SLA_Status")
		SetCursorFillMode(TOP_TO_BOTTOM)
		DisplayActorStatus(Game.GetPlayer())
		SetCursorPosition(1) ; Move cursor to top right position
		If (slaPuppetActor != Game.GetPlayer() && slaPuppetActor != None)
			DisplayActorStatus(slaPuppetActor)
		ElseIf (slaMostArousedActorInLocation != None)
			DisplayActorStatus(slaMostArousedActorInLocation)
		EndIf
	ElseIf (page == "$SLA_PuppetMaster")
		SetCursorFillMode(TOP_TO_BOTTOM)
		DisplayPuppetMaster(slaPuppetActor)
	ElseIf (page == "$SLA_CurrentArmorList")
		SetCursorFillMode(TOP_TO_BOTTOM)
		CurrentArmorListOID = EmptyIntArray
		DisplayedFormArray = EmptyFormArray
		DisplayListOfWornItems(Game.GetPlayer())
		SetCursorPosition(1) ; Move cursor to top right position
		If (slaPuppetActor != Game.GetPlayer() && slaPuppetActor != None)
			DisplayListOfWornItems(slaPuppetActor)
		ElseIf (slaMostArousedActorInLocation != None)
			DisplayListOfWornItems(slaMostArousedActorInLocation)
		EndIf
	EndIf
EndEvent


Function DisplayActorStatus(Actor akRef)
	;Debug.Trace(self + "Reset Actor Status")
	If (akRef == None)
		AddHeaderOption("$SLA_NoneActor")
		return
	EndIf
	AddHeaderOption(akRef.GetLeveledActorBase().GetName())
	AddTextOption("$SLA_ArousalLevel", slaUtil.GetActorArousal(akRef), OPTION_FLAG_DISABLED)
	AddTextOption("$SLA_Exposure", slaUtil.GetActorExposure(akRef), OPTION_FLAG_DISABLED)
	AddTextOption("$SLA_ExposureRate", slaUtil.GetActorExposureRate(akRef), OPTION_FLAG_DISABLED)
	Float timeRate = slaUtil.GetActorTimeRate(akRef)
	Float timeSinceLastSex = slaUtil.GetActorDaysSinceLastOrgasm(akRef)
	Float timeArousal = timeSinceLastSex * timeRate;
	AddTextOption("$SLA_ArousalTimeCalc", timeArousal as Int, OPTION_FLAG_DISABLED)
	AddTextOption("$SLA_HoursSinceSex", timeSinceLastSex, OPTION_FLAG_DISABLED)
	AddTextOption("$SLA_TimeRate", timeRate, OPTION_FLAG_DISABLED)
	Int genderPreference = slaUtil.GetGenderPreference(akRef)
	AddTextOption("$SLA_GenderPreference", GenderPreferenceList[genderPreference], OPTION_FLAG_DISABLED)
EndFunction


Function DisplayPuppetMaster(Actor akRef)
	;Debug.Trace(self + ": Display puppet master")
	If (akRef == None)
		AddHeaderOption("$SLA_NoneActor")
		return
	EndIf
	AddHeaderOption(akRef.GetLeveledActorBase().GetName())
	bool BlockArousal = slaUtil.IsActorArousalBlocked(akRef)
	BlockArousalOID = AddToggleOption("$SLA_ArousalBlocked", BlockArousal)
	bool LockArousal = slaUtil.IsActorArousalLocked(akRef)
	LockArousalOID = AddToggleOption("$SLA_ArousalLocked", LockArousal)
	int exposure = slaUtil.GetActorExposure(akRef)
	SetExposureOID = AddSliderOption("$SLA_Exposure", exposure, "{0}")
	Float ArousalExposureRate = slaUtil.GetActorExposureRate(akRef)
	ArousalExposureRateOID = AddSliderOption("$SLA_ExposureRate", ArousalExposureRate, "{1}")
	Float timeRate = slaUtil.GetActorTimeRate(akRef)
	SetTimeRateOID = AddSliderOption("$SLA_TimeRate", timeRate, "{0}")
	Int genderPreference = slaUtil.GetGenderPreference(akRef, True)
	GenderPreferenceOID = AddMenuOption("$SLA_GenderPreference", GenderPreferenceList[genderPreference])
	bool IsExbitionist = slaUtil.IsActorExhibitionist(akRef)
	ExbitionistOID = AddToggleOption("$SLA_IsExhibitionist", IsExbitionist)	
EndFunction


Function DisplayListOfWornItems(Actor akRef)
	If (akRef == None)
		AddHeaderOption("$SLA_NoneActor")
		return
	EndIf
	Form[] equipedArmorList = GetEquippedArmors(akRef)
	AddHeaderOption(akRef.GetLeveledActorBase().GetName() + " Items")
	Int i = 0
	While (i < equipedArmorList.length)
		Form item = equipedArmorList[i]
		If (item.HasKeyword(kArmorCuirass) || item.HasKeyword(kClothingBody))
			int tmpOID = -1
			Int res = StorageUtil.GetIntValue(item, "SLAroused.IsNakedArmor", 0)
			If (res > 0)
				tmpOID = AddToggleOption(item.GetName(), true)
			Else
				tmpOID = AddToggleOption(item.GetName(), false)
			EndIf
			CurrentArmorListOID = sslUtility.PushInt(tmpOID, CurrentArmorListOID)
			DisplayedFormArray = sslUtility.PushForm(item, DisplayedFormArray)
		EndIf
		i += 1
	EndWhile
EndFunction


Event OnOptionMenuOpen(int option)
	;Debug.Trace(self + ": On OptionMenu Open")
	if (option == GenderPreferenceOID)
		Int genderPreference = slaUtil.GetGenderPreference(slaPuppetActor, True)
		SetMenuDialogOptions(GenderPreferenceList)
		SetMenuDialogStartIndex(genderPreference)
		SetMenuDialogDefaultIndex(1)
	endIf
EndEvent


Event OnOptionMenuAccept(int option, int index)
	;Debug.Trace(self + ": On OptionMenu Accept")
	if (option == GenderPreferenceOID)
		slaUtil.SetGenderPreference(slaPuppetActor, index)
		SetMenuOptionValue(GenderPreferenceOID, GenderPreferenceList[index])
	endIf
EndEvent


Event OnOptionSelect(int option)
	;Debug.Trace(self + ": On OptionMenu Select")
	int armorId = CurrentArmorListOID.Find(option)
	Actor akRef = slaPuppetActor
		
	If (option == wantsPurgingOID)
		wantsPurging = !wantsPurging
		SetToggleOptionValue(wantsPurgingOID, wantsPurging)
		if(wantsPurging)
			slaMain = Quest.GetQuest("sla_Main") As slaMainScr
			slaMain.startCleaning()
		endif
	ElseIf (option == DesireSpellOID)
		IsDesireSpell = !IsDesireSpell
		SetToggleOptionValue(DesireSpellOID, IsDesireSpell)
		
	ElseIf (option == useLOSOID)
		useLOS = !useLOS
		SetToggleOptionValue(useLOSOID, useLOS)
		;;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.setUseLOS(useLOS as Int)

	ElseIf (option == nakedOnlyOID)
		IsNakedOnly = !IsNakedOnly
		SetToggleOptionValue(nakedOnlyOID, IsNakedOnly)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.setNakedOnly(IsNakedOnly as Int)

	ElseIf (option == bDisabledOID)
		bDisabled = !bDisabled
		SetToggleOptionValue(bDisabledOID, bDisabled)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		int iDisabled = bDisabled as Int
		slaMain.setDisabled(iDisabled)
		
	ElseIf (option == femaleAnimationOID)
		femaleAnimation = !femaleAnimation
		SetToggleOptionValue(femaleAnimationOID, femaleAnimation)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.SetIsAnimatingFemales(femaleAnimation as Int)
		
	ElseIf (option == maleAnimationOID)
		maleAnimation = !maleAnimation
		SetToggleOptionValue(maleAnimationOID, maleAnimation)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.SetIsAnimatingMales(maleAnimation as Int)

	ElseIf (option == UseSOSOID)
		IsUseSOS = !IsUseSOS
		SetToggleOptionValue(UseSOSOID, IsUseSOS)
		
	ElseIf (option == ExtendedNPCNakedOID)
		IsExtendedNPCNaked = !IsExtendedNPCNaked
		SetToggleOptionValue(ExtendedNPCNakedOID, IsExtendedNPCNaked)
		
	ElseIf (option == ExbitionistOID)
		bool IsExbitionist = !slaUtil.IsActorExhibitionist(akRef)
		SetToggleOptionValue(ExbitionistOID, IsExbitionist)		
		slaUtil.SetActorExhibitionist(akRef, IsExbitionist)

	ElseIf (option == BlockArousalOID)
		bool BlockArousal = !slaUtil.IsActorArousalBlocked(akRef)
		SetToggleOptionValue(BlockArousalOID, BlockArousal)
		slaUtil.SetActorArousalBlocked(akRef, BlockArousal)
	
	ElseIf (option == LockArousalOID)
		bool LockArousal = !slaUtil.IsActorArousalLocked(akRef)
		SetToggleOptionValue(LockArousalOID, LockArousal)
		slaUtil.SetActorArousalLocked(akRef, LockArousal)
		
	ElseIf (armorId >= 0)
		Form item = DisplayedFormArray[armorId]
		Int res = StorageUtil.GetIntValue(item, "SLAroused.IsNakedArmor", 0)
	
		If (res > 0)
			StorageUtil.SetIntValue(item, "SLAroused.IsNakedArmor", 0)
			SetToggleOptionValue(option, False)
		Else
			StorageUtil.SetIntValue(item, "SLAroused.IsNakedArmor", 1)
			SetToggleOptionValue(option, True)
		EndIf
		;;TODO set a flag to reset the formlist holding naked armors
	EndIf
EndEvent


Event OnOptionSliderOpen(int option)		
	Actor akRef = slaPuppetActor
		;Debug.Trace(self + ": OnOptionSliderOpen")
	
	If (option == TimeRateHalfLifeOID)
		SetSliderDialogStartValue(TimeRateHalfLife as Float)
		SetSliderDialogDefaultValue(2.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)
		
	ElseIf (option == cellScanFreqOID)
		SetSliderDialogStartValue(cellScanFreq as Float)
		SetSliderDialogDefaultValue(120.0)
		SetSliderDialogRange(15.0, 300.0)
		SetSliderDialogInterval(5.0)

	ElseIf (option == SexOveruseEffectOID)
		SetSliderDialogStartValue(SexOveruseEffect as Float)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == DefaultExposureRateOID)
		SetSliderDialogStartValue(DefaultExposureRate)
		SetSliderDialogDefaultValue(2.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)
		
	ElseIf (option == SetTimeRateOID)
		float addiction = slaUtil.GetActorTimeRate(akRef)
		SetSliderDialogStartValue(addiction)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
		
	ElseIf (option == ArousalExposureRateOID)
		float ArousalExposureRate = slaUtil.GetActorExposureRate(akRef)
		SetSliderDialogStartValue(ArousalExposureRate)
		SetSliderDialogDefaultValue(2.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)

	ElseIf (option == SetExposureOID)
		int exposure = slaUtil.GetActorExposure(akRef)
		SetSliderDialogStartValue(exposure)
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, slaUtil.slaArousalCap)
		SetSliderDialogInterval(1)
		
	EndIf
EndEvent


Event OnOptionSliderAccept(int option, float value)		
	Actor akRef = slaPuppetActor
		
		;Debug.Trace(self + ": OnOptionSliderAccept")
	If (option == TimeRateHalfLifeOID)
		TimeRateHalfLife = value
		SetSliderOptionValue(option, value, "{1}")

	ElseIf (option == cellScanFreqOID)
		cellScanFreq = value as Int
		SetSliderOptionValue(option, value, "{0}")
		slaMain.updateFrequency = cellScanFreq
		debug.trace("Setting update frequency to " + cellScanFreq)

	ElseIf (option == SexOveruseEffectOID)
		SexOveruseEffect = value as Int
		SetSliderOptionValue(option, value, "{0}")

	ElseIf (option == DefaultExposureRateOID)
		DefaultExposureRate = value
		SetSliderOptionValue(option, value, "{1}")
		
	ElseIf (option == ArousalExposureRateOID)
		slaUtil.SetActorExposureRate(akRef, value)
		SetSliderOptionValue(option, value, "{1}")
		
	ElseIf (option == SetTimeRateOID)
		slaUtil.SetActorTimeRate(akRef, value as Int)
		SetSliderOptionValue(option, value, "{0}")	

	ElseIf (option == SetExposureOID)
		slaUtil.SetActorExposure(akRef, value as int)
		SetSliderOptionValue(option, value, "{0}")		
		
	EndIf
EndEvent


event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)
	bool continue = true
	; Check for conflict
	if conflictControl != ""
		string msg
		if conflictName != ""
			msg = "This key is already mapped to:\n'" + conflictControl + "'\n(" + conflictName + ")\n\nAre you sure you want to continue?"
		else
			msg = "This key is already mapped to:\n'" + conflictControl + "'\n\nAre you sure you want to continue?"
		endIf
		continue = ShowMessage(msg, true, "Yes", "No")
	endIf
	; Set allowed key change
	if continue
		if option == NotificationKeyOID
			NotificationKey = keyCode			
		endIf
		; Set MCM value
		SetKeymapOptionValue(option, keyCode)
	endIf
endEvent


Event OnOptionHighlight(int option)
	If (option == wantsPurgingOID)
		SetInfoText("$SLA_WantsPurgingDesc")
		
	ElseIf (option == useLOSOID)
		SetInfoText("$SLA_UseLOSdDesc")

	ElseIf (option == nakedOnlyOID)
		SetInfoText("$SLA_IsNakedOnlyDesc")

	ElseIf (option == bDisabledOID)
		SetInfoText("$SLA_DisabledDesc")

	ElseIf (option == femaleAnimationOID)
		SetInfoText("$SLA_EnableFemaleAnimationDesc")
		
	ElseIf (option == maleAnimationOID)
		SetInfoText("$SLA_EnableMaleAnimationDesc")

	ElseIf (option == DesireSpellOID)
		SetInfoText("$SLA_InfoDesire")
		
	ElseIf (option == UseSOSOID)
		SetInfoText("$SLA_InfoEnableSOS")
		
	ElseIf (option == cellScanFreqOID)
		SetInfoText("$SLA_InfoCellScanFreq")
				
	ElseIf (option == ExtendedNPCNakedOID)
		SetInfoText("$SLA_InfoExtendedNPCNaked")
				
	ElseIf (option == TimeRateHalfLifeOID)
		SetInfoText("$SLA_InfoTimeRateHalfLife")
		
	ElseIf (option == SexOveruseEffectOID)
		SetInfoText("$SLA_InfoSexOverUseEffect")

	ElseIf (option == DefaultExposureRateOID)
		SetInfoText("$SLA_InfoDefaultExposureRate")
		
	ElseIf (option == ArousalExposureRateOID)
		SetInfoText("$SLA_InfoExposureRate")
		
	ElseIf (option == SetTimeRateOID)
		SetInfoText("$SLA_InfoTimeRate")
	
	ElseIf (option == NotificationKeyOID)
		SetInfoText("$SLA_InfoStatusKey")
	
	ElseIf (option == ExbitionistOID)
		SetInfoText("$SLA_InfoIsExhibitionist")
		
	ElseIf (option == BlockArousalOID)
		SetInfoText("$SLA_InfoBlockedArousal")
		
	ElseIf (option == LockArousalOID)
		SetInfoText("$SLA_InfoLockedArousal")

	ElseIf (option == SetExposureOID)
		SetInfoText("$SLA_InfoSetExposure")

	ElseIf (CurrentArmorListOID.find(option) >= 0)
		SetInfoText("$SLA_InfoCurrentItems")
		
	ElseIf (option == GenderPreferenceOID)
		SetInfoText("$SLA_InfoGenderPreference")

	EndIf
EndEvent


Event OnOptionDefault(int option)
	Actor akRef = slaPuppetActor
	;Debug.Trace(self + ": OnOptionDefault")
	If (option == wantsPurgingOID)
		wantsPurging = false ; default value
		SetToggleOptionValue(wantsPurgingOID, wantsPurging)
	ElseIf (option == useLOSOID)
		useLOS = true
		SetToggleOptionValue(useLOSOID, useLOS)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.setUseLOS(useLOS as Int)
	ElseIf (option == femaleAnimationOID)
		femaleAnimation = false
		SetToggleOptionValue(femaleAnimationOID, femaleAnimation)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.SetIsAnimatingFemales(femaleAnimation as Int)
	ElseIf (option == maleAnimationOID)
		maleAnimation = false
		SetToggleOptionValue(maleAnimationOID, maleAnimation)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.SetIsAnimatingMales(maleAnimation as Int)
	ElseIf (option == DesireSpellOID)
		IsDesireSpell = false ; default value
		SetToggleOptionValue(DesireSpellOID, IsDesireSpell)
	ElseIf (option == nakedOnlyOID)
		IsNakedOnly = true ; default value
		SetToggleOptionValue(nakedOnlyOID, IsNakedOnly)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.setNakedOnly(IsNakedOnly as Int)
	ElseIf (option == bDisabledOID)
		bDisabled = false ; default value
		SetToggleOptionValue(bDisabledOID, bDisabled)
		;slaMainScr pslaMainScr = Quest.getQuest("sla_Main") as slaMainScr
		slaMain.setDisabled(bDisabled as Int)
	ElseIf (option == UseSOSOID)
		IsUseSOS = false ; default value
		SetToggleOptionValue(UseSOSOID, IsUseSOS)
	ElseIf (option == ExtendedNPCNakedOID)
		IsExtendedNPCNaked = false ; default value
		SetToggleOptionValue(ExtendedNPCNakedOID, IsExtendedNPCNaked)
	ElseIf (option == TimeRateHalfLifeOID)
		TimeRateHalfLife = 2.0 ; default value
		SetSliderOptionValue(TimeRateHalfLifeOID, 2.0, "{1}")
	ElseIf (option == cellScanFreqOID)
		cellScanFreq = 120.0 ; default value
		SetSliderOptionValue(cellScanFreqOID, cellScanFreq, "{1}")
	ElseIf (option == SexOveruseEffectOID)
		SexOveruseEffect = 5 ; default value
		SetSliderOptionValue(SexOveruseEffectOID, 5.0, "{0}")
	ElseIf (option == DefaultExposureRateOID)
		DefaultExposureRate = 2.0 ; default value
		SetSliderOptionValue(DefaultExposureRateOID, DefaultExposureRate, "{1}")
	ElseIf (option == ArousalExposureRateOID)
		slaUtil.SetActorExposureRate(akRef, -200.0)
		SetSliderOptionValue(ArousalExposureRateOID, slaUtil.GetActorExposureRate(akRef), "{1}")
	ElseIf (option == SetTimeRateOID)
		slaUtil.SetActorTimeRate(akRef, 10)
		SetSliderOptionValue(SetTimeRateOID, 10.0, "{0}")
	ElseIf (option == SetExposureOID)
		int exposure = 0 ; default value
		slaUtil.SetActorExposure(akRef, exposure)
		SetSliderOptionValue(SetExposureOID, exposure, "{0}")
	ElseIf (option == NotificationKeyOID)
		NotificationKey = 44 ; default value
		SetKeymapOptionValue(option, NotificationKey)
	ElseIf (option == ExbitionistOID)
		bool IsExbitionist = false ; default value
		slaUtil.SetActorExhibitionist(akRef, IsExbitionist)
		SetToggleOptionValue(ExbitionistOID, IsExbitionist)
	ElseIf (option == BlockArousalOID)
		bool BlockArousal = false ; default value
		SetToggleOptionValue(BlockArousalOID, BlockArousal)
		slaUtil.SetActorArousalBlocked(akRef, BlockArousal)
	ElseIf (option == GenderPreferenceOID)
		slaUtil.SetGenderPreference(slaPuppetActor, -2)
		int genderPreference = slaUtil.GetGenderPreference(slaPuppetActor, True)
		SetMenuOptionValue(GenderPreferenceOID, GenderPreferenceList[genderPreference])
	EndIf
EndEvent


Event OnConfigClose()
	;Debug.Trace(self + ": OnConfigclose")
	slaUtil.slaMain.UpdateDesireSpell()
	slaUtil.slaMain.UpdateCloakEffect()
	slaUtil.slaMain.UpdateKeyRegistery()
	slaUtil.slaMain.setUpdateFrequency(cellScanFreq)
EndEvent


Form[] Function RemoveForm(Form item, Form[] itemList)
	Form[] newList
	int i = 0
	While (i < itemList.length)
		If (itemList[i] != item)
			newList = sslUtility.PushForm(itemList[i], newList)
		EndIf
		i += 1
	EndWhile
	return newList
EndFunction


Function InitSlotMaskValues()
	; Set slot mask values
	slaSlotMaskValues = new int[31]
	int index = 0
	int slotMaskId = 1
	While index < slaSlotMaskValues.Length
		slaSlotMaskValues[index] = slotMaskId
		slotMaskId = 2 * slotMaskId
		index += 1
	EndWhile
EndFunction


Form[] Function GetEquippedArmors(Actor akRef)
	Form[] armorList
	If (akRef == None)
		return armorList
	EndIf
	int index = 0
	While index < slaSlotMaskValues.length
		Form tmpForm = akRef.GetWornForm(slaSlotMaskValues[index])
		If (tmpForm != None)
			If (armorList.Find(tmpForm) < 0)
				armorList = sslUtility.PushForm(tmpForm, armorList)
			EndIf
		EndIf
		index += 1
	EndWhile
	return armorList
EndFunction

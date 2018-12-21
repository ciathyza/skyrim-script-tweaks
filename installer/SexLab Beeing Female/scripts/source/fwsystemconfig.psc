Scriptname FWSystemConfig extends SKI_ConfigBase  

import FWUtility

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

FWSystem       Property System  Auto
FWTextContents property Content auto

int property FW_MENU_PAGE_Settings		=  0 autoreadonly
int property FW_MENU_PAGE_Cycle			=  1 autoreadonly
int property FW_MENU_PAGE_Pregnancy		=  2 autoreadonly
int property FW_MENU_PAGE_Impregnate	=  3 autoreadonly
int property FW_MENU_PAGE_Male			=  4 autoreadonly
int property FW_MENU_PAGE_Children		=  5 autoreadonly
int property FW_MENU_PAGE_AddOn			=  6 autoreadonly
int property FW_MENU_PAGE_Info			=  7 autoreadonly
int property FW_MENU_PAGE_Cheat			=  8 autoreadonly
int property FW_MENU_PAGE_System		=  9 autoreadonly

; General settings
bool Property CreatureSperm    = true  Auto Hidden
bool Property PlayAnimations   = true  Auto hidden
bool Property PlayerTimer      = true  Auto Hidden
bool Property RelevantFollower = true  Auto Hidden
bool Property RelevantNPC      = true  Auto Hidden
bool Property RelevantPlayer   = true  Auto Hidden
int  Property Difficulty       = 2     Auto Hidden
int  Property KeyStateWidget   = 44    Auto Hidden
int  Property Messages         = 3     Auto Hidden

; Menstual Cycle & Conception Element values
float Property ConceiveChance         = 40.0 Auto Hidden
float Property ConceiveChanceFollower = 40.0 Auto Hidden
float Property ConceiveChanceNPC      = 40.0 Auto Hidden
float property irregulationChance     = 9.0  auto hidden
float Property MenstrualCramps        = 35.0 Auto Hidden
float Property PMSChance              = 25.0 Auto Hidden
float Property WashOutChance          = 0.00 Auto Hidden
float Property WashOutFluidChance     = 0.75 Auto Hidden
float Property WashOutHourDelay       = 0.25 Auto Hidden
float Property WashOutWaterChance     = 0.02 Auto Hidden
int   Property FollicularDuration     = 5    Auto Hidden
int   Property LutealDuration         = 5    Auto Hidden
int   Property MenstrualDuration      = 2    Auto Hidden
int   Property OvulationDuration      = 2    Auto Hidden
int   Property PMSEffects             = 6    Auto Hidden

; Pregnancy Element values
;int  Property BirthCamera       = 0    Auto Hidden
bool  property abortus           = true auto hidden
bool  property BellyScale        = true auto Hidden
bool  property BreastScale       = true auto Hidden
float Property BellyMaxScale     = 4.2  Auto Hidden
float Property BreastsMaxScale   = 0.4  Auto Hidden
int   Property BabySpawn         = 2    Auto Hidden
int   Property BabySpawnNPC      = 2    Auto Hidden
int   Property MaxBabys          = 3    Auto Hidden
int   Property MultipleThreshold = 85   Auto Hidden
int   Property ReplanishDuration = 30   Auto Hidden
int   Property Trimster1Duration = 10   Auto Hidden
int   Property Trimster2Duration = 10   Auto Hidden
int   Property Trimster3Duration = 10   Auto Hidden
int   Property VisualScaling     = 1    Auto Hidden
int   Property VisualScalingKind = 0    Auto Hidden
int   Property WeightGainMax     = 50   Auto Hidden

; NPC
bool Property NPCBornChild         = false Auto Hidden
bool Property NPCCanBecomePregnant = true  Auto Hidden
bool Property NPCFeelPain          = false Auto Hidden
bool Property NPCHaveItems         = false Auto Hidden
bool Property NPCMenstrualMood     = true  Auto Hidden
bool Property NPCMenstrualNoTalk   = true  Auto Hidden
bool Property NPCMenstruationBlood = true  Auto Hidden

; Children
bool property ChildrenMayCry = false auto hidden

; Impregnation
bool property ImpregnateActive         = true  auto hidden
bool property ImpregnateAffairs        = true  auto hidden
bool property ImpregnateHusband        = true  auto hidden
bool property ImpregnateLastNPC        = false auto hidden
bool property ImpregnateLastPlayerNPCs = true  auto hidden
bool property ImpregnateLoreFriendly   = true  auto hidden
bool property ImpregnatePartners       = true  auto hidden
bool property ImpregnatePlayerAmbient  = false auto hidden
bool property ImpregnatePlayerFollower = true  auto hidden
bool property ImpregnatePlayerHusband  = true  auto hidden
bool property ImpregnatePlayerSleep    = true  auto hidden
bool property ImpregnatePlayerSpouse   = false auto hidden
int  property ImpregnateCount          = 10    auto hidden
int  property ImpregnatePlayerChance   = 30    auto hidden
int  property ImpregnateTime           = 3     auto hidden ; 3:00 AM

; Males
float Property MaleVirilityRecovery = 1.0 Auto Hidden
float Property SpermDuration        = 2.0 Auto Hidden
int   property NoVaginalCumChance   = 3   auto hidden

; Cheat
bool  property UpdateIntervalEnabled = true auto hidden
float property UpdateInterval        = 30.0 auto hidden

; System
string property WidgetProfile = "default.ini" auto hidden


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

int AddOnActiveCME        = -1
int AddOnActiveMisc       = -1
int AddOnActiveRaces      = -1
int AddOnActiveRacesGroup = -1
int UI_Activator
int UI_AddOnBack
int[] UI_AddOnCME
int[] UI_AddOnMisc
int[] UI_AddOnPMS
int[] UI_AddOnRaces
int[] UI_Child
int[] UI_Compatible
int[] UI_SpermInside
string[] UIS_AddOnCME
string[] UIS_AddOnMisc
string[] UIS_AddOnRaces
string[] UIS_AddOnRacesGroup


; -------------------------------------------------------------------------------------------------
; Variables Default Values
; -------------------------------------------------------------------------------------------------

; General settings
bool CreatureSpermDef    = true
bool PlayAnimationsDef   = true
bool PlayerTimerDef      = true
bool RelevantFollowerDef = true
bool RelevantNPCDef      = true
bool RelevantPlayerDef   = true
int DifficultyDef        = 2
int KeyStateWidgetDef    = 44
int MessagesDef          = 3

; Menstual Cycle & Conception Element Default values
bool bMenstruationBloodDef      = true
float ConceiveChanceDef         = 40.0
float ConceiveChanceFollowerDef = 40.0
float ConceiveChanceNPCDef      = 40.0
float irregulationChanceDef     = 4.0
float MaleVirilityRecoveryDef   = 1.0
float MenstrualCrampsDef        = 35.0
float PMSChanceDef              = 25.0
float SpermDurationDef          = 2.0
int FollicularDurationDef       = 5;11
int LutealDurationDef           = 5;9
int MenstrualDurationDef        = 2;4
int NoVaginalCumChanceDef       = 3
int OvulationDurationDef        = 2;4
int PMSEffectsDef               = 6

; Pregnancy Element Default values
;int BirthCameraDef         = 0
bool  BellyScaleDef         = true
bool  BreastScaleDef        = true
bool abortusDef             = true
float BellyMaxScaleDef      = 4.2
float BreastsMaxScaleDef    = 0.4
float WashOutChanceDef      = 0.0
float WashOutFluidChanceDef = 0.6
float WashOutHourDelayDef   = 0.25
float WashOutWaterChanceDef = 0.1
int BabySpawnDef            = 2
int BabySpawnNPCDef         = 2
int MaxBabysDef             = 3
int MultipleThresholdDef    = 85 ; 1 : n
int ReplanishDurationDef    = 10
int Trimster1DurationDef    = 10
int Trimster2DurationDef    = 10
int Trimster3DurationDef    = 10
int VisualScalingDef        = 1
int VisualScalingKindDef    = 0
int WeightGainMaxDef        = 50

; NPC
bool NPCBornChildDef         = false
bool NPCCanBecomePregnantDef = true
bool NPCFeelPainDef          = false
bool NPCHaveItemsDef         = false
bool NPCMenstrualMoodDef     = true
bool NPCMenstrualNoTalkDef   = true
bool NPCMenstruationBloodDef = true

; Children
bool ChildrenMayCryDef = false

; Impregnate
bool ImpregnateActiveDef         = true
bool ImpregnateAffairsDef        = true
bool ImpregnateHusbandDef        = true
bool ImpregnateLastNPCDef        = false
bool ImpregnateLastPlayerNPCsDef = true
bool ImpregnateLoreFriendlyDef   = true
bool ImpregnatePartnersDef       = true
bool ImpregnatePlayerAmbientDef  = false
bool ImpregnatePlayerFollowerDef = true
bool ImpregnatePlayerHusbandDef  = true
bool ImpregnatePlayerSleepDef    = true
bool ImpregnatePlayerSpouseDef   = false
int ImpregnateCountDef           = 10
int ImpregnatePlayerChanceDef    = 30
int ImpregnateTimeDef            = 3

bool UpdateIntervalEnabledDef = true
float UpdateIntervalDef       = 30.0
string WidgetProfileDef       = "default.ini"


;---------------------------------------------
; Element Enable / Disable
;---------------------------------------------

bool property bChangeDuration  = true auto hidden
bool property bForceMenu       = false auto hidden
bool property bPlayerInfoSpell = true auto hidden

String[] BabySpawnHighlightTexts
String[] BabySpawnOptions
string[] CompatibleHighlightTexts
string[] CompatibleOptions
String[] DifficultyHighlightTexts
String[] DifficultyOptions
String[] MessagesHighlightTexts
String[] MessagesOptions
String[] VisualScalingHighlightTexts
string[] VisualScalingKindHighlightTexts
string[] VisualScalingKindOptions
String[] VisualScalingOptions


;---------------------------------------------
; Compatiblity Variables
;---------------------------------------------

Bool[] CompatiblityActive
int CompatiblityModCount = 0
int[] CompatiblityDefaultValue
int[] CompatiblityRank
int[] property Compatible auto hidden
string[] CompatiblityModNames


;---------------------------------------------
; Child Perk Test Variables
;---------------------------------------------

bool bTestPerkMode = false
bool bTestPerkRan  = false
int lastPerkTested = -1
int selectedPerk   = -1
int[] UI_TestPerk
string[] perkTestResult
string[] perkTestResultText


;---------------------------------------------
; Other Variables
;---------------------------------------------

bool bAP                = false
bool bASX               = false
bool bBathingInSkyrim   = false
bool bEstrus            = false
bool bFlowerGirls       = false
bool bHAnimations       = false
bool bOSA               = false
bool bRunUpdateAllWoman = false
bool bSexLab            = false
bool bSexModInstalled   = false


bool property SexModInstalled
	bool function get()
		return bSexModInstalled
	endfunction
endProperty


int function GetVersion()
	return FWVersion.GetMCMVersion()
endFunction


function OnLoadGame()
	bTestPerkMode      = false
	bTestPerkRan       = false
	selectedPerk       = -1
	lastPerkTested     = -1
	AddOnActiveRaces   = -1
	AddOnActiveCME     = -1
	AddOnActiveMisc    = -1
	bRunUpdateAllWoman = false
	CheckForSexMods()
endFunction


function CheckForSexMods()
	bSexModInstalled = false
	bSexLab          = false
	bAP              = false
	bFlowerGirls     = false
	bEstrus          = false
	bOSA             = false
	bBathingInSkyrim = false
	bASX             = false
	bHAnimations     = false
	int c = Game.GetModCount()
	while c > 0
		c -= 1
		string m = Game.GetModName(c)
		if m == "SexLab.esm"
			bSexModInstalled = true
			bSexLab = true
		elseif m == "OSA.esm"
			bSexModInstalled = true
			bOSA = true
		elseif m == "AP Skyrim.esm"
			bSexModInstalled = true
			bAP = true
		elseif m == "zzEstrus.esp"
			bEstrus=true
		elseif m == "Bathing in Skyrim - Main.esp" || m == "Bathing in Skyrim.esp" || m == "Bathing in Skyrim AIO.esp" || m == "Bathing in Skyrim Merged.esp"
			bBathingInSkyrim = true
		elseif m == "ASX_Spells.esp"
			bSexModInstalled = true
			bASX = true
		elseif m == "HAnimations.esp"
			bSexModInstalled = true
			bHAnimations = true
		elseif m == "FlowerGirls.esp"
			bSexModInstalled = true
			bFlowerGirls = true
		elseif m == "Schlongs of Skyrim - Core.esm" || \
		   m == "Scent of Sex.esp" || \
		   m == "HentaiCreatures.esp" || \
		   m == "SLAnimLoader.esp" || \
		   m == "FemaleWerewolf.esp"
			bSexModInstalled = true
		endif
	endWhile
endFunction


event OnUpdate()
	ForcePageReset()
endEvent


function LoadProfileIfExists(string File)
	int c = FWUtility.GetFileCount("Profile","json")
	if c>126
		c=126
	endif
	while c>0
		c -= 1
		string f = FWUtility.GetFileName("Profile","json",c)
		if(f==File || f==File+".json")
			LoadProfile(f)
			return
		endif
	endWhile
endFunction


string function getCurrentProfile()
	int c = FWUtility.GetFileCount("Profile","json")
	if c>126
		c=126
	endif
	while c>0
		c -= 1
		string f = FWUtility.GetFileName("Profile","json",c)
		if IsProfile(f)
			return f
		endif
	endWhile
	return "$GAME_CONTENT_StateUnknown"
endfunction


bool function CurrentProfileExists()
	int c = FWUtility.GetFileCount("Profile","json")
	if c>126
		c=126
	endif
	while c>0
		c -= 1
		string f = FWUtility.GetFileName("Profile","json",c)
		if IsProfile(f)
			return true
		endif
	endWhile
	return false
endfunction


bool function IsProfile(string File)
	string s = "../../../BeeingFemale/Profile/" + File
	bool bContinue=true
	
	; Check Durations first - Those are most changed values
	if bContinue==true
		bContinue=false
		if 	FollicularDuration == JsonUtil.GetIntValue(s, "CYCLE_FollicularDuration", FollicularDuration) && \
			OvulationDuration == JsonUtil.GetIntValue(s, "CYCLE_OvulationDuration", OvulationDuration) && \
			LutealDuration == JsonUtil.GetIntValue(s, "CYCLE_LutealDuration", LutealDuration) && \
			MenstrualDuration == JsonUtil.GetIntValue(s, "CYCLE_MenstrualDuration", MenstrualDuration) && \
			Trimster1Duration == JsonUtil.GetIntValue(s, "PREGNANCY_Trimster1Duration", Trimster1Duration) && \
			Trimster2Duration == JsonUtil.GetIntValue(s, "PREGNANCY_Trimster2Duration", Trimster2Duration) && \
			Trimster3Duration == JsonUtil.GetIntValue(s, "PREGNANCY_Trimster3Duration", Trimster3Duration) && \
			ReplanishDuration == JsonUtil.GetIntValue(s, "PREGNANCY_ReplanishDuration", ReplanishDuration)
				bContinue=true
		endif
	endif
	
	; Check Chances
	if bContinue==true
		bContinue=false
		if 	PMSChance == JsonUtil.GetFloatValue(s, "CYCLE_PMS_Chance", PMSChance) && \
			MenstrualCramps == JsonUtil.GetFloatValue(s, "CYCLE_MenstrualCramps", MenstrualCramps) && \
			irregulationChance == JsonUtil.GetFloatValue(s, "CYCLE_IrregulationChance", irregulationChance) && \
			ConceiveChance == JsonUtil.GetFloatValue(s, "CYCLE_ConceiveChance_Player", ConceiveChance) && \
			ConceiveChanceFollower == JsonUtil.GetFloatValue(s, "CYCLE_ConceiveChance_Follower", ConceiveChanceFollower) && \
			ConceiveChanceNPC == JsonUtil.GetFloatValue(s, "CYCLE_ConceiveChance_NPC", ConceiveChanceNPC) && \
			WashOutChance == JsonUtil.GetFloatValue(s, "CYCLE_WashOutChance", WashOutChance) && \
			WashOutWaterChance == JsonUtil.GetFloatValue(s, "CYCLE_WashOutWaterChance", WashOutWaterChance) && \
			WashOutFluidChance == JsonUtil.GetFloatValue(s, "CYCLE_WashOutFluidChance", WashOutFluidChance) && \
			ImpregnatePlayerChance == JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Chance", ImpregnatePlayerChance) && \
			NoVaginalCumChance == JsonUtil.GetIntValue(s, "MEN_NoVaginalCumChance", NoVaginalCumChance)
				bContinue=true
		endif
	endif
	
	; Other options that are changed often
	if bContinue==true
		bContinue=false
		if 	Messages == JsonUtil.GetIntValue(s, "GENERAL_Message_Mode", Messages) && \
			Difficulty == JsonUtil.GetIntValue(s, "GENERAL_Difficulty", Difficulty) && \
			PMSEffects == JsonUtil.GetIntValue(s, "CYCLE_Num_PMS_Effects", PMSEffects) && \
			WashOutHourDelay == JsonUtil.GetFloatValue(s, "CYCLE_WashOutHourDelay", WashOutHourDelay) && \
			MultipleThreshold == JsonUtil.GetIntValue(s, "PREGNANCY_MultipleThreshold", MultipleThreshold) && \
			BellyMaxScale == JsonUtil.GetFloatValue(s, "PREGNANCY_BellyMaxScale", BellyMaxScale) && \
			BreastsMaxScale == JsonUtil.GetFloatValue(s, "PREGNANCY_BreastsMaxScale", BreastsMaxScale) && \
			WeightGainMax == JsonUtil.GetIntValue(s, "PREGNANCY_WeightGainMax", WeightGainMax) && \
			MaxBabys == JsonUtil.GetIntValue(s, "PREGNANCY_MaxBabys", MaxBabys) && \
			BabySpawn == JsonUtil.GetIntValue(s, "PREGNANCY_BabySpawn_Player", BabySpawn) && \
			BabySpawnNPC == JsonUtil.GetIntValue(s, "PREGNANCY_BabySpawn_NPC", BabySpawnNPC) && \
			ImpregnateTime == JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Time", ImpregnateTime) && \
			ImpregnateCount == JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Count", ImpregnateCount) && \
			SpermDuration == JsonUtil.GetFloatValue(s, "MEN_SpermDuration", SpermDuration) && \
			MaleVirilityRecovery == JsonUtil.GetFloatValue(s, "MEN_MaleVirilityRecovery", MaleVirilityRecovery) && \
			UpdateInterval == JsonUtil.GetFloatValue(s, "SYSTEM_UpdateInterval", UpdateInterval) && \
			KeyStateWidget == JsonUtil.GetIntValue(s, "GENERAL_HotKey", KeyStateWidget) && \
			VisualScaling == JsonUtil.GetIntValue(s, "PREGNANCY_VisualScaling", VisualScaling)
				bContinue=true
		endif
	endif
	
	; Check Boolean Values 1
	if bContinue==true
		bool tmpPlayerTimer = JsonUtil.GetIntValue(s, "GENERAL_PlayerTimer", FWUtility.SwitchInt(PlayerTimer,1,0) )==1
		bool tmpRelevantPlayer = JsonUtil.GetIntValue(s, "GENERAL_RelevantPlayer", FWUtility.SwitchInt(RelevantPlayer,1,0))==1
		bool tmpRelevantFollower = JsonUtil.GetIntValue(s, "GENERAL_RelevantFollower", FWUtility.SwitchInt(RelevantFollower,1,0))==1
		bool tmpRelevantNPC = JsonUtil.GetIntValue(s, "GENERAL_RelevantNPC", FWUtility.SwitchInt(RelevantNPC,1,0))==1
		bool tmpPlayAnimations = JsonUtil.GetIntValue(s, "GENERAL_PlayAnimations", FWUtility.SwitchInt(PlayAnimations,1,0))==1
		
		bool tmpabortus = JsonUtil.GetIntValue(s, "PREGNANCY_Abortus", FWUtility.SwitchInt(abortus,1,0))==1
		bool tmpVisualScalingKind = JsonUtil.GetIntValue(s, "PREGNANCY_VisualScalingKind", VisualScalingKind)
		bool tmpBellyScale = JsonUtil.GetIntValue(s, "PREGNANCY_BellyScale", FWUtility.SwitchInt(BellyScale,1,0))==1
		bool tmpBreastScale = JsonUtil.GetIntValue(s, "PREGNANCY_BreastScale", FWUtility.SwitchInt(BreastScale,1,0))==1
		bContinue=false
		if 	tmpPlayerTimer==PlayerTimer && \
			tmpRelevantPlayer==RelevantPlayer && \
			tmpRelevantFollower==RelevantFollower && \
			tmpRelevantNPC==RelevantNPC && \
			tmpPlayAnimations==PlayAnimations && \
			tmpabortus==abortus && \
			tmpVisualScalingKind==VisualScalingKind && \
			tmpBellyScale==BellyScale && \
			tmpBreastScale==BreastScale
				bContinue=true
		endif
	endif
	
	if bContinue==true
		bool tmpNPCCanBecomePregnant = JsonUtil.GetIntValue(s, "NPC_CanBecomePregnant", FWUtility.SwitchInt(NPCCanBecomePregnant,1,0))==1
		bool tmpNPCFeelPain = JsonUtil.GetIntValue(s, "NPC_FeelPain", FWUtility.SwitchInt(NPCFeelPain,1,0))==1
		bool tmpNPCMenstruationBlood = JsonUtil.GetIntValue(s, "NPC_MenstruationBlood", FWUtility.SwitchInt(NPCMenstruationBlood,1,0))==1
		bool tmpNPCMenstrualMood = JsonUtil.GetIntValue(s, "NPC_MenstrualMood", FWUtility.SwitchInt(NPCMenstrualMood,1,0))==1
		bool tmpNPCMenstrualNoTalk = JsonUtil.GetIntValue(s, "NPC_MenstrualNoTalk", FWUtility.SwitchInt(NPCMenstrualNoTalk,1,0))==1
		bool tmpNPCBornChild = JsonUtil.GetIntValue(s, "NPC_BornChild", FWUtility.SwitchInt(NPCBornChild,1,0))==1
		bool tmpChildrenMayCry = JsonUtil.GetIntValue(s, "CHILDREN_MayCry", FWUtility.SwitchInt(ChildrenMayCry,1,0))==1
		bool tmpUpdateIntervalEnabled = JsonUtil.GetIntValue(s, "SYSTEM_UpdateIntervalEnabled", FWUtility.SwitchInt(UpdateIntervalEnabled,1,0))==1
		bContinue=false
		if 	tmpNPCCanBecomePregnant==NPCCanBecomePregnant && \
			tmpNPCFeelPain==NPCFeelPain && \
			tmpNPCMenstruationBlood==NPCMenstruationBlood && \
			tmpNPCMenstrualMood==NPCMenstrualMood && \
			tmpNPCMenstrualNoTalk==NPCMenstrualNoTalk && \
			tmpNPCBornChild==NPCBornChild && \
			tmpChildrenMayCry==ChildrenMayCry && \
			tmpUpdateIntervalEnabled==UpdateIntervalEnabled
				bContinue=true
		endif
	endif
	
	if bContinue==true
		bool tmpImpregnateActive = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Active", FWUtility.SwitchInt(ImpregnateActive,1,0))==1
		bool tmpImpregnateHusband = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Husband", FWUtility.SwitchInt(ImpregnateHusband,1,0))==1
		bool tmpImpregnateAffairs = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Affairs", FWUtility.SwitchInt(ImpregnateAffairs,1,0))==1
		bool tmpImpregnatePartners = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Partners", FWUtility.SwitchInt(ImpregnatePartners,1,0))==1
		bool tmpImpregnateLastNPC = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_LastNPC", FWUtility.SwitchInt(ImpregnateLastNPC,1,0))==1
		bool tmpImpregnatePlayerSpouse = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_PlayerSpouse", FWUtility.SwitchInt(ImpregnatePlayerSpouse,1,0))==1
		bool tmpImpregnatePlayerSleep = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Sleep", FWUtility.SwitchInt(ImpregnatePlayerSleep,1,0))==1
		bool tmpImpregnatePlayerHusband = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Husband", FWUtility.SwitchInt(ImpregnatePlayerHusband,1,0))==1
		bool tmpImpregnatePlayerFollower = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Follower", FWUtility.SwitchInt(ImpregnatePlayerFollower,1,0))==1
		bool tmpImpregnateLastPlayerNPCs = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Last_NPCs", FWUtility.SwitchInt(ImpregnateLastPlayerNPCs,1,0))==1
		bool tmpImpregnatePlayerAmbient = JsonUtil.GetIntValue(s, "IMPREGNATE_PlayerAmbient", FWUtility.SwitchInt(ImpregnatePlayerAmbient,1,0))==1
		bContinue=false
		if 	tmpImpregnateActive==ImpregnateActive && \
			tmpImpregnateHusband==ImpregnateHusband && \
			tmpImpregnateAffairs==ImpregnateAffairs && \
			tmpImpregnatePartners==ImpregnatePartners && \
			tmpImpregnateLastNPC==ImpregnateLastNPC && \
			tmpImpregnatePlayerSpouse==ImpregnatePlayerSpouse && \
			tmpImpregnatePlayerSleep==ImpregnatePlayerSleep && \
			tmpImpregnatePlayerSleep==ImpregnatePlayerSleep && \
			tmpImpregnatePlayerHusband==ImpregnatePlayerHusband && \
			tmpImpregnatePlayerFollower==ImpregnatePlayerFollower && \
			tmpImpregnateLastPlayerNPCs==ImpregnateLastPlayerNPCs && \
			tmpImpregnatePlayerAmbient==ImpregnatePlayerAmbient
				bContinue=true
		endif
	endif
	
	return bContinue
endFunction

function LoadProfile(string File)
	string s = "../../../BeeingFemale/Profile/" + File
	;Debug.Trace("Load Profile: " + s)
	;Debug.Notification("Load Profile: " + s)
	
	; General Settings
	Messages = JsonUtil.GetIntValue(s, "GENERAL_Message_Mode", Messages)
	PlayerTimer = JsonUtil.GetIntValue(s, "GENERAL_PlayerTimer", FWUtility.SwitchInt(PlayerTimer,1,0) )==1
	Difficulty = JsonUtil.GetIntValue(s, "GENERAL_Difficulty", Difficulty)
	RelevantPlayer = JsonUtil.GetIntValue(s, "GENERAL_RelevantPlayer", FWUtility.SwitchInt(RelevantPlayer,1,0))==1
	RelevantFollower = JsonUtil.GetIntValue(s, "GENERAL_RelevantFollower", FWUtility.SwitchInt(RelevantFollower,1,0))==1
	RelevantNPC = JsonUtil.GetIntValue(s, "GENERAL_RelevantNPC", FWUtility.SwitchInt(RelevantNPC,1,0))==1
	KeyStateWidget = JsonUtil.GetIntValue(s, "GENERAL_HotKey", KeyStateWidget)
	PlayAnimations = JsonUtil.GetIntValue(s, "GENERAL_PlayAnimations", FWUtility.SwitchInt(PlayAnimations,1,0))==1
	
	; Menstrual cycle
	FollicularDuration = JsonUtil.GetIntValue(s, "CYCLE_FollicularDuration", FollicularDuration)
	OvulationDuration = JsonUtil.GetIntValue(s, "CYCLE_OvulationDuration", OvulationDuration)
	LutealDuration = JsonUtil.GetIntValue(s, "CYCLE_LutealDuration", LutealDuration)
	MenstrualDuration = JsonUtil.GetIntValue(s, "CYCLE_MenstrualDuration", MenstrualDuration)
	PMSChance = JsonUtil.GetFloatValue(s, "CYCLE_PMS_Chance", PMSChance)
	MenstrualCramps = JsonUtil.GetFloatValue(s, "CYCLE_MenstrualCramps", MenstrualCramps)
	PMSEffects = JsonUtil.GetIntValue(s, "CYCLE_Num_PMS_Effects", PMSEffects)
	irregulationChance = JsonUtil.GetFloatValue(s, "CYCLE_IrregulationChance", irregulationChance)
	ConceiveChance = JsonUtil.GetFloatValue(s, "CYCLE_ConceiveChance_Player", ConceiveChance)
	ConceiveChanceFollower = JsonUtil.GetFloatValue(s, "CYCLE_ConceiveChance_Follower", ConceiveChanceFollower)
	ConceiveChanceNPC = JsonUtil.GetFloatValue(s, "CYCLE_ConceiveChance_NPC", ConceiveChanceNPC)
	WashOutChance = JsonUtil.GetFloatValue(s, "CYCLE_WashOutChance", WashOutChance)
	WashOutWaterChance = JsonUtil.GetFloatValue(s, "CYCLE_WashOutWaterChance", WashOutWaterChance)
	WashOutFluidChance = JsonUtil.GetFloatValue(s, "CYCLE_WashOutFluidChance", WashOutFluidChance)
	WashOutHourDelay = JsonUtil.GetFloatValue(s, "CYCLE_WashOutHourDelay", WashOutHourDelay)
	
	; Pregnancy
	Trimster1Duration = JsonUtil.GetIntValue(s, "PREGNANCY_Trimster1Duration", Trimster1Duration)
	Trimster2Duration = JsonUtil.GetIntValue(s, "PREGNANCY_Trimster2Duration", Trimster2Duration)
	Trimster3Duration = JsonUtil.GetIntValue(s, "PREGNANCY_Trimster3Duration", Trimster3Duration)
	ReplanishDuration = JsonUtil.GetIntValue(s, "PREGNANCY_ReplanishDuration", ReplanishDuration)
	MultipleThreshold = JsonUtil.GetIntValue(s, "PREGNANCY_MultipleThreshold", MultipleThreshold)
	abortus = JsonUtil.GetIntValue(s, "PREGNANCY_Abortus", FWUtility.SwitchInt(abortus,1,0))==1
	VisualScaling = JsonUtil.GetIntValue(s, "PREGNANCY_VisualScaling", VisualScaling)
	VisualScalingKind = JsonUtil.GetIntValue(s, "PREGNANCY_VisualScalingKind", VisualScalingKind)
	BellyScale = JsonUtil.GetIntValue(s, "PREGNANCY_BellyScale", FWUtility.SwitchInt(BellyScale,1,0))==1
	BreastScale = JsonUtil.GetIntValue(s, "PREGNANCY_BreastScale", FWUtility.SwitchInt(BreastScale,1,0))==1
	BellyMaxScale = JsonUtil.GetFloatValue(s, "PREGNANCY_BellyMaxScale", BellyMaxScale)
	BreastsMaxScale = JsonUtil.GetFloatValue(s, "PREGNANCY_BreastsMaxScale", BreastsMaxScale)
	WeightGainMax = JsonUtil.GetIntValue(s, "PREGNANCY_WeightGainMax", WeightGainMax)
	MaxBabys = JsonUtil.GetIntValue(s, "PREGNANCY_MaxBabys", MaxBabys)
	BabySpawn = JsonUtil.GetIntValue(s, "PREGNANCY_BabySpawn_Player", BabySpawn)
	BabySpawnNPC = JsonUtil.GetIntValue(s, "PREGNANCY_BabySpawn_NPC", BabySpawnNPC)
	
	; NPC
	NPCCanBecomePregnant = JsonUtil.GetIntValue(s, "NPC_CanBecomePregnant", FWUtility.SwitchInt(NPCCanBecomePregnant,1,0))==1
	NPCFeelPain = JsonUtil.GetIntValue(s, "NPC_FeelPain", FWUtility.SwitchInt(NPCFeelPain,1,0))==1
	NPCMenstruationBlood = JsonUtil.GetIntValue(s, "NPC_MenstruationBlood", FWUtility.SwitchInt(NPCMenstruationBlood,1,0))==1
	NPCMenstrualMood = JsonUtil.GetIntValue(s, "NPC_MenstrualMood", FWUtility.SwitchInt(NPCMenstrualMood,1,0))==1
	NPCMenstrualNoTalk = JsonUtil.GetIntValue(s, "NPC_MenstrualNoTalk", FWUtility.SwitchInt(NPCMenstrualNoTalk,1,0))==1
	NPCBornChild = JsonUtil.GetIntValue(s, "NPC_BornChild", FWUtility.SwitchInt(NPCBornChild,1,0))==1
	
	; Children
	ChildrenMayCry = JsonUtil.GetIntValue(s, "CHILDREN_MayCry", FWUtility.SwitchInt(ChildrenMayCry,1,0))==1
	
	; Impregnation
	ImpregnateActive = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Active", FWUtility.SwitchInt(ImpregnateActive,1,0))==1
	ImpregnateHusband = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Husband", FWUtility.SwitchInt(ImpregnateHusband,1,0))==1
	ImpregnateAffairs = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Affairs", FWUtility.SwitchInt(ImpregnateAffairs,1,0))==1
	ImpregnatePartners = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Partners", FWUtility.SwitchInt(ImpregnatePartners,1,0))==1
	ImpregnateLastNPC = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_LastNPC", FWUtility.SwitchInt(ImpregnateLastNPC,1,0))==1
	ImpregnatePlayerSpouse = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_PlayerSpouse", FWUtility.SwitchInt(ImpregnatePlayerSpouse,1,0))==1
	ImpregnatePlayerSleep = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Sleep", FWUtility.SwitchInt(ImpregnatePlayerSleep,1,0))==1
	ImpregnatePlayerHusband = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Husband", FWUtility.SwitchInt(ImpregnatePlayerHusband,1,0))==1
	ImpregnatePlayerFollower = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Follower", FWUtility.SwitchInt(ImpregnatePlayerFollower,1,0))==1
	ImpregnateLastPlayerNPCs = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Last_NPCs", FWUtility.SwitchInt(ImpregnateLastPlayerNPCs,1,0))==1
	ImpregnatePlayerAmbient = JsonUtil.GetIntValue(s, "IMPREGNATE_PlayerAmbient", FWUtility.SwitchInt(ImpregnatePlayerAmbient,1,0))==1
	ImpregnateTime = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Time", ImpregnateTime)
	ImpregnateCount = JsonUtil.GetIntValue(s, "IMPREGNATE_NPC_Count", ImpregnateCount)
	ImpregnatePlayerChance = JsonUtil.GetIntValue(s, "IMPREGNATE_Player_Chance", ImpregnatePlayerChance)
	
	; Males
	SpermDuration = JsonUtil.GetFloatValue(s, "MEN_SpermDuration", SpermDuration)
	MaleVirilityRecovery = JsonUtil.GetFloatValue(s, "MEN_MaleVirilityRecovery", MaleVirilityRecovery) ;***Edit by Bane
	NoVaginalCumChance = JsonUtil.GetIntValue(s, "MEN_NoVaginalCumChance", NoVaginalCumChance)

	; Cheat / Debug
	UpdateInterval = JsonUtil.GetFloatValue(s, "SYSTEM_UpdateInterval", UpdateInterval)
	UpdateIntervalEnabled = JsonUtil.GetIntValue(s, "SYSTEM_UpdateIntervalEnabled", FWUtility.SwitchInt(UpdateIntervalEnabled,1,0))==1
endFunction

string function SaveProfile(string FileName="")
	string sx = FileName
	if sx==""
		sx=FWUtility.getNextAutoFile("Profile", "Custom ", "json")
	endif
	if sx==""
		sx="Custom.json"
	endif
	string s="../../../BeeingFemale/Profile/"+sx
	
	; General Settings
	JsonUtil.SetIntValue(s, "GENERAL_Message_Mode", Messages)
	JsonUtil.SetIntValue(s, "GENERAL_PlayerTimer", FWUtility.SwitchInt(PlayerTimer,1,0) )
	JsonUtil.SetIntValue(s, "GENERAL_Difficulty", Difficulty)
	JsonUtil.SetIntValue(s, "GENERAL_RelevantPlayer", FWUtility.SwitchInt(RelevantPlayer,1,0))
	JsonUtil.SetIntValue(s, "GENERAL_RelevantFollower", FWUtility.SwitchInt(RelevantFollower,1,0))
	JsonUtil.SetIntValue(s, "GENERAL_RelevantNPC", FWUtility.SwitchInt(RelevantNPC,1,0))==1
	JsonUtil.SetIntValue(s, "GENERAL_HotKey", KeyStateWidget)
	JsonUtil.SetIntValue(s, "GENERAL_PlayAnimations", FWUtility.SwitchInt(PlayAnimations,1,0))
	
	; Menstrual cycle
	JsonUtil.SetIntValue(s, "CYCLE_FollicularDuration", FollicularDuration)
	JsonUtil.SetIntValue(s, "CYCLE_OvulationDuration", OvulationDuration)
	JsonUtil.SetIntValue(s, "CYCLE_LutealDuration", LutealDuration)
	JsonUtil.SetIntValue(s, "CYCLE_MenstrualDuration", MenstrualDuration)
	JsonUtil.SetFloatValue(s, "CYCLE_PMS_Chance", PMSChance)
	JsonUtil.SetFloatValue(s, "CYCLE_MenstrualCramps", MenstrualCramps)
	JsonUtil.SetIntValue(s, "CYCLE_Num_PMS_Effects", PMSEffects)
	JsonUtil.SetFloatValue(s, "CYCLE_IrregulationChance", irregulationChance)
	JsonUtil.SetFloatValue(s, "CYCLE_ConceiveChance_Player", ConceiveChance)
	JsonUtil.SetFloatValue(s, "CYCLE_ConceiveChance_Follower", ConceiveChanceFollower)
	JsonUtil.SetFloatValue(s, "CYCLE_ConceiveChance_NPC", ConceiveChanceNPC)
	JsonUtil.SetFloatValue(s, "CYCLE_WashOutChance", WashOutChance)
	JsonUtil.SetFloatValue(s, "CYCLE_WashOutWaterChance", WashOutWaterChance)
	JsonUtil.SetFloatValue(s, "CYCLE_WashOutFluidChance", WashOutFluidChance)
	JsonUtil.SetFloatValue(s, "CYCLE_WashOutHourDelay", WashOutHourDelay)
	
	; Pregnancy
	JsonUtil.SetIntValue(s, "PREGNANCY_Trimster1Duration", Trimster1Duration)
	JsonUtil.SetIntValue(s, "PREGNANCY_Trimster2Duration", Trimster2Duration)
	JsonUtil.SetIntValue(s, "PREGNANCY_Trimster3Duration", Trimster3Duration)
	JsonUtil.SetIntValue(s, "PREGNANCY_ReplanishDuration", ReplanishDuration)
	JsonUtil.SetIntValue(s, "PREGNANCY_MultipleThreshold", MultipleThreshold)
	JsonUtil.SetIntValue(s, "PREGNANCY_Abortus", FWUtility.SwitchInt(abortus,1,0))
	JsonUtil.SetIntValue(s, "PREGNANCY_VisualScaling", VisualScaling)
	JsonUtil.SetIntValue(s, "PREGNANCY_VisualScalingKind", VisualScalingKind)
	JsonUtil.SetIntValue(s, "PREGNANCY_BellyScale", FWUtility.SwitchInt(BellyScale,1,0))
	JsonUtil.SetIntValue(s, "PREGNANCY_BreastScale", FWUtility.SwitchInt(BreastScale,1,0))
	JsonUtil.SetFloatValue(s, "PREGNANCY_BellyMaxScale", BellyMaxScale)
	JsonUtil.SetFloatValue(s, "PREGNANCY_BreastsMaxScale", BreastsMaxScale)
	JsonUtil.SetIntValue(s, "PREGNANCY_WeightGainMax", WeightGainMax)
	JsonUtil.SetIntValue(s, "PREGNANCY_MaxBabys", MaxBabys)
	JsonUtil.SetIntValue(s, "PREGNANCY_BabySpawn_Player", BabySpawn)
	JsonUtil.SetIntValue(s, "PREGNANCY_BabySpawn_NPC", BabySpawnNPC)
	
	; NPC
	JsonUtil.SetIntValue(s, "NPC_CanBecomePregnant", FWUtility.SwitchInt(NPCCanBecomePregnant,1,0))
	JsonUtil.SetIntValue(s, "NPC_FeelPain", FWUtility.SwitchInt(NPCFeelPain,1,0))
	JsonUtil.SetIntValue(s, "NPC_MenstruationBlood", FWUtility.SwitchInt(NPCMenstruationBlood,1,0))
	JsonUtil.SetIntValue(s, "NPC_MenstrualMood", FWUtility.SwitchInt(NPCMenstrualMood,1,0))
	JsonUtil.SetIntValue(s, "NPC_MenstrualNoTalk", FWUtility.SwitchInt(NPCMenstrualNoTalk,1,0))
	JsonUtil.SetIntValue(s, "NPC_BornChild", FWUtility.SwitchInt(NPCBornChild,1,0))
	
	; Children
	JsonUtil.SetIntValue(s, "CHILDREN_MayCry", FWUtility.SwitchInt(ChildrenMayCry,1,0))
	
	; Impregnation
	JsonUtil.SetIntValue(s, "IMPREGNATE_NPC_Active", FWUtility.SwitchInt(ImpregnateActive,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_NPC_Husband", FWUtility.SwitchInt(ImpregnateHusband,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_NPC_Affairs", FWUtility.SwitchInt(ImpregnateAffairs,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_NPC_Partners", FWUtility.SwitchInt(ImpregnatePartners,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_NPC_LastNPC", FWUtility.SwitchInt(ImpregnateLastNPC,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_NPC_PlayerSpouse", FWUtility.SwitchInt(ImpregnatePlayerSpouse,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_Player_Sleep", FWUtility.SwitchInt(ImpregnatePlayerSleep,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_Player_Husband", FWUtility.SwitchInt(ImpregnatePlayerHusband,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_Player_Follower", FWUtility.SwitchInt(ImpregnatePlayerFollower,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_Player_Last_NPCs", FWUtility.SwitchInt(ImpregnateLastPlayerNPCs,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_PlayerAmbient", FWUtility.SwitchInt(ImpregnatePlayerAmbient,1,0))
	JsonUtil.SetIntValue(s, "IMPREGNATE_NPC_Time", ImpregnateTime)
	JsonUtil.SetIntValue(s, "IMPREGNATE_NPC_Count", ImpregnateCount)
	JsonUtil.SetIntValue(s, "IMPREGNATE_Player_Chance", ImpregnatePlayerChance)
	
	; Males
	JsonUtil.SetFloatValue(s, "MEN_SpermDuration", SpermDuration)
	JsonUtil.SetFloatValue(s, "MEN_MaleVirilityRecovery", MaleVirilityRecovery) ;***Edit by Bane
	JsonUtil.SetIntValue(s, "MEN_NoVaginalCumChance", NoVaginalCumChance)

	; Cheat / Debug
	JsonUtil.SetFloatValue(s, "SYSTEM_UpdateInterval", UpdateInterval)
	JsonUtil.SetIntValue(s, "SYSTEM_UpdateIntervalEnabled", FWUtility.SwitchInt(UpdateIntervalEnabled,1,0))
	
	JsonUtil.Save(s)
	
	return sx
endfunction

function ReloadWidgetProfile()
	LoadWidgetProfile(WidgetProfile)
endFunction
function LoadWidgetProfile(string ProfileName="")
	if(ProfileName!="")
		WidgetProfile=ProfileName
	endif
	if WidgetProfile==""
		WidgetProfile=WidgetProfileDef
	endif
	if(System.StateWidget!=none)
		System.StateWidget.CFG_HAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "StateWidget", "HAnchor", System.StateWidget.CFG_HAnchor)
		System.StateWidget.CFG_VAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "StateWidget", "VAnchor", System.StateWidget.CFG_VAnchor)
		Utility.WaitMenuMode(0.1)
		System.StateWidget.CFG_PosX = FWUtility.getIniCInt("HUD", WidgetProfile, "StateWidget", "PositionX", System.StateWidget.CFG_PosX)
		System.StateWidget.CFG_PosY = FWUtility.getIniCInt("HUD", WidgetProfile, "StateWidget", "PositionY", System.StateWidget.CFG_PosY)
		System.StateWidget.CFG_Enabled = FWUtility.getIniCBool("HUD", WidgetProfile, "StateWidget", "Enabled", System.StateWidget.CFG_Enabled)
		System.StateWidget.CFG_Alpha = FWUtility.getIniCInt("HUD", WidgetProfile, "StateWidget", "Alpha", System.StateWidget.CFG_Alpha)
		System.StateWidget.CFG_FillDirection = FWUtility.getIniCString("HUD", WidgetProfile, "StateWidget", "FillDirection", System.StateWidget.CFG_FillDirection)
		System.StateWidget.CFG_Color = FWUtility.getIniCInt("HUD", WidgetProfile, "StateWidget", "Color", System.StateWidget.CFG_Color)
		System.StateWidget.CFG_DarkColor = FWUtility.getIniCInt("HUD", WidgetProfile, "StateWidget", "DarkColor", System.StateWidget.CFG_DarkColor)
		System.StateWidget.CFG_FlashColor = FWUtility.getIniCInt("HUD", WidgetProfile, "StateWidget", "FlashColor", System.StateWidget.CFG_FlashColor)
		System.StateWidget.CFG_IconPosition = FWUtility.getIniCString("HUD", WidgetProfile, "StateWidget", "IconPosition", System.StateWidget.CFG_IconPosition)
	else
		Debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  StateWidget configuration")
	endif
	
	if(System.ContraceptionWidget!=none)
		System.ContraceptionWidget.CFG_HAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "ContraceptionWidget", "HAnchor", System.ContraceptionWidget.CFG_HAnchor)
		System.ContraceptionWidget.CFG_VAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "ContraceptionWidget", "VAnchor", System.ContraceptionWidget.CFG_VAnchor)
		Utility.WaitMenuMode(0.1)
		System.ContraceptionWidget.CFG_PosX = FWUtility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "PositionX", System.ContraceptionWidget.CFG_PosX)
		System.ContraceptionWidget.CFG_PosY = FWUtility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "PositionY", System.ContraceptionWidget.CFG_PosY)
		System.ContraceptionWidget.CFG_Enabled = FWUtility.getIniCBool("HUD", WidgetProfile, "ContraceptionWidget", "Enabled", System.ContraceptionWidget.CFG_Enabled)
		System.ContraceptionWidget.CFG_Alpha = FWUtility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "Alpha", System.ContraceptionWidget.CFG_Alpha)
		System.ContraceptionWidget.CFG_FillDirection = FWUtility.getIniCString("HUD", WidgetProfile, "ContraceptionWidget", "FillDirection", System.ContraceptionWidget.CFG_FillDirection)
		System.ContraceptionWidget.CFG_Color = FWUtility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "Color", System.ContraceptionWidget.CFG_Color)
		System.ContraceptionWidget.CFG_DarkColor = FWUtility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "DarkColor", System.ContraceptionWidget.CFG_DarkColor)
		System.ContraceptionWidget.CFG_FlashColor = FWUtility.getIniCInt("HUD", WidgetProfile, "ContraceptionWidget", "FlashColor", System.ContraceptionWidget.CFG_FlashColor)
		System.ContraceptionWidget.CFG_IconPosition = FWUtility.getIniCString("HUD", WidgetProfile, "ContraceptionWidget", "IconPosition", System.ContraceptionWidget.CFG_IconPosition)
	else
		Debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  ContraceptionWidget configuration")
	endif
	
	if(System.BabyHealthWidget!=none)
		System.BabyHealthWidget.CFG_HAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "IconWidget", "HAnchor", System.BabyHealthWidget.CFG_HAnchor)
		System.BabyHealthWidget.CFG_VAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "IconWidget", "VAnchor", System.BabyHealthWidget.CFG_VAnchor)
		Utility.WaitMenuMode(0.1)
		System.BabyHealthWidget.CFG_PosX = FWUtility.getIniCInt("HUD", WidgetProfile, "IconWidget", "PositionX", System.BabyHealthWidget.CFG_PosX)
		System.BabyHealthWidget.CFG_PosY = FWUtility.getIniCInt("HUD", WidgetProfile, "IconWidget", "PositionY", System.BabyHealthWidget.CFG_PosY)
		System.BabyHealthWidget.CFG_Enabled = FWUtility.getIniCBool("HUD", WidgetProfile, "IconWidget", "Enabled", System.BabyHealthWidget.CFG_Enabled)
		System.BabyHealthWidget.CFG_Alpha = FWUtility.getIniCInt("HUD", WidgetProfile, "IconWidget", "Alpha", System.BabyHealthWidget.CFG_Alpha)
	else
		Debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  BabyHealthWidget configuration")
	endif
	
	if(System.PantyWidget!=none)
		System.PantyWidget.CFG_HAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "PantyWidget", "HAnchor", System.PantyWidget.CFG_HAnchor)
		System.PantyWidget.CFG_VAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "PantyWidget", "VAnchor", System.PantyWidget.CFG_VAnchor)
		Utility.WaitMenuMode(0.1)
		System.PantyWidget.CFG_PosX = FWUtility.getIniCInt("HUD", WidgetProfile, "PantyWidget", "PositionX", System.PantyWidget.CFG_PosX)
		System.PantyWidget.CFG_PosY = FWUtility.getIniCInt("HUD", WidgetProfile, "PantyWidget", "PositionY", System.PantyWidget.CFG_PosY)
		System.PantyWidget.CFG_Enabled = FWUtility.getIniCBool("HUD", WidgetProfile, "PantyWidget", "Enabled", System.PantyWidget.CFG_Enabled)
		System.PantyWidget.CFG_Alpha = FWUtility.getIniCInt("HUD", WidgetProfile, "PantyWidget", "Alpha", System.PantyWidget.CFG_Alpha)
	else
		Debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  PantyWidget configuration")
	endif
	
	if(System.Progress!=none)
		System.Progress.CFG_HAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "ProgressWidget", "HAnchor", System.Progress.CFG_HAnchor)
		System.Progress.CFG_VAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "ProgressWidget", "VAnchor", System.Progress.CFG_VAnchor)
		Utility.WaitMenuMode(0.1)
		System.Progress.CFG_PosX = FWUtility.getIniCInt("HUD", WidgetProfile, "ProgressWidget", "PositionX", System.Progress.CFG_PosX)
		System.Progress.CFG_PosY = FWUtility.getIniCInt("HUD", WidgetProfile, "ProgressWidget", "PositionY", System.Progress.CFG_PosY)
		System.Progress.CFG_Enabled = FWUtility.getIniCBool("HUD", WidgetProfile, "ProgressWidget", "Enabled", System.Progress.CFG_Enabled)
		System.Progress.CFG_Alpha = FWUtility.getIniCInt("HUD", WidgetProfile, "ProgressWidget", "Alpha", System.Progress.CFG_Alpha)
	else
		Debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  Progress configuration")
	endif
	
	if(System.CoupleWidget!=none)
		System.CoupleWidget.CFG_HAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "CoupleWidget", "HAnchor", System.CoupleWidget.CFG_HAnchor)
		System.CoupleWidget.CFG_VAnchor = FWUtility.getIniCString("HUD", WidgetProfile, "CoupleWidget", "VAnchor", System.CoupleWidget.CFG_VAnchor)
		Utility.WaitMenuMode(0.1)
		System.CoupleWidget.CFG_PosX = FWUtility.getIniCInt("HUD", WidgetProfile, "CoupleWidget", "PositionX", System.CoupleWidget.CFG_PosX)
		System.CoupleWidget.CFG_PosY = FWUtility.getIniCInt("HUD", WidgetProfile, "CoupleWidget", "PositionY", System.CoupleWidget.CFG_PosY)
		System.CoupleWidget.CFG_Enabled = FWUtility.getIniCBool("HUD", WidgetProfile, "CoupleWidget", "Enabled", System.CoupleWidget.CFG_Enabled)
		System.CoupleWidget.CFG_Alpha = FWUtility.getIniCInt("HUD", WidgetProfile, "CoupleWidget", "Alpha", System.CoupleWidget.CFG_Alpha)
	else
		Debug.Trace("FWSystemConfig::LoadWidgetProfile() - Failed to load  CoupleWidget configuration")
	endif
endFunction

; This is a hack for a async function call
event CheckNextPerk_Async(string hookName, string argString, float argNum, form sender)
	UnregisterForModEvent("FWSystemConfig_Async_Call")
	CheckNextPerk()
endEvent

function CheckNextPerk()
	lastPerkTested+=1
	
	; Check if all done
	if System.ChildSettings.ChildPerkFile[lastPerkTested] == ""
		; All done, enable them all
		int tmp=lastPerkTested
		while tmp>0
			tmp-=1
			SetOptionFlags(UI_TestPerk[tmp],OPTION_FLAG_NONE)
		endwhile
		return
	endif
	
	; Set TextField Label to "Checking"
	perkTestResult[lastPerkTested]="$FW_MENU_BASIC_Checking"
	SetTextOptionValue(UI_TestPerk[lastPerkTested], "$FW_MENU_BASIC_Checking")
	
	; Get Perk informations
	string file = System.ChildSettings.ChildPerkFile[lastPerkTested]
	int posX = System.ChildSettings.ChildPerkX[lastPerkTested]
	int posY = System.ChildSettings.ChildPerkY[lastPerkTested]
	int ranks = System.ChildSettings.ChildPerkRank[lastPerkTested]
	bool bUseAll = System.ChildSettings.ChildPerkBool[lastPerkTested]
	bool bEnabled = System.ChildSettings.ChildPerkEnabled[lastPerkTested]
	bool bSuccess=true
	string res="General;"
	
	; Check Ranks
	if ranks<1
		bSuccess=false
		res+="<font color='#ff0000'>-</font> No ranks set;"
	elseif ranks>30
		bSuccess=false
		res+="<font color='#ff0000'>-</font> to many ranks set (max 30);"
	endif
	
	; Validate min/max position
	if posX <0
		bSuccess=false
		res+="<font color='#ff0000'>-</font> X-Position must be greater 0;"
	elseif posX >1000
		bSuccess=false
		res+="<font color='#ff0000'>-</font> X-Position must be less 1000;"
	endif
	if posY <0
		bSuccess=false
		res+="<font color='#ff0000'>-</font> Y-Position must be greater 0;"
	elseif posY >100
		bSuccess=false
		res+="<font color='#ff0000'>-</font> Y-Position must be less 100;"
	endif
	
	; Check if the current perk is not close to another perk position
	bool bFound=false
	int j=0
	int c=System.ChildSettings.ChildPerkFile.length
	while j<c
		if j!=lastPerkTested
			if System.ChildSettings.ChildPerkX[j] > posX - 3 && System.ChildSettings.ChildPerkX[j] < posX + 3
				if System.ChildSettings.ChildPerkY[j] > posY - 10 && System.ChildSettings.ChildPerkY[j] < posY + 10
					bSuccess=false
					res+="<font color='#ff0000'>-</font> To Close to "+System.ChildSettings.ChildPerkFile[j]+";"
				endif
			endif
		endif
		j+=1
	endWhile
	
	; The general properties are ok
	if bSuccess==true
		res+="<font color='#00ff00'>-</font> General properties are OK;"
	endif
	
	
	; Check the Perk Ranks
	int i=0
	while i<ranks
		i+=1
		
		; Get Rank Infoormations
		string modFile = FWUtility.getIniCString("ChildPerk", file, "Rank"+i, "ModName")
		string rModFile = FWUtility.modFile(modFile)
		int rFormID = FWUtility.getIniCInt("ChildPerk", file, "Rank"+i, "FormID")
		int[] req = System.ChildSettings.getPerkRequirement(file,i)		
		bool bRankSuccess=false
		res+="Rank "+i+";"
		
		; Check for the Mod-File
		if(modFile=="")
			res+="<font color='#ff0000'>-</font> Does not have a mod file;"
		endif
		if(rModFile=="" && modFile!="")
			res+="<font color='#ff0000'>-</font> Can't find the Mod File;"
		endif
		
		; Check Form-ID
		if(rFormID<0)
			res+="<font color='#ff0000'>-</font> Has a negative form id;"
		elseif(rFormID>16777215)
			bRankSuccess=false
			res+="<font color='#ff0000'>-</font> The form id is to huge;"
		endif
		
		; Check the Form
		if rModFile!="" && (rFormID>0 && rFormID<=16777215)
			form f = Game.GetFormFromFile(rFormID,rModFile)
			string rName = FWUtility.getIniCString("ChildPerk", file, "Rank"+i, "Name",f.GetName())
			if f==none
				res+="<font color='#ff0000'>-</font> Can't find the Form;"
			elseif (f as spell) == none && (f as armor) == none && (f as faction) == none && (f as shout) == none
				res+="<font color='#00FF00'>-</font> Form Name: '"+f.GetName()+"';<font color='#ff0000'>-</font> Form is of the wrong type;"
				res+="<font color='#00FF00'>-</font> Form Type: "+FWUtility.getTypeString(f.GetType())+";"
			else
				res+="<font color='#00FF00'>-</font> Form Name: '"+f.GetName()+"';"
				res+="<font color='#00FF00'>-</font> Form Type: "+FWUtility.getTypeString(f.GetType())+";"
				bRankSuccess=true
			endif
		endif
		
		; Check the requirements
		if req[0]>100
			res+="<font color='#ff0000'>-</font> Req. Level to high (max 120);"
		endif
		if req[1]>100
			res+="<font color='#ff0000'>-</font> Req. Alteration to high (max 100);"
		endif
		if req[2]>100
			res+="<font color='#ff0000'>-</font> Req. Conjuration to high (max 100);"
		endif
		if req[3]>100
			res+="<font color='#ff0000'>-</font> Req. Destruction to high (max 100);"
		endif
		if req[4]>100
			res+="<font color='#ff0000'>-</font> Req. Illusion to high (max 100);"
		endif
		if req[5]>100
			res+="<font color='#ff0000'>-</font> Req. Restoration to high (max 100);"
		endif
		if req[6]>100
			res+="<font color='#ff0000'>-</font> Req. Archery to high (max 100);"
		endif
		if req[7]>100
			res+="<font color='#ff0000'>-</font> Req. OneHanded to high (max 100);"
		endif
		if req[8]>100
			res+="<font color='#ff0000'>-</font> Req. TwoHanded to high (max 100);"
		endif
		if req[9]>100
			res+="<font color='#ff0000'>-</font> Req. Sneak to high (max 100);"
		endif
		if req[10]>200
			res+="<font color='#ff0000'>-</font> Req. Health to high (max 200);"
		endif
		if req[11]>200
			res+="<font color='#ff0000'>-</font> Req. Magicka to high (max 200);"
		endif
		if req[12]>100
			res+="<font color='#ff0000'>-</font> Req. Comprehension to high (max 100);"
		endif
		if req[13]>100
			res+="<font color='#ff0000'>-</font> Req. Block to high (max 100);"
		endif
		
		if bRankSuccess==true
			res+="<font color='#00FF00'>-</font> Rank is OK;"
		else
			bSuccess = false
			res+="<font color='#ff0000'>-</font> Rank was failed;"
		endif
	endWhile
	
	;Everything done
	perkTestResultText[lastPerkTested]=res
	if bSuccess==true
		SetTextOptionValue(UI_TestPerk[lastPerkTested], "$FW_MENU_BASIC_Success")
		perkTestResult[lastPerkTested]="$FW_MENU_BASIC_Success"
	else
		SetTextOptionValue(UI_TestPerk[lastPerkTested], "$FW_MENU_BASIC_Failed")
		perkTestResult[lastPerkTested]="$FW_MENU_BASIC_Failed"
	endif
	
	; Check next perk
	CheckNextPerk()
endFunction


function Upgrade(int oldVersion, int newVersion)
	System.UpdateState=0x21
	ResetConfigArrays()
	System.UpdateState=0x22
	if oldVersion<9
		; Difficulty has changed... +1
		If Difficulty==2
			Difficulty = 3
		elseif Difficulty == 1
			Difficulty = 2
		else
			Difficulty = 0
		endif
	endif
endFunction



; Compatiblity
; Ranks
; 0 = [No compatiblity yet]
; 1 = [Already compatible]
; 2 = [No compatiblity] [BFState] [DisableEachotherPregnancy]
function InitCompatiblity()
	CompatiblityModCount = 7
	CompatiblityModNames = new string[7]
	CompatiblityDefaultValue = new int[7]
	CompatiblityRank = new int[7]
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
		System.Message(System.Content.Compatiblity_Reset)
		Compatible = new int[7]
		int i=0
		while i<CompatiblityModCount
			Compatible[i] = CompatiblityDefaultValue[i]
			i+=1
		endWhile
	endif
	
	if UI_Compatible.length != 7
		UI_Compatible = new int[7]
	endif
endFunction

function SetCompatibleOptions()
	If (CompatibleOptions.Length != 6)
		CompatibleOptions = New String[6]
	EndIf
	If (CompatibleHighlightTexts.Length != 6)
		CompatibleHighlightTexts = New String[6]
	EndIf

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

int function GetCompatibleIndexByRank(int Rank, int index)
	if Rank==0
		return 0
	elseif Rank==1
		return 1
	elseif Rank==2
		if index==0
			return 0
		elseif index==1
			return 2
		elseif index==2
			return 3
		endif
	endif
endFunction

string[] function GetCompatibleOptions(int Rank)
	string[] res
	if Rank==0
		; Only got the Not Compatible option
		res = new string[1]
		res[0] = "$FW_MENU_OPTIONS_Compatible_None"
	elseif Rank==1
		; Only got the Full Compatible option
		res = new string[1]
		res[0] = "$FW_MENUTXT_OPTIONS_Compatible_Full"
	elseif Rank==2
		; Only got the Not Compatible option
		res = new string[3]
		res[0] = "$FW_MENU_OPTIONS_Compatible_None"
		res[1] = "$FW_MENU_OPTIONS_Compatible_ChangeBFState"
		res[2] = "$FW_MENUTXT_OPTIONS_Compatible_ForbideEachotherPregnancy"
	endif
	return res
endFunction

; HELPER FUNCTIONS


String Function GetTimeString(Float akTime, Bool akShortFormat = True, String akNegativeText = "", bool bShowMinutes=true)
	String sign = ""
	If (akTime < 0.0)
		If akNegativeText!=""
			Return akNegativeText
		EndIf
		sign = "-"
		akTime *= -1
	EndIf
	
	String timeString = ""
	
	; Days
	Int val = (akTime as Int)
	If val != 0
		If akShortFormat
			timeString += FWUtility.StringReplace(Content.Day_Short,"{0}",val)
		ElseIf val == 1
			timeString += FWUtility.StringReplace(Content.Day,"{0}",val)
		Else
			timeString += FWUtility.StringReplace(Content.Days,"{0}",val)
		EndIf
	EndIf
	akTime = (akTime - val) * 24
	
	; Hours
	val = (akTime as Int)
	If val != 0
		If akShortFormat
			timeString += FWUtility.StringReplace(Content.Hour_Short,"{0}",val)
		ElseIf val == 1
			timeString += FWUtility.StringReplace(Content.Hour,"{0}",val)
		Else
			timeString += FWUtility.StringReplace(Content.Hours,"{0}",val)
		EndIf
	EndIf
	akTime = (akTime - val) * 60
	
	; Minutes
	val = (akTime as Int)
	If val != 0 && bShowMinutes==true
		If akShortFormat
			timeString += FWUtility.StringReplace(Content.Minute_Short,"{0}",val)
		ElseIf val == 1
			timeString += FWUtility.StringReplace(Content.Minute,"{0}",val)
		Else
			timeString += FWUtility.StringReplace(Content.Minutes,"{0}",val)
		EndIf
	EndIf
	
	Return sign + timeString
EndFunction


function ResetActorBaseSettings(actor a)
	a.SetAnimationVariableBool("bSprintOK", true)
	a.ClearExpressionOverride()
	a.AllowPCDialogue(a.GetRace().AllowPCDialogue())
	FWUtility.ActorRemoveSpells(a, System.StatCycleID_List)
	FWUtility.ActorRemoveSpell(a, System.StatMenstruationCycle)
	FWUtility.ActorRemoveSpell(a, System.StatPregnancyCycle)
	System.Manager.removeCME(a,-1)
endFunction

string Function GetEggState()
	If System.Player && (System.Player.currentState == 1)
		If Utility.GetCurrentGameTime() - System.Player.stateEnterTime < (OvulationDuration * 0.5)
			Return "$FW_MENU_OPTIONS_Travelling"
		Else
			Return "$FW_MENU_OPTIONS_InUterus"
		EndIf
	EndIf
EndFunction

function ResetSystem(bool ResetBaseSystem = true) ;***Edit by BAne
	; Deactivate all
	if ResetBaseSystem
		System.Stop()
	endif
	
	int i = System.ChildSettings.ChildPerkFile.length
	while i >0
		i-=1
		System.ChildSettings.ChildPerkX[i]=0
		System.ChildSettings.ChildPerkY[i]=0
		System.ChildSettings.ChildPerkRank[i]=0
		System.ChildSettings.ChildPerkBool[i]=false
		System.ChildSettings.ChildPerkFile[i]=""
	endWhile
	
	System.Controller.Stop()
	System.Manager.Stop()
	System.Content.Stop()
	System.BabyItemList.Stop()
	System.StateWidget.Stop()
	System.ContraceptionWidget.Stop()
	System.BabyHealthWidget.Stop()
	System.ChildSettings.Stop()
	
	if System.Player!=none
		System.Player.dispel()
	endif
	if System.PlayerMale!=none
		System.PlayerMale.dispel()
	endif
	
	; Restart all
	if ResetBaseSystem
		System.Start()
	endif
	int WaitforSystem = 5
	while WaitforSystem >0 
		WaitforSystem -=1
		If System.IsRunning()
			WaitforSystem = 0
		EndIf
	endWhile
	System.Controller.Start()
	System.Manager.Start()
	System.Content.Start()
	System.BabyItemList.Start()
	System.StateWidget.Start()
	System.ContraceptionWidget.Start()
	System.BabyHealthWidget.Start()
	System.ChildSettings.Start()
	
	; Run the Reset-Function
	System.ChildSettings.ResetChildPerks() ;Edit by Bane
	System.StateWidget.OnWidgetReset()
	System.ContraceptionWidget.OnWidgetReset()
	System.BabyHealthWidget.OnWidgetReset()
	
	; Run OnPlayerLoadGame()
	int ac = GetNumAliases()
	bool bFoundPlayer = false
	while ac>0
		ac-=1
		Referencealias ra = GetNthAlias(ac) as Referencealias
		if ra.GetActorReference() != none  ;**edit by Bane
			(ra as FWPlayerAlias).OnModReset() ;**edit by Bane
			if ra.GetActorReference() == Game.GetPlayer()
				bFoundPlayer = true
			endif
		endif
	endWhile
	if bFoundPlayer==false
		Debug.Notification(Content.Req_PlayerNotFoundOnRef)
		Debug.Notification(Content.FixProblem)
		(GetAlias(0) as ReferenceAlias).ForceRefTo(Game.GetPlayer())
	endif
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
	SendModEvent("FWAddOnRefresh", "",0.0)
	System.Content.LoadContent()
	System.ChildSettings.RegisterChildPerk()
	
	System.ReNewSpells()
	System.OnGameLoad(true) ;***Edit by Bane
endFunction


;  0 - Impregnate PC
;  1 - Force birth
;  2 - Speed up recovery
;  3 - Locked
; -1 - Undefined
int Function GetJobID(actor target = none)
	if target==none
		If System.Player
			If System.Player.currentState>=4 && System.Player.currentState <20
				If System.Player.CurrentState >=4 && System.Player.CurrentState<7
					Return 1
				Else
					Return 2
				EndIf
			elseif System.Player.currentState >= 20
				return 3
			Else
				Return 0
			EndIf
		EndIf
	else
		int npcState = System.Controller.GetFemaleState(target)
		If npcState>=4 && npcState <20
			If npcState >=4 && npcState<7
				Return 1
			Else
				Return 2
			EndIf
		elseif npcState >= 20
			return 3
		Else
			Return 0
		EndIf
	endif
	Return -1
EndFunction

string Function GetJobTitle(actor target = none)
	if target==none
		If System.Player!=none
			If System.Player.currentState>=4 && System.Player.currentState <20
				If System.Player.currentState <= 6
					Return "$FW_MENU_OPTIONS_ForceBirth"
				Else
					Return "$FW_MENU_OPTIONS_SpeedUpRecovery"
				EndIf
			elseif System.Player.currentState >= 20
				Return "$FW_MENU_OPTIONS_Locked"
			Else
				Return "$FW_MENU_OPTIONS_Impregnation"
			EndIf
		EndIf
	else
		int npcState = System.Controller.GetFemaleState(target)
		If npcState>=4 && npcState <20
			If npcState <= 6
				Return "$FW_MENU_OPTIONS_ForceBirth"
			Else
				Return "$FW_MENU_OPTIONS_SpeedUpRecovery"
			EndIf
		elseif npcState >= 20
			Return "$FW_MENU_OPTIONS_Locked"
		Else
			Return "$FW_MENU_OPTIONS_Impregnation"
		EndIf
	endif
	Return "$FW_MENU_OPTIONS_None"
EndFunction

string function getNumberOfChilds()
	If System.Player.currentState>=4 && System.Player.currentState <20
		if System.Player.currentState  >= 5
			return System.Player.NumChilds
		else
			return "$FW_MENU_OPTIONS_UnknownChildNumber"
		endIf
	endIf
endFunction

string function getRemainingTime(bool mayBeZero = true)
	string signed = ""
	float xtime = System.Player.timeRemaining()
	if xtime < 0 && mayBeZero == true
		signed = " - "
		xtime *= -1
	elseif xtime < 0 && mayBeZero == false
		return "$FW_MENU_OPTIONS_Overdue"
	endIf
	;return xtime
	int days = Math.Floor(xtime)
	xtime -= days
	int hour = Math.Floor(24 * xtime)
	int min = Math.Floor(60 * ((24 * xtime) - hour ))
	return signed + days + "d " + hour + "h " + min + "m"
endFunction

int function getContraception()
	;return (StorageUtil.GetFloatValue( Game.GetPlayer(),"FW.Contraception",0) as int)
	float res = System.Controller.getContraception(Game.GetPlayer())
	return res as int
endFunction

string function getContraceptionTime()
	if System.Controller.getContraception(Game.GetPlayer()) > 1.5
		float cTime = StorageUtil.GetFloatValue( Game.GetPlayer(),"FW.ContraceptionTime",0)
		float GT = Utility.GetCurrentGameTime()
		float cDur = System.MaxContraceptionTime
		
		return GetTimeString((cTime + cDur) - GT,true,"$FW_MENU_OPTIONS_Contraception_delay",false)
	else
		return "$FW_MENU_OPTIONS_Contraception_none"
	endIf
endFunction

string function OvulationPainString()
	if System.Player.stateDamageScale == 0
		return " - "
	elseif System.Player.stateDamageScale < 0.3
		return "$FW_MENU_OPTIONS_Painless"
	elseif System.Player.stateDamageScale < 0.6
		return "$FW_MENU_OPTIONS_Humane"
	elseif System.Player.stateDamageScale < 1.0
		return "$FW_MENU_OPTIONS_Easy"
	elseif System.Player.stateDamageScale < 1.5
		return "$FW_MENU_OPTIONS_Hurts"
	elseif System.Player.stateDamageScale < 1.8
		return "$FW_MENU_OPTIONS_Painful"
	elseif System.Player.stateDamageScale < 2.2
		return "$FW_MENU_OPTIONS_VeryPainful"
	else
		return "$FW_MENU_OPTIONS_Dolorous"
	endIf
endFunction

string function MenstruationPainString()
	if System.Player.stateDamageScale == 0
		return " - "
	elseif System.Player.stateDamageScale < 0.3
		return "$FW_MENU_OPTIONS_Painless"
	elseif System.Player.stateDamageScale < 0.6
		return "$FW_MENU_OPTIONS_Humane"
	elseif System.Player.stateDamageScale < 1.0
		return "$FW_MENU_OPTIONS_Easy"
	elseif System.Player.stateDamageScale < 1.5
		return "$FW_MENU_OPTIONS_Hurts"
	elseif System.Player.stateDamageScale < 1.8
		return "$FW_MENU_OPTIONS_Painful"
	elseif System.Player.stateDamageScale < 2.2
		return "$FW_MENU_OPTIONS_VeryPainful"
	else
		return "$FW_MENU_OPTIONS_Dolorous"
	endIf
endFunction

Function SetBabySpawnOptions()
	If (BabySpawnOptions.Length != 4)
		BabySpawnOptions = New String[4]
	EndIf
	If (BabySpawnHighlightTexts.Length != 4)
		BabySpawnHighlightTexts = New String[4]
	EndIf
	
	BabySpawnOptions[0] = "$FW_MENU_OPTIONS_None"
	BabySpawnHighlightTexts[0] = "$FW_MENUTXT_OPTIONS_BabySpawnNone"
	
	BabySpawnOptions[1] = "$FW_MENU_OPTIONS_BabyActor"
	BabySpawnHighlightTexts[1] = "$FW_MENUTXT_OPTIONS_BabySpawnActor"
	
	BabySpawnOptions[2] = "$FW_MENU_OPTIONS_BabyItem"
	BabySpawnHighlightTexts[2] = "$FW_MENUTXT_OPTIONS_BabySpawnItem"
	
	BabySpawnOptions[3] = "$FW_MENU_OPTIONS_BabySoul"
	BabySpawnHighlightTexts[3] = "$FW_MENUTXT_OPTIONS_BabySpawnSoul"
EndFunction

Function SetDifficultyOptions()
	If (DifficultyOptions.Length != 5)
		DifficultyOptions = New String[5]
	EndIf
	If (DifficultyHighlightTexts.Length != 5)
		DifficultyHighlightTexts = New String[5]
	EndIf
	
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
EndFunction

Function SetMessagesOptions()
	If (MessagesOptions.Length != 6)
		MessagesOptions = New String[6] 
	EndIf
	If (MessagesHighlightTexts.Length != 6)
		MessagesHighlightTexts = New String[6] 
	EndIf
	
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
EndFunction

Function SetVisualScalingOptions()
	If (VisualScalingOptions.Length != 4)
		VisualScalingOptions = New String[4]
	EndIf
	If (VisualScalingHighlightTexts.Length != 4)
		VisualScalingHighlightTexts = New String[4]
	EndIf
	
	VisualScalingOptions[0] = "$FW_MENU_OPTIONS_None"
	VisualScalingHighlightTexts[0] = "$FW_MENUTXT_OPTIONS_VisualScalingNone"
	
	VisualScalingOptions[1] = "$FW_MENU_OPTIONS_VisualScaleSkeleton"
	VisualScalingHighlightTexts[1] = "$FW_MENUTXT_OPTIONS_VisualScalingSkel"
	
	VisualScalingOptions[2] = "$FW_MENU_OPTIONS_VisualScaleSkeletonNi"
	VisualScalingHighlightTexts[2] = "$FW_MENUTXT_OPTIONS_VisualScalingSkelNi"
	
	VisualScalingOptions[3] = "$FW_MENU_OPTIONS_VisualScaleWeight"
	VisualScalingHighlightTexts[3] = "$FW_MENUTXT_OPTIONS_VisualScalingWeight"
EndFunction

Function SetVisualScalingKindOptions()
	If (VisualScalingKindOptions.Length != 6)
		VisualScalingKindOptions = New String[6]
	EndIf
	If (VisualScalingKindHighlightTexts.Length != 6)
		VisualScalingKindHighlightTexts = New String[6]
	EndIf
	
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
EndFunction

Function ResetMenuArrays()
	SetBabySpawnOptions()
	SetDifficultyOptions()
	SetMessagesOptions()
	SetVisualScalingOptions()
	SetVisualScalingKindOptions()
	SetCompatibleOptions()
EndFunction

function ResetConfigArrays()
	UI_AddOnRaces = new int[128]
	UI_AddOnPMS = new int[128]
	UI_AddOnCME = new int[128]
	UI_AddOnMisc = new int[128]
	UI_SpermInside = new int[128]
	UI_Child = new int[128]
	UI_TestPerk = new int[128]
	perkTestResultText = new string[128]
	perkTestResult = new string[128]
	int i = 0
	while i<128
		perkTestResult[i]="Progress"
		perkTestResultText[i]=""
		i+=1
	endWhile
	
	Pages = new string[10]
	Pages[FW_MENU_PAGE_Settings] = "$FW_MENU_PAGE_Settings"
	Pages[FW_MENU_PAGE_Cycle] = "$FW_MENU_PAGE_Cycle"
	Pages[FW_MENU_PAGE_Pregnancy] = "$FW_MENU_PAGE_Pregnancy"
	Pages[FW_MENU_PAGE_Impregnate] = "$FW_MENU_PAGE_Impregnate"
	Pages[FW_MENU_PAGE_Male] = "$FW_MENU_PAGE_Male"
	Pages[FW_MENU_PAGE_Children] = "$FW_MENU_PAGE_Children"
	Pages[FW_MENU_PAGE_AddOn] = "$FW_MENU_PAGE_AddOn"
	Pages[FW_MENU_PAGE_Info] = "$FW_MENU_PAGE_Info"
	Pages[FW_MENU_PAGE_Cheat] = "$FW_MENU_PAGE_Cheat"
	Pages[FW_MENU_PAGE_System] = "$FW_MENU_PAGE_System"
	
	ResetMenuArrays()
endFunction

; EVENTS
event OnConfigOpen()
	bTestPerkRan=false
	bTestPerkMode=false
	selectedPerk=-1
	lastPerkTested=-1
	int i = 0
	while i<128
		perkTestResult[i]="Progress"
		perkTestResultText[i]=""
		i+=1
	endWhile
endEvent

Event OnConfigInit()
	ResetConfigArrays()
EndEvent

Event OnVersionUpdate(int version)
	System = Game.GetFormFromFile(0xD63, "BeeingFemale.esm") as FWSystem
	content = Game.GetFormFromFile(0x3e31, "BeeingFemale.esm") as FWTextContents
	If (CurrentVersion < FWVersion.GetMCMVersion()) && (CurrentVersion > 1)
		; All upgrades run on System
		System.Upgrade(CurrentVersion,FWVersion.GetMCMVersion())
		CurrentVersion = FWVersion.GetMCMVersion()
	EndIf
EndEvent

int function GetPageResetJobID()
	return PageResetJobID
endfunction


int PageResetJobID=0
Event OnPageReset(string page)
	RegisterForUpdate(10)
	; Check if BeeingFemale is still loading
	int LoadingStateSystem = FWUtility.SwitchInt(System==none, 255, System.LoadState)
	int UpdateStateSystem = FWUtility.SwitchInt(System==none, 255, System.UpdateState)
	int LoadingStateChildSettings = FWUtility.SwitchInt(System.ChildSettings==none, 255, System.ChildSettings.LoadingState)
	int LoadingStateManager = FWUtility.SwitchInt(System.Manager==none, 255, System.Manager.LoadingState)
	
	if (System.LoadState>0 || UpdateStateSystem>0 || LoadingStateChildSettings>0 || LoadingStateManager>0 || PageResetJobID>0) && bForceMenu==false
		SetTitleText("Beeing Female v" + FWVersion.GetVersionString())
		AddTextOption("Beeing Female is loading...","")
		AddTextOption("Loading Code:",FWUtility.Hex(LoadingStateSystem,2) + " " + FWUtility.Hex(UpdateStateSystem,2) + " " + FWUtility.Hex(LoadingStateChildSettings,2) + " " + FWUtility.Hex(LoadingStateManager,2) + " " + FWUtility.Hex(PageResetJobID,2))
		AddEmptyOption()
		AddTextOptionST("TextForceMenu", "$FW_MENU_SETTINGS_ForceMenu", "")
		return
	endif
	
	PageResetJobID=1
	
	; Chjeck if BeeingFemale is disabled or not.
	; A reason could't be that SKSE or PapyrusUtil is not installed.
	If System.ModEnabled.GetValueInt()==0 && System.CloakingSpellEnabled.GetValueInt()==0 && bForceMenu==false
		SetTitleText("Beeing Female v" + FWVersion.GetVersionString())
		AddTextOption("Beeing Female is Disabled","")
		AddEmptyOption()
		AddTextOptionST("TextForceMenu", "$FW_MENU_SETTINGS_ForceMenu", "")
		return
	endif
	
	PageResetJobID=2
	
	; Reset Perk-Test properties, when not in Debug-Page
	if page != Pages[FW_MENU_PAGE_Cheat]
		selectedPerk=-1
		bTestPerkMode=false
	endif
	PageResetJobID=2
	; Reset AddOn Selection properties, when not in Debug-Page
	if page != Pages[FW_MENU_PAGE_AddOn]
		AddOnActiveRaces=-1
		AddOnActiveCME=-1
		AddOnActiveMisc=-1
	endif
	PageResetJobID=3
	
	
	; the bSSL Variable defines if SexLab Framework is active or not
	bool bSSL = System.Manager.IsAddOnActive("BF_SSL")
	PageResetJobID=4
	bool bPlayerAllowed = System.IsValidateActor(Game.GetPlayer(), true) > 0
	bool bPlayerIsFemale= Game.GetPlayer().GetLeveledActorBase().GetSex()==1
	PageResetJobID=5
	if !bSSL
		CreatureSperm=false
	endif
	
	; When the page is empty, load the Title-Screen, Otherwise unload it
	If page == ""
		if SexModInstalled==true
			PageResetJobID=6
			LoadCustomContent("beeingfemale/beeingfemale.dds", 60, 31) ; Adult Title
		else
			PageResetJobID=7
			LoadCustomContent("beeingfemale/beeingfemale2.dds", 60, 31) ; Non-Adult Title
		endif
		;SendModEvent("FWRefreshAddIns")
		PageResetJobID=8
		SetTitleText("Beeing Female v" + FWVersion.GetVersionString())
		PageResetJobID=9
		ResetMenuArrays()
	Else
		PageResetJobID=10
		UnloadCustomContent()
	EndIf
	PageResetJobID=11
	
	
	; Here some variables for future use are defined
	int optionFlag = OPTION_FLAG_NONE
	float currentTime = Utility.GetCurrentGameTime()
	int i = 0
	int j = 0
	PageResetJobID=12
	
	; Load the General Properties
	If page == Pages[FW_MENU_PAGE_Settings]
		PageResetJobID=13
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		; Left column
		SetCursorPosition(0)
		
		AddHeaderOption("$FW_MENU_SETTINGS_Settings")
		AddMenuOptionST("MenuDifficulty", "$FW_MENU_SETTINGS_Difficulty", DifficultyOptions[Difficulty])
		AddMenuOptionST("MenuMessages", "$FW_MENU_SETTINGS_Messages", MessagesOptions[Messages])
		if System.Player!=none
			AddToggleOptionST("TogglePlayerTimer", "$FW_MENU_SETTINGS_PlayerTimer", PlayerTimer)
		endIf
		if bPlayerInfoSpell==true && System.BeeingFemaleInfoSpell!=none
			AddToggleOptionST("ToggleShowStatsSpell", "$FW_MENU_SETTINGS_StatsSpell", Game.GetPlayer().hasSpell(System.BeeingFemaleInfoSpell))
		endIf
		AddToggleOptionST("ToggleAbortus","$FW_MENU_PREGNANCY_Abortus", abortus, optionFlag)
		
		; Check for animation
		AddToggleOptionST("TogglePlayAnimations","$FW_MENU_SETTINGS_PlayAnimations", PlayAnimations, OPTION_FLAG_NONE)
		
		AddToggleOptionST("ToggleImpregnateLoreFriendly","$FW_MENU_Impregnate_LoreFriendly", ImpregnateLoreFriendly, OPTION_FLAG_NONE)
		
		if(bSSL)
			; Creature Sperm is only for SexLab Framework allowed
			AddHeaderOption("$FW_MENU_SETTINGS_Creature")
			AddToggleOptionST("ToggleCreatureSperm", "$FW_MENU_SETTINGS_CreatureSperm", CreatureSperm, OPTION_FLAG_NONE)
		endif
		
		AddHeaderOption("$FW_MENU_SETTINGS_Key")
		AddKeyMapOptionST("KeyMapShowState", "$FW_MENU_SETTINGS_ShowStatesKey", KeyStateWidget)
		
		; Right column
		SetCursorPosition(1)
		
		AddHeaderOption("$FW_MENU_SETTINGS_Relevant")
		if bPlayerIsFemale==true
			AddToggleOptionST("ToggleRelevantPlayer", "$FW_MENU_SETTINGS_RelevantPlayer", RelevantPlayer, SwitchInt(bPlayerAllowed,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		else
			AddToggleOptionST("ToggleRelevantPlayerDisabled", "$FW_MENU_SETTINGS_RelevantPlayer", false, OPTION_FLAG_DISABLED)
		endif
		AddToggleOptionST("ToggleRelevantFollower", "$FW_MENU_SETTINGS_RelevantFollower", RelevantFollower)
		AddToggleOptionST("ToggleRelevantNPC", "$FW_MENU_SETTINGS_RelevantNPC", RelevantNPC)
		
		AddHeaderOption("$FW_MENU_SETTINGS_NPCSettings")
		AddToggleOptionST("ToggleNPCPregnancy", "$FW_MENU_SETTINGS_NPCPregnant", NPCCanBecomePregnant)
		AddToggleOptionST("ToggleNPCPains", "$FW_MENU_SETTINGS_NPCPain", NPCFeelPain)
		AddToggleOptionST("ToggleNPCBleeding", "$FW_MENU_SETTINGS_NPCBleed", NPCMenstruationBlood)
		AddToggleOptionST("ToggleNPCMood", "$FW_MENU_SETTINGS_NPCMood", NPCMenstrualMood)
		AddToggleOptionST("ToggleNPCNoTalk", "$FW_MENU_SETTINGS_NPCWayward", NPCMenstrualNoTalk)
		AddToggleOptionST("ToggleNPCBabySpawn", "$FW_MENU_SETTINGS_NPCSpawnBabies", NPCBornChild)
		AddToggleOptionST("ToggleNPCHaveItems", "$FW_MENU_SETTINGS_NPCHaveItems", NPCHaveItems)
	
	; Menstrual Cycle Properties
	ElseIf page == Pages[FW_MENU_PAGE_Cycle]
		PageResetJobID=14
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		; Left column
		SetCursorPosition(0)
		
		AddHeaderOption("$FW_MENU_CYCLE_PhaseDurations")
		AddSliderOptionST("SliderFollicularDuration", "$FW_MENU_CYCLE_FollicularPhase", FollicularDuration, "$FW_MENU_BASIC_Days", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderOvulationDuration", "$FW_MENU_CYCLE_Ovulation", OvulationDuration, "$FW_MENU_BASIC_Days", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderLutealDuration", "$FW_MENU_CYCLE_LutealPhase", LutealDuration, "$FW_MENU_BASIC_Days", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderMenstruationDuration", "$FW_MENU_CYCLE_Menstruation", MenstrualDuration, "$FW_MENU_BASIC_Days", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderIrregulationChance", "$FW_MENU_CYCLE_IrregulationChance", irregulationChance, "{1}%", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		
		AddEmptyOption()
		AddHeaderOption("$FW_MENU_CYCLE_TitleMenstruation")
		AddSliderOptionST("SliderPMSChance", "$FW_MENU_CYCLE_PMSChance", PMSChance, "{1}%")
		AddSliderOptionST("SliderPMSNoEffects", "$FW_MENU_CYCLE_PMSEffects", PMSEffects, "$FW_MENU_BASIC_Effects")
		AddToggleOptionST("ToggleMenstrualBlood", "$FW_MENU_CYCLE_MenstrualBlood", System.GlobalMenstruating.GetValueInt()==1)
		AddSliderOptionST("SliderMenstrualCrampsChance", "$FW_MENU_CYCLE_MenstrualCramps", MenstrualCramps, "{1}%")
		
		; Right column
		SetCursorPosition(1)
		AddHeaderOption("$FW_MENU_CYCLE_Conception")
		AddSliderOptionST("SliderConceptionChance", "$FW_MENU_CYCLE_ConceiveChance", ConceiveChance, "{1}%", SwitchInt(bPlayerAllowed && RelevantPlayer && bPlayerIsFemale,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderConceptionChanceFollower", "$FW_MENU_CYCLE_ConceiveChanceFollower", ConceiveChanceFollower, "{1}%",SwitchInt(RelevantFollower,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderConceptionChanceNPC", "$FW_MENU_CYCLE_ConceiveChanceNPC", ConceiveChanceNPC, "{1}%",SwitchInt(RelevantNPC,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		
		AddEmptyOption()
		AddHeaderOption("$FW_MENU_CYCLE_WashingOutSperm")
		AddSliderOptionST("SliderWashOutDelay", "$FW_MENU_CYCLE_MaximumSpermAge", WashOutHourDelay * 24, "$FW_MENU_BASIC_DecHours")
		AddSliderOptionST("SliderWashOutChance", "$FW_MENU_CYCLE_UnassistedSafeZone", (WashOutChance * 100) as int, "{1}%")
		AddSliderOptionST("SliderWashOutWaterChance", "$FW_MENU_CYCLE_WaterAssistedSafeZone", (WashOutWaterChance * 100) as int, "{1}%")
		AddSliderOptionST("SliderWashOutFluidChance", "$FW_MENU_CYCLE_AntiSpermEssenceSafeZone", (WashOutFluidChance * 100) as int, "{1}%")
	
	
	; Pregnancy and Birth seeetings
	ElseIf page == Pages[FW_MENU_PAGE_Pregnancy]
		PageResetJobID=15
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		; Left column
		SetCursorPosition(0)
		
		AddHeaderOption("$FW_MENU_PREGNANCY_PregnancyDuration")
		AddSliderOptionST("SliderTrimester1Duration", "$FW_MENU_PREGNANCY_1Trimester", Trimster1Duration, "$FW_MENU_BASIC_Days", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderTrimester2Duration", "$FW_MENU_PREGNANCY_2Trimester", Trimster2Duration, "$FW_MENU_BASIC_Days", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderTrimester3Duration", "$FW_MENU_PREGNANCY_3Trimester", Trimster3Duration, "$FW_MENU_BASIC_Days", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		AddSliderOptionST("SliderRecoveryDuration", "$FW_MENU_PREGNANCY_RecoveryPhase", ReplanishDuration, "$FW_MENU_BASIC_Days", SwitchInt(bChangeDuration,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
		
		AddEmptyOption()
		AddHeaderOption("$FW_MENU_PREGNANCY_Multiples")
		AddSliderOptionST("SliderMultiplesThreshold", "$FW_MENU_PREGNANCY_MultiplesChance", MultipleThreshold, "1:{0}")
		AddSliderOptionST("SliderMultiplesNoMax", "$FW_MENU_PREGNANCY_MaxMultiples", MaxBabys, "$FW_MENU_BASIC_Baby")
		
		AddHeaderOption("$FW_MENU_PREGNANCY_General")
		
		AddMenuOptionST("MenuBabySpawn", "$FW_MENU_PREGNANCY_SpawnType", BabySpawnOptions[BabySpawn],OPTION_FLAG_NONE)
		AddMenuOptionST("MenuBabySpawnNPC", "$FW_MENU_PREGNANCY_SpawnTypeNPC", BabySpawnOptions[BabySpawnNPC], SwitchInt(RelevantFollower || RelevantNPC,OPTION_FLAG_NONE, OPTION_FLAG_DISABLED))
	
		; Right column
		SetCursorPosition(1)
		
		AddHeaderOption("$FW_MENU_PREGNANCY_VisualScaling")
		AddMenuOptionST("MenuVisualScaling", "$FW_MENU_PREGNANCY_VisualScalingType", VisualScalingOptions[VisualScaling])
		AddMenuOptionST("MenuScalingKind", "$FW_MENU_PREGNANCY_VisualScalingKind", VisualScalingKindOptions[VisualScalingKind])
		
		optionFlag = OPTION_FLAG_DISABLED
		If VisualScaling == 1 || VisualScaling == 2
			optionFlag = OPTION_FLAG_NONE
		EndIf
		AddEmptyOption()
		AddHeaderOption("$FW_MENU_PREGNANCY_NodeScalingOptions")
		AddToggleOptionST("ToggleBellyScale","$FW_MENU_PREGNANCY_BellyScale", BellyScale, optionFlag)
		AddToggleOptionST("ToggleBreastScale","$FW_MENU_PREGNANCY_BreastScale", BreastScale, optionFlag)
		
		optionFlag = OPTION_FLAG_DISABLED
		If (VisualScaling == 1 || VisualScaling == 2 || VisualScaling == 4) && BellyScale==true
			optionFlag = OPTION_FLAG_NONE
		EndIf
		AddSliderOptionST("SliderBellyScaleMax", "$FW_MENU_PREGNANCY_BellyMaxScale", BellyMaxScale, "{1}", optionFlag)
		
		optionFlag = OPTION_FLAG_DISABLED
		If (VisualScaling == 1  || VisualScaling == 2 || VisualScaling == 4) && BreastScale==true
			optionFlag = OPTION_FLAG_NONE
		EndIf
		AddSliderOptionST("SliderBreastScaleMax", "$FW_MENU_PREGNANCY_BreastsMaxScale", BreastsMaxScale, "{1}", optionFlag)
		
		optionFlag = OPTION_FLAG_DISABLED
		If VisualScaling == 3
			optionFlag = OPTION_FLAG_NONE
		EndIf
		AddEmptyOption()
		AddHeaderOption("$FW_MENU_PREGNANCY_WeightScalingOptions")
		AddSliderOptionST("SliderWeightGainMax", "$FW_MENU_PREGNANCY_MaxWeightGain", WeightGainMax, "{0}", optionFlag)
	
	
	
	; Impregnantion Properties
	ElseIf page==Pages[FW_MENU_PAGE_Impregnate]
		PageResetJobID=16
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		; Left column
		SetCursorPosition(0)
		optionFlag = OPTION_FLAG_DISABLED
		If ImpregnateActive && (RelevantNPC || RelevantFollower)
			optionFlag = OPTION_FLAG_NONE
		EndIf
		
		AddHeaderOption("$FW_MENU_Impregnate_RandomNpc")
		if RelevantNPC || RelevantFollower
			AddToggleOptionST("ToggleImpregnateActive","$FW_MENU_Impregnate_Activate", ImpregnateActive, OPTION_FLAG_NONE)
		else
			AddTextOption("$FW_MENU_Impregnate_ActivateDis1","",OPTION_FLAG_DISABLED)
			AddTextOption("$FW_MENU_Impregnate_ActivateDis2","",OPTION_FLAG_DISABLED)
			AddToggleOptionST("ToggleImpregnateActive","$FW_MENU_Impregnate_Activate", ImpregnateActive, OPTION_FLAG_DISABLED)
		endif
		AddSliderOptionST("SliderImpregnateTime", "$FW_MENU_Impregnate_Time", ImpregnateTime, "$FW_MENU_BASIC_Time", optionFlag)
		AddSliderOptionST("SliderImpregnateCount", "$FW_MENU_Impregnate_Count", ImpregnateCount, "$FW_MENU_BASIC_NPCs", optionFlag)
		AddEmptyOption()
		
		AddHeaderOption("$FW_MENU_Impregnate_Who")
		AddToggleOptionST("ToggleImpregnateHusband","$FW_MENU_Impregnate_Husband", ImpregnateHusband, optionFlag)
		AddToggleOptionST("ToggleImpregnateAffairs","$FW_MENU_Impregnate_Affairs", ImpregnateAffairs, optionFlag)
		AddToggleOptionST("ToggleImpregnatePartners","$FW_MENU_Impregnate_Partners", ImpregnatePartners, optionFlag)
		AddToggleOptionST("ToggleImpregnateLastNPC","$FW_MENU_Impregnate_LastNPC", ImpregnateLastNPC, optionFlag)
		
		AddToggleOptionST("ToggleImpregnatePlayerSpouse","$FW_MENU_Impregnate_PlayerSpouse", ImpregnatePlayerSpouse, optionFlag)
		
		
		; Right column
		SetCursorPosition(1)
		AddHeaderOption("$FW_MENU_Impregnate_Player")
		if RelevantPlayer && bPlayerIsFemale
			PageResetJobID=17
			If ImpregnatePlayerSleep
				optionFlag = OPTION_FLAG_NONE
			else
				optionFlag = OPTION_FLAG_DISABLED
			EndIf
			AddToggleOptionST("ToggleImpregnatePlayerSleep","$FW_MENU_Impregnate_PlayerSleep", ImpregnatePlayerSleep, OPTION_FLAG_NONE)
			AddSliderOptionST("SliderImpregnatePlayerChance", "$FW_MENU_Impregnate_PlayerChance", ImpregnatePlayerChance, "{0}%", optionFlag)
			AddToggleOptionST("ToggleImpregnatePlayerHusband","$FW_MENU_Impregnate_PlayerHusband", ImpregnatePlayerHusband, optionFlag)
			AddToggleOptionST("ToggleImpregnatePlayerFollower","$FW_MENU_Impregnate_PlayerFollower", ImpregnatePlayerFollower, optionFlag)
			AddToggleOptionST("ToggleImpregnateLastPlayerNPCs","$FW_MENU_Impregnate_PlayerNPCs", ImpregnateLastPlayerNPCs, optionFlag)
			AddToggleOptionST("ToggleImpregnatePlayerAmbient","$FW_MENU_Impregnate_PlayerAmbient", ImpregnatePlayerAmbient, optionFlag)
		else
			PageResetJobID=18
			AddTextOption("$FW_INFOWINDOW_ForbiddenReason5","",OPTION_FLAG_DISABLED)
			AddToggleOptionST("ToggleImpregnatePlayerSleep","$FW_MENU_Impregnate_PlayerSleep", ImpregnatePlayerSleep, OPTION_FLAG_DISABLED)
			AddSliderOptionST("SliderImpregnatePlayerChance", "$FW_MENU_Impregnate_PlayerChance", ImpregnatePlayerChance, "{0}%", OPTION_FLAG_DISABLED)
			AddToggleOptionST("ToggleImpregnatePlayerHusband","$FW_MENU_Impregnate_PlayerHusband", ImpregnatePlayerHusband, OPTION_FLAG_DISABLED)
			AddToggleOptionST("ToggleImpregnatePlayerFollower","$FW_MENU_Impregnate_PlayerFollower", ImpregnatePlayerFollower, OPTION_FLAG_DISABLED)
			AddToggleOptionST("ToggleImpregnateLastPlayerNPCs","$FW_MENU_Impregnate_PlayerNPCs", ImpregnateLastPlayerNPCs, OPTION_FLAG_DISABLED)
			AddToggleOptionST("ToggleImpregnatePlayerAmbient","$FW_MENU_Impregnate_PlayerAmbient", ImpregnatePlayerAmbient, OPTION_FLAG_DISABLED)
		endif
	
	
	; Male Properties
	ElseIf page==Pages[FW_MENU_PAGE_Male]
		PageResetJobID=19
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		; Left column
		SetCursorPosition(0)
		
		AddHeaderOption("$FW_MENU_MEN_Sperm")
		AddSliderOptionST("SliderMaleVirility", "$FW_MENU_MEN_MaleVirility", (MaleVirilityRecovery * 24) as int, "$FW_MENU_BASIC_Hours")
		AddSliderOptionST("SliderSpermDuration", "$FW_MENU_MEN_SpermDuration", SpermDuration, "$FW_MENU_BASIC_DecDays")
		If(bSSL)
			; Anal Option is only allowed for SexLab
			AddSliderOptionST("SliderNoVaginalCumChance", "$FW_MENU_MEN_NoVaginalCumChance", NoVaginalCumChance, "{0}%")
		endif
	
		; Right column
		SetCursorPosition(1)
	
	
	; List of your Children
	ElseIf page==Pages[FW_MENU_PAGE_Children]
		PageResetJobID=20
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("$FW_MENU_CHILDREN_Settings")
		AddToggleOptionST("ToggleBabyMayCry","$FW_MENU_CHILDREN_MayCry", ChildrenMayCry, OPTION_FLAG_NONE)
		
		SetCursorPosition(1)
		AddHeaderOption("$FW_MENU_CHILDREN_YourChildren")
		int c = StorageUtil.FormListCount(none, "FW.Babys")
		int ind = 0
		int n = 0
		actor player = Game.GetPlayer()
		PageResetJobID=21
		while ind<c
			FWChildActor ca = StorageUtil.FormListGet(none, "FW.Babys", ind) as FWChildActor
			If(ca != none)
				If(ca as FWChildActorPlayer != none || StorageUtil.GetFormValue(ca, "FW.Child.Mother", none) == player || StorageUtil.GetFormValue(ca, "FW.Child.Father", none) == player)
					UI_Child[n] = AddTextOption(ca.GetDisplayName(), "")
					n+=1
				endif
			endif
			ind+=1
		endwhile
		
	
	; List of AddOns
	ElseIf page==Pages[FW_MENU_PAGE_AddOn]
		PageResetJobID=22
		int offset = 0
		
		; Check if an Race-AddOn was selected. Display the Race-AddOn Infos
		if AddOnActiveRaces>=0
			string f = UIS_AddOnRaces[AddOnActiveRaces]
			
			bool bAddOnEnabled=FWUtility.getIniCBool("AddOn",f,"AddOn","enabled",false)
			bool bAddOnLocked=FWUtility.getIniCBool("AddOn",f,"AddOn","locked",false)
			string sAddOnName=FWUtility.getIniCString("AddOn",f,"AddOn","name","")
			string sAddOnType=FWUtility.getIniCString("AddOn",f,"AddOn","type","")
			string author = FWUtility.getIniCString("AddOn",f,"AddOn","author",f)
			string required = FWUtility.getIniCString("AddOn",f,"AddOn","required","")
			bool bUse=true
			if required!=""
				string[] requiredA = StringUtil.Split(required,",")
				if FWUtility.AreModsInstalled(requiredA)==false
					bUse=false
				endif
			endif
		
			SetCursorFillMode(LEFT_TO_RIGHT)
			SetCursorPosition(offset)
			AddHeaderOption("Race AddOn: "+sAddOnName)
			UI_AddOnBack = AddTextOption("","$FW_MENU_ADDON_Back")
			UI_Activator = AddToggleOption("$FW_MENU_ADDON_Activate",(bAddOnEnabled || bAddOnLocked) && bUse, SwitchInt(bAddOnLocked || !bUse,OPTION_FLAG_DISABLED,OPTION_FLAG_NONE))
			offset+=4
			SetCursorPosition(offset)
			if author!=""
				AddTextOption("$FW_MENU_ADDON_Author", author,OPTION_FLAG_DISABLED)
				offset+=4
				SetCursorPosition(offset)
			else
				offset+=2
				SetCursorPosition(offset)
			endif
			AddHeaderOption("$FW_MENU_ADDON_RaceList")
			offset+=2
			i=0
			int xRaces=FWUtility.getIniInt("AddOn",f,"races",0)
			int racesListed=0
			Keyword keywordVampire = Keyword.GetKeyword("Vampire")
			Keyword keywordBeast = Keyword.GetKeyword("IsBeastRace")
			Keyword keywordCreature = Keyword.GetKeyword("ActorTypeCreature")
			if xRaces==0
				; There is only the default category - so only 1 Race Part
				string ids=FWUtility.getIniCString("AddOn",f,"AddOn","id")
				if ids!=""
					string[] saRaces=StringUtil.Split(ids,",")
					int c2=saRaces.length
					while c2>0
						c2-=1
						race r=FWUtility.GetFormFromString(saRaces[c2]) as Race
						if r!=none && racesListed<80 ; List a maximum of 80 races - Otherwise it may give a array overflow from MCM
							string strR=r.GetName()
							if r.HasKeyword(keywordVampire)
								strR+="[Vampire]"
							endif
							if r.HasKeyword(keywordBeast)
								strR+="[Beast]"
							endif
							if r.IsChildRace()
								strR+="<font color='#ff0000'>[Child]</font>"
							endif
							if r.HasKeyword(keywordCreature)
								strR+="[Creature]"
							endif
							SetCursorPosition(offset+i)
							AddTextOption(strR,"")
							i+=1
							racesListed+=1
						endif
					endWhile
				endif
			else
				; There are multiple Race Categories, list them all
				while xRaces>0
					string ids=FWUtility.getIniCString("AddOn",f,"Race"+xRaces,"id")
					if ids!=""
						string[] saRaces=StringUtil.Split(ids,",")
						int c2=saRaces.length
						while c2>0
							c2-=1
							race r=FWUtility.GetFormFromString(saRaces[c2]) as Race
							if r!=none && racesListed<80 ; List a maximum of 80 races - Otherwise it may give a array overflow from MCM
								string strR=r.GetName()+" "
								if r.HasKeyword(keywordVampire)
									strR+="[Vampire]"
								endif
								if r.HasKeyword(keywordBeast)
									strR+="[Beast]"
								endif
								if r.IsChildRace()
									strR+="<font color='#ff0000'>[Child]</font>"
								endif
								if r.HasKeyword(keywordCreature)
									strR+="[Creature]"
								endif
								SetCursorPosition(offset+i)
								AddTextOption(strR,"")
								i+=1
								racesListed+=1
							endif
						endWhile
					endif
					xRaces-=1
				endWhile
			endif
			
			; Check for missing requirements
			if !bUse
				offset+=i+2
				offset+=(offset % 2)
				SetCursorPosition(offset)
				string[] requiredA = StringUtil.Split(required,",")
				int k=requiredA.length
				while k>0
					k-=1
					if FWUtility.IsModInstalled(requiredA[k])==false
						AddTextOption("<font color='#ff0000'>"+requiredA[k]+"</font>","")
					endif
				endWhile
			endif

		; Check if an CME-AddOn was selected. Display the CME-AddOn Infos
		elseif AddOnActiveCME>=0
			string f = UIS_AddOnCME[AddOnActiveCME]
			bool bAddOnEnabled=FWUtility.getIniCBool("AddOn",f,"AddOn","enabled",false)
			bool bAddOnLocked=FWUtility.getIniCBool("AddOn",f,"AddOn","locked",false)
			string sAddOnName=FWUtility.getIniCString("AddOn",f,"AddOn","name","")
			string sAddOnType=FWUtility.getIniCString("AddOn",f,"AddOn","type","")
			string author = FWUtility.getIniCString("AddOn",f,"AddOn","author",f)
			string required = FWUtility.getIniCString("AddOn",f,"AddOn","required")
			bool bUse=true
			if required!=""
				string[] requiredA = StringUtil.Split(required,",")
				if FWUtility.AreModsInstalled(requiredA)==false
					bUse=false
				endif
			endif
			
			actor ply = Game.GetPlayer()
			
			SetCursorFillMode(LEFT_TO_RIGHT)
			SetCursorPosition(offset)
			AddHeaderOption("CME AddOn: "+sAddOnName)
			UI_AddOnBack = AddTextOption("","$FW_MENU_ADDON_Back")
			UI_Activator = AddToggleOption("$FW_MENU_ADDON_Activate",(bAddOnEnabled || bAddOnLocked) && bUse, SwitchInt(bAddOnLocked || !bUse,OPTION_FLAG_DISABLED,OPTION_FLAG_NONE))
			offset+=4
			SetCursorPosition(offset)
			if author!=""
				AddTextOption("$FW_MENU_ADDON_Author", author,OPTION_FLAG_DISABLED)
				offset+=4
				SetCursorPosition(offset)
			else
				offset+=2
				SetCursorPosition(offset)
			endif
			AddHeaderOption("$FW_MENU_ADDON_Effects")
			offset+=2 + (offset % 2)
			i=0
			
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "FollicularPhase", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Ovulation", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "LuthealPhase", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "PMS", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Menstruation", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Trimester1", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Trimester2", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Trimester3", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "LaborPains", System.Player.currentState==0, ply)
			offset = DrawCME2(offset, "$FW_MENU_ADDON_EffectsFollicular", f, "Recovery", System.Player.currentState==0, ply)
			
			if !bUse
				offset+=4
				offset+=(offset % 2)
				SetCursorPosition(offset)
				string[] requiredA = StringUtil.Split(required,",")
				int k=requiredA.length
				while k>0
					k-=1
					if FWUtility.IsModInstalled(requiredA[k])==false
						AddTextOption("<font color='#ff0000'>"+requiredA[k]+"</font>","")
					endif
				endWhile
			endif
		
		; Check if an Misc-AddOn was selected. Display the Misc-AddOn Infos
		elseif AddOnActiveMisc>=0
			string f = UIS_AddOnMisc[AddOnActiveMisc]
			bool bAddOnEnabled=FWUtility.getIniCBool("AddOn",f,"AddOn","enabled",false)
			bool bAddOnLocked=FWUtility.getIniCBool("AddOn",f,"AddOn","locked",false)
			string sAddOnName=FWUtility.getIniCString("AddOn",f,"AddOn","name","")
			string sAddOnType=FWUtility.getIniCString("AddOn",f,"AddOn","type","")
			string author = FWUtility.getIniCString("AddOn",f,"AddOn","author",f)
			string required = FWUtility.getIniCString("AddOn",f,"AddOn","required")
			bool bUse=true
			if required!=""
				string[] requiredA = StringUtil.Split(required,",")
				if FWUtility.AreModsInstalled(requiredA)==false
					bUse=false
				endif
			endif
			
			;PageResetJobID=25
			SetCursorFillMode(LEFT_TO_RIGHT)
			SetCursorPosition(offset)
			AddHeaderOption("Misc AddOn: "+sAddOnName)
			UI_AddOnBack = AddTextOption("","$FW_MENU_ADDON_Back")
			UI_Activator = AddToggleOption("$FW_MENU_ADDON_Activate",(bAddOnEnabled || bAddOnLocked) && bUse, SwitchInt(bAddOnLocked || !bUse,OPTION_FLAG_DISABLED,OPTION_FLAG_NONE))
			offset+=4
			SetCursorPosition(offset)
			if author!=""
				AddTextOption("$FW_MENU_ADDON_Author", author,OPTION_FLAG_DISABLED)
			endif
			
			if !bUse
				offset+=4
				offset+=(offset % 2)
				SetCursorPosition(offset)
				string[] requiredA = StringUtil.Split(required,",")
				int k=requiredA.length
				while k>0
					k-=1
					if FWUtility.IsModInstalled(requiredA[k])==false
						AddTextOption("<font color='#ff0000'>"+requiredA[k]+"</font>","")
					endif
				endWhile
			endif
		
		; No AddOn was selected. Print a list with all AddOns
		else
			; Var Definitions
			int iFCount=FWUtility.GetFileCount("AddOn","ini")
			int iCMisc=0
			int iCRace=0
			int iCCME=0
			UIS_AddOnCME = new string[128]
			UIS_AddOnMisc = new string[128]
			UIS_AddOnRaces = new string[128]
			bool[] bEMisc = new bool[128]
			bool[] bERace = new bool[128]
			bool[] bECME = new bool[128]
			string[] sNMisc = new string[128]
			string[] sNRace = new string[128]
			string[] sNCME = new string[128]
			
			string[] regGroup=new string[128]
			int cGroup=0
			
			; Read in all AddOns
			while iFCount>0
				iFCount-=1
				string f=FWUtility.GetFileName("AddOn","ini",iFCount)
				bool bAddOnEnabled=FWUtility.getIniCBool("AddOn",f,"AddOn","enabled",false)
				bool bAddOnLocked=FWUtility.getIniCBool("AddOn",f,"AddOn","locked",false)
				bool bAddOnHidden=FWUtility.getIniCBool("AddOn",f,"AddOn","hidden",false)
				string sAddOnName=FWUtility.getIniCString("AddOn",f,"AddOn","name",f)
				string sAddOnType=FWUtility.getIniCString("AddOn",f,"AddOn","type","")
				string required = FWUtility.getIniCString("AddOn",f,"AddOn","required")
				bool bUse=true
				if required!=""
					string[] requiredA = StringUtil.Split(required,",")
					if FWUtility.AreModsInstalled(requiredA)==false
						bUse=false
					endif
				endif
				
				if bAddOnHidden==false && sAddOnName!=""
					if sAddOnType=="race" || sAddOnType=="Race" || sAddOnType=="RACE" || sAddOnType=="RACe"
						UIS_AddOnRaces[iCRace]=f
						bERace[iCRace]=(bAddOnEnabled || bAddOnLocked) && bUse
						sNRace[iCRace]=FWUtility.SwitchString(sAddOnName=="",f,sAddOnName)
						iCRace+=1
					elseif sAddOnType=="cme" || sAddOnType=="Cme" || sAddOnType=="CME" || sAddOnType=="CMe"
						UIS_AddOnCME[iCCME]=f
						bECME[iCCME]=(bAddOnEnabled || bAddOnLocked) && bUse
						sNCME[iCCME]=FWUtility.SwitchString(sAddOnName=="",f,sAddOnName)
						iCCME+=1
					elseif sAddOnType=="misc" || sAddOnType=="Misc" || sAddOnType=="MISC" || sAddOnType=="MISc"
						UIS_AddOnMisc[iCMisc]=f
						bEMisc[iCMisc]=(bAddOnEnabled || bAddOnLocked) && bUse
						sNMisc[iCMisc]=FWUtility.SwitchString(sAddOnName=="",f,sAddOnName)
						iCMisc+=1
					endif
				endif
			endwhile
			
			
			; Print Race AddOns
			SetCursorFillMode(LEFT_TO_RIGHT)
			i = 0
			j = 0
			While i<iCRace
				SetCursorPosition(offset+2+i)
				UI_AddOnRaces[i] = AddToggleOption(sNRace[i], bERace[i])
				i += 1
			EndWhile
			SetCursorPosition(offset)
			AddHeaderOption("$FW_MENU_ADDON_Race")
			if Messages<=1
				SetCursorPosition(offset+1)
				AddTextOption("",iCRace)
			endif
			
			; Print CME AddOns
			offset += i + (i % 2) + 4
			SetCursorPosition(offset + 2)
			i = 0
			While i<iCCME
				SetCursorPosition(offset+2+i)
				UI_AddOnCME[i] = AddToggleOption(sNCME[i], bECME[i])
				i += 1
			EndWhile
			SetCursorPosition(offset)
			AddHeaderOption("$FW_MENU_ADDON_CME")
			if Messages<=1
				SetCursorPosition(offset+1)
				AddTextOption("",iCCME)
			endif
			
			; Print Misc AddOns
			offset += i + (i % 2) + 4
			SetCursorPosition(offset + 2)
			i = 0
			While i<iCMisc
				SetCursorPosition(offset+2+i)
				UI_AddOnMisc[i] = AddToggleOption(sNMisc[i], bEMisc[i])
				i += 1
			EndWhile
			SetCursorPosition(offset)
			AddHeaderOption("$FW_MENU_ADDON_Misc")
			if Messages<=1
				SetCursorPosition(offset+1)
				AddTextOption("",iCMisc)
			endif
		endif
	
	
	; The Information Tab
	ElseIf page == Pages[FW_MENU_PAGE_Info]
		PageResetJobID=31
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("$FW_MENU_INFO_PlayerCharacterInformation")
		
		
		; Display the Male Informations
		If System.PlayerMale != None
			actor PlayerMaleActor=Game.GetPlayer()
			actor[] females = System.Controller.getWomansWithSperm(PlayerMaleActor,true)
			int c=0
			PageResetJobID=32
			while c<females.length
				if females[c]!=none
					if females[c].GetLeveledActorBase()!=none
						UI_SpermInside[c] = AddTextOption(females[c].GetLeveledActorBase().GetName(),"")
					endif
				endif
				c+=1
			endwhile
		
		
		; Display the Female Informations
		ElseIf System.Player != None
			PageResetJobID=33
			; Left column
			If System.Player.currentState>=4 && System.Player.currentState<20
				AddTextOption("$FW_MENU_INFO_Pregnant", "$FW_MENU_BASIC_Yes")
				AddTextOption("$FW_MENU_INFO_CurrentState", getStateNameTranslated(System.Player.currentState))
				AddTextOption("$FW_MENU_INFO_NumberOfChildren", getNumberOfChilds())
				
				float UnbornHealth = StorageUtil.GetFloatValue(Game.GetPlayer(),"FW.UnbornHealth",100.0)
				int abortusPhase = StorageUtil.GetIntValue(Game.GetPlayer(), "FW.Abortus",0)
				if abortusPhase==0
					AddTextOption("$FW_MENU_INFO_UnbornsHealth", UnbornHealth+"%")
				else
					AddTextOption("$FW_MENU_INFO_Abortus", "$FW_MENU_OPTIONS_Abortus"+abortusPhase)
				endif
			elseIf System.Player.currentState>=20 && System.Player.currentState<40
				AddTextOption("$FW_MENU_INFO_Pregnant", "$FW_MENU_BASIC_Yes")
				AddTextOption("$FW_MENU_INFO_CurrentState", getStateNameTranslated(System.Player.currentState))
			Else
				AddTextOption("$FW_MENU_INFO_Pregnant", "$FW_MENU_BASIC_No")
				AddTextOption("$FW_MENU_INFO_CurrentState", getStateNameTranslated(System.Player.currentState))
				AddTextOption("$FW_MENU_INFO_PregnancyChance", Math.Floor(System.Controller.getRelativePregnancyChance(Game.GetPlayer()))+"%")
			EndIf
			if System.Controller.IsPaused(Game.GetPlayer())==true
				AddTextOption("$FW_MENU_INFO_TimeRemaining", "$FW_MENU_OPTIONS_Paused")
			else
				AddTextOption("$FW_MENU_INFO_TimeRemaining", getRemainingTime())
			endif
			AddEmptyOption()
			AddTextOption("$FW_MENU_INFO_ContraceptionHormones", getContraception()+"%")
			AddTextOption("$FW_MENU_INFO_ContraceptionTime", getContraceptionTime())
		
			AddEmptyOption()
			AddHeaderOption("$FW_MENU_INFO_StateInformation")
			If System.Player.currentState>=0 && System.Player.currentState<4
				If System.Player.currentState == 1
					AddTextOption("$FW_MENU_INFO_EggState", GetEggState())
					AddTextOption("$FW_MENU_INFO_OvulationPain", OvulationPainString())
				ElseIf System.Player.currentState == 3 ; ; Menstruation
					AddTextOption("$FW_MENU_INFO_MenstrualPain", MenstruationPainString())
				EndIf
			Elseif System.Player.currentState>=4 && System.Player.currentState<20
				if Game.GetPlayer().hasspell(System.Effect_Vorwehen)==true
					AddTextOption("$FW_MENU_INFO_Vorwehen","")
				endif
				if Game.GetPlayer().hasspell(System.Effect_Eroeffnungswehen)==true
					AddTextOption("$FW_MENU_INFO_Eroeffnungswehen","")
				endif
				if Game.GetPlayer().hasspell(System.Effect_Presswehen)==true
					AddTextOption("$FW_MENU_INFO_Presswehen","")
				endif
				if Game.GetPlayer().hasspell(System.Effect_Nachwehen)==true
					AddTextOption("$FW_MENU_INFO_Nachwehen","")
				endif
				If System.Player.currentState == 7
				EndIf
			EndIf
			
			; Right column
			SetCursorPosition(1)
			
			AddHeaderOption("$FW_MENU_INFO_TotalSperm")
			
			actor xPlayer = Game.GetPlayer()
			i = 0
			j = 1
			int c = StorageUtil.FormListCount(xPlayer,"FW.SpermName")
			PageResetJobID=34
			while i < c
				if (StorageUtil.FloatListGet(xPlayer,"FW.SpermAmount",i) > 0.0) && (StorageUtil.FormListGet(xPlayer,"FW.SpermName",i) As Actor != None) && (currentTime - StorageUtil.FloatListGet(xPlayer,"FW.SpermTime",i) <= System.cfg.SpermDuration)
					
					UI_SpermInside[(j - 1)] = AddTextOption("(" + j + ") " + (StorageUtil.FormListGet(xPlayer,"FW.SpermName",i) As Actor).GetLeveledActorBase().GetName(), GetTimeString(currentTime - StorageUtil.FloatListGet(xPlayer,"FW.SpermTime",i),true,"-"))
					j += 1
				endIf
				i += 1
			endWhile
		
		
		; Renew the spells because the system hasn't defined the players sex right now
		else
			PageResetJobID=35
			System.ReNewSpells()
			AddTextOption("$FW_MENU_INFO_PlayerCharacterInformation","$FW_MENU_OPTIONS_None")
		EndIf
	
	
	; The Debug / Cheating Menu
	ElseIf page == Pages[FW_MENU_PAGE_Cheat] ; Debug / Cheating
		PageResetJobID=36
		actor targetNpc = Game.GetCurrentCrosshairRef() as Actor
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		
		if bTestPerkMode==false
			PageResetJobID=37
			; Left column
			SetCursorPosition(0)
		
			AddHeaderOption("$FW_MENU_CHEAT_Reset")
			AddTextOptionST("TextResetPC", "$FW_MENU_CHEAT_ResetPC", "$FW_MENU_OPTIONS_Reset")
		
			if(targetNpc!=none)
				if(targetNpc.HasSpell(System.BeeingFemaleSpell))
					AddHeaderOption(targetNpc.GetDisplayName())
					AddTextOptionST("TextResetNPC", "$FW_MENU_CHEAT_ResetNPC", "$FW_MENU_OPTIONS_Reset")
					AddTextOptionST("TextUpdateNPC", "$FW_MENU_CHEAT_Update", "$FW_MENU_OPTIONS_Refresh")
				else
					AddTextOptionST("TextResetPCBreastBellyScale", "$FW_MENU_CHEAT_ResetPCBreastBellyScale", "$FW_MENU_OPTIONS_Reset")
					AddEmptyOption()
				endif
			else
				AddTextOptionST("TextResetPCBreastBellyScale", "$FW_MENU_CHEAT_ResetPCBreastBellyScale", "$FW_MENU_OPTIONS_Reset")
				AddEmptyOption()
			endif
		
			AddHeaderOption("$FW_MENU_CHEAT_Update")
			AddToggleOptionST("ToggleUpdateInterval", "$FW_MENU_CHEAT_UpdateInterval", UpdateIntervalEnabled)
			if UpdateIntervalEnabled
				AddSliderOptionST("SliderUpdateInterval", "$FW_MENU_CHEAT_Interval", UpdateInterval, "$FW_MENU_BASIC_Seconds")
			else
				AddSliderOptionST("SliderUpdateInterval", "$FW_MENU_CHEAT_Interval", UpdateInterval, "$FW_MENU_BASIC_Seconds", OPTION_FLAG_DISABLED)
			endif
			AddTextOptionST("TextUpdateAll", "$FW_MENU_CHEAT_UpdateAll", "$FW_MENU_OPTIONS_Refresh")
			AddTextOptionST("TextResetNPCs", "$FW_MENU_CHEAT_ResetNPC", "$FW_MENU_OPTIONS_Reset")
			AddTextOptionST("TextNoSavedNPCs", "$FW_MENU_CHEAT_SavedNPC", StorageUtil.FormListCount(none, "FW.SavedNPCs"))
		
		
			If (Messages <= System.MSG_Debug)
				AddTextOptionST("TextCheckChildPerks", "$FW_MENU_CHEAT_TestPerks","")
				AddTextOptionST("TextSpawnChildren", "$FW_MENU_CHEAT_SpawnChildren", "")
			endif
			
			AddToggleOptionST("ToggleCoupleWidget", "$FW_MENU_CHEAT_CoupleMaker", System.CoupleWidget.enabled)
		
			; Right column
			SetCursorPosition(1)
		
			If System.PlayerMale != None
				AddHeaderOption("$FW_MENU_CHEAT_Cheats")
			
				AddTextOption("For now, there are no", "")
				AddTextOption("cheats for male characters.", "")
		
			ElseIf System.Player != None
				AddHeaderOption("$FW_MENU_CHEAT_Cheats")
			
				If (Messages > System.MSG_Debug)
					AddTextOption("$FW_MENU_CHEAT_Disabled", "")
					AddEmptyOption()
					AddTextOption("$FW_MENU_CHEAT_DisabledMsg1", "")
					AddTextOption("$FW_MENU_CHEAT_DisabledMsg2", "")
					AddTextOption("$FW_MENU_CHEAT_DisabledMsg3", "")
					AddTextOption("$FW_MENU_CHEAT_DisabledMsg4", "")
			
				Else
					optionFlag = SwitchInt((System.Player.currentState>=4 && System.Player.currentState<20), OPTION_FLAG_DISABLED, OPTION_FLAG_NONE)
					AddToggleOptionST("TogglePlayerFertility", "$FW_MENU_CHEAT_CanBecomePregnant", System.Controller.canBecomePregnant(Game.GetPlayer()), optionFlag)
					AddToggleOptionST("TogglePlayerPMS", "$FW_MENU_CHEAT_CanBecomePMS", System.Controller.canBecomePMS(Game.GetPlayer()), optionFlag)
					AddEmptyOption()
				
					optionFlag = OPTION_FLAG_NONE ; IntSwitch(System.Player.isChangingState, OPTION_FLAG_DISABLED, OPTION_FLAG_NONE)
					AddTextOptionST("TextChangeState", "$FW_MENU_CHEAT_ChangeState", getStateNameTranslated(System.Player.nextState))
				
					optionFlag = OPTION_FLAG_NONE ; IntSwitch(System.Player.isChangingState || (GetJobID() < 0), OPTION_FLAG_DISABLED, OPTION_FLAG_NONE)
					AddTextOptionST("TextJobToDo", "$FW_MENU_CHEAT_JobToDo", GetJobTitle())
				
					; NPCBornChildDef Cheats
					FWChildActor targetChild = Game.GetCurrentCrosshairRef() as FWChildActor
					if(targetNpc!=none)
						AddHeaderOption(targetNpc.GetDisplayName())
						if(targetChild!=none)
							AddTextOptionST("TextChildAddLevel", "$FW_MENU_CHEAT_ChildAddLevel", targetChild.GetLevel(), FWUtility.SwitchInt(targetChild.GetLevel() < FWChildSettings.ChildMaxLevel(), OPTION_FLAG_NONE,OPTION_FLAG_DISABLED))
						elseif(targetNpc.GetLeveledActorBase().GetSex()==1)
							AddTextOptionST("TextNpcChangeState", "$FW_MENU_CHEAT_ChangeState", getStateNameTranslated(System.Controller.GetNextState(targetNpc)))
							AddTextOptionST("TextNpcJobToDo", "$FW_MENU_CHEAT_JobToDo", GetJobTitle(targetNpc), FWUtility.SwitchInt(NPCCanBecomePregnant,OPTION_FLAG_NONE,OPTION_FLAG_DISABLED))
						endif
					endif
					
					
					; Display the Storage Variables for the player
					actor p = Game.GetPlayer()
					int iFW
					int cFW
					AddHeaderOption("StorageUtil - "+p.GetLeveledActorBase().GetName())
					AddTextOption("FW.LastUpdate", StorageUtil.GetFloatValue(p,"FW.LastUpdate"))
					AddTextOption("FW.StateEnterTime", StorageUtil.GetFloatValue(p,"FW.StateEnterTime"))
					AddTextOption("FW.CurrentState", StorageUtil.GetIntValue(p,"FW.CurrentState"))
					AddTextOption("FW.Abortus", StorageUtil.GetIntValue(p,"FW.Abortus"))
					AddTextOption("FW.AbortusTime", StorageUtil.GetFloatValue(p,"FW.AbortusTime"))
					AddTextOption("FW.UnbornHealth", StorageUtil.GetFloatValue(p,"FW.UnbornHealth"))
					AddTextOption("FW.NumChilds", StorageUtil.GetIntValue(p,"FW.NumChilds"))
					iFW = 0
					cFW = StorageUtil.GetIntValue(p,"FW.NumChilds")
					PageResetJobID=38
					while iFW<cFW
						actor a = StorageUtil.FormListGet(p,"FW.ChildFather",iFW) as actor
						if a!=none
							AddTextOption("FW.ChildFather["+iFW+"]", a.GetLeveledActorBase().GetName())
						endif
						iFW+=1
					endWhile
					AddTextOption("FW.Flags", StorageUtil.GetIntValue(p,"FW.Flags"))
					AddTextOption("FW.PainLevel", StorageUtil.GetFloatValue(p,"FW.PainLevel"))
					AddTextOption("FW.Contraception", StorageUtil.GetFloatValue(p,"FW.Contraception"))
					AddTextOption("FW.ContraceptionTime", StorageUtil.GetFloatValue(p,"FW.ContraceptionTime"))
					AddTextOption("FW.NumBirth", StorageUtil.GetIntValue(p,"FW.NumBirth"))
					AddTextOption("FW.NumBabys", StorageUtil.GetIntValue(p,"FW.NumBabys"))
					AddTextOption("FW.PauseTime", StorageUtil.GetFloatValue(p,"FW.PauseTime"))
					AddTextOption("FW.LastBornChildTime", StorageUtil.GetFloatValue(p,"FW.LastBornChildTime"))
					iFW=0
					cFW=StorageUtil.FloatListCount(p,"FW.SpermTime")
					PageResetJobID=39
					while iFW<cFW
						AddTextOption("FW.SpermName["+iFW+"]", (StorageUtil.FormListGet(p,"FW.SpermName",iFW) as actor).GetLeveledActorBase().GetName())
						AddTextOption("FW.SpermTime["+iFW+"]", StorageUtil.FloatListGet(p,"FW.SpermTime",iFW))
						AddTextOption("FW.SpermAmount["+iFW+"]", StorageUtil.FloatListGet(p,"FW.SpermAmount",iFW))
						iFW+=1
					endWhile
				EndIf
			EndIf
		
		
		; Display the Perk-Informations
		else
			PageResetJobID=40
			; Check if a Perk was selected
			if selectedPerk==-1
				SetCursorFillMode(LEFT_TO_RIGHT)
				AddHeaderOption("$FW_MENU_CHEAT_TestPerk")
				AddTextOptionST("TextLeaveAddOnTest","","$FW_MENU_ADDON_Back")
				int flg = OPTION_FLAG_DISABLED
				if bTestPerkRan==true
					flg = OPTION_FLAG_NONE
				endif
				int k = 0
				PageResetJobID=41
				while k<120
					If System.ChildSettings.ChildPerkFile[k]!=""
						string x1 = System.ChildSettings.ChildPerkFile[k]
						string x2 = perkTestResult[k]
						UI_TestPerk[k] = AddTextOption(x1, x2, flg)
					EndIf
					k += 1
				EndWhile
				if bTestPerkRan==false
					bTestPerkRan=true
					lastPerkTested=-1
					; This is a hack for a ASync Function Call
					RegisterForModEvent("FWSystemConfig_Async_Call", "CheckNextPerk_Async")
					SendModEvent("FWSystemConfig_Async_Call","",0)
				endif
			
			
			; A Perk was selected. Display the Perk-Test-Results
			else
				SetCursorFillMode(TOP_TO_BOTTOM)
				SetCursorPosition(0)
				
				AddHeaderOption("$FW_MENU_CHEAT_TestPerk")
				AddHeaderOption(System.ChildSettings.ChildPerkFile[selectedPerk])
				
				int items=0
				string res = perkTestResultText[selectedPerk]
				PageResetJobID=42
				if(res!="")
					string[] tres = StringUtil.Split(res, ";")
					if tres.Length>1
						int k = 1 ; The first entry is always empty
						AddTextOption("[General]","",OPTION_FLAG_DISABLED)
						PageResetJobID=43
						while k<tres.length
							if items<120
								AddTextOption(tres[k],"",OPTION_FLAG_DISABLED)
								items+=1
								k+=1
							else
								AddTextOption("More errors were logged","")
								k=999
							endif
						endWhile
					endif
				endif
				PageResetJobID=44
				SetCursorPosition(1)
				AddTextOptionST("TextLeaveAddOnTest","","$FW_MENU_ADDON_Back")
				AddEmptyOption()
				
			endif
		endif
		
		
		
; float 	FW.LastUpdate (= the time this actor was updated the last Timedabilityscript)
; float 	FW.StateEnterTime
; int		FW.CurrentState
; int		FW.Abortus
; float 	FW.AbortusTime
; float 	FW.UnbornHealth
; int		FW.NumChilds (= the number of babys the woman is pregnant with)
; Actor[]	FW.ChildFather
; float[]	FW.SpermTime
; Actor[]	FW.SpermName
; float[]	FW.SpermAmount
; int		FW.Flags
; float 	FW.PainLevel
; float 	FW.Contraception (= 0.0 to 100.0)
; float 	FW.ContraceptionTime
; int 		FW.NumBirth (= the number of birth the woman had)
; int 		FW.NumBabys (= the number of babys the woman has born)
; float 	FW.PauseTime
; float 	FW.LastBornChildTime
; Actor[] 	FW.BornChildFather (= Father of an already born child)
; float[]	FW.BornChildTime (= Timestamp of an already born child)
		
	ElseIf page == Pages[FW_MENU_PAGE_System] ; System
		PageResetJobID=45
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		int mc = Game.GetModCount()
		string BFVersion=FWVersion.GetVersionString()
		PageResetJobID=46
		while mc>0
			mc-=1
			string modFName= Game.GetModName(mc)
			if modFName=="BeeingFemale.esp"
				BFVersion=BFVersion + " DEV"
				mc=0
			endif
		endwhile
		
		AddHeaderOption("$FW_MENU_SYSTEM_Version")
		AddTextOption("$FW_MENU_SYSTEM_VersionBF", FWVersion.GetVersionString())
		if CurrentVersion != FWVersion.GetMCMVersion()
			AddTextOption("$FW_MENU_SYSTEM_VersionMCM", CurrentVersion + "/"+FWVersion.GetMCMVersion())
		else
			AddTextOption("$FW_MENU_SYSTEM_VersionMCM", CurrentVersion)
		endif
		if Game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") != FWVersion.GetAnimationVersionRequired()
			AddTextOption("$FW_MENU_SETTINGS_PlayAnimations", Game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") + "/" + FWVersion.GetAnimationVersionRequired())
		else
			AddTextOption("$FW_MENU_SETTINGS_PlayAnimations", Game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion"))
		endif
		AddHeaderOption("$FW_MENU_SYSTEM")
		AddTextOptionST("TextRefreshAddOn", "$FW_MENU_CHEAT_RefreshAddOn", "$FW_MENU_OPTIONS_Refresh")
		AddTextOptionST("TextResetSystem", "$FW_MENU_SYSTEM_Reset", "$FW_MENU_OPTIONS_Execute")
		AddTextOptionST("TextUninstall", "$FW_MENU_SYSTEM_Uninstall", "$FW_MENU_OPTIONS_Execute")
		
		AddHeaderOption("$FW_MENU_SYSTEM_Profile")
		if FWUtility.GetFileCount("Profile")>0
			AddMenuOptionST("MenuProfileLoad", "$FW_MENU_SYSTEM_ProfileLoad", getCurrentProfile() ,OPTION_FLAG_NONE)
		else
			AddMenuOptionST("MenuProfileLoad", "$FW_MENU_SYSTEM_ProfileLoad", "",OPTION_FLAG_DISABLED)
		endif
		AddTextOptionST("TextProfileSave", "$FW_MENU_SYSTEM_ProfileSave", "")
		if FWUtility.GetFileCount("HUD","ini")>1
			AddMenuOptionST("MenuWidgetProfile", "$FW_MENU_SYSTEM_WidgetProfile", WidgetProfile,OPTION_FLAG_NONE)
		else
			AddMenuOptionST("MenuWidgetProfile", "$FW_MENU_SYSTEM_WidgetProfile", WidgetProfileDef,OPTION_FLAG_DISABLED)
		endif
		PageResetJobID=47
		
		; Compatiblity
		SetCursorPosition(1)
		string[] cTxt = new String[4]
		cTxt[0] = "$FW_MENU_OPTIONS_Compatible_None"
		cTxt[1] = "$FW_MENU_OPTIONS_Compatible_Full"
		cTxt[2] = "$FW_MENU_OPTIONS_Overdue"
		cTxt[3] = "$FW_MENU_OPTIONS_Compatible_NOT_INSTALLED"
		AddHeaderOption("$FW_MENU_SYSTEM_Compatible")
		AddTextOption("Skyrim "+Debug.GetVersionNumber(), cTxt[getCompatiblity_Skyrim()],OPTION_FLAG_DISABLED)
		AddTextOption("SKSE", cTxt[getCompatiblity_SKSE()],OPTION_FLAG_DISABLED)
		AddTextOption("Papyrus Util", cTxt[getCompatiblity_PapyrusUtil()],OPTION_FLAG_DISABLED)
		AddTextOption("Fore new Idle Skyrim", cTxt[getCompatiblity_FNIS()],OPTION_FLAG_DISABLED)
		AddTextOption("BeeingFemale Animations", cTxt[getCompatiblity_Animation()],OPTION_FLAG_DISABLED)
		
		if bBathingInSkyrim
			bool bBiS = System.Manager.IsAddOnActive("BF_BathingInSkyrim")
			if bBiS==true
				AddTextOption("Bathing in Skyrim", cTxt[1],OPTION_FLAG_DISABLED)
			else
				AddTextOption("Bathing in Skyrim", cTxt[0],OPTION_FLAG_DISABLED)
			endif
		else
			AddTextOption("Bathing in Skyrim", cTxt[3],OPTION_FLAG_DISABLED)
		endif
		
		if bSexLab
			PageResetJobID=48
			if bSSL
				PageResetJobID=49
				AddTextOption("SexLab Framework", cTxt[1],OPTION_FLAG_DISABLED)
			else
				PageResetJobID=50
				AddTextOption("SexLab Framework", cTxt[0],OPTION_FLAG_DISABLED)
			endif
		endif
		PageResetJobID=51
		if bAP
			if FWUtility.ScriptHasString("aasexorgasimscaipt","BeeingFemale")
				AddTextOption("Animated Prostitution", cTxt[1],OPTION_FLAG_DISABLED)
			else
				AddTextOption("Animated Prostitution", cTxt[0],OPTION_FLAG_DISABLED)
			endif
		endif
		if bFlowerGirls
			if FWUtility.ScriptHasString("dxPerformSexScript","BeeingFemale") || \
			   FWUtility.ScriptHasString("dxFlowerGirlsScript","BeeingFemale") || \
			   FWUtility.ScriptHasString("dxAnimationSceneScript","BeeingFemale") || \
			   FWUtility.ScriptHasString("dxAnimationControllerScript","BeeingFemale") || \
			   FWUtility.ScriptHasString("dxAnimatePairEffect","BeeingFemale")
				AddTextOption("Flower Girls", cTxt[1],OPTION_FLAG_DISABLED)
			else
				AddTextOption("Flower Girls", cTxt[0],OPTION_FLAG_DISABLED)
			endif
		endif
		if bASX
			AddTextOption("ASX - Spells", cTxt[0],OPTION_FLAG_DISABLED)
		endif
	EndIf
	
	PageResetJobID=0
	UnregisterForUpdate()
endEvent

int function getCompatiblity_Skyrim()
	string v = Debug.GetVersionNumber()
	string f = StringUtil.SubString(v, 0, 3)
	if (f as float) >= 1.9
		return 1
	endif
	return 2
endFunction

int function getCompatiblity_SKSE()
	if(SKSE.GetVersionRelease() == 0)
		return 0
	elseif SKSE.GetScriptVersionRelease()<48
		return 2
	else
		return 1
	endif
endFunction

int function getCompatiblity_PapyrusUtil()
	if SKSE.GetPluginVersion("papyrusutil plugin")==-1
		return 0
	endif
	return 1
endFunction

int function getCompatiblity_FNIS()
	if FNIS.VersionCompare(5, 4, 2) < 0
		return 0
	endif
	return 1
endFunction

int function getCompatiblity_Animation()
	if FWVersion.GetAnimationVersion() == 0
		return 0
	elseif FWVersion.GetAnimationVersion() < FWVersion.GetAnimationVersionRequired()
		return 2
	else
		return 1
	endif
endFunction



Event OnOptionSelect(int option)
	; The Player is male, and the user clicked on a female name the player came inside. Display the Female info window
	If CurrentPage == Pages[FW_MENU_PAGE_Info] ; Info-Tab
		If System.PlayerMale != None
			int i= UI_SpermInside.Find(option)
			if i>=0
				actor PlayerMaleActor=Game.GetPlayer()
				actor[] females = System.Controller.getWomansWithSperm(PlayerMaleActor,true)
				System.Controller.showRankedInfoBox(females[i],100)
			endif
		endif
	
	
	; The user clicked on a child name, show the child infor window
	elseif CurrentPage==Pages[FW_MENU_PAGE_Children]
		int index = UI_Child.Find(option)
		int c = StorageUtil.FormListCount(none, "FW.Babys")
		int i = 0
		int n = 0
		actor player = Game.GetPlayer()
		while i<c
			FWChildActor ca = StorageUtil.FormListGet(none, "FW.Babys", i) as FWChildActor
			If(ca != none)
				If(ca as FWChildActorPlayer != none || StorageUtil.GetFormValue(ca, "FW.Child.Mother", none) == player || StorageUtil.GetFormValue(ca, "FW.Child.Father", none) == player)
					if n==index
						i=c
						System.Controller.showRankedInfoBox(ca, 100)
						return
					endif
					n+=1
				endif
			endif
			i+=1
		endwhile
	
	
	; The user clicked on a Perk-ini. Display the Perk test results
	elseif CurrentPage==Pages[FW_MENU_PAGE_Cheat] && bTestPerkMode==true
		int index = UI_TestPerk.Find(option)
		selectedPerk = index
		ForcePageReset()
	
	
	; The AddOn Page is open, handle the addon clicks
	elseif CurrentPage==Pages[FW_MENU_PAGE_AddOn] ; AddOn Page
		if AddOnActiveRaces==-1 && AddOnActiveCME==-1 && AddOnActiveMisc==-1
			int index = UI_AddOnRaces.Find(option)
			int i=0
			If index >= 0
				AddOnActiveRaces=index
				ForcePageReset()
				Return
			EndIf
	
			index = UI_AddOnCME.Find(option)
			If index >= 0
				AddOnActiveCME=index
				ForcePageReset()
				Return
			EndIf

			index = UI_AddOnMisc.Find(option)
			If index >= 0
				AddOnActiveMisc=index
				ForcePageReset()
				Return
			EndIf
	
		elseif option==UI_Activator
			SetOptionFlags(option,OPTION_FLAG_DISABLED)
			if AddOnActiveRaces>=0
				bool bActive=!FWUtility.getIniCBool("AddOn",UIS_AddOnRaces[AddOnActiveRaces],"AddOn","enabled",false)
				FWUtility.setIniCBool("AddOn",UIS_AddOnRaces[AddOnActiveRaces],"AddOn","enabled",bActive)
				SetToggleOptionValue(option, bActive)
			elseif AddOnActiveCME>=0
				bool bActive=!FWUtility.getIniCBool("AddOn",UIS_AddOnCME[AddOnActiveCME],"AddOn","enabled",false)
				FWUtility.setIniCBool("AddOn",UIS_AddOnCME[AddOnActiveCME],"AddOn","enabled",bActive)
				SetToggleOptionValue(option, bActive)
			elseif AddOnActiveMisc>=0
				bool bActive=!FWUtility.getIniCBool("AddOn",UIS_AddOnMisc[AddOnActiveMisc],"AddOn","enabled",false)
				FWUtility.setIniCBool("AddOn",UIS_AddOnMisc[AddOnActiveMisc],"AddOn","enabled",bActive)
				SetToggleOptionValue(option, bActive)
				; Raise the Event
				int i=System.Manager.iMisc
				while i>0
					i-=1
					if System.Manager.sMisc[i]==UIS_AddOnMisc[AddOnActiveMisc]
						if bActive==true
							System.Manager.Misc[i].OnAddOnActivate()
						else
							System.Manager.Misc[i].OnAddOnDeactivate()
						endif
						i=0
					endif
				endWhile
			endif
			AddOnActiveRaces=-1
			AddOnActiveCME=-1
			AddOnActiveMisc=-1
			System.Manager.RefreshAddOn()
			SetOptionFlags(option,OPTION_FLAG_NONE)
			ForcePageReset()
		elseif option==UI_AddOnBack
			AddOnActiveRaces=-1
			AddOnActiveCME=-1
			AddOnActiveMisc=-1
			ForcePageReset()
		endif
	endif
EndEvent

int function DrawCME2(int offset, string Header, string f, string phase, bool bIsCurrentPhase, actor PlayerRef)
	string s1 = FWUtility.getIniCString("AddOn",f,"AddOn","Always_"+phase,"")
	string s2 = FWUtility.getIniCString("AddOn",f,"AddOn","Sometimes_"+phase,"")
	int i=0
	bool bDrawedHeader=false
	if s1!=""
		string[] saSpells1=StringUtil.Split(s1,",")
		int c1=saSpells1.length
		while c1>0
			c1-=1
			spell s=FWUtility.GetFormFromString(saSpells1[c1]) as spell
			if s!=none
				if bDrawedHeader==false
					AddHeaderOption(Header)
					offset+=2
					bDrawedHeader=true
				endif
				SetCursorPosition(offset+i)
				if(bIsCurrentPhase && PlayerRef.HasSpell(s))
					AddTextOption(s.GetName(),s.GetNthEffectMagicEffect(0).GetName(), OPTION_FLAG_NONE)
				else
					AddTextOption(s.GetName(),s.GetNthEffectMagicEffect(0).GetName(), OPTION_FLAG_DISABLED)
				endif
				i+=1
			endif
		endWhile
	endif
	if s2!=""
		string[] saSpells2=StringUtil.Split(s2,",")
		int c2=saSpells2.length
		while c2>0
			c2-=1
			spell s=FWUtility.GetFormFromString(saSpells2[c2]) as spell
			if s!=none
				if bDrawedHeader==false
					AddHeaderOption(Header)
					offset+=2
					bDrawedHeader=true
				endif
				SetCursorPosition(offset+i)
				if(bIsCurrentPhase && PlayerRef.HasSpell(s))
					AddTextOption(s.GetName(),s.GetNthEffectMagicEffect(0).GetName(), OPTION_FLAG_NONE)
				else
					AddTextOption(s.GetName(),s.GetNthEffectMagicEffect(0).GetName(), OPTION_FLAG_DISABLED)
				endif
				i+=1
			endif
		endWhile
	endif
	offset+=i
	offset+=offset % 2
	return offset
endFunction

Event OnOptionHighlight(int option)
	if CurrentPage==Pages[FW_MENU_PAGE_AddOn]
		if AddOnActiveRaces==-1 && AddOnActiveCME==-1 && AddOnActiveMisc==-1
			int index = UI_AddOnRaces.Find(option)
			If index >= 0
				SetInfoText(UIS_AddOnRaces[index]+" AddOn: "+FWUtility.getIniCString("AddOn",UIS_AddOnRaces[index],"AddOn","description"))
				return
			endIf
	
			index = UI_AddOnCME.Find(option)
			If index >= 0
				SetInfoText(UIS_AddOnCME[index]+" AddOn: "+FWUtility.getIniCString("AddOn",UIS_AddOnCME[index],"AddOn","description"))
				return
			endIf
	
			index = UI_AddOnMisc.Find(option)
			If index >= 0
				SetInfoText(UIS_AddOnMisc[index]+" AddOn: "+FWUtility.getIniCString("AddOn",UIS_AddOnMisc[index],"AddOn","description"))
				return
			endif
		elseif option == UI_AddOnBack
			SetInfoText("$FW_MENU_ADDON_Back")
			return
		elseif option == UI_Activator
			SetInfoText("")
			return
		endIf
	elseif CurrentPage==Pages[FW_MENU_PAGE_System]
		int index = UI_Compatible.Find(option)
		if index>=0
			SetInfoText( CompatibleHighlightTexts[index] )
			return
		endif
	endif
endEvent


event OnOptionMenuOpen(int a_option)
	if CurrentPage == Pages[FW_MENU_PAGE_System]
		int index = UI_Compatible.Find(a_option)
		if index>=0
			SetMenuDialogDefaultIndex(CompatiblityDefaultValue[index])
			SetMenuDialogOptions(GetCompatibleOptions(index))
			SetMenuDialogStartIndex(Compatible[index])
		endif
	endif
endEvent

event OnOptionMenuAccept(int a_option, int a_index)
	if CurrentPage == Pages[FW_MENU_PAGE_System]
		int index = UI_Compatible.Find(a_option)
		if index>=0
			Compatible[index] = GetCompatibleIndexByRank(index, a_index)
			SetMenuOptionValue(a_option, CompatibleOptions[Compatible[index]])
		endif
	endif
endEvent

event OnOptionDefault(int a_option)
	if CurrentPage == Pages[FW_MENU_PAGE_System]
		int index = UI_Compatible.Find(a_option)
		if index>=0
			Compatible[index] = CompatiblityDefaultValue[index]
			SetMenuOptionValue(a_option, CompatibleOptions[Compatible[index]])
		endif
	endif
endEvent



; STATES

; - Menu Options
State MenuProfileLoad
	Event OnMenuOpenST()
		int c = FWUtility.GetFileCount("Profile","json")
		if c>126
			c=126
		endif
		string[] Files = FWUtility.StringArray(c+1)
		Files[0] = "$FW_MENU_OPTIONS_None"
		while c>0
			c -= 1
			Files[c+1]=FWUtility.GetFileName("Profile","json",c)
		endWhile
		SetMenuDialogOptions(Files)
		SetMenuDialogStartIndex(0)
	EndEvent
	
	Event OnMenuAcceptST(int index)
		if(index>0)
			string FileName = FWUtility.GetFileName("Profile","json",index - 1)
			SetMenuOptionValueST(FileName)
			LoadProfile(FileName)
		endif
	EndEvent
	
	Event OnDefaultST()
		
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SYSTEM_ProfileLoad")
	EndEvent
EndState

State MenuWidgetProfile
	Event OnMenuOpenST()
		int c = FWUtility.GetFileCount("HUD","ini")
		if c>126
			c=126
		endif
		string[] Files = FWUtility.StringArray(c+1)
		Files[0] = "$FW_MENU_OPTIONS_None"
		int si = 0
		while c>0
			c -= 1
			Files[c+1]=FWUtility.GetFileName("HUD","ini",c)
			if Files[c+1]==WidgetProfile
				si=c+1
			endif
		endWhile
		SetMenuDialogOptions(Files)
		SetMenuDialogStartIndex(si)
	EndEvent
	
	Event OnMenuAcceptST(int index)
		if(index>0)
			string FileName = FWUtility.GetFileName("HUD","ini",index - 1)
			WidgetProfile = FileName
			SetMenuOptionValueST(FileName)
			LoadWidgetProfile(FileName)
		endif
	EndEvent
	
	Event OnDefaultST()
		string FileName = WidgetProfileDef
		WidgetProfile = FileName
		SetMenuOptionValueST(FileName)
		LoadWidgetProfile(FileName)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SYSTEM_WidgetProfile")
	EndEvent
EndState

State MenuBabySpawn
	Event OnMenuOpenST()
		SetMenuDialogDefaultIndex(BabySpawnDef)
		SetMenuDialogOptions(BabySpawnOptions)
		SetMenuDialogStartIndex(BabySpawn)
	EndEvent
	
	Event OnMenuAcceptST(int index)
		BabySpawn = index
		SetMenuOptionValueST(BabySpawnOptions[BabySpawn])
		SetInfoText(BabySpawnHighlightTexts[BabySpawn])
	EndEvent
	
	Event OnDefaultST()
		BabySpawn = BabySpawnDef
		SetMenuOptionValueST(BabySpawnOptions[BabySpawn])
		SetInfoText(BabySpawnHighlightTexts[BabySpawn])
	EndEvent
	
	Event OnHighlightST()
		SetInfoText(BabySpawnHighlightTexts[BabySpawn])
	EndEvent
EndState

State MenuBabySpawnNPC
	Event OnMenuOpenST()
		SetMenuDialogDefaultIndex(BabySpawnNPCDef)
		SetMenuDialogOptions(BabySpawnOptions)
		SetMenuDialogStartIndex(BabySpawnNPC)
	EndEvent
	
	Event OnMenuAcceptST(int index)
		BabySpawnNPC = index
		SetMenuOptionValueST(BabySpawnOptions[BabySpawnNPC])
		SetInfoText(BabySpawnHighlightTexts[BabySpawnNPC])
	EndEvent
	
	Event OnDefaultST()
		BabySpawnNPC = BabySpawnNPCDef
		SetMenuOptionValueST(BabySpawnOptions[BabySpawnNPC])
		SetInfoText(BabySpawnHighlightTexts[BabySpawnNPC])
	EndEvent
	
	Event OnHighlightST()
		SetInfoText(BabySpawnHighlightTexts[BabySpawnNPC])
	EndEvent
EndState

State MenuDifficulty
	Event OnMenuOpenST()
		SetMenuDialogDefaultIndex(DifficultyDef)
		SetMenuDialogOptions(DifficultyOptions)
		SetMenuDialogStartIndex(Difficulty)
	EndEvent
	
	Event OnMenuAcceptST(int index)
		Difficulty = index
		SetMenuOptionValueST(DifficultyOptions[Difficulty])
		SetInfoText(DifficultyHighlightTexts[Difficulty])
	EndEvent
	
	Event OnDefaultST()
		Difficulty = DifficultyDef
		SetMenuOptionValueST(DifficultyOptions[Difficulty])
		SetInfoText(DifficultyHighlightTexts[Difficulty])
	EndEvent
	
	Event OnHighlightST()
		SetInfoText(DifficultyHighlightTexts[Difficulty])
	EndEvent
EndState

State MenuMessages
	Event OnMenuOpenST()
		SetMenuDialogDefaultIndex(MessagesDef)
		SetMenuDialogOptions(MessagesOptions)
		SetMenuDialogStartIndex(Messages)
	EndEvent
	
	Event OnMenuAcceptST(int index)
		Messages = index
		SetMenuOptionValueST(MessagesOptions[Messages])
		System.refreshObjective()
		SetInfoText(MessagesHighlightTexts[Messages])
	EndEvent
	
	Event OnDefaultST()
		Messages = MessagesDef
		SetMenuOptionValueST(MessagesOptions[Messages])
		System.refreshObjective()
		SetInfoText(MessagesHighlightTexts[Messages])
	EndEvent
	
	Event OnHighlightST()
		SetInfoText(MessagesHighlightTexts[Messages])
	EndEvent
EndState

State MenuVisualScaling
	Event OnMenuOpenST()
		SetMenuDialogDefaultIndex(VisualScalingDef)
		SetMenuDialogOptions(VisualScalingOptions)
		SetMenuDialogStartIndex(VisualScaling)
	EndEvent
	
	Event OnMenuAcceptST(int index)
		VisualScaling = index
		SetMenuOptionValueST(VisualScalingOptions[VisualScaling])
		
		int optionFlag = OPTION_FLAG_DISABLED
		If VisualScaling == 1 || VisualScaling == 2
			optionFlag = OPTION_FLAG_NONE
		EndIf
		SetOptionFlagsST(optionFlag, True, "ToggleBellyScale")
		SetOptionFlagsST(optionFlag, True, "ToggleBreastScale")
		SetOptionFlagsST(optionFlag, True, "SliderBellyScaleMax")
		SetOptionFlagsST(optionFlag, True, "SliderBreastScaleMax")
		
		optionFlag = OPTION_FLAG_DISABLED
		If VisualScaling == 3
			optionFlag = OPTION_FLAG_NONE
		EndIf
		SetOptionFlagsST(optionFlag, False, "SliderWeightGainMax")
		
		If System.Player
			System.Player.SetBelly()
		EndIf
		SetInfoText(VisualScalingHighlightTexts[VisualScaling])
	EndEvent
	
	Event OnDefaultST()
		VisualScaling = VisualScalingDef
		SetMenuOptionValueST(VisualScalingOptions[VisualScaling])
		
		If System.Player
			System.Player.SetBelly()
		EndIf
		SetInfoText(VisualScalingHighlightTexts[VisualScaling])
	EndEvent
	
	Event OnHighlightST()
		SetInfoText(VisualScalingHighlightTexts[VisualScaling])
	EndEvent
EndState

State MenuScalingKind
	Event OnMenuOpenST()
		SetMenuDialogDefaultIndex(VisualScalingKindDef)
		SetMenuDialogOptions(VisualScalingKindOptions)
		SetMenuDialogStartIndex(VisualScalingKind)
	EndEvent
	
	Event OnMenuAcceptST(int index)
		VisualScalingKind = index
		SetMenuOptionValueST(VisualScalingKindOptions[VisualScalingKind])
		
		If System.Player
			System.Player.SetBelly()
		EndIf
		SetInfoText(VisualScalingKindHighlightTexts[VisualScalingKind])
		SendModEvent("BeeingFemale","Belly")
	EndEvent
	
	Event OnDefaultST()
		VisualScalingKind = VisualScalingKindDef
		SetMenuOptionValueST(VisualScalingKindOptions[VisualScalingKind])
		
		If System.Player
			System.Player.SetBelly()
		EndIf
		SetInfoText(VisualScalingKindHighlightTexts[VisualScalingKind])
		SendModEvent("BeeingFemale","Belly")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText(VisualScalingKindHighlightTexts[VisualScalingKind])
	EndEvent
EndState



; - Slider Options
State SliderBellyScaleMax
	Event OnSliderOpenST()
		SetSliderDialogStartValue(BellyMaxScale)
		SetSliderDialogDefaultValue(BellyMaxScaleDef)
		SetSliderDialogRange(0, 8)
		SetSliderDialogInterval(0.1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		BellyMaxScale = value
		SetSliderOptionValueST(BellyMaxScale, "{1}")
		
		If System.Player
			System.Player.SetBelly()
		EndIf
	EndEvent
	
	Event OnDefaultST()
		BellyMaxScale = BellyMaxScaleDef
		SetSliderOptionValueST(BellyMaxScale, "{1}")
		
		If System.Player
			System.Player.SetBelly()
		EndIf
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_BellyMaxScale")
	EndEvent
EndState

State SliderBreastScaleMax
	Event OnSliderOpenST()
		SetSliderDialogStartValue(BreastsMaxScale)
		SetSliderDialogDefaultValue(BreastsMaxScaleDef)
		SetSliderDialogRange(0, 3)
		SetSliderDialogInterval(0.01)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		BreastsMaxScale = value
		SetSliderOptionValueST(BreastsMaxScale, "{2}")
		
		If System.Player
			System.Player.SetBelly()
		EndIf
	EndEvent
	
	Event OnDefaultST()
		BreastsMaxScale = BreastsMaxScaleDef
		SetSliderOptionValueST(BreastsMaxScale, "{2}")
		
		If System.Player
			System.Player.SetBelly()
		EndIf
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_BreastsMaxScale")
	EndEvent
EndState

State SliderConceptionChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(ConceiveChance)
		SetSliderDialogDefaultValue(ConceiveChance)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		ConceiveChance = value
		SetSliderOptionValueST(ConceiveChance, "{1}%")
		System.Controller.setAutoFlag(Game.GetPlayer())
	EndEvent
	
	Event OnDefaultST()
		ConceiveChance = ConceiveChanceDef
		SetSliderOptionValueST(ConceiveChance, "{1}%")
		System.Controller.setAutoFlag(Game.GetPlayer())
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_ConceiveChance")
	EndEvent
EndState

State SliderConceptionChanceFollower
	Event OnSliderOpenST()
		SetSliderDialogStartValue(ConceiveChanceFollower)
		SetSliderDialogDefaultValue(ConceiveChanceFollower)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		ConceiveChanceFollower = value
		SetSliderOptionValueST(ConceiveChanceFollower, "{1}%")
		SendModEvent("BeeingFemale","ConceptionChance",2)
	EndEvent
	
	Event OnDefaultST()
		ConceiveChanceFollower = ConceiveChanceFollowerDef
		SetSliderOptionValueST(ConceiveChanceFollower, "{1}%")
		SendModEvent("BeeingFemale","ConceptionChance",2)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_ConceiveChanceFollower")
	EndEvent
EndState

State SliderConceptionChanceNPC
	Event OnSliderOpenST()
		SetSliderDialogStartValue(ConceiveChanceNPC)
		SetSliderDialogDefaultValue(ConceiveChanceNPC)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		ConceiveChanceNPC = value
		SetSliderOptionValueST(ConceiveChanceNPC, "{1}%")
		SendModEvent("BeeingFemale","ConceptionChance",3)
	EndEvent
	
	Event OnDefaultST()
		ConceiveChanceNPC = ConceiveChanceNPCDef
		SetSliderOptionValueST(ConceiveChanceNPC, "{1}%")
		SendModEvent("BeeingFemale","ConceptionChance",3)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_ConceiveChanceNPC")
	EndEvent
EndState

State SliderIrregulationChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(irregulationChance)
		SetSliderDialogDefaultValue(irregulationChanceDef)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		irregulationChance = value
		SetSliderOptionValueST(irregulationChance, "{1}%")
	EndEvent
	
	Event OnDefaultST()
		irregulationChance = irregulationChanceDef
		SetSliderOptionValueST(irregulationChance, "{1}%")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_IrregulationChance")
	EndEvent
EndState


State SliderFollicularDuration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(FollicularDuration)
		SetSliderDialogDefaultValue(FollicularDurationDef)
		SetSliderDialogRange(2, 20)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		FollicularDuration = (value as int)
		SetSliderOptionValueST(FollicularDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnDefaultST()
		FollicularDuration = FollicularDurationDef
		SetSliderOptionValueST(FollicularDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_FollicularPhase")
	EndEvent
EndState

State SliderLutealDuration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(LutealDuration)
		SetSliderDialogDefaultValue(LutealDurationDef)
		SetSliderDialogRange(2, 20)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		LutealDuration = (value as int)
		SetSliderOptionValueST(LutealDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnDefaultST()
		LutealDuration = LutealDurationDef
		SetSliderOptionValueST(LutealDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_LutealPhase")
	EndEvent
EndState

State SliderMaleVirility
	Event OnSliderOpenST()
		SetSliderDialogStartValue((MaleVirilityRecovery * 24) as int)
		SetSliderDialogDefaultValue((MaleVirilityRecoveryDef * 24) as int)
		SetSliderDialogRange(1, 48)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		MaleVirilityRecovery = (Math.Floor(value) as float) / 24.0
		SetSliderOptionValueST(MaleVirilityRecovery * 24, "$FW_MENU_BASIC_Hours")
	EndEvent
	
	Event OnDefaultST()
		MaleVirilityRecovery = MaleVirilityRecoveryDef
		SetSliderOptionValueST(MaleVirilityRecovery * 24, "$FW_MENU_BASIC_Hours")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_MEN_MaleVirility")
	EndEvent
EndState

State SliderMenstrualCrampsChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(MenstrualCramps)
		SetSliderDialogDefaultValue(MenstrualCrampsDef)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		MenstrualCramps = value
		SetSliderOptionValueST(MenstrualCramps, "{1}%")
	EndEvent
	
	Event OnDefaultST()
		MenstrualCramps = MenstrualCrampsDef
		SetSliderOptionValueST(MenstrualCramps, "{1}%")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_MenstrualCramps")
	EndEvent
EndState

State SliderMenstruationDuration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(MenstrualDuration)
		SetSliderDialogDefaultValue(MenstrualDurationDef)
		SetSliderDialogRange(2, 20)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		MenstrualDuration = (value as int)
		SetSliderOptionValueST(MenstrualDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnDefaultST()
		MenstrualDuration = MenstrualDurationDef
		SetSliderOptionValueST(MenstrualDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_Menstruation")
	EndEvent
EndState

State SliderMultiplesNoMax
	Event OnSliderOpenST()
		SetSliderDialogStartValue(MaxBabys as int)
		SetSliderDialogDefaultValue(MaxBabysDef as int)
		SetSliderDialogRange(1, System.MaxBabyPregnantWith)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		MaxBabys = (value as int)
		SetSliderOptionValueST(MaxBabys, "$FW_MENU_BASIC_Baby")
	EndEvent
	
	Event OnDefaultST()
		MaxBabys = MaxBabysDef
		SetSliderOptionValueST(MaxBabys, "$FW_MENU_BASIC_Baby")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_MaxMultiples")
	EndEvent
EndState

State SliderMultiplesThreshold
	Event OnSliderOpenST()
		SetSliderDialogStartValue(MultipleThreshold as int)
		SetSliderDialogDefaultValue(MultipleThresholdDef as int)
		SetSliderDialogRange(1, 200)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		MultipleThreshold = (value as int)
		SetSliderOptionValueSt(MultipleThreshold, "1:{0}")
	EndEvent
	
	Event OnDefaultST()
		MultipleThreshold = MultipleThresholdDef
		SetSliderOptionValueST(MultipleThreshold, "1:{0}")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_MultiplesChance")
	EndEvent
EndState

State SliderOvulationDuration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(OvulationDuration)
		SetSliderDialogDefaultValue(OvulationDurationDef)
		SetSliderDialogRange(2, 20)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		OvulationDuration = (value as int)
		SetSliderOptionValueST(OvulationDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnDefaultST()
		OvulationDuration = OvulationDurationDef
		SetSliderOptionValueST(OvulationDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_Ovulation")
	EndEvent
EndState

State SliderPMSChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(PMSChance)
		SetSliderDialogDefaultValue(PMSChanceDef)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		PMSChance = value
		SetSliderOptionValueST(PMSChance, "{1}%")
	EndEvent
	
	Event OnDefaultST()
		PMSChance = PMSChanceDef
		SetSliderOptionValueST(PMSChance, "{1}%")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_PMSChance")
	EndEvent
EndState

State SliderPMSNoEffects
	Event OnSliderOpenST()
		SetSliderDialogStartValue(PMSEffects)
		SetSliderDialogDefaultValue(PMSEffectsDef)
		SetSliderDialogRange(1, 20)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		PMSEffects = (value as int)
		SetSliderOptionValueST(PMSEffects, "$FW_MENU_BASIC_Effects")
	EndEvent
	
	Event OnDefaultST()
		PMSEffects = PMSEffectsDef
		SetSliderOptionValueST(PMSEffects, "$FW_MENU_BASIC_Effects")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_PMSEffects")
	EndEvent
EndState

State SliderRecoveryDuration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(ReplanishDuration)
		SetSliderDialogDefaultValue(ReplanishDurationDef)
		SetSliderDialogRange(2, 300)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		ReplanishDuration = (value as int)
		SetSliderOptionValueST(ReplanishDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnDefaultST()
		ReplanishDuration = ReplanishDurationDef
		SetSliderOptionValueST(ReplanishDuration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_RecoveryPhase")
	EndEvent
EndState

State SliderSpermDuration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(SpermDuration)
		SetSliderDialogDefaultValue(SpermDurationDef)
		SetSliderDialogRange(0.5, 8.8)
		SetSliderDialogInterval(0.25)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		SpermDuration = (value as float)
		SetSliderOptionValueST(SpermDuration, "$FW_MENU_BASIC_DecDays")
	EndEvent
	
	Event OnDefaultST()
		SpermDuration = SpermDurationDef
		SetSliderOptionValueST(SpermDuration, "$FW_MENU_BASIC_DecDays")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_MEN_SpermDuration")
	EndEvent
EndState

State SliderTrimester1Duration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(Trimster1Duration)
		SetSliderDialogDefaultValue(Trimster1DurationDef)
		SetSliderDialogRange(2, 100)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		Trimster1Duration = (value as int)
		SetSliderOptionValueST(Trimster1Duration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnDefaultST()
		Trimster1Duration = Trimster1DurationDef
		SetSliderOptionValueST(Trimster1Duration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_1Trimester")
	EndEvent
EndState

State SliderTrimester2Duration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(Trimster2Duration)
		SetSliderDialogDefaultValue(Trimster2DurationDef)
		SetSliderDialogRange(2, 100)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		Trimster2Duration = (value as int)
		SetSliderOptionValueST(Trimster2Duration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnDefaultST()
		Trimster2Duration = Trimster2DurationDef
		SetSliderOptionValueST(Trimster2Duration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_2Trimester")
	EndEvent
EndState

State SliderTrimester3Duration
	Event OnSliderOpenST()
		SetSliderDialogStartValue(Trimster3Duration)
		SetSliderDialogDefaultValue(Trimster3DurationDef)
		SetSliderDialogRange(2, 100)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		Trimster3Duration = (value as int)
		SetSliderOptionValueST(Trimster3Duration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnDefaultST()
		Trimster3Duration = Trimster3DurationDef
		SetSliderOptionValueST(Trimster3Duration, "$FW_MENU_BASIC_Days")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_3Trimester")
	EndEvent
EndState

State SliderWashOutChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(WashOutChance * 100)
		SetSliderDialogDefaultValue(WashOutChanceDef * 100)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		WashOutChance = value / 100
		SetSliderOptionValueST(WashOutChance * 100, "{1}%")
	EndEvent
	
	Event OnDefaultST()
		WashOutChance = WashOutChanceDef
		SetSliderOptionValueST(WashOutChance * 100, "{1}%")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_WashingOutSperm")
	EndEvent
EndState

State SliderWashOutDelay
	Event OnSliderOpenST()
		SetSliderDialogStartValue((WashOutHourDelay * 24) as float)
		SetSliderDialogDefaultValue((WashOutHourDelayDef * 24) as float)
		SetSliderDialogRange(0, 24)
		SetSliderDialogInterval(0.2)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		WashOutHourDelay = value / 24.0
		SetSliderOptionValueST(WashOutHourDelay * 24, "$FW_MENU_BASIC_DecHours")
	EndEvent
	
	Event OnDefaultST()
		WashOutHourDelay = WashOutHourDelayDef
		SetSliderOptionValueST(WashOutHourDelay * 24, "$FW_MENU_BASIC_DecHours")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_MaximumSpermAge")
	EndEvent
EndState

State SliderWashOutFluidChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(WashOutFluidChance * 100)
		SetSliderDialogDefaultValue(WashOutFluidChanceDef * 100)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		WashOutFluidChance = value / 100
		SetSliderOptionValueST(WashOutFluidChance * 100, "{1}%")
	EndEvent
	
	Event OnDefaultST()
		WashOutFluidChance = WashOutFluidChanceDef
		SetSliderOptionValueST(WashOutFluidChance * 100, "{1}%")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_AntiSpermEssenceSafeZone")
	EndEvent
EndState

State SliderWashOutWaterChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(WashOutWaterChance * 100)
		SetSliderDialogDefaultValue(WashOutWaterChanceDef * 100)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		WashOutWaterChance = value / 100
		SetSliderOptionValueST(WashOutWaterChance * 100, "{1}%")
	EndEvent
	
	Event OnDefaultST()
		WashOutWaterChance = WashOutWaterChanceDef
		SetSliderOptionValueST(WashOutWaterChance * 100, "{1}%")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_WaterAssistedSafeZone")
	EndEvent
EndState

State SliderWeightGainMax
	Event OnSliderOpenST()
		SetSliderDialogStartValue(WeightGainMax)
		SetSliderDialogDefaultValue(WeightGainMaxDef)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		WeightGainMax = (value as int)
		SetSliderOptionValueST(WeightGainMax, "{0}")
		
		If System.Player
			System.Player.SetBelly()
		EndIf
	EndEvent
	
	Event OnDefaultST()
		WeightGainMax = WeightGainMaxDef
		SetSliderOptionValueST(WeightGainMax, "{0}")
		
		If System.Player
			System.Player.SetBelly()
		EndIf
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_MaxWeightGain")
	EndEvent
EndState


State SliderNoVaginalCumChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(NoVaginalCumChance)
		SetSliderDialogDefaultValue(NoVaginalCumChanceDef)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		NoVaginalCumChance = (value as int)
		SetSliderOptionValueST(NoVaginalCumChance, "{0}")
	EndEvent
	
	Event OnDefaultST()
		NoVaginalCumChance = NoVaginalCumChanceDef
		SetSliderOptionValueST(NoVaginalCumChance, "{0}")
		
		If System.Player
			System.Player.SetBelly()
		EndIf
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_MEN_NoVaginalCumChance")
	EndEvent
EndState

State SliderUpdateInterval
	Event OnSliderOpenST()
		SetSliderDialogStartValue(UpdateInterval)
		SetSliderDialogDefaultValue(UpdateIntervalDef)
		SetSliderDialogRange(10, 60)
		SetSliderDialogInterval(5)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		UpdateInterval = value
		SetSliderOptionValueST(UpdateInterval, "$FW_MENU_BASIC_Seconds")
		System.UnregisterForUpdate()
		if UpdateInterval<10
			UpdateInterval=10
		endif
		if UpdateIntervalEnabled==true
			System.RegisterForUpdate(UpdateInterval)
		endif
	EndEvent
	
	Event OnDefaultST()
		UpdateInterval = UpdateIntervalDef
		SetSliderOptionValueST(UpdateInterval, "$FW_MENU_BASIC_Seconds")
		System.UnregisterForUpdate()
		if UpdateInterval<10
			UpdateInterval=10
		endif
		if UpdateIntervalEnabled==true
			System.RegisterForUpdate(UpdateInterval)
		endif
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_UpdateInterval")
	EndEvent
EndState

; Slides
; 1		SliderImpregnateTime				$FW_MENU_Impregnate_Time				ImpregnateTime				$FW_MENU_BASIC_Time
; 2		SliderImpregnateCount				$FW_MENU_Impregnate_Count				ImpregnateCount				$FW_MENU_BASIC_NPCs
; 3		SliderImpregnatePlayerChance		$FW_MENU_Impregnate_PlayerChance		ImpregnatePlayerChance		{0}%
State SliderImpregnateTime
	Event OnSliderOpenST()
		SetSliderDialogStartValue(ImpregnateTime)
		SetSliderDialogDefaultValue(ImpregnateTimeDef)
		SetSliderDialogRange(0, 23)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		ImpregnateTime = (value as int)
		SetSliderOptionValueST(ImpregnateTime, "$FW_MENU_BASIC_Time")
	EndEvent
	
	Event OnDefaultST()
		ImpregnateTime = ImpregnateTimeDef
		SetSliderOptionValueST(UpdateInterval, "$FW_MENU_BASIC_Time")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_Time")
	EndEvent
EndState

State SliderImpregnateCount
	Event OnSliderOpenST()
		SetSliderDialogStartValue(ImpregnateCount)
		SetSliderDialogDefaultValue(ImpregnateCountDef)
		SetSliderDialogRange(0, 50)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		ImpregnateCount = (value as int)
		SetSliderOptionValueST(ImpregnateCount, "$FW_MENU_BASIC_NPCs")
	EndEvent
	
	Event OnDefaultST()
		ImpregnateCount = ImpregnateCountDef
		SetSliderOptionValueST(ImpregnateCount, "$FW_MENU_BASIC_NPCs")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_Count")
	EndEvent
EndState

State SliderImpregnatePlayerChance
	Event OnSliderOpenST()
		SetSliderDialogStartValue(ImpregnatePlayerChance)
		SetSliderDialogDefaultValue(ImpregnatePlayerChanceDef)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	EndEvent
	
	Event OnSliderAcceptST(float value)
		ImpregnatePlayerChance = (value as int)
		SetSliderOptionValueST(ImpregnatePlayerChance, "{0}%")
	EndEvent
	
	Event OnDefaultST()
		ImpregnatePlayerChance = ImpregnatePlayerChanceDef
		SetSliderOptionValueST(ImpregnatePlayerChance, "{0}%")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_PlayerChance")
	EndEvent
EndState


;/

State Slider
	Event OnSliderOpenST()
	EndEvent
	
	Event OnSliderAcceptST(float value)
	EndEvent
	
	Event OnDefaultST()
	EndEvent
	
	Event OnHighlightST()
	EndEvent
EndState

/;

; - Text Options
state TextProfileSave
	Event OnSelectST()
		if CurrentProfileExists()
			System.Message("Profile already exists", System.MSG_ALWAYS, System.MSG_Box)
		else
			string s = SaveProfile()
			if s==""
				System.Message("Failed to save Profile", System.MSG_ALWAYS, System.MSG_Box)
			else
				System.Message("Profile Saved\n"+s,System.MSG_ALWAYS, System.MSG_Box)
				SetTextOptionValueST(s, false, "MenuProfileLoad")
			endif
		endif
	EndEvent
EndState

State TextChangeState
	Event OnSelectST()
		If System.Player
			System.Player.changeState(System.Player.nextState)
			System.Player.SetBelly()
			ForcePageReset()
		EndIf
	EndEvent
EndState

State TextNpcChangeState
	Event OnSelectST()
		If System.Player
			actor f = Game.GetCurrentCrosshairRef() as actor
			If(f.GetLeveledActorBase().GetSex()==1)
				System.Controller.changeState(f, System.Controller.GetNextState(f))
				System.Controller.SetBelly(f)
				ForcePageReset()
			endif
		EndIf
	EndEvent
EndState

state TextRefreshAddOn
	Event OnSelectST()
		System.Manager.Clear()
		;System.Manager.sendmodevent("FWAddOnRefresh", "", 0.0)
		System.Manager.RefreshAddOn()
		System.ChildSettings.ResetChildPerks()
		System.OnGameLoad(true) ;***Added by Bane
	EndEvent
endState

state TextUpdateAll
	Event OnSelectST()
		if ShowMessage("$FW_MESSAGE_CONTENT_UpdateNPC",true,"$FW_MESSAGE_OPTION_Update")
			
			int c= StorageUtil.FormListCount(none,"FW.SavedNPCs")
			if c<=0
				return
			endif
			
			System.Progress.Icon = System.Progress.ICN_Update
			System.Progress.Job = "Update ..."
			System.Progress.showWidget()
			
			SetOptionFlagsST(OPTION_FLAG_DISABLED)
			int i= 0
			SetTextOptionValueST("0%")
			bRunUpdateAllWoman = true
			while i<c && bRunUpdateAllWoman == true
			
				System.Progress.Icon = System.Progress.ICN_Update
				
				actor woman= StorageUtil.FormListGet(none,"FW.SavedNPCs",i) as actor
				if woman
					;SetInfoText("Update: "+woman.GetLeveledActorBase().GetName())
					System.Progress.Job = "Update "+woman.GetLeveledActorBase().GetName()
					UI.InvokeString("Journal Menu", "_root.Menu_mc.setInfoText", "Update: "+woman.GetLeveledActorBase().GetName())
					if woman==none || woman.IsDead() || woman.GetLeveledActorBase().GetSex() == 0
						; delete this Actor
						FWSaveLoad.Delete(woman)
					else
						System.Data.UpdatePerDay(woman)
					endif
					System.Progress
				else
					StorageUtil.FormListRemoveAt(none,"FW.SavedNPCs",i)
					SetTextOptionValueST(c,"TextNoSavedNPCs")
					c-=1
					i-=1
				endif
				int percent=((i*100) / c) as int
				SetTextOptionValueST(percent+"%")
				System.Progress.Percent = percent
				i+=1
			endwhile
			bRunUpdateAllWoman = false
			SetTextOptionValueST("$FW_MENU_OPTIONS_Refresh")
			SetOptionFlagsST(OPTION_FLAG_NONE)
			System.Progress.hideWidget()
		endif
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_UpdateAll")
	EndEvent
endstate

State TextJobToDo
	Event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		If System.Player
			int jobID = GetJobID()
			
			If jobID == 0
				bool bHasSperm=System.Controller.HasRelevantSperm(Game.GetPlayer())
				If bHasSperm==true || System.CheatAddFather.Length > 0
					Actor[] donors
					int cSperm=0
					If bHasSperm==false
						donors=new Actor[1]
						donors[0] = Game.GetForm(System.CheatAddFather[Utility.RandomInt(0, System.CheatAddFather.Length - 1)]) as Actor
						cSperm = 1
					else
						donors=System.Controller.GetRelevantSpermActors(Game.GetPlayer())
						cSperm = donors.length
					EndIf
					
					
					System.Player.NumChilds = System.calculateNumChildren(Game.GetPlayer())
					int i = System.Player.NumChilds
					StorageUtil.FormListClear(Game.GetPlayer(),"FW.ChildFather")
					StorageUtil.SetIntValue(Game.GetPlayer(),"FW.NumChilds",i)
					While i > 0
						i -= 1
						actor a = donors[Utility.RandomInt(0, cSperm - 1)]
						if (a==none)
							Game.GetForm(System.CheatAddFather[Utility.RandomInt(0, System.CheatAddFather.Length - 1)]) as Actor
						endif
						;System.Player.ChildFather[i] = donors[Utility.RandomInt(0, cSperm - 1)]
						StorageUtil.FormListAdd(Game.GetPlayer(),"FW.ChildFather", a )
					EndWhile
					
					System.Player.changeState(4)
				EndIf
			
			ElseIf jobID == 1
				System.Player.changeState(7)
				System.Player.SetBelly()
				System.Controller.GiveBirth(Game.GetPlayer())
			
			ElseIf jobID == 2
				System.Player.NumChilds = 0
				StorageUtil.FormListClear(Game.GetPlayer(),"FW.ChildFather")
				StorageUtil.SetIntValue(Game.GetPlayer(),"FW.NumChilds",0)
				StorageUtil.UnsetIntValue(Game.GetPlayer(),"FW.Abortus")
				StorageUtil.UnsetFloatValue(Game.GetPlayer(),"FW.UnbornHealth")
				System.Player.changeState(0)
				System.Player.SetBelly()
			EndIf
			
			ForcePageReset()
		EndIf
		SetOptionFlagsST(OPTION_FLAG_NONE)
	EndEvent
EndState

State TextNpcJobToDo
	Event OnSelectST()
		actor target = Game.GetCurrentCrosshairRef() as actor
		If(target.GetLeveledActorBase().GetSex()==0)
			return
		endif
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		If target
			int jobID = GetJobID(target)
			
			If jobID == 0
				bool bHasSperm=System.Controller.HasRelevantSperm(target)
				If bHasSperm==true || System.CheatAddFather.Length > 0
					Actor[] donors
					int cSperm=0
					If bHasSperm==false
						donors=new Actor[1]
						donors[0] = Game.GetForm(System.CheatAddFather[Utility.RandomInt(0, System.CheatAddFather.Length - 1)]) as Actor
						cSperm = 1
					else
						donors=System.Controller.GetRelevantSpermActors(target)
						cSperm = donors.length
					EndIf
					
					int i = System.calculateNumChildren(target)
					StorageUtil.FormListClear(target,"FW.ChildFather")
					StorageUtil.SetIntValue(target,"FW.NumChilds",i)
					While i > 0
						i -= 1
						;System.Player.ChildFather[i] = donors[Utility.RandomInt(0, cSperm - 1)]
						StorageUtil.FormListAdd(target,"FW.ChildFather", donors[Utility.RandomInt(0, cSperm - 1)] )
					EndWhile
					
					System.Controller.changeState(target, 4)
				EndIf
			
			ElseIf jobID == 1
				System.Controller.changeState(target, 7)
				System.Controller.GiveBirth(target)
				System.Controller.SetBelly(target)
			ElseIf jobID == 2
				System.Player.NumChilds = 0
				StorageUtil.FormListClear(target,"FW.ChildFather")
				StorageUtil.SetIntValue(target,"FW.NumChilds",0)
				StorageUtil.UnsetIntValue(target,"FW.Abortus")
				StorageUtil.UnsetFloatValue(target,"FW.UnbornHealth")
				System.Controller.changeState(target, 0)
				System.Controller.SetBelly(target)
			EndIf
			
			ForcePageReset()
		EndIf
		SetOptionFlagsST(OPTION_FLAG_NONE)
	EndEvent
EndState

State TextResetNPCs
	Event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		if ShowMessage("$FW_MESSAGE_CONTENT_ResetNPC",true,"$FW_MESSAGE_OPTION_Reset")
			FWSaveLoad.ResetNpcData()
			SetTextOptionValueST(StorageUtil.FormListCount(none, "fw_storedNPC"), "TextNoSavedNPCs")
		endif
		SetOptionFlagsST(OPTION_FLAG_NONE)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_ResetNPC")
	EndEvent
EndState

State TextResetPC
	Event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		if ShowMessage("$FW_MESSAGE_CONTENT_ResetPlayer",true,"$FW_MESSAGE_OPTION_Reset")
			if Game.GetPlayer().HasSpell(System.BeeingFemaleSpell)
				Game.GetPlayer().RemoveSpell(System.BeeingFemaleSpell)
			endif
			if Game.GetPlayer().HasSpell(System.BeeingMaleSpell)
				Game.GetPlayer().RemoveSpell(System.BeeingMaleSpell)
			endif
			FWSaveLoad.Delete(Game.GetPlayer())
			System.giveStartupItems()
			System.giveStartupSpells()
		endif
		SetOptionFlagsST(OPTION_FLAG_NONE)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_ResetPlayer")
	EndEvent
EndState

State TextResetNPC
	Event OnSelectST()
		actor target = Game.GetCurrentCrosshairRef() as actor
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		;if ShowMessage("$FW_MESSAGE_CONTENT_ResetPlayer",true,"$FW_MESSAGE_OPTION_Reset")
			if target.HasSpell(System.BeeingFemaleSpell)
				target.RemoveSpell(System.BeeingFemaleSpell)
			endif
			if target.HasSpell(System.BeeingMaleSpell)
				target.RemoveSpell(System.BeeingMaleSpell)
			endif
			FWSaveLoad.Delete(target)
			if System.IsValidateFemaleActor(target) > 0
				target.AddSpell(System.BeeingFemaleSpell)
			elseif System.IsValidateMaleActor(target) > 0
				target.AddSpell(System.BeeingMaleSpell)
			endif
		;endif
		SetOptionFlagsST(OPTION_FLAG_NONE)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_ResetPlayer")
	EndEvent
EndState

state TextUpdateNPC
	Event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		actor target = Game.GetCurrentCrosshairRef() as actor
		if System.IsValidateFemaleActor(target) > 0
			System.Data.Update(target)
		endif
		SetOptionFlagsST(OPTION_FLAG_NONE)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_ResetPlayer")
	EndEvent
endstate

State TextResetPCBreastBellyScale
	Event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		Actor player = Game.GetPlayer()
		If player.HasSpell(System.BeeingFemaleSpell)
			System.Player.BaseBellySize = New Float[2]
			System.Player.BaseBellySize[0] = 1.0
			System.Player.BaseBellySize[1] = 1.0

			System.Player.BaseBreastSize = New Float[8]
			System.Player.BaseBreastSize[0] = 1.0
			System.Player.BaseBreastSize[1] = 1.0
			System.Player.BaseBreastSize[2] = 1.0
			System.Player.BaseBreastSize[3] = 1.0
			System.Player.BaseBreastSize[4] = 1.0
			System.Player.BaseBreastSize[5] = 1.0
			System.Player.BaseBreastSize[6] = 1.0
			System.Player.BaseBreastSize[7] = 1.0
		EndIf
		SetOptionFlagsST(OPTION_FLAG_NONE)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_ResetBreastBellyScale")
	EndEvent
EndState

state TextUninstall
	Event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		SetTextOptionValueST("$FW_MESSAGE_OPTION_Wait")
		If ShowMessage("$FW_MESSAGE_CONTENT_Uninstall",true,"$FW_MESSAGE_OPTION_Uninstall")
			; Disable Cloaking
			System.ModEnabled.SetValueInt(0)
			System.CloakingSpellEnabled.SetValueInt(0)
			alias playerAlias = System.GetAlias(0)
			if playerAlias!=none
				playerAlias.UnregisterForUpdate()
			endif
			
			; Reset all CANS_Core
			;if System.CANSActive==true && System.CANS != none
			;	int i=StorageUtil.FormListCount(none,"FW.SavedNPCs")
			;	while i>0
			;		i-=1
			;		(System.CANS as CANS_Framework).UninstallMyMod(StorageUtil.FormListGet(none,"FW.SavedNPCs",i) as Actor, "BeeingFemale")
			;	endwhile
			;endif
			
			; Reset Player Belly and unregister update
			if System.Player!=none
				System.Player.ResetBelly()
				System.Player.UnregisterForUpdate()
				System.Player.UnregisterForUpdateGameTime()
			endif
			
			; Remove Spells from Player
			if Game.GetPlayer().HasSpell(System.BeeingFemaleSpell)==true
				Game.GetPlayer().RemoveSpell(System.BeeingFemaleSpell)
			endif
			if Game.GetPlayer().HasSpell(System.BeeingMaleSpell)==true
				Game.GetPlayer().RemoveSpell(System.BeeingMaleSpell)
			endif
			System.Player = none
			System.PlayerMale = none
			
			; Remove Spells from NPC
			SendModEvent("BeeingFemale","Dispel")
			
			; Delete Storage Variables
			FWSaveLoad.Delete(Game.GetPlayer())
			FWSaveLoad.ResetNpcData(true)
			FWSaveLoad.deleteChildren()
			
			; Reset AddOns
			System.Manager.OnUninstall()
			System.Manager.ClearRaceAddOns()
			System.Manager.ClearCMEAddOns()
			System.Manager.ClearMiscAddOns()
			
			ShowMessage("$FW_MESSAGE_CONTENT_CloseMenu",false)
			Utility.Wait(5)
			System.Message(System.Content.UninstallComplete,System.MSG_Always,System.MSG_Box)
		EndIf
		SetTextOptionValueST("$FW_MESSAGE_OPTION_Execute")
		SetOptionFlagsST(OPTION_FLAG_NONE)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SYSTEM_Uninstall")
	EndEvent
endState

state TextResetSystem
	Event OnSelectST()
		SetTextOptionValueST("$FW_MESSAGE_OPTION_Wait")
		SetOptionFlagsST(OPTION_FLAG_DISABLED)
		
		ResetSystem()
		
		SetTextOptionValueST("$FW_MENU_OPTIONS_Execute")
		SetOptionFlagsST(OPTION_FLAG_NONE)
	endEvent
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SYSTEM_Reset")
	EndEvent
endState

state TextChildAddLevel
	Event OnSelectST()
		FWChildActor ch = Game.GetCurrentCrosshairRef() as FWChildActor
		If(ch.GetLevel() >= FWChildSettings.ChildMaxLevel())
			SetOptionFlagsST(OPTION_FLAG_DISABLED)
		else
			ch.AddLevel()
			SetTextOptionValueST(ch.GetLevel())
		endif
	endEvent
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_ChildAddLevel")
	EndEvent
endState

state TextSpawnChildren
	Event OnSelectST()
		int cRace = StorageUtil.FormListCount(none,"FW.AddOn.Races")
		while cRace>0
			cRace -= 1
			race r = StorageUtil.FormListGet(none,"FW.AddOn.Races",cRace) as race
			int cFemale=StorageUtil.FormListCount(r,"FW.AddOn.BabyArmor_Female")
			int cMale=StorageUtil.FormListCount(r,"FW.AddOn.BabyArmor_Male")
			while cFemale>0
				cFemale-=1
				FWSystem.SubSpawnChildItem(StorageUtil.FormListGet(r,"FW.AddOn.BabyArmor_Female",cFemale) as Armor, 1, Game.GetPlayer(), Game.GetPlayer())
			endWhile
			while cMale>0
				cMale-=1
				FWSystem.SubSpawnChildItem(StorageUtil.FormListGet(r,"FW.AddOn.BabyArmor_Male",cMale) as Armor, 1, Game.GetPlayer(), Game.GetPlayer())
			endWhile
		endwhile
	endEvent
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_SpawnChildren")
	EndEvent
endState

state TextCheckChildPerks
	Event OnSelectST()
		int i=0
		while i<128
			perkTestResult[i]="Progress"
			perkTestResultText[i]=""
			i+=1
		endWhile
		bTestPerkMode=true
		selectedPerk=-1
		lastPerkTested=-1
		ForcePageReset()
	endEvent
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_TestPerks")
	EndEvent
endState

state TextLeaveAddOnTest
	Event OnSelectST()
		if selectedPerk==-1
			bTestPerkMode=false
		else
			bTestPerkMode=true
			selectedPerk=-1
		endif
		ForcePageReset()
	endEvent
	Event OnHighlightST()
		
	EndEvent
endState

state TextForceMenu
	Event OnSelectST()
		PageResetJobID=0
		bForceMenu=true
		ForcePageReset()
	endEvent
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_ForceMenu")
	EndEvent
endState



; - Toggle Options
state ToggleCoupleWidget
	Event OnSelectST()
		System.CoupleWidget.enabled = !System.CoupleWidget.enabled
		SetToggleOptionValueST(System.CoupleWidget.enabled)
	EndEvent
	
	Event OnDefaultST()
		System.CoupleWidget.enabled = false
		SetToggleOptionValueST(System.CoupleWidget.enabled)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_CoupleMaker")
	EndEvent
EndState

State ToggleCreatureSperm
	Event OnSelectST()
		CreatureSperm = (! CreatureSperm)
		SetToggleOptionValueST(CreatureSperm)
	EndEvent
	
	Event OnDefaultST()
		CreatureSperm = CreatureSpermDef
		SetToggleOptionValueST(CreatureSperm)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_CreatureSperm")
	EndEvent
EndState

State ToggleMenstrualBlood
	Event OnSelectST()
		if System.GlobalMenstruating.GetValueInt() == 1
			SetToggleOptionValueST(false)
			System.GlobalMenstruating.SetValueInt(0)
		else
			SetToggleOptionValueST(true)
			System.GlobalMenstruating.SetValueInt(1)
		endif
		System.PantyWidget.UpdateContent()
	EndEvent
	
	Event OnDefaultST()
		if bMenstruationBloodDef == false
			SetToggleOptionValueST(false)
			System.GlobalMenstruating.SetValueInt(0)
		else
			SetToggleOptionValueST(true)
			System.GlobalMenstruating.SetValueInt(1)
		endif
		System.PantyWidget.UpdateContent()
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CYCLE_MenstrualBlood")
	EndEvent
EndState

State ToggleNPCBabySpawn
	Event OnSelectST()
		NPCBornChild = (! NPCBornChild)
		SetToggleOptionValueST(NPCBornChild)
	EndEvent
	
	Event OnDefaultST()
		NPCBornChild = NPCBornChildDef
		SetToggleOptionValueST(NPCBornChild)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_NPCSpawnBabies")
	EndEvent
EndState

state ToggleNPCHaveItems
	Event OnSelectST()
		NPCHaveItems = (! NPCHaveItems)
		SetToggleOptionValueST(NPCHaveItems)
	EndEvent
	
	Event OnDefaultST()
		NPCHaveItems = NPCHaveItemsDef
		SetToggleOptionValueST(NPCHaveItems)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_NPCHaveItems")
	EndEvent
EndState

State TogglePlayAnimations
	Event OnSelectST()
		if FNIS.VersionCompare(5, 4, 2) < 0
			ShowMessage(Content.FNISTXTNotInstalled,False,"$OK")
			PlayAnimations = false
		elseif Game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") < FWVersion.GetAnimationVersion()
			ShowMessage(Content.FNISTXTOverdue,False,"$OK")
			PlayAnimations = false
		else
			PlayAnimations = (! PlayAnimations)
		endif
		SetToggleOptionValueST(PlayAnimations)
	EndEvent
	
	Event OnDefaultST()
		if PlayAnimationsDef==true
			if FNIS.VersionCompare(5, 4, 2) < 0
				ShowMessage(Content.FNISTXTNotInstalled,False,"$OK")
				PlayAnimations = false
			elseif Game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") < FWVersion.GetAnimationVersion()
				ShowMessage(Content.FNISTXTOverdue,False,"$OK")
				PlayAnimations = false
			else
				PlayAnimations = PlayAnimationsDef
			endif
		else
			PlayAnimations = PlayAnimationsDef
		endif
		SetToggleOptionValueST(PlayAnimations)
	EndEvent
	
	Event OnHighlightST()
		if FNIS.VersionCompare(5, 4, 2) < 0
			SetInfoText("$GAME_CONTENT_FNIS_TXTNotInstalled")
		elseif Game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion") < FWVersion.GetAnimationVersion()
			SetInfoText("$GAME_CONTENT_FNIS_TXTOverdue")
		else
			SetInfoText("$FW_MENUTXT_SETTINGS_PlayAnimations")
		endif
	EndEvent
EndState

State ToggleNPCBleeding
	Event OnSelectST()
		NPCMenstruationBlood = (! NPCMenstruationBlood)
		SetToggleOptionValueST(NPCMenstruationBlood)
	EndEvent
	
	Event OnDefaultST()
		NPCMenstruationBlood = NPCMenstruationBloodDef
		SetToggleOptionValueST(NPCMenstruationBlood)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_NPCBleed")
	EndEvent
EndState

State ToggleNPCMood
	Event OnSelectST()
		NPCMenstrualMood = (! NPCMenstrualMood)
		SetToggleOptionValueST(NPCMenstrualMood)
	EndEvent
	
	Event OnDefaultST()
		NPCMenstrualMood = NPCMenstrualMoodDef
		SetToggleOptionValueST(NPCMenstrualMood)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_NPCMood")
	EndEvent
EndState

State ToggleNPCNoTalk
	Event OnSelectST()
		NPCMenstrualNoTalk = (! NPCMenstrualNoTalk)
		SetToggleOptionValueST(NPCMenstrualNoTalk)
	EndEvent
	
	Event OnDefaultST()
		NPCMenstrualNoTalk = NPCMenstrualNoTalkDef
		SetToggleOptionValueST(NPCMenstrualNoTalk)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_NPCWayward")
	EndEvent
EndState

State ToggleNPCPains
	Event OnSelectST()
		NPCFeelPain = (! NPCFeelPain)
		SetToggleOptionValueST(NPCFeelPain)
	EndEvent
	
	Event OnDefaultST()
		NPCFeelPain = NPCFeelPainDef
		SetToggleOptionValueST(NPCFeelPain)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_NPCPain")
	EndEvent
EndState

State ToggleNPCPregnancy
	Event OnSelectST()
		NPCCanBecomePregnant = (! NPCCanBecomePregnant)
		SetToggleOptionValueST(NPCCanBecomePregnant)
	EndEvent
	
	Event OnDefaultST()
		NPCCanBecomePregnant = NPCCanBecomePregnantDef
		SetToggleOptionValueST(NPCCanBecomePregnant)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_NPCPregnant")
	EndEvent
EndState

State TogglePlayerFertility
	Event OnSelectST()
		System.Player.canBecomePregnantThisCycle = (! System.Player.canBecomePregnantThisCycle)
		System.Controller.setCanBecomePregnant(Game.GetPlayer(),System.Player.canBecomePregnantThisCycle)
		SetToggleOptionValueST(System.Player.canBecomePregnantThisCycle)
	EndEvent
EndState

State TogglePlayerPMS
	Event OnSelectST()
		System.Player.canBecomePMSThisCycle = (! System.Player.canBecomePMSThisCycle)
		System.Controller.setCanBecomePMS(Game.GetPlayer(),System.Player.canBecomePMSThisCycle)
		SetToggleOptionValueST(System.Player.canBecomePMSThisCycle)
	EndEvent
EndState

State TogglePlayerTimer
	Event OnSelectST()
		PlayerTimer = (! PlayerTimer)
		System.PlayerTimer(PlayerTimer)
		SetToggleOptionValueST(PlayerTimer)
	EndEvent
	
	Event OnDefaultST()
		PlayerTimer = PlayerTimerDef
		System.PlayerTimer(PlayerTimer)
		SetToggleOptionValueST(PlayerTimer)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_PlayerTimer")
	EndEvent
EndState

State ToggleShowStatsSpell
	Event OnSelectST()
		Actor player = Game.GetPlayer()
		If player.HasSpell(System.BeeingFemaleInfoSpell)
			player.RemoveSpell(System.BeeingFemaleInfoSpell)
		Else
			player.AddSpell(System.BeeingFemaleInfoSpell)
		EndIf
		SetToggleOptionValueST(player.HasSpell(System.BeeingFemaleInfoSpell))
	EndEvent
	
	Event OnDefaultST()
		Actor player = Game.GetPlayer()
		If (! player.HasSpell(System.BeeingFemaleInfoSpell))
			player.AddSpell(System.BeeingFemaleInfoSpell)
		EndIf
		SetToggleOptionValueST(player.HasSpell(System.BeeingFemaleInfoSpell))
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_StatsSpell")
	EndEvent
EndState

State ToggleRelevantPlayer
	Event OnSelectST()
		RelevantPlayer = (! RelevantPlayer)
		SetToggleOptionValueST(RelevantPlayer)
	EndEvent
	
	Event OnDefaultST()
		RelevantPlayer = RelevantPlayerDef
		SetToggleOptionValueST(RelevantPlayer)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_RelevantPlayer")
	EndEvent
EndState

State ToggleRelevantFollower
	Event OnSelectST()
		RelevantFollower = (! RelevantFollower)
		SetToggleOptionValueST(RelevantFollower)
	EndEvent
	
	Event OnDefaultST()
		RelevantFollower = RelevantFollowerDef
		SetToggleOptionValueST(RelevantFollower)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_RelevantFollower")
	EndEvent
EndState

State ToggleAbortus
	Event OnSelectST()
		abortus = (! abortus)
		SetToggleOptionValueST(abortus)
	EndEvent
	
	Event OnDefaultST()
		abortus = abortusDef
		SetToggleOptionValueST(abortus)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_Abortus")
	EndEvent
EndState

State ToggleRelevantNPC
	Event OnSelectST()
		RelevantNPC = (! RelevantNPC)
		SetToggleOptionValueST(RelevantNPC)
	EndEvent
	
	Event OnDefaultST()
		RelevantNPC = RelevantNPCDef
		SetToggleOptionValueST(RelevantNPC)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_RelevantNPC")
	EndEvent
EndState

state ToggleBreastScale
	Event OnSelectST()
		BreastScale = (! BreastScale)
		SetToggleOptionValueST(BreastScale)
		if BreastScale==true
			SetOptionFlagsST(OPTION_FLAG_NONE, True, "SliderBreastScaleMax")
		else
			SetOptionFlagsST(OPTION_FLAG_DISABLED, True, "SliderBreastScaleMax")
		endif
	EndEvent
	
	Event OnDefaultST()
		BreastScale = BreastScaleDef
		SetToggleOptionValueST(BreastScale)
		if BreastScale==true
			SetOptionFlagsST(OPTION_FLAG_NONE, True, "SliderBreastScaleMax")
		else
			SetOptionFlagsST(OPTION_FLAG_DISABLED, True, "SliderBreastScaleMax")
		endif
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_BreastScale")
	EndEvent
endstate

state ToggleBellyScale
	Event OnSelectST()
		BellyScale = (! BellyScale)
		SetToggleOptionValueST(BellyScale)
		if BellyScale==true
			SetOptionFlagsST(OPTION_FLAG_NONE, True, "SliderBellyScaleMax")
		else
			SetOptionFlagsST(OPTION_FLAG_DISABLED, True, "SliderBellyScaleMax")
		endif
	EndEvent
	
	Event OnDefaultST()
		BellyScale = BellyScaleDef
		SetToggleOptionValueST(BellyScale)
		if BellyScale==true
			SetOptionFlagsST(OPTION_FLAG_NONE, True, "SliderBellyScaleMax")
		else
			SetOptionFlagsST(OPTION_FLAG_DISABLED, True, "SliderBellyScaleMax")
		endif
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_PREGNANCY_BellyScale")
	EndEvent
endstate


state ToggleShowChildFinder
	Event OnSelectST()
		if System.ChildFinder.IsObjectiveDisplayed(1)==true
			System.ChildFinder.SetStage(0)
			System.ChildFinder.SetObjectiveDisplayed(1,false)
			System.ChildFinder.SetActive(false)
			System.Stop()
			SetToggleOptionValueST(false)
		else
			System.ChildFinder.SetActive(true)
			System.ChildFinder.Start()
			System.ChildFinder.Reset()
			System.ChildFinder.SetStage(1)
			System.ChildFinder.SetObjectiveDisplayed(1,true)
			SetToggleOptionValueST(true)
		endif
	EndEvent
	
	Event OnDefaultST()
		System.ChildFinder.SetObjectiveDisplayed(1,false)
		System.ChildFinder.SetActive(false)
		System.Stop()
		SetToggleOptionValueST(false)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_ChildFinder")
	EndEvent
endstate

state ToggleUpdateInterval
	Event OnSelectST()
		UpdateIntervalEnabled = (! UpdateIntervalEnabled)
		SetToggleOptionValueST(UpdateIntervalEnabled)
		if UpdateIntervalEnabled==true
			SetOptionFlagsST(OPTION_FLAG_NONE, false, "SliderUpdateInterval")
			System.UnregisterForUpdate()
			if UpdateInterval<10
				UpdateInterval=10
			endif
			System.RegisterForUpdate(UpdateInterval)
		else
			SetOptionFlagsST(OPTION_FLAG_DISABLED, false, "SliderUpdateInterval")
			System.UnregisterForUpdate()
		endif
	EndEvent
	
	Event OnDefaultST()
		UpdateIntervalEnabled = UpdateIntervalEnabledDef
		SetToggleOptionValueST(UpdateIntervalEnabled)
		if UpdateIntervalEnabled==true
			SetOptionFlagsST(OPTION_FLAG_NONE, false, "SliderUpdateInterval")
			System.UnregisterForUpdate()
			if UpdateInterval<10
				UpdateInterval=10
			endif
			System.RegisterForUpdate(UpdateInterval)
		else
			SetOptionFlagsST(OPTION_FLAG_DISABLED, false, "SliderUpdateInterval")
			System.UnregisterForUpdate()
		endif
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_UpdateInterval")
	EndEvent
endstate

; Slides
; 1		SliderImpregnateTime				$FW_MENU_Impregnate_Time				ImpregnateTime				$FW_MENU_BASIC_Time
; 2		SliderImpregnateCount				$FW_MENU_Impregnate_Count				ImpregnateCount				$FW_MENU_BASIC_NPCs
; 3		SliderImpregnatePlayerChance		$FW_MENU_Impregnate_PlayerChance		ImpregnatePlayerChance		{0}%
; Toggles
; 1		ToggleImpregnateActive				$FW_MENU_Impregnate_Activate			ImpregnateActive
; 2		ToggleImpregnateHusband				$FW_MENU_Impregnate_Husband				ImpregnateHusband
; 3		ToggleImpregnateAffairs				$FW_MENU_Impregnate_Affairs				ImpregnateAffairs
; 4		ToggleImpregnatePartners			$FW_MENU_Impregnate_Partners			ImpregnatePartners
; 5		ToggleImpregnateLastNPC				$FW_MENU_Impregnate_LastNPC				ImpregnateLastNPC
; 6		ToggleImpregnatePlayerSleep			$FW_MENU_Impregnate_PlayerSleep			ImpregnatePlayerSleep
; 7		ToggleImpregnatePlayerHusband		$FW_MENUTXT_Impregnate_PlayerHusband	ImpregnatePlayerHusband
; 8		ToggleImpregnatePlayerFollower		$FW_MENUTXT_Impregnate_PlayerFollower	ImpregnatePlayerFollower
; 9		ToggleImpregnateLastPlayerNPCs		$FW_MENUTXT_Impregnate_PlayerNPCs		ImpregnateLastPlayerNPCs
;10		ToggleImpregnatePlayerAmbient		$FW_MENUTXT_Impregnate_PlayerAmbient	ImpregnatePlayerAmbient

state ToggleImpregnateActive
	Event OnSelectST()
		ImpregnateActive = (! ImpregnateActive)
		SetToggleOptionValueST(ImpregnateActive)
		int opt = OPTION_FLAG_DISABLED
		if ImpregnateActive
			opt = OPTION_FLAG_NONE
		endif
		SetOptionFlagsST(opt, false, "ToggleImpregnateHusband")
		SetOptionFlagsST(opt, false, "ToggleImpregnateAffairs")
		SetOptionFlagsST(opt, false, "ToggleImpregnatePartners")
		SetOptionFlagsST(opt, false, "ToggleImpregnateLastNPC")
		SetOptionFlagsST(opt, false, "SliderImpregnateTime")
		SetOptionFlagsST(opt, false, "SliderImpregnateCount")
	EndEvent
	
	Event OnDefaultST()
		ImpregnateActive = ImpregnateActiveDef
		SetToggleOptionValueST(ImpregnateActive)
		int opt = OPTION_FLAG_DISABLED
		if ImpregnateActive
			opt = OPTION_FLAG_NONE
		endif
		SetOptionFlagsST(opt, false, "ToggleImpregnateHusband")
		SetOptionFlagsST(opt, false, "ToggleImpregnateAffairs")
		SetOptionFlagsST(opt, false, "ToggleImpregnatePartners")
		SetOptionFlagsST(opt, false, "ToggleImpregnateLastNPC")
		SetOptionFlagsST(opt, false, "SliderImpregnateTime")
		SetOptionFlagsST(opt, false, "SliderImpregnateCount")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_Activate")
	EndEvent
endstate


; 2		ToggleImpregnateHusband				$FW_MENU_Impregnate_Husband				ImpregnateHusband
state ToggleImpregnateHusband
	Event OnSelectST()
		ImpregnateHusband = (! ImpregnateHusband)
		SetToggleOptionValueST(ImpregnateHusband)
	EndEvent
	
	Event OnDefaultST()
		ImpregnateHusband = ImpregnateHusbandDef
		SetToggleOptionValueST(ImpregnateHusband)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_Husband")
	EndEvent
endstate

; 3		ToggleImpregnateAffairs				$FW_MENU_Impregnate_Affairs				ImpregnateAffairs
state ToggleImpregnateAffairs
	Event OnSelectST()
		ImpregnateAffairs = (! ImpregnateAffairs)
		SetToggleOptionValueST(ImpregnateAffairs)
	EndEvent
	
	Event OnDefaultST()
		ImpregnateAffairs = ImpregnateAffairsDef
		SetToggleOptionValueST(ImpregnateAffairs)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_Affairs")
	EndEvent
endstate

; 4		ToggleImpregnatePartners			$FW_MENU_Impregnate_Partners			ImpregnatePartners
state ToggleImpregnatePartners
	Event OnSelectST()
		ImpregnatePartners = (! ImpregnatePartners)
		SetToggleOptionValueST(ImpregnatePartners)
	EndEvent
	
	Event OnDefaultST()
		ImpregnatePartners = ImpregnatePartnersDef
		SetToggleOptionValueST(ImpregnatePartners)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_Partners")
	EndEvent
endstate

; 5		ToggleImpregnateLastNPC				$FW_MENU_Impregnate_LastNPC				ImpregnateLastNPC
state ToggleImpregnateLastNPC
	Event OnSelectST()
		ImpregnateLastNPC = (! ImpregnateLastNPC)
		SetToggleOptionValueST(ImpregnateLastNPC)
	EndEvent
	
	Event OnDefaultST()
		ImpregnateLastNPC = ImpregnateLastNPCDef
		SetToggleOptionValueST(ImpregnateLastNPC)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_LastNPC")
	EndEvent
endstate

state ToggleImpregnatePlayerSpouse
	Event OnSelectST()
		ImpregnatePlayerSpouse = (! ImpregnatePlayerSpouse)
		SetToggleOptionValueST(ImpregnatePlayerSpouse)
	EndEvent
	
	Event OnDefaultST()
		ImpregnatePlayerSpouse = ImpregnatePlayerSpouseDef
		SetToggleOptionValueST(ImpregnatePlayerSpouse)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_PlayerSpouse")
	EndEvent
EndState

state ToggleBabyMayCry
	Event OnSelectST()
		ChildrenMayCry = (! ChildrenMayCry)
		SetToggleOptionValueST(ChildrenMayCry)
	EndEvent
	
	Event OnDefaultST()
		ChildrenMayCry = ChildrenMayCryDef
		SetToggleOptionValueST(ChildrenMayCry)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHILDREN_ChildrenMayCry")
	EndEvent
endstate

; Slides
; 1		SliderImpregnateTime				$FW_MENU_Impregnate_Time				ImpregnateTime				$FW_MENU_BASIC_Time
; 2		SliderImpregnateCount				$FW_MENU_Impregnate_Count				ImpregnateCount				$FW_MENU_BASIC_NPCs
; 3		SliderImpregnatePlayerChance		$FW_MENU_Impregnate_PlayerChance		ImpregnatePlayerChance		{0}%
; Toggles
; 1		ToggleImpregnateActive				$FW_MENU_Impregnate_Activate			ImpregnateActive
; 2		ToggleImpregnateHusband				$FW_MENU_Impregnate_Husband				ImpregnateHusband
; 3		ToggleImpregnateAffairs				$FW_MENU_Impregnate_Affairs				ImpregnateAffairs
; 4		ToggleImpregnatePartners			$FW_MENU_Impregnate_Partners			ImpregnatePartners
; 5		ToggleImpregnateLastNPC				$FW_MENU_Impregnate_LastNPC				ImpregnateLastNPC
; 6		ToggleImpregnatePlayerSleep			$FW_MENU_Impregnate_PlayerSleep			ImpregnatePlayerSleep
; 7		ToggleImpregnatePlayerHusband		$FW_MENUTXT_Impregnate_PlayerHusband	ImpregnatePlayerHusband
; 8		ToggleImpregnatePlayerFollower		$FW_MENUTXT_Impregnate_PlayerFollower	ImpregnatePlayerFollower
; 9		ToggleImpregnateLastPlayerNPCs		$FW_MENUTXT_Impregnate_PlayerNPCs		ImpregnateLastPlayerNPCs
;10		ToggleImpregnatePlayerAmbient		$FW_MENUTXT_Impregnate_PlayerAmbient	ImpregnatePlayerAmbient
state ToggleImpregnatePlayerSleep
	Event OnSelectST()
		ImpregnatePlayerSleep = (! ImpregnatePlayerSleep)
		SetToggleOptionValueST(ImpregnatePlayerSleep)
		
		int opt = OPTION_FLAG_DISABLED
		if ImpregnatePlayerSleep
			opt = OPTION_FLAG_NONE
		endif
		SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerHusband")
		SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerFollower")
		SetOptionFlagsST(opt, false, "ToggleImpregnateLastPlayerNPCs")
		SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerAmbient")
		SetOptionFlagsST(opt, false, "SliderImpregnatePlayerChance")
	EndEvent
	
	Event OnDefaultST()
		ImpregnatePlayerSleep = ImpregnatePlayerSleepDef
		SetToggleOptionValueST(ImpregnatePlayerSleep)
		
		int opt = OPTION_FLAG_DISABLED
		if ImpregnatePlayerSleep
			opt = OPTION_FLAG_NONE
		endif
		SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerHusband")
		SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerFollower")
		SetOptionFlagsST(opt, false, "ToggleImpregnateLastPlayerNPCs")
		SetOptionFlagsST(opt, false, "ToggleImpregnatePlayerAmbient")
		SetOptionFlagsST(opt, false, "SliderImpregnatePlayerChance")
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_CHEAT_UpdateInterval")
	EndEvent
endstate

; 7		ToggleImpregnatePlayerHusband		$FW_MENU_Impregnate_PlayerHusband	ImpregnatePlayerHusband
state ToggleImpregnatePlayerHusband
	Event OnSelectST()
		ImpregnatePlayerHusband = (! ImpregnatePlayerHusband)
		SetToggleOptionValueST(ImpregnatePlayerHusband)
	EndEvent
	
	Event OnDefaultST()
		ImpregnatePlayerHusband = ImpregnatePlayerHusbandDef
		SetToggleOptionValueST(ImpregnatePlayerHusband)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_PlayerHusband")
	EndEvent
endstate

; 8		ToggleImpregnatePlayerFollower		$FW_MENU_Impregnate_PlayerFollower	ImpregnatePlayerFollower
state ToggleImpregnatePlayerFollower
	Event OnSelectST()
		ImpregnatePlayerFollower = (! ImpregnatePlayerFollower)
		SetToggleOptionValueST(ImpregnatePlayerFollower)
	EndEvent
	
	Event OnDefaultST()
		ImpregnatePlayerFollower = ImpregnatePlayerFollowerDef
		SetToggleOptionValueST(ImpregnatePlayerFollower)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_PlayerFollower")
	EndEvent
endstate

; 9		ToggleImpregnateLastPlayerNPCs		$FW_MENU_Impregnate_PlayerNPCs		ImpregnateLastPlayerNPCs
state ToggleImpregnateLastPlayerNPCs
	Event OnSelectST()
		ImpregnateLastPlayerNPCs = (! ImpregnateLastPlayerNPCs)
		SetToggleOptionValueST(ImpregnateLastPlayerNPCs)
	EndEvent
	
	Event OnDefaultST()
		ImpregnateLastPlayerNPCs = ImpregnateLastPlayerNPCsDef
		SetToggleOptionValueST(ImpregnateLastPlayerNPCs)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_PlayerNPCs")
	EndEvent
endstate

;10		ToggleImpregnatePlayerAmbient		$FW_MENU_Impregnate_PlayerAmbient	ImpregnatePlayerAmbient
state ToggleImpregnatePlayerAmbient
	Event OnSelectST()
		ImpregnatePlayerAmbient = (! ImpregnatePlayerAmbient)
		SetToggleOptionValueST(ImpregnatePlayerAmbient)
	EndEvent
	
	Event OnDefaultST()
		ImpregnatePlayerAmbient = ImpregnatePlayerAmbientDef
		SetToggleOptionValueST(ImpregnatePlayerAmbient)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_PlayerAmbient")
	EndEvent
endstate


state ToggleImpregnateLoreFriendly
	Event OnSelectST()
		ImpregnateLoreFriendly = (! ImpregnateLoreFriendly)
		SetToggleOptionValueST(ImpregnateLoreFriendly)
	EndEvent
	
	Event OnDefaultST()
		ImpregnateLoreFriendly = ImpregnateLoreFriendlyDef
		SetToggleOptionValueST(ImpregnateLoreFriendly)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$FW_MENUTXT_Impregnate_LoreFriendly")
	EndEvent
endstate




state KeyMapShowState
	event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
		;if (CheckNewHotkey(conflictControl, conflictName))
			KeyStateWidget = keyCode
			SetKeyMapOptionValueST(keyCode)
			System.UpdateHotKey()
		;endIf
	endEvent

	event OnDefaultST()
		KeyStateWidget = KeyStateWidgetDef
		SetKeyMapOptionValueST(KeyStateWidgetDef)
		System.UpdateHotKey()
	endEvent

	event OnHighlightST()
		SetInfoText("$FW_MENUTXT_SETTINGS_ShowStatesKey")
	endEvent
EndState

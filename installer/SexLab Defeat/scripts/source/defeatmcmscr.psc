Scriptname DefeatMCMscr extends SKI_ConfigBase

DefeatConfig Property RessConfig Auto
DefeatPlayer Property PlayerScr Auto
DefeatActionScr Property ActionQst Auto
DefeatQTEMeter Property StruggleBar Auto
Actor Property Player Auto

Import Game

String Property KDscenario = "$All Down" Auto Hidden					; PVIC ==========
Int oidKDscenario
Bool Property KDWayThreshold = True Auto Hidden
Int oidKDWayThreshold
Float Property ThresholdPvic = 20.0 Auto Hidden
Int oidThresholdPvic
Float Property ThresholdPvicMin = 5.0 Auto Hidden
Int oidThresholdPvicMin
Float Property ChanceOnHitPvic = 100.0 Auto Hidden
Int oidChanceOnHitPvic
Float Property SStruggleHealthPvic = 0.0 Auto Hidden
Int oidSStruggleHealthPvic
Float Property KnockOutHPvic = 0.0 Auto Hidden
Int oidKnockOutHPvic
Bool Property KDWayStamina = True Auto Hidden
Int oidKDWayStamina
Float Property ExhaustionPvic = 50.0 Auto Hidden
Int oidExhaustionPvic
Bool Property KDWayStaminaOB = True Auto Hidden
Int oidKDWayStaminaOB
Bool Property KDHealthBlock = False Auto Hidden
Int oidKDHealthBlock
Bool Property KDStaminaBlock = False Auto Hidden
Int oidKDStaminaBlock
Bool Property KDPowerABlock = False Auto Hidden
Int oidKDPowerABlock
Float Property SStruggleExhaustionPvic = 0.0 Auto Hidden
Int oidSStruggleExhaustionPvic
Float Property KnockOutSPvic = 0.0 Auto Hidden
Int oidKnockOutSPvic
Float Property ChanceOnHitPvicS = 50.0 Auto Hidden
Int oidChanceOnHitPvicS
Float Property KDWayPowerAtkCOH = 20.0 Auto Hidden
Int oidKDWayPowerAtkCOH
Float Property PowerAtkStagger = 100.0 Auto Hidden
Int oidPowerAtkStagger
Float Property SStrugglePowerPvic = 0.0 Auto Hidden
Int oidSStrugglePowerPvic
Float Property KnockOutPPvic = 0.0 Auto Hidden
Int oidKnockOutPPvic
Float Property ResistBonusPvic = 0.0 Auto Hidden
Int oidResistBonusPvic
Float Property ResistFillStamina = 15.0 Auto Hidden
Int oidResistFillStamina
Bool Property KDWayPowerAtk = True Auto Hidden
Int oidKDWayPowerAtk
Bool Property PlayerEssential = False Auto Hidden
Int oidPlayerEssential
Int Property HKSurrender = 37 Auto Hidden
Int oidHKSurrender
Bool Property MoralityPvic = False Auto Hidden
Int oidMoralityPvic
Bool Property BeastImmunity = False Auto Hidden
Int oidBeastImmunity
Bool Property EveryonePvic = False Auto Hidden
Int oidEveryonePvic
Bool Property OnlyPotSexual = True Auto Hidden
Int oidOnlyPotSexual
Bool Property NoTranAutoResist = False Auto Hidden
Int oidNoTranAutoResist
Bool Property SexualityPvic = False Auto Hidden
Int oidSexualityPvic
Bool Property MaleHunterPvic = True Auto Hidden
Int oidMaleHunterPvic
Bool Property FemaleHunterPvic = False Auto Hidden
Int oidFemaleHunterPvic
Float Property ThreesomeChance = 30.0 Auto Hidden
Int oidThreesomeChance
Float Property ThreesomeChanceCollateral = 0.0 Auto Hidden
Int oidThreesomeChanceCollateral
Float Property AgainChance = 15.0 Auto Hidden
Int oidAgainChance
Float Property DebuffDuration = 120.0 Auto Hidden
Int oidDebuffDuration
Bool Property SlowDown = True Auto Hidden
Int oidSlowDown
Bool Property DamageStamina = True Auto Hidden
Int oidDamageStamina
Bool Property CollateralAssault = True Auto Hidden
Int oidCollateralAssault
Bool Property FollowerSurrender = True Auto Hidden
Int oidFollowerSurrender
Bool Property StayDown = True Auto Hidden
Int oidStayDown
Bool Property WitnessPvic = True Auto Hidden
Int oidWitnessPvic
Bool Property CoverSelfPvic = True Auto Hidden
Int oidCoverSelfPvic
Bool Property InsatiablePvic = False Auto Hidden
Int oidInsatiablePvic
Bool Property DialoguesPvic = True Auto Hidden
Int oidDialoguesPvic
Bool Property CommentsPvic = True Auto Hidden
Int oidCommentsPvic
Bool Property MoanPvic = True Auto Hidden
Int oidMoanPvic
Bool Property DialoguesFollower = True Auto Hidden
Int oidDialoguesFollower
String Property QTEHKType = "$Strafe" Auto Hidden
Int oidQTEHKType
Bool Property bQTEmess = True Auto Hidden
Int oidbQTEmess
Bool Property bResistQTE = True Auto Hidden
Int oidbResistQTE
Float Property SatisfiedPvic = 180.0 Auto Hidden
Int oidSatisfiedPvic
Float Property DAsChance = 50.0 Auto Hidden
Int oidDAsChance
Float Property fRobbing = 20.0 Auto Hidden
Int oidfRobbing
Float Property vRobbing = 50.0 Auto Hidden
Int oidvRobbing
String Property RobbingWay = "$Value" Auto Hidden
Int oidRobbingWay
Bool Property RobTimeLimit = True Auto Hidden
Int oidRobTimeLimit
Float[] Property PAfrequency Auto Hidden
Int[] oidPAfrequency
Bool[] Property PAbEnabled Auto Hidden
Int[] oidPAbEnabled
Bool[] Property PAbSecondary Auto Hidden
Int[] oidPAbSecondary
Bool[] Property PAbOnlyEnemy Auto Hidden
Int[] oidPAbOnlyEnemy
Bool[] Property PAbOnlyRaped Auto Hidden
Int[] oidPAbOnlyRaped
String Property bEscape = "$Trauma" Auto Hidden
Int oidbEscape
Float Property PvicRaped = 100.0 Auto Hidden
Int oidPvicRaped
;Float Property ArousalSARPvic = 200.0 Auto Hidden
;Int oidArousalSARPvic
Bool Property bExhaustedPvic = True Auto Hidden
Int oidbExhaustedPvic

String Property Addperk = "$Disabled" Auto Hidden						; PAGG ==========
Int oidAddperk
String Property KDownWayPvic = "$Both" Auto Hidden
Int oidKDownWayPvic
Float Property ResistBonusPagg = 100.0 Auto Hidden
Int oidResistBonusPagg
Float Property StruggleBonusPagg = 0.0 Auto Hidden
Int oidStruggleBonusPagg
Bool Property WitnessPagg = True Auto Hidden
Int oidWitnessPagg
Bool Property VicAnimosity = True Auto Hidden
Int oidVicAnimosity
Bool Property NecroOnOff = False Auto Hidden
Int oidNecroOnOff
Float Property TraumaPAGG = 60.0 Auto Hidden
Int oidTraumaPAGG
Float Property ExhaustedPagg = 60.0 Auto Hidden
Int oidExhaustedPagg
Float Property EscapePagg = 0.0 Auto Hidden
Int oidEscapePagg
Float Property KDTimePagg = 60.0 Auto Hidden
Int oidKDTimePagg
Float Property DebuffDurationPAGG = 120.0 Auto Hidden
Int oidDebuffDurationPAGG
Float Property ChanceOfBountyPagg = 0.0 Auto Hidden
Int oidChanceOfBountyPagg
Float Property TiedTime = 10.0 Auto Hidden
Int oidTiedTime
Float Property KOTime = 5.0 Auto Hidden
Int oidKOTime
Bool Property bTieUpAnim = True Auto Hidden
Int oidbTieUpAnim
Bool Property MoralityPagg = False Auto Hidden
Int oidMoralityPagg
Bool Property SexualityPagg = True Auto Hidden
Int oidSexualityPagg
Bool Property KDResistPagg = False Auto Hidden
Int oidKDResistPagg
Bool Property MarkHighlight = True Auto Hidden
Int oidMarkHighlight
Bool Property MarkNotification = True Auto Hidden
Int oidMarkNotification
;Float Property ArousalSARPagg = 200.0 Auto Hidden
;Int oidArousalSARPagg
Int oidSOValueCheck
Bool Property SOSexuality = True Auto Hidden
Int oidSOSexuality
Bool Property SOMorality = True Auto Hidden
Int oidSOMorality
Bool Property SOWitness = True Auto Hidden
Int oidSOWitness
Bool Property SORelation = True Auto Hidden
Int oidSORelation
Bool Property SOSatisfied = True Auto Hidden
Int oidSOSatisfied
Int oidSOValuesSet
Float Property SOHandoverCD = 6.0 Auto Hidden
Int oidSOHandoverCD

Float Property ThresholdNPCvsNPC = 30.0 Auto Hidden						; NVN ==========
Int oidThresholdNPCvsNPC
Float Property ThresholdFollower = 30.0 Auto Hidden
Int oidThresholdFollower
Bool Property SexualityNVN = False Auto Hidden
Int oidSexualityNVN
Bool Property MaleOnGal = True Auto Hidden
Int oidMaleOnGal
Bool Property MaleOnMale = False Auto Hidden
Int oidMaleOnMale
Bool Property GalOnMale = False Auto Hidden
Int oidGalOnMale
Bool Property GalOnGal = False Auto Hidden
Int oidGalOnGal
Float Property ChanceOnHitNPC = 30.0 Auto Hidden
Int oidChanceOnHitNPC
Float Property COHFollower = 30.0 Auto Hidden
Int oidCOHFollower
Bool Property NoNotifications = True Auto Hidden
Int oidNoNotifications
Bool Property MoralityNVN = False Auto Hidden
Int oidMoralityNVN
Bool Property RelationNVN = False Auto Hidden
Int oidRelationNVN
Bool Property WitnessNVN = False Auto Hidden
Int oidWitnessNVN
Bool Property DialoguesNVN = True Auto Hidden
Int oidDialoguesNVN
Bool Property DialoguesNVNFollower = True Auto Hidden
Int oidDialoguesNVNFollower
Bool Property AllowNPC = True Auto Hidden
Int oidAllowNPC
Bool Property AllowCvic = True Auto Hidden
Int oidAllowCvic
Bool Property AllowCagg = False Auto Hidden
Int oidAllowCagg
Float Property GbChanceNVN = 0.0 Auto Hidden
Int oidGbChanceNVN
Bool Property NPCLastEnemy = True Auto Hidden
Int oidNPCLastEnemy
Float Property NVNTrauma = 60.0 Auto Hidden
Int oidNVNTrauma
Float Property NVNTraumaCvic = 60.0 Auto Hidden
Int oidNVNTraumaCvic
Float Property NVNExhausted = 60.0 Auto Hidden
Int oidNVNExhausted
Float Property NVNExhaustedCvic = 60.0 Auto Hidden
Int oidNVNExhaustedCvic
Float Property EscapeNPC = 60.0 Auto Hidden
Int oidEscapeNPC
Float Property EscapeCvic = 60.0 Auto Hidden
Int oidEscapeCvic
Float Property NVNRobbedPA = 0.0 Auto Hidden
Int oidNVNRobbedPA
Float Property NVNKillPA = 0.0 Auto Hidden
Int oidNVNKillPA
Float Property NVNRobbedPAFollower = 0.0 Auto Hidden
Int oidNVNRobbedPAFollower
Float Property NVNKillPAFollower = 0.0 Auto Hidden
Int oidNVNKillPAFollower
Float Property DebuffDurationNVN = 120.0 Auto Hidden
Int oidDebuffDurationNVN
Float Property DebuffDurationNVNCvic = 120.0 Auto Hidden
Int oidDebuffDurationNVNCvic
Bool Property EveryoneNVN = False Auto Hidden
Int oidEveryoneNVN
String Property NVNKDtype = "$Only on hit" Auto Hidden
Int oidNVNKDtype
Float Property NVNRaped = 100.0 Auto Hidden
Int oidNVNRaped
Float Property NVNRobbed = 0.0 Auto Hidden
Int oidNVNRobbed
Float Property NVNKill = 0.0 Auto Hidden
Int oidNVNKill
Float Property NVNRapedFollower = 100.0 Auto Hidden
Int oidNVNRapedFollower
Float Property NVNRobbedFollower = 0.0 Auto Hidden
Int oidNVNRobbedFollower
Float Property NVNKillFollower = 0.0 Auto Hidden
Int oidNVNKillFollower
Float Property SatisfiedFollower = 60.0 Auto Hidden
Int oidSatisfiedFollower
Float Property NVN3wayAutoFollower = 0.0 Auto Hidden
Int oidNVN3wayAutoFollower
Float Property SatisfiedNVN = 60.0 Auto Hidden
Int oidSatisfiedNVN
;Float Property ArousalSARFollower = 200.0 Auto Hidden
;Int oidArousalSARFollower
;Float Property ArousalSARNVN = 200.0 Auto Hidden
;Int oidArousalSARNVN
Float Property KDTimeNVN = 60.0 Auto Hidden
Int oidKDTimeNVN

String Property CrScenario = "$All Down" Auto Hidden					; CREATURES PVIC ==========
Int oidCrScenario
Bool Property HuntCrea = True Auto Hidden
Int oidHuntCrea
Bool Property HuntFCrea = False Auto Hidden
Int oidHuntFCrea
Float Property GbCrChancePvic = 50.0 Auto Hidden
Int oidGbCrChancePvic
Int oidCreaRaceEnablePvic
Int	oidCreaRaceDisablePvic

Bool Property CreaOnMale = False Auto Hidden							; CREATURES NVN ==========
Int oidCreaOnMale
Bool Property CreaOnFemale = True Auto Hidden
Int oidCreaOnFemale
Bool Property CreaFemaleOnMale = False Auto Hidden
Int oidCreaFemaleOnMale
Bool Property CreaFemaleOnFemale = False Auto Hidden
Int oidCreaFemaleOnFemale
Float Property GbCrChanceNVN = 0.0 Auto Hidden
Int oidGbCrChanceNVN
Int oidCreaRaceEnableNVN
Int	oidCreaRaceDisableNVN

String Property ModStatus = "$Disabled" Auto Hidden						; SYSTEM ==========
Int oidModStatus
String Property OnOffPvic = "$Disabled" Auto Hidden
Int oidOnOffPvic
String Property OnOffPagg = "$Disabled" Auto Hidden
Int oidOnOffPagg
String Property OnOffNVN = "$Disabled" Auto Hidden
Int oidReconfigure
Int oidOnOffNVN
Int oidModExportSetting
Int oidModImportSetting
Int oidCleanUp
Int oidHKInfo
Int oidHKInfo2
Int oidModCheck
Int oidModList
String[] Property AModList Auto Hidden
Int Property QTEColorBar = 0xFFFFFF Auto Hidden
Int oidQTEColorBar
Float Property MeterWidth = 250.0 Auto Hidden
Int oidMeterWidth
Float Property MeterHeight = 50.0 Auto Hidden
Int oidMeterHeight
Float Property AxisX = 640.0 Auto Hidden
Int oidAxisX
Float Property AxisY = 650.0 Auto Hidden
Int oidAxisY
Int oidDisplayBar

Bool Property HitInterrupt = False Auto Hidden							; Animation settings ==========
Int oidHitInterrupt
Bool Property CombatInterrupt = True Auto Hidden
Int oidCombatInterrupt
Int oidAnimSettingsPage
Int AnimationSettingsPage = 0
String Property ConsTag = "" Auto Hidden
String Property ConsSupressTag = "aggressive" Auto Hidden
Bool Property ConsRequireAllTag = True Auto Hidden
Bool Property ConsFemaleFirst = False Auto Hidden
String Property ConsFoMTag = "cowgirl" Auto Hidden
String Property ConsFoMSupressTag = "aggressive" Auto Hidden
Bool Property ConsFoMRequireAllTag = True Auto Hidden
Bool Property ConsFoMFemaleFirst = True Auto Hidden
String Property ConsFoFTag = "lesbian" Auto Hidden
String Property ConsFoFSupressTag = "aggressive" Auto Hidden
Bool Property ConsFoFRequireAllTag = True Auto Hidden
Bool Property ConsFoFFemaleFirst = False Auto Hidden
String Property ConsCreatureTag = "" Auto Hidden
String Property ConsCreatureSupressTag = "aggressive" Auto Hidden
Bool Property ConsCreatureRequireAllTag = True Auto Hidden
String Property ConsMultipleTag = "" Auto Hidden
String Property ConsMultipleSupressTag = "aggressive" Auto Hidden
Bool Property ConsMultipleRequireAllTag = True Auto Hidden
Bool Property ConsMultipleFemaleFirst = True Auto Hidden
String Property RapeTagPvic = "aggressive" Auto Hidden
String Property RapeSupressTagPvic = "sleeping,necro,cowgirl" Auto Hidden
Bool Property RapeRequireAllTagPvic = True Auto Hidden
Bool Property RapeFemaleFirstPvic = False Auto Hidden
String Property KOTagPvic = "sleeping" Auto Hidden
String Property KOSupressTagPvic = "" Auto Hidden
Bool Property KORequireAllTagPvic = True Auto Hidden
Bool Property KOFemaleFirstPvic = False Auto Hidden
String Property FoMTagPvic = "cowgirl" Auto Hidden
String Property FoMSupressTagPvic = "" Auto Hidden
Bool Property FoMRequireAllTagPvic = True Auto Hidden
Bool Property FoMFemaleFirstPvic = True Auto Hidden
String Property FoFTagPvic = "lesbian" Auto Hidden
String Property FoFSupressTagPvic = "" Auto Hidden
Bool Property FoFRequireAllTagPvic = True Auto Hidden
Bool Property FoFFemaleFirstPvic = False Auto Hidden
String Property TiedTagPvic = "aggressive,bound" Auto Hidden
String Property TiedSupressTagPvic = "subsub,pillory" Auto Hidden
Bool Property TiedRequireAllTagPvic = True Auto Hidden
Bool Property TiedFemaleFirstPvic = False Auto Hidden
String Property CreatureTagPvic = "" Auto Hidden
String Property CreatureSupressTagPvic = "" Auto Hidden
Bool Property CreatureRequireAllTagPvic = True Auto Hidden
String Property MultipleTagPvic = "aggressive" Auto Hidden
String Property MultipleSupressTagPvic = "" Auto Hidden
Bool Property MultipleRequireAllTagPvic = True Auto Hidden
Bool Property MultipleFemaleFirstPvic = True Auto Hidden
Bool Property MultipleIgnoreGTPvic = False Auto Hidden
Bool Property MultipleIgnoreGTCreaPvic = False Auto Hidden
Bool Property MultipleIgnoreGTPagg = False Auto Hidden
Bool Property MultipleIgnoreGTCreaPagg = False Auto Hidden
Bool Property MultipleIgnoreGTNVN = False Auto Hidden
Bool Property MultipleIgnoreGTCreaNVN = False Auto Hidden
String Property RapeTagPagg = "aggressive" Auto Hidden
String Property RapeSupressTagPagg = "sleeping,necro,cowgirl" Auto Hidden
Bool Property RapeRequireAllTagPagg = True Auto Hidden
Bool Property RapeFemaleFirstPagg = False Auto Hidden
String Property NecroTagPagg = "necro" Auto Hidden
String Property NecroSupressTagPagg = "cowgirl" Auto Hidden
Bool Property NecroRequireAllTagPagg = True Auto Hidden
Bool Property NecroFemaleFirstPagg = False Auto Hidden
String Property FoMTagPagg = "cowgirl" Auto Hidden
String Property FoMSupressTagPagg = "" Auto Hidden
Bool Property FoMRequireAllTagPagg = True Auto Hidden
Bool Property FoMFemaleFirstPagg = True Auto Hidden
String Property FoFTagPagg = "lesbian" Auto Hidden
String Property FoFSupressTagPagg = "" Auto Hidden
Bool Property FoFRequireAllTagPagg = True Auto Hidden
Bool Property FoFFemaleFirstPagg = False Auto Hidden
String Property TiedTagPagg = "aggressive,bound" Auto Hidden
String Property TiedSupressTagPagg = "subsub,pillory" Auto Hidden
Bool Property TiedRequireAllTagPagg = True Auto Hidden
Bool Property TiedFemaleFirstPagg = False Auto Hidden
String Property CreatureTagPagg = "" Auto Hidden
String Property CreatureSupressTagPagg = "" Auto Hidden
Bool Property CreatureRequireAllTagPagg = True Auto Hidden
String Property MultipleTagPagg = "aggressive" Auto Hidden
String Property MultipleSupressTagPagg = "" Auto Hidden
Bool Property MultipleRequireAllTagPagg = True Auto Hidden
Bool Property MultipleFemaleFirstPagg = True Auto Hidden
String Property RapeTagNVN = "aggressive" Auto Hidden
String Property RapeSupressTagNVN = "sleeping,necro,cowgirl" Auto Hidden
Bool Property RapeRequireAllTagNVN = True Auto Hidden
Bool Property RapeFemaleFirstNVN = False Auto Hidden
String Property FoMTagNVN = "cowgirl" Auto Hidden
String Property FoMSupressTagNVN = "" Auto Hidden
Bool Property FoMRequireAllTagNVN = True Auto Hidden
Bool Property FoMFemaleFirstNVN = True Auto Hidden
String Property FoFTagNVN = "lesbian" Auto Hidden
String Property FoFSupressTagNVN = "" Auto Hidden
Bool Property FoFRequireAllTagNVN = True Auto Hidden
Bool Property FoFFemaleFirstNVN = False Auto Hidden
String Property TiedTagNVN = "aggressive,bound" Auto Hidden
String Property TiedSupressTagNVN = "subsub,pillory" Auto Hidden
Bool Property TiedRequireAllTagNVN = True Auto Hidden
Bool Property TiedFemaleFirstNVN = False Auto Hidden
String Property CreatureTagNVN = "" Auto Hidden
String Property CreatureSupressTagNVN = "" Auto Hidden
Bool Property CreatureRequireAllTagNVN = True Auto Hidden
String Property MultipleTagNVN = "aggressive" Auto Hidden
String Property MultipleSupressTagNVN = "" Auto Hidden
Bool Property MultipleRequireAllTagNVN = True Auto Hidden
Bool Property MultipleFemaleFirstNVN = True Auto Hidden
Int Property HKOption = 11 Auto Hidden									; HOTKEY ==========
Int oidHKOption
Int Property HKModifier = 42 Auto Hidden
Int oidHKModifier
Int Property HKAction = 34 Auto Hidden
Int oidHKAction
Bool Property bRedressPvic = True Auto Hidden							; STRIPPING ==========
Int oidbRedressPvic
String[] Property SSPvicSet Auto Hidden	
Int[] oidSSPvicSet
Float[] Property SSPvic Auto Hidden
Int[] oidSSPvic
Bool Property bRedressPagg = True Auto Hidden
Int oidbRedressPagg
String[] Property SSPaggSet Auto Hidden
Int[] oidSSPaggSet
Float[] Property SSPagg Auto Hidden
Int[] oidSSPagg
Bool Property bRedressNVN = True Auto Hidden
Int oidbRedressNVN
Bool Property bRedressFollower = True Auto Hidden
Int oidbRedressFollower
String[] Property SSNVNSet Auto Hidden
Int[] oidSSNVNSet
Float[] Property SSNVN Auto Hidden
Int[] oidSSNVN
Int oidCheckSlots

Int DAFlag
Int KDwayThresholdFlag
Int KDwayStaminaFlag
Int KDwayPowerAtkFlag
Int ResistFlag
Int ArousalSARFlag
Int AllowNPCFlag
Int AllowCvicFlag

String[] Property SlotNames Auto

;Event OnInit()
;	parent.OnInit()
;EndEvent

Event OnConfigInit()
	DefeatConfig.Log("MCM OnConfigInit")
	Pages = New String[6]
	Pages[0] = "$General settings"
	Pages[1] = "$Animation settings"
	Pages[2] = "$Player/Follower aggressor"
	Pages[3] = "$Player as victim"
	Pages[4] = "$Player Post-Assault"
	Pages[5] = "$NPC vs NPC"
	If (CurrentVersion == 0) ; First install
		Install()
		Debug.Notification("$Defeat: MCM menu initiated.")
	Endif
EndEvent
Function Install()
;	QTEPrimaryS = New String[6]
;	QTEPrimaryS[0] = "$One-Handed"
;	QTEPrimaryS[1] = "$Two-Handed"
;	QTEPrimaryS[2] = "$Archery"
;	QTEPrimaryS[3] = "$Alchemy"
;	QTEPrimaryS[4] = "$Destruction"
;	QTEPrimaryS[5] = "$Alteration"
;	QTESecondaryS = New String[6]
;	QTESecondaryS[0] = "$Two-Handed"
;	QTESecondaryS[1] = "$One-Handed"
;	QTESecondaryS[2] = "$Archery"
;	QTESecondaryS[3] = "$Alchemy"
;	QTESecondaryS[4] = "$Destruction"
;	QTESecondaryS[5] = "$Alteration"

	oidPAbEnabled = New Int[10]
	PAbEnabled = New Bool[10]
	PAbEnabled[0] = True ; Guard Jailed

	oidPAfrequency = New Int[10]
	PAfrequency = New Float[10]
	PAfrequency[0] = 20.0 ; Left for dead
	PAfrequency[1] = 0.0 ; Defeated
	PAfrequency[2] = 0.0 ; Simple slavery

	oidPAbSecondary = New Int[10]
	PAbSecondary = New Bool[10]
	PAbSecondary[0] = True ; Follower kidnapping

	oidPAbOnlyEnemy = New Int[10]
	PAbOnlyEnemy = New Bool[10]
	PAbOnlyEnemy[0] = False ; Left For Dead
	PAbOnlyEnemy[1] = False ; Defeated
	PAbOnlyEnemy[2] = True ; Simple slavery

	oidPAbOnlyRaped = New Int[10]
	PAbOnlyRaped = New Bool[10]
	PAbOnlyRaped[0] = False ; Left For Dead
	PAbOnlyRaped[1] = False ; Defeated
	PAbOnlyRaped[2] = False ; Simple slavery

	oidSSPvicSet = New Int[6]
	SSPvicSet = New String[6]
	SSPvicSet[0] = "$Strip"
	SSPvicSet[1] = "$Unequip"
	SSPvicSet[2] = "$Disabled"
	SSPvicSet[3] = "$Disabled"
	SSPvicSet[4] = "$Disabled"
	SSPvicSet[5] = "$Disabled"
	oidSSPvic = New Int[5]
	SSPvic = New Float[5]
	SSPvic[0] = 32.0
	SSPvic[1] = 33.0
	SSPvic[2] = 37.0
	SSPvic[3] = 37.0
	SSPvic[4] = 37.0

	oidSSPaggSet = New Int[6]
	SSPaggSet = New String[6]
	SSPaggSet[0] = "$Strip"
	SSPaggSet[1] = "$Unequip"
	SSPaggSet[2] = "$Disabled"
	SSPaggSet[3] = "$Disabled"
	SSPaggSet[4] = "$Disabled"
	SSPaggSet[5] = "$Disabled"
	oidSSPagg = New Int[5]
	SSPagg = New Float[5]
	SSPagg[0] = 32.0
	SSPagg[1] = 33.0
	SSPagg[2] = 37.0
	SSPagg[3] = 37.0
	SSPagg[4] = 37.0

	oidSSNVNSet = New Int[6]
	SSNVNSet = New String[6]
	SSNVNSet[0] = "$Strip"
	SSNVNSet[1] = "$Unequip"
	SSNVNSet[2] = "$Disabled"
	SSNVNSet[3] = "$Disabled"
	SSNVNSet[4] = "$Disabled"
	SSNVNSet[5] = "$Disabled"
	oidSSNVN = New Int[5]
	SSNVN = New Float[5]
	SSNVN[0] = 32.0
	SSNVN[1] = 33.0
	SSNVN[2] = 37.0
	SSNVN[3] = 37.0
	SSNVN[4] = 37.0

	AModList = New String[8]
	AModList[0] = "Dawnguard : OFF"
	AModList[1] = "Dragonborn : OFF"
	AModList[2] = "ZaZ Animation Pack : OFF"
	AModList[3] = "Devious Devices : OFF"
	AModList[4] = "Death Alternative : OFF"
	AModList[5] = "UIExtensions : OFF"
	AModList[6] = "Paradise Halls : OFF"
	AModList[7] = "Simple Slavery : OFF"
;	AModList[8] = "SexLab Aroused Redux : OFF"

	RessConfig.SOSetDefaultSOXValues()

	DAFlag = OPTION_FLAG_DISABLED
	ResistFlag = OPTION_FLAG_NONE
	ArousalSARFlag = OPTION_FLAG_DISABLED
	AllowNPCFlag = OPTION_FLAG_NONE
	AllowCvicFlag = OPTION_FLAG_NONE
EndFunction
Function ExportSettings()
	String File = "../Defeat/DefeatConfig.json"
	JsonUtil.SetStringValue(File, "KDscenario", KDscenario) 									; PVIC ==========
	JsonUtil.SetIntValue(File, "PlayerEssential", PlayerEssential As Int) As Bool
	JsonUtil.SetIntValue(File, "KDWayThreshold", KDWayThreshold As Int) As Bool
	JsonUtil.SetFloatValue(File, "ThresholdPvic", ThresholdPvic)
	JsonUtil.SetFloatValue(File, "ThresholdPvicMin", ThresholdPvicMin)
	JsonUtil.SetFloatValue(File, "ChanceOnHitPvic", ChanceOnHitPvic)
	JsonUtil.SetFloatValue(File, "SStruggleHealthPvic", SStruggleHealthPvic)
	JsonUtil.SetFloatValue(File, "KnockOutHPvic", KnockOutHPvic)
	JsonUtil.SetIntValue(File, "KDWayStamina", KDWayStamina As Int) As Bool
	JsonUtil.SetFloatValue(File, "ExhaustionPvic", ExhaustionPvic)
	JsonUtil.SetIntValue(File, "KDWayStaminaOB", KDWayStaminaOB As Int) As Bool
	JsonUtil.SetIntValue(File, "KDHealthBlock", KDHealthBlock As Int) As Bool
	JsonUtil.SetIntValue(File, "KDStaminaBlock", KDStaminaBlock As Int) As Bool
	JsonUtil.SetIntValue(File, "KDPowerABlock", KDPowerABlock As Int) As Bool
	JsonUtil.SetFloatValue(File, "ChanceOnHitPvicS", ChanceOnHitPvicS)
	JsonUtil.SetFloatValue(File, "SStruggleExhaustionPvic", SStruggleExhaustionPvic)
	JsonUtil.SetFloatValue(File, "KnockOutSPvic", KnockOutSPvic)
	JsonUtil.SetFloatValue(File, "KDWayPowerAtkCOH", KDWayPowerAtkCOH)
	JsonUtil.SetFloatValue(File, "PowerAtkStagger", PowerAtkStagger)
	JsonUtil.SetIntValue(File, "KDWayPowerAtk", KDWayPowerAtk As Int) As Bool
	JsonUtil.SetFloatValue(File, "SStrugglePowerPvic", SStrugglePowerPvic)
	JsonUtil.SetFloatValue(File, "KnockOutPPvic", KnockOutPPvic)
	JsonUtil.SetIntValue(File, "HKSurrender", HKSurrender)
	JsonUtil.SetIntValue(File, "MoralityPvic", MoralityPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "BeastImmunity", BeastImmunity As Int) As Bool
	JsonUtil.SetIntValue(File, "EveryonePvic", EveryonePvic As Int) As Bool
	JsonUtil.SetIntValue(File, "OnlyPotSexual", OnlyPotSexual As Int) As Bool
	JsonUtil.SetIntValue(File, "NoTranAutoResist", NoTranAutoResist As Int) As Bool
	JsonUtil.SetIntValue(File, "SexualityPvic", SexualityPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "MaleHunterPvic", MaleHunterPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "FemaleHunterPvic", FemaleHunterPvic As Int) As Bool
	JsonUtil.SetFloatValue(File, "ThreesomeChance", ThreesomeChance)
	JsonUtil.SetFloatValue(File, "ThreesomeChanceCollateral", ThreesomeChanceCollateral)
	JsonUtil.SetFloatValue(File, "AgainChance", AgainChance)
	JsonUtil.SetFloatValue(File, "DebuffDuration", DebuffDuration)
	JsonUtil.SetIntValue(File, "SlowDown", SlowDown As Int) As Bool
	JsonUtil.SetIntValue(File, "DamageStamina", DamageStamina As Int) As Bool
	JsonUtil.SetIntValue(File, "CollateralAssault", CollateralAssault As Int) As Bool
	JsonUtil.SetIntValue(File, "FollowerSurrender", FollowerSurrender As Int) As Bool
	JsonUtil.SetIntValue(File, "StayDown", StayDown As Int) As Bool
	JsonUtil.SetIntValue(File, "WitnessPvic", WitnessPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "CoverSelfPvic", CoverSelfPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "InsatiablePvic", InsatiablePvic As Int) As Bool
	JsonUtil.SetIntValue(File, "DialoguesPvic", DialoguesPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "CommentsPvic", CommentsPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "MoanPvic", MoanPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "DialoguesFollower", DialoguesFollower As Int) As Bool
	JsonUtil.SetStringValue(File, "QTEHKType", QTEHKType)
	JsonUtil.SetFloatValue(File, "ResistBonusPvic", ResistBonusPvic)
	JsonUtil.SetFloatValue(File, "ResistFillStamina", ResistFillStamina)
	JsonUtil.SetIntValue(File, "bQTEmess", bQTEmess As Int) As Bool
	JsonUtil.SetIntValue(File, "bResistQTE", bResistQTE As Int) As Bool
;	JsonUtil.SetStringValue(File, "QTEPrimarySO", QTEPrimarySO)
;	JsonUtil.SetStringValue(File, "QTESecondarySO", QTESecondarySO)
	JsonUtil.SetFloatValue(File, "SatisfiedPvic", SatisfiedPvic)
	JsonUtil.SetFloatValue(File, "DAsChance", DAsChance)
	JsonUtil.SetFloatValue(File, "fRobbing", fRobbing)
	JsonUtil.SetFloatValue(File, "vRobbing", vRobbing)
	JsonUtil.SetStringValue(File, "RobbingWay", RobbingWay)
	JsonUtil.SetIntValue(File, "RobTimeLimit", RobTimeLimit As Int) As Bool
	ExportFloatArray(File, "PAfrequency", PAfrequency)
	ExportBoolArray(File, "PAbEnabled", PAbEnabled)
	ExportBoolArray(File, "PAbSecondary", PAbSecondary)
	ExportBoolArray(File, "PAbOnlyEnemy", PAbOnlyEnemy)
	ExportBoolArray(File, "PAbOnlyRaped", PAbOnlyRaped)
	JsonUtil.SetStringValue(File, "bEscape", bEscape)
	JsonUtil.SetFloatValue(File, "PvicRaped", PvicRaped)
;	JsonUtil.SetFloatValue(File, "ArousalSARPvic", ArousalSARPvic)
	JsonUtil.SetIntValue(File, "bExhaustedPvic", bExhaustedPvic As Int) As Bool
	JsonUtil.SetStringValue(File, "Addperk", Addperk)											; PAGG ==========
	JsonUtil.SetStringValue(File, "KDownWayPvic", KDownWayPvic)
	JsonUtil.SetFloatValue(File, "ResistBonusPagg", ResistBonusPagg)
	JsonUtil.SetFloatValue(File, "StruggleBonusPagg", StruggleBonusPagg)
	JsonUtil.SetIntValue(File, "WitnessPagg", WitnessPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "VicAnimosity", VicAnimosity As Int) As Bool
	JsonUtil.SetIntValue(File, "NecroOnOff", NecroOnOff As Int) As Bool
	JsonUtil.SetFloatValue(File, "TraumaPAGG", TraumaPAGG)
	JsonUtil.SetFloatValue(File, "ExhaustedPagg", ExhaustedPagg)
	JsonUtil.SetFloatValue(File, "EscapePagg", EscapePagg)
	JsonUtil.SetFloatValue(File, "KDTimePagg", KDTimePagg)
	JsonUtil.SetFloatValue(File, "DebuffDurationPAGG", DebuffDurationPAGG)
	JsonUtil.SetFloatValue(File, "ChanceOfBountyPagg", ChanceOfBountyPagg)
	JsonUtil.SetFloatValue(File, "TiedTime", TiedTime)
	JsonUtil.SetFloatValue(File, "KOTime", KOTime)
	JsonUtil.SetIntValue(File, "bTieUpAnim", bTieUpAnim As Int) As Bool
	JsonUtil.SetIntValue(File, "MoralityPagg", MoralityPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "SexualityPagg", SexualityPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "KDResistPagg", KDResistPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "MarkHighlight", MarkHighlight As Int) As Bool
	JsonUtil.SetIntValue(File, "MarkNotification", MarkNotification As Int) As Bool
;	JsonUtil.SetFloatValue(File, "ArousalSARPagg", ArousalSARPagg)
	JsonUtil.SetIntValue(File, "SOSexuality", SOSexuality As Int) As Bool
	JsonUtil.SetIntValue(File, "SOMorality", SOMorality As Int) As Bool
	JsonUtil.SetIntValue(File, "SOWitness", SOWitness As Int) As Bool
	JsonUtil.SetIntValue(File, "SORelation", SORelation As Int) As Bool
	JsonUtil.SetIntValue(File, "SOSatisfied", SOSatisfied As Int) As Bool
	ExportIntArray(File, "SOXValues", RessConfig.SOGetSOXValues())
	JsonUtil.SetFloatValue(File, "SOHandoverCD", SOHandoverCD)
	JsonUtil.SetFloatValue(File, "ThresholdNPCvsNPC", ThresholdNPCvsNPC)						; NVN ==========
	JsonUtil.SetFloatValue(File, "ThresholdFollower", ThresholdFollower)
	JsonUtil.SetIntValue(File, "SexualityNVN", SexualityNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "MaleOnGal", MaleOnGal As Int) As Bool
	JsonUtil.SetIntValue(File, "MaleOnMale", MaleOnMale As Int) As Bool
	JsonUtil.SetIntValue(File, "GalOnMale", GalOnMale As Int) As Bool
	JsonUtil.SetIntValue(File, "GalOnGal", GalOnGal As Int) As Bool
	JsonUtil.SetFloatValue(File, "ChanceOnHitNPC", ChanceOnHitNPC)
	JsonUtil.SetFloatValue(File, "COHFollower", COHFollower)
	JsonUtil.SetIntValue(File, "NoNotifications", NoNotifications As Int) As Bool
	JsonUtil.SetIntValue(File, "MoralityNVN", MoralityNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "WitnessNVN", WitnessNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "DialoguesNVN", DialoguesNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "DialoguesNVNFollower", DialoguesNVNFollower As Int) As Bool
	JsonUtil.SetIntValue(File, "AllowNPC", AllowNPC As Int) As Bool
	JsonUtil.SetIntValue(File, "AllowCvic", AllowCvic As Int) As Bool
	JsonUtil.SetIntValue(File, "AllowCagg", AllowCagg As Int) As Bool
	JsonUtil.SetFloatValue(File, "GbChanceNVN", GbChanceNVN)
	JsonUtil.SetIntValue(File, "NPCLastEnemy", NPCLastEnemy As Int) As Bool
	JsonUtil.SetFloatValue(File, "NVNTrauma", NVNTrauma)
	JsonUtil.SetFloatValue(File, "NVNTraumaCvic", NVNTraumaCvic)
	JsonUtil.SetFloatValue(File, "NVNExhausted", NVNExhausted)
	JsonUtil.SetFloatValue(File, "NVNExhaustedCvic", NVNExhaustedCvic)
	JsonUtil.SetFloatValue(File, "EscapeNPC", EscapeNPC)
	JsonUtil.SetFloatValue(File, "EscapeCvic", EscapeCvic)
	JsonUtil.SetFloatValue(File, "NVNRobbedPA", NVNRobbedPA)
	JsonUtil.SetFloatValue(File, "NVNKillPA", NVNKillPA)
	JsonUtil.SetFloatValue(File, "NVNRobbedPAFollower", NVNRobbedPAFollower)
	JsonUtil.SetFloatValue(File, "NVNKillPAFollower", NVNKillPAFollower)
 	JsonUtil.SetFloatValue(File, "DebuffDurationNVN", DebuffDurationNVN)
	JsonUtil.SetFloatValue(File, "DebuffDurationNVNCvic", DebuffDurationNVNCvic)
	JsonUtil.SetIntValue(File, "EveryoneNVN", EveryoneNVN As Int) As Bool
	JsonUtil.SetStringValue(File, "NVNKDtype", NVNKDtype)
	JsonUtil.SetFloatValue(File, "NVNRaped", NVNRaped)
	JsonUtil.SetFloatValue(File, "NVNRobbed", NVNRobbed)
	JsonUtil.SetFloatValue(File, "NVNKill", NVNKill)
	JsonUtil.SetFloatValue(File, "NVNRapedFollower", NVNRapedFollower)
	JsonUtil.SetFloatValue(File, "NVNRobbedFollower", NVNRobbedFollower)
	JsonUtil.SetFloatValue(File, "NVNKillFollower", NVNKillFollower)
	JsonUtil.SetFloatValue(File, "SatisfiedFollower", SatisfiedFollower)
	JsonUtil.SetFloatValue(File, "NVN3wayAutoFollower", NVN3wayAutoFollower)
	JsonUtil.SetFloatValue(File, "SatisfiedNVN", SatisfiedNVN)
;	JsonUtil.SetFloatValue(File, "ArousalSARFollower", ArousalSARFollower)
;	JsonUtil.SetFloatValue(File, "ArousalSARNVN", ArousalSARNVN)
	JsonUtil.SetFloatValue(File, "KDTimeNVN", KDTimeNVN)
	JsonUtil.SetStringValue(File, "CrScenario", CrScenario)										; CREATURES PVIC ==========
	JsonUtil.SetIntValue(File, "HuntCrea", HuntCrea As Int) As Bool
	JsonUtil.SetIntValue(File, "HuntFCrea", HuntFCrea As Int) As Bool
	JsonUtil.SetFloatValue(File, "GbCrChancePvic", GbCrChancePvic)
	JsonUtil.SetIntValue(File, "CreaOnMale", CreaOnMale As Int) As Bool							; CREATURES NVN ==========
	JsonUtil.SetIntValue(File, "CreaOnFemale", CreaOnFemale As Int) As Bool
	JsonUtil.SetIntValue(File, "CreaFemaleOnMale", CreaFemaleOnMale As Int) As Bool
	JsonUtil.SetIntValue(File, "CreaFemaleOnFemale", CreaFemaleOnFemale As Int) As Bool
	JsonUtil.SetFloatValue(File, "GbCrChanceNVN", GbCrChanceNVN)
	JsonUtil.SetStringValue(File, "ModStatus", ModStatus)										; SYSTEM ==========
	JsonUtil.SetStringValue(File, "OnOffPvic", OnOffPvic)
	JsonUtil.SetStringValue(File, "OnOffPagg", OnOffPagg)
	JsonUtil.SetStringValue(File, "OnOffNVN", OnOffNVN)
	JsonUtil.SetIntValue(File, "HitInterrupt", HitInterrupt As Int) As Bool
	JsonUtil.SetIntValue(File, "CombatInterrupt", CombatInterrupt As Int) As Bool
	JsonUtil.SetStringValue(File, "ConsTagPvic", ConsTag)
	JsonUtil.SetStringValue(File, "ConsSupressTag", ConsSupressTag)	
	JsonUtil.SetIntValue(File, "ConsRequireAllTag", ConsRequireAllTag As Int) As Bool
	JsonUtil.SetIntValue(File, "ConsFemaleFirst", ConsFemaleFirst As Int) As Bool
	JsonUtil.SetStringValue(File, "ConsFoMTag", ConsFoMTag)
	JsonUtil.SetStringValue(File, "ConsFoMSupressTag", ConsFoMSupressTag)	
	JsonUtil.SetIntValue(File, "ConsFoMRequireAllTag", ConsFoMRequireAllTag As Int) As Bool
	JsonUtil.SetIntValue(File, "ConsFoMFemaleFirst", ConsFoMFemaleFirst As Int) As Bool
	JsonUtil.SetStringValue(File, "ConsFoFTag", ConsFoFTag)
	JsonUtil.SetStringValue(File, "ConsFoFSupressTag", ConsFoFSupressTag)	
	JsonUtil.SetIntValue(File, "ConsFoFRequireAllTag", ConsFoFRequireAllTag As Int) As Bool
	JsonUtil.SetIntValue(File, "ConsFoFFemaleFirst", ConsFoFFemaleFirst As Int) As Bool
	JsonUtil.SetStringValue(File, "ConsCreatureTag", ConsCreatureTag)
	JsonUtil.SetStringValue(File, "ConsCreatureSupressTag", ConsCreatureSupressTag)	
	JsonUtil.SetIntValue(File, "ConsCreatureRequireAllTag", ConsCreatureRequireAllTag As Int) As Bool
	JsonUtil.SetStringValue(File, "ConsMultipleTag", ConsMultipleTag)
	JsonUtil.SetStringValue(File, "ConsMultipleSupressTag", ConsMultipleSupressTag)	
	JsonUtil.SetIntValue(File, "ConsMultipleRequireAllTag", ConsMultipleRequireAllTag As Int) As Bool
	JsonUtil.SetIntValue(File, "ConsMultipleFemaleFirst", ConsMultipleFemaleFirst As Int) As Bool
	JsonUtil.SetStringValue(File, "RapeTagPvic", RapeTagPvic)
	JsonUtil.SetStringValue(File, "RapeSupressTagPvic", RapeSupressTagPvic)	
	JsonUtil.SetIntValue(File, "RapeRequireAllTagPvic", RapeRequireAllTagPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "RapeFemaleFirstPvic", RapeFemaleFirstPvic As Int) As Bool
	JsonUtil.SetStringValue(File, "KOTagPvic", KOTagPvic)
	JsonUtil.SetStringValue(File, "KOSupressTagPvic", KOSupressTagPvic)	
	JsonUtil.SetIntValue(File, "KORequireAllTagPvic", KORequireAllTagPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "KOFemaleFirstPvic", KOFemaleFirstPvic As Int) As Bool
	JsonUtil.SetStringValue(File, "FoMTagPvic", FoMTagPvic)
	JsonUtil.SetStringValue(File, "FoMSupressTagPvic", FoMSupressTagPvic)	
	JsonUtil.SetIntValue(File, "FoMRequireAllTagPvic", FoMRequireAllTagPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "FoMFemaleFirstPvic", FoMFemaleFirstPvic As Int) As Bool
	JsonUtil.SetStringValue(File, "FoFTagPvic", FoFTagPvic)
	JsonUtil.SetStringValue(File, "FoFSupressTagPvic", FoFSupressTagPvic)	
	JsonUtil.SetIntValue(File, "FoFRequireAllTagPvic", FoFRequireAllTagPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "FoFFemaleFirstPvic", FoFFemaleFirstPvic As Int) As Bool
	JsonUtil.SetStringValue(File, "TiedTagPvic", TiedTagPvic)
	JsonUtil.SetStringValue(File, "TiedSupressTagPvic", TiedSupressTagPvic)	
	JsonUtil.SetIntValue(File, "TiedRequireAllTagPvic", TiedRequireAllTagPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "TiedFemaleFirstPvic", TiedFemaleFirstPvic As Int) As Bool
	JsonUtil.SetStringValue(File, "CreatureTagPvic", CreatureTagPvic)
	JsonUtil.SetStringValue(File, "CreatureSupressTagPvic", CreatureSupressTagPvic)	
	JsonUtil.SetIntValue(File, "CreatureRequireAllTagPvic", CreatureRequireAllTagPvic As Int) As Bool
	JsonUtil.SetStringValue(File, "MultipleTagPvic", MultipleTagPvic)
	JsonUtil.SetStringValue(File, "MultipleSupressTagPvic", MultipleSupressTagPvic)	
	JsonUtil.SetIntValue(File, "MultipleRequireAllTagPvic", MultipleRequireAllTagPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleFemaleFirstPvic", MultipleFemaleFirstPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleIgnoreGTPvic", MultipleIgnoreGTPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleIgnoreGTCreaPvic", MultipleIgnoreGTCreaPvic As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleIgnoreGTPagg", MultipleIgnoreGTPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleIgnoreGTCreaPagg", MultipleIgnoreGTCreaPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleIgnoreGTNVN", MultipleIgnoreGTNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleIgnoreGTCreaNVN", MultipleIgnoreGTCreaNVN As Int) As Bool
	JsonUtil.SetStringValue(File, "RapeTagPagg", RapeTagPagg)
	JsonUtil.SetStringValue(File, "RapeSupressTagPagg", RapeSupressTagPagg)	
	JsonUtil.SetIntValue(File, "RapeRequireAllTagPagg", RapeRequireAllTagPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "RapeFemaleFirstPagg", RapeFemaleFirstPagg As Int) As Bool
	JsonUtil.SetStringValue(File, "NecroTagPagg", NecroTagPagg)
	JsonUtil.SetStringValue(File, "NecroSupressTagPagg", NecroSupressTagPagg)	
	JsonUtil.SetIntValue(File, "NecroRequireAllTagPagg", NecroRequireAllTagPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "NecroFemaleFirstPagg", NecroFemaleFirstPagg As Int) As Bool
	JsonUtil.SetStringValue(File, "FoMTagPagg", FoMTagPagg)
	JsonUtil.SetStringValue(File, "FoMSupressTagPagg", FoMSupressTagPagg)	
	JsonUtil.SetIntValue(File, "FoMRequireAllTagPagg", FoMRequireAllTagPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "FoMFemaleFirstPagg", FoMFemaleFirstPagg As Int) As Bool
	JsonUtil.SetStringValue(File, "FoFTagPagg", FoFTagPagg)
	JsonUtil.SetStringValue(File, "FoFSupressTagPagg", FoFSupressTagPagg)	
	JsonUtil.SetIntValue(File, "FoFRequireAllTagPagg", FoFRequireAllTagPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "FoFFemaleFirstPagg", FoFFemaleFirstPagg As Int) As Bool
	JsonUtil.SetStringValue(File, "TiedTagPagg", TiedTagPagg)
	JsonUtil.SetStringValue(File, "TiedSupressTagPagg", TiedSupressTagPagg)	
	JsonUtil.SetIntValue(File, "TiedRequireAllTagPagg", TiedRequireAllTagPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "TiedFemaleFirstPagg", TiedFemaleFirstPagg As Int) As Bool
	JsonUtil.SetStringValue(File, "CreatureTagPagg", CreatureTagPagg)
	JsonUtil.SetStringValue(File, "CreatureSupressTagPagg", CreatureSupressTagPagg)	
	JsonUtil.SetIntValue(File, "CreatureRequireAllTagPagg", CreatureRequireAllTagPagg As Int) As Bool
	JsonUtil.SetStringValue(File, "MultipleTagPagg", MultipleTagPagg)
	JsonUtil.SetStringValue(File, "MultipleSupressTagPagg", MultipleSupressTagPagg)	
	JsonUtil.SetIntValue(File, "MultipleRequireAllTagPagg", MultipleRequireAllTagPagg As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleFemaleFirstPagg", MultipleFemaleFirstPagg As Int) As Bool
	JsonUtil.SetStringValue(File, "RapeTagNVN", RapeTagNVN)
	JsonUtil.SetStringValue(File, "RapeSupressTagNVN", RapeSupressTagNVN)	
	JsonUtil.SetIntValue(File, "RapeRequireAllTagNVN", RapeRequireAllTagNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "RapeFemaleFirstNVN", RapeFemaleFirstNVN As Int) As Bool
	JsonUtil.SetStringValue(File, "FoMTagNVN", FoMTagNVN)
	JsonUtil.SetStringValue(File, "FoMSupressTagNVN", FoMSupressTagNVN)	
	JsonUtil.SetIntValue(File, "FoMRequireAllTagNVN", FoMRequireAllTagNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "FoMFemaleFirstNVN", FoMFemaleFirstNVN As Int) As Bool
	JsonUtil.SetStringValue(File, "FoFTagNVN", FoFTagNVN)
	JsonUtil.SetStringValue(File, "FoFSupressTagNVN", FoFSupressTagNVN)	
	JsonUtil.SetIntValue(File, "FoFRequireAllTagNVN", FoFRequireAllTagNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "FoFFemaleFirstNVN", FoFFemaleFirstNVN As Int) As Bool
	JsonUtil.SetStringValue(File, "TiedTagNVN", TiedTagNVN)
	JsonUtil.SetStringValue(File, "TiedSupressTagNVN", TiedSupressTagNVN)	
	JsonUtil.SetIntValue(File, "TiedRequireAllTagNVN", TiedRequireAllTagNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "TiedFemaleFirstNVN", TiedFemaleFirstNVN As Int) As Bool
	JsonUtil.SetStringValue(File, "CreatureTagNVN", CreatureTagNVN)
	JsonUtil.SetStringValue(File, "CreatureSupressTagNVN", CreatureSupressTagNVN)	
	JsonUtil.SetIntValue(File, "CreatureRequireAllTagNVN", CreatureRequireAllTagNVN As Int) As Bool
	JsonUtil.SetStringValue(File, "MultipleTagNVN", MultipleTagNVN)
	JsonUtil.SetStringValue(File, "MultipleSupressTagNVN", MultipleSupressTagNVN)	
	JsonUtil.SetIntValue(File, "MultipleRequireAllTagNVN", MultipleRequireAllTagNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "MultipleFemaleFirstNVN", MultipleFemaleFirstNVN As Int) As Bool
	QTEColorBar = 0xFFFFFF
	JsonUtil.SetFloatValue(File, "MeterWidth", MeterWidth)
	JsonUtil.SetFloatValue(File, "MeterHeight", MeterHeight)
	JsonUtil.SetFloatValue(File, "AxisX", AxisX)
	JsonUtil.SetFloatValue(File, "AxisY", AxisY)
	JsonUtil.SetIntValue(File, "HKOption", HKOption)											; HOTKEY ==========
	JsonUtil.SetIntValue(File, "HKModifier", HKModifier)
	JsonUtil.SetIntValue(File, "HKAction", HKAction)
	JsonUtil.SetIntValue(File, "bRedressPvic", bRedressPvic As Int) As Bool						; STRIPPING ==========
	ExportFloatArray(File, "SSPvic", SSPvic)
	ExportStringArray(File, "SSPvicSet", SSPvicSet)
	JsonUtil.SetIntValue(File, "bRedressPagg", bRedressPagg As Int) As Bool
	ExportFloatArray(File, "SSPagg", SSPagg)
	ExportStringArray(File, "SSPaggSet", SSPaggSet)	
	JsonUtil.SetIntValue(File, "bRedressNVN", bRedressNVN As Int) As Bool
	JsonUtil.SetIntValue(File, "bRedressFollower", bRedressFollower As Int) As Bool
	ExportFloatArray(File, "SSNVN", SSNVN)
	ExportStringArray(File, "SSNVNSet", SSNVNSet)	
	JsonUtil.Save(File, False)
EndFunction
Function ExportFloatArray(String File, String Type, Float[] TheArray)
	Int i
	While (i < TheArray.Length)
		JsonUtil.SetFloatValue(File, Type+i, TheArray[i])
		i += 1
	EndWhile
EndFunction
Float[] Function ImportFloatArray(String File, String Type, Float[] TheArray)
	Int i
	While (i < TheArray.Length)
		TheArray[i] = JsonUtil.GetFloatValue(File, Type+i, TheArray[i])
		i += 1
	EndWhile
	Return TheArray
EndFunction
Function ExportIntArray(String File, String Type, Int[] TheArray)
	Int i
	While (i < TheArray.Length)
		JsonUtil.SetIntValue(File, Type+i, TheArray[i])
		i += 1
	EndWhile
EndFunction
Int[] Function ImportIntArray(String File, String Type, Int[] TheArray)
	Int i
	While (i < TheArray.Length)
		TheArray[i] = JsonUtil.GetIntValue(File, Type+i, TheArray[i])
		i += 1
	EndWhile
	Return TheArray
EndFunction
Function ExportBoolArray(String File, String Type, Bool[] TheArray)
	Int i
	While (i < TheArray.Length)
		JsonUtil.SetIntValue(File, Type+i, TheArray[i] As Int) As Bool
		i += 1
	EndWhile
EndFunction
Bool[] Function ImportBoolArray(String File, String Type, Bool[] TheArray)
	Int i
	While (i < TheArray.Length)
		TheArray[i] = JsonUtil.GetIntValue(File, Type+i, TheArray[i] As Int) As Bool
		i += 1
	EndWhile
	Return TheArray
EndFunction
Function ExportStringArray(String File, String Type, String[] TheArray)
	Int i
	While (i < TheArray.Length)
		JsonUtil.SetStringValue(File, Type+i, TheArray[i])
		i += 1
	EndWhile
EndFunction
String[] Function ImportStringArray(String File, String Type, String[] TheArray)
	Int i
	While (i < TheArray.Length)
		TheArray[i] = JsonUtil.GetStringValue(File, Type+i, TheArray[i])
		i += 1
	EndWhile
	Return TheArray
EndFunction
Function ImportSettings()
	String File = "../Defeat/DefeatConfig.json"
	KDscenario  			= JsonUtil.GetStringValue(File, "KDscenario", KDscenario) 									; PVIC ==========
	PlayerEssential 		= JsonUtil.GetIntValue(File, "PlayerEssential", PlayerEssential As Int) As Bool
	If PlayerEssential
		RessConfig.PlayerEssential.ForceRefIfEmpty(Player)
	Else
		RessConfig.PlayerEssential.Clear()
	Endif
	KDWayThreshold 			= JsonUtil.GetIntValue(File, "KDWayThreshold", KDWayThreshold As Int) As Bool	
	ThresholdPvic 			= JsonUtil.GetFloatValue(File, "ThresholdPvic", ThresholdPvic)
	ThresholdPvicMin 		= JsonUtil.GetFloatValue(File, "ThresholdPvicMin", ThresholdPvicMin)
	ChanceOnHitPvic 		= JsonUtil.GetFloatValue(File, "ChanceOnHitPvic", ChanceOnHitPvic)
	SStruggleHealthPvic 	= JsonUtil.GetFloatValue(File, "SStruggleHealthPvic", SStruggleHealthPvic)
	KnockOutHPvic 			= JsonUtil.GetFloatValue(File, "KnockOutHPvic", KnockOutHPvic)
	KDWayStamina 			= JsonUtil.GetIntValue(File, "KDWayStamina", KDWayStamina As Int) As Bool
	ExhaustionPvic 			= JsonUtil.GetFloatValue(File, "ExhaustionPvic", ExhaustionPvic)
	KDWayStaminaOB 			= JsonUtil.GetIntValue(File, "KDWayStaminaOB", KDWayStaminaOB As Int) As Bool
	KDHealthBlock 			= JsonUtil.GetIntValue(File, "KDHealthBlock", KDHealthBlock As Int) As Bool
	KDStaminaBlock 			= JsonUtil.GetIntValue(File, "KDStaminaBlock", KDStaminaBlock As Int) As Bool
	KDPowerABlock 			= JsonUtil.GetIntValue(File, "KDPowerABlock", KDPowerABlock As Int) As Bool
	ChanceOnHitPvicS 		= JsonUtil.GetFloatValue(File, "ChanceOnHitPvicS", ChanceOnHitPvicS)
	SStruggleExhaustionPvic = JsonUtil.GetFloatValue(File, "SStruggleExhaustionPvic", SStruggleExhaustionPvic)
	KnockOutSPvic 			= JsonUtil.GetFloatValue(File, "KnockOutSPvic", KnockOutSPvic)
	KDWayPowerAtkCOH 		= JsonUtil.GetFloatValue(File, "KDWayPowerAtkCOH", KDWayPowerAtkCOH)
	PowerAtkStagger 		= JsonUtil.GetFloatValue(File, "PowerAtkStagger", PowerAtkStagger)
	KDWayPowerAtk 			= JsonUtil.GetIntValue(File, "KDWayPowerAtk", KDWayPowerAtk As Int) As Bool
	SStrugglePowerPvic 		= JsonUtil.GetFloatValue(File, "SStrugglePowerPvic", SStrugglePowerPvic)
	KnockOutPPvic 			= JsonUtil.GetFloatValue(File, "KnockOutPPvic", KnockOutPPvic)
	HKSurrender 			= JsonUtil.GetIntValue(File, "HKSurrender", HKSurrender)
	MoralityPvic			= JsonUtil.GetIntValue(File, "MoralityPvic", MoralityPvic As Int) As Bool
	BeastImmunity 			= JsonUtil.GetIntValue(File, "BeastImmunity", BeastImmunity As Int) As Bool
	EveryonePvic 			= JsonUtil.GetIntValue(File, "EveryonePvic", EveryonePvic As Int) As Bool
	OnlyPotSexual 			= JsonUtil.GetIntValue(File, "OnlyPotSexual", OnlyPotSexual As Int) As Bool
	NoTranAutoResist 		= JsonUtil.GetIntValue(File, "NoTranAutoResist", NoTranAutoResist As Int) As Bool
	SexualityPvic 			= JsonUtil.GetIntValue(File, "SexualityPvic", SexualityPvic As Int) As Bool
	MaleHunterPvic 			= JsonUtil.GetIntValue(File, "MaleHunterPvic", MaleHunterPvic As Int) As Bool
	FemaleHunterPvic 		= JsonUtil.GetIntValue(File, "FemaleHunterPvic", FemaleHunterPvic As Int) As Bool
	ThreesomeChance 		= JsonUtil.GetFloatValue(File, "ThreesomeChance", ThreesomeChance)
	ThreesomeChanceCollateral = JsonUtil.GetFloatValue(File, "ThreesomeChanceCollateral", ThreesomeChanceCollateral)
	AgainChance 			= JsonUtil.GetFloatValue(File, "AgainChance", AgainChance)
	DebuffDuration 			= JsonUtil.GetFloatValue(File, "DebuffDuration", DebuffDuration)
	SlowDown 				= JsonUtil.GetIntValue(File, "SlowDown", SlowDown As Int) As Bool
	DamageStamina 			= JsonUtil.GetIntValue(File, "DamageStamina", DamageStamina As Int) As Bool
	CollateralAssault 		= JsonUtil.GetIntValue(File, "CollateralAssault", CollateralAssault As Int) As Bool
	FollowerSurrender 		= JsonUtil.GetIntValue(File, "FollowerSurrender", FollowerSurrender As Int) As Bool
	StayDown 				= JsonUtil.GetIntValue(File, "StayDown", StayDown As Int) As Bool
	WitnessPvic 			= JsonUtil.GetIntValue(File, "WitnessPvic", WitnessPvic As Int) As Bool
	CoverSelfPvic 			= JsonUtil.GetIntValue(File, "CoverSelfPvic", CoverSelfPvic As Int) As Bool
	InsatiablePvic 			= JsonUtil.GetIntValue(File, "InsatiablePvic", InsatiablePvic As Int) As Bool
	DialoguesPvic 			= JsonUtil.GetIntValue(File, "DialoguesPvic", DialoguesPvic As Int) As Bool
	CommentsPvic			= JsonUtil.GetIntValue(File, "CommentsPvic", CommentsPvic As Int) As Bool
	MoanPvic				= JsonUtil.GetIntValue(File, "MoanPvic", MoanPvic As Int) As Bool
	DialoguesFollower		= JsonUtil.GetIntValue(File, "DialoguesFollower", DialoguesFollower As Int) As Bool
	QTEHKType 				= JsonUtil.GetStringValue(File, "QTEHKType", QTEHKType)
	ResistBonusPvic 		= JsonUtil.GetFloatValue(File, "ResistBonusPvic", ResistBonusPvic)
	ResistFillStamina 		= JsonUtil.GetFloatValue(File, "ResistFillStamina", ResistFillStamina)
	bQTEmess 				= JsonUtil.GetIntValue(File, "bQTEmess", bQTEmess As Int) As Bool
	bResistQTE 				= JsonUtil.GetIntValue(File, "bResistQTE", bResistQTE As Int) As Bool
;	QTEPrimarySO 			= JsonUtil.GetStringValue(File, "QTEPrimarySO", QTEPrimarySO)
;	QTESecondarySO 			= JsonUtil.GetStringValue(File, "QTESecondarySO", QTESecondarySO)
	SatisfiedPvic 			= JsonUtil.GetFloatValue(File, "SatisfiedPvic", SatisfiedPvic)
	DAsChance 				= JsonUtil.GetFloatValue(File, "DAsChance", DAsChance)
	fRobbing 				= JsonUtil.GetFloatValue(File, "fRobbing", fRobbing)
	vRobbing 				= JsonUtil.GetFloatValue(File, "vRobbing", vRobbing)
	RobbingWay 				= JsonUtil.GetStringValue(File, "RobbingWay", RobbingWay)
	RobTimeLimit 			= JsonUtil.GetIntValue(File, "RobTimeLimit", RobTimeLimit As Int) As Bool
	ImportFloatArray(File, "PAfrequency", PAfrequency)
	ImportBoolArray(File, "PAbEnabled", PAbEnabled)
	ImportBoolArray(File, "PAbSecondary", PAbSecondary)
	ImportBoolArray(File, "PAbOnlyEnemy", PAbOnlyEnemy)
	ImportBoolArray(File, "PAbOnlyRaped", PAbOnlyRaped)
;	PAfrequency  			= ImportFloatArray(File, "PAfrequency", PAfrequency)
;	PAbEnabled 				= ImportBoolArray(File, "PAbEnabled", PAbEnabled)
;	PAbSecondary 			= ImportBoolArray(File, "PAbSecondary", PAbSecondary)
;	PAbOnlyEnemy 			= ImportBoolArray(File, "PAbOnlyEnemy", PAbOnlyEnemy)
;	PAbOnlyRaped 			= ImportBoolArray(File, "PAbOnlyRaped", PAbOnlyRaped)
	bEscape 				= JsonUtil.GetStringValue(File, "bEscape", bEscape)
	PvicRaped 				= JsonUtil.GetFloatValue(File, "PvicRaped", PvicRaped)
;	ArousalSARPvic 			= JsonUtil.GetFloatValue(File, "ArousalSARPvic", ArousalSARPvic)
	bExhaustedPvic 			= JsonUtil.GetIntValue(File, "bExhaustedPvic", bExhaustedPvic As Int) As Bool
	Addperk 				= JsonUtil.GetStringValue(File, "Addperk", Addperk)											; PAGG ==========
	KDownWayPvic 			= JsonUtil.GetStringValue(File, "KDownWayPvic", KDownWayPvic)
	ResistBonusPagg 		= JsonUtil.GetFloatValue(File, "ResistBonusPagg", ResistBonusPagg)
	StruggleBonusPagg 		= JsonUtil.GetFloatValue(File, "StruggleBonusPagg", StruggleBonusPagg)
	WitnessPagg 			= JsonUtil.GetIntValue(File, "WitnessPagg", WitnessPagg As Int) As Bool
	VicAnimosity 			= JsonUtil.GetIntValue(File, "VicAnimosity", VicAnimosity As Int) As Bool
	NecroOnOff 				= JsonUtil.GetIntValue(File, "NecroOnOff", NecroOnOff As Int) As Bool
	TraumaPAGG 				= JsonUtil.GetFloatValue(File, "TraumaPAGG", TraumaPAGG)
	ExhaustedPagg 			= JsonUtil.GetFloatValue(File, "ExhaustedPagg", ExhaustedPagg)
	EscapePagg 				= JsonUtil.GetFloatValue(File, "EscapePagg", EscapePagg)
	KDTimePagg 				= JsonUtil.GetFloatValue(File, "KDTimePagg", KDTimePagg)
	DebuffDurationPAGG 		= JsonUtil.GetFloatValue(File, "DebuffDurationPAGG", DebuffDurationPAGG)
	ChanceOfBountyPagg 		= JsonUtil.GetFloatValue(File, "ChanceOfBountyPagg", ChanceOfBountyPagg)
	TiedTime 				= JsonUtil.GetFloatValue(File, "TiedTime", TiedTime)
	KOTime 					= JsonUtil.GetFloatValue(File, "KOTime", KOTime)
	bTieUpAnim 				= JsonUtil.GetIntValue(File, "bTieUpAnim", bTieUpAnim As Int) As Bool
	MoralityPagg 			= JsonUtil.GetIntValue(File, "MoralityPagg", MoralityPagg As Int) As Bool
	SexualityPagg 			= JsonUtil.GetIntValue(File, "SexualityPagg", SexualityPagg As Int) As Bool
	KDResistPagg 			= JsonUtil.GetIntValue(File, "KDResistPagg", KDResistPagg As Int) As Bool
	MarkHighlight 			= JsonUtil.GetIntValue(File, "MarkHighlight", MarkHighlight As Int) As Bool
	MarkNotification 		= JsonUtil.GetIntValue(File, "MarkNotification", MarkNotification As Int) As Bool
;	ArousalSARPagg 			= JsonUtil.GetFloatValue(File, "ArousalSARPagg", ArousalSARPagg)
	SOSexuality 			= JsonUtil.GetIntValue(File, "SOSexuality", SOSexuality As Int) As Bool
	SOMorality 				= JsonUtil.GetIntValue(File, "SOMorality", SOMorality As Int) As Bool
	SOWitness 				= JsonUtil.GetIntValue(File, "SOWitness", SOWitness As Int) As Bool
	SORelation 				= JsonUtil.GetIntValue(File, "SORelation", SORelation As Int) As Bool
	SOSatisfied 			= JsonUtil.GetIntValue(File, "SOSatisfied", SOSatisfied As Int) As Bool	
	RessConfig.SOSetSOXValues(ImportIntArray(File, "SOXValues", RessConfig.SOGetSOXValues()))
	SOHandoverCD 			= JsonUtil.GetFloatValue(File, "SOHandoverCD", SOHandoverCD)
	ThresholdNPCvsNPC 		= JsonUtil.GetFloatValue(File, "ThresholdNPCvsNPC", ThresholdNPCvsNPC)						; NVN ==========
	ThresholdFollower 		= JsonUtil.GetFloatValue(File, "ThresholdFollower", ThresholdFollower)
	SexualityNVN 			= JsonUtil.GetIntValue(File, "SexualityNVN", SexualityNVN As Int) As Bool
	MaleOnGal 				= JsonUtil.GetIntValue(File, "MaleOnGal", MaleOnGal As Int) As Bool
	MaleOnMale 				= JsonUtil.GetIntValue(File, "MaleOnMale", MaleOnMale As Int) As Bool
	GalOnMale 				= JsonUtil.GetIntValue(File, "GalOnMale", GalOnMale As Int) As Bool
	GalOnGal 				= JsonUtil.GetIntValue(File, "GalOnGal", GalOnGal As Int) As Bool
	ChanceOnHitNPC 			= JsonUtil.GetFloatValue(File, "ChanceOnHitNPC", ChanceOnHitNPC)
	COHFollower 			= JsonUtil.GetFloatValue(File, "COHFollower", COHFollower)
	NoNotifications 		= JsonUtil.GetIntValue(File, "NoNotifications", NoNotifications As Int) As Bool
	MoralityNVN 			= JsonUtil.GetIntValue(File, "MoralityNVN", MoralityNVN As Int) As Bool
	WitnessNVN				= JsonUtil.GetIntValue(File, "WitnessNVN", WitnessNVN As Int) As Bool
	DialoguesNVN 			= JsonUtil.GetIntValue(File, "DialoguesNVN", DialoguesNVN As Int) As Bool
	DialoguesNVNFollower 	= JsonUtil.GetIntValue(File, "DialoguesNVNFollower", DialoguesNVNFollower As Int) As Bool
	AllowNPC 				= JsonUtil.GetIntValue(File, "AllowNPC", AllowNPC As Int) As Bool
	RessConfig.NVNAllowVic 	= AllowNPC
	AllowCvic 				= JsonUtil.GetIntValue(File, "AllowCvic", AllowCvic As Int) As Bool
	RessConfig.NVNAllowFollowerVic = AllowCvic
	AllowCagg 				= JsonUtil.GetIntValue(File, "AllowCagg", AllowCagg As Int) As Bool
	GbChanceNVN 			= JsonUtil.GetFloatValue(File, "GbChanceNVN", GbChanceNVN)
	NPCLastEnemy 			= JsonUtil.GetIntValue(File, "NPCLastEnemy", NPCLastEnemy As Int) As Bool
	NVNTrauma 				= JsonUtil.GetFloatValue(File, "NVNTrauma", NVNTrauma)
	NVNTraumaCvic 			= JsonUtil.GetFloatValue(File, "NVNTraumaCvic", NVNTraumaCvic)
	NVNExhausted 			= JsonUtil.GetFloatValue(File, "NVNExhausted", NVNExhausted)
	NVNExhaustedCvic 		= JsonUtil.GetFloatValue(File, "NVNExhaustedCvic", NVNExhaustedCvic)
	EscapeNPC 				= JsonUtil.GetFloatValue(File, "EscapeNPC", EscapeNPC)
	EscapeCvic 				= JsonUtil.GetFloatValue(File, "EscapeCvic", EscapeCvic)
	NVNRobbedPA 			= JsonUtil.GetFloatValue(File, "NVNRobbedPA", NVNRobbedPA)
	NVNKillPA 				= JsonUtil.GetFloatValue(File, "NVNKillPA", NVNKillPA)
	NVNRobbedPAFollower 	= JsonUtil.GetFloatValue(File, "NVNRobbedPAFollower", NVNRobbedPAFollower)
	NVNKillPAFollower 		= JsonUtil.GetFloatValue(File, "NVNKillPAFollower", NVNKillPAFollower)
	DebuffDurationNVN 		= JsonUtil.GetFloatValue(File, "DebuffDurationNVN", DebuffDurationNVN)
	DebuffDurationNVNCvic 	= JsonUtil.GetFloatValue(File, "DebuffDurationNVNCvic", DebuffDurationNVNCvic)
	EveryoneNVN 			= JsonUtil.GetIntValue(File, "EveryoneNVN", EveryoneNVN As Int) As Bool
	NVNKDtype 				= JsonUtil.GetStringValue(File, "NVNKDtype", NVNKDtype)
	NVNRaped 				= JsonUtil.GetFloatValue(File, "NVNRaped", NVNRaped)
	NVNRobbed 				= JsonUtil.GetFloatValue(File, "NVNRobbed", NVNRobbed)
	NVNKill 				= JsonUtil.GetFloatValue(File, "NVNKill", NVNKill)
	NVNRapedFollower 		= JsonUtil.GetFloatValue(File, "NVNRapedFollower", NVNRapedFollower)
	NVNRobbedFollower 		= JsonUtil.GetFloatValue(File, "NVNRobbedFollower", NVNRobbedFollower)
	NVNKillFollower 		= JsonUtil.GetFloatValue(File, "NVNKillFollower", NVNKillFollower)
	SatisfiedFollower 		= JsonUtil.GetFloatValue(File, "SatisfiedFollower", SatisfiedFollower)
	NVN3wayAutoFollower 	= JsonUtil.GetFloatValue(File, "NVN3wayAutoFollower", NVN3wayAutoFollower)
	SatisfiedNVN 			= JsonUtil.GetFloatValue(File, "SatisfiedNVN", SatisfiedNVN)
;	ArousalSARFollower 		= JsonUtil.GetFloatValue(File, "ArousalSARFollower", ArousalSARFollower)
;	ArousalSARNVN 			= JsonUtil.GetFloatValue(File, "ArousalSARNVN", ArousalSARNVN)
	KDTimeNVN 				= JsonUtil.GetFloatValue(File, "KDTimeNVN", KDTimeNVN)
	CrScenario 				= JsonUtil.GetStringValue(File, "CrScenario", CrScenario)									; CREATURES PVIC ==========
	HuntCrea 				= JsonUtil.GetIntValue(File, "HuntCrea", HuntCrea As Int) As Bool
	HuntFCrea 				= JsonUtil.GetIntValue(File, "HuntFCrea", HuntFCrea As Int) As Bool
	GbCrChancePvic 			= JsonUtil.GetFloatValue(File, "GbCrChancePvic", GbCrChancePvic)
	CreaOnMale 				= JsonUtil.GetIntValue(File, "CreaOnMale", CreaOnMale As Int) As Bool						; CREATURES NVN ==========
	CreaOnFemale 			= JsonUtil.GetIntValue(File, "CreaOnFemale", CreaOnFemale As Int) As Bool
	CreaFemaleOnMale 		= JsonUtil.GetIntValue(File, "CreaFemaleOnMale", CreaFemaleOnMale As Int) As Bool
	CreaFemaleOnFemale 		= JsonUtil.GetIntValue(File, "CreaFemaleOnFemale", CreaFemaleOnFemale As Int) As Bool
	GbCrChanceNVN 			= JsonUtil.GetFloatValue(File, "GbCrChanceNVN", GbCrChanceNVN)
	ModStatus 				= JsonUtil.GetStringValue(File, "ModStatus", ModStatus)										; SYSTEM ==========
	OnOffPvic 				= JsonUtil.GetStringValue(File, "OnOffPvic", OnOffPvic)
	OnOffPagg 				= JsonUtil.GetStringValue(File, "OnOffPagg", OnOffPagg)
	OnOffNVN 				= JsonUtil.GetStringValue(File, "OnOffNVN", OnOffNVN)
	HitInterrupt 			= JsonUtil.GetIntValue(File, "HitInterrupt", HitInterrupt As Int) As Bool
	CombatInterrupt 		= JsonUtil.GetIntValue(File, "CombatInterrupt", CombatInterrupt As Int) As Bool
	ConsTag					= JsonUtil.GetStringValue(File, "ConsTag", ConsTag)
	ConsSupressTag 			= JsonUtil.GetStringValue(File, "ConsSupressTag", ConsSupressTag)
	ConsRequireAllTag 		= JsonUtil.GetIntValue(File, "ConsRequireAllTag", ConsRequireAllTag As Int) As Bool
	ConsFemaleFirst 		= JsonUtil.GetIntValue(File, "ConsFemaleFirst", ConsFemaleFirst As Int) As Bool
	ConsFoMTag 				= JsonUtil.GetStringValue(File, "ConsFoMTag", ConsFoMTag)
	ConsFoMSupressTag 		= JsonUtil.GetStringValue(File, "ConsFoMSupressTag", ConsFoMSupressTag)
	ConsFoMRequireAllTag 	= JsonUtil.GetIntValue(File, "ConsFoMRequireAllTag", ConsFoMRequireAllTag As Int) As Bool
	ConsFoMFemaleFirst 		= JsonUtil.GetIntValue(File, "ConsFoMFemaleFirst", ConsFoMFemaleFirst As Int) As Bool
	ConsFoFTag 				= JsonUtil.GetStringValue(File, "ConsFoFTag", ConsFoFTag)
	ConsFoFSupressTag 		= JsonUtil.GetStringValue(File, "ConsFoFSupressTag", ConsFoFSupressTag)
	ConsFoFRequireAllTag 	= JsonUtil.GetIntValue(File, "ConsFoFRequireAllTag", ConsFoFRequireAllTag As Int) As Bool
	ConsFoFFemaleFirst 		= JsonUtil.GetIntValue(File, "ConsFoFFemaleFirst", ConsFoFFemaleFirst As Int) As Bool
	ConsCreatureTag 		= JsonUtil.GetStringValue(File, "ConsCreatureTag", ConsCreatureTag)
	ConsCreatureSupressTag 	= JsonUtil.GetStringValue(File, "ConsCreatureSupressTag", ConsCreatureSupressTag)
	ConsCreatureRequireAllTag = JsonUtil.GetIntValue(File, "ConsCreatureRequireAllTag", ConsCreatureRequireAllTag As Int) As Bool
	ConsMultipleTag 		= JsonUtil.GetStringValue(File, "ConsMultipleTag", ConsMultipleTag)
	ConsMultipleSupressTag 	= JsonUtil.GetStringValue(File, "ConsMultipleSupressTag", ConsMultipleSupressTag)
	ConsMultipleRequireAllTag = JsonUtil.GetIntValue(File, "ConsMultipleRequireAllTag", ConsMultipleRequireAllTag As Int) As Bool
	ConsMultipleFemaleFirst = JsonUtil.GetIntValue(File, "ConsMultipleFemaleFirst", ConsMultipleFemaleFirst As Int) As Bool
	RapeTagPvic 			= JsonUtil.GetStringValue(File, "RapeTagPvic", RapeTagPvic)
	RapeSupressTagPvic 		= JsonUtil.GetStringValue(File, "RapeSupressTagPvic", RapeSupressTagPvic)
	RapeRequireAllTagPvic 	= JsonUtil.GetIntValue(File, "RapeRequireAllTagPvic", RapeRequireAllTagPvic As Int) As Bool
	RapeFemaleFirstPvic 	= JsonUtil.GetIntValue(File, "RapeFemaleFirstPvic", RapeFemaleFirstPvic As Int) As Bool
	KOTagPvic 				= JsonUtil.GetStringValue(File, "KOTagPvic", KOTagPvic)
	KOSupressTagPvic 		= JsonUtil.GetStringValue(File, "KOSupressTagPvic", KOSupressTagPvic)
	KORequireAllTagPvic 	= JsonUtil.GetIntValue(File, "KORequireAllTagPvic", KORequireAllTagPvic As Int) As Bool
	KOFemaleFirstPvic 		= JsonUtil.GetIntValue(File, "KOFemaleFirstPvic", KOFemaleFirstPvic As Int) As Bool
	FoMTagPvic 				= JsonUtil.GetStringValue(File, "FoMTagPvic", FoMTagPvic)
	FoMSupressTagPvic 		= JsonUtil.GetStringValue(File, "FoMSupressTagPvic", FoMSupressTagPvic)
	FoMRequireAllTagPvic 	= JsonUtil.GetIntValue(File, "FoMRequireAllTagPvic", FoMRequireAllTagPvic As Int) As Bool
	FoMFemaleFirstPvic 		= JsonUtil.GetIntValue(File, "FoMFemaleFirstPvic", FoMFemaleFirstPvic As Int) As Bool
	FoFTagPvic 				= JsonUtil.GetStringValue(File, "FoFTagPvic", FoFTagPvic)
	FoFSupressTagPvic 		= JsonUtil.GetStringValue(File, "FoFSupressTagPvic", FoFSupressTagPvic)
	FoFRequireAllTagPvic 	= JsonUtil.GetIntValue(File, "FoFRequireAllTagPvic", FoFRequireAllTagPvic As Int) As Bool
	FoFFemaleFirstPvic 		= JsonUtil.GetIntValue(File, "FoFFemaleFirstPvic", FoFFemaleFirstPvic As Int) As Bool
	TiedTagPvic 			= JsonUtil.GetStringValue(File, "TiedTagPvic", TiedTagPvic)
	TiedSupressTagPvic 		= JsonUtil.GetStringValue(File, "TiedSupressTagPvic", TiedSupressTagPvic)
	TiedRequireAllTagPvic 	= JsonUtil.GetIntValue(File, "TiedRequireAllTagPvic", TiedRequireAllTagPvic As Int) As Bool
	TiedFemaleFirstPvic 	= JsonUtil.GetIntValue(File, "TiedFemaleFirstPvic", TiedFemaleFirstPvic As Int) As Bool
	CreatureTagPvic 		= JsonUtil.GetStringValue(File, "CreatureTagPvic", CreatureTagPvic)
	CreatureSupressTagPvic 	= JsonUtil.GetStringValue(File, "CreatureSupressTagPvic", CreatureSupressTagPvic)
	CreatureRequireAllTagPvic = JsonUtil.GetIntValue(File, "CreatureRequireAllTagPvic", CreatureRequireAllTagPvic As Int) As Bool
	MultipleTagPvic 		= JsonUtil.GetStringValue(File, "MultipleTagPvic", MultipleTagPvic)
	MultipleSupressTagPvic 	= JsonUtil.GetStringValue(File, "MultipleSupressTagPvic", MultipleSupressTagPvic)
	MultipleRequireAllTagPvic = JsonUtil.GetIntValue(File, "MultipleRequireAllTagPvic", MultipleRequireAllTagPvic As Int) As Bool
	MultipleFemaleFirstPvic = JsonUtil.GetIntValue(File, "MultipleFemaleFirstPvic", MultipleFemaleFirstPvic As Int) As Bool
	MultipleIgnoreGTPvic 	= JsonUtil.GetIntValue(File, "MultipleIgnoreGTPvic", MultipleIgnoreGTPvic As Int) As Bool
	MultipleIgnoreGTCreaPvic = JsonUtil.GetIntValue(File, "MultipleIgnoreGTCreaPvic", MultipleIgnoreGTCreaPvic As Int) As Bool
	MultipleIgnoreGTPagg 	= JsonUtil.GetIntValue(File, "MultipleIgnoreGTPagg", MultipleIgnoreGTPagg As Int) As Bool
	MultipleIgnoreGTCreaPagg = JsonUtil.GetIntValue(File, "MultipleIgnoreGTCreaPagg", MultipleIgnoreGTCreaPagg As Int) As Bool
	MultipleIgnoreGTNVN 	= JsonUtil.GetIntValue(File, "MultipleIgnoreGTNVN", MultipleIgnoreGTNVN As Int) As Bool
	MultipleIgnoreGTCreaNVN = JsonUtil.GetIntValue(File, "MultipleIgnoreGTCreaNVN", MultipleIgnoreGTCreaNVN As Int) As Bool
	RapeTagPagg 			= JsonUtil.GetStringValue(File, "RapeTagPagg", RapeTagPagg)
	RapeSupressTagPagg 		= JsonUtil.GetStringValue(File, "RapeSupressTagPagg", RapeSupressTagPagg)
	RapeRequireAllTagPagg 	= JsonUtil.GetIntValue(File, "RapeRequireAllTagPagg", RapeRequireAllTagPagg As Int) As Bool
	RapeFemaleFirstPagg 	= JsonUtil.GetIntValue(File, "RapeFemaleFirstPagg", RapeFemaleFirstPagg As Int) As Bool
	NecroTagPagg 			= JsonUtil.GetStringValue(File, "NecroTagPagg", NecroTagPagg)
	NecroSupressTagPagg 	= JsonUtil.GetStringValue(File, "NecroSupressTagPagg", NecroSupressTagPagg)
	NecroRequireAllTagPagg 	= JsonUtil.GetIntValue(File, "NecroRequireAllTagPagg", NecroRequireAllTagPagg As Int) As Bool
	NecroFemaleFirstPagg 	= JsonUtil.GetIntValue(File, "NecroFemaleFirstPagg", NecroFemaleFirstPagg As Int) As Bool
	FoMTagPagg 				= JsonUtil.GetStringValue(File, "FoMTagPagg", FoMTagPagg)
	FoMSupressTagPagg 		= JsonUtil.GetStringValue(File, "FoMSupressTagPagg", FoMSupressTagPagg)
	FoMRequireAllTagPagg 	= JsonUtil.GetIntValue(File, "FoMRequireAllTagPagg", FoMRequireAllTagPagg As Int) As Bool
	FoMFemaleFirstPagg 		= JsonUtil.GetIntValue(File, "FoMFemaleFirstPagg", FoMFemaleFirstPagg As Int) As Bool
	FoFTagPagg 				= JsonUtil.GetStringValue(File, "FoFTagPagg", FoFTagPagg)
	FoFSupressTagPagg 		= JsonUtil.GetStringValue(File, "FoFSupressTagPagg", FoFSupressTagPagg)
	FoFRequireAllTagPagg 	= JsonUtil.GetIntValue(File, "FoFRequireAllTagPagg", FoFRequireAllTagPagg As Int) As Bool
	FoFFemaleFirstPagg 		= JsonUtil.GetIntValue(File, "FoFFemaleFirstPagg", FoFFemaleFirstPagg As Int) As Bool
	TiedTagPagg 			= JsonUtil.GetStringValue(File, "TiedTagPagg", TiedTagPagg)
	TiedSupressTagPagg 		= JsonUtil.GetStringValue(File, "TiedSupressTagPagg", TiedSupressTagPagg)
	TiedRequireAllTagPagg 	= JsonUtil.GetIntValue(File, "TiedRequireAllTagPagg", TiedRequireAllTagPagg As Int) As Bool
	TiedFemaleFirstPagg 	= JsonUtil.GetIntValue(File, "TiedFemaleFirstPagg", TiedFemaleFirstPagg As Int) As Bool
	CreatureTagPagg 		= JsonUtil.GetStringValue(File, "CreatureTagPagg", CreatureTagPagg)
	CreatureSupressTagPagg 	= JsonUtil.GetStringValue(File, "CreatureSupressTagPagg", CreatureSupressTagPagg)
	CreatureRequireAllTagPagg = JsonUtil.GetIntValue(File, "CreatureRequireAllTagPagg", CreatureRequireAllTagPagg As Int) As Bool
	MultipleTagPagg 		= JsonUtil.GetStringValue(File, "MultipleTagPagg", MultipleTagPagg)
	MultipleSupressTagPagg 	= JsonUtil.GetStringValue(File, "MultipleSupressTagPagg", MultipleSupressTagPagg)
	MultipleRequireAllTagPagg = JsonUtil.GetIntValue(File, "MultipleRequireAllTagPagg", MultipleRequireAllTagPagg As Int) As Bool
	MultipleFemaleFirstPagg = JsonUtil.GetIntValue(File, "MultipleFemaleFirstPagg", MultipleFemaleFirstPagg As Int) As Bool
	RapeTagNVN 				= JsonUtil.GetStringValue(File, "RapeTagNVN", RapeTagNVN)
	RapeSupressTagNVN 		= JsonUtil.GetStringValue(File, "RapeSupressTagNVN", RapeSupressTagNVN)
	RapeRequireAllTagNVN 	= JsonUtil.GetIntValue(File, "RapeRequireAllTagNVN", RapeRequireAllTagNVN As Int) As Bool
	RapeFemaleFirstNVN 		= JsonUtil.GetIntValue(File, "RapeFemaleFirstNVN", RapeFemaleFirstNVN As Int) As Bool
	FoMTagNVN 				= JsonUtil.GetStringValue(File, "FoMTagNVN", FoMTagNVN)
	FoMSupressTagNVN 		= JsonUtil.GetStringValue(File, "FoMSupressTagNVN", FoMSupressTagNVN)
	FoMRequireAllTagNVN 	= JsonUtil.GetIntValue(File, "FoMRequireAllTagNVN", FoMRequireAllTagNVN As Int) As Bool
	FoMFemaleFirstNVN 		= JsonUtil.GetIntValue(File, "FoMFemaleFirstNVN", FoMFemaleFirstNVN As Int) As Bool
	FoFTagNVN 				= JsonUtil.GetStringValue(File, "FoFTagNVN", FoFTagNVN)
	FoFSupressTagNVN 		= JsonUtil.GetStringValue(File, "FoFSupressTagNVN", FoFSupressTagNVN)
	FoFRequireAllTagNVN 	= JsonUtil.GetIntValue(File, "FoFRequireAllTagNVN", FoFRequireAllTagNVN As Int) As Bool
	FoFFemaleFirstNVN 		= JsonUtil.GetIntValue(File, "FoFFemaleFirstNVN", FoFFemaleFirstNVN As Int) As Bool
	TiedTagNVN 				= JsonUtil.GetStringValue(File, "TiedTagNVN", TiedTagNVN)
	TiedSupressTagNVN 		= JsonUtil.GetStringValue(File, "TiedSupressTagNVN", TiedSupressTagNVN)
	TiedRequireAllTagNVN 	= JsonUtil.GetIntValue(File, "TiedRequireAllTagNVN", TiedRequireAllTagNVN As Int) As Bool
	TiedFemaleFirstNVN 		= JsonUtil.GetIntValue(File, "TiedFemaleFirstNVN", TiedFemaleFirstNVN As Int) As Bool
	CreatureTagNVN 			= JsonUtil.GetStringValue(File, "CreatureTagNVN", CreatureTagNVN)
	CreatureSupressTagNVN 	= JsonUtil.GetStringValue(File, "CreatureSupressTagNVN", CreatureSupressTagNVN)
	CreatureRequireAllTagNVN = JsonUtil.GetIntValue(File, "CreatureRequireAllTagNVN", CreatureRequireAllTagNVN As Int) As Bool
	MultipleTagNVN 			= JsonUtil.GetStringValue(File, "MultipleTagNVN", MultipleTagNVN)
	MultipleSupressTagNVN 	= JsonUtil.GetStringValue(File, "MultipleSupressTagNVN", MultipleSupressTagNVN)
	MultipleRequireAllTagNVN = JsonUtil.GetIntValue(File, "MultipleRequireAllTagNVN", MultipleRequireAllTagNVN As Int) As Bool
	MultipleFemaleFirstNVN 	= JsonUtil.GetIntValue(File, "MultipleFemaleFirstNVN", MultipleFemaleFirstNVN As Int) As Bool
	QTEColorBar 			= 0xFFFFFF
	MeterWidth 				= JsonUtil.GetFloatValue(File, "MeterWidth", MeterWidth)
	MeterHeight 			= JsonUtil.GetFloatValue(File, "MeterHeight", MeterHeight)
	AxisX 					= JsonUtil.GetFloatValue(File, "AxisX", AxisX)
	AxisY 					= JsonUtil.GetFloatValue(File, "AxisY", AxisY)
	HKOption 				= JsonUtil.GetIntValue(File, "HKOption", HKOption)											; HOTKEY ==========
	HKModifier 				= JsonUtil.GetIntValue(File, "HKModifier", HKModifier)
	HKAction 				= JsonUtil.GetIntValue(File, "HKAction", HKAction)
	bRedressPvic 			= JsonUtil.GetIntValue(File, "bRedressPvic", bRedressPvic As Int) As Bool					; STRIPPING ==========
	ImportFloatArray(File, "SSPvic", SSPvic)
	ImportStringArray(File, "SSPvicSet", SSPvicSet)
	bRedressPagg 			= JsonUtil.GetIntValue(File, "bRedressPagg", bRedressPagg As Int) As Bool
	ImportFloatArray(File, "SSPagg", SSPagg)
	ImportStringArray(File, "SSPaggSet", SSPaggSet)
	bRedressNVN 			= JsonUtil.GetIntValue(File, "bRedressNVN", bRedressNVN As Int) As Bool
	bRedressFollower 		= JsonUtil.GetIntValue(File, "bRedressFollower", bRedressFollower As Int) As Bool
	ImportFloatArray(File, "SSNVN", SSNVN)
	ImportStringArray(File, "SSNVNSet", SSNVNSet)
	If (OnOffPagg == "$Enabled")
		RessConfig.OnOffFeature("PlayerAgg", True)
	Else
		RessConfig.OnOffFeature("PlayerAgg")
	Endif
	If (Addperk == "$Enabled")
		Player.AddPerk(RessConfig.DefeatAssaultPRK)
		RessConfig.OnOffPerk = True
	Else
		If Player.HasPerk(RessConfig.DefeatAssaultPRK)
			Player.RemovePerk(RessConfig.DefeatAssaultPRK)
		Endif
		RessConfig.OnOffPerk = False
	Endif
	If NecroOnOff
		RessConfig.OnOffNecro = True
	Else
		RessConfig.OnOffNecro = False
	Endif
	If (OnOffPvic == "$Enabled")
		RessConfig.OnOffFeature("PlayerVic", True)
	Else
		RessConfig.OnOffFeature("PlayerVic")
	Endif
	If (OnOffNVN == "$Enabled")
		RessConfig.OnOffFeature("", True)
	Else
		RessConfig.OnOffFeature("")
	Endif
	If KDWayThreshold
		KDwayThresholdFlag = OPTION_FLAG_NONE
	Else
		KDwayThresholdFlag = OPTION_FLAG_DISABLED
	Endif
	If KDWayStamina
	    KDwayStaminaFlag = OPTION_FLAG_NONE
	Else
	    KDwayStaminaFlag = OPTION_FLAG_DISABLED
	Endif
	If KDWayPowerAtk
		KDwayPowerAtkFlag = OPTION_FLAG_NONE
	Else
		KDwayPowerAtkFlag = OPTION_FLAG_DISABLED
	Endif
	If bResistQTE
		ResistFlag = OPTION_FLAG_NONE
	Else
		ResistFlag = OPTION_FLAG_DISABLED
	Endif			
	If AllowNPC
		AllowNPCFlag = OPTION_FLAG_NONE
	Else
		AllowNPCFlag = OPTION_FLAG_DISABLED
	Endif			
	If AllowCvic
		AllowCvicFlag = OPTION_FLAG_NONE
	Else
		AllowCvicFlag = OPTION_FLAG_DISABLED
	Endif
	PlayerScr.Hkrefresh()
	ActionQst.Hkrefresh()
	RessConfig.Hkrefresh()
EndFunction

Int Function GetVersion()
	Return 69
EndFunction
Event OnVersionUpdate(Int NewVersion)
	If (CurrentVersion != 0)
		OnConfigInit()
		RessConfig.Maintenance(True, NewVersion)
	Endif
EndEvent
Event OnGameReload()
	If (CurrentVersion != 0)
		RessConfig.Maintenance()
	Endif
	parent.OnGameReload()
EndEvent

;OPTION_FLAG_NONE, to clear the flags;
;OPTION_FLAG_DISABLED, to grey out and disable the option.
;OPTION_FLAG_HIDDEN, to hide an option. It'll behave like an empty option.
;OPTION_FLAG_WITH_UNMAP, to enable the unmap button for keymap options.
;SetOptionFlags(option, flag, true)

;String Function PrimaryMove()
;	Return QTEPrimaryS[QTEPrimarySIndex]
;EndFunction

Function Grayout(String Option, Bool On = False)
	If (Option == "daymoyl")
		If On
			DAFlag = OPTION_FLAG_NONE
		Else
			DAFlag = OPTION_FLAG_DISABLED
		Endif
;	Elseif (Option == "SAR")
;		If On
;			ArousalSARFlag = OPTION_FLAG_NONE
;		Else
;			ArousalSARFlag = OPTION_FLAG_DISABLED
;		Endif
	Endif
EndFunction

String Function StripChoices(String Option)
	If Option == "$Disabled"
		Option = "$STRIP"
	Elseif Option == "$STRIP"
		Option = "$UNEQUIP"
	Elseif Option == "$UNEQUIP"
		Option = "$STEAL"
	Else
		Option = "$Disabled"
	Endif
	Return Option
EndFunction

;=================================/MENU\=======================================
Event OnPageReset(String page)
	If (Page == "")
		LoadCustomContent("Defeat/SLDlogo.dds", 240, 30)
		Return
	Else
		UnloadCustomContent()
	Endif
	If (Page == "$General settings")
			SetCursorFillMode(TOP_TO_BOTTOM)
			AddTextOption("$Defeat by Goubo // LoversLab.com", "v5")
		If (ModStatus == "$Enabled")
			AddHeaderOption("$System")
			oidOnOffPvic = AddTextOption("$Player as victim", OnOffPvic)
			oidOnOffPagg = AddTextOption("$Player/Follower aggressor", OnOffPagg)
			oidOnOffNVN = AddTextOption("$NPC vs NPC", OnOffNVN)
			oidHKOption = AddKeyMapOption("$Option/Controller key", HKOption)
			oidHKModifier = AddKeyMapOption("$Modifier key", HKModifier)
			AddHeaderOption("$Compatibility")
			oidModList = AddTextOption("$List of loaded compatible mods", "$CLICK")
			oidModCheck = AddTextOption("$Check for compatible mods", "$CLICK")
		Endif
			SetCursorPosition(1)
			AddEmptyOption()
			AddHeaderOption("")
			oidModStatus = AddTextOption("$Mod status", ModStatus)
		If (ModStatus == "$Enabled")
			oidModExportSetting = AddTextOption("$Export settings", "$CLICK")
			oidModImportSetting = AddTextOption("$Import settings", "$CLICK")
			oidReconfigure = AddTextOption("$Reconfigure", "$CLICK")
			oidCleanUp = AddTextOption("$Clean up", "$Clean")
			AddHeaderOption("$Struggle/Resist bar")
			oidQTEColorBar = AddColorOption("$Bar color", QTEColorBar)
			oidMeterWidth = AddSliderOption("$Width", MeterWidth, "{0}")
			oidMeterHeight = AddSliderOption("$Height", MeterHeight, "{0}") 
			oidAxisX = AddSliderOption("$Axis X", AxisX, "{0}")
			oidAxisY = AddSliderOption("$Axis Y", AxisY, "{0}")
			oidDisplayBar = AddTextOption("$Display struggle bar", None)
		Endif
	Elseif (Page == "$Player/Follower aggressor")
			SetCursorFillMode(TOP_TO_BOTTOM)
		If (OnOffPagg == "$Enabled")
			AddHeaderOption("$Hotkeys")
			oidHKAction = AddKeyMapOption("$Action key", HKAction)
			AddEmptyOption()
			AddHeaderOption("$Settings")
			oidResistBonusPagg = AddSliderOption("$Knock down chance multiplier", ResistBonusPagg, "{0} %")
			oidStruggleBonusPagg = AddSliderOption("$Struggle difficulty bonus/malus", StruggleBonusPagg, "{0}")
			oidAddperk = AddTextOption("$Activate system", Addperk)
			oidNecroOnOff = AddToggleOption("$Dead options", NecroOnOff)
			oidVicAnimosity = AddToggleOption("$Animosity", VicAnimosity)
			oidWitnessPagg = AddToggleOption("$Witness intervention", WitnessPagg)
			AddHeaderOption("$Handover/Prostitution")
			oidSOValueCheck = AddTextOption("$Market value of {"+SOTargetOrPlayerName()+"}", "$Click")
			oidSOValuesSet = AddTextOption("$Set multiplier values", "$CLICK")
			oidSOHandoverCD = AddSliderOption("$Handover cooldown", SOHandoverCD, "{0} hours")
			AddEmptyOption()
			AddEmptyOption()
			AddHeaderOption("$States")
			oidKDTimePagg = AddSliderOption("$Knock down duration", KDTimePagg, "{0} seconds")
			oidKOTime = AddSliderOption("$Knock out duration", KOTime, "{0} hours")
			AddHeaderOption("$Post-Assault")
			oidTraumaPagg = AddSliderOption("$Trauma", TraumaPagg, "{0} seconds")
			oidExhaustedPagg = AddSliderOption("$Exhausted", ExhaustedPagg, "{0} seconds")
			oidEscapePagg = AddSliderOption("$Escape", EscapePagg, "{0} seconds")
			AddHeaderOption("$Strip options")
			oidSSPaggSet[0] = AddTextOption("$Weapon", SSPaggSet[0])
			oidSSPaggSet[1] = AddTextOption("$Armor piece 01", SSPaggSet[1])
			oidSSPaggSet[2] = AddTextOption("$Armor piece 02", SSPaggSet[2])
			oidSSPaggSet[3] = AddTextOption("$Armor piece 03", SSPaggSet[3])
			oidSSPaggSet[4] = AddTextOption("$Armor piece 04", SSPaggSet[4])
			oidSSPaggSet[5] = AddTextOption("$Armor piece 05", SSPaggSet[5])
		Else
			AddTextOption("$Disabled", none)
		Endif
			SetCursorPosition(1)
		If (OnOffPagg == "$Enabled")
			AddHeaderOption("")
			oidHKInfo = AddTextOption("$Marking system and states", "$Help")
			oidHKInfo2 = AddTextOption("$Follower commands", "$Help")
			AddHeaderOption("$Settings for followers")
			oidMoralityPagg = AddToggleOption("$Morality matters", MoralityPagg)
			oidSexualityPagg = AddToggleOption("$Sexuality matters", SexualityPagg)
			oidKDResistPagg = AddToggleOption("$Knocked down resist", KDResistPagg)			
;			oidArousalSARPagg = AddSliderOption("$Arousal matters", ArousalSARPagg, "{0} %", ArousalSARFlag)
			AddEmptyOption()
			oidMarkHighlight = AddToggleOption("$Marking - Highlight", MarkHighlight)
			oidMarkNotification = AddToggleOption("$Marking - Notification", MarkNotification)
			AddHeaderOption("")
			oidSOSexuality = AddToggleOption("$Sexuality matters", SOSexuality)
			oidSOMorality = AddToggleOption("$Morality matters", SOMorality)
			oidSOWitness = AddToggleOption("$Witness matters", SOWitness)
			oidSORelation = AddToggleOption("$Relation matters", SORelation)
			oidSOSatisfied = AddToggleOption("$Satisfied matters", SOSatisfied)
			AddHeaderOption("")
			oidTiedTime = AddSliderOption("$Tie up duration", TiedTime, "{0} hours")
			oidbTieUpAnim = AddToggleOption("$Tie up animation", bTieUpAnim)
			AddHeaderOption("")
			oidDebuffDurationPAGG = AddSliderOption("$Weakened", DebuffDurationPAGG, "{0} seconds")
			oidChanceOfBountyPagg = AddSliderOption("$Bounty chance", ChanceOfBountyPagg, "{0} %")
			oidbRedressPagg = AddToggleOption("$Redress", bRedressPagg)
			AddHeaderOption("")
			oidCheckSlots = AddTextOption("$Check equipped item slots", "$CLICK")
			Int i
			While (i < 5)
				oidSSPagg[i] = AddSliderOption(">>>>>", SSPagg[i], "{0}"+SlotNames[(SSPagg[i] As Int) - 30])
				i += 1
			EndWhile
		Endif
	Elseif (Page == "$Player as victim")
			SetCursorFillMode(TOP_TO_BOTTOM)
		If (OnOffPvic == "$Enabled")
			AddHeaderOption("$Knock down way")
			oidPlayerEssential = AddToggleOption("$>> Essential - On bleedout", PlayerEssential)
			oidKDWayThreshold = AddToggleOption("$>> Wound", KDWayThreshold)
			oidThresholdPvic = AddSliderOption("$Wound - Threshold", ThresholdPvic, "{0} %", KDwayThresholdFlag)
			oidThresholdPvicMin = AddSliderOption("$Wound - Threshold minimum", ThresholdPvicMin, "{0} %", KDwayThresholdFlag)
			oidChanceOnHitPvic = AddSliderOption("$Wound - Chance on hit", ChanceOnHitPvic, "{0} %", KDwayThresholdFlag)
			oidKnockOutHPvic = AddSliderOption("$Wound - Knock out chance", KnockOutHPvic, "{0} %", KDwayThresholdFlag)
			oidSStruggleHealthPvic = AddSliderOption("$Wound - Auto resist chance", SStruggleHealthPvic, "{0} %", KDwayThresholdFlag)
			oidKDHealthBlock = AddToggleOption("$Wound - Unblocked only", KDHealthBlock, KDwayThresholdFlag)
			oidKDWayStamina = AddToggleOption("$>> Exhaustion", KDWayStamina)
			oidExhaustionPvic = AddSliderOption("$Exhaustion - Threshold", ExhaustionPvic, "{0} %", KDwayStaminaFlag)
			oidChanceOnHitPvicS = AddSliderOption("$Exhaustion - Chance on hit", ChanceOnHitPvicS, "{0} %", KDwayStaminaFlag)
			oidKDWayStaminaOB = AddToggleOption("$Exhaustion - Back only", KDWayStaminaOB, KDwayStaminaFlag)
			oidKnockOutSPvic = AddSliderOption("$Exhaustion - Knock out chance", KnockOutSPvic, "{0} %", KDwayStaminaFlag)
			oidSStruggleExhaustionPvic = AddSliderOption("$Exhaustion - Auto resist chance", SStruggleExhaustionPvic, "{0} %", KDwayStaminaFlag)
			oidKDStaminaBlock = AddToggleOption("$Exhaustion - Unblocked only", KDStaminaBlock, KDwayStaminaFlag)
			oidKDWayPowerAtk = AddToggleOption("$>> Stun", KDWayPowerAtk)
			oidKDWayPowerAtkCOH = AddSliderOption("$Stun - Chance on hit", KDWayPowerAtkCOH, "{0} %", KDwayPowerAtkFlag)
			oidPowerAtkStagger = AddSliderOption("$Stun - Stagger", PowerAtkStagger, "{0}", KDwayPowerAtkFlag)
			oidKnockOutPPvic = AddSliderOption("$Stun - Knock out chance", KnockOutPPvic, "{0} %", KDwayPowerAtkFlag)
			oidSStrugglePowerPvic = AddSliderOption("$Stun - Auto resist chance", SStrugglePowerPvic, "{0} %", KDwayPowerAtkFlag)
			oidKDPowerABlock = AddToggleOption("$Stun - Unblocked only", KDPowerABlock, KDwayPowerAtkFlag)
			AddHeaderOption("$Resist")
			oidbResistQTE = AddToggleOption("$The player can resist", bResistQTE)
			oidQTEHKType = AddTextOption("$Hotkeys type (Controller support)", QTEHKType, ResistFlag)
			oidResistBonusPvic = AddSliderOption("$Difficulty bonus/malus", ResistBonusPvic, "{0}", ResistFlag)
			oidbQTEmess = AddToggleOption("$Help messages", bQTEmess, ResistFlag)
			oidResistFillStamina = AddSliderOption("$Mid-assault resist difficulty", ResistFillStamina, "{0}", ResistFlag)
			AddHeaderOption("$Assault by NPC")
			oidKDscenario = AddTextOption("$Knock down scenario", KDscenario)
			oidNoTranAutoResist = AddToggleOption("$No transition auto resist", NoTranAutoResist)
			oidSexualityPvic = AddToggleOption("$Sexuality", SexualityPvic)
			oidMaleHunterPvic = AddToggleOption("$Male allowed", MaleHunterPvic)
			oidFemaleHunterPvic = AddToggleOption("$Female allowed", FemaleHunterPvic)
			oidThreesomeChance = AddSliderOption("$Threesome chance", ThreesomeChance, "{0} %")
			AddHeaderOption("$Weakening Effects")
			oidDebuffDuration = AddSliderOption("$Weakened", DebuffDuration, "{0} seconds")
			oidDamageStamina = AddToggleOption("$Exhausted", DamageStamina)
			AddHeaderOption("$Strip options")
			oidSSPvicSet[0] = AddTextOption("$Weapon", SSPvicSet[0])
			oidSSPvicSet[1] = AddTextOption("$Armor piece 01", SSPvicSet[1])
			oidSSPvicSet[2] = AddTextOption("$Armor piece 02", SSPvicSet[2])
			oidSSPvicSet[3] = AddTextOption("$Armor piece 03", SSPvicSet[3])
			oidSSPvicSet[4] = AddTextOption("$Armor piece 04", SSPvicSet[4])
			oidSSPvicSet[5] = AddTextOption("$Armor piece 05", SSPvicSet[5])
		Else
			AddTextOption("$Disabled", none)
		Endif
			SetCursorPosition(1)
		If (OnOffPvic == "$Enabled")
			AddHeaderOption("$Settings")
			oidHKSurrender = AddKeyMapOption("$Surrender", HKSurrender)
			oidEveryonePvic = AddToggleOption("$Can be knocked down by everyone", EveryonePvic)	
			oidBeastImmunity = AddToggleOption("$Can be knocked down while in beast form", BeastImmunity)
			oidPvicRaped = AddSliderOption("$Sexual assault chance", PvicRaped, "{0} %")
			oidSatisfiedPvic = AddSliderOption("$Satisfied", SatisfiedPvic, "{0} seconds")
			oidStayDown = AddToggleOption("$Can't move between turns", StayDown)
			oidAgainChance = AddSliderOption("$Chance of another round", AgainChance, "{0} %")
			oidInsatiablePvic = AddToggleOption("$Insatiable aggressors", InsatiablePvic)
			oidDialoguesPvic = AddToggleOption("$NPC commentaries", DialoguesPvic)
			oidCommentsPvic = AddToggleOption("$Player commentaries", CommentsPvic)
			oidMoanPvic = AddToggleOption("$Player moanings", MoanPvic)
			oidDialoguesFollower = AddToggleOption("$Follower commentaries", DialoguesFollower)
			oidMoralityPvic = AddToggleOption("$Morality matters", MoralityPvic)
			oidWitnessPvic = AddToggleOption("$Witness intervention", WitnessPvic)
			oidCoverSelfPvic = AddToggleOption("$Cover self animation", CoverSelfPvic) 
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()			
			AddHeaderOption("$Follower collateral")
			oidCollateralAssault = AddToggleOption("$Follower collateral", CollateralAssault)
			oidFollowerSurrender = AddToggleOption("$Follower surrender", FollowerSurrender)
			oidbExhaustedPvic = AddToggleOption("$Exhausted", bExhaustedPvic)
			oidbRedressPvic = AddToggleOption("$Redress", bRedressPvic)
			oidThreesomeChanceCollateral = AddSliderOption("$Threesome chance", ThreesomeChanceCollateral, "{0} %")
			AddHeaderOption("$Assault by creature")
			oidCrScenario = AddTextOption("$Knock down scenario", CrScenario)
			oidHuntCrea = AddToggleOption("$Male creatures allowed", HuntCrea)
			oidHuntFCrea = AddToggleOption("$Female creatures allowed", HuntFCrea)
			oidCreaRaceEnablePvic = AddTextOption("$List of enabled races", "$CLICK")
			oidCreaRaceDisablePvic = AddTextOption("$List of disabled races", "$CLICK")
			oidGbCrChancePvic = AddSliderOption("$Multiple chance", GbCrChancePvic, "{0} %")	
			AddHeaderOption("")
			oidSlowDown = AddToggleOption("$Slowdown", SlowDown)
			AddEmptyOption()
			AddHeaderOption("")
			oidCheckSlots = AddTextOption("$Check equipped item slots", "$CLICK")
			Int i
			While (i < 5)
				oidSSPvic[i] = AddSliderOption(">>>>>", SSPvic[i], "{0}"+SlotNames[(SSPvic[i] As Int) - 30])
				i += 1
			EndWhile
		Endif
	Elseif (Page == "$Player Post-Assault")
		SetCursorFillMode(TOP_TO_BOTTOM)
		If (OnOffPvic == "$Enabled")
			AddHeaderOption("$(Base) End of the scene")
			oidbEscape = AddTextOption("$Type", bEscape)
			AddHeaderOption("$(Base) Robbed")
			oidfRobbing = AddSliderOption("$Event Chance", fRobbing, "{0} %")
			oidRobbingWay = AddTextOption("$Type", RobbingWay)
			oidvRobbing = AddSliderOption("$Value", vRobbing, "${0} Gold")
			oidRobTimeLimit = AddToggleOption("$Time limit", RobTimeLimit)
			AddHeaderOption("-----------------------------------------------------------")
			AddHeaderOption("$(Misc) Left For Dead")
			oidPAfrequency[0] = AddSliderOption("$Event Chance", PAfrequency[0], "{0} %")
			oidPAbOnlyEnemy[0] = AddToggleOption("$Only enemy factions", PAbOnlyEnemy[0])
			oidPAbOnlyRaped[0] = AddToggleOption("$Only after a sexual assault", PAbOnlyRaped[0])
			AddHeaderOption("-----------------------------------------------------------")
			AddHeaderOption("$(Misc) Simple Slavery")
			oidPAfrequency[2] = AddSliderOption("$Event Chance", PAfrequency[2], "{0} %")
			oidPAbOnlyEnemy[2] = AddToggleOption("$Only enemy factions", PAbOnlyEnemy[2])
			oidPAbOnlyRaped[2] = AddToggleOption("$Only after a sexual assault", PAbOnlyRaped[2])
		Else
			AddTextOption("$Disabled", none)
		Endif
			SetCursorPosition(1)
		If (OnOffPvic == "$Enabled")
			AddHeaderOption("$(Base) Death Alternative")
			oidDAsChance = AddSliderOption("$Event Chance", DAsChance, "{0} %", DAFlag)
			AddHeaderOption("$(Base) Jailed")
			oidPAbEnabled[0] = AddToggleOption("$Enabled", PAbEnabled[0])
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddHeaderOption("-----------------------------------------------------------")
			AddHeaderOption("(Misc) Rescued")
			oidPAfrequency[1] = AddSliderOption("$Event Chance", PAfrequency[1], "{0} %")
			oidPAbOnlyEnemy[1] = AddToggleOption("$Only enemy factions", PAbOnlyEnemy[1])
			oidPAbOnlyRaped[1] = AddToggleOption("$Only after a sexual assault", PAbOnlyRaped[1])
			AddHeaderOption("-----------------------------------------------------------")
		Endif
	Elseif (Page == "$NPC vs NPC")
			SetCursorFillMode(TOP_TO_BOTTOM)
		If (OnOffNVN == "$Enabled")
			AddHeaderOption("$General settings")
			oidNoNotifications = AddToggleOption("$Notifications", NoNotifications)
			oidMoralityNVN = AddToggleOption("$Morality matters", MoralityNVN)
			oidWitnessNVN = AddToggleOption("$Witness intervention", WitnessNVN)
			AddHeaderOption("$Settings for NPCs")
			oidAllowNPC = AddToggleOption("$NPCs as victims", AllowNPC)
			oidNPCLastEnemy = AddToggleOption("$Last enemy", NPCLastEnemy, AllowNPCFlag)
			oidThresholdNPCvsNPC = AddSliderOption("$Health", ThresholdNPCvsNPC, "{0} %", AllowNPCFlag)
			oidChanceOnHitNPC = AddSliderOption("$Chance on hit", ChanceOnHitNPC, "{0} %", AllowNPCFlag)
			oidNVNRaped = AddSliderOption("$Sexual assault chance", NVNRaped, "{0} %", AllowNPCFlag)
			oidSatisfiedNVN = AddSliderOption("$Satisfied", SatisfiedNVN, "{0} seconds", AllowNPCFlag)
			oidDialoguesNVN = AddToggleOption("$NPC commentaries", DialoguesNVN)
			AddEmptyOption()
			oidNVNRobbed = AddSliderOption("$Rob assault chance", NVNRobbed, "{0} %", AllowNPCFlag)
			oidNVNKill = AddSliderOption("$Kill assault chance", NVNKill, "{0} %", AllowNPCFlag)
			AddHeaderOption("$Sexual assault by NPCs")
			oidSexualityNVN = AddToggleOption("$Sexuality", SexualityNVN)
			oidMaleOnGal = AddToggleOption("$Male vs Female", MaleOnGal)
			oidMaleOnMale = AddToggleOption("$Male vs Male", MaleOnMale)
			oidGalOnMale = AddToggleOption("$Female vs Male", GalOnMale)
			oidGalOnGal = AddToggleOption("$Female vs Female", GalOnGal)
			AddEmptyOption()
			oidGbChanceNVN = AddSliderOption("$Threesome chance", GbChanceNVN, "{0} %")
			AddHeaderOption("$Post-Assault for NPCs")
			oidNVNTrauma = AddSliderOption("$Trauma", NVNTrauma, "{0} seconds")
			oidNVNExhausted = AddSliderOption("$Exhausted", NVNExhausted, "{0} seconds")
			oidEscapeNPC = AddSliderOption("$Escape", EscapeNPC, "{0} seconds")
			oidDebuffDurationNVN = AddSliderOption("$Weakened", DebuffDurationNVN, "{0} seconds")
			oidNVNRobbedPA = AddSliderOption("$Post-assault rob", NVNRobbedPA, "{0} %")
			oidNVNKillPA = AddSliderOption("$Post-assault kill", NVNKillPA, "{0} %")
			oidbRedressNVN = AddToggleOption("$Redress", bRedressNVN)
			AddHeaderOption("$Strip options")
			oidSSNVNSet[0] = AddTextOption("$Weapon", SSNVNSet[0])
			oidSSNVNSet[1] = AddTextOption("$Armor piece 01", SSNVNSet[1])
			oidSSNVNSet[2] = AddTextOption("$Armor piece 02", SSNVNSet[2])
			oidSSNVNSet[3] = AddTextOption("$Armor piece 03", SSNVNSet[3])
			oidSSNVNSet[4] = AddTextOption("$Armor piece 04", SSNVNSet[4])
			oidSSNVNSet[5] = AddTextOption("$Armor piece 05", SSNVNSet[5])
		Else
			AddTextOption("$Disabled", none)
		Endif
			SetCursorPosition(1)
		If (OnOffNVN == "$Enabled")
			AddHeaderOption("")
			oidNVNKDtype = AddTextOption("$Type of knock down", NVNKDtype)
			oidEveryoneNVN = AddToggleOption("$Can be knocked down by everyone", EveryoneNVN)
			oidKDTimeNVN = AddSliderOption("$Knock down duration", KDTimeNVN, "{0} seconds")
			AddHeaderOption("$Settings for followers")
			oidAllowCvic = AddToggleOption("$Followers as victims", AllowCvic)
			oidAllowCagg = AddToggleOption("$Followers as aggressors", AllowCagg)
			oidThresholdFollower = AddSliderOption("$Health", ThresholdFollower, "{0} %", AllowCvicFlag)
			oidCOHFollower = AddSliderOption("$Chance on hit", COHFollower, "{0} %", AllowCvicFlag)
			oidNVNRapedFollower = AddSliderOption("$Sexual assault chance", NVNRapedFollower, "{0} %", AllowCvicFlag)
			oidSatisfiedFollower = AddSliderOption("$Satisfied", SatisfiedFollower, "{0} seconds", AllowCvicFlag)
			oidDialoguesNVNFollower = AddToggleOption("$Follower commentaries", DialoguesNVNFollower)
			oidNVN3wayAutoFollower = AddSliderOption("$Auto threesome distance", NVN3wayAutoFollower, "{0} units")
			oidNVNRobbedFollower = AddSliderOption("$Rob assault chance", NVNRobbedFollower, "{0} %", AllowCvicFlag)
			oidNVNKillFollower = AddSliderOption("$Kill assault chance", NVNKillFollower, "{0} %", AllowCvicFlag)
			AddHeaderOption("$Sexual assault by Creature")
			oidCreaOnFemale = AddToggleOption("$Male creature vs Female", CreaOnFemale)
			oidCreaOnMale = AddToggleOption("$Male creature vs Male", CreaOnMale)
			oidCreaFemaleOnMale = AddToggleOption("$Female creature vs Male", CreaFemaleOnMale)
			oidCreaFemaleOnFemale = AddToggleOption("$Female creature vs Female", CreaFemaleOnFemale)
			oidCreaRaceEnableNVN = AddTextOption("$List of enabled races", "$CLICK")
			oidCreaRaceDisableNVN = AddTextOption("$List of disabled races", "$CLICK")
			oidGbCrChanceNVN = AddSliderOption("$Multiple Chance", GbCrChanceNVN, "{0} %")
			AddHeaderOption("$Post-Assault for followers")
			oidNVNTraumaCvic = AddSliderOption("$Trauma", NVNTraumaCvic, "{0} seconds")
			oidNVNExhaustedCvic = AddSliderOption("$Exhausted", NVNExhaustedCvic, "{0} seconds")
			oidEscapeCvic = AddSliderOption("$Escape", EscapeCvic, "{0} seconds")
			oidDebuffDurationNVNCvic = AddSliderOption("$Weakened", DebuffDurationNVNCvic, "{0} seconds")
			oidNVNRobbedPAFollower = AddSliderOption("$Post-assault rob", NVNRobbedPAFollower, "{0} %")
			oidNVNKillPAFollower = AddSliderOption("$Post-assault kill", NVNKillPAFollower, "{0} %")
			oidbRedressFollower = AddToggleOption("$Redress", bRedressFollower)
			AddHeaderOption("")
			oidCheckSlots = AddTextOption("$Check equipped item slots", "$CLICK")
			Int i
			While (i < 5)
				oidSSNVN[i] = AddSliderOption(">>>>>", SSNVN[i], "{0}"+SlotNames[(SSNVN[i] As Int) - 30])
				i += 1
			EndWhile
		Endif
	Elseif (Page == "$Animation settings")
		SetCursorFillMode(TOP_TO_BOTTOM)
		If (ModStatus == "$Enabled")
			AddHeaderOption("$General scene options")
			oidHitInterrupt = AddToggleOption("$Sex scene interrupt - Hit", HitInterrupt)
			oidCombatInterrupt = AddToggleOption("$Sex scene interrupt - Combat", CombatInterrupt)
			AddHeaderOption("$SexLab scenes settings")
			oidAnimSettingsPage = AddTextOption("$----------------------- Change page -----------------------", "$Click")
			If (AnimationSettingsPage == 0)
				AddHeaderOption("$Consensual")
				AddTextOptionST("oidConsTag", "$Sex - Tag(s)", ConsTag)
				AddTextOptionST("oidConsSupressTag", "$Sex - Supress Tag(s)", ConsSupressTag)
				AddToggleOptionST("oidConsRequireAllTag", "$Sex - Require all tags", ConsRequireAllTag)
				AddToggleOptionST("oidConsFemaleFirst", "$Sex - Female first", ConsFemaleFirst)
				AddTextOptionST("oidConsFoMTag", "$Female/Male - Tag(s)", ConsFoMTag)
				AddTextOptionST("oidConsFoMSupressTag", "$Female/Male - Supress Tag(s)", ConsFoMSupressTag)
				AddToggleOptionST("oidConsFoMRequireAllTag", "$Female/Male - Require all tags", ConsFoMRequireAllTag)
				AddToggleOptionST("oidConsFoMFemaleFirst", "$Female/Male - Female first", ConsFoMFemaleFirst)
				AddTextOptionST("oidConsCreatureTag", "$Creature - Tag(s)", ConsCreatureTag)
				AddTextOptionST("oidConsCreatureSupressTag", "$Creature - Supress Tag(s)", ConsCreatureSupressTag)
				AddToggleOptionST("oidConsCreatureRequireAllTag", "$Creature - Require all tags", ConsCreatureRequireAllTag)
				AddEmptyOption()
			Elseif (AnimationSettingsPage == 1)
				AddHeaderOption("$Player as victim")
				AddTextOptionST("oidRapeTagPvic", "$Sexual assault - Tag(s)", RapeTagPvic)
				AddTextOptionST("oidRapeSupressTagPvic", "$Sexual assault - Supress Tag(s)", RapeSupressTagPvic)
				AddToggleOptionST("oidRapeRequireAllTagPvic", "$Sexual assault - Require all tags", RapeRequireAllTagPvic)
				AddToggleOptionST("oidRapeFemaleFirstPvic", "$Sexual assault - Female first", RapeFemaleFirstPvic)
				AddTextOptionST("oidFoMTagPvic", "$Female/Male - Tag(s)", FoMTagPvic)
				AddTextOptionST("oidFoMSupressTagPvic", "$Female/Male - Supress Tag(s)", FoMSupressTagPvic)
				AddToggleOptionST("oidFoMRequireAllTagPvic", "$Female/Male - Require all tags", FoMRequireAllTagPvic)
				AddToggleOptionST("oidFoMFemaleFirstPvic", "$Female/Male - Female first", FoMFemaleFirstPvic)
				AddTextOptionST("oidTiedTagPvic", "$Tied - Tag(s)", TiedTagPvic)
				AddTextOptionST("oidTiedSupressTagPvic", "$Tied - Supress Tag(s)", TiedSupressTagPvic)
				AddToggleOptionST("oidTiedRequireAllTagPvic", "$Tied - Require all tags", TiedRequireAllTagPvic)
				AddToggleOptionST("oidTiedFemaleFirstPvic", "$Tied - Female first", TiedFemaleFirstPvic)
				AddTextOptionST("oidCreatureTagPvic", "$Creature - Tag(s)", CreatureTagPvic)
				AddTextOptionST("oidCreatureSupressTagPvic", "$Creature - Supress Tag(s)", CreatureSupressTagPvic)
				AddToggleOptionST("oidCreatureRequireAllTagPvic", "$Creature - Require all tags", CreatureRequireAllTagPvic)
				AddToggleOptionST("oidMultipleIgnoreGTCreaPvic", "$Creature - Ignore gender tag", MultipleIgnoreGTCreaPvic)
				AddEmptyOption()
			Elseif (AnimationSettingsPage == 2)
				AddHeaderOption("$Player/Follower aggressor")
				AddTextOptionST("oidRapeTagPagg", "$Sexual assault - Tag(s)", RapeTagPagg)
				AddTextOptionST("oidRapeSupressTagPagg", "$Sexual assault - Supress Tag(s)", RapeSupressTagPagg)
				AddToggleOptionST("oidRapeRequireAllTagPagg", "$Sexual assault - Require all tags", RapeRequireAllTagPagg)
				AddToggleOptionST("oidRapeFemaleFirstPagg", "$Sexual assault - Female first", RapeFemaleFirstPagg)
				AddTextOptionST("oidFoMTagPagg", "$Female/Male - Tag(s)", FoMTagPagg)
				AddTextOptionST("oidFoMSupressTagPagg", "$Female/Male - Supress Tag(s)", FoMSupressTagPagg)
				AddToggleOptionST("oidFoMRequireAllTagPagg", "$Female/Male - Require all tags", FoMRequireAllTagPagg)
				AddToggleOptionST("oidFoMFemaleFirstPagg", "$Sexual assault - Female first", FoMFemaleFirstPagg)
				AddTextOptionST("oidTiedTagPagg", "$Tied - Tag(s)", TiedTagPagg)
				AddTextOptionST("oidTiedSupressTagPagg", "$Tied - Supress Tag(s)", TiedSupressTagPagg)
				AddToggleOptionST("oidTiedRequireAllTagPagg", "$Tied - Require all tags", TiedRequireAllTagPagg)
				AddToggleOptionST("oidTiedFemaleFirstPagg", "$Tied - Female first", TiedFemaleFirstPagg)
				AddTextOptionST("oidCreatureTagPagg", "$Creature - Tag(s)", CreatureTagPagg)
				AddTextOptionST("oidCreatureSupressTagPagg", "$Creature - Supress Tag(s)", CreatureSupressTagPagg)
				AddToggleOptionST("oidCreatureRequireAllTagPagg", "$Creature - Require all tags", CreatureRequireAllTagPagg)
				AddToggleOptionST("oidMultipleIgnoreGTCreaPagg", "$Creature - Ignore gender tag", MultipleIgnoreGTCreaPagg)				
				AddEmptyOption()
			Elseif (AnimationSettingsPage == 3)					
				AddHeaderOption("$NPC vs NPC")
				AddTextOptionST("oidRapeTagNVN", "$Sexual assault - Tag(s)", RapeTagNVN)
				AddTextOptionST("oidRapeSupressTagNVN", "$Sexual assault - Supress Tag(s)", RapeSupressTagNVN)
				AddToggleOptionST("oidRapeRequireAllTagNVN", "$Sexual assault - Require all tags", RapeRequireAllTagNVN)
				AddToggleOptionST("oidRapeFemaleFirstNVN", "$Sexual assault - Female first", RapeFemaleFirstNVN)
				AddTextOptionST("oidFoMTagNVN", "$Female/Male - Tag(s)", FoMTagNVN)
				AddTextOptionST("oidFoMSupressTagNVN", "$Female/Male - Supress Tag(s)", FoMSupressTagNVN)
				AddToggleOptionST("oidFoMRequireAllTagNVN", "$Female/Male - Require all tags", FoMRequireAllTagNVN)
				AddToggleOptionST("oidFoMFemaleFirstNVN", "$Female/Male - Female first", FoMFemaleFirstNVN)
				AddTextOptionST("oidTiedTagNVN", "$Tied - Tag(s)", TiedTagNVN)
				AddTextOptionST("oidTiedSupressTagNVN", "$Tied - Supress Tag(s)", TiedSupressTagNVN)
				AddToggleOptionST("oidTiedRequireAllTagNVN", "$Tied - Require all tags", TiedRequireAllTagNVN)
				AddToggleOptionST("oidTiedFemaleFirstNVN", "$Tied - Female first", TiedFemaleFirstNVN)
				AddTextOptionST("oidCreatureTagNVN", "$Creature - Tag(s)", CreatureTagNVN)
				AddTextOptionST("oidCreatureSupressTagNVN", "$Creature - Supress Tag(s)", CreatureSupressTagNVN)
				AddToggleOptionST("oidCreatureRequireAllTagNVN", "$Creature - Require all tags", CreatureRequireAllTagNVN)
				AddToggleOptionST("oidMultipleIgnoreGTCreaNVN", "$Creature - Ignore gender tag", MultipleIgnoreGTCreaNVN)
				AddEmptyOption()
			Endif
		Else
			AddTextOption("$Disabled", none)
		Endif
		SetCursorPosition(1)
		If (ModStatus == "$Enabled")
			AddHeaderOption("")
			AddEmptyOption()
			AddEmptyOption()
			AddHeaderOption("")
			AddEmptyOption()
			If (AnimationSettingsPage == 0)
				AddHeaderOption("")
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddTextOptionST("oidConsFoFTag", "$Female/Female - Tag(s)", ConsFoFTag)
				AddTextOptionST("oidConsFoFSupressTag", "$Female/Female - Supress Tag(s)", ConsFoFSupressTag)
				AddToggleOptionST("oidConsFoFRequireAllTag", "$Female/Female - Require all tags", ConsFoFRequireAllTag)
				AddToggleOptionST("oidConsFoFFemaleFirst", "$Female/Female - Female first", ConsFoFFemaleFirst)
				AddTextOptionST("oidConsMultipleTag", "$Multiple - Tag(s)", ConsMultipleTag)
				AddTextOptionST("oidConsMultipleSupressTag", "$Multiple - Supress Tag(s)", ConsMultipleSupressTag)
				AddToggleOptionST("oidConsMultipleRequireAllTag", "$Multiple - Require all tags", ConsMultipleRequireAllTag)
				AddToggleOptionST("oidConsMultipleFemaleFirst", "$Multiple - Female first", ConsMultipleFemaleFirst)
			Elseif (AnimationSettingsPage == 1)				
				AddHeaderOption("")
				AddTextOptionST("oidKOTagPvic", "$Unconscious - Tag(s)", KOTagPvic)
				AddTextOptionST("oidKOSupressTagPvic", "$Unconscious - Supress Tag(s)", KOSupressTagPvic)
				AddToggleOptionST("oidKORequireAllTagPvic", "$Unconscious - Require all tags", KORequireAllTagPvic)
				AddToggleOptionST("oidKOFemaleFirstPvic", "$Unconscious - Female first", KOFemaleFirstPvic)
				AddTextOptionST("oidFoFTagPvic", "$Female/Female - Tag(s)", FoFTagPvic)
				AddTextOptionST("oidFoFSupressTagPvic", "$Female/Female - Supress Tag(s)", FoFSupressTagPvic)
				AddToggleOptionST("oidFoFRequireAllTagPvic", "$Female/Female - Require all tags", FoFRequireAllTagPvic)
				AddToggleOptionST("oidFoFFemaleFirstPvic", "$Female/Female - Female first", FoFFemaleFirstPvic)
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddTextOptionST("oidMultipleTagPvic", "$Multiple - Tag(s)", MultipleTagPvic)
				AddTextOptionST("oidMultipleSupressTagPvic", "$Multiple - Supress Tag(s)", MultipleSupressTagPvic)
				AddToggleOptionST("oidMultipleRequireAllTagPvic", "$Multiple - Require all tags", MultipleRequireAllTagPvic)
				AddToggleOptionST("oidMultipleFemaleFirstPvic", "$Multiple - Female first", MultipleFemaleFirstPvic)
				AddToggleOptionST("oidMultipleIgnoreGTPvic", "$Multiple - Ignore gender tag", MultipleIgnoreGTPvic)
			Elseif (AnimationSettingsPage == 2)
				AddHeaderOption("")
				AddTextOptionST("oidNecroTagPagg", "$Necrophilia - Tag(s)", NecroTagPagg)
				AddTextOptionST("oidNecroSupressTagPagg", "$Necrophilia - Supress Tag(s)", NecroSupressTagPagg)
				AddToggleOptionST("oidNecroRequireAllTagPagg", "$Necrophilia - Require all tags", NecroRequireAllTagPagg)
				AddToggleOptionST("oidNecroFemaleFirstPagg", "$Necrophilia - Female first", NecroFemaleFirstPagg)
				AddTextOptionST("oidFoFTagPagg", "$Female/Female - Tag(s)", FoFTagPagg)
				AddTextOptionST("oidFoFSupressTagPagg", "$Female/Female - Supress Tag(s)", FoFSupressTagPagg)
				AddToggleOptionST("oidFoFRequireAllTagPagg", "$Female/Female - Require all tags", FoFRequireAllTagPagg)
				AddToggleOptionST("oidFoFFemaleFirstPagg", "$Female/Female - Female first", FoFFemaleFirstPagg)
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddTextOptionST("oidMultipleTagPagg", "$Multiple - Tag(s)", MultipleTagPagg)
				AddTextOptionST("oidMultipleSupressTagPagg", "$Multiple - Supress Tag(s)", MultipleSupressTagPagg)
				AddToggleOptionST("oidMultipleRequireAllTagPagg", "$Multiple - Require all tags", MultipleRequireAllTagPagg)
				AddToggleOptionST("oidMultipleFemaleFirstPagg", "$Multiple - Female first", MultipleFemaleFirstPagg)
				AddToggleOptionST("oidMultipleIgnoreGTPagg", "$Multiple - Ignore gender tag", MultipleIgnoreGTPagg)
			Elseif (AnimationSettingsPage == 3)			
				AddHeaderOption("")
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddTextOptionST("oidFoFTagNVN", "$Female/Female - Tag(s)", FoFTagNVN)
				AddTextOptionST("oidFoFSupressTagNVN", "$Female/Female - Supress Tag(s)", FoFSupressTagNVN)
				AddToggleOptionST("oidFoFRequireAllTagNVN", "$Female/Female - Require all tags", FoFRequireAllTagNVN)
				AddToggleOptionST("oidFoFFemaleFirstNVN", "$Female/Female - Female first", FoFFemaleFirstNVN)
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddEmptyOption()
				AddTextOptionST("oidMultipleTagNVN", "$Multiple - Tag(s)", MultipleTagNVN)
				AddTextOptionST("oidMultipleSupressTagNVN", "$Multiple - Supress Tag(s)", MultipleSupressTagNVN)
				AddToggleOptionST("oidMultipleRequireAllTagNVN", "$Multiple - Require all tags", MultipleRequireAllTagNVN)
				AddToggleOptionST("oidMultipleFemaleFirstNVN", "$Multiple - Female first", MultipleFemaleFirstNVN)
				AddToggleOptionST("oidMultipleIgnoreGTNVN", "$Multiple - Ignore gender tag", MultipleIgnoreGTNVN)
			Endif
		Endif
	Endif	
EndEvent

State oidConsTag
	Event OnSelectST()
		ConsTag = RessConfig.SetTags(ConsTag)
		SetTextOptionValueST(ConsTag)
	EndEvent
	Event OnDefaultST()
		If (ConsTag != "")
			ConsTag = ""
		Else
			ConsTag = ""
		Endif
		SetTextOptionValueST(ConsTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidConsSupressTag
	Event OnSelectST()
		ConsSupressTag = RessConfig.SetTags(ConsSupressTag)
		SetTextOptionValueST(ConsSupressTag)
	EndEvent
	Event OnDefaultST()
		If (ConsSupressTag != "")
			ConsSupressTag = ""
		Else
			ConsSupressTag = "aggressive"
		Endif
		SetTextOptionValueST(ConsSupressTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidConsRequireAllTag
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(ConsTag, ConsSupressTag, ConsRequireAllTag)
		Else
			ConsRequireAllTag = !ConsRequireAllTag
			SetToggleOptionValueST(ConsRequireAllTag)
		Endif
	EndEvent
	Event OnDefaultST()
		ConsRequireAllTag = true
		SetToggleOptionValueST(ConsRequireAllTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidConsFemaleFirst
	Event OnSelectST()
		ConsFemaleFirst = !ConsFemaleFirst
		SetToggleOptionValueST(ConsFemaleFirst)
	EndEvent
	Event OnDefaultST()
		ConsFemaleFirst = false
		SetToggleOptionValueST(ConsFemaleFirst)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidConsFoMTag
	Event OnSelectST()
		ConsFoMTag = RessConfig.SetTags(ConsFoMTag)
		SetTextOptionValueST(ConsFoMTag)
	EndEvent
	Event OnDefaultST()
		If (ConsFoMTag != "")
			ConsFoMTag = ""
		Else
			ConsFoMTag = "cowgirl"
		Endif
		SetTextOptionValueST(ConsFoMTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidConsFoMSupressTag
	Event OnSelectST()
		ConsFoMSupressTag = RessConfig.SetTags(ConsFoMSupressTag)
		SetTextOptionValueST(ConsFoMSupressTag)
	EndEvent
	Event OnDefaultST()
		If (ConsFoMSupressTag != "")
			ConsFoMSupressTag = ""
		Else
			ConsFoMSupressTag = "aggressive"
		Endif
		SetTextOptionValueST(ConsFoMSupressTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidConsFoMRequireAllTag
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(ConsFoMTag, ConsFoMSupressTag, ConsFoMRequireAllTag)
		Else
			ConsFoMRequireAllTag = !ConsFoMRequireAllTag
			SetToggleOptionValueST(ConsFoMRequireAllTag)
		Endif
	EndEvent
	Event OnDefaultST()
		ConsFoMRequireAllTag = true
		SetToggleOptionValueST(ConsFoMRequireAllTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidConsFoMFemaleFirst
	Event OnSelectST()
		ConsFoMFemaleFirst = !ConsFoMFemaleFirst
		SetToggleOptionValueST(ConsFoMFemaleFirst)
	EndEvent
	Event OnDefaultST()
		ConsFoMFemaleFirst = true
		SetToggleOptionValueST(ConsFoMFemaleFirst)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidConsFoFTag
	Event OnSelectST()
		ConsFoFTag = RessConfig.SetTags(ConsFoFTag)
		SetTextOptionValueST(ConsFoFTag)
	EndEvent
	Event OnDefaultST()
		If (ConsFoFTag != "")
			ConsFoFTag = ""
		Else
			ConsFoFTag = "lesbian"
		Endif
		SetTextOptionValueST(ConsFoFTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidConsFoFSupressTag
	Event OnSelectST()
		ConsFoFSupressTag = RessConfig.SetTags(ConsFoFSupressTag)
		SetTextOptionValueST(ConsFoFSupressTag)
	EndEvent
	Event OnDefaultST()
		If (ConsFoFSupressTag != "")
			ConsFoFSupressTag = ""
		Else
			ConsFoFSupressTag = "aggressive"
		Endif
		SetTextOptionValueST(ConsFoFSupressTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidConsFoFRequireAllTag
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(ConsFoFTag, ConsFoFSupressTag, ConsFoFRequireAllTag)
		Else
			ConsFoFRequireAllTag = !ConsFoFRequireAllTag
			SetToggleOptionValueST(ConsFoFRequireAllTag)
		Endif
	EndEvent
	Event OnDefaultST()
		ConsFoFRequireAllTag = true
		SetToggleOptionValueST(ConsFoFRequireAllTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidConsFoFFemaleFirst
	Event OnSelectST()
		ConsFoFFemaleFirst = !ConsFoFFemaleFirst
		SetToggleOptionValueST(ConsFoFFemaleFirst)
	EndEvent
	Event OnDefaultST()
		ConsFoFFemaleFirst = false
		SetToggleOptionValueST(ConsFoFFemaleFirst)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidConsCreatureTag
	Event OnSelectST()
		ConsCreatureTag = RessConfig.SetTags(ConsCreatureTag)
		SetTextOptionValueST(ConsCreatureTag)
	EndEvent
	Event OnDefaultST()
		If (ConsCreatureTag != "")
			ConsCreatureTag = ""
		Else
			ConsCreatureTag = ""
		Endif
		SetTextOptionValueST(ConsCreatureTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidConsCreatureSupressTag
	Event OnSelectST()
		ConsCreatureSupressTag = RessConfig.SetTags(ConsCreatureSupressTag)
		SetTextOptionValueST(ConsCreatureSupressTag)
	EndEvent
	Event OnDefaultST()
		If (ConsCreatureSupressTag != "")
			ConsCreatureSupressTag = ""
		Else
			ConsCreatureSupressTag = "aggressive"
		Endif
		SetTextOptionValueST(ConsCreatureSupressTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidConsCreatureRequireAllTag
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(ConsCreatureTag, ConsCreatureSupressTag, ConsCreatureRequireAllTag, IsCreature = True)
		Else
			ConsCreatureRequireAllTag = !ConsCreatureRequireAllTag
			SetToggleOptionValueST(ConsCreatureRequireAllTag)
		Endif
	EndEvent
	Event OnDefaultST()
		ConsCreatureRequireAllTag = true
		SetToggleOptionValueST(ConsCreatureRequireAllTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidConsMultipleTag
	Event OnSelectST()
		ConsMultipleTag = RessConfig.SetTags(ConsMultipleTag)
		SetTextOptionValueST(ConsMultipleTag)
	EndEvent
	Event OnDefaultST()
		If (ConsMultipleTag != "")
			ConsMultipleTag = ""
		Else
			ConsMultipleTag = ""
		Endif
		SetTextOptionValueST(ConsMultipleTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidConsMultipleSupressTag
	Event OnSelectST()
		ConsMultipleSupressTag = RessConfig.SetTags(ConsMultipleSupressTag)
		SetTextOptionValueST(ConsMultipleSupressTag)
	EndEvent
	Event OnDefaultST()
		If (ConsMultipleSupressTag != "")
			ConsMultipleSupressTag = ""
		Else
			ConsMultipleSupressTag = "aggressive"
		Endif
		SetTextOptionValueST(ConsMultipleSupressTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidConsMultipleRequireAllTag
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(ConsMultipleTag, ConsMultipleSupressTag, ConsMultipleRequireAllTag, 3)
		Else
			ConsMultipleRequireAllTag = !ConsMultipleRequireAllTag
			SetToggleOptionValueST(ConsMultipleRequireAllTag)
		Endif
	EndEvent
	Event OnDefaultST()
		ConsMultipleRequireAllTag = true
		SetToggleOptionValueST(ConsMultipleRequireAllTag)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidConsMultipleFemaleFirst
	Event OnSelectST()
		ConsMultipleFemaleFirst = !ConsMultipleFemaleFirst
		SetToggleOptionValueST(ConsMultipleFemaleFirst)
	EndEvent
	Event OnDefaultST()
		ConsMultipleFemaleFirst = true
		SetToggleOptionValueST(ConsMultipleFemaleFirst)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidRapeTagPvic
	Event OnSelectST()
		RapeTagPvic = RessConfig.SetTags(RapeTagPvic)
		SetTextOptionValueST(RapeTagPvic)
	EndEvent
	Event OnDefaultST()
		If (RapeTagPvic != "")
			RapeTagPvic = ""
		Else
			RapeTagPvic = "aggressive"
		Endif
		SetTextOptionValueST(RapeTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidRapeSupressTagPvic
	Event OnSelectST()
		RapeSupressTagPvic = RessConfig.SetTags(RapeSupressTagPvic)
		SetTextOptionValueST(RapeSupressTagPvic)
	EndEvent
	Event OnDefaultST()
		If (RapeSupressTagPvic != "")
			RapeSupressTagPvic = ""
		Else
			RapeSupressTagPvic = "sleeping,necro,cowgirl"
		Endif
		SetTextOptionValueST(RapeSupressTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidRapeRequireAllTagPvic
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(RapeTagPvic, RapeSupressTagPvic, RapeRequireAllTagPvic)
		Else
			RapeRequireAllTagPvic = !RapeRequireAllTagPvic
			SetToggleOptionValueST(RapeRequireAllTagPvic)
		Endif
	EndEvent
	Event OnDefaultST()
		RapeRequireAllTagPvic = true
		SetToggleOptionValueST(RapeRequireAllTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidRapeFemaleFirstPvic
	Event OnSelectST()
		RapeFemaleFirstPvic = !RapeFemaleFirstPvic
		SetToggleOptionValueST(RapeFemaleFirstPvic)
	EndEvent
	Event OnDefaultST()
		RapeFemaleFirstPvic = false
		SetToggleOptionValueST(RapeFemaleFirstPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidKOTagPvic
	Event OnSelectST()
		KOTagPvic = RessConfig.SetTags(KOTagPvic)
		SetTextOptionValueST(KOTagPvic)
	EndEvent
	Event OnDefaultST()
		If (KOTagPvic != "")
			KOTagPvic = ""
		Else
			KOTagPvic = "sleeping"
		Endif
		SetTextOptionValueST(KOTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidKOSupressTagPvic
	Event OnSelectST()
		KOSupressTagPvic = RessConfig.SetTags(KOSupressTagPvic)
		SetTextOptionValueST(KOSupressTagPvic)
	EndEvent
	Event OnDefaultST()
		If (KOSupressTagPvic != "")
			KOSupressTagPvic = ""
		Else
			KOSupressTagPvic = ""
		Endif
		SetTextOptionValueST(KOSupressTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidKORequireAllTagPvic
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(KOTagPvic, KOSupressTagPvic, KORequireAllTagPvic)
		Else
			KORequireAllTagPvic = !KORequireAllTagPvic
			SetToggleOptionValueST(KORequireAllTagPvic)
		Endif
	EndEvent
	Event OnDefaultST()
		KORequireAllTagPvic = true
		SetToggleOptionValueST(KORequireAllTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidKOFemaleFirstPvic
	Event OnSelectST()
		KOFemaleFirstPvic = !KOFemaleFirstPvic
		SetToggleOptionValueST(KOFemaleFirstPvic)
	EndEvent
	Event OnDefaultST()
		KOFemaleFirstPvic = false
		SetToggleOptionValueST(KOFemaleFirstPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidFoMTagPvic
	Event OnSelectST()
		FoMTagPvic = RessConfig.SetTags(FoMTagPvic)
		SetTextOptionValueST(FoMTagPvic)
	EndEvent
	Event OnDefaultST()
		If (FoMTagPvic != "")
			FoMTagPvic = ""
		Else
			FoMTagPvic = "cowgirl"
		Endif
		SetTextOptionValueST(FoMTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidFoMSupressTagPvic
	Event OnSelectST()
		FoMSupressTagPvic = RessConfig.SetTags(FoMSupressTagPvic)
		SetTextOptionValueST(FoMSupressTagPvic)
	EndEvent
	Event OnDefaultST()
		If (FoMSupressTagPvic != "")
			FoMSupressTagPvic = ""
		Else
			FoMSupressTagPvic = ""
		Endif
		SetTextOptionValueST(FoMSupressTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidFoMRequireAllTagPvic
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(FoMTagPvic, FoMSupressTagPvic, FoMRequireAllTagPvic)
		Else
			FoMRequireAllTagPvic = !FoMRequireAllTagPvic
			SetToggleOptionValueST(FoMRequireAllTagPvic)
		Endif
	EndEvent
	Event OnDefaultST()
		FoMRequireAllTagPvic = true
		SetToggleOptionValueST(FoMRequireAllTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidFoMFemaleFirstPvic
	Event OnSelectST()
		FoMFemaleFirstPvic = !FoMFemaleFirstPvic
		SetToggleOptionValueST(FoMFemaleFirstPvic)
	EndEvent
	Event OnDefaultST()
		FoMFemaleFirstPvic = true
		SetToggleOptionValueST(FoMFemaleFirstPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidFoFTagPvic
	Event OnSelectST()
		FoFTagPvic = RessConfig.SetTags(FoFTagPvic)
		SetTextOptionValueST(FoFTagPvic)
	EndEvent
	Event OnDefaultST()
		If (FoFTagPvic != "")
			FoFTagPvic = ""
		Else
			FoFTagPvic = "lesbian"
		Endif
		SetTextOptionValueST(FoFTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidFoFSupressTagPvic
	Event OnSelectST()
		FoFSupressTagPvic = RessConfig.SetTags(FoFSupressTagPvic)
		SetTextOptionValueST(FoFSupressTagPvic)
	EndEvent
	Event OnDefaultST()
		If (FoFSupressTagPvic != "")
			FoFSupressTagPvic = ""
		Else
			FoFSupressTagPvic = ""
		Endif
		SetTextOptionValueST(FoFSupressTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidFoFRequireAllTagPvic
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(FoFTagPvic, FoFSupressTagPvic, FoFRequireAllTagPvic)
		Else
			FoFRequireAllTagPvic = !FoFRequireAllTagPvic
			SetToggleOptionValueST(FoFRequireAllTagPvic)
		Endif
	EndEvent
	Event OnDefaultST()
		FoFRequireAllTagPvic = true
		SetToggleOptionValueST(FoFRequireAllTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidFoFFemaleFirstPvic
	Event OnSelectST()
		FoFFemaleFirstPvic = !FoFFemaleFirstPvic
		SetToggleOptionValueST(FoFFemaleFirstPvic)
	EndEvent
	Event OnDefaultST()
		FoFFemaleFirstPvic = false
		SetToggleOptionValueST(FoFFemaleFirstPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidTiedTagPvic
	Event OnSelectST()
		TiedTagPvic = RessConfig.SetTags(TiedTagPvic)
		SetTextOptionValueST(TiedTagPvic)
	EndEvent
	Event OnDefaultST()
		If (TiedTagPvic != "")
			TiedTagPvic = ""
		Else
			TiedTagPvic = "aggressive,bound"
		Endif
		SetTextOptionValueST(TiedTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidTiedSupressTagPvic
	Event OnSelectST()
		TiedSupressTagPvic = RessConfig.SetTags(TiedSupressTagPvic)
		SetTextOptionValueST(TiedSupressTagPvic)
	EndEvent
	Event OnDefaultST()
		If (TiedSupressTagPvic != "")
			TiedSupressTagPvic = ""
		Else
			TiedSupressTagPvic = "subsub,pillory"
		Endif
		SetTextOptionValueST(TiedSupressTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidTiedRequireAllTagPvic
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(TiedTagPvic, TiedSupressTagPvic, TiedRequireAllTagPvic)
		Else
			TiedRequireAllTagPvic = !TiedRequireAllTagPvic
			SetToggleOptionValueST(TiedRequireAllTagPvic)
		Endif
	EndEvent
	Event OnDefaultST()
		TiedRequireAllTagPvic = true
		SetToggleOptionValueST(TiedRequireAllTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidTiedFemaleFirstPvic
	Event OnSelectST()
		TiedFemaleFirstPvic = !TiedFemaleFirstPvic
		SetToggleOptionValueST(TiedFemaleFirstPvic)
	EndEvent
	Event OnDefaultST()
		TiedFemaleFirstPvic = false
		SetToggleOptionValueST(TiedFemaleFirstPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidCreatureTagPvic
	Event OnSelectST()
		CreatureTagPvic = RessConfig.SetTags(CreatureTagPvic)
		SetTextOptionValueST(CreatureTagPvic)
	EndEvent
	Event OnDefaultST()
		If (CreatureTagPvic != "")
			CreatureTagPvic = ""
		Else
			CreatureTagPvic = ""
		Endif
		SetTextOptionValueST(CreatureTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidCreatureSupressTagPvic
	Event OnSelectST()
		CreatureSupressTagPvic = RessConfig.SetTags(CreatureSupressTagPvic)
		SetTextOptionValueST(CreatureSupressTagPvic)
	EndEvent
	Event OnDefaultST()
		If (CreatureSupressTagPvic != "")
			CreatureSupressTagPvic = ""
		Else
			CreatureSupressTagPvic = ""
		Endif
		SetTextOptionValueST(CreatureSupressTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidCreatureRequireAllTagPvic
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(CreatureTagPvic, CreatureSupressTagPvic, CreatureRequireAllTagPvic, IsCreature = True)
		Else
			CreatureRequireAllTagPvic = !CreatureRequireAllTagPvic
			SetToggleOptionValueST(CreatureRequireAllTagPvic)
		Endif
	EndEvent
	Event OnDefaultST()
		CreatureRequireAllTagPvic = true
		SetToggleOptionValueST(CreatureRequireAllTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidMultipleTagPvic
	Event OnSelectST()
		MultipleTagPvic = RessConfig.SetTags(MultipleTagPvic)
		SetTextOptionValueST(MultipleTagPvic)
	EndEvent
	Event OnDefaultST()
		If (MultipleTagPvic != "")
			MultipleTagPvic = ""
		Else
			MultipleTagPvic = "aggressive"
		Endif
		SetTextOptionValueST(MultipleTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidMultipleSupressTagPvic
	Event OnSelectST()
		MultipleSupressTagPvic = RessConfig.SetTags(MultipleSupressTagPvic)
		SetTextOptionValueST(MultipleSupressTagPvic)
	EndEvent
	Event OnDefaultST()
		If (MultipleSupressTagPvic != "")
			MultipleSupressTagPvic = ""
		Else
			MultipleSupressTagPvic = ""
		Endif
		SetTextOptionValueST(MultipleSupressTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidMultipleRequireAllTagPvic
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(MultipleTagPvic, MultipleSupressTagPvic, MultipleRequireAllTagPvic, 3)
		Else
			MultipleRequireAllTagPvic = !MultipleRequireAllTagPvic
			SetToggleOptionValueST(MultipleRequireAllTagPvic)
		Endif
	EndEvent
	Event OnDefaultST()
		MultipleRequireAllTagPvic = true
		SetToggleOptionValueST(MultipleRequireAllTagPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidMultipleFemaleFirstPvic
	Event OnSelectST()
		MultipleFemaleFirstPvic = !MultipleFemaleFirstPvic
		SetToggleOptionValueST(MultipleFemaleFirstPvic)
	EndEvent
	Event OnDefaultST()
		MultipleFemaleFirstPvic = true
		SetToggleOptionValueST(MultipleFemaleFirstPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidMultipleIgnoreGTPvic
	Event OnSelectST()
		MultipleIgnoreGTPvic = !MultipleIgnoreGTPvic
		SetToggleOptionValueST(MultipleIgnoreGTPvic)
	EndEvent
	Event OnDefaultST()
		MultipleIgnoreGTPvic = false
		SetToggleOptionValueST(MultipleIgnoreGTPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_MultipleIgnoreGTPvic")
	EndEvent
EndState
State oidMultipleIgnoreGTCreaPvic
	Event OnSelectST()
		MultipleIgnoreGTCreaPvic = !MultipleIgnoreGTCreaPvic
		SetToggleOptionValueST(MultipleIgnoreGTCreaPvic)
	EndEvent
	Event OnDefaultST()
		MultipleIgnoreGTCreaPvic = false
		SetToggleOptionValueST(MultipleIgnoreGTCreaPvic)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_MultipleIgnoreGTCrea")
	EndEvent
EndState
State oidMultipleIgnoreGTCreaPagg
	Event OnSelectST()
		MultipleIgnoreGTCreaPagg = !MultipleIgnoreGTCreaPagg
		SetToggleOptionValueST(MultipleIgnoreGTCreaPagg)
	EndEvent
	Event OnDefaultST()
		MultipleIgnoreGTCreaPagg = false
		SetToggleOptionValueST(MultipleIgnoreGTCreaPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_MultipleIgnoreGTCrea")
	EndEvent
EndState
State oidMultipleIgnoreGTCreaNVN
	Event OnSelectST()
		MultipleIgnoreGTCreaNVN = !MultipleIgnoreGTCreaNVN
		SetToggleOptionValueST(MultipleIgnoreGTCreaNVN)
	EndEvent
	Event OnDefaultST()
		MultipleIgnoreGTCreaNVN = false
		SetToggleOptionValueST(MultipleIgnoreGTCreaNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_MultipleIgnoreGTCrea")
	EndEvent
EndState
State oidRapeTagPagg
	Event OnSelectST()
		RapeTagPagg = RessConfig.SetTags(RapeTagPagg)
		SetTextOptionValueST(RapeTagPagg)
	EndEvent
	Event OnDefaultST()
		If (RapeTagPagg != "")
			RapeTagPagg = ""
		Else
			RapeTagPagg = "aggressive"
		Endif
		SetTextOptionValueST(RapeTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidRapeSupressTagPagg
	Event OnSelectST()
		RapeSupressTagPagg = RessConfig.SetTags(RapeSupressTagPagg)
		SetTextOptionValueST(RapeSupressTagPagg)
	EndEvent
	Event OnDefaultST()
		If (RapeSupressTagPagg != "")
			RapeSupressTagPagg = ""
		Else
			RapeSupressTagPagg = "sleeping,necro,cowgirl"
		Endif
		SetTextOptionValueST(RapeSupressTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidRapeRequireAllTagPagg
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(RapeTagPagg, RapeSupressTagPagg, RapeRequireAllTagPagg)
		Else
			RapeRequireAllTagPagg = !RapeRequireAllTagPagg
			SetToggleOptionValueST(RapeRequireAllTagPagg)
		Endif
	EndEvent
	Event OnDefaultST()
		RapeRequireAllTagPagg = true
		SetToggleOptionValueST(RapeRequireAllTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidRapeFemaleFirstPagg
	Event OnSelectST()
		RapeFemaleFirstPagg = !RapeFemaleFirstPagg
		SetToggleOptionValueST(RapeFemaleFirstPagg)
	EndEvent
	Event OnDefaultST()
		RapeFemaleFirstPagg = false
		SetToggleOptionValueST(RapeFemaleFirstPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidNecroTagPagg
	Event OnSelectST()
		NecroTagPagg = RessConfig.SetTags(NecroTagPagg)
		SetTextOptionValueST(NecroTagPagg)
	EndEvent
	Event OnDefaultST()
		If (NecroTagPagg != "")
			NecroTagPagg = ""
		Else
			NecroTagPagg = "necro"
		Endif
		SetTextOptionValueST(NecroTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidNecroSupressTagPagg
	Event OnSelectST()
		NecroSupressTagPagg = RessConfig.SetTags(NecroSupressTagPagg)
		SetTextOptionValueST(NecroSupressTagPagg)
	EndEvent
	Event OnDefaultST()
		If (NecroSupressTagPagg != "")
			NecroSupressTagPagg = ""
		Else
			NecroSupressTagPagg = "cowgirl"
		Endif
		SetTextOptionValueST(NecroSupressTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidNecroRequireAllTagPagg
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(NecroTagPagg, NecroSupressTagPagg, NecroRequireAllTagPagg)
		Else
			NecroRequireAllTagPagg = !NecroRequireAllTagPagg
			SetToggleOptionValueST(NecroRequireAllTagPagg)				
		Endif
	EndEvent
	Event OnDefaultST()
		NecroRequireAllTagPagg = true
		SetToggleOptionValueST(NecroRequireAllTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidNecroFemaleFirstPagg
	Event OnSelectST()
		NecroFemaleFirstPagg = !NecroFemaleFirstPagg
		SetToggleOptionValueST(NecroFemaleFirstPagg)
	EndEvent
	Event OnDefaultST()
		NecroFemaleFirstPagg = false
		SetToggleOptionValueST(NecroFemaleFirstPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidFoMTagPagg
	Event OnSelectST()
		FoMTagPagg = RessConfig.SetTags(FoMTagPagg)
		SetTextOptionValueST(FoMTagPagg)
	EndEvent
	Event OnDefaultST()
		If (FoMTagPagg != "")
			FoMTagPagg = ""
		Else
			FoMTagPagg = "cowgirl"
		Endif
		SetTextOptionValueST(FoMTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidFoMSupressTagPagg
	Event OnSelectST()
		FoMSupressTagPagg = RessConfig.SetTags(FoMSupressTagPagg)
		SetTextOptionValueST(FoMSupressTagPagg)
	EndEvent
	Event OnDefaultST()
		If (FoMSupressTagPagg != "")
			FoMSupressTagPagg = ""
		Else
			FoMSupressTagPagg = ""
		Endif
		SetTextOptionValueST(FoMSupressTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidFoMRequireAllTagPagg
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(FoMTagPagg, FoMSupressTagPagg, FoMRequireAllTagPagg)
		Else
			FoMRequireAllTagPagg = !FoMRequireAllTagPagg
			SetToggleOptionValueST(FoMRequireAllTagPagg)
		Endif
	EndEvent
	Event OnDefaultST()
		FoMRequireAllTagPagg = true
		SetToggleOptionValueST(FoMRequireAllTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidFoMFemaleFirstPagg
	Event OnSelectST()
		FoMFemaleFirstPagg = !FoMFemaleFirstPagg
		SetToggleOptionValueST(FoMFemaleFirstPagg)
	EndEvent
	Event OnDefaultST()
		FoMFemaleFirstPagg = true
		SetToggleOptionValueST(FoMFemaleFirstPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidFoFTagPagg
	Event OnSelectST()
		FoFTagPagg = RessConfig.SetTags(FoFTagPagg)
		SetTextOptionValueST(FoFTagPagg)
	EndEvent
	Event OnDefaultST()
		If (FoFTagPagg != "")
			FoFTagPagg = ""
		Else
			FoFTagPagg = "lesbian"
		Endif
		SetTextOptionValueST(FoFTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidFoFSupressTagPagg
	Event OnSelectST()
		FoFSupressTagPagg = RessConfig.SetTags(FoFSupressTagPagg)
		SetTextOptionValueST(FoFSupressTagPagg)
	EndEvent
	Event OnDefaultST()
		If (FoFSupressTagPagg != "")
			FoFSupressTagPagg = ""
		Else
			FoFSupressTagPagg = ""
		Endif
		SetTextOptionValueST(FoFSupressTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidFoFRequireAllTagPagg
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(FoFTagPagg, FoFSupressTagPagg, FoFRequireAllTagPagg)
		Else
			FoFRequireAllTagPagg = !FoFRequireAllTagPagg
			SetToggleOptionValueST(FoFRequireAllTagPagg)
		Endif
	EndEvent
	Event OnDefaultST()
		FoFRequireAllTagPagg = true
		SetToggleOptionValueST(FoFRequireAllTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidFoFFemaleFirstPagg
	Event OnSelectST()
		FoFFemaleFirstPagg = !FoFFemaleFirstPagg
		SetToggleOptionValueST(FoFFemaleFirstPagg)
	EndEvent
	Event OnDefaultST()
		FoFFemaleFirstPagg = false
		SetToggleOptionValueST(FoFFemaleFirstPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidTiedTagPagg
	Event OnSelectST()
		TiedTagPagg = RessConfig.SetTags(TiedTagPagg)
		SetTextOptionValueST(TiedTagPagg)
	EndEvent
	Event OnDefaultST()
		If (TiedTagPagg != "")
			TiedTagPagg = ""
		Else
			TiedTagPagg = "aggressive,bound"
		Endif
		SetTextOptionValueST(TiedTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidTiedSupressTagPagg
	Event OnSelectST()
		TiedSupressTagPagg = RessConfig.SetTags(TiedSupressTagPagg)
		SetTextOptionValueST(TiedSupressTagPagg)
	EndEvent
	Event OnDefaultST()
		If (TiedSupressTagPagg != "")
			TiedSupressTagPagg = ""
		Else
			TiedSupressTagPagg = "subsub,pillory"
		Endif
		SetTextOptionValueST(TiedSupressTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidTiedRequireAllTagPagg
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(TiedTagPagg, TiedSupressTagPagg, TiedRequireAllTagPagg)
		Else
			TiedRequireAllTagPagg = !TiedRequireAllTagPagg
			SetToggleOptionValueST(TiedRequireAllTagPagg)
		Endif
	EndEvent
	Event OnDefaultST()
		TiedRequireAllTagPagg = true
		SetToggleOptionValueST(TiedRequireAllTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidTiedFemaleFirstPagg
	Event OnSelectST()
		TiedFemaleFirstPagg = !TiedFemaleFirstPagg
		SetToggleOptionValueST(TiedFemaleFirstPagg)
	EndEvent
	Event OnDefaultST()
		TiedFemaleFirstPagg = false
		SetToggleOptionValueST(TiedFemaleFirstPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidCreatureTagPagg
	Event OnSelectST()
		CreatureTagPagg = RessConfig.SetTags(CreatureTagPagg)
		SetTextOptionValueST(CreatureTagPagg)
	EndEvent
	Event OnDefaultST()
		If (CreatureTagPagg != "")
			CreatureTagPagg = ""
		Else
			CreatureTagPagg = ""
		Endif
		SetTextOptionValueST(CreatureTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidCreatureSupressTagPagg
	Event OnSelectST()
		CreatureSupressTagPagg = RessConfig.SetTags(CreatureSupressTagPagg)
		SetTextOptionValueST(CreatureSupressTagPagg)
	EndEvent
	Event OnDefaultST()
		If (CreatureSupressTagPagg != "")
			CreatureSupressTagPagg = ""
		Else
			CreatureSupressTagPagg = ""
		Endif
		SetTextOptionValueST(CreatureSupressTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidCreatureRequireAllTagPagg
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(CreatureTagPagg, CreatureSupressTagPagg, CreatureRequireAllTagPagg, IsCreature = True)
		Else
			CreatureRequireAllTagPagg = !CreatureRequireAllTagPagg
			SetToggleOptionValueST(CreatureRequireAllTagPagg)
		Endif
	EndEvent
	Event OnDefaultST()
		CreatureRequireAllTagPagg = true
		SetToggleOptionValueST(CreatureRequireAllTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidMultipleTagPagg
	Event OnSelectST()
		MultipleTagPagg = RessConfig.SetTags(MultipleTagPagg)
		SetTextOptionValueST(MultipleTagPagg)
	EndEvent
	Event OnDefaultST()
		If (MultipleTagPagg != "")
			MultipleTagPagg = ""
		Else
			MultipleTagPagg = "aggressive"
		Endif
		SetTextOptionValueST(MultipleTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidMultipleSupressTagPagg
	Event OnSelectST()
		MultipleSupressTagPagg = RessConfig.SetTags(MultipleSupressTagPagg)
		SetTextOptionValueST(MultipleSupressTagPagg)
	EndEvent
	Event OnDefaultST()
		If (MultipleSupressTagPagg != "")
			MultipleSupressTagPagg = ""
		Else
			MultipleSupressTagPagg = ""
		Endif
		SetTextOptionValueST(MultipleSupressTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidMultipleRequireAllTagPagg
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(MultipleTagPagg, MultipleSupressTagPagg, MultipleRequireAllTagPagg, 3)
		Else
			MultipleRequireAllTagPagg = !MultipleRequireAllTagPagg
			SetToggleOptionValueST(MultipleRequireAllTagPagg)
		Endif
	EndEvent
	Event OnDefaultST()
		MultipleRequireAllTagPagg = true
		SetToggleOptionValueST(MultipleRequireAllTagPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidMultipleFemaleFirstPagg
	Event OnSelectST()
		MultipleFemaleFirstPagg = !MultipleFemaleFirstPagg
		SetToggleOptionValueST(MultipleFemaleFirstPagg)
	EndEvent
	Event OnDefaultST()
		MultipleFemaleFirstPagg = true
		SetToggleOptionValueST(MultipleFemaleFirstPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidMultipleIgnoreGTPagg
	Event OnSelectST()
		MultipleIgnoreGTPagg = !MultipleIgnoreGTPagg
		SetToggleOptionValueST(MultipleIgnoreGTPagg)
	EndEvent
	Event OnDefaultST()
		MultipleIgnoreGTPagg = false
		SetToggleOptionValueST(MultipleIgnoreGTPagg)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_MultipleIgnoreGTPvic")
	EndEvent
EndState
State oidRapeTagNVN
	Event OnSelectST()
		RapeTagNVN = RessConfig.SetTags(RapeTagNVN)
		SetTextOptionValueST(RapeTagNVN)
	EndEvent
	Event OnDefaultST()
		If (RapeTagNVN != "")
			RapeTagNVN = ""
		Else
			RapeTagNVN = "aggressive"
		Endif
		SetTextOptionValueST(RapeTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidRapeSupressTagNVN
	Event OnSelectST()
		RapeSupressTagNVN = RessConfig.SetTags(RapeSupressTagNVN)
		SetTextOptionValueST(RapeSupressTagNVN)
	EndEvent
	Event OnDefaultST()
		If (RapeSupressTagNVN != "")
			RapeSupressTagNVN = ""
		Else
			RapeSupressTagNVN = "sleeping,necro,cowgirl"
		Endif
		SetTextOptionValueST(RapeSupressTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidRapeRequireAllTagNVN
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(RapeTagNVN, RapeSupressTagNVN, RapeRequireAllTagNVN)
		Else
			RapeRequireAllTagNVN = !RapeRequireAllTagNVN
			SetToggleOptionValueST(RapeRequireAllTagNVN)
		Endif
	EndEvent
	Event OnDefaultST()
		RapeRequireAllTagNVN = true
		SetToggleOptionValueST(RapeRequireAllTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidRapeFemaleFirstNVN
	Event OnSelectST()
		RapeFemaleFirstNVN = !RapeFemaleFirstNVN
		SetToggleOptionValueST(RapeFemaleFirstNVN)
	EndEvent
	Event OnDefaultST()
		RapeFemaleFirstNVN = false
		SetToggleOptionValueST(RapeFemaleFirstNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidFoMTagNVN
	Event OnSelectST()
		FoMTagNVN = RessConfig.SetTags(FoMTagNVN)
		SetTextOptionValueST(FoMTagNVN)
	EndEvent
	Event OnDefaultST()
		If (FoMTagNVN != "")
			FoMTagNVN = ""
		Else
			FoMTagNVN = "cowgirl"
		Endif
		SetTextOptionValueST(FoMTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidFoMSupressTagNVN
	Event OnSelectST()
		FoMSupressTagNVN = RessConfig.SetTags(FoMSupressTagNVN)
		SetTextOptionValueST(FoMSupressTagNVN)
	EndEvent
	Event OnDefaultST()
		If (FoMSupressTagNVN != "")
			FoMSupressTagNVN = ""
		Else
			FoMSupressTagNVN = ""
		Endif
		SetTextOptionValueST(FoMSupressTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidFoMRequireAllTagNVN
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(FoMTagNVN, FoMSupressTagNVN, FoMRequireAllTagNVN)
		Else
			FoMRequireAllTagNVN = !FoMRequireAllTagNVN
			SetToggleOptionValueST(FoMRequireAllTagNVN)
		Endif
	EndEvent
	Event OnDefaultST()
		FoMRequireAllTagNVN = true
		SetToggleOptionValueST(FoMRequireAllTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidFoMFemaleFirstNVN
	Event OnSelectST()
		FoMFemaleFirstNVN = !FoMFemaleFirstNVN
		SetToggleOptionValueST(FoMFemaleFirstNVN)
	EndEvent
	Event OnDefaultST()
		FoMFemaleFirstNVN = true
		SetToggleOptionValueST(FoMFemaleFirstNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidFoFTagNVN
	Event OnSelectST()
		FoFTagNVN = RessConfig.SetTags(FoFTagNVN)
		SetTextOptionValueST(FoFTagNVN)
	EndEvent
	Event OnDefaultST()
		If (FoFTagNVN != "")
			FoFTagNVN = ""
		Else
			FoFTagNVN = "lesbian"
		Endif
		SetTextOptionValueST(FoFTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidFoFSupressTagNVN
	Event OnSelectST()
		FoFSupressTagNVN = RessConfig.SetTags(FoFSupressTagNVN)
		SetTextOptionValueST(FoFSupressTagNVN)
	EndEvent
	Event OnDefaultST()
		If (FoFSupressTagNVN != "")
			FoFSupressTagNVN = ""
		Else
			FoFSupressTagNVN = ""
		Endif
		SetTextOptionValueST(FoFSupressTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidFoFRequireAllTagNVN
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(FoFTagNVN, FoFSupressTagNVN, FoFRequireAllTagNVN)
		Else
			FoFRequireAllTagNVN = !FoFRequireAllTagNVN
			SetToggleOptionValueST(FoFRequireAllTagNVN)
		Endif
	EndEvent
	Event OnDefaultST()
		FoFRequireAllTagNVN = true
		SetToggleOptionValueST(FoFRequireAllTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidFoFFemaleFirstNVN
	Event OnSelectST()
		FoFFemaleFirstNVN = !FoFFemaleFirstNVN
		SetToggleOptionValueST(FoFFemaleFirstNVN)
	EndEvent
	Event OnDefaultST()
		FoFFemaleFirstNVN = false
		SetToggleOptionValueST(FoFFemaleFirstNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidTiedTagNVN
	Event OnSelectST()
		TiedTagNVN = RessConfig.SetTags(TiedTagNVN)
		SetTextOptionValueST(TiedTagNVN)
	EndEvent
	Event OnDefaultST()
		If (TiedTagNVN != "")
			TiedTagNVN = ""
		Else
			TiedTagNVN = "aggressive,bound"
		Endif
		SetTextOptionValueST(TiedTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidTiedSupressTagNVN
	Event OnSelectST()
		TiedSupressTagNVN = RessConfig.SetTags(TiedSupressTagNVN)
		SetTextOptionValueST(TiedSupressTagNVN)
	EndEvent
	Event OnDefaultST()
		If (TiedSupressTagNVN != "")
			TiedSupressTagNVN = ""
		Else
			TiedSupressTagNVN = "subsub,pillory"
		Endif
		SetTextOptionValueST(TiedSupressTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidTiedRequireAllTagNVN
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(TiedTagNVN, TiedSupressTagNVN, TiedRequireAllTagNVN)
		Else
			TiedRequireAllTagNVN = !TiedRequireAllTagNVN
			SetToggleOptionValueST(TiedRequireAllTagNVN)
		Endif
	EndEvent
	Event OnDefaultST()
		TiedRequireAllTagNVN = true
		SetToggleOptionValueST(TiedRequireAllTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidTiedFemaleFirstNVN
	Event OnSelectST()
		TiedFemaleFirstNVN = !TiedFemaleFirstNVN
		SetToggleOptionValueST(TiedFemaleFirstNVN)
	EndEvent
	Event OnDefaultST()
		TiedFemaleFirstNVN = false
		SetToggleOptionValueST(TiedFemaleFirstNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidCreatureTagNVN
	Event OnSelectST()
		CreatureTagNVN = RessConfig.SetTags(CreatureTagNVN)
		SetTextOptionValueST(CreatureTagNVN)
	EndEvent
	Event OnDefaultST()
		If (CreatureTagNVN != "")
			CreatureTagNVN = ""
		Else
			CreatureTagNVN = ""
		Endif
		SetTextOptionValueST(CreatureTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidCreatureSupressTagNVN
	Event OnSelectST()
		CreatureSupressTagNVN = RessConfig.SetTags(CreatureSupressTagNVN)
		SetTextOptionValueST(CreatureSupressTagNVN)
	EndEvent
	Event OnDefaultST()
		If (CreatureSupressTagNVN != "")
			CreatureSupressTagNVN = ""
		Else
			CreatureSupressTagNVN = ""
		Endif
		SetTextOptionValueST(CreatureSupressTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidCreatureRequireAllTagNVN
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(CreatureTagNVN, CreatureSupressTagNVN, CreatureRequireAllTagNVN, IsCreature = True)
		Else
			CreatureRequireAllTagNVN = !CreatureRequireAllTagNVN
			SetToggleOptionValueST(CreatureRequireAllTagNVN)
		Endif
	EndEvent
	Event OnDefaultST()
		CreatureRequireAllTagNVN = true
		SetToggleOptionValueST(CreatureRequireAllTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidMultipleTagNVN
	Event OnSelectST()
		MultipleTagNVN = RessConfig.SetTags(MultipleTagNVN)
		SetTextOptionValueST(MultipleTagNVN)
	EndEvent
	Event OnDefaultST()
		If (MultipleTagNVN != "")
			MultipleTagNVN = ""
		Else
			MultipleTagNVN = "aggressive"
		Endif
		SetTextOptionValueST(MultipleTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_Tag")
	EndEvent
EndState
State oidMultipleSupressTagNVN
	Event OnSelectST()
		MultipleSupressTagNVN = RessConfig.SetTags(MultipleSupressTagNVN)
		SetTextOptionValueST(MultipleSupressTagNVN)
	EndEvent
	Event OnDefaultST()
		If (MultipleSupressTagNVN != "")
			MultipleSupressTagNVN = ""
		Else
			MultipleSupressTagNVN = ""
		Endif
		SetTextOptionValueST(MultipleSupressTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_SupressTag")
	EndEvent
EndState
State oidMultipleRequireAllTagNVN
	Event OnSelectST()
		If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
			RessConfig.CheckAvailableAnimations(MultipleTagNVN, MultipleSupressTagNVN, MultipleRequireAllTagNVN, 3)
		Else
			MultipleRequireAllTagNVN = !MultipleRequireAllTagNVN
			SetToggleOptionValueST(MultipleRequireAllTagNVN)
		Endif
	EndEvent
	Event OnDefaultST()
		MultipleRequireAllTagNVN = true
		SetToggleOptionValueST(MultipleRequireAllTagNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_RequireAllTag")
	EndEvent
EndState
State oidMultipleFemaleFirstNVN
	Event OnSelectST()
		MultipleFemaleFirstNVN = !MultipleFemaleFirstNVN
		SetToggleOptionValueST(MultipleFemaleFirstNVN)
	EndEvent
	Event OnDefaultST()
		MultipleFemaleFirstNVN = true
		SetToggleOptionValueST(MultipleFemaleFirstNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_FemaleFirst")
	EndEvent
EndState
State oidMultipleIgnoreGTNVN
	Event OnSelectST()
		MultipleIgnoreGTNVN = !MultipleIgnoreGTNVN
		SetToggleOptionValueST(MultipleIgnoreGTNVN)
	EndEvent
	Event OnDefaultST()
		MultipleIgnoreGTNVN = false
		SetToggleOptionValueST(MultipleIgnoreGTNVN)
	EndEvent
	Event OnHighlightST()
		SetInfoText("$Desc_MultipleIgnoreGTPvic")
	EndEvent
EndState


;=================================\MENU/=======================================
;/Event OnOptionMenuOpen(Int Option)
	If (Option == oidQTEPrimaryS)						; PVIC ==========
		SetMenuDialogOptions(QTEPrimaryS)
		SetMenuDialogStartIndex(QTEPrimarySIndex)
		SetMenuDialogDefaultIndex(1)
	Endif
	If (Option == oidQTESecondaryS)
		SetMenuDialogOptions(QTESecondaryS)
		SetMenuDialogStartIndex(QTESecondarySIndex)
		SetMenuDialogDefaultIndex(1)
	Endif
EndEvent
Event OnOptionMenuAccept(Int Option, Int Index)
	If (Option == oidQTEPrimaryS)						; PVIC ==========
		QTEPrimarySIndex = Index
		If (Index == 0)
			QTEPrimarySO = "OneHanded"
		Elseif (Index == 1)
			QTEPrimarySO = "TwoHanded"
		Elseif (Index == 2) 
			QTEPrimarySO = "Marksman"
		Elseif (Index == 3)
			QTEPrimarySO = "Alchemy"
		Elseif (Index == 4)
			QTEPrimarySO = "Destruction"
		Else
			QTEPrimarySO = "Alteration"
		Endif
		If (QTEPrimarySO != QTESecondarySO)
			SetMenuOptionValue(oidQTEPrimaryS, QTEPrimaryS[QTEPrimarySIndex])
		Endif
	Endif
	If (Option == oidQTESecondaryS)
		QTESecondarySIndex = Index
		If (Index == 0)
			QTESecondarySO = "TwoHanded"
		Elseif (Index == 1)
			QTESecondarySO = "OneHanded"
		Elseif (Index == 2) 
			QTESecondarySO = "Marksman"
		Elseif (Index == 3)
			QTESecondarySO = "Alchemy"
		Elseif (Index == 4)
			QTESecondarySO = "Destruction"
		Else
			QTESecondarySO = "Alteration"		
		Endif
		If (QTESecondarySO != QTEPrimarySO)
			SetMenuOptionValue(oidQTESecondaryS, QTESecondaryS[QTESecondarySIndex])
		Endif
	Endif
EndEvent/;
Event OnOptionColorOpen(int option)
    If (option == oidQTEColorBar)
        SetColorDialogStartColor(0xFFFFFF)
        SetColorDialogDefaultColor(0xFFFFFF)
    Endif
EndEvent
Event OnOptionColorAccept(int option, int color)
    If (option == oidQTEColorBar)
        QTEColorBar = color
        SetColorOptionValue(oidQTEColorBar, QTEColorBar)
        StruggleBar.PrimaryColor = QTEColorBar
    Endif
EndEvent
Event OnOptionSliderOpen(Int Option)
	If (CurrentPage == "$Player as victim")					; PVIC ==========
		If Option == oidThresholdPvic
			SetSliderDialogStartValue(ThresholdPvic)
			SetSliderDialogDefaultValue(20.0)
			SetSliderDialogRange(ThresholdPvicMin, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidThresholdPvicMin
			SetSliderDialogStartValue(ThresholdPvicMin)
			SetSliderDialogDefaultValue(5.0)
			SetSliderDialogRange(0.0, ThresholdPvic)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidChanceOnHitPvic
			SetSliderDialogStartValue(ChanceOnHitPvic)
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidSStruggleHealthPvic
			SetSliderDialogStartValue(SStruggleHealthPvic)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidKnockOutHPvic
			SetSliderDialogStartValue(KnockOutHPvic)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidExhaustionPvic
			SetSliderDialogStartValue(ExhaustionPvic)
			SetSliderDialogDefaultValue(50.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidChanceOnHitPvicS
			SetSliderDialogStartValue(ChanceOnHitPvicS)
			SetSliderDialogDefaultValue(50.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidSStruggleExhaustionPvic
			SetSliderDialogStartValue(SStruggleExhaustionPvic)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidKnockOutSPvic
			SetSliderDialogStartValue(KnockOutSPvic)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidKDWayPowerAtkCOH
			SetSliderDialogStartValue(KDWayPowerAtkCOH)
			SetSliderDialogDefaultValue(20.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidPowerAtkStagger
			SetSliderDialogStartValue(PowerAtkStagger)
			SetSliderDialogDefaultValue(100)
			SetSliderDialogRange(75, 125)
			SetSliderDialogInterval(5)
		Elseif Option == oidSStrugglePowerPvic
			SetSliderDialogStartValue(SStrugglePowerPvic)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidKnockOutPPvic
			SetSliderDialogStartValue(KnockOutPPvic)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidResistBonusPvic
			SetSliderDialogStartValue(ResistBonusPvic)
			SetSliderDialogDefaultValue(0)
			SetSliderDialogRange(-20, 20)
			SetSliderDialogInterval(1)
		Elseif Option == oidResistFillStamina
			SetSliderDialogStartValue(ResistFillStamina)
			SetSliderDialogDefaultValue(15.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(1)
		Elseif Option == oidDebuffDuration
			SetSliderDialogStartValue(DebuffDuration)
			SetSliderDialogDefaultValue(120.0)
			SetSliderDialogRange(0.0, 600.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidThreesomeChance
			SetSliderDialogStartValue(ThreesomeChance)
			SetSliderDialogDefaultValue(30.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidThreesomeChanceCollateral
			SetSliderDialogStartValue(ThreesomeChanceCollateral)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidAgainChance
			SetSliderDialogStartValue(AgainChance)
			SetSliderDialogDefaultValue(15.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidSatisfiedPvic
			SetSliderDialogStartValue(SatisfiedPvic)
			SetSliderDialogDefaultValue(180.0)
			SetSliderDialogRange(0.0, 900.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidPvicRaped
			SetSliderDialogStartValue(PvicRaped)
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0, 100.0)
			SetSliderDialogInterval(5.0)
;		Elseif Option == oidArousalSARPvic
;			SetSliderDialogStartValue(ArousalSARPvic)
;			SetSliderDialogDefaultValue(200.0)
;			SetSliderDialogRange(0.0, 400.0)
;			SetSliderDialogInterval(10.0)
		Elseif Option == oidGbCrChancePvic					; CREATURES PVIC ==========
			SetSliderDialogStartValue(GbCrChancePvic)
			SetSliderDialogDefaultValue(50.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Else
			Int i = oidSSPvic.Find(Option)					; STRIPPING PVIC ==========
			If (i != -1)
				SetSliderDialogStartValue(SSPvic[i])
				SetSliderDialogDefaultValue(SSPvic[i])
				SetSliderDialogRange(30, 61)
				SetSliderDialogInterval(1)
			Endif
		Endif
	Elseif (CurrentPage == "$Player Post-Assault")			; POST-ASSAULT PVIC ==========
		If Option == oidfRobbing
			SetSliderDialogStartValue(fRobbing)
			SetSliderDialogDefaultValue(20.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidvRobbing
			SetSliderDialogStartValue(vRobbing)
			SetSliderDialogDefaultValue(50.0)
			SetSliderDialogRange(0.0, 500.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidDAsChance
			SetSliderDialogStartValue(DAsChance)
			SetSliderDialogDefaultValue(50.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(5.0)
		Else
			Int i = oidPAfrequency.Find(Option)
			If (i != -1)
				SetSliderDialogStartValue(PAfrequency[i])
				SetSliderDialogDefaultValue(0.0)
				SetSliderDialogRange(0.0, 100.0)
				SetSliderDialogInterval(1.0)
			Endif
		Endif
	Elseif (CurrentPage == "$Player/Follower aggressor")	; PAGG ==========
		If Option == oidKDTimePagg
			SetSliderDialogStartValue(KDTimePagg)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(30.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidDebuffDurationPAGG
			SetSliderDialogStartValue(DebuffDurationPAGG)
			SetSliderDialogDefaultValue(120.0)
			SetSliderDialogRange(0, 300.0)
			SetSliderDialogInterval(1)
		Elseif Option == oidChanceOfBountyPagg
			SetSliderDialogStartValue(ChanceOfBountyPagg)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0, 100.0)
			SetSliderDialogInterval(1)
		Elseif Option == oidTraumaPAGG
			SetSliderDialogStartValue(TraumaPAGG)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidExhaustedPagg
			SetSliderDialogStartValue(ExhaustedPagg)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidEscapePagg
			SetSliderDialogStartValue(EscapePagg)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidResistBonusPagg
			SetSliderDialogStartValue(ResistBonusPagg)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(100.0, 200.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidStruggleBonusPagg
			SetSliderDialogStartValue(StruggleBonusPagg)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(-20.0, 20.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidTiedTime
			SetSliderDialogStartValue(TiedTime)
			SetSliderDialogDefaultValue(10.0)
			SetSliderDialogRange(1.0, 48.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidKOTime
			SetSliderDialogStartValue(KOTime)
			SetSliderDialogDefaultValue(5.0)
			SetSliderDialogRange(1.0, 24.0)
			SetSliderDialogInterval(1.0)
;		Elseif Option == oidArousalSARPagg
;			SetSliderDialogStartValue(ArousalSARPagg)
;			SetSliderDialogDefaultValue(200.0)
;			SetSliderDialogRange(0.0, 400.0)
;			SetSliderDialogInterval(10.0)
		Elseif Option == oidSOHandoverCD
			SetSliderDialogStartValue(SOHandoverCD)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 72.0)
			SetSliderDialogInterval(1.0)
		Else
			Int i = oidSSPagg.Find(Option)					; STRIPPING PAGG ==========
			If (i != -1) 
				SetSliderDialogStartValue(SSPagg[i])
				SetSliderDialogDefaultValue(SSPagg[i])
				SetSliderDialogRange(30, 61)
				SetSliderDialogInterval(1)
			Endif
		Endif
	Elseif (CurrentPage == "$NPC vs NPC")					; NVN ==========
		If Option == oidThresholdNPCvsNPC
			SetSliderDialogStartValue(ThresholdNPCvsNPC)
			SetSliderDialogDefaultValue(30.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidThresholdFollower
			SetSliderDialogStartValue(ThresholdFollower)
			SetSliderDialogDefaultValue(30.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidChanceOnHitNPC
			SetSliderDialogStartValue(ChanceOnHitNPC)
			SetSliderDialogDefaultValue(30.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidCOHFollower
			SetSliderDialogStartValue(COHFollower)
			SetSliderDialogDefaultValue(30.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidGbChanceNVN
			SetSliderDialogStartValue(GbChanceNVN)
			SetSliderDialogDefaultValue(30.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidNVNTrauma
			SetSliderDialogStartValue(NVNTrauma)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidNVNTraumaCvic
			SetSliderDialogStartValue(NVNTraumaCvic)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidNVNExhausted
			SetSliderDialogStartValue(NVNExhausted)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidNVNExhaustedCvic
			SetSliderDialogStartValue(NVNExhaustedCvic)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidEscapeCvic
			SetSliderDialogStartValue(EscapeCvic)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidEscapeNPC
			SetSliderDialogStartValue(EscapeNPC)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidNVNKill
			SetSliderDialogStartValue(NVNKill)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidNVNRobbed
			SetSliderDialogStartValue(NVNRobbed)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidNVNKillFollower
			SetSliderDialogStartValue(NVNKillFollower)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidNVNRobbedFollower
			SetSliderDialogStartValue(NVNRobbedFollower)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidNVNRobbedPA
			SetSliderDialogStartValue(NVNRobbedPA)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidNVNKillPA
			SetSliderDialogStartValue(NVNKillPA)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidNVNRobbedPAFollower
			SetSliderDialogStartValue(NVNRobbedPAFollower)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidNVNKillPAFollower
			SetSliderDialogStartValue(NVNKillPAFollower)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)


		Elseif Option == oidDebuffDurationNVN
			SetSliderDialogStartValue(DebuffDurationNVN)
			SetSliderDialogDefaultValue(120.0)
			SetSliderDialogRange(0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidDebuffDurationNVNCvic
			SetSliderDialogStartValue(DebuffDurationNVNCvic)
			SetSliderDialogDefaultValue(120.0)
			SetSliderDialogRange(0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidNVNRaped
			SetSliderDialogStartValue(NVNRaped)
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0, 100.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidNVNRapedFollower
			SetSliderDialogStartValue(NVNRapedFollower)
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0, 100.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidSatisfiedNVN
			SetSliderDialogStartValue(SatisfiedNVN)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidSatisfiedFollower
			SetSliderDialogStartValue(SatisfiedFollower)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(0.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidNVN3wayAutoFollower
			SetSliderDialogStartValue(NVN3wayAutoFollower)
			SetSliderDialogDefaultValue(0.0)
			SetSliderDialogRange(0.0, 2000.0)
			SetSliderDialogInterval(100.0)
;		Elseif Option == oidArousalSARFollower
;			SetSliderDialogStartValue(ArousalSARFollower)
;			SetSliderDialogDefaultValue(200.0)
;			SetSliderDialogRange(0.0, 400.0)
;			SetSliderDialogInterval(10.0)
;		Elseif Option == oidArousalSARNVN
;			SetSliderDialogStartValue(ArousalSARNVN)
;			SetSliderDialogDefaultValue(200.0)
;			SetSliderDialogRange(0.0, 400.0)
;			SetSliderDialogInterval(10.0)
		Elseif Option == oidKDTimeNVN
			SetSliderDialogStartValue(KDTimeNVN)
			SetSliderDialogDefaultValue(60.0)
			SetSliderDialogRange(30.0, 300.0)
			SetSliderDialogInterval(5.0)
		Elseif Option == oidGbCrChanceNVN					; CREATURES NVN ==========
			SetSliderDialogStartValue(GbCrChanceNVN)
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		Else
			Int i = oidSSNVN.Find(Option)				; STRIPPING NVN ==========
			If (i != -1) 
				SetSliderDialogStartValue(SSNVN[i])
				SetSliderDialogDefaultValue(SSNVN[i])
				SetSliderDialogRange(30, 61)
				SetSliderDialogInterval(1)
			Endif
		Endif
	Elseif (CurrentPage == "$General settings")				; SYSTEM ==========
		If Option == oidMeterWidth							
			SetSliderDialogStartValue(MeterWidth)
			SetSliderDialogDefaultValue(250.0)
			SetSliderDialogRange(0.0, 500.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidMeterHeight
			SetSliderDialogStartValue(MeterHeight)
			SetSliderDialogDefaultValue(50.0)
			SetSliderDialogRange(0.0, 500.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidAxisX
			SetSliderDialogStartValue(AxisX)
			SetSliderDialogDefaultValue(640.0)
			SetSliderDialogRange(0.0, 1000.0)
			SetSliderDialogInterval(1.0)
		Elseif Option == oidAxisY
			SetSliderDialogStartValue(AxisY)
			SetSliderDialogDefaultValue(650.0)
			SetSliderDialogRange(0.0, 1000.0)
			SetSliderDialogInterval(1.0)
		Endif
	Endif
EndEvent
Event OnOptionSliderAccept(Int Option, Float Value)
	If (CurrentPage == "$Player as victim")
		If Option == oidExhaustionPvic											; PVIC ==========
			ExhaustionPvic = Value
			SetSliderOptionValue(oidExhaustionPvic, ExhaustionPvic, "{0} %")
		Elseif Option == oidChanceOnHitPvic											
			ChanceOnHitPvic = Value
			SetSliderOptionValue(oidChanceOnHitPvic, ChanceOnHitPvic, "{0} %")
		Elseif Option == oidSStruggleHealthPvic
			SStruggleHealthPvic = Value
			SetSliderOptionValue(oidSStruggleHealthPvic, SStruggleHealthPvic, "{0} %")
		Elseif Option == oidKnockOutHPvic
			KnockOutHPvic = Value
			SetSliderOptionValue(oidKnockOutHPvic, KnockOutHPvic, "{0} %")
		Elseif Option == oidChanceOnHitPvicS											
			ChanceOnHitPvicS = Value
			SetSliderOptionValue(oidChanceOnHitPvicS, ChanceOnHitPvicS, "{0} %")
		Elseif Option == oidSStruggleExhaustionPvic
			SStruggleExhaustionPvic = Value
			SetSliderOptionValue(oidSStruggleExhaustionPvic, SStruggleExhaustionPvic, "{0} %")
		Elseif Option == oidKnockOutSPvic
			KnockOutSPvic = Value
			SetSliderOptionValue(oidKnockOutSPvic, KnockOutSPvic, "{0} %")
		Elseif Option == oidKDWayPowerAtkCOH											
			KDWayPowerAtkCOH = Value
			SetSliderOptionValue(oidKDWayPowerAtkCOH, KDWayPowerAtkCOH, "{0} %")
		Elseif Option == oidPowerAtkStagger											
			PowerAtkStagger = Value
			SetSliderOptionValue(oidPowerAtkStagger, PowerAtkStagger, "{0}")
		Elseif Option == oidSStrugglePowerPvic
			SStrugglePowerPvic = Value
			SetSliderOptionValue(oidSStrugglePowerPvic, SStrugglePowerPvic, "{0} %")
		Elseif Option == oidKnockOutPPvic
			KnockOutPPvic = Value
			SetSliderOptionValue(oidKnockOutPPvic, KnockOutPPvic, "{0} %")
		Elseif Option == oidResistBonusPvic										
			ResistBonusPvic = Value
			SetSliderOptionValue(oidResistBonusPvic, ResistBonusPvic, "{0}")
		Elseif Option == oidResistFillStamina									
			ResistFillStamina = Value
			SetSliderOptionValue(oidResistFillStamina, ResistFillStamina, "{0}")
		Elseif Option == oidThreesomeChance
			ThreesomeChance = Value
			SetSliderOptionValue(oidThreesomeChance, ThreesomeChance, "{0} %")
		Elseif Option == oidThreesomeChanceCollateral
			ThreesomeChanceCollateral = Value
			SetSliderOptionValue(oidThreesomeChanceCollateral, ThreesomeChanceCollateral, "{0} %")
		Elseif Option == oidAgainChance
			AgainChance = Value
			SetSliderOptionValue(oidAgainChance, AgainChance, "{0} %")
		Elseif Option == oidThresholdPvic
			ThresholdPvic = Value
			SetSliderOptionValue(oidThresholdPvic, ThresholdPvic, "{0} %")
		Elseif Option == oidThresholdPvicMin
			ThresholdPvicMin = Value
			SetSliderOptionValue(oidThresholdPvicMin, ThresholdPvicMin, "{0} %")
		Elseif Option == oidDebuffDuration
			DebuffDuration = Value
			SetSliderOptionValue(oidDebuffDuration, DebuffDuration, "{0} seconds")
		Elseif Option == oidSatisfiedPvic
			SatisfiedPvic = Value
			SetSliderOptionValue(oidSatisfiedPvic, SatisfiedPvic, "{0} seconds")
		Elseif Option == oidPvicRaped
			PvicRaped = Value
			SetSliderOptionValue(oidPvicRaped, PvicRaped, "{0} %")
;		Elseif Option == oidArousalSARPvic
;			ArousalSARPvic = Value
;			SetSliderOptionValue(oidArousalSARPvic, ArousalSARPvic, "{0} %")
		Elseif Option == oidGbCrChancePvic										; CREATURES PVIC ==========
			GbCrChancePvic = Value
			SetSliderOptionValue(oidGbCrChancePvic, GbCrChancePvic, "{0} %")
		Else
			Int i = oidSSPvic.Find(Option)										; STRIPPING PVIC ==========
			If (i != -1) 
				SSPvic[i] = Value
				SetSliderOptionValue(oidSSPvic[i], SSPvic[i], "{0}"+SlotNames[(SSPvic[i] As Int) - 30])
			Endif
		Endif
	Elseif (CurrentPage == "$Player Post-Assault")								; POST-ASSAULT PVIC ==========
		If Option == oidfRobbing
			fRobbing = Value
			SetSliderOptionValue(oidfRobbing, fRobbing, "{0} %")
		Elseif Option == oidvRobbing
			vRobbing = Value
			SetSliderOptionValue(oidvRobbing, vRobbing, "${0} Gold")
		Elseif Option == oidDAsChance
			DAsChance = Value
			SetSliderOptionValue(oidDAsChance, DAsChance, "{0} %")
		Else
			Int i = oidPAfrequency.Find(Option)
			If (i != -1)
				PAfrequency[i] = Value
				SetSliderOptionValue(oidPAfrequency[i], PAfrequency[i], "{0} %")
			Endif
		Endif
	Elseif (CurrentPage == "$Player/Follower aggressor")
		If Option == oidResistBonusPagg											; PAGG ==========
			ResistBonusPagg = Value
			SetSliderOptionValue(oidResistBonusPagg, ResistBonusPagg, "{0} %")
		Elseif Option == oidStruggleBonusPagg
			StruggleBonusPagg = Value
			SetSliderOptionValue(oidStruggleBonusPagg, StruggleBonusPagg, "{0}")
		Elseif Option == oidTraumaPAGG
			TraumaPAGG = Value
			SetSliderOptionValue(oidTraumaPAGG, TraumaPAGG, "{0} seconds")
		Elseif Option == oidExhaustedPagg
			ExhaustedPagg = Value
			SetSliderOptionValue(oidExhaustedPagg, ExhaustedPagg, "{0} seconds")
		Elseif Option == oidEscapePagg
			EscapePagg = Value
			SetSliderOptionValue(oidEscapePagg, EscapePagg, "{0} seconds")
		Elseif Option == oidKDTimePagg
			KDTimePagg = Value
			SetSliderOptionValue(oidKDTimePagg, KDTimePagg, "{0} seconds")
		Elseif Option == oidDebuffDurationPAGG
			DebuffDurationPAGG = Value
			SetSliderOptionValue(oidDebuffDurationPAGG, DebuffDurationPAGG, "{0} seconds")
		Elseif Option == oidChanceOfBountyPagg
			ChanceOfBountyPagg = Value
			SetSliderOptionValue(oidChanceOfBountyPagg, ChanceOfBountyPagg, "{0} %")
		Elseif Option == oidTiedTime
			TiedTime = Value
			SetSliderOptionValue(oidTiedTime, TiedTime, "{0} hours")
		Elseif Option == oidKOTime
			KOTime = Value
			SetSliderOptionValue(oidKOTime, KOTime, "{0} hours")
;		Elseif Option == oidArousalSARPagg
;			ArousalSARPagg = Value
;			SetSliderOptionValue(oidArousalSARPagg, ArousalSARPagg, "{0} %")
		Elseif Option == oidSOHandoverCD
			SOHandoverCD = Value
			SetSliderOptionValue(oidSOHandoverCD, SOHandoverCD, "{0} hours")
		Else
			Int i = oidSSPagg.Find(Option)										; STRIPPING PAGG ==========
			If (i != -1) 
				SSPagg[i] = Value
				SetSliderOptionValue(oidSSPagg[i], SSPagg[i], "{0}"+SlotNames[(SSPagg[i] As Int) - 30])
			Endif
		Endif
	Elseif (CurrentPage == "$NPC vs NPC")	
		If Option == oidThresholdNPCvsNPC										; NVN ==========
			ThresholdNPCvsNPC = Value
			SetSliderOptionValue(oidThresholdNPCvsNPC, ThresholdNPCvsNPC, "{0} %")
		Elseif Option == oidThresholdFollower
			ThresholdFollower = Value
			SetSliderOptionValue(oidThresholdFollower, ThresholdFollower, "{0} %")
		Elseif Option == oidChanceOnHitNPC
			ChanceOnHitNPC = Value
			SetSliderOptionValue(oidChanceOnHitNPC, ChanceOnHitNPC, "{0} %")
		Elseif Option == oidCOHFollower
			COHFollower = Value
			SetSliderOptionValue(oidCOHFollower, COHFollower, "{0} %")
		Elseif Option == oidGbChanceNVN
			GbChanceNVN = Value
			SetSliderOptionValue(oidGbChanceNVN, GbChanceNVN, "{0} %")
		Elseif Option == oidNVNTrauma
			NVNTrauma = Value
			SetSliderOptionValue(oidNVNTrauma, NVNTrauma, "{0} seconds")
		Elseif Option == oidNVNTraumaCvic
			NVNTraumaCvic = Value
			SetSliderOptionValue(oidNVNTraumaCvic, NVNTraumaCvic, "{0} seconds")
		Elseif Option == oidNVNExhausted
			NVNExhausted = Value
			SetSliderOptionValue(oidNVNExhausted, NVNExhausted, "{0} seconds")
		Elseif Option == oidNVNExhaustedCvic
			NVNExhaustedCvic = Value
			SetSliderOptionValue(oidNVNExhaustedCvic, NVNExhaustedCvic, "{0} seconds")
		Elseif Option == oidEscapeCvic
			EscapeCvic = Value
			SetSliderOptionValue(oidEscapeCvic, EscapeCvic, "{0} seconds")
		Elseif Option == oidEscapeNPC
			EscapeNPC = Value
			SetSliderOptionValue(oidEscapeNPC, EscapeNPC, "{0} seconds")
		Elseif Option == oidNVNKill
			NVNKill = Value
			SetSliderOptionValue(oidNVNKill, NVNKill, "{0} %")
		Elseif Option == oidNVNRobbed
			NVNRobbed = Value
			SetSliderOptionValue(oidNVNRobbed, NVNRobbed, "{0} %")
		Elseif Option == oidNVNRobbedFollower
			NVNRobbedFollower = Value
			SetSliderOptionValue(oidNVNRobbedFollower, NVNRobbedFollower, "{0} %")
		Elseif Option == oidNVNKillFollower
			NVNKillFollower = Value
			SetSliderOptionValue(oidNVNKillFollower, NVNKillFollower, "{0} %")
		Elseif Option == oidNVNRobbedPA
			NVNRobbedPA = Value
			SetSliderOptionValue(oidNVNRobbedPA, NVNRobbedPA, "{0} %")
		Elseif Option == oidNVNKillPA
			NVNKillPA = Value
			SetSliderOptionValue(oidNVNKillPA, NVNKillPA, "{0} %")
		Elseif Option == oidNVNRobbedPAFollower
			NVNRobbedPAFollower = Value
			SetSliderOptionValue(oidNVNRobbedPAFollower, NVNRobbedPAFollower, "{0} %")
		Elseif Option == oidNVNKillPAFollower
			NVNKillPAFollower = Value
			SetSliderOptionValue(oidNVNKillPAFollower, NVNKillPAFollower, "{0} %")
		Elseif Option == oidDebuffDurationNVN
			DebuffDurationNVN = Value
			SetSliderOptionValue(oidDebuffDurationNVN, DebuffDurationNVN, "{0} seconds")
		Elseif Option == oidDebuffDurationNVNCvic
			DebuffDurationNVNCvic = Value
			SetSliderOptionValue(oidDebuffDurationNVNCvic, DebuffDurationNVNCvic, "{0} seconds")
		Elseif Option == oidNVNRaped
			NVNRaped = Value
			SetSliderOptionValue(oidNVNRaped, NVNRaped, "{0} %")
		Elseif Option == oidNVNRapedFollower
			NVNRapedFollower = Value
			SetSliderOptionValue(oidNVNRapedFollower, NVNRapedFollower, "{0} %")
		Elseif Option == oidSatisfiedNVN
			SatisfiedNVN = Value
			SetSliderOptionValue(oidSatisfiedNVN, SatisfiedNVN, "{0} seconds")
		Elseif Option == oidSatisfiedFollower
			SatisfiedFollower = Value
			SetSliderOptionValue(oidSatisfiedFollower, SatisfiedFollower, "{0} seconds")
		Elseif Option == oidNVN3wayAutoFollower
			NVN3wayAutoFollower = Value
			SetSliderOptionValue(oidNVN3wayAutoFollower, NVN3wayAutoFollower, "{0} units")
;		Elseif Option == oidArousalSARFollower
;			ArousalSARFollower = Value
;			SetSliderOptionValue(oidArousalSARFollower, ArousalSARFollower, "{0} %")
;		Elseif Option == oidArousalSARNVN
;			ArousalSARNVN = Value
;			SetSliderOptionValue(oidArousalSARNVN, ArousalSARNVN, "{0} %")
		Elseif Option == oidKDTimeNVN
			KDTimeNVN = Value
			SetSliderOptionValue(oidKDTimeNVN, KDTimeNVN, "{0} seconds")
		Elseif Option == oidGbCrChanceNVN										; CREATURES NVN ==========
			GbCrChanceNVN = Value
			SetSliderOptionValue(oidGbCrChanceNVN, GbCrChanceNVN, "{0} %")
		Else
			Int i = oidSSNVN.Find(Option)										; STRIPPING NVN ==========
			If (i != -1) 
				SSNVN[i] = Value
				SetSliderOptionValue(oidSSNVN[i], SSNVN[i], "{0}"+SlotNames[(SSNVN[i] As Int) - 30])
			Endif
		Endif
	Elseif (CurrentPage == "$General settings")									; SYSTEM ==========
		If Option == oidMeterWidth											
			MeterWidth = Value
			StruggleBar.Width = Value
			SetSliderOptionValue(oidMeterWidth, MeterWidth, "{0}")
		Elseif Option == oidMeterHeight
			MeterHeight = Value
			StruggleBar.Height = Value
			SetSliderOptionValue(oidMeterHeight, MeterHeight, "{0}")
		Elseif Option == oidAxisX
			AxisX = Value
			StruggleBar.X = Value
			SetSliderOptionValue(oidAxisX, AxisX, "{0}")
		Elseif Option == oidAxisY
			AxisY = Value
			StruggleBar.Y = Value
			SetSliderOptionValue(oidAxisY, AxisY, "{0}")
		Endif
	Endif
EndEvent

Event OnOptionSelect(Int Option)
	If (CurrentPage == "$Player as victim")								; PVIC ==========
		If Option == oidKDWayThreshold
			KDWayThreshold = !KDWayThreshold
			If KDWayThreshold
				KDwayThresholdFlag = OPTION_FLAG_NONE
			Else
				KDwayThresholdFlag = OPTION_FLAG_DISABLED
			Endif
			SetTextOptionValue(Option, KDWayThreshold)
			ForcePageReset()
		Elseif Option == oidKDWayStamina	
			KDWayStamina = !KDWayStamina
			If KDWayStamina
			    KDwayStaminaFlag = OPTION_FLAG_NONE
			Else
			    KDwayStaminaFlag = OPTION_FLAG_DISABLED
			Endif
			SetTextOptionValue(Option, KDWayStamina)
			ForcePageReset()
		Elseif Option == oidKDWayStaminaOB
			KDWayStaminaOB = !KDWayStaminaOB
			SetToggleOptionValue(Option, KDWayStaminaOB)
		Elseif Option == oidKDHealthBlock
			KDHealthBlock = !KDHealthBlock
			SetToggleOptionValue(Option, KDHealthBlock)
		Elseif Option == oidKDStaminaBlock
			KDStaminaBlock = !KDStaminaBlock
			SetToggleOptionValue(Option, KDStaminaBlock)
		Elseif Option == oidKDPowerABlock
			KDPowerABlock = !KDPowerABlock
			SetToggleOptionValue(Option, KDPowerABlock)
		Elseif Option == oidKDWayPowerAtk
			KDWayPowerAtk = !KDWayPowerAtk
			If KDWayPowerAtk
				KDwayPowerAtkFlag = OPTION_FLAG_NONE
			Else
				KDwayPowerAtkFlag = OPTION_FLAG_DISABLED
			Endif
			SetTextOptionValue(Option, KDWayPowerAtk)
			ForcePageReset()
		Elseif Option == oidPlayerEssential
			PlayerEssential = !PlayerEssential
			If PlayerEssential
				RessConfig.PlayerEssential.ForceRefIfEmpty(Player)
			Else
				RessConfig.PlayerEssential.Clear()
			Endif
			SetToggleOptionValue(Option, PlayerEssential)
		Elseif Option == oidKDscenario
			If KDscenario == "$All Down"
				KDscenario = "$Original"
			Elseif KDscenario == "$Original"
				KDscenario = "$No Transition"
			Else
				KDscenario = "$All Down"		
			Endif
			SetTextOptionValue(Option, KDscenario)
		Elseif Option == oidKDownWayPvic
			If KDownWayPvic == "$Both"
				KDownWayPvic = "$Threshold"
			Elseif KDownWayPvic == "$Threshold"
				KDownWayPvic = "$Exhaustion"
			Else
				KDownWayPvic = "$Both"
			Endif
			SetTextOptionValue(Option, KDownWayPvic)
		Elseif Option == oidBeastImmunity
			BeastImmunity = !BeastImmunity
			SetToggleOptionValue(Option, BeastImmunity)
		Elseif Option == oidEveryonePvic
			EveryonePvic = !EveryonePvic
			SetToggleOptionValue(Option, EveryonePvic)
		Elseif Option == oidOnlyPotSexual
			OnlyPotSexual = !OnlyPotSexual
			SetToggleOptionValue(Option, OnlyPotSexual)
		Elseif Option == oidNoTranAutoResist
			NoTranAutoResist = !NoTranAutoResist
			SetToggleOptionValue(Option, NoTranAutoResist)
		Elseif Option == oidSexualityPvic
			SexualityPvic = !SexualityPvic
			SetToggleOptionValue(Option, SexualityPvic)
			ForcePageReset()
		Elseif Option == oidMaleHunterPvic
			MaleHunterPvic = !MaleHunterPvic
			SetToggleOptionValue(Option, MaleHunterPvic)
		Elseif Option == oidFemaleHunterPvic
			FemaleHunterPvic = !FemaleHunterPvic 
			SetToggleOptionValue(Option, FemaleHunterPvic)
		Elseif Option == oidMoralityPvic
			MoralityPvic = !MoralityPvic 
			SetToggleOptionValue(Option, MoralityPvic)
		Elseif Option == oidSlowDown
			SlowDown = !SlowDown
			SetToggleOptionValue(Option, SlowDown)
		Elseif Option == oidCollateralAssault
			CollateralAssault = !CollateralAssault
			SetToggleOptionValue(Option, CollateralAssault)
		Elseif Option == oidFollowerSurrender
			FollowerSurrender = !FollowerSurrender
			SetToggleOptionValue(Option, FollowerSurrender)
		Elseif Option == oidStayDown
			StayDown = !StayDown
			SetToggleOptionValue(Option, StayDown)
		Elseif Option == oidWitnessPvic
			WitnessPvic = !WitnessPvic
			SetToggleOptionValue(Option, WitnessPvic)
		Elseif Option == oidCoverSelfPvic
			CoverSelfPvic = !CoverSelfPvic
			SetToggleOptionValue(Option, CoverSelfPvic)
		Elseif Option == oidInsatiablePvic
			InsatiablePvic = !InsatiablePvic
			SetToggleOptionValue(Option, InsatiablePvic)
		Elseif Option == oidDialoguesPvic
			DialoguesPvic = !DialoguesPvic
			SetToggleOptionValue(Option, DialoguesPvic)
		Elseif Option == oidCommentsPvic
			CommentsPvic = !CommentsPvic
			SetToggleOptionValue(Option, CommentsPvic)
		Elseif Option == oidMoanPvic
			MoanPvic = !MoanPvic
			RessConfig.SetPlayerMoan(MoanPvic As Int)
			SetToggleOptionValue(Option, MoanPvic)
		Elseif Option == oidDialoguesFollower
			DialoguesFollower = !DialoguesFollower
			SetToggleOptionValue(Option, DialoguesFollower)
		Elseif Option == oidbQTEmess
			bQTEmess = !bQTEmess
			SetToggleOptionValue(Option, bQTEmess)
		Elseif Option == oidbResistQTE
			bResistQTE = !bResistQTE
			If bResistQTE
				ResistFlag = OPTION_FLAG_NONE
			Else
				ResistFlag = OPTION_FLAG_DISABLED
			Endif
			SetToggleOptionValue(Option, bResistQTE)
			ForcePageReset()
		Elseif Option == oidQTEHKType
			If QTEHKType == "$Strafe"
				QTEHKType = "$Attack"
			Else
				QTEHKType = "$Strafe"
			Endif
			SetTextOptionValue(Option, QTEHKType)
		Elseif Option == oidDamageStamina
			DamageStamina = !DamageStamina
			SetToggleOptionValue(Option, DamageStamina)
		Elseif Option == oidbExhaustedPvic
			bExhaustedPvic = !bExhaustedPvic
			SetToggleOptionValue(Option, bExhaustedPvic)
		Elseif Option == oidHuntCrea									; CREATURES PVIC ==========
			HuntCrea = !HuntCrea
			SetToggleOptionValue(Option, HuntCrea)
		Elseif Option == oidHuntFCrea
			HuntFCrea = !HuntFCrea
			SetToggleOptionValue(Option, HuntFCrea)
		Elseif Option == oidCrScenario
			If CrScenario == "$All Down"
				CrScenario = "$Original"
			Elseif CrScenario == "$Original"
				CrScenario = "$No Transition"
			Else
				CrScenario = "$All Down"		
			Endif
			SetTextOptionValue(Option, CrScenario)
		Elseif Option == oidCreaRaceEnablePvic
			RessConfig.RaceFilterEnable()
		Elseif Option == oidCreaRaceDisablePvic
			RessConfig.RaceFilterDisable()
		Elseif Option == oidbRedressPvic								; STRIPPING PVIC ==========
			bRedressPvic = !bRedressPvic
			SetToggleOptionValue(Option, bRedressPvic)
		Else
			Int i = oidSSPvicSet.Find(Option)
			If (i != -1)
				SSPvicSet[i] = StripChoices(SSPvicSet[i])
				SetTextOptionValue(oidSSPvicSet[i], SSPvicSet[i])
			Endif
		Endif
	Elseif (CurrentPage == "$Player Post-Assault")						; POST-ASSAULT PVIC ==========
		If Option == oidbEscape
			If bEscape == "$Trauma"
				bEscape = "$End"
			Else
				bEscape = "$Trauma"
			Endif
			SetTextOptionValue(Option, bEscape)
		Elseif Option == oidRobbingWay
			If RobbingWay == "$Value"
				RobbingWay = "$Only Gold"
			Else
				RobbingWay = "$Value"
			Endif
			SetTextOptionValue(Option, RobbingWay)
		Elseif Option == oidRobTimeLimit
			RobTimeLimit = !RobTimeLimit
			SetToggleOptionValue(Option, RobTimeLimit)
		Else
			Int i = oidPAbEnabled.Find(Option)
			If (i != -1)
				PAbEnabled[i] = !PAbEnabled[i]
				SetToggleOptionValue(Option, PAbEnabled[i])	
			Endif
			i = oidPAbSecondary.Find(Option)
			If (i != -1)
				PAbSecondary[i] = !PAbSecondary[i]
				SetToggleOptionValue(Option, PAbSecondary[i])	
			Endif
			i = oidPAbOnlyEnemy.Find(Option)
			If (i != -1)
				PAbOnlyEnemy[i] = !PAbOnlyEnemy[i]
				SetToggleOptionValue(Option, PAbOnlyEnemy[i])	
			Endif
			i = oidPAbOnlyRaped.Find(Option)
			If (i != -1)
				PAbOnlyRaped[i] = !PAbOnlyRaped[i]
				SetToggleOptionValue(Option, PAbOnlyRaped[i])	
			Endif
		Endif
	Elseif (CurrentPage == "$Player/Follower aggressor")				; PAGG ==========
		If Option == oidWitnessPagg
			WitnessPagg = !WitnessPagg
			SetToggleOptionValue(Option, WitnessPagg)
		Elseif Option == oidVicAnimosity
			VicAnimosity = !VicAnimosity
			SetToggleOptionValue(Option, VicAnimosity)
		Elseif Option == oidNecroOnOff
			NecroOnOff = !NecroOnOff
			If NecroOnOff
				RessConfig.OnOffNecro = True
			Else
				RessConfig.OnOffNecro = False
			Endif
			SetToggleOptionValue(Option, NecroOnOff)
		Elseif Option == oidAddperk
			If (Addperk == "$Disabled")
				Player.AddPerk(RessConfig.DefeatAssaultPRK)
				Addperk = "$Enabled"
				RessConfig.OnOffPerk = True
			Else
				Player.RemovePerk(RessConfig.DefeatAssaultPRK)
				Addperk = "$Disabled"
				RessConfig.OnOffPerk = False
			Endif
			SetTextOptionValue(Option, Addperk)
		Elseif Option == oidbTieUpAnim
			bTieUpAnim = !bTieUpAnim
			SetToggleOptionValue(Option, bTieUpAnim)
		Elseif Option == oidMoralityPagg
			MoralityPagg = !MoralityPagg
			SetToggleOptionValue(Option, MoralityPagg)
		Elseif Option == oidSexualityPagg
			SexualityPagg = !SexualityPagg
			SetToggleOptionValue(Option, SexualityPagg)
		Elseif Option == oidKDResistPagg
			KDResistPagg = !KDResistPagg
			SetToggleOptionValue(Option, KDResistPagg)
		Elseif Option == oidMarkHighlight
			MarkHighlight = !MarkHighlight
			SetToggleOptionValue(Option, MarkHighlight)
		Elseif Option == oidMarkNotification
			MarkNotification = !MarkNotification
			SetToggleOptionValue(Option, MarkNotification)
		Elseif Option == oidHKinfo
			ShowMessage("$Desc_HKinfo", False)
		Elseif Option == oidHKinfo2
			ShowMessage("$Desc_HKinfo2", False)
		Elseif Option == oidSOValueCheck
			SOCheckValue()
		Elseif Option == oidSOSexuality
			SOSexuality = !SOSexuality
			SetToggleOptionValue(Option, SOSexuality)
		Elseif Option == oidSOMorality
			SOMorality = !SOMorality
			SetToggleOptionValue(Option, SOMorality)
		Elseif Option == oidSOWitness
			SOWitness = !SOWitness
			SetToggleOptionValue(Option, SOWitness)
		Elseif Option == oidSORelation
			SORelation = !SORelation
			SetToggleOptionValue(Option, SORelation)
		Elseif Option == oidSOSatisfied
			SOSatisfied = !SOSatisfied
			SetToggleOptionValue(Option, SOSatisfied)
		Elseif Option == oidSOValuesSet
			RessConfig.SOSetXValues()
		Elseif Option == oidbRedressPagg								; STRIPPING PAGG =========	
			bRedressPagg = !bRedressPagg
			SetToggleOptionValue(Option, bRedressPagg)
		Else
			Int i = oidSSPaggSet.Find(Option)
			If (i != -1)
				SSPaggSet[i] = StripChoices(SSPaggSet[i])
				SetTextOptionValue(oidSSPaggSet[i], SSPaggSet[i])
			Endif
		Endif
	Elseif (CurrentPage == "$NPC vs NPC")
		If Option == oidNoNotifications									; NVN ==========
			NoNotifications = !NoNotifications
			SetToggleOptionValue(Option, NoNotifications)
		Elseif Option == oidMoralityNVN
			MoralityNVN = !MoralityNVN
			SetToggleOptionValue(Option, MoralityNVN)
		Elseif Option == oidWitnessNVN
			WitnessNVN = !WitnessNVN
			SetToggleOptionValue(Option, WitnessNVN)
		Elseif Option == oidDialoguesNVN
			DialoguesNVN = !DialoguesNVN
			SetToggleOptionValue(Option, DialoguesNVN)
		Elseif Option == oidDialoguesNVNFollower
			DialoguesNVNFollower = !DialoguesNVNFollower
			SetToggleOptionValue(Option, DialoguesNVNFollower)
		Elseif Option == oidSexualityNVN
			SexualityNVN = !SexualityNVN
			SetToggleOptionValue(Option, SexualityNVN)
			ForcePageReset()
		Elseif Option == oidMaleOnGal
			MaleOnGal = !MaleOnGal
			SetToggleOptionValue(Option, MaleOnGal)	
		Elseif Option == oidMaleOnMale
			MaleOnMale = !MaleOnMale
			SetToggleOptionValue(Option, MaleOnMale)	
		Elseif Option == oidGalOnMale
			GalOnMale = !GalOnMale
			SetToggleOptionValue(Option, GalOnMale)	
		Elseif Option == oidGalOnGal
			GalOnGal = !GalOnGal
			SetToggleOptionValue(Option, GalOnGal)
		Elseif Option == oidCreaOnMale
			CreaOnMale = !CreaOnMale
			SetToggleOptionValue(Option, CreaOnMale)
		Elseif Option == oidCreaOnFemale
			CreaOnFemale = !CreaOnFemale
			SetToggleOptionValue(Option, CreaOnFemale)
		Elseif Option == oidCreaFemaleOnMale
			CreaFemaleOnMale = !CreaFemaleOnMale
			SetToggleOptionValue(Option, CreaFemaleOnMale)
		Elseif Option == oidCreaFemaleOnFemale
			CreaFemaleOnFemale = !CreaFemaleOnFemale
			SetToggleOptionValue(Option, CreaFemaleOnFemale)
		Elseif Option == oidAllowNPC
			AllowNPC = !AllowNPC
			RessConfig.NVNAllowVic = AllowNPC
			If AllowNPC
				AllowNPCFlag = OPTION_FLAG_NONE
			Else
				AllowNPCFlag = OPTION_FLAG_DISABLED
			Endif
			SetToggleOptionValue(Option, AllowNPC)
			ForcePageReset()
		Elseif Option == oidAllowCvic									; CREATURES NVN ==========
			AllowCvic = !AllowCvic
			RessConfig.NVNAllowFollowerVic = AllowCvic
			If AllowCvic
				AllowCvicFlag = OPTION_FLAG_NONE
			Else
				AllowCvicFlag = OPTION_FLAG_DISABLED
			Endif
			SetToggleOptionValue(Option, AllowCvic)
			ForcePageReset()
		Elseif Option == oidAllowCagg
			AllowCagg = !AllowCagg
			SetToggleOptionValue(Option, AllowCagg)
		Elseif Option == oidNPCLastEnemy
			NPCLastEnemy = !NPCLastEnemy
			SetToggleOptionValue(Option, NPCLastEnemy)
		Elseif Option == oidEveryoneNVN
			EveryoneNVN = !EveryoneNVN
			SetToggleOptionValue(Option, EveryoneNVN)
		Elseif Option == oidNVNKDtype
			If NVNKDtype == "$Both"
				NVNKDtype = "$Only on bleedout"
				RessConfig.NVNKDtype = 3
			Elseif NVNKDtype == "$Only on bleedout"
				NVNKDtype = "$Only on hit"
				RessConfig.NVNKDtype = 1
			Else
				NVNKDtype = "$Both"
				RessConfig.NVNKDtype = 2
			Endif
			SetTextOptionValue(Option, NVNKDtype)
		Elseif Option == oidCreaRaceEnableNVN
			RessConfig.RaceFilterEnable("NVN")
		Elseif Option == oidCreaRaceDisableNVN
			RessConfig.RaceFilterDisable("NVN")
		Elseif Option == oidbRedressNVN									; STRIPPING NVN ==========
			bRedressNVN = !bRedressNVN
			SetToggleOptionValue(Option, bRedressNVN)
		Elseif Option == oidbRedressFollower
			bRedressFollower = !bRedressFollower
			SetToggleOptionValue(Option, bRedressFollower)	
		Else
			Int i = oidSSNVNSet.Find(Option)
			If (i != -1)
				SSNVNSet[i] = StripChoices(SSNVNSet[i])
				SetTextOptionValue(oidSSNVNSet[i], SSNVNSet[i])
			Endif
		Endif
	Elseif (CurrentPage == "$General settings")
		If Option == oidModStatus										; SYSTEM ==========
			If (ModStatus == "$Enabled")
				Bool Mess = ShowMessage("$Desc_UninstallYesNo") 
				If Mess
					ShowMessage("$Desc_Uninstall", False)
					RessConfig.Uninstall()
				Endif
			Else
				If (SKSE.GetVersionRelease() < 46)
					ShowMessage("$Desc_SKSEVersion", False)
				Endif
				ShowMessage("$Desc_Install", False)
				RessConfig.Install()
			Endif
		Elseif Option == oidReconfigure
			RessConfig.Install(True)
			ShowMessage("$Defeat reconfigured", False)
		Elseif Option == oidOnOffPvic
			If (OnOffPvic == "$Disabled")
				ShowMessage("$You must close the menu to activate it.", False)
				RessConfig.OnOffFeature("PlayerVic", True)
			Else
				RessConfig.OnOffFeature("PlayerVic")
			Endif
			SetTextOptionValue(Option, OnOffPvic)
		Elseif Option == oidOnOffPagg
			If (OnOffPagg == "$Disabled")
				RessConfig.OnOffFeature("PlayerAgg", True)
			Else
				RessConfig.OnOffFeature("PlayerAgg")
			Endif
			SetTextOptionValue(Option, OnOffPagg)
		Elseif Option == oidOnOffNVN
			If (OnOffNVN == "$Disabled")
				ShowMessage("$You must close the menu to activate it.", False)
				RessConfig.OnOffFeature("", True)
			Else
				RessConfig.OnOffFeature("")
			Endif
			SetTextOptionValue(Option, OnOffNVN)
		Elseif Option == oidModExportSetting
			If ShowMessage("$Will erase the previously exported settings and save the current settings. Do you want to continue?") 
				ExportSettings()
			Endif
		Elseif Option == oidModImportSetting
			If ShowMessage("$Will import previously exported settings. Do you want to continue?") 
				ImportSettings()
				;ShowMessage("", False)
			Endif
		Elseif Option == oidCleanUp
			ShowMessage("$Desc_CleanUp", False)
			RessConfig.Cleanup()		
		Elseif Option == oidModList
			ShowMessage(AModList[0]+"\n"+AModList[1]+"\n"+AModList[2]+"\n"+AModList[3]+"\n"+AModList[4]+"\n"+AModList[5]+"\n"+AModList[6]+"\n"+AModList[7], False)
		Elseif Option == oidModCheck
			RessConfig.CheckForMods()
			ShowMessage("$Desc_ModCheckMess", False)
		Elseif Option == oidDisplayBar
			ShowMessage("$You must now close the menu to see the bar", False)
			RessConfig.DisplayBar()
		Endif
	Elseif (CurrentPage == "$Animation settings")
		If Option == oidHitInterrupt
			HitInterrupt = !HitInterrupt
			SetToggleOptionValue(oidHitInterrupt, HitInterrupt)
		Elseif Option == oidCombatInterrupt
			CombatInterrupt = !CombatInterrupt
			SetToggleOptionValue(oidCombatInterrupt, CombatInterrupt)
		Elseif Option == oidAnimSettingsPage
			Int Page = RessConfig.AnimSettingsPage()
			If ((Page != -1) && (AnimationSettingsPage != Page))
				AnimationSettingsPage = Page
				ForcePageReset()
			Endif
		Endif
	Endif
	If Option == oidCheckSlots
;		ShowMessage("$You must now close the menu to see the notifications", False)
;		Utility.Wait(1.0)
		RessConfig.CheckOutfitSlots()
	Endif
EndEvent

Event OnOptionKeyMapChange(Int Option, Int keyCode, String conflictControl, String conflictName)
	Bool Continue = True
	If (keyCode == 1)
		keyCode = 0
		conflictControl = ""
	Endif
	If (conflictControl != "")
		String msg
		If conflictName != ""
			msg = "This key is already mapped to:\n'" + conflictControl + "'\n(" + conflictName + ")\n\nAre you sure you want to continue?"
		Else
			msg = "This key is already mapped to:\n'" + conflictControl + "'\n\nAre you sure you want to continue?"
		Endif
		Continue = ShowMessage(msg, True, "$Yes", "$No")
	Endif		
	If Continue
		If Option == oidHKOption
			HKOption = keyCode
			RessConfig.HotKeyInts[0] = HKOption
		Elseif Option == oidHKModifier
			HKModifier = keyCode
			RessConfig.HotKeyInts[1] = HKModifier
		Elseif Option == oidHKAction
			HKAction = keyCode
			RessConfig.HotKeyInts[2] = HKAction
		Elseif Option == oidHKSurrender
			HKSurrender = keyCode
			RessConfig.HotKeyInts[3] = HKSurrender
		Endif
		SetKeymapOptionValue(Option, keyCode)
		PlayerScr.Hkrefresh()
		ActionQst.Hkrefresh()
		RessConfig.Hkrefresh()
	Endif
EndEvent

Event OnOptionDefault(int option)
	If Option == oidSOValuesSet
		RessConfig.SOSetDefaultSOXValues()
	Endif
EndEvent

Event OnOptionHighlight(Int Option)
	If (CurrentPage == "$Player as victim")						; PVIC ==========
		If Option == oidKDWayThreshold
			SetInfoText("$Desc_KDWayThreshold")
		Elseif Option == oidThresholdPvic
			SetInfoText("$Desc_ThresholdPvic")
		Elseif Option == oidThresholdPvicMin
			SetInfoText("$Desc_ThresholdPvicMin")
		Elseif Option == oidChanceOnHitPvic
			SetInfoText("$Desc_ChanceOnHit")
		Elseif Option == oidSStruggleHealthPvic
			SetInfoText("$Desc_SStrugglePvic")
		Elseif Option == oidKnockOutHPvic
			SetInfoText("$Desc_KnockOutPvic")
		Elseif Option == oidKDWayStamina
			SetInfoText("$Desc_KDWayStamina")
		Elseif Option == oidChanceOnHitPvicS
			SetInfoText("$Desc_ChanceOnHit")
		Elseif Option == oidSStruggleExhaustionPvic
			SetInfoText("$Desc_SStrugglePvic")
		Elseif Option == oidKnockOutSPvic
			SetInfoText("$Desc_KnockOutPvic")			
		Elseif Option == oidKDWayPowerAtkCOH
			SetInfoText("$Desc_ChanceOnHit")
		Elseif Option == oidPowerAtkStagger
			SetInfoText("$Desc_PowerAtkStagger")
		Elseif Option == oidSStrugglePowerPvic
			SetInfoText("$Desc_SStrugglePvic")
		Elseif Option == oidKnockOutPPvic
			SetInfoText("$Desc_KnockOutPvic")
		Elseif Option == oidResistBonusPvic
			SetInfoText("$Desc_ResistBonusPvic")
		Elseif Option == oidResistFillStamina
			SetInfoText("$Desc_ResistFillStamina")
		Elseif Option == oidKDWayStaminaOB
			SetInfoText("$Desc_KDWayStaminaOB")
		Elseif Option == oidKDHealthBlock
			SetInfoText("$Desc_KDBlock")
		Elseif Option == oidKDStaminaBlock
			SetInfoText("$Desc_KDBlock")
		Elseif Option == oidKDPowerABlock
			SetInfoText("$Desc_KDBlock")
		Elseif Option == oidKDWayPowerAtk
			SetInfoText("$Desc_KDWayPowerAtk")
		Elseif Option == oidPlayerEssential
			SetInfoText("$Desc_PlayerEssential")
		Elseif Option == oidHKSurrender
			SetInfoText("$Desc_HKSurrender")
		Elseif Option == oidKDscenario
			SetInfoText("$Desc_KDscenario")
		Elseif Option == oidExhaustionPvic
			SetInfoText("$Desc_ExhaustionPvic")
		Elseif Option == oidDamageStamina
			SetInfoText("$Desc_Stamina")
		Elseif Option == oidDebuffDuration
			SetInfoText("$Desc_Debuff")
		Elseif Option == oidBeastImmunity
			SetInfoText("$Desc_BeastImmunity")
		Elseif Option == oidEveryonePvic
			SetInfoText("$Desc_EveryonePvic")
		Elseif Option == oidOnlyPotSexual
			SetInfoText("$Desc_OnlyPotSexual")
		Elseif Option == oidSexualityPvic
			SetInfoText("$Desc_SexualityPvic")
		Elseif Option == oidNoTranAutoResist
			SetInfoText("$Desc_NoTranAutoResist")
		Elseif Option == oidMaleHunterPvic
			SetInfoText("$Desc_HuntMale")
		Elseif Option == oidFemaleHunterPvic
			SetInfoText("$Desc_HuntFemale")
		Elseif Option == oidMoralityPvic
			SetInfoText("$Desc_MoralityPvic")
		Elseif Option == oidSlowDown
			SetInfoText("$Desc_SlowDown")
		Elseif Option == oidCollateralAssault
			SetInfoText("$Desc_CollateralAssault")
		Elseif Option == oidFollowerSurrender
			SetInfoText("$Desc_FollowerSurrender")
		Elseif Option == oidThreesomeChance
			SetInfoText("$Desc_ThreesomeChance")
		Elseif Option == oidThreesomeChanceCollateral
			SetInfoText("$Desc_ThreesomeChanceCollateral")
		Elseif Option == oidAgainChance
			SetInfoText("$Desc_AgainChance")
		Elseif Option == oidStayDown
			SetInfoText("$Desc_StayDown")
		Elseif Option == oidWitnessPvic
			SetInfoText("$Desc_WitnessPvic")
		Elseif Option == oidCoverSelfPvic
			SetInfoText("$Desc_CoverSelfPvic")
		Elseif Option == oidInsatiablePvic
			SetInfoText("$Desc_InsatiablePvic")
		Elseif Option == oidDialoguesPvic
			SetInfoText("$Desc_DialoguesPvic")
		Elseif Option == oidCommentsPvic
			SetInfoText("$Desc_CommentsPvic")
		Elseif Option == oidMoanPvic
			SetInfoText("$Desc_MoanPvic")
		Elseif Option == oidDialoguesFollower
			SetInfoText("$Desc_DialoguesFollower")
		Elseif Option == oidbResistQTE
			SetInfoText("$Desc_bResistQTE")
		Elseif Option == oidQTEHKType
			SetInfoText("$Desc_QTEHKType")
;		Elseif Option == oidQTEPrimaryS
;			SetInfoText("$Desc_QTEPrimaryS")
;		Elseif Option == oidQTESecondaryS
;			SetInfoText("$Desc_QTESecondaryS")
		Elseif Option == oidbQTEmess
			SetInfoText("$Desc_bQTEmess")
		Elseif Option == oidSatisfiedPvic
			SetInfoText("$Desc_SatisfiedPvic")
		Elseif Option == oidPvicRaped
			SetInfoText("$Desc_PvicRaped")
;		Elseif Option == oidArousalSARPvic
;			SetInfoText("$Desc_ArousalSAR")
		Elseif Option == oidbExhaustedPvic
			SetInfoText("$Desc_bExhaustedPvic")
		Elseif Option == oidHuntCrea							; CREATURES PVIC ==========
			SetInfoText("$Desc_HuntCrea")
		Elseif Option == oidHuntFCrea
			SetInfoText("$Desc_HuntFCrea")
		Elseif Option == oidCrScenario
			SetInfoText("$Desc_CrScenario")
		Elseif Option == oidGbCrChancePvic	
			SetInfoText("$Desc_GbCrChancePvic")
		Elseif Option == oidCreaRaceEnablePvic
			SetInfoText("$Desc_CreaRaceFilter")
		Elseif Option == oidCreaRaceDisablePvic
			SetInfoText("$Desc_CreaRaceFilter")
		Elseif Option == oidbRedressPvic						; STRIPPING PVIC ==========
			SetInfoText("$Desc_bRedress")
		Else
			Int i = oidSSPvicSet.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_StripPvic")
			Endif
			i = oidSSPvic.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_StripSlots")
			Endif
		Endif
	Elseif (CurrentPage == "$Player Post-Assault")				; POST-ASSAULT PVIC ==========
		If Option == oidDAsChance
			SetInfoText("$Desc_DAsChance")
		Elseif Option == oidbEscape
			SetInfoText("$Desc_bEscape")
		Elseif Option == oidfRobbing
			SetInfoText("$Desc_fRobbing")
		Elseif Option == oidvRobbing
			SetInfoText("$Desc_vRobbing")
		Elseif Option == oidRobbingWay
			SetInfoText("$Desc_RobbingWay")
		Elseif Option == oidRobTimeLimit
			SetInfoText("$Desc_RobTimeLimit")
		Elseif Option == oidPAfrequency[0]
			SetInfoText("$Desc_LeftForDead")
		Elseif Option == oidPAfrequency[1]
			SetInfoText("$Desc_Defeated")
		Elseif Option == oidPAfrequency[2]
			SetInfoText("$Desc_SimpleSlavery")
;		Elseif Option == oidPAfrequency[3]
;			SetInfoText("$Desc_FollowerKidnapping")
		Elseif Option == oidPAbEnabled[0]
			SetInfoText("$Desc_Jailed")
		Else
			Int i = oidPAbSecondary.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_PAbSecondary")
			Endif
			i = oidPAbOnlyEnemy.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_PAbOnlyEnemy")
			Endif
			i = oidPAbOnlyRaped.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_PAbOnlyRaped")
			Endif
		Endif
	Elseif (CurrentPage == "$Player/Follower aggressor")
		If Option == oidResistBonusPagg							; PAGG ==========
			SetInfoText("$Desc_ResistBonusPagg")
		Elseif Option == oidStruggleBonusPagg									
			SetInfoText("$Desc_StruggleBonusPagg")
		Elseif Option == oidWitnessPagg									
			SetInfoText("$Desc_WitnessPagg")
		Elseif Option == oidVicAnimosity
			SetInfoText("$Desc_Animosity")
		Elseif Option == oidNecroOnOff
			SetInfoText("$Desc_NecroOnOff")
		Elseif Option == oidAddperk
			SetInfoText("$Desc_Addperk")
		Elseif Option == oidTraumaPAGG
			SetInfoText("$Desc_Trauma")
		Elseif Option == oidExhaustedPagg
			SetInfoText("$Desc_Exhausted")
		Elseif Option == oidEscapePagg
			SetInfoText("$Desc_Escape")
		Elseif Option == oidKDTimePagg
			SetInfoText("$Desc_Stun")
		Elseif Option == oidDebuffDurationPAGG
			SetInfoText("$Desc_Debuff")
		Elseif Option == oidChanceOfBountyPagg
			SetInfoText("$Desc_ChanceOfBountyPagg")
		Elseif Option == oidTiedTime
			SetInfoText("$Desc_TiedTime")
		Elseif Option == oidKOTime
			SetInfoText("$Desc_KOTime")
		Elseif Option == oidbTieUpAnim
			SetInfoText("$Desc_TiedAnim")
		Elseif Option == oidMoralityPagg
			SetInfoText("$Desc_MoralityPagg")
		Elseif Option == oidSexualityPagg
			SetInfoText("$Desc_SexualityPagg")
		Elseif Option == oidKDResistPagg
			SetInfoText("$Desc_KDResistPagg")
		Elseif Option == oidMarkHighlight
			SetInfoText("$Desc_MarkHighlight")
		Elseif Option == oidMarkNotification
			SetInfoText("$Desc_MarkNotification")
;		Elseif Option == oidArousalSARPagg
;			SetInfoText("$Desc_ArousalPagg")
		Elseif Option == oidSOValueCheck
			SetInfoText("$Desc_SOValueCheck")
		Elseif Option == oidSOSexuality
			SetInfoText("$Desc_SOSexuality")
		Elseif Option == oidSOMorality
			SetInfoText("$Desc_SOMorality")			
		Elseif Option == oidSOWitness
			SetInfoText("$Desc_SOWitness")
		Elseif Option == oidSORelation
			SetInfoText("$Desc_SORelation")
		Elseif Option == oidSOSatisfied
			SetInfoText("$Desc_SOSatisfied")
		Elseif Option == oidSOValuesSet
			SetInfoText("$Desc_SOValuesSet")
		Elseif Option == oidSOHandoverCD
			SetInfoText("$Desc_SOHandoverCD")
		Elseif Option == oidHKAction 							; HOTKEY PAGG ==========
			SetInfoText("$Desc_ActionHK")
		Elseif Option == oidbRedressPagg						; STRIPPING PAGG ==========
			SetInfoText("$Desc_bRedress")
		Else
			Int i = oidSSPaggSet.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_Strip")
			Endif
			i = oidSSPagg.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_StripSlots")
			Endif
		Endif	
	Elseif (CurrentPage == "$NPC vs NPC")
		If Option == oidThresholdNPCvsNPC						; NVN ==========
			SetInfoText("$Desc_ThresholdNPCvsNPC")
		Elseif Option == oidThresholdFollower
			SetInfoText("$Desc_ThresholdFollower")
		Elseif Option == oidChanceOnHitNPC
			SetInfoText("$Desc_ChanceOnHitNVN")
		Elseif Option == oidCOHFollower
			SetInfoText("$Desc_COHFollower")
		Elseif Option == oidAllowCvic
			SetInfoText("$Desc_AllowCvic")	
		Elseif Option == oidAllowCagg
			SetInfoText("$Desc_AllowCagg")
		Elseif Option == oidSexualityNVN
			SetInfoText("$Desc_SexualityNVN")	
		Elseif Option == oidMaleOnGal
			SetInfoText("$Desc_MaleOnGal")	
		Elseif Option == oidMaleOnMale
			SetInfoText("$Desc_MaleOnMale")	
		Elseif Option == oidGalOnMale
			SetInfoText("$Desc_GalOnMale")	
		Elseif Option == oidGalOnGal
			SetInfoText("$Desc_GalOnGal")
		Elseif Option == oidNoNotifications
			SetInfoText("$Desc_NoNotifications")
		Elseif Option == oidMoralityNVN
			SetInfoText("$Desc_MoralityNVN")
		Elseif Option == oidWitnessNVN
			SetInfoText("$Desc_WitnessNVN")
		Elseif Option == oidDialoguesNVN
			SetInfoText("$Desc_DialoguesNVN")
		Elseif Option == oidDialoguesNVNFollower
			SetInfoText("$Desc_DialoguesNVNFollower")
		Elseif Option == oidNVNRaped
			SetInfoText("$Desc_NVNRaped")
		Elseif Option == oidNVNRobbed
			SetInfoText("$Desc_NVNRobbed")
		Elseif Option == oidNVNKill
			SetInfoText("$Desc_NVNKill")
		Elseif Option == oidNVNRapedFollower
			SetInfoText("$Desc_NVNRaped")
		Elseif Option == oidNVNRobbedFollower
			SetInfoText("$Desc_NVNRobbed")
		Elseif Option == oidNVNKillFollower
			SetInfoText("$Desc_NVNKill")
		Elseif Option == oidNPCLastEnemy
			SetInfoText("$Desc_NPCLastEnemy")
		Elseif Option == oidGbChanceNVN
			SetInfoText("$Desc_GbChanceNVN")
		Elseif Option == oidNVNTrauma
			SetInfoText("$Desc_Trauma")
		Elseif Option == oidNVNTraumaCvic
			SetInfoText("$Desc_Trauma")
		Elseif Option == oidNVNExhausted
			SetInfoText("$Desc_Exhausted")
		Elseif Option == oidNVNExhaustedCvic
			SetInfoText("$Desc_Exhausted")
		Elseif Option == oidEscapeCvic
			SetInfoText("$Desc_Escape")
		Elseif Option == oidEscapeNPC
			SetInfoText("$Desc_Escape")
		Elseif Option == oidNVNRobbedPA
			SetInfoText("$Desc_NVNRobbedPA")
		Elseif Option == oidNVNKillPA
			SetInfoText("$Desc_NVNKillPA")
		Elseif Option == oidNVNRobbedPAFollower
			SetInfoText("$Desc_NVNRobbedPA")
		Elseif Option == oidNVNKillPAFollower
			SetInfoText("$Desc_NVNKillPA")
		Elseif Option == oidEveryoneNVN
			SetInfoText("$Desc_Everyone")
		Elseif Option == oidNVNKDType
			SetInfoText("$Desc_NVNKDtype")
		Elseif Option == oidDebuffDurationNVN
			SetInfoText("$Desc_Debuff")
		Elseif Option == oidDebuffDurationNVNCvic
			SetInfoText("$Desc_Debuff")
		Elseif Option == oidSatisfiedNVN
			SetInfoText("$Desc_SatisfiedNVN")
		Elseif Option == oidSatisfiedFollower
			SetInfoText("$Desc_SatisfiedNVN")
		Elseif Option == oidNVN3wayAutoFollower
			SetInfoText("$Desc_NVN3wayAutoFollower")
;		Elseif Option == oidArousalSARFollower
;			SetInfoText("$Desc_ArousalSAR")
;		Elseif Option == oidArousalSARNVN
;			SetInfoText("$Desc_ArousalSAR")
		Elseif Option == oidKDTimeNVN
			SetInfoText("$Desc_KDTimeNVN")
		Elseif Option == oidCreaOnMale								; CREATURES NVN ==========
			SetInfoText("$Desc_CreaOnMale")
		Elseif Option == oidCreaOnFemale
			SetInfoText("$Desc_CreaOnFemale")
		Elseif Option == oidCreaFemaleOnMale
			SetInfoText("$Desc_CreaFemaleOnMale")
		Elseif Option == oidCreaFemaleOnFemale
			SetInfoText("$Desc_CreaFemaleOnFemale")
		Elseif Option == oidAllowNPC
			SetInfoText("$Desc_AllowNPC")
		Elseif Option == oidGbCrChanceNVN
			SetInfoText("$Desc_GbCrChanceNVN")
		Elseif Option == oidCreaRaceEnableNVN
			SetInfoText("$Desc_CreaRaceFilter")
		Elseif Option == oidCreaRaceDisableNVN
			SetInfoText("$Desc_CreaRaceFilter")
		Elseif Option == oidbRedressNVN								; STRIPPING NVN ==========
			SetInfoText("$Desc_bRedress")
		Elseif Option == oidbRedressFollower
			SetInfoText("$Desc_bRedress")
		Else
			Int i = oidSSNVNSet.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_Strip")
			Endif
			i = oidSSNVN.Find(Option)
			If (i != -1)
				SetInfoText("$Desc_StripSlots")
			Endif
		Endif	
	Elseif (CurrentPage == "$General settings")
		If Option == oidModStatus									; SYSTEM ==========
			SetInfoText("$Desc_ModStatus")
		Elseif Option == oidReconfigure
			SetInfoText("$Desc_Reconfigure")
		Elseif Option == oidOnOffPvic
			SetInfoText("$Desc_OnOffPvic")
		Elseif Option == oidOnOffPagg
			SetInfoText("$Desc_OnOffPagg")		
		Elseif Option == oidOnOffNVN
			SetInfoText("$Desc_OnOffNVN")
		Elseif Option == oidModExportSetting
			SetInfoText("$Desc_ModExportSetting")
		Elseif Option == oidModImportSetting
			SetInfoText("$Desc_ModImportSetting")
		Elseif Option == oidCleanUp
			SetInfoText("$Desc_CleanUpTwo")
		Elseif Option == oidModList
			SetInfoText("$Desc_ModList")
		Elseif Option == oidModCheck
			SetInfoText("$Desc_ModCheck")
		Elseif Option == oidDisplayBar
			SetInfoText("$Desc_DisplayBar")
		Elseif Option == oidQTEColorBar
			SetInfoText("$Desc_QTEColorBar")
		Elseif Option == oidMeterWidth
			SetInfoText("$Desc_MeterWidth")
		Elseif Option == oidMeterHeight
			SetInfoText("$Desc_MeterHeight")
		Elseif Option == oidAxisX
			SetInfoText("$Desc_AxisX")
		Elseif Option == oidAxisY
			SetInfoText("$Desc_AxisY")
		Elseif Option == oidHKOption								; HOTKEY SYSTEM ==========
			SetInfoText("$Desc_HKOption")
		Elseif Option == oidHKModifier
			SetInfoText("$Desc_ModifierHK")
		Endif
	Elseif (CurrentPage == "$Animation settings")
		If Option == oidHitInterrupt
			SetInfoText("$Desc_HitInterrupt")
		Elseif Option == oidCombatInterrupt
			SetInfoText("$Desc_CombatInterrupt")
		Endif
	Endif
	If Option == oidCheckSlots
		SetInfoText("$Desc_CheckSlots")
	Endif
EndEvent

Function SOCheckValue()
	Actor Target = (GetCurrentCrosshairRef() As Actor)
	If Target
		RessConfig.SOValue(Target, Player)
		RessConfig.SOValueDetails("All")
	Else
		RessConfig.SOValue(Player, Player)
		RessConfig.SOValueDetails("All")
	Endif
EndFunction
String Function SOTargetOrPlayerName()
	Actor Target = (GetCurrentCrosshairRef() As Actor)
	If Target
		Return Target.GetleveledActorBase().GetName()
	Else
		Return Player.GetleveledActorBase().GetName()
	Endif
EndFunction

; Deprecated
String[] Property QTEPrimaryS Auto Hidden
String Property QTEPrimarySO = "OneHanded" Auto Hidden
Int oidQTEPrimaryS 
Int QTEPrimarySIndex = 1
String[] Property QTESecondaryS Auto Hidden
String Property QTESecondarySO = "TwoHanded" Auto Hidden
Int oidQTESecondaryS 
Int QTESecondarySIndex = 1
Bool Property ReverseR = True Auto Hidden
Int oidReverseR
Bool Property ReverseRf = True Auto Hidden
Int oidReverseRf
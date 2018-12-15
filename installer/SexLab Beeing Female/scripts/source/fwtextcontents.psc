;/ Decompiled by Champollion V1.0.1
Source   : FWTextContents.psc
Modified : 2017-01-13 11:42:56
Compiled : 2017-01-18 08:35:04
User     : admin
Computer : PATRICK
/;
scriptName FWTextContents extends Quest

;-- Properties --------------------------------------
String property BabyHealth auto hidden
String property NPCFatherBornHealthyBoy = "You became father\n{0} has born a healthy little boy" auto hidden
String property InfoSpell_AndYou = "and from you" auto hidden
String property LoadingComplete auto hidden
String property StateUnknown = "Unknown" auto hidden
String property InfoSpell_ImpregnatedWoman = "{0} impregnated those {1} women: {2}" auto hidden
String property AddOnMiscInit = "Init Misc AddOn: {0}" auto hidden
String property YourPantys = "Your pantys are bloody" auto hidden
String property NoBeeingMaleSpell = "{0} doesn't have the BeeingMale spell" auto hidden
String property InfoSpell_CameInsideNames = "{0} came inside those women:\n{1}" auto hidden
String property StateID21 = "Pregnant by chaurus" auto hidden
String property StateNotFound = "The state {0} couldn't be found" auto hidden
String property InfoSpell_ChildOrder02 auto hidden
String property AddOnRaceInit = "Init Race AddOn: {0} - {1}" auto hidden
String property EstrusCharusFound = "BeeingFemale has located Estrus Chaurus" auto hidden
String property NPCCameInsideYou = "{0} came inside you" auto hidden
String property InfoSpell_CurrentState = "Current state: {0}" auto hidden
String property InfoSpell_Contraception = "Contraception: {0}" auto hidden
String property AddOnMiscRemoved = "Misc AddOn '{0}' has been removed" auto hidden
String property Req_BeeingFemaleNative auto hidden
String property Minute = "{0} Minute" auto hidden
String property InfoSpell_GotMoreSpermInside = "{0} have sperm from {1} man inside" auto hidden
String property AddOnCMERemovedCount = "{0} CME AddOns has been removed" auto hidden
String property AlcoholNotGoodForYourBaby = "Alcohol and drugs are harmful to your baby's health." auto hidden
String property AddOnCMERemoved = "CME AddOn '{0}' has been removed" auto hidden
String property Days = "{0} Days" auto hidden
String property Req_SKSEScript auto hidden
String property RaceSwitchedCompleted = "Race-Switched" auto hidden
String property InfoSpell_ChildParents auto hidden
String property Minutes = "{0} Minutes" auto hidden
String property YouHaveLostYourChild = "You have lost your child" auto hidden
String property StateID1 = "Ovulating" auto hidden
String property InfoSpell_GotNumSpermInWoman = "{0} got some sperm in {1} women" auto hidden
String property StateID4 = "1st Trimester" auto hidden
String property InfoSpell_ChildOrder04 auto hidden
String property InfoSpell_NotAnymore = "Not anymore" auto hidden
String property InfoSpell_UnknownParent auto hidden
String property StateID3 = "Menstruating" auto hidden
String property InfoSpell_GotNoSpermInWoman = "Got no sperm inside any woman" auto hidden
String property InfoSpell_StateDuration = "State duration: {0}" auto hidden
String property InfoSpell_SpermNames = "Got sperm inside from:\n{0}" auto hidden
String property InfoSpell_CameInsideWoman = "{0} came inside women: {1}" auto hidden
String property ForbiddenReason2 = "{0} is dead" auto hidden
String property Hour_Short = "{0}h" auto hidden
String property YourTampon = "Your tampon is bloody" auto hidden
String property InfoSpell_GotOneSpermInside = "{0} have sperm from one man inside" auto hidden
String property YouBornHealthyBoy = "You have born a healthy little boy" auto hidden
String property Updated = "BeeingFemale updated to version {0}" auto hidden
String property InfoSpell_PregnantWithNumOfBabys = "Pregnant with {0} babys" auto hidden
String property StateID7 = "Labor pains" auto hidden
String property YouBornHealthyGirl = "You have born a healthy little girl" auto hidden
String property AddOnRaceInitSimple = "Init Race AddOn: {0}" auto hidden
String property InfoSpell_ChildOrder03 auto hidden
String property ForbiddenReason5 = "Player is disabled" auto hidden
String property InfoSpell_ImpregnatedAnyWoman = "{0} impregnated any woman" auto hidden
String property StateID6 = "3rd Trimester" auto hidden
String property NoBeeingFemaleSpell = "{0} doesn't have the BeeingFemale spell" auto hidden
String property InfoSpell_StateSince = "since {0}" auto hidden
String property StateID0 = "Follicular Phase" auto hidden
String property Compatiblity_Reset = "The compatiblity was reseted" auto hidden
String property InfoSpell_ChildMotherIs auto hidden
String property SwitchState auto hidden
String property NPCHasLostItsChild = "{0} has lost her child" auto hidden
String property BeeingFemaleCastedOn = "BeeingFemale casted on {0}" auto hidden
String property Minute_Short = "{0}m" auto hidden
String property InfoSpell_ChildOrder05 auto hidden
String property FixProblem auto hidden
String property FNISTXTOverdue auto hidden
String property InfoSpell_UnbornBabyHealth = "Unborn babys health: {0}%" auto hidden
String property InfoSpell_ChildOrder01 auto hidden
String property InfoSpell_Yes = "Yes" auto hidden
String property Req_PapyrusUtil auto hidden
String property InfoSpell_GotSpermInWoman = "Got some sperm inside a woman" auto hidden
String property InfoSpell_GotYourSpermInside = "{0} have sperm from you inside" auto hidden
String property InfoSpell_Overdue = "Overdue" auto hidden
String property StateID2 = "Luteal Phase" auto hidden
String property InfoSpell_ChildVampire auto hidden
String property NPCTampon = "{0}s tampon is bloody" auto hidden
String property AddOnPMSRemovedCount = "{0} PMS AddOns has been removed" auto hidden
String property BeeingFemaleMissedOn2 = "BeeingFemale failed on {0} - NPC Menstruation deactivated" auto hidden
String property YourPregnantWaterBreaks = "Your pregnant water breaks" auto hidden
String property NoChildItem auto hidden
String property ActorHasContraception auto hidden
String property InitBF auto hidden
String property InfoSpell_No = "No" auto hidden
String property FNISTXTNotInstalled auto hidden
String property ForbiddenReason10 = "{0} is an elder" auto hidden
String property CheckGiveSperm auto hidden
String property FNISUsing auto hidden
String property FNISNotInstalled auto hidden
String property InfoSpell_UnknownParents auto hidden
String property NPCIsPregnant = "{0} is pregnant" auto hidden
String property ForbiddenReason4 = "{0} is not a unique character" auto hidden
String property FNISOverdue auto hidden
String property InfoSpell_CameInsideYou = "{0} came inside you" auto hidden
String property Req_BeeingFemaleNativeUpdate auto hidden
String property ForbiddenReason11 = "{0} is an elder" auto hidden
String property NPCCameInsideNPC = "{0} came inside {1}" auto hidden
String property InfoSpell_GotNoSpermInside = "{0} got no sperm inside" auto hidden
String property AddOnCMEInit = "Init CME AddOn: {0}" auto hidden
String property ForbiddenReason7 = "NPCs are forbidden" auto hidden
String property InfoSpell_ImpregnatedNumWoman = "{0} impregnated {1} women" auto hidden
String property YouArePregnant = "You are pregnant" auto hidden
String property Req_BF auto hidden
String property BabyName auto hidden
String property InstallComplete auto hidden
String property ForbiddenReason1 = "{0} is forbidden" auto hidden
String property InfoSpell_SpermVirility = "Sperm virility at {0}" auto hidden
String property InfoSpell_Male = "male" auto hidden
String property InfoSpell_She = "She" auto hidden
String property BabyBlankName auto hidden
String property ActorNotPregnant auto hidden
String property NoChildArmor auto hidden
String property InfoSpell_ChildWasBorn auto hidden
String property SpermAdded auto hidden
String property AddOnPMSInit = "Init PMS AddOn: {0}" auto hidden
String property InfoSpell_LooksPregnant = "Looks pregnant: {0}" auto hidden
String property NPCBornHealthyGirl = "{0} has born a healthy little girl" auto hidden
String property YouCameInsideNPC = "You came inside {0}" auto hidden
String property ChildLevelUp auto hidden
String property InfoSpell_ImpregnatedYou = "{0} impregnated you: {1}" auto hidden
String property InfoSpell_ChildOrder06 auto hidden
String property InfoSpell_ChildOrder00 auto hidden
String property InfoSpell_ChildGotOrder auto hidden
String property ForbiddenReason9 = "{0} is an elder" auto hidden
String property InfoSpell_ChildFollows auto hidden
String property InfoSpell_IsPregnant = "Is pregnant: {0}" auto hidden
String property InfoSpell_Female = "female" auto hidden
String property InfoSpell_He = "He" auto hidden
String property NPCPantys = "{0}s pantys are bloody" auto hidden
String property NPCBornHealthyBoy = "{0} has born a healthy little boy" auto hidden
String property UpdateComplete auto hidden
String property InfoSpell_CanBecomePregnant = "Can become pregnant this cycle: {0}" auto hidden
String property BeeingFemaleMissedOn = "BeeingFemale failed on {0}" auto hidden
String property AddOnRaceRemoved = "Race AddOn '{0}' has been removed" auto hidden
String property StatesAddedForNPC = "{0} states were added to {1} ({2})" auto hidden
String property ForbiddenReason6 = "Follower are forbidden" auto hidden
String property Req_Skyrim auto hidden
String property Hour = "{0} Hour" auto hidden
String property InfoSpell_LastContraception = "Last contraception medicine: {0}" auto hidden
String property AddOnPMSRemoved = "PMS AddOn '{0}' has been removed" auto hidden
String property InfoSpell_GotSpermInside = "{0} got some sperm inside" auto hidden
String property StateID8 = "Replenish from birth" auto hidden
String property NPCFatherBornHealthyGirl = "You became father\n{0} has born a healthy little girl" auto hidden
String property UninstallComplete = "Beeing Female was uninstalled. To finish the uninstall process, create a Savegame and restart Skyrim" auto
String property StateID5 = "2nd Trimester" auto hidden
String property StateID20 = "Pregnant" auto hidden
String property ForbiddenReason8 = "{0} is a child" auto hidden
String property Day_Short = "{0}d" auto hidden
String property ForbiddenReason3 = "{0} is {1}" auto hidden
String property Req_SKSE auto hidden
String property Hours = "{0} Hours" auto hidden
String property InfoSpell_ChildFatherIs auto hidden
String property Req_PlayerNotFoundOnRef auto hidden
String property Day = "{0} Day" auto hidden
String property NPCPregnantWaterBreaks = "{0}'s pregnant water breaks" auto hidden
String property InfoSpell_UnbornBabiesHealth = "Unborn babies health: {0}%" auto hidden
String property AlcoholNotGoodForNPCBaby = "Alcohol and drugs are harmful to {0}'s baby's health." auto hidden
String property AddOnRaceRemovedCount = "{0} Race AddOns has been removed" auto hidden
String property InfoSpell_You = "You" auto hidden
String property BeeingFemaleMissedOn1 = "BeeingFemale failed on {0} - Child, Dead, Male or NonUnique" auto hidden
String property AddOnMiscRemovedCount = "{0} Misc AddOns has been removed" auto hidden

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Int function getLangSize() global native

String function getFilePath() global native

function IOReadTranslation(String Langauge) global native

Int function getErrorCode() global native

String function getLangText(String VarName) global native

function Upgrade(Int oldVersion, Int newVersion)

	; Empty function
endFunction

; Skipped compiler generated GotoState

function LoadContent()

	debug.Trace("FWTextContents::LoadContent()", 0)
	String Language = utility.GetINIString("sLanguage:General")
	String LanguageFile = ""
	debug.Trace("FWTextContents::LoadContent() - " + Language, 0)
	FWTextContents.IOReadTranslation(Language)
	debug.Trace("FWTextContents::LoadContent() - Content loaded", 0)
	Int size = FWTextContents.getLangSize()
	debug.Trace("FWTextContents::LoadContent() - TextContent Size = " + size as String, 0)
	debug.Trace("FWTextContents::LoadContent() - Load in variable content", 0)
	NPCCameInsideNPC = FWTextContents.getLangText("GAME_CONTENT_NPCCameInsideNPC")
	NPCCameInsideYou = FWTextContents.getLangText("GAME_CONTENT_NPCCameInsideYou")
	YouCameInsideNPC = FWTextContents.getLangText("GAME_CONTENT_YouCameInsideNPC")
	InstallComplete = FWTextContents.getLangText("GAME_CONTENT_InstallComplete")
	LoadingComplete = FWTextContents.getLangText("GAME_CONTENT_LoadingComplete")
	UpdateComplete = FWTextContents.getLangText("GAME_CONTENT_UpdateComplete")
	InitBF = FWTextContents.getLangText("GAME_CONTENT_InitBF")
	FixProblem = FWTextContents.getLangText("GAME_CONTENT_FixProblem")
	Updated = FWTextContents.getLangText("GAME_CONTENT_Updated")
	UninstallComplete = FWTextContents.getLangText("GAME_CONTENT_UninstallComplete")
	YourPantys = FWTextContents.getLangText("GAME_CONTENT_YourPantys")
	NPCPantys = FWTextContents.getLangText("GAME_CONTENT_NPCPantys")
	YourTampon = FWTextContents.getLangText("GAME_CONTENT_YourTampon")
	NPCTampon = FWTextContents.getLangText("GAME_CONTENT_NPCTampon")
	NPCIsPregnant = FWTextContents.getLangText("GAME_CONTENT_NPCIsPregnant")
	YouArePregnant = FWTextContents.getLangText("GAME_CONTENT_YouArePregnant")
	NoBeeingFemaleSpell = FWTextContents.getLangText("GAME_CONTENT_NoBeeingFemaleSpell")
	NoBeeingMaleSpell = FWTextContents.getLangText("GAME_CONTENT_NoBeeingMaleSpell")
	YourPregnantWaterBreaks = FWTextContents.getLangText("GAME_CONTENT_YourPregnantWaterBreaks")
	NPCPregnantWaterBreaks = FWTextContents.getLangText("GAME_CONTENT_NPCPregnantWaterBreaks")
	NPCBornHealthyBoy = FWTextContents.getLangText("GAME_CONTENT_NPCBornHealthyBoy")
	NPCBornHealthyGirl = FWTextContents.getLangText("GAME_CONTENT_NPCBornHealthyGirl")
	NPCFatherBornHealthyBoy = FWTextContents.getLangText("GAME_CONTENT_NPCFatherBornHealthyBoy")
	NPCFatherBornHealthyGirl = FWTextContents.getLangText("GAME_CONTENT_NPCFatherBornHealthyGirl")
	YouBornHealthyBoy = FWTextContents.getLangText("GAME_CONTENT_YouBornHealthyBoy")
	YouBornHealthyGirl = FWTextContents.getLangText("GAME_CONTENT_YouBornHealthyGirl")
	BeeingFemaleCastedOn = FWTextContents.getLangText("GAME_CONTENT_BeeingFemaleCastedOn")
	BeeingFemaleMissedOn = FWTextContents.getLangText("GAME_CONTENT_BeeingFemaleMissedOn")
	BeeingFemaleMissedOn1 = FWTextContents.getLangText("GAME_CONTENT_BeeingFemaleMissedOn1")
	BeeingFemaleMissedOn2 = FWTextContents.getLangText("GAME_CONTENT_BeeingFemaleMissedOn2")
	AlcoholNotGoodForYourBaby = FWTextContents.getLangText("GAME_CONTENT_AlcoholNotGoodForYourBaby")
	AlcoholNotGoodForNPCBaby = FWTextContents.getLangText("GAME_CONTENT_AlcoholNotGoodForNPCBaby")
	StateNotFound = FWTextContents.getLangText("GAME_CONTENT_StateNotFound")
	Compatiblity_Reset = FWTextContents.getLangText("GAME_CONTENT_Compatiblity_Reset")
	YouHaveLostYourChild = FWTextContents.getLangText("GAME_CONTENT_YouHaveLostYourChild")
	NPCHasLostItsChild = FWTextContents.getLangText("GAME_CONTENT_NPCHasLostItsChild")
	AddOnRaceRemoved = FWTextContents.getLangText("GAME_CONTENT_AddOnRaceRemoved")
	AddOnPMSRemoved = FWTextContents.getLangText("GAME_CONTENT_AddOnPMSRemoved")
	AddOnMiscRemoved = FWTextContents.getLangText("GAME_CONTENT_AddOnMiscRemoved")
	AddOnCMERemoved = FWTextContents.getLangText("GAME_CONTENT_AddOnCMERemoved")
	AddOnRaceRemovedCount = FWTextContents.getLangText("GAME_CONTENT_AddOnRaceRemovedCount")
	AddOnPMSRemovedCount = FWTextContents.getLangText("GAME_CONTENT_AddOnPMSRemovedCount")
	AddOnMiscRemovedCount = FWTextContents.getLangText("GAME_CONTENT_AddOnMiscRemovedCount")
	AddOnCMERemovedCount = FWTextContents.getLangText("GAME_CONTENT_AddOnCMERemovedCount")
	AddOnRaceInit = FWTextContents.getLangText("GAME_CONTENT_AddOnRaceInit")
	AddOnPMSInit = FWTextContents.getLangText("GAME_CONTENT_AddOnPMSInit")
	AddOnCMEInit = FWTextContents.getLangText("GAME_CONTENT_AddOnCMEInit")
	AddOnMiscInit = FWTextContents.getLangText("GAME_CONTENT_AddOnMiscInit")
	AddOnRaceInitSimple = FWTextContents.getLangText("GAME_CONTENT_AddOnRaceInitSimple")
	EstrusCharusFound = FWTextContents.getLangText("GAME_CONTENT_EstrusCharusFound")
	RaceSwitchedCompleted = FWTextContents.getLangText("GAME_CONTENT_RaceSwitchedCompleted")
	StatesAddedForNPC = FWTextContents.getLangText("GAME_CONTENT_StatesAddedForNPC")
	Day = FWTextContents.getLangText("GAME_CONTENT_Day")
	Days = FWTextContents.getLangText("GAME_CONTENT_Days")
	Hour = FWTextContents.getLangText("GAME_CONTENT_Hour")
	Hours = FWTextContents.getLangText("GAME_CONTENT_Hours")
	Minute = FWTextContents.getLangText("GAME_CONTENT_Minute")
	Minutes = FWTextContents.getLangText("GAME_CONTENT_Minutes")
	Day_Short = FWTextContents.getLangText("GAME_CONTENT_Day_Short")
	Hour_Short = FWTextContents.getLangText("GAME_CONTENT_Hour_Short")
	Minute_Short = FWTextContents.getLangText("GAME_CONTENT_Minute_Short")
	StateID0 = FWTextContents.getLangText("GAME_CONTENT_StateID0")
	StateID1 = FWTextContents.getLangText("GAME_CONTENT_StateID1")
	StateID2 = FWTextContents.getLangText("GAME_CONTENT_StateID2")
	StateID3 = FWTextContents.getLangText("GAME_CONTENT_StateID3")
	StateID4 = FWTextContents.getLangText("GAME_CONTENT_StateID4")
	StateID5 = FWTextContents.getLangText("GAME_CONTENT_StateID5")
	StateID6 = FWTextContents.getLangText("GAME_CONTENT_StateID6")
	StateID7 = FWTextContents.getLangText("GAME_CONTENT_StateID7")
	StateID8 = FWTextContents.getLangText("GAME_CONTENT_StateID8")
	StateID20 = FWTextContents.getLangText("GAME_CONTENT_StateID20")
	StateID21 = FWTextContents.getLangText("GAME_CONTENT_StateID21")
	StateUnknown = FWTextContents.getLangText("GAME_CONTENT_StateUnknown")
	ForbiddenReason1 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason1")
	ForbiddenReason2 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason2")
	ForbiddenReason3 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason3")
	ForbiddenReason4 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason4")
	ForbiddenReason5 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason5")
	ForbiddenReason6 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason6")
	ForbiddenReason7 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason7")
	ForbiddenReason8 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason8")
	ForbiddenReason9 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason9")
	ForbiddenReason10 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason10")
	ForbiddenReason11 = FWTextContents.getLangText("FW_INFOWINDOW_ForbiddenReason11")
	InfoSpell_GotSpermInside = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_GotSpermInside")
	InfoSpell_GotNoSpermInside = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_GotNoSpermInside")
	InfoSpell_GotYourSpermInside = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_GotYourSpermInside")
	InfoSpell_GotOneSpermInside = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_GotOneSpermInside")
	InfoSpell_GotMoreSpermInside = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_GotMoreSpermInside")
	InfoSpell_CurrentState = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_CurrentState")
	InfoSpell_StateSince = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_StateSince")
	InfoSpell_StateDuration = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_StateDuration")
	InfoSpell_LooksPregnant = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_LooksPregnant")
	InfoSpell_IsPregnant = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_IsPregnant")
	InfoSpell_CanBecomePregnant = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_CanBecomePregnant")
	InfoSpell_PregnantWithNumOfBabys = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_PregnantWithNumOfBabys")
	InfoSpell_UnbornBabyHealth = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_UnbornBabyHealth")
	InfoSpell_UnbornBabiesHealth = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_UnbornBabiesHealth")
	InfoSpell_Contraception = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_Contraception")
	InfoSpell_LastContraception = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_LastContraception")
	InfoSpell_SpermNames = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_SpermNames")
	InfoSpell_GotSpermInWoman = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_GotSpermInWoman")
	InfoSpell_GotNoSpermInWoman = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_GotNoSpermInWoman")
	InfoSpell_GotNumSpermInWoman = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_GotNumSpermInWoman")
	InfoSpell_CameInsideYou = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_CameInsideYou")
	InfoSpell_CameInsideWoman = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_CameInsideWoman")
	InfoSpell_CameInsideNames = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_CameInsideNames")
	InfoSpell_ImpregnatedYou = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ImpregnatedYou")
	InfoSpell_ImpregnatedAnyWoman = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ImpregnatedAnyWoman")
	InfoSpell_ImpregnatedWoman = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ImpregnatedWoman")
	InfoSpell_ImpregnatedNumWoman = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ImpregnatedNumWoman")
	InfoSpell_SpermVirility = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_SpermVirility")
	InfoSpell_Yes = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_Yes")
	InfoSpell_No = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_No")
	InfoSpell_NotAnymore = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_NotAnymore")
	InfoSpell_You = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_You")
	InfoSpell_AndYou = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_AndYou")
	InfoSpell_Male = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_Male")
	InfoSpell_Female = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_Female")
	InfoSpell_He = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_He")
	InfoSpell_She = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_She")
	InfoSpell_Overdue = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_Overdue")
	InfoSpell_ChildParents = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildParents")
	InfoSpell_ChildFatherIs = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildFatherIs")
	InfoSpell_ChildMotherIs = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildMotherIs")
	InfoSpell_UnknownParents = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_UnknownParents")
	InfoSpell_UnknownParent = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_UnknownParent")
	InfoSpell_ChildWasBorn = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildWasBorn")
	InfoSpell_ChildVampire = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildVampire")
	InfoSpell_ChildFollows = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildFollows")
	InfoSpell_ChildGotOrder = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildGotOrder")
	InfoSpell_ChildOrder00 = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildOrder00")
	InfoSpell_ChildOrder01 = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildOrder01")
	InfoSpell_ChildOrder02 = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildOrder02")
	InfoSpell_ChildOrder03 = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildOrder03")
	InfoSpell_ChildOrder04 = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildOrder04")
	InfoSpell_ChildOrder05 = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildOrder05")
	InfoSpell_ChildOrder06 = FWTextContents.getLangText("GAME_CONTENT_InfoSpell_ChildOrder06")
	ChildLevelUp = FWTextContents.getLangText("GAME_CONTENT_ChildLevelUp")
	NoChildArmor = FWTextContents.getLangText("GAME_CONTENT_NoChildArmor")
	NoChildItem = FWTextContents.getLangText("GAME_CONTENT_NoChildItem")
	BabyBlankName = FWTextContents.getLangText("GAME_CONTENT_BabyBlankName")
	BabyName = FWTextContents.getLangText("GAME_CONTENT_BabyName")
	Req_BF = FWTextContents.getLangText("GAME_CONTENT_Req_BF")
	Req_Skyrim = FWTextContents.getLangText("GAME_CONTENT_Req_Skyrim")
	Req_SKSE = FWTextContents.getLangText("GAME_CONTENT_Req_SKSE")
	Req_SKSEScript = FWTextContents.getLangText("GAME_CONTENT_Req_SKSEScript")
	Req_PapyrusUtil = FWTextContents.getLangText("GAME_CONTENT_Req_PapyrusUtil")
	Req_PlayerNotFoundOnRef = FWTextContents.getLangText("GAME_CONTENT_Req_PlayerNotFoundOnRef")
	Req_BeeingFemaleNative = FWTextContents.getLangText("GAME_CONTENT_BeeingFemaleNative")
	Req_BeeingFemaleNativeUpdate = FWTextContents.getLangText("GAME_CONTENT_BeeingFemaleNativeUpdate")
	FNISNotInstalled = FWTextContents.getLangText("GAME_CONTENT_FNIS_NotInstalled")
	FNISOverdue = FWTextContents.getLangText("GAME_CONTENT_FNIS_Overdue")
	FNISUsing = FWTextContents.getLangText("GAME_CONTENT_FNIS_Using")
	FNISTXTNotInstalled = FWTextContents.getLangText("GAME_CONTENT_FNIS_TXTNotInstalled")
	FNISTXTOverdue = FWTextContents.getLangText("GAME_CONTENT_FNIS_TXTOverdue")
	SwitchState = FWTextContents.getLangText("GAME_CONTENT_SwitchState")
	ActorHasContraception = FWTextContents.getLangText("GAME_CONTENT_ActorHasContraception")
	BabyHealth = FWTextContents.getLangText("GAME_CONTENT_BabyHealth")
	ActorNotPregnant = FWTextContents.getLangText("GAME_CONTENT_ActorNotPregnant")
	debug.Trace("FWTextContents::LoadContent() Loading Done", 0)
endFunction

; Skipped compiler generated GetState

; Immersive Horses by sevencardz.
ScriptName IHOConfigMenuScript extends SKI_ConfigBase
{MCM and main quest script for Immersive Horses.}
import Game
import Utility
import Debug
import IHOUtil
UILIB_1 SkyUILib

; @implements SKI_QuestBase
int Function GetVersion()
	{Returns the version of this script}
	return 25
EndFunction

GlobalVariable Property IHOShowStatusMessages Auto
GlobalVariable Property IHOAddHorsePowersToPlayer Auto
GlobalVariable Property IHOProtectHorses Auto
GlobalVariable Property IHOHorsesIgnoreCombat Auto
GlobalVariable Property IHOHorsesWaitOnDismount Auto
GlobalVariable Property IHOLastHorseFastTravel Auto
GlobalVariable Property IHOPermaStolenHorses Auto
GlobalVariable Property IHOAllowHorsesInCities Auto
GlobalVariable Property IHOStandingActivationAction Auto
GlobalVariable Property IHOSneakingActivationAction Auto
GlobalVariable Property IHOMountedActivationAction Auto
GlobalVariable Property IHOMountedSpellCasting Auto
GlobalVariable Property IHOLootCorpsesWhileMounted Auto
GlobalVariable Property IHOFastDismountDrawWeapon Auto
GlobalVariable Property IHODisableTrampleEffect Auto
GlobalVariable Property IHODisableKickEffect Auto

Actor Property PlayerRef Auto
Race Property HorseRace Auto
Potion Property FoodCarrot Auto
Armor Property HorseHarness Auto
Keyword Property ActorTypeNPC Auto
Keyword Property ActorTypeHorse Auto
Outfit Property IHOHorseBarebackOutfit Auto
Sound Property IHOHorseWhistle Auto
Spell Property HorseSaddleFortifyCarryAbility Auto
Spell Property HorseJumpKickAbility Auto
Spell Property HorseTrampleCloakAbility Auto
Spell Property IHOPowerHorseWhistle Auto
Spell Property IHOPowerHorseListMenu Auto
Spell Property IHOPowerHorseOwnership Auto
FormList Property RidableWorldSpaces Auto

Faction Property PlayerHorseFaction Auto ; Horse belongs to the player.
Faction Property PotentialFollowerFaction Auto ; Assume the horse is persistent and claimable.
Faction Property CurrentFollowerFaction Auto ; Horse follows or waits for the player.
Faction Property DismissedFollowerFaction Auto ; Horse is dismissed from service.
Faction Property IHOAggressionHorseFaction Auto ; Used to persist horse aggression.
Faction Property IHOConfidenceHorseFaction Auto ; Used to persist horse confidence.
Faction Property IHOClaimedHorseFaction Auto ; Used to keep track of claimed horses.

; Horse Combat Ranks
int Property CombatHorseRank = 0 AutoReadOnly ; Horse participates in combat.
int Property StoicHorseRank = 1 AutoReadOnly ; Horse ignores combat.

; Horse Options Enumeration
int Property OptionCancel = 0 AutoReadOnly
int Property OptionMenu = 1 AutoReadOnly
int Property OptionRide = 2 AutoReadOnly
int Property OptionFollow = 3 AutoReadOnly
int Property OptionInventory = 4 AutoReadOnly
int Property OptionStats = 5 AutoReadOnly
int Property OptionDismiss = 6 AutoReadOnly
int Property OptionManage = 7 AutoReadOnly
int Property OptionTalk = 8 AutoReadOnly
int Property OptionAdopt = 9 AutoReadOnly

; Herd Options Enumeration
int Property OptionHerdFollow = 1 AutoReadOnly
int Property OptionHerdWait = 2 AutoReadOnly
int Property OptionHerdSummon = 3 AutoReadOnly
int Property OptionHerdDismiss = 4 AutoReadOnly

; Hotkeys
int Property HorseListMenuKeyCode = -1 Auto
int Property WhistleKeyCode = -1 Auto
int Property FollowOrWaitKeyCode = -1 Auto
int Property OpenInventoryKeyCode = -1 Auto
int Property ShowStatsKeyCode = -1 Auto
int Property DismissKeyCode = -1 Auto
int Property HerdOptionsMenuKeyCode = -1 Auto
int Property HerdFollowKeyCode = -1 Auto
int Property HerdWaitKeyCode = -1 Auto
int Property HerdSummonKeyCode = -1 Auto
int Property HerdDismissKeyCode = -1 Auto
int Property TrotOrCanterKeyCode = -1 Auto
int Property TalkKeyCode = -1 Auto
int Property HorseAttack2KeyCode = -1 Auto
int Property HorsePivotLeftKeyCode = -1 Auto
int Property HorsePivotRightKeyCode = -1 Auto
int Property NormalDismountKeyCode = -1 Auto
int Property FastLeftDismountKeyCode = -1 Auto
int Property FastRightDismountKeyCode = -1 Auto
int Property FastRearDismountKeyCode = -1 Auto

; Horse Management
Form[] Property PlayerHorseList Auto ; Player's Claimed Horses
Actor Property PlayerHorseRef = None Auto ; Player's Last Ridden Claimed Horse
String[] Property HorseListMenu Auto
int Property HorseListIndex = 0 Auto
int Property HorseListMenuOffset = 2 AutoReadOnly
int Property HorseActivationRange = 500 AutoReadOnly
int Property TrotSpeedMult = 50 AutoReadOnly
bool Property IsBusy = false Auto

; Displays a general message.
Function DisplayGeneralMessage(String msg, bool forceDisplay = false)
	if forceDisplay || IsTrue(IHOShowStatusMessages)
		if msg == "$IHO_PlayerNoHorse"
			msg = "I need a horse to do that."
		endif
		SkyUILib.ShowNotification(msg)
	endIf
EndFunction

; Displays a message about the given horse.
Function DisplayHorseMessage(Actor horseRef, String msg, bool forceDisplay = false)
	if forceDisplay || IsTrue(IHOShowStatusMessages)
		String horseName = "The horse"
		if horseRef != None
			horseName = horseRef.GetDisplayName()
		endif
		; Overide translation strings for notifications because we won't use the crappy SkyUILib notification area!
		if msg == "$IHO_HorseNoFollow"
			msg = horseName + " cannot follow me here."
		elseif msg == "$IHO_HorseNotNear"
			msg = horseName + " is too far away."
		elseif msg == "$IHO_HorseClaimed"
			msg = horseName + " is my permanent steed now."
		elseif msg == "$IHO_HorseBorrowed"
			msg = horseName + " is my temporary steed now."
		elseif msg == "$IHO_HorsePlayerOwner"
			msg = horseName + " belongs only to me now."
		elseif msg == "$IHO_HorseTeamOwner"
			msg = horseName + " belongs to my followers now."
		elseif msg == "$IHO_HorseFollowing"
			msg = horseName + " is following me."
		elseif msg == "$IHO_HorseWaiting"
			msg = horseName + " is waiting for me."
		elseif msg == "$IHO_HorseStolen"
			msg = horseName + " is stolen."
		elseif msg == "$IHO_HorseDismissed"
			msg = horseName + " is dismissed."
		elseif msg == "$IHO_HorseAbandoned"
			msg = horseName + " is abandoned."
		elseif msg == "$IHO_HorseDead{}"
			msg = horseName + " is dead."
		elseif msg == "$IHO_HorseNotAdopted"
			msg = horseName + " cannot be adopted."
		endif
		SkyUILib.ShowNotification(msg)
	endIf
EndFunction

; Updates the player's last ridden horse.
Function ApplyLastRiddenHorse(Actor horseRef, bool isMounted = false)
	PlayerHorseRef = horseRef
	if isMounted || IsTrue(IHOLastHorseFastTravel)
		SetPlayersLastRiddenHorse(horseRef)
	else
		SetPlayersLastRiddenHorse(None)
	endIf
EndFunction

; Gives each horse the protected flag if the horse can be protected and IHOProtectHorses is true.
; Removes the protected flag from each horse if the horse is protected and IHOProtectHorses if false.
Function ApplyProtectHorses()
	int i = 0
	while i < PlayerHorseList.Length
		Actor horseRef = PlayerHorseList[i] as Actor
		if horseRef != None
			ActorBase horseBaseRef = horseRef.GetLeveledActorBase()
			if IsTrue(IHOProtectHorses)
				if CanBeProtected(horseRef)
					horseBaseRef.SetProtected(true)
				endIf
			elseIf horseBaseRef.IsProtected()
				horseBaseRef.SetProtected(false)
			endIf
		endIf
		i += 1
	endWhile
EndFunction

; Adds or removes the horse powers to/from the player based on IHOAddHorsePowersToPlayer.
Function ApplyAddHorsePowersToPlayer()
	if IsTrue(IHOAddHorsePowersToPlayer)
		PlayerRef.AddSpell(IHOPowerHorseWhistle)
		PlayerRef.AddSpell(IHOPowerHorseListMenu)
		PlayerRef.AddSpell(IHOPowerHorseOwnership)
	else
		PlayerRef.RemoveSpell(IHOPowerHorseWhistle)
		PlayerRef.RemoveSpell(IHOPowerHorseListMenu)
		PlayerRef.RemoveSpell(IHOPowerHorseOwnership)
	endIf
EndFunction

; Adds or removes the ridable horse world spaces based on settings in the INI.
Function ApplyRidableWorldSpaces()
	LoadINIRidableWorldSpaces(RidableWorldSpaces, "RidableWorldSpaces")
	if IsTrue(IHOAllowHorsesInCities)
		HorseRace.ClearCantOpenDoors()
		LoadINIRidableWorldSpaces(RidableWorldSpaces, "RidableCityWorldSpaces")
	else
		HorseRace.SetCantOpenDoors()
		LoadINIRidableWorldSpaces(RidableWorldSpaces, "RidableCityWorldSpaces", removeForms = true)
		int i = 0
		while i < PlayerHorseList.Length
			if PlayerHorseList[i] != None
				Actor horseRef = PlayerHorseList[i] as Actor
				; Move the horse to its editor location if it is now in a non-ridable area.
				if horseRef.IsInInterior() || RidableWorldSpaces.Find(horseRef.GetWorldSpace()) == -1
					horseRef.MoveToMyEditorLocation()
				endIf
			endIf
			i += 1
		endWhile
	endIf
EndFunction

; @implements SKI_QuestBase
Event OnVersionUpdate(int version)
	{Called when a version update of this script has been detected}
	CheatModeCheck()
	Pages = new String[2]
    Pages[0] = "$IHO_PageTitleOptions"
    Pages[1] = "$IHO_PageTitleHotkeys"
	int modIndex = GetModByName("Immersive Horses.esp")
	String modVersion = GetModDescription(modIndex)
	SkyUILib.ShowNotification("Immersive Horses " + modVersion + " update complete.")
EndEvent

; @implements SKI_QuestBase
Event OnGameReload()
	{Called when the game is reloaded}
	parent.OnGameReload() ; Don't forget to call the parent!
	IsBusy = false
	ApplyRidableWorldSpaces()
	int i = 0
	while i < PlayerHorseList.Length
		Actor horseRef = PlayerHorseList[i] as Actor
		if horseRef != None
			PersistHorseActorValues(horseRef)
		endIf
		i += 1
	endWhile
EndEvent

; @implements SKI_ConfigBase
Event OnConfigInit()
	{Called when this config menu is initialized}
	SkyUILib = (self as Form) as UILIB_1 ; SkyUILib script attached to this quest.
	IHOShowStatusMessages.SetValueInt(LoadINIInt("ShowStatusMessages", 1))
	IHOAddHorsePowersToPlayer.SetValueInt(LoadINIInt("AddHorsePowersToPlayer", 1))
	IHOProtectHorses.SetValueInt(LoadINIInt("ProtectHorses", 0))
	IHOHorsesIgnoreCombat.SetValueInt(LoadINIInt("HorsesIgnoreCombat", 0))
	IHOHorsesWaitOnDismount.SetValueInt(LoadINIInt("HorsesWaitOnDismount", 0))
	IHOLastHorseFastTravel.SetValueInt(LoadINIInt("LastHorseFastTravel", 0))
	IHOPermaStolenHorses.SetValueInt(LoadINIInt("PermaStolenHorses", 0))
	IHOAllowHorsesInCities.SetValueInt(LoadINIInt("AllowHorsesInCities", 0))
	IHOStandingActivationAction.SetValueInt(LoadINIInt("StandingActivationAction", 1))
	IHOSneakingActivationAction.SetValueInt(LoadINIInt("SneakingActivationAction", 1))
	IHOMountedActivationAction.SetValueInt(LoadINIInt("MountedActivationAction", 1))
	IHOMountedSpellCasting.SetValueInt(LoadINIInt("MountedSpellCasting", 1))
	IHOLootCorpsesWhileMounted.SetValueInt(LoadINIInt("LootCorpsesWhileMounted", 1))
	IHOFastDismountDrawWeapon.SetValueInt(LoadINIInt("FastDismountDrawWeapon", 0))
	IHODisableKickEffect.SetValueInt(LoadINIInt("DisableKickEffect", 0))
	IHODisableTrampleEffect.SetValueInt(LoadINIInt("DisableTrampleEffect", 0))
	; Only load hotkey defaults if LoadHotkeysOnGameStart is true in the INI.
	if JaxonzConsolePlugin.GetPrivateINIBool(GetINIPath(), "Hotkeys", "LoadHotkeysOnGameStart")
		HorseListMenuKeyCode = LoadINIHotkey("HorseListMenuKeyCode")
		RegisterForKey(HorseListMenuKeyCode)
		WhistleKeyCode = LoadINIHotkey("WhistleKeyCode")
		RegisterForKey(WhistleKeyCode)
		FollowOrWaitKeyCode = LoadINIHotkey("FollowOrWaitKeyCode")
		RegisterForKey(FollowOrWaitKeyCode)
		OpenInventoryKeyCode = LoadINIHotkey("OpenInventoryKeyCode")
		RegisterForKey(OpenInventoryKeyCode)
		ShowStatsKeyCode = LoadINIHotkey("ShowStatsKeyCode")
		RegisterForKey(ShowStatsKeyCode)
		DismissKeyCode = LoadINIHotkey("DismissKeyCode")
		RegisterForKey(DismissKeyCode)
		HerdOptionsMenuKeyCode = LoadINIHotkey("HerdOptionsMenuKeyCode")
		RegisterForKey(HerdOptionsMenuKeyCode)
		HerdFollowKeyCode = LoadINIHotkey("HerdFollowKeyCode")
		RegisterForKey(HerdFollowKeyCode)
		HerdWaitKeyCode = LoadINIHotkey("HerdWaitKeyCode")
		RegisterForKey(HerdWaitKeyCode)
		HerdSummonKeyCode = LoadINIHotKey("HerdSummonKeyCode")
		RegisterForKey(HerdSummonKeyCode)
		HerdDismissKeyCode = LoadINIHotkey("HerdDismissKeyCode")
		RegisterForKey(HerdDismissKeyCode)
		TrotOrCanterKeyCode = LoadINIHotkey("TrotOrCanterKeyCode")
		TalkKeyCode = LoadINIHotkey("TalkKeyCode")
		HorseAttack2KeyCode = LoadINIHotkey("HorseAttack2KeyCode")
		HorsePivotLeftKeyCode = LoadINIHotkey("HorsePivotLeftKeyCode")
		HorsePivotRightKeyCode = LoadINIHotkey("HorsePivotRightKeyCode")
		NormalDismountKeyCode = LoadINIHotkey("NormalDismountKeyCode")
		FastLeftDismountKeyCode = LoadINIHotkey("FastLeftDismountKeyCode")
		FastRightDismountKeyCode = LoadINIHotkey("FastRightDismountKeyCode")
		FastRearDismountKeyCode = LoadINIHotkey("FastRearDismountKeyCode")
	endIf
	if PlayerRef.IsOnMount() ; Player must re-mount to properly initialize the horse.
		PlayerRef.Dismount()
	endIf
	PersistStabledHorses()
	ApplyProtectHorses()
	ApplyAddHorsePowersToPlayer()
EndEvent

; @implements SKI_ConfigBase
Event OnPageReset(String page)
	{Called when a new page is selected, including the initial empty page}
	if page == ""
		SendModEvent("SKICP_pageSelected", Pages[0], 0) ; Skip to the first page by default.
	elseIf page == "$IHO_PageTitleOptions"
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$IHO_HeaderTitleGeneral")
		AddToggleOptionST("ShowStatusMessages", "$IHO_ShowStatusMessagesTitle", IsTrue(IHOShowStatusMessages))
		AddToggleOptionST("AddHorsePowersToPlayer", "$IHO_AddHorsePowersToPlayerTitle", IsTrue(IHOAddHorsePowersToPlayer))
		AddEmptyOption() ; Spacer
		AddHeaderOption("$IHO_HeaderTitleHorses")
		AddToggleOptionST("ProtectHorses", "$IHO_ProtectHorsesTitle", IsTrue(IHOProtectHorses))
		AddToggleOptionST("HorsesIgnoreCombat", "$IHO_HorsesIgnoreCombatTitle", IsTrue(IHOHorsesIgnoreCombat))
		AddToggleOptionST("HorsesWaitOnDismount", "$IHO_HorsesWaitOnDismountTitle", IsTrue(IHOHorsesWaitOnDismount))
		AddToggleOptionST("LastHorseFastTravel", "$IHO_LastHorseFastTravelTitle", IsTrue(IHOLastHorseFastTravel))
		AddToggleOptionST("PermaStolenHorses", "$IHO_PermaStolenHorsesTitle", IsTrue(IHOPermaStolenHorses))
		AddToggleOptionST("AllowHorsesInCities", "$IHO_AllowHorsesInCitiesTitle", IsTrue(IHOAllowHorsesInCities))
		SetCursorPosition(1) ; Top of the right pane.
		AddHeaderOption("$IHO_HeaderTitleActivation")
		String[] optionsList = GetOptionsList(mounted = false)
		String[] mountedOptionsList = GetOptionsList(mounted = true)
		String standingAction = optionsList[IHOStandingActivationAction.GetValueInt()]
		String sneakingAction = optionsList[IHOSneakingActivationAction.GetValueInt()]
		String mountedAction = mountedOptionsList[IHOMountedActivationAction.GetValueInt()]
		AddMenuOptionST("StandingActivationAction", "$IHO_StandingActivationActionTitle", standingAction)
		AddMenuOptionST("SneakingActivationAction", "$IHO_SneakingActivationActionTitle", sneakingAction)
		AddMenuOptionST("MountedActivationAction", "$IHO_MountedActivationActionTitle", mountedAction)
		AddEmptyOption() ; Spacer
		AddHeaderOption("$IHO_HeaderTitleMounted")
		AddToggleOptionST("MountedSpellCasting", "$IHO_MountedSpellCastingTitle", IsTrue(IHOMountedSpellCasting))
		AddToggleOptionST("LootCorpsesWhileMounted", "$IHO_LootCorpsesWhileMountedTitle", IsTrue(IHOLootCorpsesWhileMounted))
		AddToggleOptionST("FastDismountDrawWeapon", "$IHO_FastDismountDrawWeaponTitle", IsTrue(IHOFastDismountDrawWeapon))
		AddToggleOptionST("DisableKickEffect", "$IHO_DisableKickEffectTitle", IsTrue(IHODisableKickEffect))
		AddToggleOptionST("DisableTrampleEffect", "$IHO_DisableTrampleEffectTitle", IsTrue(IHODisableTrampleEffect))
	elseIf page == "$IHO_PageTitleHotkeys"
		SetCursorFillMode(TOP_TO_BOTTOM)
		int unmap = OPTION_FLAG_WITH_UNMAP
		AddHeaderOption("$IHO_HeaderTitleMyHorse")
		AddKeyMapOptionST("HorseListMenuKeyCode", "$IHO_HorseListMenuKeyCodeTitle", HorseListMenuKeyCode, unmap)
		AddKeyMapOptionST("WhistleKeyCode", "$IHO_WhistleKeyCodeTitle", WhistleKeyCode, unmap)
		AddKeyMapOptionST("FollowOrWaitKeyCode", "$IHO_FollowOrWaitKeyCodeTitle", FollowOrWaitKeyCode, unmap)
		AddKeyMapOptionST("OpenInventoryKeyCode", "$IHO_OpenInventoryKeyCodeTitle", OpenInventoryKeyCode, unmap)
		AddKeyMapOptionST("ShowStatsKeyCode", "$IHO_ShowStatsKeyCodeTitle", ShowStatsKeyCode, unmap)
		AddKeyMapOptionST("DismissKeyCode", "$IHO_DismissKeyCodeTitle", DismissKeyCode, unmap)
		AddEmptyOption() ; Spacer
		AddHeaderOption("$IHO_HeaderTitleMyHerd")
		AddKeyMapOptionST("HerdOptionsMenuKeyCode", "$IHO_HerdOptionsMenuKeyCodeTitle", HerdOptionsMenuKeyCode, unmap)
		AddKeyMapOptionST("HerdFollowKeyCode", "$IHO_HerdFollowKeyCodeTitle", HerdFollowKeyCode, unmap)
		AddKeyMapOptionST("HerdWaitKeyCode", "$IHO_HerdWaitKeyCodeTitle", HerdWaitKeyCode, unmap)
		AddKeyMapOptionST("HerdSummonKeyCode", "$IHO_HerdSummonKeyCodeTitle", HerdSummonKeyCode, unmap)
		AddKeyMapOptionST("HerdDismissKeyCode", "$IHO_HerdDismissKeyCodeTitle", HerdDismissKeyCode, unmap)
		SetCursorPosition(1) ; Top of the right pane.
		AddHeaderOption("$IHO_HeaderTitleMounted")
		AddKeyMapOptionST("TrotOrCanterKeyCode", "$IHO_TrotOrCanterKeyCodeTitle", TrotOrCanterKeyCode, unmap)
		AddKeyMapOptionST("TalkKeyCode", "$IHO_TalkKeyCodeTitle", TalkKeyCode, unmap)
		AddKeyMapOptionST("HorseAttack2KeyCode", "$IHO_HorseAttack2KeyCodeTitle", HorseAttack2KeyCode, unmap)
		AddKeyMapOptionST("HorsePivotLeftKeyCode", "$IHO_HorsePivotLeftKeyCodeTitle", HorsePivotLeftKeyCode, unmap)
		AddKeyMapOptionST("HorsePivotRightKeyCode", "$IHO_HorsePivotRightKeyCodeTitle", HorsePivotRightKeyCode, unmap)
		AddEmptyOption() ; Spacer
		AddHeaderOption("$IHO_HeaderTitleDismounts")
		AddKeyMapOptionST("NormalDismountKeyCode", "$IHO_NormalDismountKeyCodeTitle", NormalDismountKeyCode, unmap)
		AddKeyMapOptionST("FastLeftDismountKeyCode", "$IHO_FastLeftDismountKeyCodeTitle", FastLeftDismountKeyCode, unmap)
		AddKeyMapOptionST("FastRightDismountKeyCode", "$IHO_FastRightDismountKeyCodeTitle", FastRightDismountKeyCode, unmap)
		AddKeyMapOptionST("FastRearDismountKeyCode", "$IHO_FastRearDismountKeyCodeTitle", FastRearDismountKeyCode, unmap)
	endIf
endEvent

state ShowStatusMessages
	event OnHighlightST()
		SetInfoText("$IHO_ShowStatusMessagesInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOShowStatusMessages)
		IHOShowStatusMessages.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("ShowStatusMessages", 1)
		IHOShowStatusMessages.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

state AddHorsePowersToPlayer
	event OnHighlightST()
		SetInfoText("$IHO_AddHorsePowersToPlayerInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOAddHorsePowersToPlayer)
		IHOAddHorsePowersToPlayer.SetValueInt(value as int)
		SetToggleOptionValueST(value)
		ApplyAddHorsePowersToPlayer()
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("AddHorsePowersToPlayer", 1)
		IHOAddHorsePowersToPlayer.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
		ApplyAddHorsePowersToPlayer()
	endEvent
endState

state ProtectHorses
	event OnHighlightST()
		SetInfoText("$IHO_ProtectHorsesInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOProtectHorses)
		IHOProtectHorses.SetValueInt(value as int)
		SetToggleOptionValueST(value)
		ApplyProtectHorses()
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("ProtectHorses", 0)
		IHOProtectHorses.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
		ApplyProtectHorses()
	endEvent
endState

state HorsesIgnoreCombat
	event OnHighlightST()
		SetInfoText("$IHO_HorsesIgnoreCombatInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOHorsesIgnoreCombat)
		IHOHorsesIgnoreCombat.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("HorsesIgnoreCombat", 0)
		IHOHorsesIgnoreCombat.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

state HorsesWaitOnDismount
	event OnHighlightST()
		SetInfoText("$IHO_HorsesWaitOnDismountInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOHorsesWaitOnDismount)
		IHOHorsesWaitOnDismount.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("HorsesWaitOnDismount", 0)
		IHOHorsesWaitOnDismount.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

state LastHorseFastTravel
	event OnHighlightST()
		SetInfoText("$IHO_LastHorseFastTravelInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOLastHorseFastTravel)
		IHOLastHorseFastTravel.SetValueInt(value as int)
		SetToggleOptionValueST(value)
		ApplyLastRiddenHorse(PlayerHorseRef)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("LastHorseFastTravel")
		IHOLastHorseFastTravel.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
		ApplyLastRiddenHorse(PlayerHorseRef)
	endEvent
endState

state PermaStolenHorses
	event OnHighlightST()
		SetInfoText("$IHO_PermaStolenHorsesInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOPermaStolenHorses)
		IHOPermaStolenHorses.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("PermaStolenHorses")
		IHOPermaStolenHorses.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

state AllowHorsesInCities
	event OnHighlightST()
		SetInfoText("$IHO_AllowHorsesInCitiesInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOAllowHorsesInCities)
		IHOAllowHorsesInCities.SetValueInt(value as int)
		SetToggleOptionValueST(value)
		ApplyRidableWorldSpaces()
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("AllowHorsesInCities")
		IHOAllowHorsesInCities.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
		ApplyRidableWorldSpaces()
	endEvent
endState

state StandingActivationAction
	event OnHighlightST()
		SetInfoText("$IHO_StandingActivationActionInfoText")
	endEvent
	event OnMenuOpenST()
		SetMenuDialogStartIndex(IHOStandingActivationAction.GetValueInt())
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(GetOptionsList(mounted = false))
	endEvent
	event OnMenuAcceptST(int index)
		IHOStandingActivationAction.SetValueInt(index)
		String[] optionsList = GetOptionsList(mounted = false)
		SetMenuOptionValueST(optionsList[index])
	endEvent
	event OnDefaultST()
		SetMenuOptionValueST(LoadINIInt("StandingActivationAction", 1))
	endEvent
endState

state SneakingActivationAction
	event OnHighlightST()
		SetInfoText("$IHO_SneakingActivationActionInfoText")
	endEvent
	event OnMenuOpenST()
		SetMenuDialogStartIndex(IHOSneakingActivationAction.GetValueInt())
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(GetOptionsList(mounted = false))
	endEvent
	event OnMenuAcceptST(int index)
		IHOSneakingActivationAction.SetValueInt(index)
		String[] optionsList = GetOptionsList(mounted = false)
		SetMenuOptionValueST(optionsList[index])
	endEvent
	event OnDefaultST()
		SetMenuOptionValueST(LoadINIInt("SneakingActivationAction", 1))
	endEvent
endState

state MountedActivationAction
	event OnHighlightST()
		SetInfoText("$IHO_MountedActivationActionInfoText")
	endEvent
	event OnMenuOpenST()
		SetMenuDialogStartIndex(IHOMountedActivationAction.GetValueInt())
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(GetOptionsList(mounted = true))
	endEvent
	event OnMenuAcceptST(int index)
		IHOMountedActivationAction.SetValueInt(index)
		String[] optionsList = GetOptionsList(mounted = false)
		SetMenuOptionValueST(optionsList[index])
	endEvent
	event OnDefaultST()
		SetMenuOptionValueST(LoadINIInt("MountedActivationAction", 1))
	endEvent
endState

state MountedSpellCasting
	event OnHighlightST()
		SetInfoText("$IHO_MountedSpellCastingInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOMountedSpellCasting)
		IHOMountedSpellCasting.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("MountedSpellCasting")
		IHOMountedSpellCasting.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

state LootCorpsesWhileMounted
	event OnHighlightST()
		SetInfoText("$IHO_LootCorpsesWhileMountedInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOLootCorpsesWhileMounted)
		IHOLootCorpsesWhileMounted.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("LootCorpsesWhileMounted")
		IHOLootCorpsesWhileMounted.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

state FastDismountDrawWeapon
	event OnHighlightST()
		SetInfoText("$IHO_FastDismountDrawWeaponInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHOFastDismountDrawWeapon)
		IHOFastDismountDrawWeapon.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("FastDismountDrawWeapon")
		IHOFastDismountDrawWeapon.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

state DisableKickEffect
	event OnHighlightST()
		SetInfoText("$IHO_DisableKickEffectInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHODisableKickEffect)
		IHODisableKickEffect.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("DisableKickEffect")
		IHODisableKickEffect.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

state DisableTrampleEffect
	event OnHighlightST()
		SetInfoText("$IHO_DisableTrampleEffectInfoText")
	endEvent
	event OnSelectST()
		bool value = !IsTrue(IHODisableTrampleEffect)
		IHODisableTrampleEffect.SetValueInt(value as int)
		SetToggleOptionValueST(value)
	endEvent
	event OnDefaultST()
		int value = LoadINIInt("DisableTrampleEffect")
		IHODisableTrampleEffect.SetValueInt(value)
		SetToggleOptionValueST(value as bool)
	endEvent
endState

; Helper function to handle key map conflicts.
bool Function passesKeyConflictControl(int keyCode, String conflictControl, String conflictName)
	if conflictControl != "" && keyCode > 0
		String msg = "$IHO_KeyConflict{" + conflictControl + "}"
		if conflictName != ""
			msg += "{" + conflictName + "}"
		endIf
		return ShowMessage(msg, true, "$Yes", "$No")
	else
		return true
	endIf
EndFunction

; Helper function for mapping or remapping a hotkey.
Function RegisterKeyMappingST(int registeredKeyCode, int newKeyCode)
	UnregisterForKey(registeredKeyCode)
	SetKeymapOptionValueST(newKeyCode)
	RegisterForKey(newKeyCode)
EndFunction

state HorseListMenuKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HorseListMenuKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(HorseListMenuKeyCode, keyCode)
			HorseListMenuKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HorseListMenuKeyCode")
		RegisterKeyMappingST(HorseListMenuKeyCode, keyCode)
		HorseListMenuKeyCode = keyCode
    endEvent
endState

state WhistleKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_WhistleKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(WhistleKeyCode, keyCode)
			WhistleKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("WhistleKeyCode")
		RegisterKeyMappingST(WhistleKeyCode, keyCode)
		WhistleKeyCode = keyCode
    endEvent
endState

state FollowOrWaitKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_FollowOrWaitKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(FollowOrWaitKeyCode, keyCode)
			FollowOrWaitKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("FollowOrWaitKeyCode")
		RegisterKeyMappingST(FollowOrWaitKeyCode, keyCode)
		FollowOrWaitKeyCode = keyCode
    endEvent
endState

state OpenInventoryKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_OpenInventoryKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(OpenInventoryKeyCode, keyCode)
			OpenInventoryKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("OpenInventoryKeyCode")
		RegisterKeyMappingST(OpenInventoryKeyCode, keyCode)
		OpenInventoryKeyCode = keyCode
    endEvent
endState

state ShowStatsKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_ShowStatsKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(ShowStatsKeyCode, keyCode)
			ShowStatsKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("ShowStatsKeyCode")
		RegisterKeyMappingST(ShowStatsKeyCode, keyCode)
		ShowStatsKeyCode = keyCode
    endEvent
endState

state DismissKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_DismissKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(DismissKeyCode, keyCode)
			DismissKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("DismissKeyCode")
		RegisterKeyMappingST(DismissKeyCode, keyCode)
		DismissKeyCode = keyCode
    endEvent
endState

state HerdOptionsMenuKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HerdOptionsMenuKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(HerdOptionsMenuKeyCode, keyCode)
			HerdOptionsMenuKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HerdOptionsMenuKeyCode")
		RegisterKeyMappingST(HerdOptionsMenuKeyCode, keyCode)
		HerdOptionsMenuKeyCode = keyCode
    endEvent
endState

state HerdFollowKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HerdFollowKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(HerdFollowKeyCode, keyCode)
			HerdFollowKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HerdFollowKeyCode")
		RegisterKeyMappingST(HerdFollowKeyCode, keyCode)
		HerdFollowKeyCode = keyCode
    endEvent
endState

state HerdWaitKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HerdWaitKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(HerdWaitKeyCode, keyCode)
			HerdWaitKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HerdWaitKeyCode")
		RegisterKeyMappingST(HerdWaitKeyCode, keyCode)
		HerdWaitKeyCode = keyCode
    endEvent
endState

state HerdSummonKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HerdSummonKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(HerdSummonKeyCode, keyCode)
			HerdSummonKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HerdSummonKeyCode")
		RegisterKeyMappingST(HerdSummonKeyCode, keyCode)
		HerdSummonKeyCode = keyCode
    endEvent
endState

state HerdDismissKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HerdDismissKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(HerdDismissKeyCode, keyCode)
			HerdDismissKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HerdDismissKeyCode")
		RegisterKeyMappingST(HerdDismissKeyCode, keyCode)
		HerdDismissKeyCode = keyCode
    endEvent
endState

state TrotOrCanterKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_TrotOrCanterKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			SetKeymapOptionValueST(keyCode)
			TrotOrCanterKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("TrotOrCanterKeyCode")
		SetKeymapOptionValueST(keyCode)
		TrotOrCanterKeyCode = keyCode
    endEvent
endState

state TalkKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_TalkKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			SetKeymapOptionValueST(keyCode)
			TalkKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("TalkKeyCode")
		SetKeymapOptionValueST(keyCode)
		TalkKeyCode = keyCode
    endEvent
endState

state HorseAttack2KeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HorseAttack2KeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			SetKeymapOptionValueST(keyCode)
			HorseAttack2KeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HorseAttack2KeyCode")
		SetKeymapOptionValueST(keyCode)
		HorseAttack2KeyCode = keyCode
    endEvent
endState

state HorsePivotLeftKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HorsePivotLeftKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			SetKeymapOptionValueST(keyCode)
			HorsePivotLeftKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HorsePivotLeftKeyCode")
		SetKeymapOptionValueST(keyCode)
		HorsePivotLeftKeyCode = keyCode
    endEvent
endState

state HorsePivotRightKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_HorsePivotRightKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			SetKeymapOptionValueST(keyCode)
			HorsePivotRightKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("HorsePivotRightKeyCode")
		SetKeymapOptionValueST(keyCode)
		HorsePivotRightKeyCode = keyCode
    endEvent
endState

state NormalDismountKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_NormalDismountKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			SetKeymapOptionValueST(keyCode)
			NormalDismountKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("NormalDismountKeyCode")
		SetKeymapOptionValueST(keyCode)
		NormalDismountKeyCode = keyCode
    endEvent
endState

state FastLeftDismountKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_FastLeftDismountKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			SetKeymapOptionValueST(keyCode)
			FastLeftDismountKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("FastLeftDismountKeyCode")
		SetKeymapOptionValueST(keyCode)
		FastLeftDismountKeyCode = keyCode
    endEvent
endState

state FastRightDismountKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_FastRightDismountKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			SetKeymapOptionValueST(keyCode)
			FastRightDismountKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("FastRightDismountKeyCode")
		SetKeymapOptionValueST(keyCode)
		FastRightDismountKeyCode = keyCode
    endEvent
endState

state FastRearDismountKeyCode
    event OnHighlightST()
        SetInfoText("$IHO_FastRearDismountKeyCodeInfoText")
    endEvent
    event OnKeyMapChangeST(int keyCode, String conflictControl, String conflictName)
		if passesKeyConflictControl(keyCode, conflictControl, conflictName)
			RegisterKeyMappingST(FastRearDismountKeyCode, keyCode)
			FastRearDismountKeyCode = keyCode
		endIf
    endEvent
    event OnDefaultST()
		int keyCode = LoadINIHotkey("FastRearDismountKeyCode")
		RegisterKeyMappingST(FastRearDismountKeyCode, keyCode)
		FastRearDismountKeyCode = keyCode
    endEvent
endState

; Executes the mapped horse command when a hotkey is pressed.
event OnKeyDown(int keyCode)
	; Quit if a menu is open or if text input is enabled.
	if keyCode == -1 || IsInMenuMode() || UI.IsTextInputEnabled()
		return
	endIf
	if keyCode == HorseListMenuKeyCode
		UpdateHorseListMenu()
		ShowHorseListMenu()
	endIf
	if PlayerHorseRef == None || PlayerHorseRef.IsDead()
		DisplayGeneralMessage("$IHO_PlayerNoHorse", forceDisplay = true)
		return
	endIf
	if keyCode == WhistleKeyCode
		HorseWhistle(PlayerHorseRef)
	elseIf keyCode == FollowOrWaitKeyCode
		FollowOrWait(PlayerHorseRef)
	elseIf keyCode == OpenInventoryKeyCode
		if PlayerHorseRef.GetDistance(PlayerRef) > HorseActivationRange ; Horse is too far away.
			DisplayHorseMessage(PlayerHorseRef, "$IHO_HorseNotNear")
		else
			HorseInventory(PlayerHorseRef)
		endIf
	elseIf keyCode == ShowStatsKeyCode
		IHOStats.ShowHorseStats(PlayerHorseRef, IsPersistent(PlayerHorseRef))
	elseIf keyCode == DismissKeyCode
		DismissHorse(PlayerHorseRef)
	else
		if keyCode == HerdOptionsMenuKeyCode
			ShowHerdOptionsMenu(showHorseListOnCancel = false)
		elseIf keyCode == HerdFollowKeyCode
			CommandHerd(OptionHerdFollow)
		elseIf keyCode == HerdWaitKeyCode
			CommandHerd(OptionHerdWait)
		elseIf keyCode == HerdSummonKeyCode
			CommandHerd(OptionHerdSummon)
		elseIf keyCode == HerdDismissKeyCode
			CommandHerd(OptionHerdDismiss)
		endIf
	endIf
endEvent

; Returns true if the horse is persistent.
bool Function IsPersistent(Actor horseRef)
	return horseRef.IsInFaction(PotentialFollowerFaction)
EndFunction

; Returns true if the horse is following the player.
bool Function IsFollowingPlayer(Actor horseRef)
	return horseRef.IsInFaction(CurrentFollowerFaction) &&\
		   horseRef.GetActorValue("WaitingForPlayer") == 0
EndFunction

; Returns the text to display for the 'following' section of the horse options menu.
String Function GetFollowingText(Actor horseRef)
	if IsFollowingPlayer(horseRef)
		return "$IHO_MenuTextWaitHere"
	else ; Horse is either unclaimed, dismissed, or waiting.
		return "$IHO_MenuTextFollowMe"
	endIf
EndFunction

; Returns the text to display for the 'talk' section of the horse options menu.
String Function GetTalkText()
	if IsTrue(IHOLootCorpsesWhileMounted)
		return "$IHO_MenuTextTalkOrSearch"
	else
		return "$IHO_MenuTextTalk"
	endIf
EndFunction

; Updates the horse list menu array to reflect the current list of horse names and statuses.
Function UpdateHorseListMenu()
	HorseListMenu = CreateStringArray(PlayerHorseList.Length + HorseListMenuOffset)
	HorseListMenu[0] = "$IHO_MenuTextCancel"
	HorseListMenu[1] = "$IHO_MenuTextMyHerd"
	int i = 0
	; Populate the horse names and statuses from the horse list.
	while i < PlayerHorseList.Length
		Actor horseRef = PlayerHorseList[i] as Actor
		; Abandon the horse if it was lost or player ownership was lost somehow.
		if horseRef == None || !horseRef.IsInFaction(PlayerHorseFaction)
			AbandonHorse(horseRef)
			i -= 1 ; Retry this slot.
		else ; Mark the horse's current status.
			String status = ""
			if horseRef.IsBeingRidden()
				status = "$IHO_HorseStatusMounted"
			elseIf horseRef.IsInFaction(CurrentFollowerFaction)
				if IsFollowingPlayer(horseRef)
					status = "$IHO_HorseStatusFollowing"
				else
					status = "$IHO_HorseStatusWaiting"
				endIf
			elseIf horseRef.IsInFaction(DismissedFollowerFaction)
				status = "$IHO_HorseStatusDismissed"
			endIf
			HorseListMenu[i + HorseListMenuOffset] = status + "{" + horseRef.GetDisplayName() +"}"
		endIf
		i += 1
	endWhile
EndFunction

; Shows the horse list menu.
Function ShowHorseListMenu()
	if PlayerHorseList.Length == 0
		DisplayGeneralMessage("$IHO_PlayerNoHorse", forceDisplay = true)
		return
	endIf
	if PlayerHorseList.Length == 1
		HorseListIndex = HorseListMenuOffset
	else ; Many Horses
		String title = "$IHO_MenuTextClaimedHorses{" + PlayerHorseList.Length + "}"
		HorseListIndex = SkyUILib.ShowList(title, HorseListMenu, aiStartIndex = 0, aiDefaultIndex = 0)
	endIf
	if HorseListIndex == 1 ; Entire Herd
		ShowHerdOptionsMenu(showHorseListOnCancel = true)
	elseIf HorseListIndex >= HorseListMenuOffset ; Single Horse
		ShowHorseOptionsSubMenu()
	endIf
EndFunction

; Shows the horse options menu for a persistent horse.
int Function ShowHorseOptionsMenu(Actor horseRef)
	String horseName = horseRef.GetDisplayName()
	String[] HorseOptionsMenu = new String[7]
	HorseOptionsMenu[0] = "$IHO_MenuTextCancel"
	HorseOptionsMenu[1] = "$IHO_MenuTextRide"
	HorseOptionsMenu[2] = GetFollowingText(horseRef)
	HorseOptionsMenu[3] = "$IHO_MenuTextOpenInventory"
	HorseOptionsMenu[4] = "$IHO_MenuTextShowStats"
	HorseOptionsMenu[5] = "$IHO_MenuTextDismiss"
	HorseOptionsMenu[6] = "$IHO_MenuTextManageHorses"
	int choice = SkyUILib.ShowList(horseName, HorseOptionsMenu, aiStartIndex = 0, aiDefaultIndex = 6)
	if choice == 0
		return OptionCancel
	elseIf choice == 1
		return OptionRide
	elseIf choice == 2
		return OptionFollow
	elseIf choice == 3
		return OptionInventory
	elseIf choice == 4
		return OptionStats
	elseIf choice == 5
		return OptionDismiss
	elseIf choice == 6
		return OptionManage
	endIf
EndFunction

; Shows the horse options menu for a temporary horse.
int Function ShowTempHorseOptionsMenu(Actor horseRef)
	String horseName = horseRef.GetDisplayName()
	String[] HorseOptionsMenu = new String[6]
	HorseOptionsMenu[0] = "$IHO_MenuTextCancel"
	HorseOptionsMenu[1] = "$IHO_MenuTextRide"
	HorseOptionsMenu[2] = GetFollowingText(horseRef)
	HorseOptionsMenu[3] = "$IHO_MenuTextShowStats"
	HorseOptionsMenu[4] = "$IHO_MenuTextAdopt"
	HorseOptionsMenu[5] = "$IHO_MenuTextManageHorses"
	int choice = SkyUILib.ShowList(horseName, HorseOptionsMenu, aiStartIndex = 0, aiDefaultIndex = 4)
	if choice == 0
		return OptionCancel
	elseIf choice == 1
		return OptionRide
	elseIf choice == 2
		return OptionFollow
	elseIf choice == 3
		return OptionStats
	elseIf choice == 4
		return OptionAdopt
	elseIf choice == 5
		return OptionManage
	endIf
EndFunction

; Shows the mounted horse options menu for a persistent horse.
int Function ShowMountedHorseOptionsMenu(Actor horseRef)
	String horseName = horseRef.GetDisplayName()
	String[] HorseOptionsMenu = new String[6]
	HorseOptionsMenu[0] = "$IHO_MenuTextCancel"
	HorseOptionsMenu[1] = "$IHO_MenuTextDismount"
	HorseOptionsMenu[2] = GetTalkText()
	HorseOptionsMenu[3] = "$IHO_MenuTextOpenInventory"
	HorseOptionsMenu[4] = "$IHO_MenuTextShowStats"
	HorseOptionsMenu[5] = "$IHO_MenuTextManageHorses"
	int choice = SkyUILib.ShowList(horseName, HorseOptionsMenu, aiStartIndex = 0, aiDefaultIndex = 5)
	if choice == 0
		return OptionCancel
	elseIf choice == 1
		return OptionRide
	elseIf choice == 2
		return OptionTalk
	elseIf choice == 3
		return OptionInventory
	elseIf choice == 4
		return OptionStats
	elseIf choice == 5
		return OptionManage
	endIf
EndFunction

; Shows the mounted horse options menu for a temporary horse.
int Function ShowTempMountedHorseOptionsMenu(Actor horseRef)
	String horseName = horseRef.GetDisplayName()
	String[] HorseOptionsMenu = new String[5]
	HorseOptionsMenu[0] = "$IHO_MenuTextCancel"
	HorseOptionsMenu[1] = "$IHO_MenuTextDismount"
	HorseOptionsMenu[2] = GetTalkText()
	HorseOptionsMenu[3] = "$IHO_MenuTextShowStats"
	HorseOptionsMenu[4] = "$IHO_MenuTextManageHorses"
	int choice = SkyUILib.ShowList(horseName, HorseOptionsMenu, aiStartIndex = 0, aiDefaultIndex = 4)
	if choice == 0
		return OptionCancel
	elseIf choice == 1
		return OptionRide
	elseIf choice == 2
		return OptionTalk
	elseIf choice == 3
		return OptionStats
	elseIf choice == 4
		return OptionManage
	endIf
EndFunction

; Shows the horse options sub-menu for a persistent horse.
Function ShowHorseOptionsSubMenu()
	int chosenHorseIndex = HorseListIndex - HorseListMenuOffset
	Actor horseRef = PlayerHorseList[chosenHorseIndex] as Actor
	String horseName = horseRef.GetDisplayName()
	String[] HorseOptionsSubMenu = new String[11]
	HorseOptionsSubMenu[0] = "$IHO_MenuTextCancel"
	HorseOptionsSubMenu[1] = "$IHO_MenuTextWhistle"
	HorseOptionsSubMenu[2] = GetFollowingText(horseRef)
	HorseOptionsSubMenu[3] = "$IHO_MenuTextOpenInventory"
	HorseOptionsSubMenu[4] = "$IHO_MenuTextShowStats"
	HorseOptionsSubMenu[5] = "$IHO_MenuTextDismiss"
	HorseOptionsSubMenu[6] = "$IHO_MenuTextChangeOwnership{}"
	HorseOptionsSubMenu[7] = "$IHO_MenuTextChangeAggression{}"
	HorseOptionsSubMenu[8] = "$IHO_MenuTextChangeConfidence{}"
	HorseOptionsSubMenu[9] = "$IHO_MenuTextRename{}"
	HorseOptionsSubMenu[10] = "$IHO_MenuTextSwapPositions{}"
	int choice = SkyUILib.ShowList(horseName, HorseOptionsSubMenu, aiStartIndex = 0, aiDefaultIndex = 0)
	if choice == 0 && PlayerHorseList.Length > 1 ; Cancel
		HorseListIndex = 0
		ShowHorseListMenu()
	elseIf choice == 1 ; Whistle
		HorseWhistle(horseRef)
		HorseListIndex = 0
	elseIf choice == 2 ; Follow
		FollowOrWait(horseRef)
	elseIf choice == 3 ; Inventory
		HorseInventory(horseRef)
	elseIf choice == 4 ; Stats
		IHOStats.ShowHorseStats(horseRef, IsPersistent(horseRef))
	elseIf choice == 5 ; Dismiss
		DismissHorse(horseRef)
	elseIf choice == 6 ; Ownership
		ShowHorseOwnershipMenu(horseRef, returnToSubMenu = true)
	elseIf choice == 7 ; Aggression
		ShowHorseAggressionMenu(horseRef)
		ShowHorseOptionsSubMenu()
	elseIf choice == 8 ; Confidence
		ShowHorseConfidenceMenu(horseRef)
		ShowHorseOptionsSubMenu()
	elseIf choice == 9 ; Rename
		RenameHorse(horseRef)
		ShowHorseOptionsSubMenu()
	elseIf choice == 10 ; Swap
		ShowHorseSwapPositionsMenu(chosenHorseIndex)
		UpdateHorseListMenu()
		ShowHorseOptionsSubMenu()
	endIf
EndFunction

; Shows the horse ownership menu for a persistent horse.
Function ShowHorseOwnershipMenu(Actor horseRef, bool returnToSubMenu = false)
	String[] HorseOwnershipMenu = new String[4]
	HorseOwnershipMenu[0] = "$IHO_MenuTextCancel"
	HorseOwnershipMenu[1] = "$IHO_MenuTextOnlyMe"
	HorseOwnershipMenu[2] = "$IHO_MenuTextMyTeam"
	HorseOwnershipMenu[3] = "$IHO_MenuTextAbandon"
	String title = "$IHO_MenuTextChangeOwnership{" + horseRef.GetDisplayName() + "}"
	int choice = SkyUILib.ShowList(title, HorseOwnershipMenu, aiStartIndex = 0, aiDefaultIndex = 0)
	if choice == 1 ; Player
		horseRef.SetActorOwner(PlayerRef.GetActorBase())
		DisplayHorseMessage(horseRef, "$IHO_HorsePlayerOwner")
	elseIf choice == 2 ; Team
		horseRef.SetFactionOwner(CurrentFollowerFaction)
		DisplayHorseMessage(horseRef, "$IHO_HorseTeamOwner")
	elseIf choice == 3 ; Abandon
		if AbandonHorse(horseRef)
			DisplayHorseMessage(horseRef, "$IHO_HorseAbandoned")
			UpdateHorseListMenu()
		endIf
	endIf
	if choice != 3 && returnToSubMenu
		ShowHorseOptionsSubMenu()
	endIf
EndFunction

; Shows the herd options menu for all persistent horses.
Function ShowHerdOptionsMenu(bool showHorseListOnCancel = false)
	String[] AllHorsesMenu = new String[5]
	AllHorsesMenu[0] = "$IHO_MenuTextCancel"
	AllHorsesMenu[1] = "$IHO_MenuTextHerdFollowMe"
	AllHorsesMenu[2] = "$IHO_MenuTextHerdWaitHere"
	AllHorsesMenu[3] = "$IHO_MenuTextSummonAllHorses"
	AllHorsesMenu[4] = "$IHO_MenuTextDismissAllHorses"
	int choice = SkyUILib.ShowList("$IHO_MenuTextMyHerd", AllHorsesMenu, aiStartIndex = 0, aiDefaultIndex = 0)
	if choice == 0 && showHorseListOnCancel ; Cancel
		HorseListIndex = 0
		ShowHorseListMenu()
	else
		CommandHerd(choice)
	endIf
EndFunction

; Summons all horses to follow the player by blowing a horn.  Teleports them nearby if necessary.
Function SummonHerd(bool summonDismissed = false)
	int i = 0
	while i < PlayerHorseList.Length
		Actor horseRef = PlayerHorseList[i] as Actor
		; Dismissed horses will only follow the player if summonDismissed is true.
		if horseRef != None && (horseRef.IsInFaction(CurrentFollowerFaction) || summonDismissed)
			; Horses can only follow the player to non-interior locations and ridable world spaces.
			if PlayerRef.IsInInterior() || !RidableWorldSpaces.HasForm(PlayerRef.GetWorldSpace())
				DisplayHorseMessage(horseRef, "$IHO_HorseNoFollow")
			else
				; Teleport the horse to the player if it is not nearby, not in sight, and not being ridden.
				if !horseRef.IsNearPlayer() && !playerRef.HasLOS(horseRef) && !horseRef.IsBeingRidden()
					TeleHorse(horseRef)
				endIf
				FollowPlayer(horseRef)
			endIf
		endIf
		i += 1
	endWhile
EndFunction

; Commands the herd to do the specified action from the herd options menu.
Function CommandHerd(int choice)
	if PlayerHorseList.Length == 0
		DisplayGeneralMessage("$IHO_PlayerNoHorse", forceDisplay = true)
		return
	endIf
	if choice == OptionHerdFollow
		IHOHorseWhistle.Play(PlayerRef)
		SummonHerd(summonDismissed = false)
	elseIf choice == OptionHerdSummon
		BlowMyHorn()
		SummonHerd(summonDismissed = true)
	else
		int i = 0
		while i < PlayerHorseList.Length
			Actor horseRef = PlayerHorseList[i] as Actor
			if horseRef != None && horseRef.IsInFaction(CurrentFollowerFaction)
				if choice == OptionHerdWait
					WaitForPlayer(horseRef)
				elseIf choice == OptionHerdDismiss
					DismissHorse(horseRef)
				endIf
			endIf
			i += 1
		endWhile
	endIf
EndFunction

; Shows the horse aggression selection menu.
Function ShowHorseAggressionMenu(Actor horseRef)
	String title = "$IHO_MenuTextChangeAggression{" + horseRef.GetDisplayName() + "}"
	int aggression = horseRef.GetActorValue("Aggression") as int
	int choice = SkyUILib.ShowList(title, GetAggressionList(), aggression + 1, aiDefaultIndex = 1)
	if choice != 0
		ResetFactionRank(horseRef, IHOAggressionHorseFaction, choice - 1) ; Offset the Cancel option.
		horseRef.SetActorValue("Aggression", choice - 1)
		horseRef.EvaluatePackage()
	endIf
EndFunction

; Shows the horse confidence selection menu.
Function ShowHorseConfidenceMenu(Actor horseRef)
	String title = "$IHO_MenuTextChangeConfidence{" + horseRef.GetDisplayName() + "}"
	int confidence = horseRef.GetActorValue("Confidence") as int
	int choice = SkyUILib.ShowList(title, GetConfidenceList(), confidence + 1, aiDefaultIndex = 1)
	if choice != 0
		ResetFactionRank(horseRef, IHOConfidenceHorseFaction, choice - 1) ; Offset the Cancel option.
		horseRef.SetActorValue("Confidence", choice - 1)
		horseRef.EvaluatePackage()
	endIf
EndFunction

; Shows the horse swap positions menu.
Function ShowHorseSwapPositionsMenu(int chosenHorseIndex)
	Actor horseRef = PlayerHorseList[chosenHorseIndex] as Actor
	String title = "$IHO_MenuTextSwapPositions{" + horseRef.GetDisplayName() + "}"
	int swapHorseListIndex = SkyUILib.ShowList(title, HorseListMenu, chosenHorseIndex, aiDefaultIndex = 0)
	if swapHorseListIndex >= HorseListMenuOffset
		SwapFormArrayPositions(PlayerHorseList, chosenHorseIndex, swapHorseListIndex - HorseListMenuOffset)	
		HorseListIndex = swapHorseListIndex
	endIf
EndFunction

; Persists the horse's actor values.
Function PersistHorseActorValues(Actor horseRef)
	int aggression = 0 ; Unaggressive
	int confidence = 0 ; Cowardly
	if horseRef.IsInFaction(IHOAggressionHorseFaction) ; Use cached aggression.
		aggression = horseRef.GetFactionRank(IHOAggressionHorseFaction)
		horseRef.SetActorValue("Aggression", aggression)
	else ; Cache aggression for persistence.
		aggression = horseRef.GetActorValue("Aggression") as int
		ResetFactionRank(horseRef, IHOAggressionHorseFaction, aggression)
	endIf
	if horseRef.IsInFaction(IHOConfidenceHorseFaction) ; Load cached confidence.
		confidence = horseRef.GetFactionRank(IHOConfidenceHorseFaction)
		horseRef.SetActorValue("Confidence", confidence)
	else ; Cache confidence for persistence.
		confidence = horseRef.GetActorValue("Confidence") as int
		ResetFactionRank(horseRef, IHOConfidenceHorseFaction, confidence)
	endIf
	if horseRef.IsInFaction(CurrentFollowerFaction)
		if IsTrue(IHOHorsesIgnoreCombat) || horseRef.GetActorValue("Aggression") == 0
			ResetFactionRank(horseRef, CurrentFollowerFaction, StoicHorseRank)
		else ; Aggressive
			ResetFactionRank(horseRef, CurrentFollowerFaction, CombatHorseRank)
		endIf
	endIf
	; Slow the horse to a trot when harnessed.
	if horseRef.IsEquipped(HorseHarness)
		horseRef.SetActorValue("SpeedMult", TrotSpeedMult)
		horseRef.ModActorValue("CarryWeight", 0.001) ; Apply speed changes.
	; Restore the horse's custom speed if it is not harnessed or being ridden.
	elseIf !horseRef.IsBeingRidden()
		RestoreSpeedMult(horseRef)
	endIf
	RestoreUnarmedDamage(horseRef)
	horseRef.EvaluatePackage()
EndFunction

; Returns the player's activation choice.
int Function GetPlayerActivationChoice(Actor horseRef, bool playerIsRiding)
	int choice = OptionRide
	; Player activates a dead or unowned horse.
	if horseRef.IsDead() || !horseRef.IsInFaction(PlayerHorseFaction)
		choice = OptionRide
	; Player activates a horse he owns while riding it.	
	elseIf playerIsRiding && horseRef.IsBeingRidden()
		int mountedAction = IHOMountedActivationAction.GetValueInt()
		if mountedAction == OptionMenu
			if IsPersistent(horseRef)
				choice = ShowMountedHorseOptionsMenu(horseRef)
			else
				choice = ShowTempMountedHorseOptionsMenu(horseRef)
			endIf
		elseIf mountedAction == OptionFollow
			choice = OptionTalk
		else
			choice = mountedAction
		endIf
	; Player activates a horse he owns while sneaking.
	elseIf PlayerRef.IsSneaking()
		int sneakAction = IHOSneakingActivationAction.GetValueInt()
		if sneakAction == OptionMenu
			if IsPersistent(horseRef)
				choice = ShowHorseOptionsMenu(horseRef)
			else
				choice = ShowTempHorseOptionsMenu(horseRef)
			endIf
		else
			choice = sneakAction
		endIf
	; Player activates a horse he owns while standing (default).
	else
		int standAction = IHOStandingActivationAction.GetValueInt()
		if standAction == OptionMenu
			if IsPersistent(horseRef)
				choice = ShowHorseOptionsMenu(horseRef)
			else
				choice = ShowTempHorseOptionsMenu(horseRef)
			endIf
		else
			choice = standAction
		endIf
	endIf
	return choice
EndFunction

; Claims the horse for the player's team.  The claimed horse becomes the last ridden horse.
Function ClaimHorse(Actor horseRef)
	ResetFactionRank(horseRef, PlayerHorseFaction, 1) ; The horse is now one of the player's horses.
	horseRef.AddToFaction(IHOClaimedHorseFaction) ; The horse is now claimed by the player.
	horseRef.AddToFaction(CurrentFollowerFaction) ; The horse will now follow the player.
	horseRef.SetActorValue("WaitingForPlayer", 1) ; The horse will wait for the player by default.
	horseRef.SetActorOwner(PlayerRef.GetActorBase()) ; The horse is now owned by the player.
	horseRef.SetPlayerTeammate(true, false) ; The horse will now equip items and share crimes.
	if IsPersistent(horseRef)
		; Protect the horse, if possible and allowed.
		if IsTrue(IHOProtectHorses) && CanBeProtected(horseRef)
			horseRef.GetLeveledActorBase().SetProtected(true)
		endIf
		; Add the horse to PlayerHorseList.
		int initialLength = PlayerHorseList.Length
		PlayerHorseList = AddFormToArray(horseRef, PlayerHorseList)
		if initialLength < PlayerHorseList.Length
			IncrementStat("Horses Owned", 1)
		endIf
		DisplayHorseMessage(horseRef, "$IHO_HorseClaimed")
	else
		DisplayHorseMessage(horseRef, "$IHO_HorseBorrowed")
	endIf
	; Make this horse the player's last ridden horse if there isn't one currently.
	if PlayerHorseRef == None || PlayerHorseRef.IsDead()
		ApplyLastRiddenHorse(horseRef)
	endIf
	PersistHorseActorValues(horseRef)
EndFunction

; Abandons the horse and attempts to remove it from the player's herd.  
; Returns true if the horse was in the herd and was removed.
bool Function AbandonHorse(Actor horseRef)
	horseRef.RemoveFromFaction(PlayerHorseFaction) ; The horse is no longer one of the player's horses.
	horseRef.RemoveFromFaction(IHOClaimedHorseFaction) ; The horse is no longer claimed by the player.
	horseRef.RemoveFromFaction(DismissedFollowerFaction) ; The horse is no longer dismissed.
	horseRef.RemoveFromFaction(CurrentFollowerFaction) ; The horse will no longer follow the player.
	horseRef.SetPlayerTeammate(false, false) ; The horse will no longer equip items or share crimes.
	; Remove player and team ownership from the horse.
	if horseRef.GetActorOwner() == PlayerRef.GetActorBase()
		horseRef.SetActorOwner(None)
	endIf
	if horseRef.GetFactionOwner() == CurrentFollowerFaction
		horseRef.SetFactionOwner(None)
	endIf
	horseRef.EvaluatePackage()
	; Remove the horse from PlayerHorseList.
	int initialLength = PlayerHorseList.Length
	PlayerHorseList = RemoveFormFromArray(horseRef, PlayerHorseList)
	; Substitute the horse for another if it is currently the player's last ridden horse.
	if horseRef == PlayerHorseRef
		Actor newPlayerHorseRef = None
		int i = 0
		while i < PlayerHorseList.Length
			newPlayerHorseRef = PlayerHorseList[i] as Actor
			if newPlayerHorseRef == None
				i += 1
			else
				i = PlayerHorseList.Length
			endIf
		endWhile
		ApplyLastRiddenHorse(newPlayerHorseRef)
	endIf
	if initialLength > PlayerHorseList.Length
		IncrementStat("Horses Owned", -1)
		return true
	endIf
	return false
EndFunction

; Whistles for the horse to follow the player.  Teleports the horse nearby if necessary.
Function HorseWhistle(Actor horseRef)
	if IsBusy
		return 
	else
		IsBusy = true
	endIf
	if horseRef == None || horseRef.IsDead()
		DisplayGeneralMessage("$IHO_PlayerNoHorse", forceDisplay = true)
	; Horses can only follow the player to non-interior locations and ridable world spaces.
	elseIf PlayerRef.IsInInterior() || !RidableWorldSpaces.HasForm(PlayerRef.GetWorldSpace())
		DisplayHorseMessage(horseRef, "$IHO_HorseNoFollow")
	else
		IHOHorseWhistle.Play(PlayerRef)
		; Teleport the horse to the player if it is not nearby, not in sight, and not being ridden.
		if !horseRef.IsNearPlayer() && !playerRef.HasLOS(horseRef) && !horseRef.IsBeingRidden()
			TeleHorse(horseRef)
		endIf
		FollowPlayer(horseRef)
	endIf
	IsBusy = false
EndFunction

; Opens the horse's inventory for the player.  Replaces the horse's outfit with an empty outfit and
; gives the horse a playable saddle if necessary.  Assumes the horse is the player's teammate.
Function HorseInventory(Actor horseRef)
	if horseRef.GetLeveledActorBase().GetOutfit() != IHOHorseBarebackOutfit
		Armor saddle = GetWornSaddle(horseRef)
		horseRef.SetOutfit(IHOHorseBarebackOutfit)
		if IsSaddle(saddle)
			horseRef.AddItem(saddle)
		endIf
	endIf
	horseRef.OpenInventory(abForceOpen = true)
EndFunction

; Attempts to talk to or search the corpse of a nearby actor when the player is mounted on a horse.
Function MountedTalkOrSearch()
	bool isAllowDead = IsTrue(IHOLootCorpsesWhileMounted)
	int misses = 0
	while misses < 10
		Actor actorRef = GetActorNearPlayer(1000)
		if actorRef != None
			if actorRef.IsDead() ; Activate dead actor if allowed.
				if isAllowDead
					actorRef.Activate(PlayerRef)
					return
				endIf
			elseIf !actorRef.HasKeyword(ActorTypeHorse) ; Activate living non-horse actor.
				actorRef.Activate(PlayerRef)
				return
			endIf
		endIf
		misses += 1
	endWhile
EndFunction

; Commands the horse to follow the player.
Function FollowPlayer(Actor horseRef)
	horseRef.RemoveFromFaction(DismissedFollowerFaction)
	horseRef.AddToFaction(CurrentFollowerFaction)
	horseRef.SetActorValue("WaitingForPlayer", 0)
	horseRef.StopCombat()
	horseRef.EvaluatePackage()
	DisplayHorseMessage(horseRef, "$IHO_HorseFollowing")
EndFunction

; Commands the horse to wait in position.
Function WaitForPlayer(Actor horseRef)
	horseRef.RemoveFromFaction(DismissedFollowerFaction)
	horseRef.AddToFaction(CurrentFollowerFaction)
	horseRef.SetActorValue("WaitingForPlayer", 1)
	horseRef.StopCombat()
	horseRef.EvaluatePackage()
	DisplayHorseMessage(horseRef, "$IHO_HorseWaiting")
EndFunction

; Toggles the horse to either follow the player or wait in position.
Function FollowOrWait(Actor horseRef)
	if IsFollowingPlayer(horseRef)
		WaitForPlayer(horseRef)
	else
		FollowPlayer(horseRef)
	endIf
EndFunction

; Opens a dialogue box which allows the player to rename the horse.
Function RenameHorse(Actor horseRef, String placeholder = "")
	String title = "$IHO_MenuTextRename{" + horseRef.GetDisplayName() + "}"
	String newName = SkyUILib.ShowTextInput(title, placeholder)
	if newName != ""
		horseRef.SetDisplayName(newName, force = true)
	endIf
EndFunction

; Dismisses the horse from service to the player's team (does not remove ownership).
Function DismissHorse(Actor horseRef)
	horseRef.RemoveFromFaction(CurrentFollowerFaction) ; The horse will no longer follow the player.
	horseRef.AddToFaction(DismissedFollowerFaction) ; The horse is now dismissed.
	horseRef.SetActorValue("WaitingForPlayer", 1) ; The horse will wait for the player by default.
	horseRef.EvaluatePackage()
	DisplayHorseMessage(horseRef, "$IHO_HorseDismissed")
EndFunction

; Adopts the horse by replacing a temporary horse with a permanent clone and then claiming it.
Function AdoptHorse(Actor horseRef)
	if IsBusy
		return 
	else
		IsBusy = true
	endIf
	ActorBase permaCloneRef = GetINIPermaClone(horseRef)
	if permaCloneRef == None
		DisplayHorseMessage(horseRef, "$IHO_HorseNotAdopted")
	else
		FadeToBlackAndHold()
		Actor permaHorseRef = horseRef.PlaceActorAtMe(permaCloneRef)
		RenameHorse(permaHorseRef)
		ClaimHorse(permaHorseRef)
		ApplyLastRiddenHorse(permaHorseRef)
		permaHorseRef.MoveTo(horseRef)
		Armor saddle = GetWornSaddle(horseRef)
		horseRef.SetOutfit(IHOHorseBarebackOutfit)
		if IsSaddle(saddle)
			permaHorseRef.AddItem(saddle)
		endIf
		horseRef.RemoveAllItems(permaHorseRef)
		horseRef.Delete()
		FadeFromBlack()
	endIf
	IsBusy = false
EndFunction

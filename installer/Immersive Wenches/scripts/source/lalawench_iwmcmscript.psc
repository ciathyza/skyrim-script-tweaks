Scriptname lalawench_IWMCMscript extends SKI_ConfigBase

string myVersion
int flags

;=========================================IW=============================================
GlobalVariable Property lalawench_IW_morewenches  Auto
GlobalVariable Property lalawench_IW_novamps  Auto
GlobalVariable Property lalawench_IW_nojarlhouses  Auto
GlobalVariable Property lalawench_IW_nodefaulttravelers  Auto
GlobalVariable Property lalawench_IW_moretravelers  Auto
GlobalVariable Property lalawench_IW_nobottles  Auto
GlobalVariable Property lalawench_IW_wanderingvamps  Auto
GlobalVariable Property lalawench_IW_noscenes  Auto

Quest Property lalawench_scene_serving  Auto
Quest Property lalawench_scene_cheers  Auto
Quest Property lalawench_scene_thanks  Auto
Quest Property lalawench_follower_quest  Auto
Quest Property lalawench_homework_quest  Auto
Quest Property lalawench_misc_quest  Auto
Quest Property lalawench_spouse_quest  Auto

;=========================================DW=============================================

GlobalVariable Property lalawench_DW_GlobalDifficulty_NOVamp Auto
GlobalVariable Property lalawench_DW_GlobalDifficulty_Vamp  Auto

;=========================================HW=============================================

GlobalVariable Property lalawench_HW_GlobalDifficulty  Auto

;=========================================initial stuff=============================================

int function GetVersion()
	return 9 ; 1.5
endFunction

string[] DWDifficultynovampList
string[] DWDifficultyvampList
string[] HWDifficultyList

;--OIDs--  

int DWDifficultynovampListOID
int DWDifficultyvampListOID
int HWDifficultyListOID
int morewenchesOID
int moretravelersOID
int novampsOID
int nojarlhousesOID
int nodefaulttravelersOID
int nobottlesOID
int wanderingvampsOID
int noscenesOID
int resetquestsOID
int stopquestsOID


int DWDifficultynovampListindex = 3
int DWDifficultyvampListindex = 3
int HWDifficultyListindex = 3


bool novampsVal = true
bool nojarlhousesVal = false
bool nodefaulttravelersVal = false
bool morewenchesVal = false
bool moretravelersVal = false
bool nobottlesVal = false
bool wanderingvampsVal = false
bool noscenesVal = false
bool resetquestsVal = false
bool stopquestsVal = false

;====================================Initialization==============================================================

Event OnConfigInit()

	Pages = New String[4]
		Pages[0] = "Immersive Wenches"
		;Pages[1] = "Deadly Wenches"
		;Pages[2] = "Hateful Wenches"
		Pages[1] = "Troubleshooting"

	DWDifficultynovampList = New String[6]
		DWDifficultynovampList[0] = "Novice"
		DWDifficultynovampList[1] = "Apprentice"
		DWDifficultynovampList[2] = "Adept"
		DWDifficultynovampList[3] = "Expert"
              DWDifficultynovampList[4] = "Master"
              DWDifficultynovampList[5] = "Legendary"

	DWDifficultyvampList = New String[6]
		DWDifficultyvampList[0] = "Novice"
		DWDifficultyvampList[1] = "Apprentice"
		DWDifficultyvampList[2] = "Adept"
		DWDifficultyvampList[3] = "Expert"
              DWDifficultyvampList[4] = "Master"
              DWDifficultyvampList[5] = "Legendary"

	HWDifficultyList = New String[6]
		HWDifficultyList[0] = "Novice"
		HWDifficultyList[1] = "Apprentice"
		HWDifficultyList[2] = "Adept"
		HWDifficultyList[3] = "Expert"
             HWDifficultyList[4] = "Master"
             HWDifficultyList[5] = "Legendary"

EndEvent

;====================================Update MCM Event==============================================================

event OnVersionUpdate(int a_version)
 	 if (a_version > 1)
	myVersion = "1.5"
	Debug.Trace("Immersive Wenches: updating MCM script to v" + myVersion + ".")
	Debug.notification("Immersive Wenches " + myVersion + " installed...")
       	OnConfigInit()
    	endIf
endevent

;====================================Page Options Update Events==============================================================

event OnPageReset(string a_page)

	if (a_page == "")
		LoadCustomContent("IW/IWmcmlogo.dds", 0, 0)
		return
	else
		UnloadCustomContent()
	endIf
	if (a_page == "Immersive Wenches")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("")
		AddTextOption("Configuration options for -Immersive Wenches-","",OPTION_FLAG_DISABLED)
		AddTextOption("you can change them anytime you want.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("It can take at least 1 ingame day so wenches","",OPTION_FLAG_DISABLED)
		AddTextOption("can reorder themselves.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("So i recommend to wait 1 ingame day after you","",OPTION_FLAG_DISABLED)
		AddTextOption("change these options.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("Enjoy the mod ; )","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		SetCursorPosition(1)
		AddHeaderOption("More NPCs.")
             morewenchesOID = AddToggleOption("More tavern wenches.", morewenchesVal, flags)
             moretravelersOID = AddToggleOption("More travelling wenches.", moretravelersVal, flags)
		AddEmptyOption()
		AddHeaderOption("Less NPCs.")
             nodefaulttravelersOID = AddToggleOption("No default travelling wenches.", nodefaulttravelersVal, flags)
             novampsOID = AddToggleOption("No vampire wenches.", novampsVal, flags)
             nojarlhousesOID = AddToggleOption("No jarl castles wenches.", nojarlhousesVal, flags)
		AddEmptyOption()
		AddHeaderOption("Other Options.")
             nobottlesOID = AddToggleOption("Disable dialogue of summon items.", nobottlesVal, flags)
             noscenesOID = AddToggleOption("Disable wenches scenes.", noscenesVal, flags)
             wanderingvampsOID = AddToggleOption("Enable wandering vampire wenches.", wanderingvampsVal, flags)
	elseif (a_page == "Deadly Wenches")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("")
		AddTextOption("If you use -Deadly Wenches- you can change","",OPTION_FLAG_DISABLED)
		AddTextOption("their difficulty here.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("Vampires wenches have their own difficulty menu","",OPTION_FLAG_DISABLED)
		AddTextOption("since they are stronger than the other factions","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("I recommend to use DW expert difficulty","",OPTION_FLAG_DISABLED)
		AddTextOption("with Skyrim expert difficulty.","",OPTION_FLAG_DISABLED)
		AddTextOption("Its up to you.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("Enjoy the mod ; )","",OPTION_FLAG_DISABLED)
		SetCursorPosition(1)
		AddHeaderOption("")
		DWDifficultyvampListOID = AddMenuOption("DW: Vampires.", DWDifficultyvampList[DWDifficultyvampListIndex], flags)
		DWDifficultynovampListOID = AddMenuOption("DW: Other Factions.", DWDifficultynovampList[DWDifficultynovampListIndex], flags)
		AddEmptyOption()
		AddHeaderOption("Works like this:")
		AddEmptyOption()
		AddTextOption("DW: dmg deal --- dmg taken.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("Novice:        x0.4   ---  x3","",OPTION_FLAG_DISABLED)
		AddTextOption("Apprentice:  x0.5   ---  x2","",OPTION_FLAG_DISABLED)
		AddTextOption("Adept:         x0.75 ---  x1.5","",OPTION_FLAG_DISABLED)
		AddTextOption("Expert:        x1.0   ---  x1.0","",OPTION_FLAG_DISABLED)
		AddTextOption("Master:        x1.50 ---  x0.75","",OPTION_FLAG_DISABLED)
		AddTextOption("Legendary:   x2.00 ---  x0.5","",OPTION_FLAG_DISABLED)
	elseif (a_page == "Hateful Wenches")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("")
		AddTextOption("If you use -Hateful Wenches- you can change","",OPTION_FLAG_DISABLED)
		AddTextOption("their difficulty here.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("I recommend to use HW expert difficulty","",OPTION_FLAG_DISABLED)
		AddTextOption("with Skyrim expert difficulty.","",OPTION_FLAG_DISABLED)
		AddTextOption("Its up to you.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("Enjoy the mod ; )","",OPTION_FLAG_DISABLED)
		SetCursorPosition(1)
		AddHeaderOption("")
		HWDifficultyListOID = AddMenuOption("HW: ALL.", HWDifficultyList[HWDifficultyListIndex], flags)
		AddEmptyOption()
		AddHeaderOption("Works like this:")
		AddEmptyOption()
		AddTextOption("HW: dmg deal --- dmg taken.","",OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddTextOption("Novice:        x0.4   ---  x3","",OPTION_FLAG_DISABLED)
		AddTextOption("Apprentice:  x0.5   ---  x2","",OPTION_FLAG_DISABLED)
		AddTextOption("Adept:         x0.75 ---  x1.5","",OPTION_FLAG_DISABLED)
		AddTextOption("Expert:        x1.0   ---  x1.0","",OPTION_FLAG_DISABLED)
		AddTextOption("Master:        x1.50 ---  x0.75","",OPTION_FLAG_DISABLED)
		AddTextOption("Legendary:   x2.00 ---  x0.5","",OPTION_FLAG_DISABLED)
	elseif (a_page == "Troubleshooting")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("")
        	resetquestsOID = AddTextOption("Reset Quests.", "Reset")
	      stopquestsOID = AddTextOption("Stop Quests for uninstall.", "Stop")
	endIf
endEvent

;====================================Toggle Events==============================================================

Event OnOptionSelect(int option)
	if (option == morewenchesOID)
		morewenchesVal = !morewenchesVal
		SetToggleOptionValue(morewenchesOID, morewenchesVal)
		if(morewenchesVal == false)
			lalawench_IW_morewenches.SetValueInt(0)
		else
			lalawench_IW_morewenches.SetValueInt(1)
		endif
	elseif (option == moretravelersOID)
		moretravelersVal = !moretravelersVal
		SetToggleOptionValue(moretravelersOID, moretravelersVal)
		if(moretravelersVal == false)
			lalawench_IW_moretravelers.SetValueInt(0)
		else
			lalawench_IW_moretravelers.SetValueInt(1)
		endif
	elseif (option == nodefaulttravelersOID)
		nodefaulttravelersVal = !nodefaulttravelersVal
		SetToggleOptionValue(nodefaulttravelersOID, nodefaulttravelersVal)
		if(nodefaulttravelersVal == false)
			lalawench_IW_nodefaulttravelers.SetValueInt(0)
		else
			lalawench_IW_nodefaulttravelers.SetValueInt(1)
		endif
	elseif (option == novampsOID)
		novampsVal = !novampsVal
		SetToggleOptionValue(novampsOID, novampsVal)
		if(novampsVal == false)
			lalawench_IW_novamps.SetValueInt(0)
		else
			lalawench_IW_novamps.SetValueInt(1)
		endif
	elseif (option == nojarlhousesOID)
		nojarlhousesVal = !nojarlhousesVal
		SetToggleOptionValue(nojarlhousesOID, nojarlhousesVal)
		if(nojarlhousesVal == false)
			lalawench_IW_nojarlhouses.SetValueInt(0)
		else
			lalawench_IW_nojarlhouses.SetValueInt(1)
		endif
	elseif (option == nobottlesOID)
		nobottlesVal = !nobottlesVal
		SetToggleOptionValue(nobottlesOID, nobottlesVal)
		if(nobottlesVal == false)
			lalawench_IW_nobottles.SetValueInt(0)
		else
			lalawench_IW_nobottles.SetValueInt(1)
		endif
	elseif (option == wanderingvampsOID)
		wanderingvampsVal = !wanderingvampsVal
		SetToggleOptionValue(wanderingvampsOID, wanderingvampsVal)
		if(wanderingvampsVal == false)
			lalawench_IW_wanderingvamps.SetValueInt(0)
		else
			lalawench_IW_wanderingvamps.SetValueInt(1)
		endif
	elseif (option == noscenesOID)
		noscenesVal = !noscenesVal
		SetToggleOptionValue(noscenesOID, noscenesVal)
		if(noscenesVal == false)
			lalawench_IW_noscenes.SetValueInt(0)
		else
			lalawench_IW_noscenes.SetValueInt(1)
		endif
	elseif (option ==  resetquestsOID)
		lalawench_scene_serving.Reset()
		lalawench_scene_cheers.Reset()
		lalawench_scene_thanks.Reset()
		lalawench_follower_quest.Reset()
		lalawench_homework_quest.Reset()
		lalawench_misc_quest.Reset()
		lalawench_spouse_quest.Reset()
		SetTextOptionValue(resetquestsOID, "Done")
	elseif (option ==  stopquestsOID)
		lalawench_scene_serving.Stop()
		lalawench_scene_cheers.Stop()
		lalawench_scene_thanks.Stop()
		lalawench_follower_quest.Stop()
		lalawench_homework_quest.Stop()
		lalawench_misc_quest.Stop()
		lalawench_spouse_quest.Stop()
		SetTextOptionValue(stopquestsOID, "Done")
       endif
EndEvent

;====================================Menu Events==============================================================

event OnOptionMenuOpen(int option)

	if (option == HWDifficultyListOID)
		SetMenuDialogOptions(HWDifficultyList)
		SetMenuDialogStartIndex(HWDifficultyListIndex)
		SetMenuDialogDefaultIndex(3)
	elseif(option == DWDifficultyvampListOID)
		SetMenuDialogOptions(DWDifficultyvampList)
		SetMenuDialogStartIndex(DWDifficultyvampListIndex)
		SetMenuDialogDefaultIndex(3)
	elseif(option == DWDifficultynovampListOID)
		SetMenuDialogOptions(DWDifficultynovampList)
		SetMenuDialogStartIndex(DWDifficultynovampListIndex)
		SetMenuDialogDefaultIndex(3)
	endIf

endEvent

event OnOptionMenuAccept(int option, int index)

	if (option == HWDifficultyListOID)
		HWDifficultyListIndex = index
		SetMenuOptionValue(HWDifficultyListOID, HWDifficultyList[HWDifficultyListIndex])
		lalawench_HW_GlobalDifficulty.SetValue(index)
	elseif(option == DWDifficultyvampListOID)
		DWDifficultyvampListIndex = index
		SetMenuOptionvalue(DWDifficultyvampListOID, DWDifficultyvampList[DWDifficultyvampListIndex])
		lalawench_DW_GlobalDifficulty_Vamp.SetValue(index)
	elseif(option == DWDifficultynovampListOID)
		DWDifficultynovampListIndex = index
		SetMenuOptionvalue(DWDifficultynovampListOID, DWDifficultynovampList[DWDifficultynovampListIndex])
		lalawench_DW_GlobalDifficulty_NOVamp.SetValue(index)
	endIf
endEvent

;====================================Descriptions==============================================================

Event OnOptionHighlight(int option)
	if(option == morewenchesOID)
		SetInfoText("All inns will have at least 2 wenches and a barmaid no matter their location. (adds 20 NPCs)")
	elseif(option == moretravelersOID)
		SetInfoText("Adds 8 travelling wenches with bodyguards and 1 more merchant wench. (adds 17 NPCs)")
	elseif(option == nodefaulttravelersOID)
		SetInfoText("Removes the default number of travelling wenches. (removes 12 NPCs)")
	elseif(option == novampsOID)
		SetInfoText("Removes vampire wenches. (removes 9 NPCs)")
	elseif(option == nojarlhousesOID)
		SetInfoText("Removes wenches at jarl houses. (removes 9 NPCs)")
	elseif(option == nobottlesOID)
		SetInfoText("Disables the dialogue option where you can get the summon spells and drinks from all wenches.")
	elseif(option == wanderingvampsOID)
		SetInfoText("Vampire wenches will travel around cities at night. (select this if you use Open Cities mod)")
	elseif(option == noscenesOID)
		SetInfoText("Disables custom scenes from this mod involving wenches.")
	elseif(option == resetquestsOID)
		SetInfoText("Resets all quests/scenes.")
	elseif(option == stopquestsOID)
		SetInfoText("Stops all quests for uninstall, it can be reverted using reset quests option.")
	endif
EndEvent     
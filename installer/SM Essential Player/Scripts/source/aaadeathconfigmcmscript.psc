Scriptname aaaDeathConfigMCMScript extends SKI_ConfigBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

aaaEssentialPlayerQuestScript property essentialQuest auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

int isEnabled = 0
int coinLoss
int easyghost
int enableMove
int firstPersonKnockout
int hardghost
int healthToHeal
int injuries
int normalghost
int thirdPersonKnockout
int uninstall

int normalDeath
int essentialDeath
int ghostDeath


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

event OnConfigInit()
	essentialQuest.disableConfigSpell = true
endEvent


event OnPageReset(string page)
	if (essentialQuest.uninstall)
		AddHeaderOption("Mod is currently being uninstalled.")
		return
	endif
	SetCursorFillMode(TOP_TO_BOTTOM)

	isEnabled = AddToggleOption("Enabled ", false)

	AddHeaderOption("Death Style")
	normalDeath = AddToggleOption("Ghost/Essential Death", essentialQuest.mode == essentialQuest.NORMALMODE)
	essentialDeath = AddToggleOption("Essential Death Only", essentialQuest.mode == essentialQuest.ESSENTIALMODE )
	ghostDeath = AddToggleOption("Ghost Death Only", essentialQuest.mode == essentialQuest.GHOSTMODE)

	AddHeaderOption("Ghost Difficulty")
	int flag = OPTION_FLAG_NONE
	if (essentialQuest.mode == essentialQuest.ESSENTIALMODE)
		flag = OPTION_FLAG_DISABLED
	endif
	easyghost = AddToggleOption("Easy", essentialQuest.ishardcore == essentialQuest.EASYGHOST, flag)
	normalghost = AddToggleOption("Normal ", essentialQuest.ishardcore == essentialQuest.NORMALGHOST, flag)
	hardghost = AddToggleOption("Hard", essentialQuest.ishardcore == essentialQuest.HARDCOREGHOST,flag)
	SetCursorPosition(1)

	AddHeaderOption("Essential Death Style")
	flag = OPTION_FLAG_NONE
	if (essentialQuest.mode == essentialQuest.GHOSTMODE)
		flag = OPTION_FLAG_DISABLED
	endif
	firstPersonKnockout = AddToggleOption("First Person", essentialQuest.essentialtype == essentialQuest.FIRSTPERSON,flag)
	thirdPersonKnockout = AddToggleOption("Third Person", essentialQuest.essentialtype == essentialQuest.THIRDPERSON,flag)

	AddHeaderOption("Misc Options")
	flag = OPTION_FLAG_NONE
	if (essentialQuest.mode == essentialQuest.GHOSTMODE)
		flag = OPTION_FLAG_DISABLED
	endif
	injuries = AddToggleOption("Enable Injuries", essentialQuest.disableinjuries == 0, flag)
	coinLoss = AddSliderOption("Coin Loss", essentialQuest.losemoney, "{0}%")
	flag = OPTION_FLAG_NONE
	if (essentialQuest.mode == essentialQuest.GHOSTMODE)
		flag = OPTION_FLAG_DISABLED
	endif
	healthToHeal = AddSliderOption("Knock Out Recovery", essentialQuest.healthToHeal, "{0}%", flag)

	AddTextOption("Version ", "3.1")
	uninstall = AddToggleOption("Uninstall ", false)
endEvent


event OnOptionSelect(int option)
	if (option == isEnabled)
		setEnabledState()
	elseif (option == normalDeath)
		setNormalDeath()
	elseif (option == essentialDeath)
		essentialQuest.mode = essentialQuest.ESSENTIALMODE
		setToggleOptionValue(normalDeath, false);
		setToggleOptionValue(ghostDeath, false);
		setToggleOptionValue(essentialDeath, true);
		setOptionFlags(easyghost, OPTION_FLAG_DISABLED, true)
		setOptionFlags(normalghost, OPTION_FLAG_DISABLED, true)
		setOptionFlags(hardghost, OPTION_FLAG_DISABLED, true)
		setOptionFlags(firstPersonKnockout, OPTION_FLAG_NONE, true)
		setOptionFlags(injuries, OPTION_FLAG_NONE, true)
		setOptionFlags(healthToHeal, OPTION_FLAG_NONE, true)
		setOptionFlags(thirdPersonKnockout, OPTION_FLAG_NONE)
	elseif (option == ghostDeath)
		essentialQuest.mode = essentialQuest.GHOSTMODE
		setToggleOptionValue(normalDeath, false);
		setToggleOptionValue(ghostDeath, true);
		setToggleOptionValue(essentialDeath, false);
		setOptionFlags(easyghost, OPTION_FLAG_NONE, true)
		setOptionFlags(normalghost, OPTION_FLAG_NONE, true)
		setOptionFlags(hardghost, OPTION_FLAG_NONE, true)
		setOptionFlags(firstPersonKnockout, OPTION_FLAG_DISABLED, true)
		setOptionFlags(thirdPersonKnockout, OPTION_FLAG_DISABLED, true)
		setOptionFlags(healthToHeal, OPTION_FLAG_DISABLED, true)
		setOptionFlags(injuries, OPTION_FLAG_DISABLED)
	elseif (option == easyghost)
		essentialQuest.ishardcore = essentialQuest.EASYGHOST
		setToggleOptionValue(easyghost, true);
		setToggleOptionValue(normalghost, false);
		setToggleOptionValue(hardghost, false);
	elseif (option == normalghost)
		setNormalGhost()
	elseif (option == hardghost)
		essentialQuest.ishardcore = essentialQuest.HARDCOREGHOST
		setToggleOptionValue(easyghost, false);
		setToggleOptionValue(normalghost, false);
		setToggleOptionValue(hardghost, true);
	elseif (option == firstPersonKnockout)
		essentialQuest.essentialtype = essentialQuest.FIRSTPERSON
		setToggleOptionValue(firstPersonKnockout, true);
		setToggleOptionValue(thirdPersonKnockout, false);
	elseif (option == thirdPersonKnockout)
		setThirdPerson()
	elseif (option == injuries)
		if (essentialQuest.disableinjuries > 0)
			essentialQuest.disableinjuries = 0
		else
			essentialQuest.disableinjuries = 1
		endif
		setToggleOptionValue(injuries, essentialQuest.disableinjuries == 0)
	elseif (option == uninstall)
		if (showMessage("Are you sure you want to uninstall the mod?", true, "Uninstall "))
			essentialQuest.uninstall = true
			essentialQuest.RegisterForSingleUpdate(1)
			showMessage("Mod is being uninstalled! Please close the menu and wait until the success message appears.", false)
			setToggleOptionValue(uninstall, true)
		endif
	endif
endEvent


event OnOptionDefault(int option)
	if (option == firstPersonKnockout || option == thirdPersonKnockout)
		setThirdPerson()
	elseif (option == easyghost || option == normalghost || option == hardghost)
		setNormalGhost()
	elseif (option == normalDeath || option == essentialDeath || option == ghostDeath)
		setNormalDeath()
	elseif (option == coinLoss)
		essentialQuest.losemoney = 0
		SetSliderOptionValue(coinLoss, 0, "{0}%");
	elseif (option == injuries)
		essentialQuest.disableinjuries = 0
		setToggleOptionValue(injuries, true)
	elseif (option == healthToHeal)
		essentialQuest.healthToHeal = 25
		SetSliderOptionValue(healthToHeal, 25, "{0}%");
	endif
endEvent


event OnOptionHighlight(int option)
	if (option == isEnabled)
		SetInfoText("Enables or disables the mod.")
	elseif (option == firstPersonKnockout)
		SetInfoText("You will NOT visibly drop to your knees on death. If you get animation bugs with third person mode consider switching to this mode.")
	elseif (option == thirdPersonKnockout)
		SetInfoText("You will visibly drop to your knees on death. If you get animation bugs consider switching to first person mode.")
	elseif (option == easyghost)
		SetInfoText("You retain your items when you die as a ghost.")
	elseif (option == normalghost)
		SetInfoText("You lose your items when you die but can be recovered from your corpse. If you lose your corpse the items will be on your new corpse.")
	elseif (option == hardghost)
		SetInfoText("Your items are permanently lost on death.")
	elseif (option == coinLoss)
		SetInfoText("Percentage of coin to lose on death.")
	elseif (option == injuries)
		SetInfoText("When you have an essential death you will gather injuries that affect your stats for a brief period of time.")
	elseif (option == normalDeath)
		SetInfoText("When first killed you are knocked down to one knee, if you die too soon afterwards you are turned into a ghost.")
	elseif (option == essentialDeath)
		SetInfoText("You are only ever knocked down to your knees on death.")
	elseif (option == ghostDeath)
		SetInfoText("You are turned into a ghost every time you die and leave a corpse behind.")
	elseif (option == healthToHeal)
		SetInfoText("The % amount of health you heal after being knocked down.")
	elseif (option == uninstall)
		SetInfoText("Before you uninstall make sure nothing is happening around you to conflict with the uninstall process and as little spell effects are active.")
	endif
endEvent


event OnOptionSliderOpen(int option)
	if (option == coinLoss)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
		SetSliderDialogStartValue(essentialQuest.losemoney)
	elseif (option == healthToHeal)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
		SetSliderDialogDefaultValue(25)
		SetSliderDialogStartValue(essentialQuest.healthToHeal)
	endif
endEvent


event OnOptionSliderAccept(int option, float value)
	if (option == coinLoss)
		essentialQuest.losemoney = value as int
		SetSliderOptionValue(coinLoss, value, "{0}%");
	elseif (option == healthToHeal)
		essentialQuest.healthToHeal = value as int
		SetSliderOptionValue(healthToHeal, value, "{0}%");
	endif
endEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

function setEnabledState()
	essentialQuest.isEnabled = isEnabled
endFunction


function setThirdPerson()
	essentialQuest.essentialtype = essentialQuest.THIRDPERSON
	setToggleOptionValue(firstPersonKnockout, false)
	setToggleOptionValue(thirdPersonKnockout, true)
endFunction


function setNormalGhost()
	essentialQuest.ishardcore = essentialQuest.NORMALGHOST
	setToggleOptionValue(easyghost, false)
	setToggleOptionValue(normalghost, true)
	setToggleOptionValue(hardghost, false)
endFunction


function setNormalDeath()
	essentialQuest.mode = essentialQuest.NORMALMODE
	setToggleOptionValue(normalDeath, true)
	setToggleOptionValue(ghostDeath, false)
	setToggleOptionValue(essentialDeath, false)
	setOptionFlags(easyghost, OPTION_FLAG_NONE, true)
	setOptionFlags(normalghost, OPTION_FLAG_NONE, true)
	setOptionFlags(hardghost, OPTION_FLAG_NONE, true)
	setOptionFlags(firstPersonKnockout, OPTION_FLAG_NONE, true)
	setOptionFlags(injuries, OPTION_FLAG_NONE, true)
	setOptionFlags(healthToHeal, OPTION_FLAG_NONE, true)
	setOptionFlags(thirdPersonKnockout, OPTION_FLAG_NONE)
endFunction

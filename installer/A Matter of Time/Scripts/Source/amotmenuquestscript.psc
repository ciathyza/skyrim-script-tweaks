scriptname AMOTMenuQuestScript extends SKI_ConfigBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

AMOTInGameClockQuestScript   property AMOTInGameClockQuest   auto
AMOTInGameDateQuestScript    property AMOTInGameDateQuest    auto
AMOTRealLifeClockQuestScript property AMOTRealLifeClockQuest auto
AMOTRealLifeDateQuestScript  property AMOTRealLifeDateQuest  auto
AMOTSymbolQuestScript        property AMOTSymbol1Quest       auto
AMOTSymbolQuestScript        property AMOTSymbol2Quest       auto


; -------------------------------------------------------------------------------------------------
; Constants
; -------------------------------------------------------------------------------------------------

bool		_defaultIGClockShown				= true
bool		_defaultIGClockShowSeconds			= false
bool		_defaultIGDateShown					= true
bool		_defaultRLClockShown				= false
bool		_defaultRLClockShowSeconds			= false
bool		_defaultRLDateShown					= false
bool		_defaultSymbol1ShowMoonPhases		= false
bool		_defaultSymbol1Shown				= true
bool		_defaultSymbol1ShowSeasons			= false
bool		_defaultSymbol2ShowMoonPhases		= false
bool		_defaultSymbol2Shown				= false
bool		_defaultSymbol2ShowSeasons			= false

float		_defaultIGClockDisplayTime			= 1.0
float		_defaultIGClockXOffset				= 110.0
float		_defaultIGClockYOffset				= 19.0

float		_defaultIGDateDisplayTime			= 1.0
float		_defaultIGDateXOffset				= 74.0
float		_defaultIGDateYOffset				= 20.0

float		_defaultRLClockDisplayTime			= 1.0
float		_defaultRLClockXOffset				= 10.0
float		_defaultRLClockYOffset				= 120.0

float		_defaultRLDateDisplayTime			= 1.0
float		_defaultRLDateXOffset				= 150.0
float		_defaultRLDateYOffset				= 120.0

float		_defaultSymbol1DisplayTime			= 1.0
float		_defaultSymbol1XOffset				= -50.0
float		_defaultSymbol1YOffset				= 10.0

float		_defaultSymbol2DisplayTime			= 1.0
float		_defaultSymbol2XOffset				= 0.0
float		_defaultSymbol2YOffset				= 0.0

int			_defaultIGClockAlpha				= 100
int			_defaultIGClockHotkey				= 0
int			_defaultIGClockScale				= 70
int			_defaultIGClockTypeIndex			= 3

int			_defaultIGDateAlpha					= 100
int			_defaultIGDateFormatIndex			= 5
int			_defaultIGDateHotkey				= 0
int			_defaultIGDateScale					= 70

int			_defaultRLClockAlpha				= 100
int			_defaultRLClockHotkey				= 87
int			_defaultRLClockScale				= 100
int			_defaultRLClockTypeIndex			= 0

int			_defaultRLDateAlpha					= 100
int			_defaultRLDateFormatIndex			= 3
int			_defaultRLDateHotkey				= 0
int			_defaultRLDateScale					= 100

int			_defaultSymbol1Alpha				= 100
int			_defaultSymbol1Hotkey				= 0
int			_defaultSymbol1Scale				= 20
int			_defaultSymbol1ThemeIndex			= 7

int			_defaultSymbol2Alpha				= 100
int			_defaultSymbol2Hotkey				= 0
int			_defaultSymbol2Scale				= 100
int			_defaultSymbol2ThemeIndex			= 0

int 		_defaultIGClockAlignmentIndex		= 0
int 		_defaultIGClockControlModeIndex		= 0
int 		_defaultIGClockPeriodIndex			= 2
int 		_defaultIGClockVertAlignmentIndex	= 0
int 		_defaultIGDateAlignmentIndex		= 0
int 		_defaultIGDateControlModeIndex		= 0
int 		_defaultIGDatePeriodIndex			= 2
int 		_defaultIGDateVertAlignmentIndex	= 0
int 		_defaultRLClockAlignmentIndex		= 0
int 		_defaultRLClockControlModeIndex		= 0
int 		_defaultRLClockPeriodIndex			= 2
int 		_defaultRLClockVertAlignmentIndex	= 0
int 		_defaultRLDateAlignmentIndex		= 0
int 		_defaultRLDateControlModeIndex		= 0
int 		_defaultRLDatePeriodIndex			= 2
int 		_defaultRLDateVertAlignmentIndex	= 0
int 		_defaultSymbol1AlignmentIndex		= 0
int 		_defaultSymbol1ControlModeIndex		= 0
int 		_defaultSymbol1PeriodIndex			= 2
int 		_defaultSymbol1VertAlignmentIndex	= 0
int 		_defaultSymbol2AlignmentIndex		= 2
int 		_defaultSymbol2ControlModeIndex		= 0
int 		_defaultSymbol2PeriodIndex			= 2
int 		_defaultSymbol2VertAlignmentIndex	= 2


; -------------------------------------------------------------------------------------------------
; Private Variables
; -------------------------------------------------------------------------------------------------

float[]		_alignmentBaseOffsets
float[]		_vertAlignmentBaseOffsets
string[]	_alignments
string[]	_alignmentValues
string[]	_clockTypes
string[]	_clockTypeValues
string[]	_controlModes
string[]	_controlModeValues
string[]	_dateFormats
string[]	_dateFormatValues
string[]	_periods
string[]	_periodValues
string[]	_themeNames
string[]	_themeValues
string[]	_vertAlignments
string[]	_vertAlignmentValues


; -------------------------------------------------------------------------------------------------
; Locals
; -------------------------------------------------------------------------------------------------

float		_igClockXOffset
float		_igClockYOffset
float		_igDateXOffset
float		_igDateYOffset
float		_rlClockXOffset
float		_rlClockYOffset
float		_rlDateXOffset
float		_rlDateYOffset
float		_symbol1XOffset
float		_symbol1YOffset
float		_symbol2XOffset
float		_symbol2YOffset
int			_igClockTypeIndex
int			_igDateFormatIndex
int			_rlClockTypeIndex
int			_rlDateFormatIndex
int			_symbol1ThemeIndex
int			_symbol2ThemeIndex
int 		_igClockAlignmentIndex
int 		_igClockControlModeIndex
int 		_igClockPeriodIndex
int 		_igClockVertAlignmentIndex
int 		_igDateAlignmentIndex
int 		_igDateControlModeIndex
int 		_igDatePeriodIndex
int 		_igDateVertAlignmentIndex
int 		_rlClockAlignmentIndex
int 		_rlClockControlModeIndex
int 		_rlClockPeriodIndex
int 		_rlClockVertAlignmentIndex
int 		_rlDateAlignmentIndex
int 		_rlDateControlModeIndex
int 		_rlDatePeriodIndex
int 		_rlDateVertAlignmentIndex
int 		_symbol1AlignmentIndex
int 		_symbol1ControlModeIndex
int 		_symbol1PeriodIndex
int 		_symbol1VertAlignmentIndex
int 		_symbol2AlignmentIndex
int 		_symbol2ControlModeIndex
int 		_symbol2PeriodIndex
int 		_symbol2VertAlignmentIndex


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

event OnConfigInit()
	; Execution Delay.
	Utility.Wait(6.0)

	InitializeArrays()
	LoadDefaultsGeneral()
	LoadDefaultsDisplay()
	LoadDefaultsControl()
	LoadUserSettings()
endEvent


event OnPageReset(String page)
	if (page == "")
		LoadCustomContent("AMOTSplash.swf")
		return
	else
		UnloadCustomContent()
	endIf

	; region Get some flags...
	int symbol1OptionsFlag = OPTION_FLAG_NONE
	if(!AMOTSymbol1Quest.Shown)
		symbol1OptionsFlag = OPTION_FLAG_DISABLED
	endIf
	int symbol1ShowMoonPhasesOptionFlag = OPTION_FLAG_DISABLED
	if(AMOTSymbol1Quest.HasMoonPhases && AMOTSymbol1Quest.Shown)
		symbol1ShowMoonPhasesOptionFlag = OPTION_FLAG_NONE
	endIf
	int symbol1ShowSaesonsOptionFlag = OPTION_FLAG_DISABLED
	if(AMOTSymbol1Quest.HasSeasons && AMOTSymbol1Quest.Shown)
		symbol1ShowSaesonsOptionFlag = OPTION_FLAG_NONE
	endIf

	int symbol2OptionsFlag = OPTION_FLAG_NONE
	if(!AMOTSymbol2Quest.Shown)
		symbol2OptionsFlag = OPTION_FLAG_DISABLED
	endIf
	int symbol2ShowMoonPhasesOptionFlag = OPTION_FLAG_DISABLED
	if(AMOTSymbol2Quest.HasMoonPhases && AMOTSymbol2Quest.Shown)
		symbol2ShowMoonPhasesOptionFlag = OPTION_FLAG_NONE
	endIf
	int symbol2ShowSaesonsOptionFlag = OPTION_FLAG_DISABLED
	if(AMOTSymbol2Quest.HasSeasons && AMOTSymbol2Quest.Shown)
		symbol2ShowSaesonsOptionFlag = OPTION_FLAG_NONE
	endIf

	int igClockOptionsFlag = OPTION_FLAG_NONE
	if(!AMOTInGameClockQuest.Shown)
		igClockOptionsFlag = OPTION_FLAG_DISABLED
	endIf

	int igDateOptionsFlag = OPTION_FLAG_NONE
	if(!AMOTInGameDateQuest.Shown)
		igDateOptionsFlag = OPTION_FLAG_DISABLED
	endIf

	int rlClockOptionsFlag = OPTION_FLAG_NONE
	if(!AMOTRealLifeClockQuest.Shown)
		rlClockOptionsFlag = OPTION_FLAG_DISABLED
	endIf

	int rlDateOptionsFlag = OPTION_FLAG_NONE
	if(!AMOTRealLifeDateQuest.Shown)
		rlDateOptionsFlag = OPTION_FLAG_DISABLED
	endIf
	; endRegion

	SetCursorFillMode(TOP_TO_BOTTOM)
	if (page == "$AMOT Page General")
		SetCursorPosition(0) ; Can be removed because it starts at 0 anyway

		AddHeaderOption("$AMOT All")
		AddMenuOptionST("GENERAL_ALL_RESET", "$AMOT Reset", "$AMOT Choose reset")

		AddEmptyOption()
		
		AddHeaderOption("$AMOT Symbol 1")
		AddToggleOptionST("GENERAL_SYMBOL1_SHOW",             "$AMOT Show",             AMOTSymbol1Quest.Shown)
		AddMenuOptionST  ("GENERAL_SYMBOL1_THEME",            "$AMOT Symbol Theme",     _themeNames[_symbol1ThemeIndex], symbol1OptionsFlag)
		AddToggleOptionST("GENERAL_SYMBOL1_SHOW_MOON_PHASES", "$AMOT Show Moon Phases", AMOTSymbol1Quest.ShowMoonPhases, symbol1ShowMoonPhasesOptionFlag)
		AddToggleOptionST("GENERAL_SYMBOL1_SHOW_SEASONS",     "$AMOT Show Seasons",     AMOTSymbol1Quest.ShowSeasons,    symbol1ShowSaesonsOptionFlag)

		AddEmptyOption()

		AddHeaderOption("$AMOT In-Game Clock")
		AddToggleOptionST("GENERAL_IGCLOCK_SHOW",         "$AMOT Show",         AMOTInGameClockQuest.Shown)
		AddMenuOptionST  ("GENERAL_IGCLOCK_TYPE",         "$AMOT Clock Type",   _clockTypes[_igClockTypeIndex],   igClockOptionsFlag)
		AddToggleOptionST("GENERAL_IGCLOCK_SHOW_SECONDS", "$AMOT Show Seconds", AMOTInGameClockQuest.ShowSeconds, igClockOptionsFlag)

		AddEmptyOption()

		AddHeaderOption("$AMOT In-Game Date")
		AddToggleOptionST("GENERAL_IGDATE_SHOW",   "$AMOT Show",        AMOTInGameDateQuest.Shown)
		AddMenuOptionST  ("GENERAL_IGDATE_FORAMT", "$AMOT Date Format", _dateFormats[_igDateFormatIndex], igDateOptionsFlag)

		SetCursorPosition(7) ; Right column

		AddHeaderOption("$AMOT Symbol 2")
		AddToggleOptionST("GENERAL_SYMBOL2_SHOW",             "$AMOT Show",             AMOTSymbol2Quest.Shown)
		AddMenuOptionST  ("GENERAL_SYMBOL2_THEME",            "$AMOT Symbol Theme",     _themeNames[_symbol2ThemeIndex], symbol2OptionsFlag)
		AddToggleOptionST("GENERAL_SYMBOL2_SHOW_MOON_PHASES", "$AMOT Show Moon Phases", AMOTSymbol2Quest.ShowMoonPhases, symbol2ShowMoonPhasesOptionFlag)
		AddToggleOptionST("GENERAL_SYMBOL2_SHOW_SEASONS",     "$AMOT Show Seasons",     AMOTSymbol2Quest.ShowSeasons,    symbol2ShowSaesonsOptionFlag)

		AddEmptyOption()

		AddHeaderOption("$AMOT Real-Life Clock")
		AddToggleOptionST("GENERAL_RLCLOCK_SHOW",         "$AMOT Show",         AMOTRealLifeClockQuest.Shown)
		AddMenuOptionST  ("GENERAL_RLCLOCK_TYPE",         "$AMOT Clock Type",   _clockTypes[_rlClockTypeIndex],     rlClockOptionsFlag)
		AddToggleOptionST("GENERAL_RLCLOCK_SHOW_SECONDS", "$AMOT Show Seconds", AMOTRealLifeClockQuest.ShowSeconds, rlClockOptionsFlag)

		AddEmptyOption()

		AddHeaderOption("$AMOT Real-Life Date")
		AddToggleOptionST("GENERAL_RLDATE_SHOW",   "$AMOT Show",        AMOTRealLifeDateQuest.Shown)
		AddMenuOptionST  ("GENERAL_RLDATE_FORAMT", "$AMOT Date Format", _dateFormats[_rlDateFormatIndex], rlDateOptionsFlag)
	elseIf(page == "$AMOT Page Display")
		SetCursorPosition(0) ; Can be removed because it starts at 0 anyway

		AddHeaderOption("$AMOT All")
		AddMenuOptionST("DISPLAY_ALL_RESET", "$AMOT Reset", "$AMOT Choose reset")

		AddEmptyOption()

		AddHeaderOption("$AMOT Symbol 1")
		AddSliderOptionST("DISPLAY_SYMBOL1_SCALE",             "$AMOT Scale",             AMOTSymbol1Quest.Scale, "{0}%",              symbol1OptionsFlag)
		AddSliderOptionST("DISPLAY_SYMBOL1_ALPHA",             "$AMOT Alpha",             AMOTSymbol1Quest.WidgetAlpha, "{0}%",        symbol1OptionsFlag)
		AddTextOptionST  ("DISPLAY_SYMBOL1_HORIZONTAL_ANCHOR", "$AMOT Horizontal Anchor", _alignments[_symbol1AlignmentIndex],         symbol1OptionsFlag)
		AddTextOptionST  ("DISPLAY_SYMBOL1_VERTICAL_ANCHOR",   "$AMOT Vertical Anchor",   _vertAlignments[_symbol1VertAlignmentIndex], symbol1OptionsFlag)
		AddSliderOptionST("DISPLAY_SYMBOL1_X_OFFSET",          "$AMOT Horizontal Offset", _symbol1XOffset, "{0}",                      symbol1OptionsFlag)
		AddSliderOptionST("DISPLAY_SYMBOL1_Y_OFFSET",          "$AMOT Vertical Offset",   _symbol1YOffset, "{0}",                      symbol1OptionsFlag)

		AddEmptyOption()

		AddHeaderOption("$AMOT In-Game Clock")
		AddSliderOptionST("DISPLAY_IGCLOCK_SCALE",             "$AMOT Scale",             AMOTInGameClockQuest.Scale, "{0}%",          igClockOptionsFlag)
		AddSliderOptionST("DISPLAY_IGCLOCK_ALPHA",             "$AMOT Alpha",             AMOTInGameClockQuest.WidgetAlpha, "{0}%",    igClockOptionsFlag)
		AddTextOptionST  ("DISPLAY_IGCLOCK_HORIZONTAL_ANCHOR", "$AMOT Horizontal Anchor", _alignments[_igClockAlignmentIndex],         igClockOptionsFlag)
		AddTextOptionST  ("DISPLAY_IGCLOCK_VERTICAL_ANCHOR",   "$AMOT Vertical Anchor",   _vertAlignments[_igClockVertAlignmentIndex], igClockOptionsFlag)
		AddSliderOptionST("DISPLAY_IGCLOCK_X_OFFSET",          "$AMOT Horizontal Offset", _igClockXOffset, "{0}",                      igClockOptionsFlag)
		AddSliderOptionST("DISPLAY_IGCLOCK_Y_OFFSET",          "$AMOT Vertical Offset",   _igClockYOffset, "{0}",                      igClockOptionsFlag)

		AddEmptyOption()

		AddHeaderOption("$AMOT In-Game Date")
		AddSliderOptionST("DISPLAY_IGDATE_SCALE",             "$AMOT Scale",             AMOTInGameDateQuest.Scale, "{0}%",          igDateOptionsFlag)
		AddSliderOptionST("DISPLAY_IGDATE_ALPHA",             "$AMOT Alpha",             AMOTInGameDateQuest.WidgetAlpha, "{0}%",    igDateOptionsFlag)
		AddTextOptionST  ("DISPLAY_IGDATE_HORIZONTAL_ANCHOR", "$AMOT Horizontal Anchor", _alignments[_igDateAlignmentIndex],         igDateOptionsFlag)
		AddTextOptionST  ("DISPLAY_IGDATE_VERTICAL_ANCHOR",   "$AMOT Vertical Anchor",   _vertAlignments[_igDateVertAlignmentIndex], igDateOptionsFlag)
		AddSliderOptionST("DISPLAY_IGDATE_X_OFFSET",          "$AMOT Horizontal Offset", _igDateXOffset, "{0}",                      igDateOptionsFlag)
		AddSliderOptionST("DISPLAY_IGDATE_Y_OFFSET",          "$AMOT Vertical Offset",   _igDateYOffset, "{0}",                      igDateOptionsFlag)

		SetCursorPosition(7) ; Right column

		AddHeaderOption("$AMOT Symbol 2")
		AddSliderOptionST("DISPLAY_SYMBOL2_SCALE",             "$AMOT Scale",             AMOTSymbol2Quest.Scale, "{0}%",              symbol2OptionsFlag)
		AddSliderOptionST("DISPLAY_SYMBOL2_ALPHA",             "$AMOT Alpha",             AMOTSymbol2Quest.WidgetAlpha, "{0}%",        symbol2OptionsFlag)
		AddTextOptionST  ("DISPLAY_SYMBOL2_HORIZONTAL_ANCHOR", "$AMOT Horizontal Anchor", _alignments[_symbol2AlignmentIndex],         symbol2OptionsFlag)
		AddTextOptionST  ("DISPLAY_SYMBOL2_VERTICAL_ANCHOR",   "$AMOT Vertical Anchor",   _vertAlignments[_symbol2VertAlignmentIndex], symbol2OptionsFlag)
		AddSliderOptionST("DISPLAY_SYMBOL2_X_OFFSET",          "$AMOT Horizontal Offset", _symbol2XOffset, "{0}",                      symbol2OptionsFlag)
		AddSliderOptionST("DISPLAY_SYMBOL2_Y_OFFSET",          "$AMOT Vertical Offset",   _symbol2YOffset, "{0}",                      symbol2OptionsFlag)

		AddEmptyOption()

		AddHeaderOption("$AMOT Real-Life Clock")
		AddSliderOptionST("DISPLAY_RLCLOCK_SCALE",             "$AMOT Scale",             AMOTRealLifeClockQuest.Scale, "{0}%",        rlClockOptionsFlag)
		AddSliderOptionST("DISPLAY_RLCLOCK_ALPHA",             "$AMOT Alpha",             AMOTRealLifeClockQuest.WidgetAlpha, "{0}%",  rlClockOptionsFlag)
		AddTextOptionST  ("DISPLAY_RLCLOCK_HORIZONTAL_ANCHOR", "$AMOT Horizontal Anchor", _alignments[_rlClockAlignmentIndex],         rlClockOptionsFlag)
		AddTextOptionST  ("DISPLAY_RLCLOCK_VERTICAL_ANCHOR",   "$AMOT Vertical Anchor",   _vertAlignments[_rlClockVertAlignmentIndex], rlClockOptionsFlag)
		AddSliderOptionST("DISPLAY_RLCLOCK_X_OFFSET",          "$AMOT Horizontal Offset", _rlClockXOffset, "{0}",                      rlClockOptionsFlag)
		AddSliderOptionST("DISPLAY_RLCLOCK_Y_OFFSET",          "$AMOT Vertical Offset",   _rlClockYOffset, "{0}",                      rlClockOptionsFlag)

		AddEmptyOption()

		AddHeaderOption("$AMOT Real-Life Date")
		AddSliderOptionST("DISPLAY_RLDATE_SCALE",             "$AMOT Scale",             AMOTRealLifeDateQuest.Scale, "{0}%",        rlDateOptionsFlag)
		AddSliderOptionST("DISPLAY_RLDATE_ALPHA",             "$AMOT Alpha",             AMOTRealLifeDateQuest.WidgetAlpha, "{0}%",  rlDateOptionsFlag)
		AddTextOptionST  ("DISPLAY_RLDATE_HORIZONTAL_ANCHOR", "$AMOT Horizontal Anchor", _alignments[_rlDateAlignmentIndex],         rlDateOptionsFlag)
		AddTextOptionST  ("DISPLAY_RLDATE_VERTICAL_ANCHOR",   "$AMOT Vertical Anchor",   _vertAlignments[_rlDateVertAlignmentIndex], rlDateOptionsFlag)
		AddSliderOptionST("DISPLAY_RLDATE_X_OFFSET",          "$AMOT Horizontal Offset", _rlDateXOffset, "{0}",                      rlDateOptionsFlag)
		AddSliderOptionST("DISPLAY_RLDATE_Y_OFFSET",          "$AMOT Vertical Offset",   _rlDateYOffset, "{0}",                      rlDateOptionsFlag)
	elseIf(page == "$AMOT Page Control")
		SetCursorPosition(0) ; Can be removed because it starts at 0 anyway

		AddHeaderOption("$AMOT All")
		AddMenuOptionST("CONTROL_ALL_RESET", "$AMOT Reset", "$AMOT Choose reset")

		AddEmptyOption()

		AddHeaderOption("$AMOT Symbol 1")
		AddTextOptionST  ("CONTROL_SYMBOL1_MODE",         "$AMOT Control mode", _controlModes[_symbol1ControlModeIndex], symbol1OptionsFlag)
		AddKeyMapOptionST("CONTROL_SYMBOL1_HOTKEY",       "$AMOT Hotkey",       AMOTSymbol1Quest.Hotkey,                 GetHotkeyOptionFlag(_controlModeValues[_symbol1ControlModeIndex], symbol1OptionsFlag))
		AddSliderOptionST("CONTROL_SYMBOL1_DISPLAY_TIME", "$AMOT Display Time", AMOTSymbol1Quest.DisplayTime, "{1}",     GetDisplayTimeOptionFlag(_controlModeValues[_symbol1ControlModeIndex], symbol1OptionsFlag))
		AddMenuOptionST  ("CONTROL_SYMBOL1_PERIOD",       "$AMOT Period",       _periods[_symbol1PeriodIndex],           GetPeriodOptionFlag(_controlModeValues[_symbol1ControlModeIndex], symbol1OptionsFlag))

		AddEmptyOption()

		AddHeaderOption("$AMOT In-Game Clock")
		AddTextOptionST  ("CONTROL_IGCLOCK_MODE",         "$AMOT Control mode", _controlModes[_igClockControlModeIndex], igClockOptionsFlag)
		AddKeyMapOptionST("CONTROL_IGCLOCK_HOTKEY",       "$AMOT Hotkey",       AMOTInGameClockQuest.Hotkey,             GetHotkeyOptionFlag(_controlModeValues[_igClockControlModeIndex], igClockOptionsFlag))
		AddSliderOptionST("CONTROL_IGCLOCK_DISPLAY_TIME", "$AMOT Display Time", AMOTInGameClockQuest.DisplayTime, "{1}", GetDisplayTimeOptionFlag(_controlModeValues[_igClockControlModeIndex], igClockOptionsFlag))
		AddMenuOptionST  ("CONTROL_IGCLOCK_PERIOD",       "$AMOT Period",       _periods[_igClockPeriodIndex],           GetPeriodOptionFlag(_controlModeValues[_igClockControlModeIndex], igClockOptionsFlag))

		AddEmptyOption()

		AddHeaderOption("$AMOT In-Game Date")
		AddTextOptionST  ("CONTROL_IGDATE_MODE",         "$AMOT Control mode", _controlModes[_igDateControlModeIndex], igDateOptionsFlag)
		AddKeyMapOptionST("CONTROL_IGDATE_HOTKEY",       "$AMOT Hotkey",       AMOTInGameDateQuest.Hotkey,             GetHotkeyOptionFlag(_controlModeValues[_igDateControlModeIndex], igDateOptionsFlag))
		AddSliderOptionST("CONTROL_IGDATE_DISPLAY_TIME", "$AMOT Display Time", AMOTInGameDateQuest.DisplayTime, "{1}", GetDisplayTimeOptionFlag(_controlModeValues[_igDateControlModeIndex], igDateOptionsFlag))
		AddMenuOptionST  ("CONTROL_IGDATE_PERIOD",       "$AMOT Period",       _periods[_igDatePeriodIndex],           GetPeriodOptionFlag(_controlModeValues[_igDateControlModeIndex], igDateOptionsFlag))

		SetCursorPosition(7) ; Right column

		AddHeaderOption("$AMOT Symbol 2")
		AddTextOptionST  ("CONTROL_SYMBOL2_MODE",         "$AMOT Control mode", _controlModes[_symbol2ControlModeIndex], symbol2OptionsFlag)
		AddKeyMapOptionST("CONTROL_SYMBOL2_HOTKEY",       "$AMOT Hotkey",       AMOTSymbol2Quest.Hotkey,                 GetHotkeyOptionFlag(_controlModeValues[_symbol2ControlModeIndex], symbol2OptionsFlag))
		AddSliderOptionST("CONTROL_SYMBOL2_DISPLAY_TIME", "$AMOT Display Time", AMOTSymbol2Quest.DisplayTime, "{1}",     GetDisplayTimeOptionFlag(_controlModeValues[_symbol2ControlModeIndex], symbol2OptionsFlag))
		AddMenuOptionST  ("CONTROL_SYMBOL2_PERIOD",       "$AMOT Period",       _periods[_symbol2PeriodIndex],           GetPeriodOptionFlag(_controlModeValues[_symbol2ControlModeIndex], symbol2OptionsFlag))

		AddEmptyOption()

		AddHeaderOption("$AMOT Real-Life Clock")
		AddTextOptionST  ("CONTROL_RLCLOCK_MODE",         "$AMOT Control mode", _controlModes[_rlClockControlModeIndex],   rlClockOptionsFlag)
		AddKeyMapOptionST("CONTROL_RLCLOCK_HOTKEY",       "$AMOT Hotkey",       AMOTRealLifeClockQuest.Hotkey,             GetHotkeyOptionFlag(_controlModeValues[_rlClockControlModeIndex], rlClockOptionsFlag))
		AddSliderOptionST("CONTROL_RLCLOCK_DISPLAY_TIME", "$AMOT Display Time", AMOTRealLifeClockQuest.DisplayTime, "{1}", GetDisplayTimeOptionFlag(_controlModeValues[_rlClockControlModeIndex], rlClockOptionsFlag))
		AddMenuOptionST  ("CONTROL_RLCLOCK_PERIOD",       "$AMOT Period",       _periods[_rlClockPeriodIndex],             GetPeriodOptionFlag(_controlModeValues[_rlClockControlModeIndex], rlClockOptionsFlag))

		AddEmptyOption()

		AddHeaderOption("$AMOT Real-Life Date")
		AddTextOptionST  ("CONTROL_RLDATE_MODE",         "$AMOT Control mode", _controlModes[_rlDateControlModeIndex],   rlDateOptionsFlag)
		AddKeyMapOptionST("CONTROL_RLDATE_HOTKEY",       "$AMOT Hotkey",       AMOTRealLifeDateQuest.Hotkey,             GetHotkeyOptionFlag(_controlModeValues[_rlDateControlModeIndex], rlDateOptionsFlag))
		AddSliderOptionST("CONTROL_RLDATE_DISPLAY_TIME", "$AMOT Display Time", AMOTRealLifeDateQuest.DisplayTime, "{1}", GetDisplayTimeOptionFlag(_controlModeValues[_rlDateControlModeIndex], rlDateOptionsFlag))
		AddMenuOptionST  ("CONTROL_RLDATE_PERIOD",       "$AMOT Period",       _periods[_rlDatePeriodIndex],             GetPeriodOptionFlag(_controlModeValues[_rlDateControlModeIndex], rlDateOptionsFlag))
	elseIf(page == "$AMOT Page Preset")
		SetCursorPosition(0) ; Can be removed because it starts at 0 anyway

		AddHeaderOption("$AMOT Defaults")
		AddTextOptionST("PRESET_LOAD_DEFAULT", "$AMOT Preset Load defaults", "$AMOT Go")

		AddEmptyOption()
		
		; Check if FISS is available
		FISSInterface fiss = FISSFactory.getFISS()
		int fissFlag = OPTION_FLAG_NONE
		int loadSettingsFlag = OPTION_FLAG_NONE
		if !fiss
			fissFlag = OPTION_FLAG_DISABLED
			loadSettingsFlag = OPTION_FLAG_DISABLED
		else
			fiss.beginLoad("AMOTUserSettings.xml")
			if fiss.endLoad() != ""
				loadSettingsFlag = OPTION_FLAG_DISABLED
			endIf
		endIf

		AddHeaderOption("$AMOT User Settings")
		AddTextOptionST("PRESET_LOAD_USER", "$AMOT Preset Load user settings", "$AMOT Go", loadSettingsFlag)
		AddTextOptionST("PRESET_SAVE_USER", "$AMOT Preset Save user settings", "$AMOT Go", fissFlag)
	endIf
endEvent


event OnVersionUpdate(int a_version)
	; a_version is the new version, CurrentVersion is the old version
	if (a_version >= 2 && CurrentVersion < 2)
		Debug.Trace(self + ": Updating script to version 2")
		InitializeArrays()
		if (_igClockTypeIndex > 0)
			_igClockTypeIndex += 1
		endIf
		if (_rlClockTypeIndex > 0)
			_rlClockTypeIndex += 1
		endIf
	endIf
	if (a_version >= 3 && CurrentVersion < 3)
		Debug.Trace(self + ": Updating script to version 3")
		InitializeArrays()
	endIf
	if (a_version >= 4 && CurrentVersion < 4)
		Debug.Trace(self + ": Updating script to version 4")
		
		AMOTSymbol1Quest.SetWidgetNo(0)
		AMOTSymbol2Quest.SetWidgetNo(1)
		AMOTInGameClockQuest.SetWidgetNo(2)
		AMOTInGameDateQuest.SetWidgetNo(3)
		AMOTRealLifeClockQuest.SetWidgetNo(4)
		AMOTRealLifeDateQuest.SetWidgetNo(5)
		
		AMOTInGameDateQuest.Timescale = AMOTSymbol1Quest.Timescale;
		AMOTRealLifeDateQuest.Timescale = AMOTSymbol1Quest.Timescale;
		AMOTRealLifeClockQuest.Timescale = AMOTSymbol1Quest.Timescale;
	endIf
endEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

int function GetVersion()
	return 4
endFunction


; Gets the option flag for a hotkey option.
int function GetHotkeyOptionFlag(string controlMode, int oldFlag)
	if(oldFlag == OPTION_FLAG_DISABLED)
		return oldFlag
	endIf

	if(controlMode == "timedHotkey" || controlMode == "toggledHotkey" || controlMode == "periodically")
		return OPTION_FLAG_NONE
	endIf
	return OPTION_FLAG_DISABLED
endFunction

; Gets the option flag for a display time option.
int function GetDisplayTimeOptionFlag(string controlMode, int oldFlag)
	if(oldFlag == OPTION_FLAG_DISABLED)
		return oldFlag
	endIf

	if(controlMode == "timedHotkey" || controlMode == "periodically")
		return OPTION_FLAG_NONE
	endIf
	return OPTION_FLAG_DISABLED
endFunction

; Gets the option flag for a period option.
int function GetPeriodOptionFlag(string controlMode, int oldFlag)
	if(oldFlag == OPTION_FLAG_DISABLED)
		return oldFlag
	endIf

	if(controlMode == "periodically")
		return OPTION_FLAG_NONE
	endIf
	return OPTION_FLAG_DISABLED
endFunction

; Gets the next horizontal anchor index.
int function GetNextHorizontalAnchor(int anchor)
	if (anchor < _alignments.length - 1)
	  return anchor + 1
	endIf
	return 0
endFunction

; Gets the next vertical anchor index.
int function GetNextVerticalAnchor(int anchor)
	if (anchor < _vertAlignments.length - 1)
	  return anchor + 1
	endIf
	return 0
endFunction

; Gets the next control mode index.
int function GetNextControlMode(int controlMode)
	if(controlMode < _controlModes.length - 1)
		return controlMode + 1
	endIf
	return 0
endFunction


; Checks if the newly assigned key is conflicting with another mod and asks
; the user if we should go on. Return true if no conflict or ignore.
bool function CheckNewHotkey(string conflictControl, string conflictName)
	if (conflictControl != "")
		string msg
		if (conflictName != "")
			msg = "$AMOT Key mapped to mod {" + conflictControl + "}{" + conflictName + "}"
		else
			msg = "$AMOT Key mapped to game {" + conflictControl + "}"
		endIf

		return ShowMessage(msg, true, "$Yes", "$No")
	endIf
	
	return true
endFunction


; Updates the states of the controls for the hotkey and the display time.
function UpdateControlStates(int controlModeIndex, string statePrefix)
	if(_controlModeValues[controlModeIndex] == "timedHotkey" || _controlModeValues[controlModeIndex] == "periodically")
		SetOptionFlagsST(OPTION_FLAG_NONE, false, statePrefix + "_DISPLAY_TIME")
	else
		SetOptionFlagsST(OPTION_FLAG_DISABLED, false, statePrefix + "_DISPLAY_TIME")
	endIf
	if(_controlModeValues[controlModeIndex] == "always")
		SetOptionFlagsST(OPTION_FLAG_DISABLED, false, statePrefix + "_HOTKEY")
	else
		SetOptionFlagsST(OPTION_FLAG_NONE, false, statePrefix + "_HOTKEY")
	endIf
	if(_controlModeValues[controlModeIndex] == "periodically")
		SetOptionFlagsST(OPTION_FLAG_NONE, false, statePrefix + "_PERIOD")
	else
		SetOptionFlagsST(OPTION_FLAG_DISABLED, false, statePrefix + "_PERIOD")
	endIf
endFunction


; Updates the states of the controls for the general symbol.
function UpdateSymbolOptionStates(AMOTSymbolQuestScript symbolQuest, string statePrefix)
	if(symbolQuest.Shown)
		SetOptionFlagsST(OPTION_FLAG_NONE, true, statePrefix + "_THEME")
	else
		SetOptionFlagsST(OPTION_FLAG_DISABLED, true, statePrefix + "_THEME")
	endIf

	if(symbolQuest.Shown && symbolQuest.HasMoonPhases)
		SetOptionFlagsST(OPTION_FLAG_NONE, true, statePrefix + "_SHOW_MOON_PHASES")
	else
		SetOptionFlagsST(OPTION_FLAG_DISABLED, true, statePrefix + "_SHOW_MOON_PHASES")
	endIf

	if(symbolQuest.Shown && symbolQuest.HasSeasons)
		SetOptionFlagsST(OPTION_FLAG_NONE, false, statePrefix + "_SHOW_SEASONS")
	else
		SetOptionFlagsST(OPTION_FLAG_DISABLED, false, statePrefix + "_SHOW_SEASONS")
	endIf
endFunction


; Sets the horizontal anchor and offset for a widget
function SetHorizontal(AMOTWidgetBase widgetBase, int anchorIndex, float offset, string statePrefix)
	widgetBase.HAnchor = _alignmentValues[anchorIndex]
	widgetBase.X = _alignmentBaseOffsets[anchorIndex] + offset
	SetTextOptionValueST(_alignments[anchorIndex], a_stateName = statePrefix + "_HORIZONTAL_ANCHOR")
	SetSliderOptionValueST(offset, a_stateName = statePrefix + "_X_OFFSET")
endFunction


; Sets the vertical anchor and offset for a widget
function SetVertical(AMOTWidgetBase widgetBase, int anchorIndex, float offset, string statePrefix)
	widgetBase.VAnchor = _vertAlignmentValues[anchorIndex]
	widgetBase.Y = _vertAlignmentBaseOffsets[anchorIndex] + offset
	SetTextOptionValueST(_vertAlignments[anchorIndex], a_stateName = statePrefix + "_VERTICAL_ANCHOR")
	SetSliderOptionValueST(offset, a_stateName = statePrefix + "_Y_OFFSET")
endFunction


; Checks if the given key code is used by this mod.
string function GetCustomControl(int keyCode)
	if (keyCode == AMOTSymbol1Quest.Hotkey)
		return "$AMOT Show symbol 1 key"
	elseIf (keyCode == AMOTSymbol2Quest.Hotkey)
		return "$AMOT Show symbol 2 key"
	elseIf (keyCode == AMOTInGameClockQuest.Hotkey)
		return "$AMOT Show in-game clock key"
	elseIf (keyCode == AMOTInGameDateQuest.Hotkey)
		return "$AMOT Show in-game date key"
	elseIf (keyCode == AMOTRealLifeClockQuest.Hotkey)
		return "$AMOT Show real-life clock key"
	elseIf (keyCode == AMOTRealLifeDateQuest.Hotkey)
		return "$AMOT Show real-life date key"
	else
		return ""
	endIf
endFunction


; Formats a floating point number with the given count of digits.
string function FormatNumber(float number, int i)
	if (i > 0)
		i = i + 1
	endIf
	string result = number as string
	int pos = StringUtil.Find(result, ".")
	if (pos >= 0 && pos + i >= 0)
		result = StringUtil.Substring(result, 0, pos + i)
	endIf
	return result
endFunction


; Formats a boolean value to "$AMOT True" or "$AMOT False".
string function FormatBool(bool b)
	if (b)
		return "$AMOT True"
	endIf
	return "$AMOT False"
endFunction


; Populates all indexed properties of the general page to the widget quests
function PopulateIndexedPropertiesGeneral()
	AMOTSymbol1Quest.Theme				= _themeValues[_symbol1ThemeIndex]
	AMOTSymbol2Quest.Theme				= _themeValues[_symbol2ThemeIndex]
	AMOTInGameClockQuest.ClockType 		= _clockTypeValues[_igClockTypeIndex]
	AMOTInGameDateQuest.DateFormat 		= _dateFormatValues[_igDateFormatIndex]
	AMOTRealLifeClockQuest.ClockType 	= _clockTypeValues[_rlClockTypeIndex]
	AMOTRealLifeDateQuest.DateFormat 	= _dateFormatValues[_rlDateFormatIndex]
endFunction


; Populates all indexed properties of the display page to the widget quests
function PopulateIndexedPropertiesDisplay()
	AMOTSymbol1Quest.HAnchor = _alignmentValues[_symbol1AlignmentIndex]
	AMOTSymbol1Quest.X = _alignmentBaseOffsets[_symbol1AlignmentIndex] + _symbol1XOffset
	AMOTSymbol1Quest.VAnchor = _vertAlignmentValues[_symbol1VertAlignmentIndex]
	AMOTSymbol1Quest.Y = _vertAlignmentBaseOffsets[_symbol1VertAlignmentIndex] + _symbol1YOffset

	AMOTSymbol2Quest.HAnchor = _alignmentValues[_symbol2AlignmentIndex]
	AMOTSymbol2Quest.X = _alignmentBaseOffsets[_symbol2AlignmentIndex] + _symbol2XOffset
	AMOTSymbol2Quest.VAnchor = _vertAlignmentValues[_symbol2VertAlignmentIndex]
	AMOTSymbol2Quest.Y = _vertAlignmentBaseOffsets[_symbol2VertAlignmentIndex] + _symbol2YOffset

	AMOTInGameClockQuest.HAnchor = _alignmentValues[_igClockAlignmentIndex]
	AMOTInGameClockQuest.X = _alignmentBaseOffsets[_igClockAlignmentIndex] + _igClockXOffset
	AMOTInGameClockQuest.VAnchor = _vertAlignmentValues[_igClockVertAlignmentIndex]
	AMOTInGameClockQuest.Y = _vertAlignmentBaseOffsets[_igClockVertAlignmentIndex] + _igClockYOffset

	AMOTInGameDateQuest.HAnchor = _alignmentValues[_igDateAlignmentIndex]
	AMOTInGameDateQuest.X = _alignmentBaseOffsets[_igDateAlignmentIndex] + _igDateXOffset
	AMOTInGameDateQuest.VAnchor = _vertAlignmentValues[_igDateVertAlignmentIndex]
	AMOTInGameDateQuest.Y = _vertAlignmentBaseOffsets[_igDateVertAlignmentIndex] + _igDateYOffset

	AMOTRealLifeClockQuest.HAnchor = _alignmentValues[_rlClockAlignmentIndex]
	AMOTRealLifeClockQuest.X = _alignmentBaseOffsets[_rlClockAlignmentIndex] + _rlClockXOffset
	AMOTRealLifeClockQuest.VAnchor = _vertAlignmentValues[_rlClockVertAlignmentIndex]
	AMOTRealLifeClockQuest.Y = _vertAlignmentBaseOffsets[_rlClockVertAlignmentIndex] + _rlClockYOffset

	AMOTRealLifeDateQuest.HAnchor = _alignmentValues[_rlDateAlignmentIndex]
	AMOTRealLifeDateQuest.X = _alignmentBaseOffsets[_rlDateAlignmentIndex] + _rlDateXOffset
	AMOTRealLifeDateQuest.VAnchor = _vertAlignmentValues[_rlDateVertAlignmentIndex]
	AMOTRealLifeDateQuest.Y = _vertAlignmentBaseOffsets[_rlDateVertAlignmentIndex] + _rlDateYOffset
endFunction


; Populates all indexed properties of the control page to the widget quests
function PopulateIndexedPropertiesControl()
	AMOTSymbol1Quest.ControlMode 		= _controlModeValues[_symbol1ControlModeIndex]
	AMOTSymbol2Quest.ControlMode 		= _controlModeValues[_symbol2ControlModeIndex]
	AMOTInGameClockQuest.ControlMode 	= _controlModeValues[_igClockControlModeIndex]
	AMOTInGameDateQuest.ControlMode 	= _controlModeValues[_igClockControlModeIndex]
	AMOTRealLifeClockQuest.ControlMode 	= _controlModeValues[_rlClockControlModeIndex]
	AMOTRealLifeDateQuest.ControlMode 	= _controlModeValues[_rlClockControlModeIndex]
	AMOTSymbol1Quest.Period 		= _periodValues[_symbol1PeriodIndex]
	AMOTSymbol2Quest.Period 		= _periodValues[_symbol2PeriodIndex]
	AMOTInGameClockQuest.Period 	= _periodValues[_igClockPeriodIndex]
	AMOTInGameDateQuest.Period 		= _periodValues[_igClockPeriodIndex]
	AMOTRealLifeClockQuest.Period 	= _periodValues[_rlClockPeriodIndex]
	AMOTRealLifeDateQuest.Period 	= _periodValues[_rlClockPeriodIndex]
endFunction


function LoadDefaultsGeneral()
	_symbol1ThemeIndex				= _defaultSymbol1ThemeIndex
	_symbol2ThemeIndex				= _defaultSymbol2ThemeIndex
	_igClockTypeIndex				= _defaultIGClockTypeIndex
	_igDateFormatIndex				= _defaultIGDateFormatIndex
	_rlClockTypeIndex				= _defaultRLClockTypeIndex
	_rlDateFormatIndex				= _defaultRLDateFormatIndex
	PopulateIndexedPropertiesGeneral()
	AMOTSymbol1Quest.Shown 				= _defaultSymbol1Shown			
	AMOTSymbol1Quest.ShowMoonPhases		= _defaultSymbol1ShowMoonPhases	
	AMOTSymbol1Quest.ShowSeasons		= _defaultSymbol1ShowSeasons		
	AMOTSymbol2Quest.Shown				= _defaultSymbol2Shown			
	AMOTSymbol2Quest.ShowMoonPhases		= _defaultSymbol2ShowMoonPhases	
	AMOTSymbol2Quest.ShowSeasons		= _defaultSymbol2ShowSeasons		
	AMOTInGameClockQuest.Shown 			= _defaultIGClockShown
	AMOTInGameClockQuest.ShowSeconds	= _defaultIGClockShowSeconds
	AMOTInGameDateQuest.Shown			= _defaultIGDateShown
	AMOTRealLifeClockQuest.Shown		= _defaultRLClockShown
	AMOTRealLifeClockQuest.ShowSeconds	= _defaultRLClockShowSeconds
	AMOTRealLifeDateQuest.Shown			= _defaultRLDateShown
endFunction


function LoadDefaultsDisplay()
	_symbol1AlignmentIndex			= _defaultSymbol1AlignmentIndex
	_symbol1VertAlignmentIndex		= _defaultSymbol1VertAlignmentIndex
	_symbol2AlignmentIndex			= _defaultSymbol2AlignmentIndex
	_symbol2VertAlignmentIndex		= _defaultSymbol2VertAlignmentIndex
	_igClockAlignmentIndex			= _defaultIGClockAlignmentIndex
	_igClockVertAlignmentIndex		= _defaultIGClockVertAlignmentIndex
	_igDateAlignmentIndex			= _defaultIGDateAlignmentIndex
	_igDateVertAlignmentIndex		= _defaultIGDateVertAlignmentIndex
	_rlClockAlignmentIndex			= _defaultRLClockAlignmentIndex
	_rlClockVertAlignmentIndex		= _defaultRLClockVertAlignmentIndex
	_rlDateAlignmentIndex			= _defaultRLDateAlignmentIndex
	_rlDateVertAlignmentIndex		= _defaultRLDateVertAlignmentIndex
	_symbol1XOffset					= _defaultSymbol1XOffset
	_symbol1YOffset					= _defaultSymbol1YOffset
	_symbol2XOffset					= _defaultSymbol2XOffset
	_symbol2YOffset					= _defaultSymbol2YOffset
	_igClockXOffset					= _defaultIGClockXOffset
	_igClockYOffset					= _defaultIGClockYOffset
	_igDateXOffset					= _defaultIGDateXOffset
	_igDateYOffset					= _defaultIGDateYOffset
	_rlClockXOffset					= _defaultRLClockXOffset
	_rlClockYOffset					= _defaultRLClockYOffset
	_rlDateXOffset					= _defaultRLDateXOffset
	_rlDateYOffset					= _defaultRLDateYOffset
	PopulateIndexedPropertiesDisplay()
	AMOTSymbol1Quest.Scale				= _defaultSymbol1Scale
	AMOTSymbol1Quest.WidgetAlpha		= _defaultSymbol1Alpha
	AMOTInGameClockQuest.Scale			= _defaultIGClockScale
	AMOTInGameClockQuest.WidgetAlpha	= _defaultIGClockAlpha
	AMOTInGameDateQuest.Scale			= _defaultIGDateScale
	AMOTInGameDateQuest.WidgetAlpha		= _defaultIGDateAlpha
	AMOTSymbol2Quest.Scale				= _defaultSymbol2Scale
	AMOTSymbol2Quest.WidgetAlpha		= _defaultSymbol2Alpha
	AMOTRealLifeClockQuest.Scale		= _defaultRLClockScale
	AMOTRealLifeClockQuest.WidgetAlpha	= _defaultRLClockAlpha
	AMOTRealLifeDateQuest.Scale			= _defaultRLDateScale
	AMOTRealLifeDateQuest.WidgetAlpha	= _defaultRLDateAlpha
endFunction


function LoadDefaultsControl()
	_symbol1ControlModeIndex		= _defaultSymbol1ControlModeIndex
	_symbol2ControlModeIndex		= _defaultSymbol2ControlModeIndex
	_igClockControlModeIndex		= _defaultIGClockControlModeIndex
	_igDateControlModeIndex			= _defaultIGDateControlModeIndex
	_rlClockControlModeIndex		= _defaultRLClockControlModeIndex
	_rlDateControlModeIndex			= _defaultRLDateControlModeIndex
	_symbol1PeriodIndex				= _defaultSymbol1PeriodIndex
	_symbol2PeriodIndex				= _defaultSymbol2PeriodIndex
	_igClockPeriodIndex				= _defaultIGClockPeriodIndex
	_igDatePeriodIndex				= _defaultIGDatePeriodIndex
	_rlClockPeriodIndex				= _defaultRLClockPeriodIndex
	_rlDatePeriodIndex				= _defaultRLDatePeriodIndex
	PopulateIndexedPropertiesControl()
	AMOTSymbol1Quest.Hotkey				= _defaultSymbol1Hotkey
	AMOTSymbol1Quest.DisplayTime		= _defaultSymbol1DisplayTime
	AMOTInGameClockQuest.Hotkey			= _defaultIGClockHotkey
	AMOTInGameClockQuest.DisplayTime	= _defaultIGClockDisplayTime
	AMOTInGameDateQuest.Hotkey			= _defaultIGDateHotkey
	AMOTInGameDateQuest.DisplayTime		= _defaultIGDateDisplayTime
	AMOTSymbol2Quest.Hotkey				= _defaultSymbol2Hotkey
	AMOTSymbol2Quest.DisplayTime		= _defaultSymbol2DisplayTime
	AMOTRealLifeClockQuest.Hotkey		= _defaultRLClockHotkey
	AMOTRealLifeClockQuest.DisplayTime	= _defaultRLClockDisplayTime
	AMOTRealLifeDateQuest.Hotkey		= _defaultRLDateHotkey
	AMOTRealLifeDateQuest.DisplayTime	= _defaultRLDateDisplayTime
endFunction


function LoadPresetGeneralAll()
	_symbol1ThemeIndex				= _defaultSymbol1ThemeIndex
	_symbol2ThemeIndex				= _defaultSymbol2ThemeIndex
	_igClockTypeIndex				= _defaultIGClockTypeIndex
	_igDateFormatIndex				= _defaultIGDateFormatIndex
	_rlClockTypeIndex				= _defaultRLClockTypeIndex
	_rlDateFormatIndex				= _defaultRLDateFormatIndex
	PopulateIndexedPropertiesGeneral()
	AMOTSymbol1Quest.Shown 				= true			
	AMOTSymbol1Quest.ShowMoonPhases		= _defaultSymbol1ShowMoonPhases	
	AMOTSymbol1Quest.ShowSeasons		= _defaultSymbol1ShowSeasons		
	AMOTSymbol2Quest.Shown				= true			
	AMOTSymbol2Quest.ShowMoonPhases		= _defaultSymbol2ShowMoonPhases	
	AMOTSymbol2Quest.ShowSeasons		= _defaultSymbol2ShowSeasons		
	AMOTInGameClockQuest.Shown 			= true
	AMOTInGameClockQuest.ShowSeconds	= _defaultIGClockShowSeconds
	AMOTInGameDateQuest.Shown			= true
	AMOTRealLifeClockQuest.Shown		= true
	AMOTRealLifeClockQuest.ShowSeconds	= _defaultRLClockShowSeconds
	AMOTRealLifeDateQuest.Shown			= true
endFunction


function LoadPresetDisplayList()
	float xOffset = 0.0
	float yOffset = 0.0
	float width = 0.0
	int alignmentIndex = 0
	int vertAlignementIndex = 0

	; Determine the needed values of the first visible widget.
	if (AMOTSymbol1Quest.Shown)
		xOffset = _symbol1XOffset
		yOffset = _symbol1YOffset + AMOTSymbol1Quest.GetHeight()
		width = AMOTSymbol1Quest.GetWidth()
		alignmentIndex = _symbol1AlignmentIndex
		vertAlignementIndex = _symbol1VertAlignmentIndex
	elseIf (AMOTSymbol2Quest.Shown)
		xOffset = _symbol2XOffset
		yOffset = _symbol2YOffset + AMOTSymbol2Quest.GetHeight()
		width = AMOTSymbol2Quest.GetWidth()
		alignmentIndex = _symbol2AlignmentIndex
		vertAlignementIndex = _symbol2VertAlignmentIndex
	elseIf (AMOTInGameClockQuest.Shown)
		xOffset = _igClockXOffset
		yOffset = _igClockYOffset + AMOTInGameClockQuest.GetHeight()
		width = AMOTInGameClockQuest.GetWidth()
		alignmentIndex = _igClockAlignmentIndex
		vertAlignementIndex = _igClockVertAlignmentIndex
	elseIf (AMOTInGameDateQuest.Shown)
		xOffset = _igDateXOffset
		yOffset = _igDateYOffset + AMOTInGameDateQuest.GetHeight()
		width = AMOTInGameDateQuest.GetWidth()
		alignmentIndex = _igDateAlignmentIndex
		vertAlignementIndex = _igDateVertAlignmentIndex
	elseIf (AMOTRealLifeClockQuest.Shown)
		xOffset = _rlClockXOffset
		yOffset = _rlClockYOffset + AMOTRealLifeClockQuest.GetHeight()
		width = AMOTRealLifeClockQuest.GetWidth()
		alignmentIndex = _rlClockAlignmentIndex
		vertAlignementIndex = _rlClockVertAlignmentIndex
	elseIf (AMOTRealLifeDateQuest.Shown)
		xOffset = _rlDateXOffset
		yOffset = _rlDateYOffset + AMOTRealLifeDateQuest.GetHeight()
		width = AMOTRealLifeDateQuest.GetWidth()
		alignmentIndex = _rlDateAlignmentIndex
		vertAlignementIndex = _rlDateVertAlignmentIndex
	else
		; No widget is shown
		return
	endIf

	int xFactor = 1
	if (alignmentIndex == 1)
		xFactor = -1
	elseIf (alignmentIndex == 2)
		xFactor = 0
	endIf
	float yFactor = 0
	if (vertAlignementIndex == 1)
		yFactor = 1
		yOffset = 0
	elseIf (vertAlignementIndex == 2)
		yFactor = 0.5
		yOffset /= 2
	endIf

	; Change the values (symbol 1 is never changed because it is the master if shown).
	if (AMOTSymbol2Quest.Shown)
		_symbol2alignmentIndex			= alignmentIndex
		_symbol2VertAlignmentIndex		= vertAlignementIndex
		_symbol2XOffset					= xOffset + ((width - AMOTSymbol2Quest.GetWidth()) / 2) * xFactor
		_symbol2YOffset					= yOffset + AMOTSymbol2Quest.GetHeight() * yFactor
		yOffset += AMOTSymbol2Quest.GetHeight()
	endIf
	if (AMOTInGameClockQuest.Shown)
		_igClockalignmentIndex			= alignmentIndex
		_igClockVertAlignmentIndex		= vertAlignementIndex
		_igClockXOffset					= xOffset + ((width - AMOTInGameClockQuest.GetWidth()) / 2) * xFactor
		_igClockYOffset					= yOffset + AMOTInGameClockQuest.GetHeight() * yFactor
		yOffset += AMOTInGameClockQuest.GetHeight()
	endIf
	if (AMOTInGameDateQuest.Shown)
		_igDatealignmentIndex			= alignmentIndex
		_igDateVertAlignmentIndex		= vertAlignementIndex
		_igDateXOffset					= xOffset + ((width - AMOTInGameDateQuest.GetWidth()) / 2) * xFactor
		_igDateYOffset					= yOffset + AMOTInGameDateQuest.GetHeight() * yFactor
		yOffset += AMOTInGameDateQuest.GetHeight()
	endIf
	if (AMOTRealLifeClockQuest.Shown)
		_rlClockalignmentIndex			= alignmentIndex
		_rlClockVertAlignmentIndex		= vertAlignementIndex
		_rlClockXOffset					= xOffset + ((width - AMOTRealLifeClockQuest.GetWidth()) / 2) * xFactor
		_rlClockYOffset					= yOffset + AMOTRealLifeClockQuest.GetHeight() * yFactor
		yOffset += AMOTRealLifeClockQuest.GetHeight()
	endIf
	if (AMOTRealLifeDateQuest.Shown)
		_rlDatealignmentIndex			= alignmentIndex
		_rlDateVertAlignmentIndex		= vertAlignementIndex
		_rlDateXOffset					= xOffset + ((width - AMOTRealLifeDateQuest.GetWidth()) / 2) * xFactor
		_rlDateYOffset					= yOffset + AMOTRealLifeDateQuest.GetHeight() * yFactor
	endIf

	PopulateIndexedPropertiesDisplay()
endFunction


function LoadPresetDisplayTwoColumnList()
	float xOffset = 0.0
	float yOffset = 0.0
	float symbolWidth = 0.0
	float textWidth = 0.0
	int alignmentIndex = 0
	int vertAlignementIndex = 0

	; Determine the needed values of the first visible widget.
	if (AMOTSymbol1Quest.Shown)
		xOffset = _symbol1XOffset
		yOffset = _symbol1YOffset + AMOTSymbol1Quest.GetHeight()
		symbolWidth = AMOTSymbol1Quest.GetWidth()
		alignmentIndex = _symbol1AlignmentIndex
		vertAlignementIndex = _symbol1VertAlignmentIndex
	elseIf (AMOTSymbol2Quest.Shown)
		xOffset = _symbol2XOffset
		yOffset = _symbol2YOffset + AMOTSymbol2Quest.GetHeight()
		symbolWidth = AMOTSymbol2Quest.GetWidth()
		alignmentIndex = _symbol2AlignmentIndex
		vertAlignementIndex = _symbol2VertAlignmentIndex
	else
		; No symbol widget is shown
		return
	endIf

	; Determine the width of the text columns (which is clock.width + date.width if displayed)
	float maxWidthCol1 = 0.0;
	float maxWidthCol2 = 0.0;
	float maxHeightRow1 = 0.0;
	float maxHeightRow2 = 0.0;
	if (AMOTInGameClockQuest.Shown)
		maxWidthCol1 = AMOTInGameClockQuest.GetWidth()
		maxHeightRow1 = AMOTInGameClockQuest.GetHeight()
	endIf
	if (AMOTInGameDateQuest.Shown)
		maxWidthCol2 = AMOTInGameDateQuest.GetWidth()
		if (AMOTInGameDateQuest.GetHeight() > maxHeightRow1)
			maxHeightRow1 = AMOTInGameDateQuest.GetHeight()
		endIf
	endIf
	if (AMOTRealLifeClockQuest.Shown)
		if (AMOTRealLifeClockQuest.GetWidth() > maxWidthCol1)
			maxWidthCol1 = AMOTRealLifeClockQuest.GetWidth()
		endIf
		maxHeightRow2 = AMOTRealLifeClockQuest.GetHeight()
	endIf
	if (AMOTRealLifeDateQuest.Shown)
		if (AMOTRealLifeDateQuest.GetWidth() > maxWidthCol2)
			maxWidthCol2 = AMOTRealLifeDateQuest.GetWidth()
		endIf
		if (AMOTRealLifeDateQuest.GetHeight() > maxHeightRow2)
			maxHeightRow2 = AMOTRealLifeDateQuest.GetHeight()
		endIf
	endIf
	
	if (maxWidthCol1 == 0.0 && maxWidthCol2 == 0.0)
		; Nothing to display
		return
	endIf
	
	; The text might be wider than the symbol so we have to adjust the x offset of the symbol
	; TODO
	float left = xOffset
	float right = left + maxWidthCol1 + maxWidthCol2
	float top1 = yOffset
	float top2 = top1 + maxHeightRow1

	float xFactor = 0
	if (alignmentIndex == 1)
		xFactor = -1
	elseIf (alignmentIndex == 2)
		xFactor = -0.5
	endIf

	bool clockShown = AMOTInGameClockQuest.Shown || AMOTRealLifeClockQuest.Shown
	bool dateShown = AMOTInGameDateQuest.Shown || AMOTRealLifeDateQuest.Shown
	bool igShown = AMOTInGameClockQuest.Shown || AMOTInGameDateQuest.Shown
	bool rlShown = AMOTRealLifeClockQuest.Shown || AMOTRealLifeDateQuest.Shown

	if (AMOTInGameClockQuest.Shown)
		_igClockalignmentIndex			= alignmentIndex
		_igClockVertAlignmentIndex		= vertAlignementIndex
		_igClockXOffset					= left + (AMOTInGameClockQuest.GetWidth() * xFactor)
		_igClockYOffset					= top1
	endIf
	if (AMOTInGameDateQuest.Shown)
		_igDatealignmentIndex			= alignmentIndex
		_igDateVertAlignmentIndex		= vertAlignementIndex
		_igDateXOffset					= right - (AMOTInGameDateQuest.GetWidth() * xFactor)
		_igDateYOffset					= top1
	endIf
	if (AMOTRealLifeClockQuest.Shown)
		_rlClockalignmentIndex			= alignmentIndex
		_rlClockVertAlignmentIndex		= vertAlignementIndex
		_rlClockXOffset					= left + (AMOTRealLifeClockQuest.GetWidth() * xFactor)
		_rlClockYOffset					= top2
	endIf
	if (AMOTRealLifeDateQuest.Shown)
		_rlDatealignmentIndex			= alignmentIndex
		_rlDateVertAlignmentIndex		= vertAlignementIndex
		_rlDateXOffset					= right - (AMOTRealLifeDateQuest.GetWidth() * xFactor)
		_rlDateYOffset					= top2
	endIf

	PopulateIndexedPropertiesDisplay()
endFunction


function LoadPresetControlTimed()
	_symbol1ControlModeIndex		= 1
	_symbol2ControlModeIndex		= 1
	_igClockControlModeIndex		= 1
	_igDateControlModeIndex			= 1
	_rlClockControlModeIndex		= 1
	_rlDateControlModeIndex			= 1
	PopulateIndexedPropertiesControl()
endFunction


function LoadPresetControlToggled()
	_symbol1ControlModeIndex		= 2
	_symbol2ControlModeIndex		= 2
	_igClockControlModeIndex		= 2
	_igDateControlModeIndex			= 2
	_rlClockControlModeIndex		= 2
	_rlDateControlModeIndex			= 2
	PopulateIndexedPropertiesControl()
endFunction


bool function LoadUserSettings()
	FISSInterface fiss = FISSFactory.getFISS()
	fiss.beginLoad("AMOTUserSettings.xml")
	_symbol1ThemeIndex = fiss.loadInt("Symbol1ThemeIndex")
	_symbol2ThemeIndex = fiss.loadInt("Symbol2ThemeIndex")
	_igClockTypeIndex = fiss.loadInt("IGClockTypeIndex")
	_igDateFormatIndex = fiss.loadInt("IGDateFormatIndex")
	_rlClockTypeIndex = fiss.loadInt("RLClockTypeIndex")
	_rlDateFormatIndex = fiss.loadInt("RLDateFormatIndex")
	AMOTSymbol1Quest.Shown = fiss.loadBool("Symbol1Shown")
	AMOTSymbol1Quest.ShowMoonPhases = fiss.loadBool("Symbol1ShowMoonPhases")
	AMOTSymbol1Quest.ShowSeasons = fiss.loadBool("Symbol1ShowSeasons")
	AMOTSymbol2Quest.Shown = fiss.loadBool("Symbol2Shown")
	AMOTSymbol2Quest.ShowMoonPhases = fiss.loadBool("Symbol2ShowMoonPhases")
	AMOTSymbol2Quest.ShowSeasons = fiss.loadBool("Symbol2ShowSeasons")
	AMOTInGameClockQuest.Shown = fiss.loadBool("IGClockShown")
	AMOTInGameClockQuest.ShowSeconds = fiss.loadBool("IGClockShowSeconds")
	AMOTInGameDateQuest.Shown = fiss.loadBool("IGDateShown")
	AMOTRealLifeClockQuest.Shown = fiss.loadBool("RLClockShown")
	AMOTRealLifeClockQuest.ShowSeconds = fiss.loadBool("RLClockShowSeconds")
	AMOTRealLifeDateQuest.Shown = fiss.loadBool("RLDateShown")
	_symbol1AlignmentIndex = fiss.loadInt("Symbol1AlignmentIndex")
	_symbol1VertAlignmentIndex = fiss.loadInt("Symbol1VertAlignmentIndex")
	_symbol2AlignmentIndex = fiss.loadInt("Symbol2AlignmentIndex")
	_symbol2VertAlignmentIndex = fiss.loadInt("Symbol2VertAlignmentIndex")
	_igClockAlignmentIndex = fiss.loadInt("IGClockAlignmentIndex")
	_igClockVertAlignmentIndex = fiss.loadInt("IGClockVertAlignmentIndex")
	_igDateAlignmentIndex = fiss.loadInt("IGDateAlignmentIndex")
	_igDateVertAlignmentIndex = fiss.loadInt("IGDateVertAlignmentIndex")
	_rlClockAlignmentIndex = fiss.loadInt("RLClockAlignmentIndex")
	_rlClockVertAlignmentIndex = fiss.loadInt("RLClockVertAlignmentIndex")
	_rlDateAlignmentIndex = fiss.loadInt("RLDateAlignmentIndex")
	_rlDateVertAlignmentIndex = fiss.loadInt("RLDateVertAlignmentIndex")
	_symbol1XOffset = fiss.loadFloat("Symbol1XOffset")
	_symbol1YOffset = fiss.loadFloat("Symbol1YOffset")
	_symbol2XOffset = fiss.loadFloat("Symbol2XOffset")
	_symbol2YOffset = fiss.loadFloat("Symbol2YOffset")
	_igClockXOffset = fiss.loadFloat("IGClockXOffset")
	_igClockYOffset = fiss.loadFloat("IGClockYOffset")
	_igDateXOffset = fiss.loadFloat("IGDateXOffset")
	_igDateYOffset = fiss.loadFloat("IGDateYOffset")
	_rlClockXOffset = fiss.loadFloat("RLClockXOffset")
	_rlClockYOffset = fiss.loadFloat("RLClockYOffset")
	_rlDateXOffset = fiss.loadFloat("RLDateXOffset")
	_rlDateYOffset = fiss.loadFloat("RLDateYOffset")
	AMOTSymbol1Quest.Scale = fiss.loadInt("Symbol1Scale")
	AMOTSymbol1Quest.WidgetAlpha = fiss.loadInt("Symbol1WidgetAlpha")
	AMOTInGameClockQuest.Scale = fiss.loadInt("IGClockScale")
	AMOTInGameClockQuest.WidgetAlpha = fiss.loadInt("IGClockWidgetAlpha")
	AMOTInGameDateQuest.Scale = fiss.loadInt("IGDateScale")
	AMOTInGameDateQuest.WidgetAlpha = fiss.loadInt("IGDateWidgetAlpha")
	AMOTSymbol2Quest.Scale = fiss.loadInt("Symbol2Scale")
	AMOTSymbol2Quest.WidgetAlpha = fiss.loadInt("Symbol2WidgetAlpha")
	AMOTRealLifeClockQuest.Scale = fiss.loadInt("RLClockScale")
	AMOTRealLifeClockQuest.WidgetAlpha = fiss.loadInt("RLClockWidgetAlpha")
	AMOTRealLifeDateQuest.Scale = fiss.loadInt("RLDateScale")
	AMOTRealLifeDateQuest.WidgetAlpha = fiss.loadInt("RLDateWidgetAlpha")
	_symbol1ControlModeIndex = fiss.loadInt("Symbol1ControlModeIndex")
	_symbol2ControlModeIndex = fiss.loadInt("Symbol2ControlModeIndex")
	_igClockControlModeIndex = fiss.loadInt("IGClockControlModeIndex")
	_igDateControlModeIndex = fiss.loadInt("IGDateControlModeIndex")
	_rlClockControlModeIndex = fiss.loadInt("RLClockControlModeIndex")
	_rlDateControlModeIndex = fiss.loadInt("RLDateControlModeIndex")
	_symbol1PeriodIndex = fiss.loadInt("Symbol1PeriodIndex")
	_symbol2PeriodIndex = fiss.loadInt("Symbol2PeriodIndex")
	_igClockPeriodIndex = fiss.loadInt("IGClockPeriodIndex")
	_igDatePeriodIndex = fiss.loadInt("IGDatePeriodIndex")
	_rlClockPeriodIndex = fiss.loadInt("RLClockPeriodIndex")
	_rlDatePeriodIndex = fiss.loadInt("RLDatePeriodIndex")
	AMOTSymbol1Quest.Hotkey = fiss.loadInt("Symbol1Hotkey")
	AMOTSymbol1Quest.DisplayTime = fiss.loadFloat("Symbol1DisplayTime")
	AMOTInGameClockQuest.Hotkey = fiss.loadInt("IGClockHotkey")
	AMOTInGameClockQuest.DisplayTime = fiss.loadFloat("IGClockDisplayTime")
	AMOTInGameDateQuest.Hotkey = fiss.loadInt("IGDateHotkey")
	AMOTInGameDateQuest.DisplayTime = fiss.loadFloat("IGDateDisplayTime")
	AMOTSymbol2Quest.Hotkey = fiss.loadInt("Symbol2Hotkey")
	AMOTSymbol2Quest.DisplayTime = fiss.loadFloat("Symbol2DisplayTime")
	AMOTRealLifeClockQuest.Hotkey = fiss.loadInt("RLClockHotkey")
	AMOTRealLifeClockQuest.DisplayTime = fiss.loadFloat("RLClockDisplayTime")
	AMOTRealLifeDateQuest.Hotkey = fiss.loadInt("RLDateHotkey")
	AMOTRealLifeDateQuest.DisplayTime = fiss.loadFloat("RLDateDisplayTime")

	PopulateIndexedPropertiesGeneral()
	PopulateIndexedPropertiesDisplay()
	PopulateIndexedPropertiesControl()

	string result = fiss.endLoad()
	if result != ""
		Debug.Trace("AMOT: Error loading user settings: " + result)
		return false
	endIf
	return true
endFunction


bool function SaveUserSettings()
	FISSInterface fiss = FISSFactory.getFISS()
	fiss.beginSave("AMOTUserSettings.xml", " A Matter of Time")
	
	fiss.saveInt("Symbol1ThemeIndex", _symbol1ThemeIndex)
	fiss.saveInt("Symbol2ThemeIndex", _symbol2ThemeIndex)
	fiss.saveInt("IGClockTypeIndex", _igClockTypeIndex)
	fiss.saveInt("IGDateFormatIndex", _igDateFormatIndex)
	fiss.saveInt("RLClockTypeIndex", _rlClockTypeIndex)
	fiss.saveInt("RLDateFormatIndex", _rlDateFormatIndex)

	fiss.saveBool("Symbol1Shown", AMOTSymbol1Quest.Shown)
	fiss.saveBool("Symbol1ShowMoonPhases", AMOTSymbol1Quest.ShowMoonPhases)
	fiss.saveBool("Symbol1ShowSeasons", AMOTSymbol1Quest.ShowSeasons)
	fiss.saveBool("Symbol2Shown", AMOTSymbol2Quest.Shown)
	fiss.saveBool("Symbol2ShowMoonPhases", AMOTSymbol2Quest.ShowMoonPhases)
	fiss.saveBool("Symbol2ShowSeasons", AMOTSymbol2Quest.ShowSeasons)
	fiss.saveBool("IGClockShown", AMOTInGameClockQuest.Shown)
	fiss.saveBool("IGClockShowSeconds", AMOTInGameClockQuest.ShowSeconds)
	fiss.saveBool("IGDateShown", AMOTInGameDateQuest.Shown)
	fiss.saveBool("RLClockShown", AMOTRealLifeClockQuest.Shown)
	fiss.saveBool("RLClockShowSeconds", AMOTRealLifeClockQuest.ShowSeconds)
	fiss.saveBool("RLDateShown", AMOTRealLifeDateQuest.Shown)

	fiss.saveInt("Symbol1AlignmentIndex", _symbol1AlignmentIndex)
	fiss.saveInt("Symbol1VertAlignmentIndex", _symbol1VertAlignmentIndex)
	fiss.saveInt("Symbol2AlignmentIndex", _symbol2AlignmentIndex)
	fiss.saveInt("Symbol2VertAlignmentIndex", _symbol2VertAlignmentIndex)
	fiss.saveInt("IGClockAlignmentIndex", _igClockAlignmentIndex)
	fiss.saveInt("IGClockVertAlignmentIndex", _igClockVertAlignmentIndex)
	fiss.saveInt("IGDateAlignmentIndex", _igDateAlignmentIndex)
	fiss.saveInt("IGDateVertAlignmentIndex", _igDateVertAlignmentIndex)
	fiss.saveInt("RLClockAlignmentIndex", _rlClockAlignmentIndex)
	fiss.saveInt("RLClockVertAlignmentIndex", _rlClockVertAlignmentIndex)
	fiss.saveInt("RLDateAlignmentIndex", _rlDateAlignmentIndex)
	fiss.saveInt("RLDateVertAlignmentIndex", _rlDateVertAlignmentIndex)

	fiss.saveFloat("Symbol1XOffset", _symbol1XOffset)
	fiss.saveFloat("Symbol1YOffset", _symbol1YOffset)
	fiss.saveFloat("Symbol2XOffset", _symbol2XOffset)
	fiss.saveFloat("Symbol2YOffset", _symbol2YOffset)
	fiss.saveFloat("IGClockXOffset", _igClockXOffset)
	fiss.saveFloat("IGClockYOffset", _igClockYOffset)
	fiss.saveFloat("IGDateXOffset", _igDateXOffset)
	fiss.saveFloat("IGDateYOffset", _igDateYOffset)
	fiss.saveFloat("RLClockXOffset", _rlClockXOffset)
	fiss.saveFloat("RLClockYOffset", _rlClockYOffset)
	fiss.saveFloat("RLDateXOffset", _rlDateXOffset)
	fiss.saveFloat("RLDateYOffset", _rlDateYOffset)

	fiss.saveInt("Symbol1Scale", AMOTSymbol1Quest.Scale)
	fiss.saveInt("Symbol1WidgetAlpha", AMOTSymbol1Quest.WidgetAlpha)
	fiss.saveInt("IGClockScale", AMOTInGameClockQuest.Scale)
	fiss.saveInt("IGClockWidgetAlpha", AMOTInGameClockQuest.WidgetAlpha)
	fiss.saveInt("IGDateScale", AMOTInGameDateQuest.Scale)
	fiss.saveInt("IGDateWidgetAlpha", AMOTInGameDateQuest.WidgetAlpha)
	fiss.saveInt("Symbol2Scale", AMOTSymbol2Quest.Scale)
	fiss.saveInt("Symbol2WidgetAlpha", AMOTSymbol2Quest.WidgetAlpha)
	fiss.saveInt("RLClockScale", AMOTRealLifeClockQuest.Scale)
	fiss.saveInt("RLClockWidgetAlpha", AMOTRealLifeClockQuest.WidgetAlpha)
	fiss.saveInt("RLDateScale", AMOTRealLifeDateQuest.Scale)
	fiss.saveInt("RLDateWidgetAlpha", AMOTRealLifeDateQuest.WidgetAlpha)

	fiss.saveInt("Symbol1ControlModeIndex", _symbol1ControlModeIndex)
	fiss.saveInt("Symbol2ControlModeIndex", _symbol2ControlModeIndex)
	fiss.saveInt("IGClockControlModeIndex", _igClockControlModeIndex)
	fiss.saveInt("IGDateControlModeIndex", _igDateControlModeIndex)
	fiss.saveInt("RLClockControlModeIndex", _rlClockControlModeIndex)
	fiss.saveInt("RLDateControlModeIndex", _rlDateControlModeIndex)

	fiss.saveInt("Symbol1PeriodIndex", _symbol1PeriodIndex)
	fiss.saveInt("Symbol2PeriodIndex", _symbol2PeriodIndex)
	fiss.saveInt("IGClockPeriodIndex", _igClockPeriodIndex)
	fiss.saveInt("IGDatePeriodIndex", _igDatePeriodIndex)
	fiss.saveInt("RLClockPeriodIndex", _rlClockPeriodIndex)
	fiss.saveInt("RLDatePeriodIndex", _rlDatePeriodIndex)

	fiss.saveInt("Symbol1Hotkey", AMOTSymbol1Quest.Hotkey)
	fiss.saveFloat("Symbol1DisplayTime", AMOTSymbol1Quest.DisplayTime)
	fiss.saveInt("IGClockHotkey", AMOTInGameClockQuest.Hotkey)
	fiss.saveFloat("IGClockDisplayTime", AMOTInGameClockQuest.DisplayTime)
	fiss.saveInt("IGDateHotkey", AMOTInGameDateQuest.Hotkey)
	fiss.saveFloat("IGDateDisplayTime", AMOTInGameDateQuest.DisplayTime)
	fiss.saveInt("Symbol2Hotkey", AMOTSymbol2Quest.Hotkey)
	fiss.saveFloat("Symbol2DisplayTime", AMOTSymbol2Quest.DisplayTime)
	fiss.saveInt("RLClockHotkey", AMOTRealLifeClockQuest.Hotkey)
	fiss.saveFloat("RLClockDisplayTime", AMOTRealLifeClockQuest.DisplayTime)
	fiss.saveInt("RLDateHotkey", AMOTRealLifeDateQuest.Hotkey)
	fiss.saveFloat("RLDateDisplayTime", AMOTRealLifeDateQuest.DisplayTime)
	
	string result = fiss.endSave()
	if result != ""
		Debug.Trace("AMOT: Error saving user settings: " + result)
		return false
	endIf
	return true
endFunction


function InitializeArrays()
	_themeNames = new string[10]
	_themeNames[0] = "$AMOT Theme PictureOfTheDay"
	_themeNames[1] = "$AMOT Theme SkyDial"
	_themeNames[2] = "$AMOT Theme SkyDial thin"
	_themeNames[3] = "$AMOT Theme Bar"
	_themeNames[4] = "$AMOT Theme Bar thin"
	_themeNames[5] = "$AMOT Theme Astrolabe Small"
	_themeNames[6] = "$AMOT Theme Astrolabe"
	_themeNames[7] = "$AMOT Theme Astrolabe Textured"
	_themeNames[8] = "$AMOT Theme Moon and seasons"
	_themeNames[9] = "$AMOT Theme Compass"

	_themeValues = new string[10]
	_themeValues[0] = "PictureOfTheDay"
	_themeValues[1] = "SkyDial"
	_themeValues[2] = "SkyDialThin"
	_themeValues[3] = "Bar"
	_themeValues[4] = "BarThin"
	_themeValues[5] = "AstrolabeSmall"
	_themeValues[6] = "Astrolabe"
	_themeValues[7] = "AstrolabeTextured"
	_themeValues[8] = "MoonAndSeasons"
	_themeValues[9] = "Compass"

	_clockTypes = new string[4]
	_clockTypes[0] = "$AMOT Clock type 12 hours"
	_clockTypes[1] = "$AMOT Clock type 12 hours short"
	_clockTypes[2] = "$AMOT Clock type 24 hours"
	_clockTypes[3] = "$AMOT Clock type Words"

	_clockTypeValues = new string[4]
	_clockTypeValues[0] = "12"
	_clockTypeValues[1] = "12short"
	_clockTypeValues[2] = "24"
	_clockTypeValues[3] = "Words"

	_dateFormatValues = new string[18]
	_dateFormatValues[0] = "LoreFriendlyDOW, DD MONTH, YEAR"
	_dateFormatValues[1] = "LoreFriendlyD MONTH, YEAR"
	_dateFormatValues[2] = "LoreFriendlyYEAR, MONTH DD, DOW"
	_dateFormatValues[3] = "LoreFriendlyYEAR, MONTH D"
	_dateFormatValues[4] = "LoreFriendlyDOW, DD MONTH"
	_dateFormatValues[5] = "LoreFriendlyD MONTH"
	_dateFormatValues[6] = "DD.MM.YYYY"
	_dateFormatValues[7] = "MM/DD/YYYY"
	_dateFormatValues[8] = "D.M.YYYY"
	_dateFormatValues[9] = "M/D/YY"
	_dateFormatValues[10] = "YYYY-MM-DD"
	_dateFormatValues[11] = "YY-M-D"
	_dateFormatValues[12] = "DD. MONTH YYYY"
	_dateFormatValues[13] = "MONTH DD. YYYY"
	_dateFormatValues[14] = "DD. MON YYYY"
	_dateFormatValues[15] = "MON DD. YYYY"
	_dateFormatValues[16] = "DOW, DD. MONTH YYYY"
	_dateFormatValues[17] = "DOW, MONTH DD. YYYY"

	_dateFormats = new string[18]
	int i = 0
	while i < _dateFormats.Length
		if(StringUtil.Find(_dateFormatValues[i], "LoreFriendly") == 0)
			_dateFormats[i] = "Tamriel " + StringUtil.SubString(_dateFormatValues[i], 12)
		else
			_dateFormats[i] = _dateFormatValues[i]
		endIf
		i += 1
	endWhile

	_controlModes = new string[4]
	_controlModes[0] = "$AMOT Control mode always"
	_controlModes[1] = "$AMOT Control mode timed hotkey"
	_controlModes[2] = "$AMOT Control mode toggled hotkey"
	_controlModes[3] = "$AMOT Control mode periodically"

	_controlModeValues = new string[4]
	_controlModeValues[0] = "always"
	_controlModeValues[1] = "timedHotkey"
	_controlModeValues[2] = "toggledHotkey"
	_controlModeValues[3] = "periodically"
	
	_periods = new string[9]
	_periods[0] = "$AMOT Period every 15min"
	_periods[1] = "$AMOT Period every 30min"
	_periods[2] = "$AMOT Period every 1 hour"
	_periods[3] = "$AMOT Period every 2 hours"
	_periods[4] = "$AMOT Period every 3 hours"
	_periods[5] = "$AMOT Period every 6 hours"
	_periods[6] = "$AMOT Period every 12 hours"
	_periods[7] = "$AMOT Period at 12am"
	_periods[8] = "$AMOT Period at 12pm"
	
	_periodValues = new string[9]
	_periodValues[0] = "every15min"
	_periodValues[1] = "every30min"
	_periodValues[2] = "every1hour"
	_periodValues[3] = "every2hours"
	_periodValues[4] = "every3hours"
	_periodValues[5] = "every6hours"
	_periodValues[6] = "every12hours"
	_periodValues[7] = "at12am"
	_periodValues[8] = "at12pm"

	_alignments = new string[3]
	_alignments[0] = "$Left"
	_alignments[1] = "$Right"
	_alignments[2] = "$Center"

	_alignmentValues = new string[3]
	_alignmentValues[0] = "left"
	_alignmentValues[1] = "right"
	_alignmentValues[2] = "center"

	_vertAlignments = new string[3]
	_vertAlignments[0] = "$Top"
	_vertAlignments[1] = "$Bottom"
	_vertAlignments[2] = "$Center"

	_vertAlignmentValues = new string[3]
	_vertAlignmentValues[0] = "top"
	_vertAlignmentValues[1] = "bottom"
	_vertAlignmentValues[2] = "center"

	_alignmentBaseOffsets = new float[3]
	_alignmentBaseOffsets[0] = 0.0
	_alignmentBaseOffsets[1] = 1280.0
	_alignmentBaseOffsets[2] = 640.0

	_vertAlignmentBaseOffsets = new float[3]
	_vertAlignmentBaseOffsets[0] = 0.0
	_vertAlignmentBaseOffsets[1] = 720.0
	_vertAlignmentBaseOffsets[2] = 360.0
	
	Pages = new string[4]
	Pages[0] = "$AMOT Page General"
	Pages[1] = "$AMOT Page Display"
	Pages[2] = "$AMOT Page Control"
	Pages[3] = "$AMOT Page Preset"
endFunction


; -------------------------------------------------------------------------------------------------
; States
; -------------------------------------------------------------------------------------------------

state GENERAL_ALL_RESET
	event OnMenuOpenST()
		string[] resetTypes = new string[2]
		resetTypes[0] = "$AMOT Preset Default"
		resetTypes[1] = "$AMOT Preset General all"
		SetMenuDialogOptions(resetTypes)
		SetMenuDialogStartIndex(0)
	endEvent

	event OnMenuAcceptST(int index)
		if(index == 0)
			LoadDefaultsGeneral()
		elseif(index == 1)
			LoadPresetGeneralAll()
		endIf
		
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight reset general")
	endEvent
endState


state GENERAL_SYMBOL1_SHOW
	event OnSelectST()
		AMOTSymbol1Quest.Shown = !AMOTSymbol1Quest.Shown
		SetToggleOptionValueST(AMOTSymbol1Quest.Shown)
		UpdateSymbolOptionStates(AMOTSymbol1Quest, "GENERAL_SYMBOL1")
	endEvent

	event OnDefaultST()
		AMOTSymbol1Quest.Shown = _defaultSymbol1Shown
		SetToggleOptionValueST(AMOTSymbol1Quest.Shown)
		UpdateSymbolOptionStates(AMOTSymbol1Quest, "GENERAL_SYMBOL1")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show {$AMOT Symbol 1} {" + FormatBool(_defaultSymbol1Shown) + "}")
	endEvent
endState


state GENERAL_SYMBOL1_THEME
	event OnMenuOpenST()
		SetMenuDialogOptions(_themeNames)
		SetMenuDialogStartIndex(_symbol1ThemeIndex)
		SetMenuDialogDefaultIndex(_defaultSymbol1ThemeIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_symbol1ThemeIndex = index
		AMOTSymbol1Quest.Theme = _themeValues[_symbol1ThemeIndex]
		SetMenuOptionValueST(_themeNames[_symbol1ThemeIndex])
		UpdateSymbolOptionStates(AMOTSymbol1Quest, "GENERAL_SYMBOL1")
	endEvent

	event OnDefaultST()
		_symbol1ThemeIndex = _defaultSymbol1ThemeIndex
		AMOTSymbol1Quest.Theme = _themeValues[_symbol1ThemeIndex]
		SetMenuOptionValueST(_themeNames[_symbol1ThemeIndex])
		UpdateSymbolOptionStates(AMOTSymbol1Quest, "GENERAL_SYMBOL1")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight Symbol theme {" + _themeNames[_defaultSymbol1ThemeIndex] + "}")
	endEvent
endState


state GENERAL_SYMBOL1_SHOW_MOON_PHASES
	event OnSelectST()
		AMOTSymbol1Quest.ShowMoonPhases = !AMOTSymbol1Quest.ShowMoonPhases
		SetToggleOptionValueST(AMOTSymbol1Quest.ShowMoonPhases)
	endEvent

	event OnDefaultST()
		AMOTSymbol1Quest.ShowMoonPhases = _defaultSymbol1ShowMoonPhases
		SetToggleOptionValueST(AMOTSymbol1Quest.ShowMoonPhases)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show moon phases {" + FormatBool(_defaultSymbol1ShowMoonPhases) + "}")
	endEvent
endState


state GENERAL_SYMBOL1_SHOW_SEASONS
	event OnSelectST()
		AMOTSymbol1Quest.ShowSeasons = !AMOTSymbol1Quest.ShowSeasons
		SetToggleOptionValueST(AMOTSymbol1Quest.ShowSeasons)
	endEvent

	event OnDefaultST()
		AMOTSymbol1Quest.ShowSeasons = _defaultSymbol1ShowSeasons
		SetToggleOptionValueST(AMOTSymbol1Quest.ShowSeasons)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show seasons {" + FormatBool(_defaultSymbol1ShowSeasons) + "}")
	endEvent
endState


state GENERAL_IGCLOCK_SHOW
	event OnSelectST()
		AMOTInGameClockQuest.Shown = !AMOTInGameClockQuest.Shown
		SetToggleOptionValueST(AMOTInGameClockQuest.Shown)

		int flags = OPTION_FLAG_NONE
		if(!AMOTInGameClockQuest.Shown)
			flags = OPTION_FLAG_DISABLED
		endIf
		SetOptionFlagsST(flags, true, "GENERAL_IGCLOCK_TYPE")
		SetOptionFlagsST(flags, false, "GENERAL_IGCLOCK_SHOW_SECONDS")
	endEvent

	event OnDefaultST()
		AMOTInGameClockQuest.Shown = _defaultIGClockShown
		SetToggleOptionValueST(AMOTInGameClockQuest.Shown)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show {$AMOT In-Game Clock} {" + FormatBool(_defaultIGClockShown) + "}")
	endEvent
endState


state GENERAL_IGCLOCK_TYPE
	event OnMenuOpenST()
		SetMenuDialogOptions(_clockTypes)
		SetMenuDialogStartIndex(_igClockTypeIndex)
		SetMenuDialogDefaultIndex(_defaultIGClockTypeIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_igClockTypeIndex = index
		AMOTInGameClockQuest.ClockType = _clockTypeValues[_igClockTypeIndex]
		SetMenuOptionValueST(_clockTypes[_igClockTypeIndex])
	endEvent

	event OnDefaultST()
		_igClockTypeIndex = _defaultIGClockTypeIndex
		AMOTInGameClockQuest.ClockType = _clockTypeValues[_igClockTypeIndex]
		SetMenuOptionValueST(_clockTypes[_igClockTypeIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight clock type {" + _clockTypes[_defaultIGClockTypeIndex] + "}")
	endEvent
endState


state GENERAL_IGCLOCK_SHOW_SECONDS
	event OnSelectST()
		AMOTInGameClockQuest.ShowSeconds = !AMOTInGameClockQuest.ShowSeconds
		SetToggleOptionValueST(AMOTInGameClockQuest.ShowSeconds)
	endEvent

	event OnDefaultST()
		AMOTInGameClockQuest.ShowSeconds = _defaultIGClockShowSeconds
		SetToggleOptionValueST(AMOTInGameClockQuest.ShowSeconds)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show seconds {" + FormatBool(_defaultIGClockShowSeconds) + "}")
	endEvent
endState


state GENERAL_IGDATE_SHOW
	event OnSelectST()
		AMOTInGameDateQuest.Shown = !AMOTInGameDateQuest.Shown
		SetToggleOptionValueST(AMOTInGameDateQuest.Shown)

		int flags = OPTION_FLAG_NONE
		if(!AMOTInGameDateQuest.Shown)
			flags = OPTION_FLAG_DISABLED
		endIf
		SetOptionFlagsST(flags, false, "GENERAL_IGDATE_FORAMT")
	endEvent

	event OnDefaultST()
		AMOTInGameDateQuest.Shown = _defaultIGDateShown
		SetToggleOptionValueST(AMOTInGameDateQuest.Shown)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show {$AMOT In-Game Date} {" + FormatBool(_defaultIGDateShown) + "}")
	endEvent
endState


state GENERAL_IGDATE_FORAMT
	event OnMenuOpenST()
		SetMenuDialogOptions(_dateFormats)
		SetMenuDialogStartIndex(_igDateFormatIndex)
		SetMenuDialogDefaultIndex(_defaultIGDateFormatIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_igDateFormatIndex = index
		AMOTInGameDateQuest.DateFormat = _dateFormatValues[_igDateFormatIndex]
		SetMenuOptionValueST(_dateFormats[_igDateFormatIndex])
	endEvent

	event OnDefaultST()
		_igDateFormatIndex = _defaultIGDateFormatIndex
		AMOTInGameDateQuest.DateFormat = _dateFormatValues[_igDateFormatIndex]
		SetMenuOptionValueST(_dateFormats[_igDateFormatIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight date format {" + _dateFormats[_defaultIGDateFormatIndex] + "}")
	endEvent
endState


state GENERAL_SYMBOL2_SHOW
	event OnSelectST()
		AMOTSymbol2Quest.Shown = !AMOTSymbol2Quest.Shown
		SetToggleOptionValueST(AMOTSymbol2Quest.Shown)
		UpdateSymbolOptionStates(AMOTSymbol2Quest, "GENERAL_SYMBOL2")
	endEvent

	event OnDefaultST()
		AMOTSymbol2Quest.Shown = _defaultSymbol2Shown
		SetToggleOptionValueST(AMOTSymbol2Quest.Shown)
		UpdateSymbolOptionStates(AMOTSymbol2Quest, "GENERAL_SYMBOL2")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show {$AMOT Symbol 2} {" + FormatBool(_defaultSymbol2Shown) + "}")
	endEvent
endState


state GENERAL_SYMBOL2_THEME ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_themeNames)
		SetMenuDialogStartIndex(_symbol2ThemeIndex)
		SetMenuDialogDefaultIndex(_defaultSymbol2ThemeIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_symbol2ThemeIndex = index
		AMOTSymbol2Quest.Theme = _themeValues[_symbol2ThemeIndex]
		SetMenuOptionValueST(_themeNames[_symbol2ThemeIndex])
		UpdateSymbolOptionStates(AMOTSymbol2Quest, "GENERAL_SYMBOL2")
	endEvent

	event OnDefaultST()
		_symbol2ThemeIndex = _defaultSymbol2ThemeIndex
		AMOTSymbol2Quest.Theme = _themeValues[_symbol2ThemeIndex]
		SetMenuOptionValueST(_themeNames[_symbol2ThemeIndex])
		UpdateSymbolOptionStates(AMOTSymbol2Quest, "GENERAL_SYMBOL2")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight Symbol theme {" + _themeNames[_defaultSymbol2ThemeIndex] + "}")
	endEvent
endState


state GENERAL_SYMBOL2_SHOW_MOON_PHASES ; Toggle
	event OnSelectST()
		AMOTSymbol2Quest.ShowMoonPhases = !AMOTSymbol2Quest.ShowMoonPhases
		SetToggleOptionValueST(AMOTSymbol2Quest.ShowMoonPhases)
	endEvent

	event OnDefaultST()
		AMOTSymbol2Quest.ShowMoonPhases = _defaultSymbol2ShowMoonPhases
		SetToggleOptionValueST(AMOTSymbol2Quest.ShowMoonPhases)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show moon phases {" + FormatBool(_defaultSymbol2ShowMoonPhases) + "}")
	endEvent
endState


state GENERAL_SYMBOL2_SHOW_SEASONS ; Toggle
	event OnSelectST()
		AMOTSymbol2Quest.ShowSeasons = !AMOTSymbol2Quest.ShowSeasons
		SetToggleOptionValueST(AMOTSymbol2Quest.ShowSeasons)
	endEvent

	event OnDefaultST()
		AMOTSymbol2Quest.ShowSeasons = _defaultSymbol2ShowSeasons
		SetToggleOptionValueST(AMOTSymbol2Quest.ShowSeasons)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show seasons {" + FormatBool(_defaultSymbol2ShowSeasons) + "}")
	endEvent
endState


state GENERAL_RLCLOCK_SHOW ; Toggle
	event OnSelectST()
		AMOTRealLifeClockQuest.Shown = !AMOTRealLifeClockQuest.Shown
		SetToggleOptionValueST(AMOTRealLifeClockQuest.Shown)

		int flags = OPTION_FLAG_NONE
		if(!AMOTRealLifeClockQuest.Shown)
			flags = OPTION_FLAG_DISABLED
		endIf
		SetOptionFlagsST(flags, true, "GENERAL_RLCLOCK_TYPE")
		SetOptionFlagsST(flags, false, "GENERAL_RLCLOCK_SHOW_SECONDS")
	endEvent

	event OnDefaultST()
		AMOTRealLifeClockQuest.Shown = _defaultRLClockShown
		SetToggleOptionValueST(AMOTRealLifeClockQuest.Shown)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show {$AMOT Real-Life Clock} {" + FormatBool(_defaultRLClockShown) + "}")
	endEvent
endState


state GENERAL_RLCLOCK_TYPE ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_clockTypes)
		SetMenuDialogStartIndex(_rlClockTypeIndex)
		SetMenuDialogDefaultIndex(_defaultRLClockTypeIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_rlClockTypeIndex = index
		AMOTRealLifeClockQuest.ClockType = _clockTypeValues[_rlClockTypeIndex]
		SetMenuOptionValueST(_clockTypes[_rlClockTypeIndex])
	endEvent

	event OnDefaultST()
		_rlClockTypeIndex = _defaultRLClockTypeIndex
		AMOTRealLifeClockQuest.ClockType = _clockTypeValues[_rlClockTypeIndex]
		SetMenuOptionValueST(_clockTypes[_rlClockTypeIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight clock type {" + _clockTypes[_defaultRLClockTypeIndex] + "}")
	endEvent
endState


state GENERAL_RLCLOCK_SHOW_SECONDS ; Toggle
	event OnSelectST()
		AMOTRealLifeClockQuest.ShowSeconds = !AMOTRealLifeClockQuest.ShowSeconds
		SetToggleOptionValueST(AMOTRealLifeClockQuest.ShowSeconds)
	endEvent

	event OnDefaultST()
		AMOTRealLifeClockQuest.ShowSeconds = _defaultRLClockShowSeconds
		SetToggleOptionValueST(AMOTRealLifeClockQuest.ShowSeconds)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show seconds {" + FormatBool(_defaultRLClockShowSeconds) + "}")
	endEvent
endState


state GENERAL_RLDATE_SHOW ; Toggle
	event OnSelectST()
		AMOTRealLifeDateQuest.Shown = !AMOTRealLifeDateQuest.Shown
		SetToggleOptionValueST(AMOTRealLifeDateQuest.Shown)

		int flags = OPTION_FLAG_NONE
		if(!AMOTRealLifeDateQuest.Shown)
			flags = OPTION_FLAG_DISABLED
		endIf
		SetOptionFlagsST(flags, false, "GENERAL_RLDATE_FORAMT")
	endEvent

	event OnDefaultST()
		AMOTRealLifeDateQuest.Shown = _defaultRLDateShown
		SetToggleOptionValueST(AMOTRealLifeDateQuest.Shown)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight show {$AMOT Real-Life Date} {" + FormatBool(_defaultRLDateShown) + "}")
	endEvent
endState


state GENERAL_RLDATE_FORAMT ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_dateFormats)
		SetMenuDialogStartIndex(_rlDateFormatIndex)
		SetMenuDialogDefaultIndex(_defaultRLDateFormatIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_rlDateFormatIndex = index
		AMOTRealLifeDateQuest.DateFormat = _dateFormatValues[_rlDateFormatIndex]
		SetMenuOptionValueST(_dateFormats[_rlDateFormatIndex])
	endEvent

	event OnDefaultST()
		_rlDateFormatIndex = _defaultRLDateFormatIndex
		AMOTRealLifeDateQuest.DateFormat = _dateFormatValues[_rlDateFormatIndex]
		SetMenuOptionValueST(_dateFormats[_rlDateFormatIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight date format {" + _dateFormats[_defaultRLDateFormatIndex] + "}")
	endEvent
endState


state DISPLAY_ALL_RESET ; Text
	event OnMenuOpenST()
		string[] resetTypes = new string[3]
		resetTypes[0] = "$AMOT Preset Default"
		resetTypes[1] = "$AMOT Preset Display List"
		resetTypes[2] = "$AMOT Preset Display Two Column List"
		SetMenuDialogOptions(resetTypes)
		SetMenuDialogStartIndex(0)
	endEvent

	event OnMenuAcceptST(int index)
		if(index == 0)
			LoadDefaultsDisplay()
		elseif(index == 1)
			LoadPresetDisplayList()
		elseif(index == 2)
			LoadPresetDisplayTwoColumnList()
		endIf
		
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight reset display")
	endEvent
endState


state DISPLAY_SYMBOL1_SCALE ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTSymbol1Quest.Scale)
		SetSliderDialogDefaultValue(_defaultSymbol1Scale)
		SetSliderDialogRange(1, 200)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTSymbol1Quest.Scale = value as int
		SetSliderOptionValueST(AMOTSymbol1Quest.Scale, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTSymbol1Quest.Scale = _defaultSymbol1Scale
		SetSliderOptionValueST(AMOTSymbol1Quest.Scale, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight scale {" + _defaultSymbol1Scale + "%}")
	endEvent
endState


state DISPLAY_SYMBOL1_ALPHA ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTSymbol1Quest.WidgetAlpha)
		SetSliderDialogDefaultValue(_defaultSymbol1Alpha)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTSymbol1Quest.WidgetAlpha = value as int
		SetSliderOptionValueST(AMOTSymbol1Quest.WidgetAlpha, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTSymbol1Quest.WidgetAlpha = _defaultSymbol1Alpha
		SetSliderOptionValueST(AMOTSymbol1Quest.WidgetAlpha, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight alpha {" + _defaultSymbol1Alpha + "%}")
	endEvent
endState


state DISPLAY_SYMBOL1_HORIZONTAL_ANCHOR ; Text
	event OnSelectST()
		_symbol1AlignmentIndex = GetNextHorizontalAnchor(_symbol1AlignmentIndex)
		SetHorizontal(AMOTSymbol1Quest, _symbol1AlignmentIndex, _symbol1XOffset, "DISPLAY_SYMBOL1")
	endEvent

	event OnDefaultST()
		_symbol1AlignmentIndex = _defaultSymbol1AlignmentIndex
		SetHorizontal(AMOTSymbol1Quest, _symbol1AlignmentIndex, _symbol1XOffset, "DISPLAY_SYMBOL1")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight horizontal anchor {" + _alignments[_defaultSymbol1AlignmentIndex] + "}")
	endEvent
endState


state DISPLAY_SYMBOL1_VERTICAL_ANCHOR ; Text
	event OnSelectST()
		_symbol1VertAlignmentIndex = GetNextVerticalAnchor(_symbol1VertAlignmentIndex)
		SetVertical(AMOTSymbol1Quest, _symbol1VertAlignmentIndex, _symbol1YOffset, "DISPLAY_SYMBOL1")
	endEvent

	event OnDefaultST()
		_symbol1VertAlignmentIndex = _defaultSymbol1VertAlignmentIndex
		SetVertical(AMOTSymbol1Quest, _symbol1VertAlignmentIndex, _symbol1YOffset, "DISPLAY_SYMBOL1")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight vertical anchor {" + _vertAlignments[_defaultSymbol1VertAlignmentIndex] + "}")
	endEvent
endState


state DISPLAY_SYMBOL1_X_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_symbol1XOffset)
		SetSliderDialogDefaultValue(_defaultSymbol1XOffset)
		SetSliderDialogRange(-1280, 1280)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_symbol1XOffset = a_value
		SetHorizontal(AMOTSymbol1Quest, _symbol1AlignmentIndex, _symbol1XOffset, "DISPLAY_SYMBOL1")
	endEvent

	event OnDefaultST()
		_symbol1XOffset = _defaultSymbol1XOffset
		SetHorizontal(AMOTSymbol1Quest, _symbol1AlignmentIndex, _symbol1XOffset, "DISPLAY_SYMBOL1")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight x offset {" + FormatNumber(_defaultSymbol1XOffset, 0) + "}")
	endEvent
endState


state DISPLAY_SYMBOL1_Y_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_symbol1YOffset)
		SetSliderDialogDefaultValue(_defaultSymbol1YOffset)
		SetSliderDialogRange(-720, 720)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_symbol1YOffset = a_value
		SetVertical(AMOTSymbol1Quest, _symbol1VertAlignmentIndex, _symbol1YOffset, "DISPLAY_SYMBOL1")
	endEvent

	event OnDefaultST()
		_symbol1YOffset = _defaultSymbol1YOffset
		SetVertical(AMOTSymbol1Quest, _symbol1VertAlignmentIndex, _symbol1YOffset, "DISPLAY_SYMBOL1")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight y offset {" + FormatNumber(_defaultSymbol1YOffset, 0) + "}")
	endEvent
endState


state DISPLAY_IGCLOCK_SCALE ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTInGameClockQuest.Scale)
		SetSliderDialogDefaultValue(_defaultIGClockScale)
		SetSliderDialogRange(1, 200)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTInGameClockQuest.Scale = value as int
		SetSliderOptionValueST(AMOTInGameClockQuest.Scale, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTInGameClockQuest.Scale = _defaultIGClockScale
		SetSliderOptionValueST(AMOTInGameClockQuest.Scale, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight scale {" + _defaultIGClockScale + "%}")
	endEvent
endState


state DISPLAY_IGCLOCK_ALPHA ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTInGameClockQuest.WidgetAlpha)
		SetSliderDialogDefaultValue(_defaultIGClockAlpha)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTInGameClockQuest.WidgetAlpha = value as int
		SetSliderOptionValueST(AMOTInGameClockQuest.WidgetAlpha, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTInGameClockQuest.WidgetAlpha = _defaultIGClockAlpha
		SetSliderOptionValueST(AMOTInGameClockQuest.WidgetAlpha, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight alpha {" + _defaultIGClockAlpha + "%}")
	endEvent
endState


state DISPLAY_IGCLOCK_HORIZONTAL_ANCHOR ; Text
	event OnSelectST()
		_igClockAlignmentIndex = GetNextHorizontalAnchor(_igClockAlignmentIndex)
		SetHorizontal(AMOTInGameClockQuest, _igClockAlignmentIndex, _igClockXOffset, "DISPLAY_IGCLOCK")
		SetHorizontal(AMOTInGameClockQuest, _igClockAlignmentIndex, _igClockXOffset, "DISPLAY_IGCLOCK")
	endEvent

	event OnDefaultST()
		_igClockAlignmentIndex = _defaultIGClockAlignmentIndex
		SetHorizontal(AMOTInGameClockQuest, _igClockAlignmentIndex, _igClockXOffset, "DISPLAY_IGCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight horizontal anchor {" + _alignments[_defaultIGClockAlignmentIndex] + "}")
	endEvent
endState


state DISPLAY_IGCLOCK_VERTICAL_ANCHOR ; Text
	event OnSelectST()
		_igClockVertAlignmentIndex = GetNextVerticalAnchor(_igClockVertAlignmentIndex)
		SetVertical(AMOTInGameClockQuest, _igClockVertAlignmentIndex, _igClockYOffset, "DISPLAY_IGCLOCK")
	endEvent

	event OnDefaultST()
		_igClockVertAlignmentIndex = _defaultIGClockVertAlignmentIndex
		SetVertical(AMOTInGameClockQuest, _igClockVertAlignmentIndex, _igClockYOffset, "DISPLAY_IGCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight vertical anchor {" + _vertAlignments[_defaultIGClockVertAlignmentIndex] + "}")
	endEvent
endState


state DISPLAY_IGCLOCK_X_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_igClockXOffset)
		SetSliderDialogDefaultValue(_defaultIGClockXOffset)
		SetSliderDialogRange(-1280, 1280)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_igClockXOffset = a_value
		SetHorizontal(AMOTInGameClockQuest, _igClockAlignmentIndex, _igClockXOffset, "DISPLAY_IGCLOCK")
	endEvent

	event OnDefaultST()
		_igClockXOffset = _defaultIGClockXOffset
		SetHorizontal(AMOTInGameClockQuest, _igClockAlignmentIndex, _igClockXOffset, "DISPLAY_IGCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight x offset {" + FormatNumber(_defaultIGClockXOffset, 0) + "}")
	endEvent
endState


state DISPLAY_IGCLOCK_Y_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_igClockYOffset)
		SetSliderDialogDefaultValue(_defaultIGClockYOffset)
		SetSliderDialogRange(-720, 720)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_igClockYOffset = a_value
		SetVertical(AMOTInGameClockQuest, _igClockVertAlignmentIndex, _igClockYOffset, "DISPLAY_IGCLOCK")
	endEvent

	event OnDefaultST()
		_igClockYOffset = _defaultIGClockYOffset
		SetVertical(AMOTInGameClockQuest, _igClockVertAlignmentIndex, _igClockYOffset, "DISPLAY_IGCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight y offset {" + FormatNumber(_defaultIGClockYOffset, 0) + "}")
	endEvent
endState


state DISPLAY_IGDATE_SCALE ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTInGameDateQuest.Scale)
		SetSliderDialogDefaultValue(_defaultIGDateScale)
		SetSliderDialogRange(1, 200)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTInGameDateQuest.Scale = value as int
		SetSliderOptionValueST(AMOTInGameDateQuest.Scale, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTInGameDateQuest.Scale = _defaultIGDateScale
		SetSliderOptionValueST(AMOTInGameDateQuest.Scale, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight scale {" + _defaultIGDateScale + "%}")
	endEvent
endState


state DISPLAY_IGDATE_ALPHA ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTInGameDateQuest.WidgetAlpha)
		SetSliderDialogDefaultValue(_defaultIGDateAlpha)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTInGameDateQuest.WidgetAlpha = value as int
		SetSliderOptionValueST(AMOTInGameDateQuest.WidgetAlpha, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTInGameDateQuest.WidgetAlpha = _defaultIGDateAlpha
		SetSliderOptionValueST(AMOTInGameDateQuest.WidgetAlpha, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight alpha {" + _defaultIGDateAlpha + "%}")
	endEvent
endState


state DISPLAY_IGDATE_HORIZONTAL_ANCHOR ; Text
	event OnSelectST()
		_igDateAlignmentIndex = GetNextHorizontalAnchor(_igDateAlignmentIndex)
		SetHorizontal(AMOTInGameDateQuest, _igDateAlignmentIndex, _igDateXOffset, "DISPLAY_IGDATE")
	endEvent

	event OnDefaultST()
		_igDateAlignmentIndex = _defaultIGDateAlignmentIndex
		SetHorizontal(AMOTInGameDateQuest, _igDateAlignmentIndex, _igDateXOffset, "DISPLAY_IGDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight horizontal anchor {" + _alignments[_defaultIGDateAlignmentIndex] + "}")
	endEvent
endState


state DISPLAY_IGDATE_VERTICAL_ANCHOR ; Text
	event OnSelectST()
		_igDateVertAlignmentIndex = GetNextVerticalAnchor(_igDateVertAlignmentIndex)
		SetVertical(AMOTInGameDateQuest, _igDateVertAlignmentIndex, _igDateYOffset, "DISPLAY_IGDATE")
	endEvent

	event OnDefaultST()
		_igDateVertAlignmentIndex = _defaultIGDateVertAlignmentIndex
		SetVertical(AMOTInGameDateQuest, _igDateVertAlignmentIndex, _igDateYOffset, "DISPLAY_IGDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight vertical anchor {" + _vertAlignments[_defaultIGDateVertAlignmentIndex] + "}")
	endEvent
endState


state DISPLAY_IGDATE_X_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_igDateXOffset)
		SetSliderDialogDefaultValue(_defaultIGDateXOffset)
		SetSliderDialogRange(-1280, 1280)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_igDateXOffset = a_value
		SetHorizontal(AMOTInGameDateQuest, _igDateAlignmentIndex, _igDateXOffset, "DISPLAY_IGDATE")
	endEvent

	event OnDefaultST()
		_igDateXOffset = _defaultIGDateXOffset
		SetHorizontal(AMOTInGameDateQuest, _igDateAlignmentIndex, _igDateXOffset, "DISPLAY_IGDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight x offset {" + FormatNumber(_defaultIGDateXOffset, 0) + "}")
	endEvent
endState


state DISPLAY_IGDATE_Y_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_igDateYOffset)
		SetSliderDialogDefaultValue(_defaultIGDateYOffset)
		SetSliderDialogRange(-720, 720)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_igDateYOffset = a_value
		SetVertical(AMOTInGameDateQuest, _igDateVertAlignmentIndex, _igDateYOffset, "DISPLAY_IGDATE")
	endEvent

	event OnDefaultST()
		_igDateYOffset = _defaultIGDateYOffset
		SetVertical(AMOTInGameDateQuest, _igDateVertAlignmentIndex, _igDateYOffset, "DISPLAY_IGDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight y offset {" + FormatNumber(_defaultIGDateYOffset, 0) + "}")
	endEvent
endState


state DISPLAY_SYMBOL2_SCALE ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTSymbol2Quest.Scale)
		SetSliderDialogDefaultValue(_defaultSymbol2Scale)
		SetSliderDialogRange(1, 200)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTSymbol2Quest.Scale = value as int
		SetSliderOptionValueST(AMOTSymbol2Quest.Scale, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTSymbol2Quest.Scale = _defaultSymbol2Scale
		SetSliderOptionValueST(AMOTSymbol2Quest.Scale, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight scale {" + _defaultSymbol2Scale + "%}")
	endEvent
endState


state DISPLAY_SYMBOL2_ALPHA ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTSymbol2Quest.WidgetAlpha)
		SetSliderDialogDefaultValue(_defaultSymbol2Alpha)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTSymbol2Quest.WidgetAlpha = value as int
		SetSliderOptionValueST(AMOTSymbol2Quest.WidgetAlpha, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTSymbol2Quest.WidgetAlpha = _defaultSymbol2Alpha
		SetSliderOptionValueST(AMOTSymbol2Quest.WidgetAlpha, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight alpha {" + _defaultSymbol2Alpha + "%}")
	endEvent
endState


state DISPLAY_SYMBOL2_HORIZONTAL_ANCHOR ; Text
	event OnSelectST()
		_symbol2AlignmentIndex = GetNextHorizontalAnchor(_symbol2AlignmentIndex)
		SetHorizontal(AMOTSymbol2Quest, _symbol2AlignmentIndex, _symbol2XOffset, "DISPLAY_SYMBOL2")
	endEvent

	event OnDefaultST()
		_symbol2AlignmentIndex = _defaultSymbol2AlignmentIndex
		SetHorizontal(AMOTSymbol2Quest, _symbol2AlignmentIndex, _symbol2XOffset, "DISPLAY_SYMBOL2")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight horizontal anchor {" + _alignments[_defaultSymbol2AlignmentIndex] + "}")
	endEvent
endState


state DISPLAY_SYMBOL2_VERTICAL_ANCHOR ; Text
	event OnSelectST()
		_symbol2VertAlignmentIndex = GetNextVerticalAnchor(_symbol2VertAlignmentIndex)
		SetVertical(AMOTSymbol2Quest, _symbol2VertAlignmentIndex, _symbol2YOffset, "DISPLAY_SYMBOL2")
	endEvent

	event OnDefaultST()
		_symbol2VertAlignmentIndex = _defaultSymbol2VertAlignmentIndex
		SetVertical(AMOTSymbol2Quest, _symbol2VertAlignmentIndex, _symbol2YOffset, "DISPLAY_SYMBOL2")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight vertical anchor {" + _vertAlignments[_defaultSymbol2VertAlignmentIndex] + "}")
	endEvent
endState


state DISPLAY_SYMBOL2_X_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_symbol2XOffset)
		SetSliderDialogDefaultValue(_defaultSymbol2XOffset)
		SetSliderDialogRange(-1280, 1280)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_symbol2XOffset = a_value
		SetHorizontal(AMOTSymbol2Quest, _symbol2AlignmentIndex, _symbol2XOffset, "DISPLAY_SYMBOL2")
	endEvent

	event OnDefaultST()
		_symbol2XOffset = _defaultSymbol2XOffset
		SetHorizontal(AMOTSymbol2Quest, _symbol2AlignmentIndex, _symbol2XOffset, "DISPLAY_SYMBOL2")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight x offset {" + FormatNumber(_defaultSymbol2XOffset, 0) + "}")
	endEvent
endState


state DISPLAY_SYMBOL2_Y_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_symbol2YOffset)
		SetSliderDialogDefaultValue(_defaultSymbol2YOffset)
		SetSliderDialogRange(-720, 720)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_symbol2YOffset = a_value
		SetVertical(AMOTSymbol2Quest, _symbol2VertAlignmentIndex, _symbol2YOffset, "DISPLAY_SYMBOL2")
	endEvent

	event OnDefaultST()
		_symbol2YOffset = _defaultSymbol2YOffset
		SetVertical(AMOTSymbol2Quest, _symbol2VertAlignmentIndex, _symbol2YOffset, "DISPLAY_SYMBOL2")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight y offset {" + FormatNumber(_defaultSymbol2YOffset, 0) + "}")
	endEvent
endState


state DISPLAY_RLCLOCK_SCALE ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTRealLifeClockQuest.Scale)
		SetSliderDialogDefaultValue(_defaultRLClockScale)
		SetSliderDialogRange(1, 200)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTRealLifeClockQuest.Scale = value as int
		SetSliderOptionValueST(AMOTRealLifeClockQuest.Scale, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTRealLifeClockQuest.Scale = _defaultRLClockScale
		SetSliderOptionValueST(AMOTRealLifeClockQuest.Scale, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight scale {" + _defaultRLClockScale + "%}")
	endEvent
endState

state DISPLAY_RLCLOCK_ALPHA ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTRealLifeClockQuest.WidgetAlpha)
		SetSliderDialogDefaultValue(_defaultRLClockAlpha)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTRealLifeClockQuest.WidgetAlpha = value as int
		SetSliderOptionValueST(AMOTRealLifeClockQuest.WidgetAlpha, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTRealLifeClockQuest.WidgetAlpha = _defaultRLClockAlpha
		SetSliderOptionValueST(AMOTRealLifeClockQuest.WidgetAlpha, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight alpha {" + _defaultRLClockAlpha + "%}")
	endEvent
endState

state DISPLAY_RLCLOCK_HORIZONTAL_ANCHOR ; Text
	event OnSelectST()
		_rlClockAlignmentIndex = GetNextHorizontalAnchor(_rlClockAlignmentIndex)
		SetHorizontal(AMOTRealLifeClockQuest, _rlClockAlignmentIndex, _rlClockXOffset, "DISPLAY_RLCLOCK")
	endEvent

	event OnDefaultST()
		_rlClockAlignmentIndex = _defaultRLClockAlignmentIndex
		SetHorizontal(AMOTRealLifeClockQuest, _rlClockAlignmentIndex, _rlClockXOffset, "DISPLAY_RLCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight horizontal anchor {" + _alignments[_defaultRLClockAlignmentIndex] + "}")
	endEvent
endState

state DISPLAY_RLCLOCK_VERTICAL_ANCHOR ; Text
	event OnSelectST()
		_rlClockVertAlignmentIndex = GetNextVerticalAnchor(_rlClockVertAlignmentIndex)
		SetVertical(AMOTRealLifeClockQuest, _rlClockVertAlignmentIndex, _rlClockYOffset, "DISPLAY_RLCLOCK")
	endEvent

	event OnDefaultST()
		_rlClockVertAlignmentIndex = _defaultRLClockVertAlignmentIndex
		SetVertical(AMOTRealLifeClockQuest, _rlClockVertAlignmentIndex, _rlClockYOffset, "DISPLAY_RLCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight vertical anchor {" + _vertAlignments[_defaultRLClockVertAlignmentIndex] + "}")
	endEvent
endState

state DISPLAY_RLCLOCK_X_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_rlClockXOffset)
		SetSliderDialogDefaultValue(_defaultRLClockXOffset)
		SetSliderDialogRange(-1280, 1280)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_rlClockXOffset = a_value
		SetHorizontal(AMOTRealLifeClockQuest, _rlClockAlignmentIndex, _rlClockXOffset, "DISPLAY_RLCLOCK")
	endEvent

	event OnDefaultST()
		_rlClockXOffset = _defaultRLClockXOffset
		SetHorizontal(AMOTRealLifeClockQuest, _rlClockAlignmentIndex, _rlClockXOffset, "DISPLAY_RLCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight x offset {" + FormatNumber(_defaultRLClockXOffset, 0) + "}")
	endEvent
endState

state DISPLAY_RLCLOCK_Y_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_rlClockYOffset)
		SetSliderDialogDefaultValue(_defaultRLClockYOffset)
		SetSliderDialogRange(-720, 720)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_rlClockYOffset = a_value
		SetVertical(AMOTRealLifeClockQuest, _rlClockVertAlignmentIndex, _rlClockYOffset, "DISPLAY_RLCLOCK")
	endEvent

	event OnDefaultST()
		_rlClockYOffset = _defaultRLClockYOffset
		SetVertical(AMOTRealLifeClockQuest, _rlClockVertAlignmentIndex, _rlClockYOffset, "DISPLAY_RLCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight y offset {" + FormatNumber(_defaultRLClockYOffset, 0) + "}")
	endEvent
endState

; endRegion

; region - Real-Life Date

state DISPLAY_RLDATE_SCALE ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTRealLifeDateQuest.Scale)
		SetSliderDialogDefaultValue(_defaultRLDateScale)
		SetSliderDialogRange(1, 200)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTRealLifeDateQuest.Scale = value as int
		SetSliderOptionValueST(AMOTRealLifeDateQuest.Scale, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTRealLifeDateQuest.Scale = _defaultRLDateScale
		SetSliderOptionValueST(AMOTRealLifeDateQuest.Scale, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight scale {" + _defaultRLDateScale + "%}")
	endEvent
endState

state DISPLAY_RLDATE_ALPHA ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTRealLifeDateQuest.WidgetAlpha)
		SetSliderDialogDefaultValue(_defaultRLDateAlpha)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTRealLifeDateQuest.WidgetAlpha = value as int
		SetSliderOptionValueST(AMOTRealLifeDateQuest.WidgetAlpha, "{0}%")
	endEvent

	event OnDefaultST()
		AMOTRealLifeDateQuest.WidgetAlpha = _defaultRLDateAlpha
		SetSliderOptionValueST(AMOTRealLifeDateQuest.WidgetAlpha, "{0}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight alpha {" + _defaultRLDateAlpha + "%}")
	endEvent
endState

state DISPLAY_RLDATE_HORIZONTAL_ANCHOR ; Text
	event OnSelectST()
		_rlDateAlignmentIndex = GetNextHorizontalAnchor(_rlDateAlignmentIndex)
		SetHorizontal(AMOTRealLifeDateQuest, _rlDateAlignmentIndex, _rlDateXOffset, "DISPLAY_RLDATE")
	endEvent

	event OnDefaultST()
		_rlDateAlignmentIndex = _defaultRLDateAlignmentIndex
		SetHorizontal(AMOTRealLifeDateQuest, _rlDateAlignmentIndex, _rlDateXOffset, "DISPLAY_RLDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight horizontal anchor {" + _alignments[_defaultRLDateAlignmentIndex] + "}")
	endEvent
endState

state DISPLAY_RLDATE_VERTICAL_ANCHOR ; Text
	event OnSelectST()
		_rlDateVertAlignmentIndex = GetNextVerticalAnchor(_rlDateVertAlignmentIndex)
		SetVertical(AMOTRealLifeDateQuest, _rlDateVertAlignmentIndex, _rlDateYOffset, "DISPLAY_RLDATE")
	endEvent

	event OnDefaultST()
		_rlDateVertAlignmentIndex = _defaultRLDateVertAlignmentIndex
		SetVertical(AMOTRealLifeDateQuest, _rlDateVertAlignmentIndex, _rlDateYOffset, "DISPLAY_RLDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight vertical anchor {" + _vertAlignments[_defaultRLDateVertAlignmentIndex] + "}")
	endEvent
endState

state DISPLAY_RLDATE_X_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_rlDateXOffset)
		SetSliderDialogDefaultValue(_defaultRLDateXOffset)
		SetSliderDialogRange(-1280, 1280)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_rlDateXOffset = a_value
		SetHorizontal(AMOTRealLifeDateQuest, _rlDateAlignmentIndex, _rlDateXOffset, "DISPLAY_RLDATE")
	endEvent

	event OnDefaultST()
		_rlDateXOffset = _defaultRLDateXOffset
		SetHorizontal(AMOTRealLifeDateQuest, _rlDateAlignmentIndex, _rlDateXOffset, "DISPLAY_RLDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight x offset {" + FormatNumber(_defaultRLDateXOffset, 0) + "}")
	endEvent
endState

state DISPLAY_RLDATE_Y_OFFSET ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(_rlDateYOffset)
		SetSliderDialogDefaultValue(_defaultRLDateYOffset)
		SetSliderDialogRange(-720, 720)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_rlDateYOffset = a_value
		SetVertical(AMOTRealLifeDateQuest, _rlDateVertAlignmentIndex, _rlDateYOffset, "DISPLAY_RLDATE")
	endEvent

	event OnDefaultST()
		_rlDateYOffset = _defaultRLDateYOffset
		SetVertical(AMOTRealLifeDateQuest, _rlDateVertAlignmentIndex, _rlDateYOffset, "DISPLAY_RLDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight y offset {" + FormatNumber(_defaultRLDateYOffset, 0) + "}")
	endEvent
endState

; endRegion

; endRegion

; region -- Control

state CONTROL_ALL_RESET ; Text
	event OnMenuOpenST()
		string[] resetTypes = new string[3]
		resetTypes[0] = "$AMOT Preset Control Always"
		resetTypes[1] = "$AMOT Preset Control Timed"
		resetTypes[2] = "$AMOT Preset Control Toggle"
		SetMenuDialogOptions(resetTypes)
		SetMenuDialogStartIndex(0)
	endEvent

	event OnMenuAcceptST(int index)
		if(index == 0)
			LoadDefaultsControl()
		elseif(index == 1)
			LoadPresetControlTimed()
		elseif(index == 2)
			LoadPresetControlToggled()
		endIf
		
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight reset control")
	endEvent
endState

; region - Symbol 1

state CONTROL_SYMBOL1_MODE ; Text
	event OnSelectST()
		_symbol1ControlModeIndex = GetNextControlMode(_symbol1ControlModeIndex)

		SetTextOptionValueST(_controlModes[_symbol1ControlModeIndex])
		AMOTSymbol1Quest.ControlMode = _controlModeValues[_symbol1ControlModeIndex]

		UpdateControlStates(_symbol1ControlModeIndex, "CONTROL_SYMBOL1")
	endEvent

	event OnDefaultST()
		_symbol1ControlModeIndex = _defaultSymbol1ControlModeIndex
		AMOTSymbol1Quest.ControlMode = _controlModeValues[_symbol1ControlModeIndex]
		SetTextOptionValueST(_controlModes[_symbol1ControlModeIndex])

		UpdateControlStates(_symbol1ControlModeIndex, "CONTROL_SYMBOL1")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight control mode {" + _controlModes[_defaultSymbol1ControlModeIndex] + "}")
	endEvent
endState

state CONTROL_SYMBOL1_HOTKEY ; KeyMapping
	event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
		if (CheckNewHotkey(conflictControl, conflictName))
			AMOTSymbol1Quest.Hotkey = keyCode
			SetKeyMapOptionValueST(AMOTSymbol1Quest.Hotkey)
		endIf
	endEvent

	event OnDefaultST()
		AMOTSymbol1Quest.Hotkey = _defaultSymbol1Hotkey
		SetKeyMapOptionValueST(AMOTSymbol1Quest.Hotkey)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight hotkey {F11}")
	endEvent
endState

state CONTROL_SYMBOL1_DISPLAY_TIME ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTSymbol1Quest.DisplayTime)
		SetSliderDialogDefaultValue(_defaultSymbol1DisplayTime)
		SetSliderDialogRange(0.2, 10)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTSymbol1Quest.DisplayTime = value
		SetSliderOptionValueST(AMOTSymbol1Quest.DisplayTime, "{1}")
	endEvent

	event OnDefaultST()
		AMOTSymbol1Quest.DisplayTime = _defaultSymbol1DisplayTime
		SetSliderOptionValueST(AMOTSymbol1Quest.DisplayTime, "{1}")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight display time {" + FormatNumber(_defaultSymbol1DisplayTime, 1) + "}")
	endEvent
endState

state CONTROL_SYMBOL1_PERIOD ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_periods)
		SetMenuDialogStartIndex(_symbol1PeriodIndex)
		SetMenuDialogDefaultIndex(_defaultSymbol1PeriodIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_symbol1PeriodIndex = index
		AMOTSymbol1Quest.Period = _periodValues[_symbol1PeriodIndex]
		SetMenuOptionValueST(_periods[_symbol1PeriodIndex])
	endEvent

	event OnDefaultST()
		_symbol1PeriodIndex = _defaultSymbol1PeriodIndex
		AMOTSymbol1Quest.Period = _periodValues[_symbol1PeriodIndex]
		SetMenuOptionValueST(_periods[_symbol1PeriodIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight Period {" + _periods[_defaultSymbol1PeriodIndex] + "}")
	endEvent
endState

; endRegion

; region - In-Game Clock

state CONTROL_IGCLOCK_MODE ; Text
	event OnSelectST()
		_igClockControlModeIndex = GetNextControlMode(_igClockControlModeIndex)

		SetTextOptionValueST(_controlModes[_igClockControlModeIndex])
		AMOTInGameClockQuest.ControlMode = _controlModeValues[_igClockControlModeIndex]

		UpdateControlStates(_igClockControlModeIndex, "CONTROL_IGCLOCK")
	endEvent

	event OnDefaultST()
		_igClockControlModeIndex = _defaultIGClockControlModeIndex
		AMOTInGameClockQuest.ControlMode = _controlModeValues[_igClockControlModeIndex]
		SetTextOptionValueST(_controlModes[_igClockControlModeIndex])

		UpdateControlStates(_igClockControlModeIndex, "CONTROL_IGCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight control mode {" + _controlModes[_defaultIGClockControlModeIndex] + "}")
	endEvent
endState

state CONTROL_IGCLOCK_HOTKEY ; KeyMapping
	event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
		if (CheckNewHotkey(conflictControl, conflictName))
			AMOTInGameClockQuest.Hotkey = keyCode
			SetKeyMapOptionValueST(AMOTInGameClockQuest.Hotkey)
		endIf
	endEvent

	event OnDefaultST()
		AMOTInGameClockQuest.Hotkey = _defaultIGClockHotkey
		SetKeyMapOptionValueST(AMOTInGameClockQuest.Hotkey)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight hotkey {F11}")
	endEvent
endState

state CONTROL_IGCLOCK_DISPLAY_TIME ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTInGameClockQuest.DisplayTime)
		SetSliderDialogDefaultValue(_defaultIGClockDisplayTime)
		SetSliderDialogRange(0.2, 10)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTInGameClockQuest.DisplayTime = value
		SetSliderOptionValueST(AMOTInGameClockQuest.DisplayTime, "{1}")
	endEvent

	event OnDefaultST()
		AMOTInGameClockQuest.DisplayTime = _defaultIGClockDisplayTime
		SetSliderOptionValueST(AMOTInGameClockQuest.DisplayTime, "{1}")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight display time {" + FormatNumber(_defaultIGClockDisplayTime, 1) + "}")
	endEvent
endState

state CONTROL_IGCLOCK_PERIOD ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_periods)
		SetMenuDialogStartIndex(_igClockPeriodIndex)
		SetMenuDialogDefaultIndex(_defaultIGClockPeriodIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_igClockPeriodIndex = index
		AMOTInGameClockQuest.Period = _periodValues[_igClockPeriodIndex]
		SetMenuOptionValueST(_periods[_igClockPeriodIndex])
	endEvent

	event OnDefaultST()
		_igClockPeriodIndex = _defaultIGClockPeriodIndex
		AMOTInGameClockQuest.Period = _periodValues[_igClockPeriodIndex]
		SetMenuOptionValueST(_periods[_igClockPeriodIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight Period {" + _periods[_defaultIGClockPeriodIndex] + "}")
	endEvent
endState

; endRegion

; region - In-Game Date

state CONTROL_IGDATE_MODE ; Text
	event OnSelectST()
		_igDateControlModeIndex = GetNextControlMode(_igDateControlModeIndex)

		SetTextOptionValueST(_controlModes[_igDateControlModeIndex])
		AMOTInGameDateQuest.ControlMode = _controlModeValues[_igDateControlModeIndex]

		UpdateControlStates(_igDateControlModeIndex, "CONTROL_IGDATE")
	endEvent

	event OnDefaultST()
		_igDateControlModeIndex = _defaultIGDateControlModeIndex
		AMOTInGameDateQuest.ControlMode = _controlModeValues[_igDateControlModeIndex]
		SetTextOptionValueST(_controlModes[_igDateControlModeIndex])

		UpdateControlStates(_igDateControlModeIndex, "CONTROL_IGDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight control mode {" + _controlModes[_defaultIGDateControlModeIndex] + "}")
	endEvent
endState

state CONTROL_IGDATE_HOTKEY ; KeyMapping
	event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
		if (CheckNewHotkey(conflictControl, conflictName))
			AMOTInGameDateQuest.Hotkey = keyCode
			SetKeyMapOptionValueST(AMOTInGameDateQuest.Hotkey)
		endIf
	endEvent

	event OnDefaultST()
		AMOTInGameDateQuest.Hotkey = _defaultIGDateHotkey
		SetKeyMapOptionValueST(AMOTInGameDateQuest.Hotkey)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight hotkey {F11}")
	endEvent
endState

state CONTROL_IGDATE_DISPLAY_TIME ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTInGameDateQuest.DisplayTime)
		SetSliderDialogDefaultValue(_defaultIGDateDisplayTime)
		SetSliderDialogRange(0.2, 10)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTInGameDateQuest.DisplayTime = value
		SetSliderOptionValueST(AMOTInGameDateQuest.DisplayTime, "{1}")
	endEvent

	event OnDefaultST()
		AMOTInGameDateQuest.DisplayTime = _defaultIGDateDisplayTime
		SetSliderOptionValueST(AMOTInGameDateQuest.DisplayTime, "{1}")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight display time {" + FormatNumber(_defaultIGDateDisplayTime, 1) + "}")
	endEvent
endState

state CONTROL_IGDATE_PERIOD ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_periods)
		SetMenuDialogStartIndex(_igDatePeriodIndex)
		SetMenuDialogDefaultIndex(_defaultIGDatePeriodIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_igDatePeriodIndex = index
		AMOTInGameDateQuest.Period = _periodValues[_igDatePeriodIndex]
		SetMenuOptionValueST(_periods[_igDatePeriodIndex])
	endEvent

	event OnDefaultST()
		_igDatePeriodIndex = _defaultIGDatePeriodIndex
		AMOTInGameDateQuest.Period = _periodValues[_igDatePeriodIndex]
		SetMenuOptionValueST(_periods[_igDatePeriodIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight Period {" + _periods[_defaultIGDatePeriodIndex] + "}")
	endEvent
endState

; endRegion

; region - Symbol 2

state CONTROL_SYMBOL2_MODE ; Text
	event OnSelectST()
		_symbol2ControlModeIndex = GetNextControlMode(_symbol2ControlModeIndex)

		SetTextOptionValueST(_controlModes[_symbol2ControlModeIndex])
		AMOTSymbol2Quest.ControlMode = _controlModeValues[_symbol2ControlModeIndex]

		UpdateControlStates(_symbol2ControlModeIndex, "CONTROL_SYMBOL2")
	endEvent

	event OnDefaultST()
		_symbol2ControlModeIndex = _defaultSymbol2ControlModeIndex
		AMOTSymbol2Quest.ControlMode = _controlModeValues[_symbol2ControlModeIndex]
		SetTextOptionValueST(_controlModes[_symbol2ControlModeIndex])

		UpdateControlStates(_symbol2ControlModeIndex, "CONTROL_SYMBOL2")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight control mode {" + _controlModes[_defaultSymbol2ControlModeIndex] + "}")
	endEvent
endState

state CONTROL_SYMBOL2_HOTKEY ; KeyMapping
	event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
		if (CheckNewHotkey(conflictControl, conflictName))
			AMOTSymbol2Quest.Hotkey = keyCode
			SetKeyMapOptionValueST(AMOTSymbol2Quest.Hotkey)
		endIf
	endEvent

	event OnDefaultST()
		AMOTSymbol2Quest.Hotkey = _defaultSymbol2Hotkey
		SetKeyMapOptionValueST(AMOTSymbol2Quest.Hotkey)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight hotkey {F11}")
	endEvent
endState

state CONTROL_SYMBOL2_DISPLAY_TIME ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTSymbol2Quest.DisplayTime)
		SetSliderDialogDefaultValue(_defaultSymbol2DisplayTime)
		SetSliderDialogRange(0.2, 10)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTSymbol2Quest.DisplayTime = value
		SetSliderOptionValueST(AMOTSymbol2Quest.DisplayTime, "{1}")
	endEvent

	event OnDefaultST()
		AMOTSymbol2Quest.DisplayTime = _defaultSymbol2DisplayTime
		SetSliderOptionValueST(AMOTSymbol2Quest.DisplayTime, "{1}")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight display time {" + FormatNumber(_defaultSymbol2DisplayTime, 1) + "}")
	endEvent
endState

state CONTROL_SYMBOL2_PERIOD ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_periods)
		SetMenuDialogStartIndex(_symbol2PeriodIndex)
		SetMenuDialogDefaultIndex(_defaultSymbol2PeriodIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_symbol2PeriodIndex = index
		AMOTSymbol2Quest.Period = _periodValues[_symbol2PeriodIndex]
		SetMenuOptionValueST(_periods[_symbol2PeriodIndex])
	endEvent

	event OnDefaultST()
		_symbol2PeriodIndex = _defaultSymbol2PeriodIndex
		AMOTSymbol2Quest.Period = _periodValues[_symbol2PeriodIndex]
		SetMenuOptionValueST(_periods[_symbol2PeriodIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight Period {" + _periods[_defaultSymbol2PeriodIndex] + "}")
	endEvent
endState

; endRegion

; region - Real-Life Clock

state CONTROL_RLCLOCK_MODE ; Text
	event OnSelectST()
		_rlClockControlModeIndex = GetNextControlMode(_rlClockControlModeIndex)

		SetTextOptionValueST(_controlModes[_rlClockControlModeIndex])
		AMOTRealLifeClockQuest.ControlMode = _controlModeValues[_rlClockControlModeIndex]

		UpdateControlStates(_rlClockControlModeIndex, "CONTROL_RLCLOCK")
	endEvent

	event OnDefaultST()
		_rlClockControlModeIndex = _defaultRLClockControlModeIndex
		AMOTRealLifeClockQuest.ControlMode = _controlModeValues[_rlClockControlModeIndex]
		SetTextOptionValueST(_controlModes[_rlClockControlModeIndex])

		UpdateControlStates(_rlClockControlModeIndex, "CONTROL_RLCLOCK")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight control mode {" + _controlModes[_defaultRLClockControlModeIndex] + "}")
	endEvent
endState

state CONTROL_RLCLOCK_HOTKEY ; KeyMapping
	event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
		if (CheckNewHotkey(conflictControl, conflictName))
			AMOTRealLifeClockQuest.Hotkey = keyCode
			SetKeyMapOptionValueST(AMOTRealLifeClockQuest.Hotkey)
		endIf
	endEvent

	event OnDefaultST()
		AMOTRealLifeClockQuest.Hotkey = _defaultRLClockHotkey
		SetKeyMapOptionValueST(AMOTRealLifeClockQuest.Hotkey)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight hotkey {F11}")
	endEvent
endState

state CONTROL_RLCLOCK_DISPLAY_TIME ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTRealLifeClockQuest.DisplayTime)
		SetSliderDialogDefaultValue(_defaultRLClockDisplayTime)
		SetSliderDialogRange(0.2, 10)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTRealLifeClockQuest.DisplayTime = value
		SetSliderOptionValueST(AMOTRealLifeClockQuest.DisplayTime, "{1}")
	endEvent

	event OnDefaultST()
		AMOTRealLifeClockQuest.DisplayTime = _defaultRLClockDisplayTime
		SetSliderOptionValueST(AMOTRealLifeClockQuest.DisplayTime, "{1}")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight display time {" + FormatNumber(_defaultRLClockDisplayTime, 1) + "}")
	endEvent
endState

state CONTROL_RLCLOCK_PERIOD ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_periods)
		SetMenuDialogStartIndex(_rlClockPeriodIndex)
		SetMenuDialogDefaultIndex(_defaultRLClockPeriodIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_rlClockPeriodIndex = index
		AMOTRealLifeClockQuest.Period = _periodValues[_rlClockPeriodIndex]
		SetMenuOptionValueST(_periods[_rlClockPeriodIndex])
	endEvent

	event OnDefaultST()
		_rlClockPeriodIndex = _defaultRLClockPeriodIndex
		AMOTRealLifeClockQuest.Period = _periodValues[_rlClockPeriodIndex]
		SetMenuOptionValueST(_periods[_rlClockPeriodIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight Period {" + _periods[_defaultRLClockPeriodIndex] + "}")
	endEvent
endState

; endRegion

; region - Real-Life Date

state CONTROL_RLDATE_MODE ; Text
	event OnSelectST()
		_rlDateControlModeIndex = GetNextControlMode(_rlDateControlModeIndex)

		SetTextOptionValueST(_controlModes[_rlDateControlModeIndex])
		AMOTRealLifeDateQuest.ControlMode = _controlModeValues[_rlDateControlModeIndex]

		UpdateControlStates(_rlDateControlModeIndex, "CONTROL_RLDATE")
	endEvent

	event OnDefaultST()
		_rlDateControlModeIndex = _defaultRLDateControlModeIndex
		AMOTRealLifeDateQuest.ControlMode = _controlModeValues[_rlDateControlModeIndex]
		SetTextOptionValueST(_controlModes[_rlDateControlModeIndex])

		UpdateControlStates(_rlDateControlModeIndex, "CONTROL_RLDATE")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight control mode {" + _controlModes[_defaultRLDateControlModeIndex] + "}")
	endEvent
endState

state CONTROL_RLDATE_HOTKEY ; KeyMapping
	event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
		if (CheckNewHotkey(conflictControl, conflictName))
			AMOTRealLifeDateQuest.Hotkey = keyCode
			SetKeyMapOptionValueST(AMOTRealLifeDateQuest.Hotkey)
		endIf
	endEvent

	event OnDefaultST()
		AMOTRealLifeDateQuest.Hotkey = _defaultRLDateHotkey
		SetKeyMapOptionValueST(AMOTRealLifeDateQuest.Hotkey)
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight hotkey {F11}")
	endEvent
endState

state CONTROL_RLDATE_DISPLAY_TIME ; Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(AMOTRealLifeDateQuest.DisplayTime)
		SetSliderDialogDefaultValue(_defaultRLDateDisplayTime)
		SetSliderDialogRange(0.2, 10)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		AMOTRealLifeDateQuest.DisplayTime = value
		SetSliderOptionValueST(AMOTRealLifeDateQuest.DisplayTime, "{1}")
	endEvent

	event OnDefaultST()
		AMOTRealLifeDateQuest.DisplayTime = _defaultRLDateDisplayTime
		SetSliderOptionValueST(AMOTRealLifeDateQuest.DisplayTime, "{1}")
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight display time {" + FormatNumber(_defaultRLDateDisplayTime, 1) + "}")
	endEvent
endState

state CONTROL_RLDATE_PERIOD ; Menu
	event OnMenuOpenST()
		SetMenuDialogOptions(_periods)
		SetMenuDialogStartIndex(_rlDatePeriodIndex)
		SetMenuDialogDefaultIndex(_defaultRLDatePeriodIndex)
	endEvent

	event OnMenuAcceptST(int index)
		_rlDatePeriodIndex = index
		AMOTRealLifeDateQuest.Period = _periodValues[_rlDatePeriodIndex]
		SetMenuOptionValueST(_periods[_rlDatePeriodIndex])
	endEvent

	event OnDefaultST()
		_rlDatePeriodIndex = _defaultRLDatePeriodIndex
		AMOTRealLifeDateQuest.Period = _periodValues[_rlDatePeriodIndex]
		SetMenuOptionValueST(_periods[_rlDatePeriodIndex])
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight Period {" + _periods[_defaultRLDatePeriodIndex] + "}")
	endEvent
endState

; endRegion

; endRegion

; region -- Preset

state PRESET_LOAD_DEFAULT ; Text
	event OnSelectST()
		if ShowMessage("$AMOT Really load default settings", true)
			LoadDefaultsGeneral()
			LoadDefaultsDisplay()
			LoadDefaultsControl()
		endIf
	endEvent

	event OnHighlightST()
		SetInfoText("$AMOT Highlight load defaults")
	endEvent
endState

state PRESET_LOAD_USER ; Text
	event OnSelectST()
		if ShowMessage("$AMOT Really load user settings", true)
			if LoadUserSettings()
			ShowMessage("$AMOT User settings loaded successfully", false)
		else
			ShowMessage("$AMOT User settings load not successful", false)
			endIf
		endIf
	endEvent

	event OnHighlightST()
		FISSInterface fiss = FISSFactory.getFISS()
		if fiss
			fiss.beginLoad("AMOTUserSettings.xml")
			if fiss.endLoad() == ""
				SetInfoText("$AMOT Highlight load user settings")
			else
				SetInfoText("$AMOT Highlight load user settings not exist")
			endIf
		else
			SetInfoText("$AMOT Highlight load user settings no fiss")
		endIf
	endEvent
endState

state PRESET_SAVE_USER ; Text
	event OnSelectST()
		FISSInterface fiss = FISSFactory.getFISS()
		fiss.beginLoad("AMOTUserSettings.xml")
		if fiss.endLoad() == ""
			if !ShowMessage("$AMOT User settings already present", true)
				return
			endIf
		endIf
		if SaveUserSettings()
			ShowMessage("$AMOT User settings saved successfully", false)
		else
			ShowMessage("$AMOT User settings save not successful", false)
		endIf
		
		ForcePageReset()
	endEvent

	event OnHighlightST()
		FISSInterface fiss = FISSFactory.getFISS()
		if fiss
			SetInfoText("$AMOT Highlight save user settings")
		else
			SetInfoText("$AMOT Highlight save user settings no fiss")
		endIf
	endEvent
endState

; endRegion

; endRegion

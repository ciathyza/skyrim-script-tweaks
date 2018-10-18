scriptname AMOTSymbolQuestScript extends AMOTWidgetBase  
{The quest script for the symbol widget.}

; region ------------------ Private variables ------------------

string _theme = "SkyDial"
bool _showMoonPhases = false
bool _showSeasons = false

; endRegion

; region ------------------ Properties -------------------------

GlobalVariable property GameDay auto
{This is the global day of the game}

GlobalVariable property GameMonth auto
{This is the global month of the game}

GlobalVariable property GameYear auto
{This is the global year of the game}

GlobalVariable property GameDaysPassed auto
{This is the global days passed of the game}

string property Theme
	{The theme sets the symbol to display.}
	string function get()
		return _theme
	endFunction
	
	function set(string theTheme)
		_theme = theTheme
		if(Ready)
			UpdateTheme()
			UpdateShowMoonPhases()
			UpdateShowSeasons()
		endIf
	endFunction
endProperty

bool property HasMoonPhases
	{Gets a value indicating if the current symbol is able to show the moon phases}
	bool function get()
		if(Ready)
			return UI.GetBool(HUD_MENU, WidgetRoot + ".HasMoonPhases") 
		endIf
		return false;
	endFunction
endProperty

bool property HasSeasons
	{Gets a value indicating if the current symbol is able to show seasons}
	bool function get()
		if(Ready)
			return UI.GetBool(HUD_MENU, WidgetRoot + ".HasSeasons")
		endIf
		return false;
	endFunction
endProperty

bool property ShowMoonPhases
	{Set to true to show the moon phases}
	bool function get()
		return _showMoonPhases
	endFunction

	function set(bool isShown)
		_showMoonPhases = isShown
		if(Ready)
			UpdateShowMoonPhases()
		endIf
	endFunction
endProperty

bool property ShowSeasons
	{Set to true to show the time as 24 hours instead of 12}
	bool function get()
		return _showSeasons
	endFunction

	function set(bool isShown)
		_showSeasons = isShown
		if(Ready)
			UpdateShowSeasons()
		endIf
	endFunction
endProperty

; endRegion

; region ------------------ Events -----------------------------

; @override SKI_WidgetBase
event OnWidgetReset()
	parent.OnWidgetReset()

	; Update event registrations
	UnregisterForUpdate()
	RegisterForSingleUpdate(1.0)

	UpdateTheme()
	UpdateShowMoonPhases()
	UpdateShowSeasons()
	
	setDate()
endEvent

event OnUpdate()
	setTime()
	setDate()
	RegisterForSingleUpdate(1.0)
endEvent

event OnMenuClose(String menuName)
	parent.OnMenuClose(menuName)
	
	setDate()
endEvent

;endRegion

; region ------------------ Functions --------------------------

function setDate()
	int[] params = new int[4]
	params[0] = GameDay.GetValueInt()
	params[1] = GameMonth.GetValueInt()
	params[2] = GameYear.GetValueInt()
	params[3] = GameDaysPassed.GetValueInt()
	
	if(Ready)
		UI.InvokeIntA(HUD_MENU, WidgetRoot + ".SetDate", params)
	endIf
endFunction

function UpdateTheme()
	UI.SetString(HUD_MENU, WidgetRoot + ".Theme", _theme)
endFunction

function UpdateShowMoonPhases()
	UI.SetBool(HUD_MENU, WidgetRoot + ".ShowMoonPhases", _showMoonPhases) 
endFunction

function UpdateShowSeasons()
	UI.SetBool(HUD_MENU, WidgetRoot + ".ShowSeasons", _showSeasons) 
endFunction

; @overrides SKI_WidgetBase
string function GetWidgetType()
	return "AMOTSymbolQuestScript"
endFunction

; @overrides SKI_WidgetBase
string function GetWidgetSource()
	return "AMOTSymbolWidget.swf"
endFunction

;endRegion

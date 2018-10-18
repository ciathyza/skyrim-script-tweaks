scriptname AMOTWidgetQuestScript extends SKI_WidgetBase  
{The main quest for the AMOT widget.}

; region ------------------ Private variables ------------------
string _theme = "PictureOfTheDay"
bool _showSymbol = true
bool _showClock = true
bool _showSeconds = false
bool _show24Hours = true
int _widgetAlpha = 100
int _scaleSymbol = 100
int _scaleClock = 100
string _controlMode = "always"
int _hotkey = 87
float _displayTime = 1.0
bool _displayed = false
bool _menuOpen = false
; endRegion

; region ------------------ Properties -------------------------

GlobalVariable property Timescale auto
{This is the global timescale of the game}

string property Theme
	{The theme sets the symbol to display. Right now one can choose between "PictureOfTheDay" and "DayDial"}
	string function get()
		return _theme
	endFunction
	
	function set(string theTheme)
		_theme = theTheme
		if(Ready)
			UI.SetString(HUD_MENU, WidgetRoot + ".Theme", _theme) 
		endIf
	endFunction
endProperty

bool property ShowSymbol
	{Set to true to show the symbol}
	bool function get()
		return _showSymbol
	endFunction

	function set(bool shown)
		_showSymbol = shown
		if(Ready)
			UI.SetBool(HUD_MENU, WidgetRoot + ".ShowSymbol", _showSymbol) 
		endIf
	endFunction
endProperty

bool property ShowClock
	{Set to true to show the clock}
	bool function get()
		return _showClock
	endFunction

	function set(bool shown)
		_showClock = shown
		if(Ready)
			UI.SetBool(HUD_MENU, WidgetRoot + ".ShowClock", _showClock) 
		endIf
	endFunction
endProperty

bool property ShowSeconds
	{Set to true to show a full time including seconds}
	bool function get()
		return _showSeconds
	endFunction

	function set(bool shown)
		_showSeconds = shown
		if(Ready)
			UI.SetBool(HUD_MENU, WidgetRoot + ".ShowSeconds", _showSeconds) 
		endIf
	endFunction
endProperty

bool property Show24Hours
	{Set to true to show the time as 24 hours instead of 12}
	bool function get()
		return _show24Hours
	endFunction

	function set(bool shown)
		_show24Hours = shown
		if(Ready)
			UI.SetBool(HUD_MENU, WidgetRoot + ".Show24Hours", _show24Hours) 
		endIf
	endFunction
endProperty

int property WidgetAlpha
	{Set the alpha value of the widget (in percent 0 ... 100)}
	int function get()
		return _widgetAlpha
	endFunction

	function set(int theAlpha)
		_widgetAlpha = theAlpha
		if(_controlMode == "always" || (_controlMode == "toggledHotkey" && _displayed))
			showWidget()
		endIf
	endFunction
endProperty

int property ScaleSymbol
	{Set the scale of the symbol (in percent 0 ... 100)}
	int function get()
		return _scaleSymbol
	endFunction

	function set(int theScale)
		_scaleSymbol = theScale
		if(Ready)
			UI.SetInt(HUD_MENU, WidgetRoot + ".ScaleSymbol", _scaleSymbol) 
		endIf
	endFunction
endProperty

int property ScaleClock
	{Set the scale of the clock (in percent 0 ... 100)}
	int function get()
		return _scaleClock
	endFunction

	function set(int theScale)
		_scaleClock = theScale
		if(Ready)
			UI.SetInt(HUD_MENU, WidgetRoot + ".ScaleClock", _scaleClock) 
		endIf
	endFunction
endProperty

string property ControlMode
	{The mode the widget is displayed. Possible values are "always", "timedHotkey" and "toggledHotkey".}
	string function get()
		return _controlMode
	endFunction
	
	function set(string mode)
		_controlMode = mode
		updateConfig()
	endFunction
endProperty

int property Hotkey
	{The hotkey used to display the widget.}
	int function get()
		return _hotkey
	endFunction
	
	function set(int myHotkey)
		_hotkey = myHotkey
		updateConfig()
	endFunction
endProperty

float property DisplayTime
	{The time the widget is displayed if control mode is set to "timedHotkey".}
	float function get()
		return _displayTime
	endFunction
	
	function set(float time)
		_displayTime = time
	endFunction
endProperty

; endRegion

; region ------------------ Events -----------------------------

; @override SKI_WidgetBase
event OnWidgetReset()
	; Update the scale *before* calling OnWidgetReset prevents the widget to
	; be displayed at a wrong position if scale != 100%.
	UI.SetInt(HUD_MENU, WidgetRoot + ".ScaleSymbol", _scaleSymbol)
	UI.SetInt(HUD_MENU, WidgetRoot + ".ScaleClock", _scaleClock)

	parent.OnWidgetReset()

	; Update event registrations
	UnregisterForUpdateGameTime() ; Unregister this event because it could be registered by an old save
	UnregisterForUpdate()
	RegisterForSingleUpdate(1.0)

	UnregisterForAllMenus()
	RegisterForMenu("BarterMenu")
	RegisterForMenu("Book Menu")
	RegisterForMenu("Console")
	RegisterForMenu("Console Native UI Menu")
	RegisterForMenu("ContainerMenu")
	RegisterForMenu("Crafting Menu")
	RegisterForMenu("Credits Menu")
	RegisterForMenu("Cursor Menu")
	RegisterForMenu("Debug Text Menu")
	RegisterForMenu("Dialogue Menu")
	RegisterForMenu("Fader Menu")
	RegisterForMenu("FavoritesMenu")
	RegisterForMenu("GiftMenu")
	RegisterForMenu("HUD Menu")
	RegisterForMenu("InventoryMenu")
	RegisterForMenu("Journal Menu")
	RegisterForMenu("Kinect Menu")
	RegisterForMenu("LevelUp Menu")
	RegisterForMenu("Loading Menu")
	RegisterForMenu("Lockpicking Menu")
	RegisterForMenu("MagicMenu")
	RegisterForMenu("Main Menu")
	RegisterForMenu("MapMenu")
	RegisterForMenu("MessageBoxMenu")
	RegisterForMenu("Mist Menu")
	RegisterForMenu("Overlay Interaction Menu")
	RegisterForMenu("Overlay Menu")
	RegisterForMenu("Quantity Menu")
	RegisterForMenu("RaceSex Menu")
	RegisterForMenu("Sleep/Wait Menu")
	RegisterForMenu("StatsMenu")
	RegisterForMenu("TitleSequence Menu")
	RegisterForMenu("Top Menu")
	RegisterForMenu("Training Menu")
	RegisterForMenu("Tutorial Menu")
	RegisterForMenu("TweenMenu ")

	; Send the current values to the widget
	UI.SetString(HUD_MENU, WidgetRoot + ".Theme", _theme) 
	UI.SetBool(HUD_MENU, WidgetRoot + ".ShowSymbol", _showSymbol) 
	UI.SetBool(HUD_MENU, WidgetRoot + ".ShowClock", _showClock)
	UI.SetBool(HUD_MENU, WidgetRoot + ".ShowSeconds", _showSeconds)
	UI.SetBool(HUD_MENU, WidgetRoot + ".Show24Hours", _show24Hours)
	
	updateConfig()
	setTime()
	
	if(_controlMode == "toggledHotkey" && _displayed)
		showWidget()
	endIf
endEvent

event OnMenuOpen(String menuName)
	_menuOpen = true
	if(Ready)
		UI.Invoke(HUD_MENU, WidgetRoot + ".PauseUpdate") 
	endIf
endEvent

event OnMenuClose(String menuName)
	_menuOpen = false
	setTime()
endEvent

event OnUpdate()
	setTime()
	RegisterForSingleUpdate(1.0)
endEvent

event OnKeyUp(int keyCode, float holdTime)
	if(!_menuOpen)
		if(_controlMode == "timedHotkey")
			showWidget()
			Utility.Wait(_displayTime)
			; The control mode might have changed, so check again.
			if(_controlMode == "timedHotkey")
				hideWidget()
			endIf
		else
			if(_displayed)
				hideWidget()
				_displayed = false
			else
				showWidget()
				_displayed = true
			endIf
		endIf
	endIf
endEvent
;endRegion

; region ------------------ Functions --------------------------

function updateConfig()
	; Cleanup
	UnregisterForAllKeys()
	
	if(_controlMode == "always")
		showWidget()
	else
		hideWidget()
		RegisterForKey(_hotkey)
	endIf
endFunction

function setTime()
	; Get the current game time
	float time = Utility.GetCurrentGameTime()
	time -= Math.Floor(Time) ; Remove "previous in-game days passed" bit
	time *= 24 ; Convert from fraction of a day to number of hours
	int hour = (time as int)
	float minutes = time - (hour)
	minutes *= 60
	int minute = (minutes as int)
	float seconds = minutes - (minute)
	seconds *= 60
	int second = (seconds as int)
	
	int[] params = new int[4]
	params[0] = hour
	params[1] = minute
	params[2] = second
	params[3] = Timescale.GetValueInt()
	
	if(Ready)
		UI.InvokeIntA(HUD_MENU, WidgetRoot + ".SetTime", params)
	endIf
endFunction

function showWidget()
	if(Ready)
		FadeTo(_widgetAlpha, 0.2)
	endIf
endFunction

function hideWidget()
	if(Ready)
		FadeTo(0, 0.2)
	endIf
endFunction

; @overrides SKI_WidgetBase
string function GetWidgetSource()
	return "AMatterOfTime.swf"
endFunction

; @overrides SKI_WidgetBase
string function GetWidgetType()
	return "AMOTWidgetQuestScript"
endFunction
; endRegion
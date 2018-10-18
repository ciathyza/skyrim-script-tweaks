scriptname AMOTClockBase extends AMOTWidgetBase  
{A base script for the clock widgets.}

; region ------------------ Private variables ------------------

bool _showSeconds = false
string _clockType = "12"

; endRegion

; region ------------------ Properties -------------------------

bool property ShowSeconds
	{Set to true to show a full time including seconds}
	bool function get()
		return _showSeconds
	endFunction

	function set(bool isShown)
		_showSeconds = isShown
		if(Ready)
			UpdateShowSeconds()
		endIf
	endFunction
endProperty

string property ClockType
	{Set to true to show the time as 24 hours instead of 12}
	string function get()
		return _clockType
	endFunction

	function set(string theType)
		_clockType = theType
		if(Ready)
			UpdateClockType()
		endIf
	endFunction
endProperty

; endRegion

; region ------------------ Events -----------------------------

; @override SKI_WidgetBase
event OnWidgetReset()
	parent.OnWidgetReset()

	; Send the current values to the widget
	UpdateShowSeconds()
	UpdateClockType()
endEvent
;endRegion

; region ------------------ Functions --------------------------

function UpdateShowSeconds()
	UI.SetBool(HUD_MENU, WidgetRoot + ".ShowSeconds", _showSeconds)
endFunction

function UpdateClockType()
	UI.SetString(HUD_MENU, WidgetRoot + ".ClockType", _clockType)
endFunction

; @overrides SKI_WidgetBase
string function GetWidgetSource()
	return "AMOTClockWidget.swf"
endFunction

;endRegion

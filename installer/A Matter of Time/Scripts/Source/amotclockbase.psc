scriptname AMOTClockBase extends AMOTWidgetBase  

bool _showSeconds = false
string _clockType = "12"


; Set to true to show a full time including seconds.
bool property ShowSeconds
	bool function get()
		return _showSeconds
	endFunction
	function set(bool isShown)
		_showSeconds = isShown
		if Ready
			UpdateShowSeconds()
		endIf
	endFunction
endProperty


; Set to true to show the time as 24 hours instead of 12
string property ClockType
	string function get()
		return _clockType
	endFunction
	function set(string theType)
		_clockType = theType
		if Ready
			UpdateClockType()
		endIf
	endFunction
endProperty


event OnWidgetReset()
	parent.OnWidgetReset()
	UpdateShowSeconds()
	UpdateClockType()
endEvent


function UpdateShowSeconds()
	UI.SetBool(HUD_MENU, WidgetRoot + ".ShowSeconds", _showSeconds)
endFunction


function UpdateClockType()
	UI.SetString(HUD_MENU, WidgetRoot + ".ClockType", _clockType)
endFunction


string function GetWidgetSource()
	return "AMOTClockWidget.swf"
endFunction

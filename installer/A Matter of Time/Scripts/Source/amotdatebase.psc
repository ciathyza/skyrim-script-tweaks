scriptname AMOTDateBase extends AMOTWidgetBase  

string _dateFormat = "LoreFriendly"


; The format of the date to display.
string property DateFormat
	string function get()
		return _dateFormat
	endFunction
	function set(string theFormat)
		_dateFormat = theFormat
		if Ready
			UpdateDateFormat()
		endIf
	endFunction
endProperty


event OnWidgetReset()
	parent.OnWidgetReset()
	UpdateDateFormat()
endEvent


function UpdateDateFormat()
	UI.SetString(HUD_MENU, WidgetRoot + ".DateFormat", _dateFormat) 
endFunction


string function GetWidgetSource()
	return "AMOTDateWidget.swf"
endFunction

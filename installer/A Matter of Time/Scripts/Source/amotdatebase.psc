scriptname AMOTDateBase extends AMOTWidgetBase  

; region ------------------ Private variables ------------------
string _dateFormat = "LoreFriendly"
; endRegion

; region ------------------ Properties -------------------------

string property DateFormat
	{The format of the date to display.}
	string function get()
		return _dateFormat
	endFunction
	
	function set(string theFormat)
		_dateFormat = theFormat
		if(Ready)
			UpdateDateFormat()
		endIf
	endFunction
endProperty
; endRegion

; region ------------------ Events -----------------------------

; @override SKI_WidgetBase
event OnWidgetReset()
	parent.OnWidgetReset()

	; Send the current values to the widget
	UpdateDateFormat()
endEvent
;endRegion

;endRegion

; region ------------------ Functions --------------------------

function UpdateDateFormat()
	UI.SetString(HUD_MENU, WidgetRoot + ".DateFormat", _dateFormat) 
endFunction

; @overrides SKI_WidgetBase
string function GetWidgetSource()
	return "AMOTDateWidget.swf"
endFunction

; endRegion
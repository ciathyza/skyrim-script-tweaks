scriptname AMOTRealLifeDateQuestScript extends AMOTDateBase  
{The quest for the AMOT real-life date widget.}

; region ------------------ Private variables ------------------
; endRegion

; region ------------------ Properties -------------------------
; endRegion

; region ------------------ Events -----------------------------

; @override SKI_WidgetBase
event OnWidgetReset()
	parent.OnWidgetReset()

	UI.InvokeBool(HUD_MENU, WidgetRoot + ".ShowRealDate", true)
endEvent

; endRegion

; region ------------------ Functions --------------------------

; Populates the in game time to the widget.
function setTime()
	if(Ready)
		UI.InvokeBool(HUD_MENU, WidgetRoot + ".SetRealTime", true)
	endIf
endFunction

; @overrides SKI_WidgetBase
string function GetWidgetType()
	return "AMOTRealLifeDateQuestScript"
endFunction

; endRegion

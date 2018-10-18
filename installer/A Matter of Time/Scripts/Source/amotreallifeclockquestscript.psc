scriptname AMOTRealLifeClockQuestScript extends AMOTClockBase  
{The quest for the AMOT real-life clock widget.}

; region ------------------ Private variables ------------------
; endRegion

; region ------------------ Properties -------------------------
; endRegion

; region ------------------ Events -----------------------------

; @override SKI_WidgetBase
event OnWidgetReset()
	parent.OnWidgetReset()

	; Update event registrations
	UnregisterForUpdate()
	RegisterForSingleUpdate(60.0)

	setTime()
endEvent

event OnUpdate()
	setTime()
	RegisterForSingleUpdate(60.0)
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
	return "AMOTRealLifeClockQuestScript"
endFunction

; endRegion
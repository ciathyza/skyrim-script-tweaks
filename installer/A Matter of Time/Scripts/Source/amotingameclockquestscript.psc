scriptname AMOTInGameClockQuestScript extends AMOTClockBase  
{The quest for the AMOT in-game clock widget.}

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
	RegisterForSingleUpdate(1.0)
endEvent

event OnUpdate()
	setTime()
	RegisterForSingleUpdate(1.0)
endEvent

;endRegion

; region ------------------ Functions --------------------------

; @overrides SKI_WidgetBase
string function GetWidgetType()
	return "AMOTInGameClockQuestScript"
endFunction

; endRegion
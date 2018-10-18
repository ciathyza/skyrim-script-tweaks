scriptname AMOTInGameDateQuestScript extends AMOTDateBase  
{The quest for the AMOT in-game date widget.}

; region ------------------ Private variables ------------------
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

; endRegion

; region ------------------ Events -----------------------------

; @override SKI_WidgetBase
event OnWidgetReset()
	parent.OnWidgetReset()

	; Update event registrations
	UnregisterForUpdate()
	RegisterForSingleUpdate(1.0)

	setDate()
endEvent

event OnUpdate()
	; Set the time to ensure the correct periodic display.
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

; @overrides SKI_WidgetBase
string function GetWidgetType()
	return "AMOTInGameDateQuestScript"
endFunction

; endRegion
Scriptname HeadtrackingConfigMenu extends SKI_ConfigBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor          Property PlayerRef                         Auto
GlobalVariable Property HeadtrackingCorpses               Auto
GlobalVariable Property HeadtrackingExpressions           Auto
GlobalVariable Property HeadtrackingMoving                Auto
GlobalVariable Property HeadtrackingRange                 Auto
GlobalVariable Property HeadtrackingSilent                Auto
GlobalVariable Property HeadtrackingTimer                 Auto
GlobalVariable Property HeadtrackingUninstall             Auto
Perk           Property HeadtrackingRangePerk             Auto
Quest          Property Headtracking                      Auto
Spell          Property HeadtrackingPlayer                Auto
Spell          Property HeadtrackingPlayerNoCorpses       Auto
Spell          Property HeadtrackingPlayerNoMoving        Auto
Spell          Property HeadtrackingPlayerNoMovingCorpses Auto

HeadTrackingScript QuestScript


; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

int CorpsesOID
int DisableOID
int ExpressionsOID
int MovingOID
int RangeOID
int SilentOID
int TextID
int TimerOID

bool hasChanged


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

Event OnConfigInit()
	If !Headtracking.IsRunning()
		Headtracking.Start()
	EndIf

	QuestScript = Headtracking as HeadTrackingScript
	If QuestScript.Version == 0
		QuestScript.TrackScripts = New HeadtrackingTargetScript[15]
		int index = 0
		While index < 15
			if QuestScript.TrackTargets[index] == None
				QuestScript.TrackTargets[index] = PlayerRef
			EndIf
			index += 1
		EndWhile
	ElseIf QuestScript.Version < 30
		Debug.Notification("Player Headtracking updated to version 3.3.")
	EndIf
	QuestScript.Version = GetVersion()
	Refresh()
EndEvent


Event OnConfigOpen()
	hasChanged = False
EndEvent


Event OnConfigClose()
	If hasChanged
		Refresh()
	EndIf
EndEvent


event OnPageReset(string page)
	Int IsEnabledOptionFlag = OPTION_FLAG_DISABLED
	If HeadtrackingUninstall.GetValueInt() == 0
		IsEnabledOptionFlag = OPTION_FLAG_NONE
	EndIf

	SetCursorFillMode(LEFT_TO_RIGHT)
	DisableOID = AddToggleOption("Player Headtracking", !(HeadtrackingUninstall.GetValueInt() as Bool))
	If HeadtrackingUninstall.GetValueInt() == 0
		MovingOID = AddToggleOption("Headtrack while moving", (HeadtrackingMoving.GetValueInt() as Bool), IsEnabledOptionFlag)
		AddEmptyOption()
		SilentOID = AddToggleOption("Headtrack non-talking actors", (HeadtrackingSilent.GetValueInt() as Bool), IsEnabledOptionFlag)
		AddEmptyOption()
		CorpsesOID = AddToggleOption("Headtrack corpses", (HeadtrackingCorpses.GetValueInt() as Bool), IsEnabledOptionFlag)
		TextID = AddTextOption("Headtracking does not work in first person,", "", 1)
		RangeOID = AddSliderOption("Headtracking distance", HeadtrackingRange.GetValue(), "{0} feet", IsEnabledOptionFlag)
		TextID = AddTextOption("when weapons are out, or when riding a mount.", "", 1)
		SetCursorFillMode(TOP_TO_BOTTOM)
		If HeadtrackingTimer.GetValue() > 0
			TimerOID = AddSliderOption("Headtracking duration", HeadtrackingTimer.GetValue(), "{1} seconds", IsEnabledOptionFlag)
		Else
			TimerOID = AddSliderOption("Headtracking duration", 0, "infinite", IsEnabledOptionFlag)
		EndIf
		if HeadtrackingExpressions.GetValue() > 0
			ExpressionsOID = AddSliderOption("Facial expression strength", HeadtrackingExpressions.GetValue(), "{0}", IsEnabledOptionFlag)
		Else
			ExpressionsOID = AddToggleOption("Facial expressions", false, IsEnabledOptionFlag)
		EndIf
	EndIf
endEvent


event OnOptionSelect(int option)
	hasChanged = true
	If option == MovingOID
		HeadtrackingMoving.SetValueInt((!(HeadtrackingMoving.GetValueInt() as Bool)) as Int)
		SetToggleOptionValue(option, (HeadtrackingMoving.GetValueInt() as Bool))
	ElseIf option == SilentOID
		HeadtrackingSilent.SetValueInt((!(HeadtrackingSilent.GetValueInt() as Bool)) as Int)
		SetToggleOptionValue(option, (HeadtrackingSilent.GetValueInt() as Bool))
	ElseIf option == CorpsesOID
		HeadtrackingCorpses.SetValueInt((!(HeadtrackingCorpses.GetValueInt() as Bool)) as Int)
		SetToggleOptionValue(option, (HeadtrackingCorpses.GetValueInt() as Bool))
	ElseIf option == ExpressionsOID
		HeadtrackingExpressions.SetValue(50.0)
		ForcePageReset()
	ElseIf option == DisableOID
		HeadtrackingUninstall.SetValueInt((!(HeadtrackingUninstall.GetValueInt() as Bool)) as Int)
		SetToggleOptionValue(option, (!(HeadtrackingUninstall.GetValueInt() as Bool)))
		ForcePageReset()
	EndIf
EndEvent


event OnOptionDefault(int option)
	If option == RangeOID
		HeadtrackingRange.SetValue(4.0)
	ElseIf option == MovingOID
		HeadtrackingMoving.SetValueInt(1)
		SetToggleOptionValue(MovingOID, true)
	ElseIf option == SilentOID
		HeadtrackingSilent.SetValue(1)
		SetToggleOptionValue(SilentOID, true)
	ElseIf option == CorpsesOID
		HeadtrackingCorpses.SetValue(1)
		SetToggleOptionValue(CorpsesOID, true)
	ElseIf option == ExpressionsOID
		HeadtrackingExpressions.SetValue(50.0)
		ForcePageReset()
	ElseIf option == DisableOID
		HeadtrackingUninstall.SetValueInt(1)
		ForcePageReset()
	EndIf
EndEvent


event OnOptionSliderOpen(int option)
	If option == RangeOID
		SetSliderDialogStartValue(HeadtrackingRange.GetValue())
		SetSliderDialogDefaultValue(6.0)
		SetSliderDialogRange(2.0, 50.0)
		SetSliderDialogInterval(1.0)
	ElseIf option == TimerOID
		;SetSliderOptionValue(option, HeadtrackingTimer.GetValue(), "{0} seconds")
		SetSliderDialogStartValue(HeadtrackingTimer.GetValue())
		SetSliderDialogDefaultValue(3.5)
		SetSliderDialogRange(0.0, 30.0)
		SetSliderDialogInterval(0.5)
	ElseIf option == ExpressionsOID
		SetSliderDialogStartValue(HeadtrackingExpressions.GetValue())
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	EndIf
endEvent


event OnOptionSliderAccept(int option, float value)
	hasChanged = true
	If option == RangeOID
		HeadtrackingRange.SetValue(value)
		SetSliderOptionValue(option, value, "{0} feet")
	ElseIf option == TimerOID
		HeadtrackingTimer.SetValue(value)
		if value == 0
			SetSliderOptionValue(option, value, "infinite")
		Else
			SetSliderOptionValue(option, value, "{1} seconds")
		EndIf
	ElseIf option == ExpressionsOID
		HeadtrackingExpressions.SetValue(value)
		SetSliderOptionValue(option, value, "{0}")
		If value == 0
			ForcePageReset()
		EndIf
	EndIf
EndEvent


event OnOptionHighlight(int option)
	if option == TimerOID
		SetSliderOptionValue(TimerOID, HeadtrackingTimer.GetValue(), "{1} seconds")
		SetInfoText("Set the duration before head-tracking of boring actors stops. A value of 0 makes it infinite.")
	Else
		if HeadtrackingTimer.GetValue() == 0
			SetSliderOptionValue(TimerOID, 0, "infinite")
		EndIf
		If option == MovingOID
			SetInfoText("Toggle Headtracking while moving.")
		ElseIf option == SilentOID
			SetInfoText("Toggle Headtracking of non-talking actors.")
		ElseIf option == RangeOID
			SetInfoText("Set Headtracking distance in feet.")
		ElseIf option == CorpsesOID
			SetInfoText("Toggle Headtracking of corpses.")
		ElseIf option == ExpressionsOID
			if HeadtrackingExpressions.GetValue() > 0
				SetInfoText("Set the strength of your character's facial expressions towards (some) other actors. Set to 0 to disable expressions.")
			Else
				SetInfoText("Turn on facial expressions towards (some) other actors.")
			EndIf
		ElseIf option == DisableOID
			if HeadtrackingUninstall.GetValueInt() == 0
				SetInfoText("Disables Player Headtracking. Do this before uninstalling the mod.")
			Else
				SetInfoText("Enables Player Headtracking.")
			EndIf
		EndIf
	EndIf
EndEvent


Event OnVersionUpdate(int a_version)
	if (a_version >= 33 && CurrentVersion < 33)
		QuestScript.TrackTargets = New Actor[15]
		Int Index = 0
		While (Index < 15)
			QuestScript.TrackTargets[Index] = PlayerRef
			Index += 1
		EndWhile
	EndIf
EndEvent


;Event OnGameReload()
;	parent.OnGameReload()
;EndEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

Function Refresh()
	QuestScript = Headtracking as HeadTrackingScript

	if HeadtrackingUninstall.GetValueInt() > 0
		QuestScript.TrackingProp = False
		QuestScript.GoToState("Uninstalled")
		PlayerRef.SetAnimationVariableInt("IsNPC", 0)
		PlayerRef.ClearExpressionOverride()
		int index = 0
		While index < 15
			QuestScript.TrackTargets[index] = PlayerRef
			index += 1
		EndWhile
		Return
	EndIf

	PlayerRef.RemoveSpell(HeadtrackingPlayer)
	PlayerRef.RemoveSpell(HeadtrackingPlayerNoMoving)
	PlayerRef.RemoveSpell(HeadtrackingPlayerNoMovingCorpses)
	PlayerRef.RemoveSpell(HeadtrackingPlayerNoCorpses)
	PlayerRef.SetActorValue("WaitingForPlayer", HeadtrackingRange.GetValue())
	PlayerRef.RemovePerk(HeadtrackingRangePerk)
	PlayerRef.AddPerk(HeadtrackingRangePerk)

	if HeadtrackingMoving.GetValue()
		if HeadtrackingCorpses.GetValue()
			PlayerRef.AddSpell(HeadtrackingPlayer, False)
		Else
			PlayerRef.AddSpell(HeadtrackingPlayerNoCorpses, False)
		EndIf
	Else
		if HeadtrackingCorpses.GetValue()
			PlayerRef.AddSpell(HeadtrackingPlayerNoMoving, False)
		Else
			PlayerRef.AddSpell(HeadtrackingPlayerNoMovingCorpses, False)
		EndIf
	EndIf

	If QuestScript.GetState() == "Uninstalled"
		QuestScript.TrackingProp = False
		QuestScript.GoToState("")
		QuestScript.RegisterForSingleUpdate(0.5)
	EndIf
EndFunction


int function GetVersion()
	return 33
endFunction

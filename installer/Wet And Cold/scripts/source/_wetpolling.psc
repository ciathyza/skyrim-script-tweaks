Scriptname _WetPolling extends activemagiceffect  

;====================================================================================

Spell Property _WetShelterDetectSpell Auto

FormList Property _WetWTTreeList Auto

Form CurrentWorld

Activator Property _WetShelterDetector Auto
Activator Property _WetShelterShooter Auto

ObjectReference Detector
ObjectReference Shooter

GlobalVariable Property _WetIsIndoors Auto
GlobalVariable Property _WetIsInTheCold Auto
GlobalVariable Property _WetIsInTheColdTimed Auto
GlobalVariable Property DIST_WCRegionCold Auto
GlobalVariable Property DIST_WCRegionVariable Auto
GlobalVariable Property DIST_WCRegionWarm Auto

_WetQuestScript Property _WetQuest Auto

Bool Property ShelterDetect Auto
Bool ChangedLoc

Actor targ

;====================================================================================

Bool Function HasForm(Form[] MyArray, Form MyForm)
	Int i = 0
	While i < MyArray.Length
		If MyArray[i] == MyForm
			Return True
		Else
			i += 1
		Endif
	EndWhile
	Return False
EndFunction

Bool Function IsInTrueInterior()
	If Weather.GetSkyMode() != 3
		Return True
	ElseIf HasForm(_WetQuest.WorldInterior, CurrentWorld)
		Return True
	EndIf
	Return False
EndFunction

Function SetColdGlobals(Int InCold, Int InColdTimed, Bool IsInCold = False)
	_WetIsInTheCold.SetValue(InCold)
	_WetIsInTheColdTimed.SetValue(InColdTimed)
	_WetQuest.IsInCold = IsInCold
	If _WetQuest.CCORInstalled
		If InCold == 0 && InColdTimed == 0
			DIST_WCRegionCold.SetValue(100)
			DIST_WCRegionVariable.SetValue(100)
			DIST_WCRegionWarm.SetValue(0)
		ElseIf InCold == 1 && InColdTimed == 0
			DIST_WCRegionCold.SetValue(0)
			DIST_WCRegionVariable.SetValue(100)
			DIST_WCRegionWarm.SetValue(100)	
		Else
			DIST_WCRegionCold.SetValue(100)
			DIST_WCRegionVariable.SetValue(0)
			DIST_WCRegionWarm.SetValue(100)	
		EndIf
	EndIf
	;Debug.Notification(targ.GetPositionX() + ", " + targ.GetPositionY() + ", " + targ.GetPositionZ())					;DEBUG
EndFunction

;====================================================================================

Function CheckExterior()
	If _WetQuest.InVanillaCold
		SetColdGlobals(1, 0, true)
	ElseIf _WetQuest.InVanillaColdTimed
		SetColdGlobals(1, 1)
	ElseIf _WetQuest.DGColdWorld && HasForm(_WetQuest.DGColdWorld, CurrentWorld)
		SetColdGlobals(1, 0, true)
	ElseIf _WetQuest.WTColdWorld && HasForm(_WetQuest.WTColdWorld, CurrentWorld)
		Int CurrentTime = _WetQuest.CurrentTime
		If !Game.FindClosestReferenceOfAnyTypeInListFromRef(_WetWTTreeList, targ, 5120.0)
			SetColdGlobals(1, 0, true)
		ElseIf CurrentTime < 5 || CurrentTime > 22
			SetColdGlobals(1, 1)
		Else
			SetColdGlobals(0, 0)
		EndIf
	Else
		SetColdGlobals(0, 0)
	EndIf
	_WetQuest.CurrentTime = _WetQuest.GameHour.GetValue() as Int
	_WetQuest.ScanArea()
EndFunction

;====================================================================================

Function SetInteriorVars()
	SetColdGlobals(0, 0)
	_WetIsIndoors.SetValue(1)
	_WetQuest.IsIndoorsStart = True
	_WetQuest.InVanillaCold = False
	_WetQuest.InVanillaColdTimed = False
EndFunction

Function CheckInteriorStart()
	CurrentWorld = targ.GetWorldSpace() as Form
	If !IsInTrueInterior()
		_WetIsIndoors.SetValue(0)
		If _WetQuest.IsIndoorsStart
			_WetQuest.IsIndoorsUpdate = False
		Else
			_WetQuest.IsIndoorsStart = False
		EndIf
		CheckExterior()
	Else
		SetInteriorVars()
	EndIf
EndFunction

Function CheckInteriorUpdate()
	CurrentWorld = targ.GetWorldSpace() as Form
	If !IsInTrueInterior()
		_WetIsIndoors.SetValue(0)
		_WetQuest.IsIndoorsUpdate = False
		CheckExterior()
	Else
		SetInteriorVars()
		Utility.Wait(1.0)
	EndIf
	_WetQuest.IsIndoorsStart = _WetQuest.IsIndoorsUpdate
EndFunction

;====================================================================================

Function GoHome()
	If !_WetQuest.IsIndoorsStart && !_WetQuest.IsIndoorsUpdate
		_WetQuest._WetGoHomeRainAllQuest.Stop()
		_WetQuest._WetGoHomeRainQuest.Stop()
		_WetQuest._WetGoHomeBlizzQuest.Stop()
		Utility.Wait(0.1)
	EndIf
	If !_WetQuest.IgnoreWorkersOn
		_WetQuest._WetGoHomeRainAllQuest.Start()
	Else
		_WetQuest._WetGoHomeRainQuest.Start()
	EndIf
	_WetQuest._WetGoHomeBlizzQuest.Start()
EndFunction

;====================================================================================

Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	If ShelterDetect
		If targ == _WetQuest.PlayerRef
			GoToState("ShelterDetectPlayer")
		Else
			GoToState("ShelterDetectNPC")
		EndIf
	Else
		GoToState("Polling")
	EndIf
EndEvent

;====================================================================================

State Polling

	Event OnBeginState()
		CheckInteriorStart()
		RegisterForSingleUpdate(10.0)
	EndEvent

	Event OnUpdate()
		If !ChangedLoc
			CheckInteriorUpdate()
		EndIf
		RegisterForSingleUpdate(9.0)
	EndEvent

	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		ChangedLoc = True
		Utility.Wait(0.075)
		CheckInteriorUpdate()
		GoHome()
		ChangedLoc = False
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		SetInteriorVars()
		_WetQuest.IsIndoorsUpdate = True
		GoToState("Dead")
	EndEvent

EndState

;====================================================================================

Function CastDetectSpell()
	Shooter.MoveTo(targ, 0.0, 0.0, 200.0, false)
	Detector.MoveTo(targ, 0.0, 0.0, 1000.0, false)
	Utility.Wait(0.25)
	_WetShelterDetectSpell.Cast(Shooter, Detector)
	RegisterForSingleUpdate(8.0)
EndFunction

State ShelterDetectPlayer

	Event OnBeginState()
		targ.AddToFaction(_WetQuest._WetIsUnderShelterFaction)
		Detector = targ.PlaceAtMe(_WetShelterDetector)
		Shooter = targ.PlaceAtMe(_WetShelterShooter)
		CastDetectSpell()
	EndEvent

	Event OnUpdate()
		CastDetectSpell()
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		Detector.Disable()
		Shooter.Disable()
		Detector.Delete()
		Shooter.Delete()
		targ.RemoveFromFaction(_WetQuest._WetIsUnderShelterFaction)
		GoToState("Dead")
	EndEvent

EndState

State ShelterDetectNPC

	Event OnBeginState()
		targ.AddToFaction(_WetQuest._WetIsUnderShelterFaction)
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		If targ
			targ.RemoveFromFaction(_WetQuest._WetIsUnderShelterFaction)
		EndIf
		GoToState("Dead")
	EndEvent

EndState

State Dead
EndState
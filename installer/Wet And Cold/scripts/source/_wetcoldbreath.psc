Scriptname _WetColdBreath extends activemagiceffect  

;====================================================================================

VisualEffect Property _WetBreath1stVE Auto
VisualEffect Breath
VisualEffect BreathTwo

_WetQuestScript Property _WetQuest Auto

Bool Property Creature Auto

Float Frequency
Float BreathFreq

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

Function Breathe(Float TempFrequency, VisualEffect TempBreath, Bool IsDualBreath = False)
	Frequency = TempFrequency
	Breath = TempBreath
	If !IsDualBreath
		GoToState("CreatureOneBreath")
	Else
		GoToState("CreatureTwoBreath")
	EndIf
EndFunction

Function CreatureRaceCheck()
	Race tRace = targ.GetRace()
	If tRace == _WetQuest.HorseRace || tRace == _WetQuest.CartHorseRace
		BreathTwo = _WetQuest._WetBreathHorseRVE
		Breathe(3.6, _WetQuest._WetBreathHorseLVE, true)
	ElseIf tRace == _WetQuest.DogRace || tRace == _WetQuest.DogCompanionRace || tRace == _WetQuest.WolfRace || tRace == _WetQuest.DA03BarbasDogRace || tRace == _WetQuest.MG07DogRace
		Breathe(1.2, _WetQuest._WetBreathCanineVE)
	ElseIf tRace == _WetQuest.GiantRace || tRace == _WetQuest.C00GiantOutsideWhiterunRace
		Breathe(2.5, _WetQuest._WetBreathGiantVE)
	ElseIf tRace == _WetQuest.BearBlackRace || tRace == _WetQuest.BearBrownRace || tRace == _WetQuest.BearSnowRace
		Breathe(2.15, _WetQuest._WetBreathBearVE)
	ElseIf tRace == _WetQuest.SabreCatRace || tRace == _WetQuest.SabreCatSnowyRace
		Breathe(1.3, _WetQuest._WetBreathSabreVE)
	ElseIf tRace == _WetQuest.FalmerRace
		Breathe(1.3, _WetQuest._WetBreathFalmerVE)
	ElseIf tRace == _WetQuest.WerewolfBeastRace
		Breathe(1.9, _WetQuest._WetBreathWerewolfVE)
	ElseIf targ.HasKeyword(_WetQuest.ActorTypeTroll)
		Breathe(2.6, _WetQuest._WetBreathTrollVE)
	ElseIf tRace == _WetQuest.DragonRace
		BreathTwo = _WetQuest._WetBreathDragonRVE
		Breathe(3.55, _WetQuest._WetBreathDragonLVE, true)
	ElseIf tRace == _WetQuest.CowRace
		BreathTwo = _WetQuest._WetBreathCowLVE
		Breathe(3.4, _WetQuest._WetBreathCowRVE, true)
	ElseIf tRace == _WetQuest.HagravenRace
		Breathe(1.5, _WetQuest._WetBreathHagravenVE)
	Else
		If _WetQuest.DGHuskies
			If HasForm(_WetQuest.DGHuskies, tRace as Form)
				Breathe(1.2, _WetQuest._WetBreathCanineVE)
			ElseIf tRace == _WetQuest.DGCat as Race
				Breathe(1.3, _WetQuest._WetBreathSabreVE)
			EndIf
		EndIf
		If _WetQuest.DBDragon
			If tRace == _WetQuest.DBDragon as Race
				BreathTwo = _WetQuest._WetBreathDragonRVE
				Breathe(3.55, _WetQuest._WetBreathDragonLVE, true)
			ElseIf tRace == _WetQuest.DBWerebear as Race
				Breathe(1.9, _WetQuest._WetBreathWerewolfVE)
			ElseIf tRace == _WetQuest.DBLurker as Race
				Breathe(2.3, _WetQuest._WetBreathLurkerVE)
			ElseIf tRace == _WetQuest.DBBoar as Race || tRace == _WetQuest.DBMountedRiek as Race
				Breathe(1.4, _WetQuest._WetBreathBoarVE)
			ElseIf tRace == _WetQuest.DBRiek as Race || tRace == _WetQuest.DBThirskRiek as Race
				Breathe(1.2, _WetQuest._WetBreathRiekVE)
			EndIf
		EndIf
		targ.AddToFaction(_WetQuest._WetIgnoreFaction)
	EndIf
EndFunction

;====================================================================================
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	If Creature
		CreatureRaceCheck()
	Else
		GoToState("Player1stPerson")
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	GoToState("Dead")
EndEvent

;====================================================================================

State Player1stPerson

	Event OnBeginState()
		OnUpdate()
	EndEvent

	Event OnUpdate()
		_WetBreath1stVE.Play(targ, 1.2)
		_WetBreath1stVE.Play(targ, 1.2)
		RegisterForSingleUpdate(2.4)	
	EndEvent

EndState

;====================================================================================

State CreatureOneBreath

	Event OnBeginState()
		BreathFreq = Frequency
		OnUpdate()
	EndEvent

	Event OnUpdate()
		If targ
			Breath.Play(targ, 1.2)
			Breath.Play(targ, 1.2)
			RegisterForSingleUpdate(BreathFreq)
		EndIf	
	EndEvent

	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		If aeCombatState == 1
			BreathFreq = Frequency / 1.5
		Else
			BreathFreq = Frequency
		EndIf
	EndEvent

	Event OnDying(Actor akKiller)
		OnEffectFinish(targ, targ)
	EndEvent

EndState

State CreatureTwoBreath

	Event OnBeginState()
		BreathFreq = Frequency
		OnUpdate()
	EndEvent

	Event OnUpdate()
		If targ
			Breath.Play(targ, 1.2)
			BreathTwo.Play(targ, 1.2)
			Breath.Play(targ, 1.2)
			BreathTwo.Play(targ, 1.2)
			RegisterForSingleUpdate(BreathFreq)
		EndIf
	EndEvent

	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		If aeCombatState == 1
			BreathFreq = Frequency / 1.5
		Else
			BreathFreq = Frequency
		EndIf
	EndEvent

	Event OnDying(Actor akKiller)
		OnEffectFinish(targ, targ)
	EndEvent

EndState

State Dead
EndState
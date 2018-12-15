Scriptname _WetGoHome extends activemagiceffect  

;====================================================================================

_WetQuestScript Property _WetQuest Auto

Bool Property GoHomeBlizz Auto
Bool Property GoHomeRain Auto

;====================================================================================

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If GoHomeBlizz
		GoToState("GoHomeBlizz")
	ElseIf GoHomeRain
		GoToState("GoHomeRain")
	Else
		GoToState("IsBlizzard")
	EndIf
EndEvent

;====================================================================================

State GoHomeRain

	Event OnBeginState()
		If !_WetQuest.IgnoreWorkersOn
			_WetQuest._WetGoHomeRainAllQuest.Start()
		Else
			_WetQuest._WetGoHomeRainQuest.Start()
		EndIf
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		_WetQuest._WetGoHomeRainQuest.Stop()
		_WetQuest._WetGoHomeRainAllQuest.Stop()
	EndEvent

EndState

State GoHomeBlizz

	Event OnBeginState()
		_WetQuest._WetGoHomeBlizzQuest.Start()
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		_WetQuest._WetGoHomeBlizzQuest.Stop()
	EndEvent

EndState

;====================================================================================

State IsBlizzard

	Event OnBeginState()
		_WetQuest._WetIsBlizzarding.SetValue(1)
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		_WetQuest._WetIsBlizzarding.SetValue(0)
	EndEvent

EndState
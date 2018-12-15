Scriptname _WetColdBreathFrigid extends activemagiceffect  

;====================================================================================

VisualEffect Property Breath Auto

_WetQuestScript Property _WetQuest Auto

Float Property Interval = 1.2 Auto

Actor targ

;====================================================================================
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	If targ == _WetQuest.PlayerRef
		GoToState("Alive")
	Else
		GoToState("AliveNPC")
	EndIf
EndEvent

;====================================================================================

State Alive

	Event OnBeginState()
		OnUpdate()
	EndEvent

	Event OnUpdate()
		If targ
			Breath.Play(targ, 1.2)
			Breath.Play(targ, 1.2)
			RegisterForSingleUpdate(Interval)
		EndIf
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		GoToState("Dead")
	EndEvent

EndState

State AliveNPC

	Event OnBeginState()
		OnUpdate()
	EndEvent

	Event OnUpdate()
		If targ
			Breath.Play(targ, 1.2)
			Breath.Play(targ, 1.2)
			RegisterForSingleUpdate(Interval)
		EndIf
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		GoToState("Dead")
	EndEvent

	Event OnDying(Actor akKiller)
		OnEffectFinish(targ, targ)
	EndEvent

EndState

State Dead
EndState
Scriptname _WetEyeBlur extends activemagiceffect  

;====================================================================================

ImageSpaceModifier Property _WetEyeBlurImod Auto
ImageSpaceModifier Property _WetEyeBlurBlackImod Auto
ImageSpaceModifier Property _WetAshWateryEyesImod Auto

_WetQuestScript Property _WetQuest Auto

Bool Property Ash Auto

Actor targ

;====================================================================================
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	If !Ash
		If _WetQuest._WetIsBlizzarding.GetValue() as Int == 1
			GoToState("Blizz")
		Else
			GoToState("Rain")
		EndIf
	Else
		GoToState("Ash")
	EndIf
EndEvent

;====================================================================================

State Rain

	Event OnBeginState()
		RegisterForSingleUpdate(Utility.RandomFloat(0.1, 8.0))
	EndEvent

	Event OnUpdate()
		If _WetQuest.EyeBlack
			_WetEyeBlurBlackImod.Apply()
		Else
			_WetEyeBlurImod.Apply()
		EndIf
		RegisterForSingleUpdate(Utility.RandomFloat(0.1, 8.0))
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		_WetEyeBlurBlackImod.Remove()
		_WetEyeBlurImod.Remove()
		GoToState("Dead")
	EndEvent

EndState

;====================================================================================

State Blizz

	Event OnBeginState()
		RegisterForSingleUpdate(Utility.RandomFloat(0.1, 8.0))
	EndEvent

	Event OnUpdate()
		If _WetQuest.EyeBlackBlizz
			_WetEyeBlurBlackImod.Apply()
		Else
			_WetEyeBlurImod.Apply()
		EndIf
		RegisterForSingleUpdate(Utility.RandomFloat(0.1, 8.0))
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		_WetEyeBlurBlackImod.Remove()
		_WetEyeBlurImod.Remove()
		GoToState("Dead")
	EndEvent

EndState

State Ash

	Event OnBeginState()
		_WetQuest.AshWatery = True
		_WetAshWateryEyesImod.ApplyCrossFade(5.0)
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		_WetQuest.AshWatery = False
		ImageSpaceModifier.RemoveCrossFade(5.0)
		Utility.Wait(5.0)
		If !_WetQuest.AshWatery
			_WetAshWateryEyesImod.Remove()
		EndIf
		GoToState("Dead")
	EndEvent

EndState

State Dead
EndState

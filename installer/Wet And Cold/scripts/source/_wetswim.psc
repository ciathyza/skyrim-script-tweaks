Scriptname _WetSwim extends activemagiceffect  

;====================================================================================

_WetQuestScript Property _WetQuest Auto

Bool Property SwimWetFeet Auto

Actor targ

;====================================================================================

Function PlayDrip(GlobalVariable Toggle)
	_WetQuest._WetDripSwimShader.Play(targ, 9.0)
	If _WetQuest.IsInCold && Toggle.GetValue() as Int == 1
		_WetQuest._WetSnowSwimShader.Play(targ, 0.1)
	EndIf
EndFunction

;====================================================================================
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	If SwimWetFeet
		GoToState("SwimWetFeet")
	Else
		GoToState("SwimDrips")
	EndIf
EndEvent

;====================================================================================

State SwimDrips

	Event OnBeginState()
		_WetQuest._WetDripSwimShader.Stop(targ)
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		If targ
			If targ != _WetQuest.PlayerRef
				If _WetQuest._WetDripActorToggle.GetValue() as Int == 1 && targ.Is3DLoaded()
					PlayDrip(_WetQuest._WetSnowActorToggle)
				EndIf
				If _WetQuest._WetFootWetActorToggle.GetValue() as Int == 1 && targ.Is3DLoaded()
					targ.AddToFaction(_WetQuest._WetFootWetFaction)
					targ.AddSpell(_WetQuest._WetNPCSwimWetFeetSpell, false)
				EndIf
			Else
				If _WetQuest._WetDripPlayerToggle.GetValue() as Int == 1
					PlayDrip(_WetQuest._WetSnowPlayerToggle)
				EndIf
				If _WetQuest._WetFootWetPlayerToggle.GetValue() as Int == 1
					targ.AddToFaction(_WetQuest._WetFootWetFaction)
					targ.AddSpell(_WetQuest._WetNPCSwimWetFeetSpell, false)
				EndIf
			EndIf
		EndIf
		GoToState("Dead")
	EndEvent

EndState

;====================================================================================

State SwimWetFeet

	Event OnBeginState()
		RegisterForSingleUpdate(6.0)
	EndEvent
	
	Event OnUpdate()
		targ.RemoveFromFaction(_WetQuest._WetFootWetFaction)
		targ.RemoveSpell(_WetQuest._WetNPCSwimWetFeetSpell)
		GoToState("Dead")
	EndEvent
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		OnUpdate()
	EndEvent

EndState

State Dead
EndState
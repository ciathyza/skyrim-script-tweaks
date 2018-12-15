Scriptname _WetFootWet extends activemagiceffect  

ImpactDataSet FootImpact

_WetQuestScript Property _WetQuest Auto

Actor targ

;====================================================================================
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	targ = akTarget
	FootImpact = _WetQuest._WetFootWetSoundIPDS
	RegisterForAnimationEvent(targ, "FootLeft")
	RegisterForAnimationEvent(targ, "FootRight")
	If targ == _WetQuest.PlayerRef
		RegisterForAnimationEvent(targ, "JumpUp")
		RegisterForAnimationEvent(targ, "JumpDown")
		GoToState("Alive")
	Else
		GoToState("AliveNPC")
	EndIf
EndEvent

;====================================================================================

State Alive

	Event OnAnimationEvent(ObjectReference aktarg, String EventName)
		If targ
			If EventName == "FootLeft"
				targ.PlayImpactEffect(FootImpact, "NPC L Calf [LClf]")
			ElseIf EventName == "FootRight"
				targ.PlayImpactEffect(FootImpact, "NPC R Calf [RClf]")
			Else
				targ.PlayImpactEffect(FootImpact, "NPC L Calf [LClf]")
				targ.PlayImpactEffect(FootImpact, "NPC R Calf [RClf]")
			EndIf
		EndIf
	EndEvent

	Event OnDying(Actor akKiller)
		GoToState("Dead")
	EndEvent

EndState

;====================================================================================

State AliveNPC

	Event OnAnimationEvent(ObjectReference aktarg, String EventName)
		If targ
			If EventName == "FootLeft"
				targ.PlayImpactEffect(FootImpact, "NPC L Calf [LClf]")
			Else
				targ.PlayImpactEffect(FootImpact, "NPC R Calf [RClf]")
			EndIf
		EndIf
	EndEvent

	Event OnDying(Actor akKiller)
		GoToState("Dead")
	EndEvent

EndState

State Dead
EndState
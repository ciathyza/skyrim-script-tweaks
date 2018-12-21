Scriptname SFL4_TimedBlock_Script extends activemagiceffect  

; -----

Spell Property SFL_TimedBlock_Spell_Proc Auto
MagicEffect Property SFL_TimedBlock_Effect_Lockout Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(PlayerRef, "blockStartOut")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "blockStartOut" && !PlayerRef.HasMagicEffect(SFL_TimedBlock_Effect_Lockout) && akSource == PlayerRef
		SFL_TimedBlock_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	RegisterForAnimationEvent(PlayerRef, "blockStartOut")

EndEvent

; -----
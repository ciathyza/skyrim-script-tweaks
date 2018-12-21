Scriptname SFL4_InjuryApplied_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Message Property SFL_Injury_Message_Taken Auto
Message Property SFL_Injury_Message_Dealt Auto
ImagespaceModifier Property GetHit Auto
GlobalVariable Property SFL4_Injury_Global_SquelchMessage_Toggle Auto
Spell Property SFL_Injury_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If SFL4_Injury_Global_SquelchMessage_Toggle.GetValue() == 0

		If akTarget == PlayerRef
			SFL_Injury_Message_Taken.Show()
			GetHit.Apply()

		ElseIf (PlayerRef.IsInCombat() && PlayerRef.GetCombatTarget() == akTarget) || (akTarget.IsInCombat() && akTarget.GetCombatTarget() == PlayerRef)
			SFL_Injury_Message_Dealt.Show()

		EndIf
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akTarget.GetActorValuePercentage("Health") >= 1.0
		akTarget.DispelSpell(SFL_Injury_Spell)
	EndIf

EndEvent

; -----
Scriptname SFL4_ApplyInjury_Script extends activemagiceffect  

; -----

Spell[] Property SFL_Injury_Spell Auto
Sound Property SFL4_Injury_Marker Auto
Actor Property PlayerRef Auto
GlobalVariable Property SFL4_Injury_Global_Chance_NPC Auto
GlobalVariable Property SFL4_Injury_Global_Chance_PC Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget == PlayerRef
		If Utility.RandomFloat(0.0, 100.0) < SFL4_Injury_Global_Chance_PC.GetValue()
			SFL4_Injury_Marker.Play(akTarget)
			SFL_Injury_Spell[Utility.RandomInt(0, SFL_Injury_Spell.Length - 1)].Cast(akTarget)
		EndIf
	Else
		If Utility.RandomFloat(0.0, 100.0) < SFL4_Injury_Global_Chance_NPC.GetValue()
			SFL4_Injury_Marker.Play(akTarget)
			SFL_Injury_Spell[Utility.RandomInt(0, SFL_Injury_Spell.Length - 1)].Cast(akTarget)
		EndIf
	EndIf

EndEvent

; -----
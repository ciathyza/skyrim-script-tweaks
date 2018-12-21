Scriptname SFL4_ApplyInjuriousBlow_Script extends activemagiceffect  

; -----

Spell Property WCT_InjuriousBlow_Spell Auto
GlobalVariable Property WCT_Ability_Global_InjuryChance_Threshold Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If Utility.RandomInt(0,99) < WCT_Ability_Global_InjuryChance_Threshold.GetValue()
		WCT_InjuriousBlow_Spell.Cast(akTarget)
	EndIf

EndEvent

; -----
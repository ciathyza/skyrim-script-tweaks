Scriptname SFL4_InjuriousBlow_Script extends activemagiceffect  

; -----

Spell[] Property WCT_Injuries Auto
Sound Property WCT_Injury_Marker Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell InjuryToApply = WCT_Injuries[Utility.RandomInt(0, WCT_Injuries.Length - 1)]
	InjuryToApply.Cast(akTarget)
	WCT_Injury_Marker.Play(akTarget)

EndEvent

; -----
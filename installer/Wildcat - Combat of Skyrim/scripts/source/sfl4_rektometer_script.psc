Scriptname SFL4_RektOMeter_Script extends activemagiceffect  

; -----

GlobalVariable Property WCT_Ability_Global_InjuryHealthPct_RektOMeter Auto
Spell Property WCT_InjuriousBlow_Spell Auto
Float Property WCT_UpdateRate Auto
Actor Property PlayerRef Auto
GlobalVariable Property WCT_Ability_Global_InjuryRektOMeter_Chance Auto

; -----

Actor TheTarget
Float HealthPct
Float LastHealthPct

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	LastHealthPct = akTarget.GetActorValuePercentage("Health")
	RegisterForSingleUpdate(WCT_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	HealthPct = TheTarget.GetActorValuePercentage("Health")
	If HealthPct <= (LastHealthPct * (100 - WCT_Ability_Global_InjuryHealthPct_RektOMeter.Value)/100) && (Utility.RandomInt(0,99) < WCT_Ability_Global_InjuryRektOMeter_Chance.Value)
		LastHealthPct = HealthPct				; this is faster
		RegisterForSingleUpdate(WCT_UpdateRate)
		WCT_InjuriousBlow_Spell.Cast(TheTarget)
	Else
		LastHealthPct = HealthPct
		RegisterForSingleUpdate(WCT_UpdateRate)
	EndIf

EndEvent

; -----
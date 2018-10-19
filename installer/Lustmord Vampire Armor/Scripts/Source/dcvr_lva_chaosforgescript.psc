Scriptname DCVR_LVA_ChaosForgeScript extends ActiveMagicEffect  


ObjectReference Property ChaosForge  Auto
Actor Property PlayerRef  Auto




Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (akCaster == PlayerRef)
		ChaosForge.Activate(akCaster)

	EndIf

EndEvent
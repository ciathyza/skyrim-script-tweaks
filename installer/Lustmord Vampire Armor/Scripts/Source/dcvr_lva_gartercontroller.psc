Scriptname DCVR_LVA_GarterController extends ActiveMagicEffect  


Actor Property PlayerRef  Auto
Spell Property GarterPouch  Auto




Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (akCaster == PlayerRef)
		PlayerRef.AddSpell(GarterPouch, False)

	EndIf

EndEvent




Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If (akCaster == PlayerRef)
		PlayerRef.RemoveSpell(GarterPouch)

	EndIf

EndEvent
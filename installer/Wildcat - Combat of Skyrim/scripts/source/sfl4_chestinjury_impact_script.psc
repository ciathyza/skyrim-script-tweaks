Scriptname SFL4_ChestInjury_Impact_Script extends activemagiceffect  

; ------

Float Property SFL_Fraction Auto
String Property SFL_String Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DamageActorValue(SFL_String, akTarget.GetActorValue(SFL_String) * SFL_Fraction)

EndEvent

; ------

Scriptname FWTest_CastSpell extends activemagiceffect  

spell property TestSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if TestSpell!=none
		TestSpell.cast(akCaster, akTarget)
	endif
endEvent
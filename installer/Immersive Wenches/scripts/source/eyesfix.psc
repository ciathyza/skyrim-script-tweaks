Scriptname eyesfix extends activemagiceffect
{Fixes eye bug from invisibility effect}

Spell Property InvisibilityEyesFixSpell auto

EVENT OnEffectFinish(Actor Target, Actor Caster)
	Target.AddSpell(InvisibilityEyesFixSpell, False)
endEVENT
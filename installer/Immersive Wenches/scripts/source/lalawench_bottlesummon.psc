Scriptname lalawench_bottlesummon extends activemagiceffect  

ACTORBASE PROPERTY lalawench_wench AUTO
Explosion Property wispDeathExplosion Auto

Actor CasterRef

Event OnEffectStart(Actor Target, Actor Caster)
	CasterRef = Caster
	Caster.placeAtMe(lalawench_wench)
	Caster.placeAtMe(wispDeathExplosion)
EndEvent
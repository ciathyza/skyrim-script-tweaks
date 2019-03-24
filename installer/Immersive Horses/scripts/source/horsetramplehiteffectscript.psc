; Immersive Horses by sevencardz.
ScriptName HorseTrampleHitEffectScript extends ActiveMagicEffect
{Effect cast on actors who get trampled by a horse.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	IHOUtil.HorseKick(akCaster, akTarget)
EndEvent

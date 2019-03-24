; Immersive Horses by sevencardz.
ScriptName HorseJumpKickEffectScript extends ActiveMagicEffect
{Effect cast on actors who get hit by a horse's jump kick or landing.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	IHOUtil.HorseKick(akCaster, akTarget)
EndEvent

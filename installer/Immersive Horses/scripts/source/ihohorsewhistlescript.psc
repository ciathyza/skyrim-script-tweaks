; Immersive Horses by sevencardz.
ScriptName IHOHorseWhistleScript extends ActiveMagicEffect
{Effect attached to the Horse Whistle lesser power.}

Quest Property IHOConfigMenuQuest Auto
IHOConfigMenuScript MCM = None

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MCM = IHOConfigMenuQuest as IHOConfigMenuScript
	MCM.HorseWhistle(MCM.PlayerHorseRef)
EndEvent

; Immersive Horses by sevencardz.
ScriptName IHOHorseListMenuScript extends ActiveMagicEffect
{Effect attached to the Horse Menu lesser power.}

Quest Property IHOConfigMenuQuest Auto
IHOConfigMenuScript MCM = None

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MCM = IHOConfigMenuQuest as IHOConfigMenuScript
	MCM.UpdateHorseListMenu()
	MCM.ShowHorseListMenu()
EndEvent

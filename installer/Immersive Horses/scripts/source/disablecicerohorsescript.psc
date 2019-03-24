; Immersive Horses by sevencardz
ScriptName DisableCiceroHorseScript extends Actor
{Disables Cicero's Horse PROPERLY at the end of the "Delayed Burial" quest.}

Quest Property DB01Misc Auto

Event OnLoad()
	if DB01Misc.IsCompleted()
		if !IsBeingRidden()
			Disable()
		endIf
	endIf
EndEvent

Event OnUnload()
	if DB01Misc.IsCompleted()
		if !IsBeingRidden()
			Disable()
		endIf
	endIf
EndEvent

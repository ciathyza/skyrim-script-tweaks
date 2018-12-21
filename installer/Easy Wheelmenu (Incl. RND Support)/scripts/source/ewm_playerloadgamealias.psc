Scriptname EWM_PlayerLoadGameAlias extends ReferenceAlias  
{
	Setup initialisation and maintainance.
}

Import EasyWheelAPI

Bool DoReset = false

Event OnInit()
	DoReset = true
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnPlayerLoadGame()
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnUpdate()
	if !GetAPI()
		RegisterForSingleUpdate(0.2)
	else
		CheckMods()
		if DoReset
			DoReset = false
			ResetConfig()
		endif
	endif
EndEvent
Scriptname CCO_FurnitureAnimationScript extends ObjectReference  

Actor Property PlayerRef Auto

Event OnActivate(ObjectReference akActionRef)
	Game.ForceThirdPerson()
	Game.DisablePlayerControls(false, false, true, false, false, false, false)
	RegisterForSingleUpdate(2)
EndEvent

Event OnUpdate()
	If PlayerRef.GetSitState() == 0
		Game.EnablePlayerControls()
		Self.Disable()
		Self.Delete()
	Else
		RegisterForSingleUpdate(2)
	EndIf
EndEvent

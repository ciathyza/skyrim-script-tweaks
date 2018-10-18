Scriptname HeadtrackingPlayerAliasScript extends ReferenceAlias  

GlobalVariable Property HeadtrackingUninstall Auto
Quest Property Headtracking Auto
HeadTrackingScript QuestScript
Actor Property PlayerRef Auto

Event OnRaceSwitchComplete()
	QuestScript = Headtracking as HeadTrackingScript
	If PlayerRef.IsWeaponDrawn() == False && PlayerRef.GetAnimationVariableBool("bIsRiding") == False && PlayerRef.GetAnimationVariableBool("IsFirstPerson") == False && QuestScript.TrackingProp && HeadtrackingUninstall.GetValueInt() == 0
		PlayerRef.SetAnimationVariableInt("IsNPC", 1)
		QuestScript.CurrentTargetProp = PlayerRef
	EndIf
EndEvent

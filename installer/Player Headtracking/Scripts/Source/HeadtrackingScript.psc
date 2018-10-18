Scriptname HeadtrackingScript extends Quest  

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor                      Property PlayerRef               Auto
Actor[]                    Property TrackTargets            Auto
GlobalVariable             Property HeadtrackingExpressions Auto
GlobalVariable             Property HeadtrackingTimer       Auto
Quest                      Property Headtracking            Auto
HeadtrackingTargetScript[] Property TrackScripts            Auto Hidden
Int                        Property Version                 Auto Hidden
Int[]                      Property TrackPriority           Auto Hidden


; -------------------------------------------------------------------------------------------------
; Computed Properties
; -------------------------------------------------------------------------------------------------

;Custom defined property to leave previous value of Tracking intact
Bool Property TrackingProp
	Function set(bool value)
		Tracking = value
	EndFunction
	bool Function get()
		return Tracking
	EndFunction
EndProperty

;Custom defined property to leave previous value of CurrentTarget intact
Actor Property CurrentTargetProp
	Function set(Actor value)
		CurrentTarget = value
	EndFunction
	Actor Function get()
		return CurrentTarget
	EndFunction
EndProperty


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Actor CurrentTarget
Actor NewTarget
Bool  Revaluate
Bool  Tracking
Float Angle
Float NewAngle
Int   Index2
Int   Relation
Int   TargetIndex


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnInit()
	TrackPriority = New Int[15]
	TrackScripts = New HeadtrackingTargetScript[15]
	TrackTargets = New Actor[15]

	Int Index = 0
	While (Index < 15)
		TrackTargets[Index] = PlayerRef
		Index += 1
	EndWhile

	Version = 33
	GoToState("")
	RegisterForSingleUpdate(0.1)
EndEvent


Event OnUpdate()
	if (PlayerRef.IsWeaponDrawn() || PlayerRef.GetAnimationVariableBool("bIsRiding") || PlayerRef.GetAnimationVariableBool("IsFirstPerson")) && Tracking == False
		RegisterForSingleUpdate(0.5)
		Return
	ElseIf (PlayerRef.IsWeaponDrawn() || PlayerRef.GetAnimationVariableBool("bIsRiding") || PlayerRef.GetAnimationVariableBool("IsFirstPerson")) && Tracking
		Tracking = False
		PlayerRef.SetAnimationVariableInt("IsNPC", 0)
		RegisterForSingleUpdate(0.5)
		Return
	Elseif PlayerRef.IsWeaponDrawn() == False && PlayerRef.GetAnimationVariableBool("bIsRiding") == False && PlayerRef.GetAnimationVariableBool("IsFirstPerson") == False && Tracking == False
		Tracking = True
		PlayerRef.SetAnimationVariableInt("IsNPC", 1)
	EndIf

	PlayerRef.ClearLookAt()
	Index2 = 0
	Angle = 90
	NewTarget = PlayerRef

	While TrackTargets[index2] != PlayerRef && Index2 < 14
		NewAngle = Math.Abs(PlayerRef.GetHeadingAngle(TrackTargets[index2]))
		If TrackTargets[index2].IsInDialogueWithPlayer()
			NewAngle -= 90
			TrackPriority[index2] = 100
		EndIf
		If NewAngle < 90
			NewAngle -= TrackPriority[index2]
			if NewAngle < Angle
				If Math.Abs(PlayerRef.GetPositionZ() - TrackTargets[index2].GetPositionZ()) < 150
					Angle = NewAngle
					NewTarget = TrackTargets[index2]
					TargetIndex = index2
				EndIf
			EndIf
		EndIf
		Index2 += 1
	EndWhile

	If NewTarget != CurrentTarget
		PlayerRef.ClearLookAt()
		PlayerRef.SetLookAt(NewTarget)
		Relation = NewTarget.GetRelationshipRank(PlayerRef)
		If Relation == 0 || NewTarget == PlayerRef
			PlayerRef.ClearExpressionOverride()
		ElseIf Relation > 0 && HeadtrackingExpressions.GetValue()
			PlayerRef.SetExpressionOverride(10, (Relation * 0.3 * HeadtrackingExpressions.GetValue()) as Int)
		ElseIf Relation < 0 && HeadtrackingExpressions.GetValue()
			PlayerRef.SetExpressionOverride(8, (Relation * -0.5 * HeadtrackingExpressions.GetValue()) as Int)
		EndIf
		CurrentTarget = NewTarget
		Revaluate = True
	EndIf

	if Revaluate
		If HeadtrackingTimer.GetValue() && TrackPriority[TargetIndex] != 100 && CurrentTarget != PlayerRef
			Revaluate = False
			TrackScripts[TargetIndex].RegisterForSingleUpdate(HeadtrackingTimer.GetValue())
		EndIf
	EndIf
	
	RegisterForSingleUpdate(0.01)
EndEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

Function AddTarget(Actor akTarget, HeadtrackingTargetScript htScript, Int aiPriority = 0)
	int Index = 0
	While TrackTargets[index] != PlayerRef && TrackTargets[index] != akTarget && index < 14
		Index += 1
	EndWhile
	If Index < 14
		TrackTargets[Index] = akTarget
		TrackPriority[Index] = aiPriority
		TrackScripts[Index] = htScript
	EndIf
EndFunction


Function RemoveTarget(Actor akTarget)
	int Index = 0
	While TrackTargets[Index] != akTarget && TrackTargets[index] != PlayerRef && index < 14
		Index += 1
	EndWhile
	While TrackTargets[Index + 1] != PlayerRef && Index < 14
		TrackTargets[Index] = TrackTargets[Index + 1]
		TrackPriority[Index] = TrackPriority[Index + 1]
		TrackScripts[Index] = TrackScripts[Index + 1]
		Index += 1
	EndWhile
	if Index < 14
		TrackTargets[Index] = PlayerRef
		TrackPriority[Index] = 0
		TrackScripts[Index] = None
	EndIf
EndFunction


Function ModifyPriority(Actor akTarget, Int aiPriority)
	Int Index = 0
	While TrackTargets[index] != PlayerRef && TrackTargets[Index] != akTarget && Index < 14
		Index += 1
	EndWhile
	If TrackTargets[index] != PlayerRef && Index < 14
		TrackPriority[Index] = aiPriority
		EndIf
	if akTarget == CurrentTarget && aiPriority == 0
		Revaluate = True
	EndIf
EndFunction


; -------------------------------------------------------------------------------------------------
; States
; -------------------------------------------------------------------------------------------------

State Uninstalled
	Event OnUpdate()
		PlayerRef.SetAnimationVariableInt("IsNPC", 0)
		PlayerRef.ClearExpressionOverride()
	EndEvent
EndState

Scriptname CustomizableCameraRunner extends ReferenceAlias

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor Property PlayerRef Auto
CustomizableCamera Property CC Auto


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

Function OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	CC.DetectRanged()
	If CC.View_Mode_ON == False && PlayerRef.IsWeaponDrawn() == 0
		CC.ApplyALLCam()
	EndIf
EndFunction


Function OnObjectUnEquipped(Form akBaseObject, ObjectReference akReference)
	CC.DetectRanged()
	If CC.View_Mode_ON == False && CC.isRanged == False
		CC.ApplyALLCam()
	EndIf
EndFunction

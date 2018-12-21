;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname defe_TIF__031376C6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DefeatConfig.Log("  SOValueGuard.GetValueInt() - "+SOValueGuard.GetValueInt())
Defeat.Player.Additem(Gold, SOValueGuard.GetValueInt())
Defeat.SOHandOver((LastInSack.GetReference() As Actor), AkSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property Defeat Auto
MiscObject Property Gold Auto
GlobalVariable Property SOValueGuard Auto
ReferenceAlias Property LastInSack Auto

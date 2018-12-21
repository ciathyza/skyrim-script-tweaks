;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Defe_TIF__03134BAA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
LastInSackAggressor.ForceRefTo(AkSpeaker)
Defeat.SOSetProstituteReward(AkSpeaker, SOValuePimp.GetValueInt())
SOProstitute.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property Defeat Auto
ReferenceAlias Property LastInSackAggressor Auto
GlobalVariable Property SOValuePimp Auto
Scene Property SOProstitute Auto

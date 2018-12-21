;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname FW_ChildDialDontSleep2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
FWChildActor akSpeaker = akSpeakerRef as FWChildActor
;BEGIN CODE
(akSpeaker as FWChildActor).Order_DontSleepNow()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

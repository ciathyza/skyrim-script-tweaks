;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_RRadd TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(RentFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property RentFaction  Auto
;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname lalawench_homescript2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_16
Function Fragment_16(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(homefaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property homefaction  Auto

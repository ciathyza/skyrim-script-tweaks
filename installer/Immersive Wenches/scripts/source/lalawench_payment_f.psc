;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname lalawench_payment_F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().RemoveItem(Gold001, 1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

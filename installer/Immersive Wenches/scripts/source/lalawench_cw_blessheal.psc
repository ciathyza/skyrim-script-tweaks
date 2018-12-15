;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_blessheal Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lalawench_CW_BlessFullheal.Cast(PlayerRef,PlayerRef)
utility.wait(4.0)
akSpeaker.PlayIdle(OffSetStop)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Spell Property lalawench_CW_BlessFullheal Auto
Actor Property PlayerRef auto


Idle property OffSetStop auto

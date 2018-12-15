;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_SMYE Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().RemoveItem(Gold001, 100)
Game.getplayer().AddItem(lalawench_bottle_handler, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property lalawench_bottle_handler  Auto  

MiscObject Property Gold001  Auto

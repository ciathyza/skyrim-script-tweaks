;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_DR Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().RemoveItem(Gold001, 15)
Game.getplayer().AddItem(lalawenchsellingdrinks, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property lalawenchsellingdrinks  Auto  

MiscObject Property Gold001  Auto

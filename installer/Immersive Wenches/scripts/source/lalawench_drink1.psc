;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lalawench_drink1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().RemoveItem(Gold001, 300)
Game.getplayer().AddItem(lalawench_A1lalaback, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto 

Potion Property lalawench_A1lalaback  Auto 

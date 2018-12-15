;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lalawench_CW_follow Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(lalawench_CW_followingwenches)
akSpeaker.SetExpressionOverride(1, 60)
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property lalawench_CW_followingwenches Auto

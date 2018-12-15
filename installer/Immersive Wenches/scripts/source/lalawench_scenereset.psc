;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_scenereset Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lalawench_scene_serving.Reset()
lalawench_scene_cheers.Reset()
lalawench_scene_thanks.Reset()
lalawench_follower_quest.Reset()
lalawench_homework_quest.Reset()
lalawench_misc_quest.Reset()
lalawench_spouse_quest.Reset()
Debug.notification("Immersive Wenches scenes reseted.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property lalawench_scene_serving  Auto
Quest Property lalawench_scene_cheers  Auto
Quest Property lalawench_scene_thanks  Auto
Quest Property lalawench_follower_quest  Auto
Quest Property lalawench_homework_quest  Auto
Quest Property lalawench_misc_quest  Auto
Quest Property lalawench_spouse_quest  Auto

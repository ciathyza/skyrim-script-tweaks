;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_startQ_W Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
utility.wait(1.0)
lalawench_CW_Main_WenchQ.SetStage(10)
lalawench_CW_Main_WenchQ.SetObjectiveDisplayed(10, true)
utility.wait(1.0)
lalawench_CW_Main_Radiant.SetObjectiveCompleted(10,1)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(10, false)
lalawench_CW_Main_Radiant.SetStage(20)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(20,true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ACTORBASE PROPERTY lalawench_CW_captured_Wench AUTO
Quest Property lalawench_CW_Main_Radiant Auto
Quest Property lalawench_CW_Main_WenchQ Auto

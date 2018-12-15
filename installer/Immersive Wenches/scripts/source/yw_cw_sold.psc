;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname YW_CW_sold Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(lalawench_CW_followingwenches)
akSpeaker.SetExpressionOverride(1, 80)
akSpeaker.EvaluatePackage()
utility.wait(1.0)
       ;lalawench_CW_Main_Radiant.SetObjectiveCompleted(30,1)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(30, false)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(41, true, true)
       lalawench_CW_Main_Radiant.SetStage(41)
Utility.Wait(2.0)
   akSpeaker.Say(TopicToSay)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest property lalawench_CW_Main_Radiant auto
faction property lalawench_CW_followingwenches auto
Topic Property TopicToSay  Auto  

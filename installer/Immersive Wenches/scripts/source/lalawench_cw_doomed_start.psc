;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_doomed_start Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(lalawench_CW_followingwenches)
akSpeaker.AddToFaction(lalawench_CW_doomed)
akSpeaker.RemoveFromFaction(lalawench_CW_capturedW)
akSpeaker.RemoveFromFaction(dunprisonerfaction)
akSpeaker.SetExpressionOverride(1, 80)
akSpeaker.EvaluatePackage()
;relationship
  akSpeaker.SetRelationshipRank(Game.GetPlayer(), -3)
  Game.GetPlayer().SetRelationshipRank(akSpeaker, -3)
utility.wait(1.0)
       ;lalawench_CW_Main_Radiant.SetObjectiveCompleted(20,1)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(20, false)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(30, true, true)
       lalawench_CW_Main_Radiant.SetStage(30)
Utility.Wait(2.0)
   akSpeaker.Say(TopicToSay)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest property lalawench_CW_Main_Radiant auto
faction property lalawench_CW_capturedW auto
faction property lalawench_CW_followingwenches auto
faction property lalawench_CW_doomed auto
faction property dunprisonerfaction auto
Topic Property TopicToSay  Auto  

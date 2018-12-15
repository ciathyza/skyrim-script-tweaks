;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_doomed_change Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(lalawench_CW_followingwenches)
akSpeaker.RemoveFromFaction(lalawench_CW_doomed)
akSpeaker.SetExpressionOverride(1, 80)
akSpeaker.EvaluatePackage()
;relationship
if akSpeaker.GetRelationshipRank(Game.GetPlayer()) < 3
  akSpeaker.SetRelationshipRank(Game.GetPlayer(), 3)
endif

if Game.GetPlayer().GetRelationshipRank(akSpeaker) < 3
  Game.GetPlayer().SetRelationshipRank(akSpeaker, 3)
endif
utility.wait(1.0)
       ;lalawench_CW_Main_Radiant.SetObjectiveCompleted(30,1)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(30, false)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(40, true, true)
       lalawench_CW_Main_Radiant.SetStage(40)
;Utility.Wait(2.0)
;   debug.notification("help")
;   akSpeaker.Say(TopicToSay)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest property lalawench_CW_Main_Radiant auto
faction property lalawench_CW_followingwenches auto
faction property lalawench_CW_doomed auto
;Topic Property TopicToSay  Auto 

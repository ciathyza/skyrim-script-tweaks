;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_doomed_sold_D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().Additem(Gold001, lalawench_CW_reward_sold.GetValueInt())
lalawench_CW_Main_Radiant.SetObjectiveCompleted(41,1)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(41, false)
       ;lalawench_CW_Main_Radiant.SetObjectiveDisplayed(10, true, true)
utility.wait(2.0)
(capturedwench.getReference() as Actor).SetOutFit(lalawench_CW_capturedwench_clothes)
(capturedwench.getReference() as Actor).AddToFaction(lalawench_CW_Sold)
(capturedwench.getReference() as Actor).AddToFaction(lalawench_CW_NofailW)
(capturedwench.getReference() as Actor).RemoveFromFaction(lalawench_CW_followingwenches)
(capturedwench.getReference() as Actor).SetExpressionOverride(1, 80)
(capturedwench.getReference() as Actor).EvaluatePackage()
lalawench_CW_delete_SPL.Cast((capturedwench.getReference() as Actor),(capturedwench.getReference() as Actor))
lalawench_CW_Main_Radiant.SetStage(50)
Utility.Wait(2.0)
   (capturedwench.getReference() as Actor).Say(TopicToSay1)
Utility.Wait(1.0)
   akSpeaker.Say(TopicToSay2)
utility.wait(2.0)
;capturedwench.Clear()
       lalawench_CW_Main_Radiant.stop()
utility.wait(1.0)
       lalawench_CW_Main_Radiant.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property lalawench_CW_Sold Auto
Faction Property lalawench_CW_followingwenches Auto
referenceAlias property capturedwench auto
quest property lalawench_CW_Main_Radiant auto
outfit property lalawench_CW_capturedwench_clothes auto
Topic Property TopicToSay1 Auto
Topic Property TopicToSay2 Auto
spell property lalawench_CW_delete_SPL auto
globalvariable property lalawench_CW_reward_sold auto
MiscObject Property Gold001  Auto
Faction Property lalawench_CW_NofailW Auto

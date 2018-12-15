;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname YW_CW_radiant_end1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().Additem(Gold001, lalawench_CW_reward_saved.GetValueInt())
lalawench_CW_Main_Radiant.SetObjectiveCompleted(40,1)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(40, false)
       ;lalawench_CW_Main_Radiant.SetObjectiveDisplayed(10, true, true)
       ;lalawench_CW_Main_Radiant.SetObjectiveCompleted(10,1)
utility.wait(2.0)
(capturedwench.getReference() as Actor).SetOutFit(ClothesTavernWenchOutfit)
(capturedwench.getReference() as Actor).AddToFaction(lalawench_CW_Saved)
(capturedwench.getReference() as Actor).AddToFaction(lalawench_CW_NofailW)
(capturedwench.getReference() as Actor).RemoveFromFaction(lalawench_CW_followingwenches)
(capturedwench.getReference() as Actor).SetExpressionOverride(2, 40)
(capturedwench.getReference() as Actor).EvaluatePackage()
;lalawench_CW_delete_SPL.Cast((capturedwench.getReference() as Actor),(capturedwench.getReference() as Actor))
lalawench_CW_Main_Radiant.SetStage(50)
Utility.Wait(2.0)
   (capturedwench.getReference() as Actor).Say(TopicToSay1)
     lalawench_CW_Main_Radiant.stop()
utility.wait(1.0)
     lalawench_CW_Main_Radiant.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

spell property lalawench_CW_delete_SPL auto
Faction Property lalawench_CW_Saved Auto
Faction Property lalawench_CW_followingwenches Auto
Faction Property lalawench_CW_NofailW Auto
referenceAlias property capturedwench auto
quest property lalawench_CW_Main_Radiant auto
outfit property ClothesTavernWenchOutfit auto
globalvariable property lalawench_CW_reward_saved auto
MiscObject Property Gold001  Auto
Topic Property TopicToSay1 Auto

;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname YW_CW_Radiant_condemmedend Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lalawench_CW_Main_Radiant.SetObjectiveCompleted(30,1)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(30, false)
       lalawench_CW_Main_Radiant.SetStage(43)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(43, true, true)
(capturedwench.getReference() as Actor).AddSpell(lalawench_CW_condemned_SPL)
       utility.wait(1.0)
(capturedwench.getReference() as Actor).RemoveFromFaction(lalawench_CW_followingwenches)
(capturedwench.getReference() as Actor).SetExpressionOverride(1, 70)
(capturedwench.getReference() as Actor).AddtoFaction(lalawench_CW_condemned)
(capturedwench.getReference() as Actor).SetActorValue("Confidence", 0)
(capturedwench.getReference() as Actor).SetActorValue("Aggression", 0)
(capturedwench.getReference() as Actor).SetActorValue("Assistance", 0)
(capturedwench.getReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

spell property lalawench_CW_condemned_SPL auto
Faction Property lalawench_CW_followingwenches Auto
Faction Property lalawench_CW_condemned Auto
referenceAlias property capturedwench auto
quest property lalawench_CW_Main_Radiant auto

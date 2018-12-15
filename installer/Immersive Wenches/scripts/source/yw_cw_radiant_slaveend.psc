;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname YW_CW_radiant_slaveend Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(capturedwench.getReference() as Actor).AddToFaction(lalawench_CW_NofailW)
lalawench_CW_Main_Radiant.SetObjectiveCompleted(30,1)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(30, false)
       ;lalawench_CW_Main_Radiant.SetObjectiveDisplayed(10, true, true)
       ;lalawench_CW_Main_Radiant.SetObjectiveCompleted(10,1)
utility.wait(2.0)
(capturedwench.getReference() as Actor).SetExpressionOverride(1, 70)
(capturedwench.getReference() as Actor).EvaluatePackage()
lalawench_CW_Main_Radiant.SetStage(50)
utility.wait(2.0)
;capturedwench.Clear()
     lalawench_CW_Main_Radiant.stop()
utility.wait(1.0)
     lalawench_CW_Main_Radiant.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

referenceAlias property capturedwench auto
quest property lalawench_CW_Main_Radiant auto
Faction Property lalawench_CW_NofailW Auto

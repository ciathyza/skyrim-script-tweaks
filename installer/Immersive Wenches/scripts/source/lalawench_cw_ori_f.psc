;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_ORI_F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(lalawench_CW_followingwenches)
akSpeaker.RemoveFromFaction(lalawench_CW_capturedW)
akSpeaker.RemoveFromFaction(dunprisonerfaction)
akSpeaker.SetExpressionOverride(1, 80)
akSpeaker.EvaluatePackage()
utility.wait(1.0)
;check
If (lalawench_CWintro_noteread_2.GetValueInt() == 0)
       lalawench_introquest.SetObjectiveDisplayed(10,false)
       lalawench_introquest.SetObjectiveDisplayed(20,true)
       lalawench_introquest.SetObjectiveDisplayed(15,true)
       lalawench_introquest.SetObjectiveDisplayed(14,true)
       lalawench_introquest.SetObjectiveDisplayed(13,true)
       lalawench_introquest.SetObjectiveDisplayed(12,true)
       lalawench_introquest.SetObjectiveDisplayed(11,true)
       lalawench_introquest.SetStage(20)
lalawench_CWintro_noteread.setvalue(1)
endif
lalawench_CWintro_noteread_2.setvalue(1)
;

if akSpeaker.haskeyword(lalawench_CW_EW_orianne) == True
       lalawench_introquest.SetObjectiveCompleted(11,1)
elseif akSpeaker.haskeyword(lalawench_CW_EW_maxy) == True
       lalawench_introquest.SetObjectiveCompleted(12,1)
elseif akSpeaker.haskeyword(lalawench_CW_EW_jaryra) == True
       lalawench_introquest.SetObjectiveCompleted(13,1)
elseif akSpeaker.haskeyword(lalawench_CW_EW_kahanne) == True
       lalawench_introquest.SetObjectiveCompleted(14,1)
elseif akSpeaker.haskeyword(lalawench_CW_EW_daphnne) == True
       lalawench_introquest.SetObjectiveCompleted(15,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property lalawench_CW_followingwenches Auto
Faction Property lalawench_CW_capturedW Auto
Faction Property dunprisonerfaction Auto
quest Property lalawench_introquest Auto
globalvariable property lalawench_CWintro_noteread auto
globalvariable property lalawench_CWintro_noteread_2 auto
keyword property lalawench_CW_EW_orianne auto
keyword property lalawench_CW_EW_Daphnne auto
keyword property lalawench_CW_EW_Jaryra auto
keyword property lalawench_CW_EW_Kahanne auto
keyword property lalawench_CW_EW_Maxy auto

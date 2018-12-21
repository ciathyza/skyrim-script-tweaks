;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname defe_tif__030e173b Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Defeat.QSTStage = 15
PlayerScr.SetSurrenderSpeaker((PlayerScr.AliasTheNext.GetReference() As Actor))
PlayerScr.SetState("ForceGreetWait")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatPlayer Property PlayerScr Auto
DefeatConfig Property Defeat Auto

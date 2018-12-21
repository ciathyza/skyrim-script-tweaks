;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname defe_tif__030d6529 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerScr.UnregisterForUpdate()
Defeat.QSTStage = 0
PlayerScr.AliasLastAgg.Clear()
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property PlayerVictimQst Auto
DefeatPlayer Property PlayerScr Auto
DefeatConfig Property Defeat Auto

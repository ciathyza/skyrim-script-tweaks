;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname defe_TIF__03115119 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Defeat.Yield(AkSpeaker, Uncalm = False, Enter = False)
Defeat.StruggleSceneTrigger(Player, AkSpeaker, "Player Aggressor", IsStanding = True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig property Defeat auto
Actor Property Player Auto

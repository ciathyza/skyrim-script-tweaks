;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname defe_TIF__0314BFCC Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Defeat.SOPayUp(Player, AkSpeaker, SOValuePimp.GetValueInt())
;Defeat.SOSetMultiple(Player)
Defeat.SOSetProstituteReward(AkSpeaker, SOValuePimp.GetValueInt())
Defeat.SOConsensual((CommandFollower.GetReference() As Actor), AkSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property Defeat Auto
GlobalVariable Property SOValuePimp Auto
ReferenceAlias Property CommandFollower Auto
Actor Property Player Auto

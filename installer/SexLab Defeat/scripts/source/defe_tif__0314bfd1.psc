;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname defe_TIF__0314BFD1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Defeat.SOPayUp(Player, AkSpeaker, SOValuePimp2.GetValueInt())
Defeat.SOSetProstituteReward(AkSpeaker, SOValuePimp2.GetValueInt())
Defeat.SOSetMultiple(Player)
Defeat.SOConsensual((CommandFollower.GetReference() As Actor), AkSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property Defeat Auto
GlobalVariable Property SOValuePimp2 Auto
ReferenceAlias Property CommandFollower Auto
Actor Property Player Auto

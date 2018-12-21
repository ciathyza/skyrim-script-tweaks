;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname defe_TIF__0314BFCA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor Follower = CommandFollower.GetReference() As Actor
Defeat.SORelation(Follower, Akspeaker)
Defeat.SOMorality(Follower, Akspeaker)
Defeat.SOWitness(Follower, Akspeaker)
Defeat.SOAlreadyProstituedTo(Follower, Akspeaker)
Defeat.SOValue(Follower, Akspeaker)
Defeat.SOValue(Player, Akspeaker, True)
GetOwningQuest().UpdateCurrentInstanceGlobal(SOValuePimp)
GetOwningQuest().UpdateCurrentInstanceGlobal(SOValuePimp2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property Defeat Auto
GlobalVariable Property SOValuePimp Auto
GlobalVariable Property SOValuePimp2 Auto
ReferenceAlias Property CommandFollower Auto
Actor Property Player Auto

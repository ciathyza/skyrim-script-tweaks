;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname defe_TIF__031443AB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Defeat.SORelation(Player, Akspeaker)
Defeat.SOMorality(Player, Akspeaker)
Defeat.SOWitness(Player, Akspeaker)
Defeat.SOAlreadyProstituedTo(Player, Akspeaker)
Defeat.SOValue(Player, Akspeaker)
GetOwningQuest().UpdateCurrentInstanceGlobal(SOValuePimp)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property Defeat Auto
GlobalVariable Property SOValuePimp Auto
Actor Property Player Auto

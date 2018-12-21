;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname defe_TIF__03134BA6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor Target = ((GetOwningQuest().GetAliasByName("LastInSack") As ReferenceAlias).GetReference() As Actor)
Defeat.SORelation(Target, Akspeaker)
Defeat.SOMorality(Target, Akspeaker)
Defeat.SOWitness(Target, Akspeaker)
Defeat.SOAlreadyProstituedTo(Target, Akspeaker)
Defeat.SOValue(Target, Akspeaker)
GetOwningQuest().UpdateCurrentInstanceGlobal(SOValuePimp)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property Defeat Auto
GlobalVariable Property SOValuePimp Auto

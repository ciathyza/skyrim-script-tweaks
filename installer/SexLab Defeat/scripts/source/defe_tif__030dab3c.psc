;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname defe_tif__030dab3c Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerScr.GoToState("StruggleFree")
Actor Victim = PlayerScr.CollaVic[0].GetReference() As Actor
Actor Aggressor = PlayerScr.CollaAgg[0].GetReference() As Actor
If (Defeat.VictimState(Victim) == "")
	Debug.SendAnimationEvent(Victim, "IdleCoweringLoose")
Endif
PlayerScr.Collateral(Victim, Aggressor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatPlayer Property PlayerScr Auto
DefeatConfig Property Defeat Auto

;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialFollow.psc
Modified : 2015-04-27 08:52:01
Compiled : 2017-01-15 06:26:31
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialFollow extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function Fragment_1(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_FollowAndPlay(none)
endFunction

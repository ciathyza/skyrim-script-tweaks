;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialFollowOnly2.psc
Modified : 2015-04-27 08:52:01
Compiled : 2017-01-15 06:26:26
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialFollowOnly2 extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function Fragment_3(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_Follow(none)
endFunction

; Skipped compiler generated GetState

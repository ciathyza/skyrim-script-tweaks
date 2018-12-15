;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialMeetPlace.psc
Modified : 2015-02-23 08:47:31
Compiled : 2017-01-15 06:26:04
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialMeetPlace extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_MeetPlace()
endFunction

; Skipped compiler generated GetState

;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialMeetPoint2.psc
Modified : 2015-04-27 08:52:01
Compiled : 2017-01-15 06:25:59
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialMeetPoint2 extends TopicInfo hidden

;-- Properties --------------------------------------
fwchildsettings property DialQuest auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_SetMeetPlace()
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

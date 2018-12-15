;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialNPCLeave.psc
Modified : 2015-04-27 08:52:01
Compiled : 2017-01-15 06:25:57
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialNPCLeave extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function Fragment_1(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_LeaveMeAlone()
endFunction

; Skipped compiler generated GotoState

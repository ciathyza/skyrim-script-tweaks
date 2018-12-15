;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialWaitStay2.psc
Modified : 2015-04-27 08:52:02
Compiled : 2017-01-15 06:25:46
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialWaitStay2 extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_Wait()
endFunction

; Skipped compiler generated GotoState

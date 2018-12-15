;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialWaitPlayDad.psc
Modified : 2015-04-27 08:52:01
Compiled : 2017-01-15 06:25:55
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialWaitPlayDad extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_WaitAndPlay()
endFunction

; Skipped compiler generated GetState

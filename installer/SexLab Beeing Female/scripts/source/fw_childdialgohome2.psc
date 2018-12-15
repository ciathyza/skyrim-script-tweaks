;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialGoHome2.psc
Modified : 2015-04-27 08:52:01
Compiled : 2017-01-15 06:26:20
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialGoHome2 extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_GoHome()
endFunction

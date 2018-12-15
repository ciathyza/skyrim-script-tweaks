;/ Decompiled by Champollion V1.0.1
Source   : FW_ChildDialDontSleep2.psc
Modified : 2015-04-27 08:52:01
Compiled : 2017-01-15 06:26:36
User     : admin
Computer : PATRICK
/;
scriptName FW_ChildDialDontSleep2 extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function Fragment_0(ObjectReference akSpeakerRef)

	fwchildactor akSpeaker = akSpeakerRef as fwchildactor
	akSpeaker.Order_DontSleepNow()
endFunction

; Skipped compiler generated GotoState

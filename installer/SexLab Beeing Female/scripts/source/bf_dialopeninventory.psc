;/ Decompiled by Champollion V1.0.1
Source   : BF_DialOpenInventory.psc
Modified : 2015-04-27 08:52:00
Compiled : 2017-01-15 06:28:29
User     : admin
Computer : PATRICK
/;
scriptName BF_DialOpenInventory extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_1(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	akSpeaker.OpenInventory(false)
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

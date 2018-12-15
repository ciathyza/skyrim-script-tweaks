;/ Decompiled by Champollion V1.0.1
Source   : FW_DialOpenInventory.psc
Modified : 2015-04-27 08:52:02
Compiled : 2017-01-15 06:25:44
User     : admin
Computer : PATRICK
/;
scriptName FW_DialOpenInventory extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function Fragment_1(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	akSpeaker.OpenInventory(false)
endFunction

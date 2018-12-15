;/ Decompiled by Champollion V1.0.1
Source   : FWChildDialogue.psc
Modified : 2016-12-06 03:52:58
Compiled : 2017-01-18 08:35:38
User     : admin
Computer : PATRICK
/;
scriptName FWChildDialogue extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function Fragment_2(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(akSpeaker as fwchildactor).Order_ShowInventory()
endFunction

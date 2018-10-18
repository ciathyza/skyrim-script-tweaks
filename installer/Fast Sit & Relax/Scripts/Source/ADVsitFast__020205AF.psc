;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast__020205AF.psc
Modified : 2014-07-01 20:36:41
Compiled : 2014-07-20 00:22:28
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast__020205AF extends TopicInfo hidden

;-- Properties --------------------------------------
spell property FollowerRoutine auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	akSpeaker.dispelSpell(FollowerRoutine)
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

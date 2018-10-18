;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast__0200AB9E.psc
Modified : 2014-04-30 17:31:06
Compiled : 2014-07-20 00:22:46
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast__0200AB9E extends TopicInfo hidden

;-- Properties --------------------------------------
miscobject property Cash auto
potion property SleepElixir auto
miscobject property check auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_9(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	akSpeaker.removeItem(SleepElixir as form, 1, false, none)
	akSpeaker.additem(Cash as form, 1100, false)
	akSpeaker.additem(check as form, 1, false)
	game.getplayer().additem(SleepElixir as form, 1, false)
endFunction

function Fragment_8(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	game.getplayer().removeItem(Cash as form, 1100, false, none)
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

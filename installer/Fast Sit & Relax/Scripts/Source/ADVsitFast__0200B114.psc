;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast__0200B114.psc
Modified : 2014-04-30 17:30:26
Compiled : 2014-07-20 00:22:39
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast__0200B114 extends TopicInfo hidden

;-- Properties --------------------------------------
miscobject property Cash auto
potion property SleepElixir auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function Fragment_5(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	akSpeaker.removeItem(SleepElixir as form, 1, false, none)
	akSpeaker.additem(Cash as form, 1900, false)
	game.getplayer().additem(SleepElixir as form, 1, false)
endFunction

function Fragment_4(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	game.getplayer().removeItem(Cash as form, 1900, false, none)
endFunction

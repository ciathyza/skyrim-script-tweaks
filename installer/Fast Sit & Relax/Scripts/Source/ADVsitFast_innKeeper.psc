;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_innKeeper.psc
Modified : 2014-04-30 17:15:44
Compiled : 2014-07-20 00:21:37
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_innKeeper extends TopicInfo hidden

;-- Properties --------------------------------------
miscobject property check auto
potion property SleepElixir auto
spell property Cooldown auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function Fragment_6(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	Int AddCount = utility.randomInt(0, 2)
	akSpeaker.additem(SleepElixir as form, AddCount, false)
	akSpeaker.removeitem(check as form, 1, false, none)
	Cooldown.Cast(akSpeaker as ObjectReference, none)
endFunction

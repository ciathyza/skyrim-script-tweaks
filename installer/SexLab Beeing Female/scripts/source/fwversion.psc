;/ Decompiled by Champollion V1.0.1
Source   : FWVersion.psc
Modified : 2017-01-13 11:42:52
Compiled : 2017-01-18 08:35:01
User     : admin
Computer : PATRICK
/;
scriptName FWVersion

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Int function GetNativeVersion() global

	return 6
endFunction

Int function GetMCMVersion() global

	return 25
endFunction

String function GetVersionString() global

	return "2.8"
endFunction

Int function GetAnimationVersion() global

	return game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion")
endFunction

Int function GetAnimationVersionRequired() global

	return 1
endFunction

Int function GetVersion() global

	return 20800
endFunction

function onEndState()
{Event received when this state is switched away from}

	; Empty function
endFunction

; Skipped compiler generated GetState

function onBeginState()
{Event received when this state is switched to}

	; Empty function
endFunction

; Skipped compiler generated GotoState

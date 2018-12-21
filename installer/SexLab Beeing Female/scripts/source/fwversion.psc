Scriptname FWVersion

; Returns the BeeingFemale Version as string
string function GetVersionString() global
	return "2.8"
EndFunction

; Returns the BeeingFemaleVersion as integer
int Function GetVersion() global
	Return 20800
EndFunction

; Returns the version of the current MCM Properties
int Function GetMCMVersion() global
	Return 25
EndFunction

int Function GetNativeVersion() global
	Return 6
EndFunction

; Returns the  minimum required animation version
int function GetAnimationVersionRequired() global
	return 1
endfunction

int function GetAnimationVersion() global
	return Game.GetPlayer().GetAnimationVariableInt("BeeingFemaleAnimationVersion")
endFunction
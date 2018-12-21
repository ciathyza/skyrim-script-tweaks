ScriptName EWM_Util hidden

bool function ArrayAddStr(String[] myStrings, String aString) Global
 
	int i = 0
	while i < myStrings.Length
		if myStrings[i] == "" || myStrings[i] == "EMPTY"
			myStrings[i] = aString
			return true
		else
			i += 1
		endif
	endWhile
 
	return false

endFunction

bool function ArrayRemoveStr(String[] myStrings, String aString) Global

	int i = 0
	while i < myStrings.Length
		if myStrings[i] == aString
			myStrings[i] = ""
			return true
		else
			i += 1
		endif
	endWhile

	return false
 
endFunction

int function StrCount(String[] myStrings) Global
	
	int i = 0
	int myCount = 0
	while i < myStrings.Length
		if myStrings[i] != "" && myStrings[i] != "EMPTY"  && myStrings[i] !="$" && myStrings[i] != "-"
			myCount += 1
		endif
		i += 1
	endWhile
 
	return myCount
 
endFunction


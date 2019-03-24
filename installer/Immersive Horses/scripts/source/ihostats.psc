; Immersive Horses by sevencardz.
ScriptName IHOStats hidden
{Utility script for Immersive Horses' horse stats.}

; Returns the list of aggression options.
String[] Function GetAggressionListStats() global
	String[] options = new String[5]
	options[0] = "Cancel"
	options[1] = "Unaggressive"
	options[2] = "Aggressive"
	options[3] = "Very Aggressive"
	options[4] = "Frenzied"
	return options
EndFunction

; Returns the list of confidence options.
String[] Function GetConfidenceListStats() global
	String[] options = new String[6]
	options[0] = "Cancel"
	options[1] = "Cowardly"
	options[2] = "Cautious"
	options[3] = "Average"
	options[4] = "Brave"
	options[5] = "Foolhardy"
	return options
EndFunction

; Returns the horse's breed name.
String Function GetHorseBreedName(Actor horseRef) global
	ActorBase horseBaseRef = horseRef.GetLeveledActorBase()
	ActorBase horseTemplateRef = horseBaseRef.GetTemplate()
	if horseTemplateRef == None
		return horseBaseRef.GetName()
	else
		return horseTemplateRef.GetName()
	endIf
EndFunction

String Function GetGenderText(Actor actorRef) global
	ActorBase actorBaseRef = actorRef.GetLeveledActorBase()
	int gender = actorBaseRef.GetSex()
	if gender == 0
		return " Male"
	elseIf gender == 1
		return " Female"
	else
		return " Neuter"
	endIf
EndFunction

; Returns the name of the horse's owner.
String Function GetHorseOwnerName(Actor horseRef) global
	Actor playerRef = Game.GetPlayer()
	Faction CurrentFollowerFaction = Game.GetFormFromFile(0x05c84e, "Skyrim.esm") as Faction
	if horseRef.GetFactionOwner() == CurrentFollowerFaction ; Team
		return "My Team"
	elseIf horseRef.GetActorOwner() == playerRef.GetActorBase() ; Player
		return playerRef.GetDisplayName()
	elseIf horseRef.GetActorOwner() != None ; Follower/Actor
		return horseRef.GetActorOwner().GetName()
	else ; Unknown
		return "Unknown"
	endIf
EndFunction

; Returns the actor's current location name.
String Function GetActorLocationName(Actor actorRef) global
	Location currentLocation = actorRef.GetCurrentLocation()
	if currentLocation == None || currentLocation.GetName() == ""
		return "Tamriel"
	else
		return currentLocation.GetName()
	endIf
EndFunction

; Returns the actor's home name.
String Function GetActorHomeName(Actor actorRef) global
	Location homeLocation = actorRef.GetEditorLocation()
	if homeLocation == None || homeLocation.GetName() == ""
		return "Tamriel"
	else
		return homeLocation.GetName()
	endIf
EndFunction

String Function GetAttributeValueText(Actor actorRef, String actorValue, String actorValueRate) global
	return " " + actorRef.GetActorValue(actorValue) as int +\
		   " / " + actorRef.GetBaseActorValue(actorValue) as int +\
		   " ^ " + actorRef.GetActorValue(actorValueRate) as int + "%/s"
EndFunction

; Shows the horse's statistics as text in a message box.
Function ShowHorseStats(Actor horseRef, bool isPersistent = false) global
	String horseBreedName = GetHorseBreedName(horseRef)
	if horseBreedName == horseRef.GetDisplayName()
		horseBreedName = "Unknown"
	endIf
	String horseActorType = " Temporary"
	if isPersistent
		horseActorType = " Permanent"
	endIf
	int aggressionIndex = horseRef.GetActorValue("Aggression") as int + 1
	int confidenceIndex = horseRef.GetActorValue("Confidence") as int + 1
	String horseAggression = GetAggressionListStats()[aggressionIndex]
	String horseConfidence = GetConfidenceListStats()[confidenceIndex]
	; Maximum of 12 line breaks.
	Debug.MessageBox("Name: " + horseRef.GetDisplayName() + "    Gender:" + GetGenderText(horseRef) +\
		"\nLevel: " + horseRef.GetLevel() + "    Breed: " + horseBreedName +\ 
		"\nOwner: " + GetHorseOwnerName(horseRef) + "    Type:" + horseActorType +\
		"\nLocation: " + GetActorLocationName(horseRef) +\
		"\nHome: " + GetActorHomeName(horseRef) +\
		"\nHealth:" + GetAttributeValueText(horseRef, "Health", "HealRate") +\
		"\nStamina:" + GetAttributeValueText(horseRef, "Stamina", "StaminaRate") +\
		"\nSpeed: " + horseRef.GetActorValue("SpeedMult") as int + "%" +\
		"    Carry Weight: " + horseRef.GetActorValue("CarryWeight") as int +\
		"\nDamage Rating: " + horseRef.GetActorValue("UnarmedDamage") as int +\
		"    Armor Rating: " + horseRef.GetActorValue("DamageResist") as int +\
		"\nLight Armor Skill: " + horseRef.GetActorValue("LightArmor") as int +\
		"    Heavy Armor Skill: " + horseRef.GetActorValue("HeavyArmor") as int +\
		"\nAggression: " + horseAggression + "    Confidence: " + horseConfidence)
EndFunction

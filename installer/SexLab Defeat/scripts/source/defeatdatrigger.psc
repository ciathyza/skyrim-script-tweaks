Scriptname defeatdatrigger extends daymoyl_QuestTemplate  

DefeatPlayer Property PlayerScr Auto

Actor Aggressor
Actor Property Player Auto

Bool Function QuestCondition(Location akLocation, Actor akAggressor, Actor akFollower)
{Condition that must be satisfied for the quest to fire.}
	UnregisterForModEvent("da_PlayerRecovered")
	If akAggressor
		Return PlayerScr.DefeatTriggerActive(akAggressor)
	Endif
EndFunction

Bool Function QuestStart(Location CurrentLocation, Actor akAggressor, Actor akFollower)
{Starts the quest and returns true on success.}
	Debug.Trace("Defeat DA Trigger selected")
	Aggressor = akAggressor
	RegisterForModEvent("da_PlayerRecovered", "StartDefeat")
	RegisterForSingleUpdate(10)
	SendModEvent("da_StartRecoverSequence", numArg = 9999.0)
	Return True
EndFunction

Event OnUpdate() ; expiration? maybe the event is not coming
	Debug.Trace("Defeat DA Trigger Failed: Timeout")
	UnregisterForModEvent("da_PlayerRecovered")
EndEvent

Event StartDefeat(string eventName, string strArg, float numArg, Form sender)
	UnregisterForUpdate()
	UnregisterForModEvent("da_PlayerRecovered")
	While (Player.GetAnimationVariableBool("IsBleedingOut") || Player.GetAnimationVariableBool("bIsSynced"))
		Utility.Wait(0.1)
	EndWhile
	PlayerScr.DefeatTrigger(Aggressor)
EndEvent
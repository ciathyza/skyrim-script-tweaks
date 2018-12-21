Scriptname DefeatBFKBossscr extends ReferenceAlias 

Event OnDeath(Actor akKiller)
	If GetOwningQuest().GetStage() == 10
		GetOwningQuest().SetObjectiveCompleted(5)
	Endif
EndEvent

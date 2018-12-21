Scriptname DefeatPARobberKill extends ReferenceAlias

Event OnDeath(Actor akKiller)
	If (akKiller== Game.GetPlayer())
       	GetOwningQuest().SetObjectiveCompleted(0)
		GetOwningQuest().CompleteQuest()
		GetOwningQuest().Stop()
	Endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	If (akDestContainer == Game.GetPlayer())
		GetOwningQuest().SetObjectiveCompleted(0)
		GetOwningQuest().CompleteQuest()
		GetOwningQuest().Stop()
	Endif
EndEvent

Event OnUpdateGameTime()
	GetOwningQuest().SetObjectiveFailed(0)
	GetOwningQuest().CompleteQuest()
	GetOwningQuest().Stop()
EndEvent
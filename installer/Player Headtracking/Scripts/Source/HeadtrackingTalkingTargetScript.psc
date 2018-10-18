Scriptname HeadtrackingTalkingTargetScript extends activemagiceffect  

Quest Property Headtracking Auto
GlobalVariable Property HeadtrackingSilent Auto
HeadTrackingScript QuestScript
int Index

Event OnEffectStart(Actor akTarget, Actor akCaster)
	QuestScript = Headtracking as HeadTrackingScript
	If HeadtrackingSilent.GetValueInt() == 0
		QuestScript.AddTarget(akTarget, None, 100)
	Else
		QuestScript.ModifyPriority(akTarget, 100)
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If HeadtrackingSilent.GetValueInt() == 0
		QuestScript.RemoveTarget(akTarget)
	Else
		QuestScript.ModifyPriority(akTarget, 0)
	EndIf
EndEvent

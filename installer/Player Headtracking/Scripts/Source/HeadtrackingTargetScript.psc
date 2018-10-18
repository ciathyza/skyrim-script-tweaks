Scriptname HeadtrackingTargetScript extends activemagiceffect  

Quest Property Headtracking Auto
Actor ActorSelf
HeadTrackingScript QuestScript
int Index

Event OnEffectStart(Actor akTarget, Actor akCaster)
	ActorSelf = akTarget
	QuestScript = Headtracking as HeadTrackingScript
	QuestScript.AddTarget(akTarget, Self)
EndEvent

Event OnUpdate()
	QuestScript.ModifyPriority(ActorSelf, -65)
EndEvent

Event OnPackageChange(Package akOldPackage)
	Utility.Wait(0.5)
	QuestScript.ModifyPriority(ActorSelf, 0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	QuestScript.RemoveTarget(akTarget)
EndEvent

Scriptname lalawench_MothVisualScript extends activemagiceffect


VisualEffect Property lalawench_VisualButterfly02 Auto
Actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster	
		lalawench_VisualButterfly02.Play(selfRef)
	ENDEVENT

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		lalawench_VisualButterfly02.Stop(selfRef)
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		lalawench_VisualButterfly02.Stop(selfRef)
	ENDEVENT  

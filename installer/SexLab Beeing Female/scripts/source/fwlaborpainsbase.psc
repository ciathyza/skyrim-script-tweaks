Scriptname FWLaborPainsBase extends activemagiceffect  

FWSystem property System auto
float property DamageBase auto
float property UpdateDelay auto
int property KindOfPains auto
bool property Silent = false auto

actor ActorRef

Event OnEffectStart(Actor akTarget, Actor akCaster)
	ActorRef=akTarget
	Utility.Wait(2)
	RegisterForSingleUpdateGameTime( Utility.RandomFloat(UpdateDelay*0.75,UpdateDelay* 1.1))
endEvent

function OnUpdateGameTime()
	float rnd=Utility.RandomFloat(-1.0,1.0)
	if Silent==false
		System.PlayPainSound(ActorRef,(DamageBase+rnd) *4)
	endif
	System.DoDamage(ActorRef,(DamageBase+rnd) * System.getDamageScale(3,ActorRef), KindOfPains)
	RegisterForSingleUpdateGameTime( Utility.RandomFloat(UpdateDelay*0.75,UpdateDelay* 1.1))
endFunction
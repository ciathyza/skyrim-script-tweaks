Scriptname DefeatSexCrimeScr extends activemagiceffect  

Keyword Property DefeatRape Auto
Actor Victim
Actor Aggressor

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Victim = akTarget
	Aggressor = akCaster
	RegisterForSingleUpdate(1.0)
EndEvent
Event OnUpdate()
;	DefeatConfig.Log("DefeatSexCrimeScr Onupdate SendStoryEvent Victim - "+Victim+" / Aggressor - "+Aggressor)
	DefeatRape.SendStoryEvent(None, Victim, Aggressor)
	RegisterForSingleUpdate(5.0)
EndEvent
Scriptname inviseyesfix extends activemagiceffect  
{Fixes Invisibility glitch for eye textures}

Spell Property InvisibilityEyesFixSpell auto
Actor InvisibleActor

Event OnEffectStart(Actor Target, Actor Caster)
	InvisibleActor = Target
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	if (InvisibleActor.IsWeaponDrawn() == 0)
		InvisibleActor.QueueNiNodeUpdate()
		InvisibleActor.RemoveSpell(InvisibilityEyesFixSpell)
	else
		RegisterForSingleUpdate(1)
	endif
EndEvent
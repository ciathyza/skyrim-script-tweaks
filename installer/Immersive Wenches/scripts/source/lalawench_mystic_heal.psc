Scriptname lalawench_mystic_heal extends activemagiceffect  

Spell Property lalawench_Mystic_mainheal Auto
Actor Property PlayerRef auto

Actor CasterRef

Event OnEffectStart(Actor Target, Actor Caster)
	CasterRef = Caster
       lalawench_Mystic_mainheal.cast(Caster,PlayerRef)
EndEvent
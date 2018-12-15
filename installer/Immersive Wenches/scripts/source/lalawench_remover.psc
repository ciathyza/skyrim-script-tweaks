Scriptname lalawench_remover extends ActiveMagicEffect

Event OnEffectstart(Actor Target, Actor Caster)
             Target.Delete()
EndEvent


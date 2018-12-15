Scriptname lalawench_CW_deleteW extends activemagiceffect  

Actor selfRef

;Event OnLoad()
;    selfRef.delete()
;EndEvent

EVENT OnEffectStart(Actor Target, Actor Caster)
    selfRef = caster
    Utility.Wait(150.0)
    selfRef.delete()
ENDEVENT
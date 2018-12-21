Scriptname SFL4_AddRemoveSpell_Script extends activemagiceffect  

; -----

Spell Property SFL_SpellToAdd Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.AddSpell(SFL_SpellToAdd,false)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RemoveSpell(SFL_SpellToAdd)

EndEvent

; -----
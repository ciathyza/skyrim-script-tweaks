Scriptname SFL4_AddAbility_Script extends activemagiceffect  

; -----

Spell Property SFL4_CombatCloak_Spell_Ability_NPC_Ab Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.AddSpell(SFL4_CombatCloak_Spell_Ability_NPC_Ab, false)

EndEvent

; -----
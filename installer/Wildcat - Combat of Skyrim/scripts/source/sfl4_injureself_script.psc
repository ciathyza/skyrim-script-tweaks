Scriptname SFL4_InjureSelf_Script extends activemagiceffect  

; -----

Spell[] Property SFL_SpellToInflict Auto
Sound Property SFL_Spell_Sound_SpectralSlash Auto
Float Property SFL_DamageSelf Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.DamageActorValue("Health", SFL_DamageSelf)
	SFL_Spell_Sound_SpectralSlash.Play(akCaster)
	SFL_SpellToInflict[Utility.RandomInt(0, SFL_SpellToInflict.Length) - 1].Cast(akCaster)

EndEvent

; -----
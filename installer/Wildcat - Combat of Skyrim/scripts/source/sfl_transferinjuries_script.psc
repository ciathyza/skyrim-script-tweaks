Scriptname SFL_TransferInjuries_Script extends activemagiceffect  

; -----

MagicEffect[] Property SFL_MagicEffect Auto
Spell[] Property SFL_SpellToInflict Auto
Sound Property SFL_Spell_Sound_SpectralSlash Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	SFL_Spell_Sound_SpectralSlash.Play(akTarget)
	Int i = 0
	While i < SFL_SpellToInflict.Length
		If akCaster.HasMagicEffect(SFL_MagicEffect[i])
			SFL_SpellToInflict[i].Cast(akTarget)
			akCaster.DispelSpell(SFL_SpellToInflict[i])
		EndIf
		i += 1
	EndWhile

EndEvent

; -----
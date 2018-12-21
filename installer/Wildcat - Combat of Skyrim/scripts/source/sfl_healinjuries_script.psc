Scriptname SFL_HealInjuries_Script extends activemagiceffect  

; -----

Spell[] Property SFL_SpellToDispel Auto
Message Property WCT_Spell_Message_TreatInjuries Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int i = 0
	While i < SFL_SpellToDispel.Length
		akTarget.DispelSpell(SFL_SpellToDispel[i])
		i += 1
	EndWhile
	If akCaster == Game.GetPlayer()
		WCT_Spell_Message_TreatInjuries.Show()
	EndIf

EndEvent

; -----
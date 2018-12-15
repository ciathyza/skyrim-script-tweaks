Scriptname SBA_CoverTopEffectScript extends ActiveMagicEffect  

SBA_CoverSelfScript Property myMod auto
Spell Property SBA_CoverTopAndBottomAbility auto
GlobalVariable Property SBA_FacialExpressionEnabled auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.RemoveSpell(SBA_CoverTopAndBottomAbility)

	bool bOk = true
	bOk = FNIS_aa.SetAnimGroup(akTarget, "_mtidle", myMod.my_mtidle_base, 1, "CoverSelf", true)
	bOk = FNIS_aa.SetAnimGroup(akTarget, "_mt", myMod.my_mt_base, 1, "CoverSelf", true)
	bOk = FNIS_aa.SetAnimGroup(akTarget, "_mtx", myMod.my_mtx_base, 1, "CoverSelf", true)
	bOk = FNIS_aa.SetAnimGroup(akTarget, "_mtturn", myMod.my_mtturn_base, 1, "CoverSelf", true)
	bOk = FNIS_aa.SetAnimGroup(akTarget, "_sneakidle", myMod.my_sneakidle_base, 1, "CoverSelf", true)
	if SBA_FacialExpressionEnabled.GetValue() as bool
		akTarget.SetExpressionOverride(11, 100)
	endif
	;Debug.Notification(bOk)

endEvent


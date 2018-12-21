Scriptname SFL4_TimedBlock_Lockout_Script extends activemagiceffect  

; -----

Sound Property SFL_TimedBlock_Sound Auto
Spell Property SFL_TimedBlock_Spell_Proc Auto
Actor Property PlayerRef Auto
Message Property SFL_TimedBlock_Message Auto
Spell Property SFL_Hit_Spell_StaggerSelf_025 Auto
GlobalVariable Property SFL_SquelchTimedBlockMessages_Global Auto
Float Property SFL_DistanceLimit Auto

; -----

Bool HasBlocked = false

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If abHitBlocked && akAggressor != PlayerRef
		HasBlocked = true
		SFL_TimedBlock_Sound.Play(PlayerRef)
		If akAggressor.GetDistance(PlayerRef) <= SFL_DistanceLimit
			SFL_Hit_Spell_StaggerSelf_025.Cast(akAggressor as Actor)
		EndIf
		If SFL_SquelchTimedBlockMessages_Global.GetValue() == 0
			SFL_TimedBlock_Message.Show()
		EndIf
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If HasBlocked
		PlayerRef.DispelSpell(SFL_TimedBlock_Spell_Proc)
	EndIf

EndEvent

; -----
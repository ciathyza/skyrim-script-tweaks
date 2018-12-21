Scriptname DefeatHKAction Extends ActiveMagicEffect

; Resources =============================
DefeatConfig property RessConfig auto
DefeatActionScr property ActionQst auto
;========================================

Event OnEffectStart(Actor Target, Actor Caster)
	If !Target.HasKeyWordString("SexLabActive")
		Bool Valid = (Target.HasKeyWordString("ActorTypeNPC") || Target.HasKeyWordString("ActorTypeCreature"))
		If Valid
			Bool IsFollower = RessConfig.IsFollower(Target)
			If Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
				If IsFollower
					ActionQst.RegisterFollower(Target)
				Else 
					ActionQst.MarkTarget(Target)
					ActionQst.MiscSpells[1].Cast(Caster) ; HKActionFollowerSPL
				Endif
			Else
				If !IsFollower
					If !ActionQst.MarkTarget(Target)
						If (Caster.IsDetectedBy(Target) && !RessConfig.IsDefeatActive(Target) && Caster.IsWeaponDrawn() && (Target.GetDistance(Caster) < 600.0))
							ActionQst.Taunt(Target, Caster)
						Endif
					Endif
				Endif
			Endif
;		Elseif (Target.HasKeyWordString("ActorTypeCreature") && (RessConfig.MiscFormLists[].Find(Target.GetVoiceType()) != -1))
		Endif
	Endif
EndEvent
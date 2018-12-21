Scriptname DefeatNVNInActionScr extends ReferenceAlias

DefeatMCMscr Property McmConfig auto
DefeatConfig Property RessConfig auto
sslThreadController Controller

Actor Property Player Auto
Bool SpamGuard = False

Function Configure()
	SpamGuard = False
EndFunction

Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If McmConfig.HitInterrupt
		Actor Target = (GetReference() As Actor)
		Actor Aggressor = (akAggressor As Actor)
		If (Target && Aggressor)
			If !SpamGuard
				SpamGuard = True
				If Target.HasKeyWordString("SexLabActive")
					Controller = SexLabUtil.GetAPI().GetActorController(Target)
					If Controller.VictimRef
						If (Target != Controller.VictimRef)
							RessConfig.MiscSpells[5].Cast(Aggressor, Controller.VictimRef) ; ImmunitySPL
							Controller.EndAnimation()
							Aggressor.PushActorAway(Target, 5.0)
							If (Aggressor.GetFactionReaction(Target) != 1)
								Target.StopCombatAlarm()
								Aggressor.StopCombat()
							Endif
						Endif
					Endif
				Endif
			Endif
			Utility.Wait(2.0)
			SpamGuard = False
		Endif
	Endif
EndEvent
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	If (aeCombatState > 0)
		If McmConfig.CombatInterrupt
			Actor Target = (GetReference() As Actor)
			If (Target && Target.HasKeyWordString("SexLabActive"))
				Controller = SexLabUtil.GetAPI().GetActorController(Target)
				If (Target != Controller.VictimRef)
					RessConfig.MiscSpells[5].Cast(Target, Controller.VictimRef) ; ImmunitySPL
					Controller.EndAnimation()
				Endif
			Endif
		Endif
	Endif
EndEvent

State PlayerVictim ; On PlayerFaction Alias, a hit will always stop a sexlab scene on the player
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Actor Target = (GetReference() As Actor)
		Actor Aggressor = (akAggressor As Actor)
		If (Target && Aggressor)
			If !SpamGuard
				SpamGuard = True
				If Target.HasKeyWordString("SexLabActive")
					Controller = RessConfig.SexLab.GetActorController(Target)
					RessConfig.MiscSpells[5].Cast(Aggressor, Player) ; ImmunitySPL
					Controller.EndAnimation()
					If (Aggressor.GetFactionReaction(Target) != 1)
						Target.StopCombatAlarm()
						Aggressor.StopCombat()
					Endif
				Endif
			Endif
			Utility.Wait(2.0)
			SpamGuard = False
		Endif
	EndEvent
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		Actor Target = (GetReference() As Actor)
		If (aeCombatState > 0)
			If Target.HasKeyWordString("SexLabActive")
				Controller = SexLabUtil.GetAPI().GetActorController(Target)
				RessConfig.MiscSpells[5].Cast(Target, Controller.VictimRef) ; ImmunitySPL
				Controller.EndAnimation()
			Endif
		Endif
	EndEvent
EndState

State Inactive
EndState
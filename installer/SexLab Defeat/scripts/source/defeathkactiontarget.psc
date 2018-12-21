Scriptname Defeathkactiontarget extends ReferenceAlias

DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto

Bool SpamGuard
Actor Target
Actor Aggressor
Actor Property Player Auto
Weapon Property Unarmed Auto

Function Configure()
	SpamGuard = False
EndFunction
Function Filled()
	Target = (GetReference() As Actor)
	If Target.IsInCombat() 
		GoToState("InCombat")
	Endif
EndFunction
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    If (aeCombatState == 1) ; Entering combat
;    	DefeatConfig.Log("OnCombatStateChanged "+Target+" GotoState InCombat")
		GoToState("InCombat")
 	Endif
EndEvent
Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	Aggressor = (akAggressor As Actor)
	If Aggressor
		If (Aggressor == Player)
			If (abBashAttack || akSrc == Unarmed)
				String TheState = RessConfig.VictimState(Target)
				If (TheState == "Sleeping")
					RessConfig.Knockout(Target, Player)
				Elseif (TheState == "")
					RessConfig.Knockdown(Target, Aggressor, Type = "Player Aggressor")
				Endif
			Endif
		Endif
	Endif
EndEvent
State InCombat
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Aggressor = (akAggressor As Actor)
		If Aggressor
			If (Aggressor == Player || Aggressor.IsPlayerTeammate())
				If ((akSrc == Unarmed) || abBashAttack)
					If !SpamGuard
						SpamGuard = True
						If !Target.HasSpell(RessConfig.EscapeSPL)
							Float Chance = (Utility.RandomInt(1, 100) * (McmConfig.ResistBonusPagg / 100))
							Float Resist = ((Target.GetActorValuePercentage("Health") * 100) + (Target.GetActorValuePercentage("Stamina") * 100))
;							DefeatConfig.Log("Target - "+Target+" / (Chance >= Resist) ? "+(Chance >= Resist)+" / Chance - "+Chance+" / Resist - "+Resist)
							If (Chance >= Resist)
								RessConfig.Knockdown(Target, Aggressor, Type = "Player Aggressor")
							Endif
						Else
							RessConfig.Knockdown(Target, Aggressor,Type = "Player Aggressor")
						Endif
						Utility.Wait(2.0)
						SpamGuard = False
					Endif
				Endif
			Endif
		Endif
	EndEvent
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	    If (aeCombatState == 0) || (aeCombatState == 2); out of combat or searching
;	    	DefeatConfig.Log("OnCombatStateChanged "+Target+" GotoState nothing")
			GoToState("")
	 	Endif
	EndEvent
	Event OnEnterBleedout()
		RessConfig.Knockdown(Target, Aggressor, Type = "Player Aggressor", IsBleedOut = True)
	EndEvent
EndState
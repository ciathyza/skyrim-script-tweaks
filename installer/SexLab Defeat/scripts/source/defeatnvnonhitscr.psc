Scriptname DefeatNVNOnHitScr extends ReferenceAlias  

DefeatMCMscr property McmConfig auto
DefeatConfig property RessConfig auto

Actor Property Player Auto
Bool Property IsFemale Auto
Bool Property IsFollower Auto
Actor LastAggressor
Bool SpamGuard = False
Bool SpamGuardBleedout = False

Function Configure()
	SpamGuard = False
EndFunction

Bool Function IsAggressorValid(Actor Aggressor)
	Return (Aggressor != Player) && !Aggressor.IsGhost() && (!Aggressor.HasKeyWordString("DefeatActive") || Aggressor.HasKeyWordString("DefeatAggPlayer"))
EndFunction
Bool Function HealthThreshold(Actor Vic, Float Threshold, Float ChanceOnHit)
	Return ((Utility.RandomInt(1, 100) <= ChanceOnHit) && ((Vic.GetActorValuePercentage("Health") * 100) <= Threshold))
EndFunction
Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Actor Aggressor = (akAggressor As Actor)
	If Aggressor && IsAggressorValid(Aggressor)
		If !SpamGuard
			SpamGuard = True
			Actor Victim = (GetReference() As Actor)
			If Victim && !Victim.HasMagicEffect(RessConfig.MiscMagicEffects[0]) && (RessConfig.NVNKDtype <= 2) ; Both or on hit
				If (Aggressor.GetCombatTarget() == Victim) && (Aggressor.GetDistance(Victim) <= 2000.0)
					LastAggressor = Aggressor
					If (IsFollower && (Utility.RandomInt(1, 100) <= McmConfig.COHFollower) || (!IsFollower && (Utility.RandomInt(1, 100) <= McmConfig.ChanceOnHitNPC)))
						If IsFollower || McmConfig.EveryoneNVN || RessConfig.SexCombination(Aggressor, Victim, False)
							If IsFollower
								If HealthThreshold(Victim, McmConfig.ThresholdFollower, McmConfig.COHFollower)
									If !Player.HasKeyWordString("DefeatActive")
										RessConfig.Knockdown(Victim, Aggressor, 60.0, "Follower")
										RessConfig.MiscSpells[3].Cast(Aggressor, Victim) ; NVNAssautSPL
									Else
										RessConfig.Knockdown(Victim, Aggressor, 60.0, "Follower")
									Endif
								Endif
							Else
								If RessConfig.IsFollower(Aggressor)
									If McmConfig.AllowCagg
										If HealthThreshold(Victim, McmConfig.ThresholdNPCvsNPC, McmConfig.ChanceOnHitNPC)
											RessConfig.Knockdown(Victim, Aggressor, 60.0, "NPC")
											RessConfig.MiscSpells[3].Cast(Aggressor, Victim) ; NVNAssautSPL
										Endif
									Endif
								Else
									If Aggressor.HasKeyWordString("DefeatAggPlayer")
										If HealthThreshold(Victim, McmConfig.ThresholdNPCvsNPC, McmConfig.ChanceOnHitNPC)
											RessConfig.Knockdown(Victim, Aggressor, 60.0, "NPC")
											Actor TheNext = RessConfig.PlayerScr.IsThereNext()
											If (!TheNext || (TheNext && (TheNext != Aggressor)))
												RessConfig.PlayerScr.RemoveAggressor(Aggressor)
												RessConfig.MiscSpells[3].Cast(Aggressor, Victim) ; NVNAssautSPL
											Endif
										Endif
									Else
										If HealthThreshold(Victim, McmConfig.ThresholdNPCvsNPC, McmConfig.ChanceOnHitNPC)
											RessConfig.Knockdown(Victim, Aggressor, 60.0, "NPC")
											RessConfig.MiscSpells[3].Cast(Aggressor, Victim) ; NVNAssautSPL
										Endif
									Endif
								Endif
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

Event OnEnterBleedOut() ; fires Event OnCombatStateChanged 0
	If !SpamGuardBleedout
		SpamGuardBleedout = True
		If (RessConfig.NVNKDtype >= 2) ; Both or bleedout
			Actor Aggressor
			Actor Victim = (GetReference() As Actor)
			If Victim && !Victim.HasMagicEffect(RessConfig.MiscMagicEffects[0]) ; ImmunityEffect
				If (IsFollower && !McmConfig.AllowCvic)
					Return
				Endif
				If LastAggressor && IsAggressorValid(LastAggressor) && (LastAggressor.GetDistance(Victim) <= 2000.0) && (McmConfig.EveryoneNVN || RessConfig.SexCombination(LastAggressor, Victim, False))
					Aggressor = LastAggressor
				Else
					Aggressor = GetNearValidNPC(Victim)
				Endif
				If Aggressor
					If IsFollower
						RessConfig.Knockdown(Victim, Aggressor, 60.0, "Follower", IsBleedout = True)
						If !Player.HasKeyWordString("DefeatActive")
							RessConfig.MiscSpells[3].Cast(Aggressor, Victim) ; NVNAssautSPL
						Endif
					Else
						If McmConfig.AllowCagg && RessConfig.IsFollower(Aggressor)
							RessConfig.Knockdown(Victim, Aggressor, 60.0, "NPC", IsBleedout = True)
							RessConfig.MiscSpells[3].Cast(Aggressor, Victim) ; NVNAssautSPL
						Else
							If Aggressor.HasKeyWordString("DefeatAggPlayer")
								RessConfig.Knockdown(Victim, Aggressor, 60.0, "NPC", IsBleedout = True)
								Actor TheNext = RessConfig.PlayerScr.IsThereNext()
								If (!TheNext || (TheNext && (TheNext != Aggressor)))
									RessConfig.PlayerScr.RemoveAggressor(Aggressor)
									RessConfig.MiscSpells[3].Cast(Aggressor, Victim) ; NVNAssautSPL
								Endif
							Else
								RessConfig.Knockdown(Victim, Aggressor, 60.0, "NPC", IsBleedout = True)
								RessConfig.MiscSpells[3].Cast(Aggressor, Victim) ; NVNAssautSPL
							Endif
						Endif
					Endif
				Else
					If IsFollower
						RessConfig.Knockdown(Victim, None, 60.0, "Follower", IsBleedout = True)
					Endif
				Endif
			Endif
		Endif
		Utility.Wait(2.0)
		SpamGuardBleedout = False
	Endif
EndEvent

Actor Function GetNearValidNPC(Actor Victim)
	Cell CurrentCell = Victim.GetParentCell()
	Actor Found
	Int NumRefs = CurrentCell.GetNumRefs(62)
	While (NumRefs > 0)
		NumRefs -= 1
		Found = CurrentCell.GetNthRef(NumRefs, 62) as Actor
		If Found && (Found != Player) && IsAggressorValid(Found) && (Found.GetDistance(Victim) <= 2000.0)
			If (McmConfig.EveryoneNVN || RessConfig.SexCombination(Found, Victim, False))
				Return Found
			Endif
		Endif
	EndWhile
	Return None
EndFunction
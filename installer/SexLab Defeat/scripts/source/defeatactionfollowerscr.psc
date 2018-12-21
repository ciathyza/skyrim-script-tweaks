Scriptname DefeatActionFollowerScr Extends ActiveMagicEffect

DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto
DefeatActionScr Property ActionScr Auto
Import Utility

Spell Property HKMuffleFollowerSPL Auto
ReferenceAlias Property CommandTarget Auto
ReferenceAlias Property CommandFollower Auto
GlobalVariable Property FollowerApproach Auto

Event OnEffectStart(Actor akTarget, Actor Caster)
	If (FollowerApproach.GetValueInt() == 0)
		FollowerApproach.SetValue(2)
		Actor Follower = (CommandFollower.GetReference() As Actor)
		Actor Target = (CommandTarget.GetReference() As Actor)
		If (Follower && Target)
			If ((Follower.GetDistance(Target) < 2000) && !Follower.HasKeywordString("SexLabActive") && !Target.HasLos(Follower))
				String TheState = RessConfig.VictimState(Target)
				If (TheState == "")
					If !Target.IsInCombat()
						Follower.AddSpell(HKMuffleFollowerSPL)
						Wait(0.5)
						If !Input.IsKeyPressed(RessConfig.HotKeyInts[2]) ; Action key							; Stun
							Follower.Say(RessConfig.TopicToSay[14], Follower) ; Follower Agree
							FollowerApproach.SetValue(1) ; 1 - Sneak, 2 - Stand, 3 - Kill
							Follower.EvaluatePackage()
							ActionScr.ActionMessages[27].Show() ; HKCommandFollowerStunMess
							Int Attempts
							Bool Succes = False
							Int i = 10
							While (i > 0)
								i -= 1
								Wait(1.0)
								If ((Follower.GetDistance(Target) < 140) || Follower.IsInCombat() || Target.HasLos(Follower))
									i = 0
								Endif
							EndWhile
							If ((Follower.GetDistance(Target) < 170) && !Follower.IsInCombat() && !Target.HasLos(Follower))
								Target.PlayIdleWithTarget(RessConfig.KillMoves[0], Follower)
								Utility.Wait(0.1)
								If Follower.GetAnimationVariableBool("bIsSynced")
									If McmConfig.WitnessPagg
										RessConfig.DefeatRape.SendStoryEvent(None, Target, Follower)
										If RessConfig.AWitness
											RessConfig.AWitness.StartCombat(Follower)
											Debug.SendAnimationEvent(Follower, "IdleForceDefaultState")
											FollowerApproach.SetValue(0)
											RessConfig.AWitness = None
											Return
										Endif
									Endif
									float Await = 5.0
									While (Follower.GetAnimationVariableBool("bIsSynced") && (Await > 0.0))
										Wait(0.2)
										Await -= 0.2
									EndWhile
									RessConfig.MiscSpells[5].Cast(Follower, Target) ; ImmunitySPL
									RessConfig.Knockdown(Target, Follower, Type = "Player Aggressor")
								Endif
							Endif
						Else 																					; Kill
							If ActionScr.AllowFollower(Follower, Target)
								Follower.Say(RessConfig.TopicToSay[14], Follower) ; Follower Agree
								FollowerApproach.SetValue(3)
								ActionScr.ActionMessages[28].Show() ; HKCommandFollowerKillMess
								Follower.EvaluatePackage()
								Int i = 10
								While (i > 0)
									i -= 1
									Wait(1.0)
									If ((Follower.GetDistance(Target) < 140) || Follower.IsInCombat() || Target.HasLos(Follower))
										i = 0
									Endif
								EndWhile
								If ((Follower.GetDistance(Target) < 170) && !Follower.IsInCombat() && !Target.HasLos(Follower))
									Int WeaponType = Follower.GetEquippedItemType(1)
									Idle TheKillmove
									Bool Succes = False
									Int Attempts
									If (WeaponType == 1)						; Sword 1H back stab
										If (RandomInt(0, 1) == 0)
											TheKillmove = RessConfig.Killmoves[1]
										Else
											TheKillmove = RessConfig.Killmoves[2]
										Endif
									Elseif (WeaponType == 5)					; Sword 2H, back stab
										TheKillmove = RessConfig.Killmoves[3]
									Elseif (WeaponType == 2) 					; Dagger, slit throat
										TheKillmove = RessConfig.Killmoves[2]
									Else
										TheKillmove = RessConfig.Killmoves[4] 	; Neck break
									Endif
									While (!Succes && (Attempts < 5))	
										If Follower.PlayIdleWithTarget(TheKillmove, Target)
											Succes = True
										Endif
										Attempts += 1
									EndWhile
									If !Succes ; If for some reason the killmove does not trigger
										While (!Succes && (Attempts < 5))
											If Follower.PlayIdleWithTarget(RessConfig.Killmoves[4], Target)
												Succes = True
											Endif
											Attempts += 1
										EndWhile
									Endif
								Endif
							Endif
						Endif
						Wait(1.5)
						Follower.RemoveSpell(HKMuffleFollowerSPL)
					Else
						If Follower.IsWeaponDrawn()
							ActionScr.Taunt(Target, Follower)
						Endif
					Endif
				Else
					Follower.Say(RessConfig.TopicToSay[14], Follower) ; Follower Agree
					Follower.EvaluatePackage()
					Int i = 10
					While (i > 0)
						i -= 1
						Wait(1.0)
						If ((Follower.GetDistance(Target) < 140) || Follower.IsInCombat())
							i = 0
						Endif
					EndWhile
					If ((Follower.GetDistance(Target) < 170) && !Follower.IsInCombat())
						If (TheState == "Sex")
							ActionScr.TheShow(Target, Follower)
						Elseif ((TheState == "Knockdown") || (TheState == "Bleedout"))
							ActionScr.Stun(Target, Follower)
						Elseif (TheState == "Trauma")
							ActionScr.Trauma(Target, Follower)
						Elseif (TheState == "Exhausted")
							ActionScr.Trauma(Target, Follower, True)
						Elseif (TheState == "Tied")
							ActionScr.Tied(Target, Follower)
						Elseif (TheState == "Sleeping")
							ActionScr.Sleeping(Target, Follower)
						Elseif (TheState == "Escape")
							ActionScr.Escape(Target, Follower)
						Elseif (TheState == "Dead")
							ActionScr.Necro(Target, Follower)
						Endif
					Endif
					Follower.EvaluatePackage()
				Endif
			Else
				Follower.Say(RessConfig.TopicToSay[15], Follower) ; Refusal
			Endif
		Else
			If Follower
				Follower.Say(RessConfig.TopicToSay[15], Follower) ; Refusal
			Endif
		Endif
		Wait(0.5)
		FollowerApproach.SetValue(0)
		If Follower
			Follower.EvaluatePackage()
		Endif
	Endif
EndEvent
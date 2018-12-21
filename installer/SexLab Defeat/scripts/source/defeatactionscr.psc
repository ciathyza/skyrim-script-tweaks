Scriptname DefeatActionScr extends Quest

; Resources =============================
DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto
DefeatPlayer Property PlayerScr Auto
SexLabFramework SexLab
sslSystemConfig SexLabConfig
sslThreadController Controller
Import StorageUtil
Import Game
Import Utility
Import Debug
;========================================
Actor Property Player Auto
ReferenceAlias Property CommandTarget Auto
ReferenceAlias Property CommandFollower Auto
GlobalVariable Property FollowerApproach Auto
ObjectReference Property NecroChest Auto
Message[] Property ActionMessages Auto Hidden
EffectShader[] Property MiscEffectShader Auto Hidden
Spell[]	Property MiscSpells Auto Hidden
FormList[] Property MiscFormLists Auto Hidden
Faction WIAssaultedFaction
String[] WristPoses
String[] YokePoses
String[] ArmPoses
String[] PermaPoses
Bool HKPush = False
Bool Active = False

;Event OnInit()
;	Configure()
;EndEvent
Function Install()
	SexLab = SexLabUtil.GetAPI()
	SexLabConfig = SexLabUtil.GetConfig()
	WIAssaultedFaction = (GetFormFromFile(0x13EE4, "Skyrim.esm") As Faction)
	ActionMessages = New Message[30]
	ActionMessages[0] = (GetFormFromFile(0x50454, "SexLabDefeat.esp") As Message) 		; HKActionMess
	ActionMessages[1] = (GetFormFromFile(0x5B0D7, "SexLabDefeat.esp") As Message) 		; HKActionFollowerMess
	ActionMessages[2] = (GetFormFromFile(0xF5A94, "SexLabDefeat.esp") As Message) 		; HKKnockoutMess
	ActionMessages[3] = (GetFormFromFile(0x105D46, "SexLabDefeat.esp") As Message) 		; HKKnockoutFollowerMess
	ActionMessages[4] = (GetFormFromFile(0x89D14, "SexLabDefeat.esp") As Message) 		; HKSleepingMess
	ActionMessages[5] = (GetFormFromFile(0x89D16, "SexLabDefeat.esp") As Message) 		; HKSleepFollowerMess
	ActionMessages[6] = (GetFormFromFile(0x8772D, "SexLabDefeat.esp") As Message) 		; HKTraumaMess
	ActionMessages[7] = (GetFormFromFile(0xF34D8, "SexLabDefeat.esp") As Message) 		; HKTraumaFollowerMess
	ActionMessages[8] = (GetFormFromFile(0x617CD, "SexLabDefeat.esp") As Message) 		; HKRobMess
	ActionMessages[9] = (GetFormFromFile(0x61D30, "SexLabDefeat.esp") As Message)		; HKRobFollowerMess
	ActionMessages[10] = (GetFormFromFile(0x89D15, "SexLabDefeat.esp") As Message)		; HKRobLimitedMess
	ActionMessages[11] = (GetFormFromFile(0x866D8, "SexLabDefeat.esp") As Message)		; HKMasturbateMess
	ActionMessages[12] = (GetFormFromFile(0xEBE4F, "SexLabDefeat.esp") As Message) 		; HKCommandMarkedMess
	ActionMessages[13] = (GetFormFromFile(0x10424D, "SexLabDefeat.esp") As Message) 	; HKBurlapSackMess
	ActionMessages[14] = (GetFormFromFile(0x866D6, "SexLabDefeat.esp") As Message)		; HKFollowerRegisteredMess
	ActionMessages[15] = (GetFormFromFile(0x51481, "SexLabDefeat.esp") As Message) 		; HKTiedUpMess
	ActionMessages[16] = (GetFormFromFile(0x5B0D8, "SexLabDefeat.esp") As Message) 		; HKTiedUpFollowerMess
	ActionMessages[17] = (GetFormFromFile(0x106D6D, "SexLabDefeat.esp") As Message) 	; HKOnFollowerYN
	ActionMessages[18] = (GetFormFromFile(0x1072D2, "SexLabDefeat.esp") As Message) 	; HKTiedUpOptionMess
	ActionMessages[19] = (GetFormFromFile(0x108DDA, "SexLabDefeat.esp") As Message) 	; HKEscapeMess
	ActionMessages[20] = (GetFormFromFile(0x108DDA, "SexLabDefeat.esp") As Message) 	; HKEscapeFollowerMess
	ActionMessages[21] = (GetFormFromFile(0x110AE2, "SexLabDefeat.esp") As Message) 	; HKExhaustedMess
	ActionMessages[22] = (GetFormFromFile(0x110AE3, "SexLabDefeat.esp") As Message) 	; HKExhaustedFollowerMess
	ActionMessages[23] = (GetFormFromFile(0x113B74, "SexLabDefeat.esp") As Message) 	; HKTiedUpDeviceMess
	ActionMessages[24] = (GetFormFromFile(0x113B75, "SexLabDefeat.esp") As Message) 	; HKTiedUpDevChangeMess
	ActionMessages[25] = (GetFormFromFile(0x87CA3, "SexLabDefeat.esp") As Message)	 	; HKNecroMess
	ActionMessages[26] = (GetFormFromFile(0x87CA4, "SexLabDefeat.esp") As Message) 		; HKNecroFollowerMess
	ActionMessages[27] = (GetFormFromFile(0x78EEA, "SexLabDefeat.esp") As Message) 		; HKCommandFollowerStunMess
	ActionMessages[28] = (GetFormFromFile(0xEBE4D, "SexLabDefeat.esp") As Message) 		; HKCommandFollowerKillMess
	ActionMessages[29] = (GetFormFromFile(0x1176CF, "SexLabDefeat.esp") As Message) 	; HKTiedRapeLinksMess 
	MiscSpells = New Spell[2]
	MiscSpells[0] = (GetFormFromFile(0x4DE89, "SexLabDefeat.esp") As Spell) 				; HKActionSPL
	MiscSpells[1] = (GetFormFromFile(0x50452, "SexLabDefeat.esp") As Spell) 				; HKActionFollowerSPL
	MiscEffectShader = New EffectShader[2]
	MiscEffectShader[0] = (GetFormFromFile(0xEBE50, "SexLabDefeat.esp") As EffectShader) ; MarkFXS
	MiscEffectShader[1] = (GetFormFromFile(0xECE7B, "SexLabDefeat.esp") As EffectShader) ; RegisterFXS
	MiscFormLists = New FormList[1]
	MiscFormLists[0] = (GetFormFromFile(0xDC642, "SexLabDefeat.esp") As FormList) 	; MiscStuff
	WristPoses = New String[13]
	WristPoses[0] = "(Wri01) Legs spread" 						; ZapWriPose01 / ZapWriStruggle01
	WristPoses[1] = "(Wri04) Standing bend over, legs spread"	; ZapWriPose04 / ZapWriStruggle03
	WristPoses[2] = "(Wri05) Standing, legs spread"				; ZapWriPose05 / ZapWriStruggle05
	WristPoses[3] = "(Wri06) Standing on knees"					; ZapWriPose06 / ZapWriStruggle06
	WristPoses[4] = "(Wri07) Standing on knees, legs spread"	; ZapWriPose07 / ZapWriStruggle07
	WristPoses[5] = "(Wri08) Standing on knees, bent over"		; ZapWriPose08 / ZapWriStruggle08
	WristPoses[6] = "(Wri09) Sitting squat"						; ZapWriPose09 / ZapWriStruggle09
	WristPoses[7] = "(Wri10) Sitting squat, legs spread"		; ZapWriPose10 / ZapWriStruggle10
	WristPoses[8] = "(Wri11) Hogtie"							; ZapWriPose11 / ZapWriStruggle11
	WristPoses[9] = "(Wri12) Hogtie, legs spread"				; ZapWriPose12 / ZapWriStruggle12
	WristPoses[10] = "(Wri13) Hogtie, lie on side"				; ZapWriPose13 / ZapWriStruggle13
	WristPoses[11] = "(Wri14) Lie on side, sleeping position"	; ZapWriPose14 / ZapWriStruggle14
	WristPoses[12] = "(Wri15) Lie on stomach, not sleeping"		; ZapWriPose15 / ZapWriStruggle15
	YokePoses = New String[11]
	YokePoses[0] = "(Yoke01) Legs spread"						; ZapYokePose01 / ZapYokeStruggle01
	YokePoses[1] = "(Yoke04) Standing bend over, legs spread"	; ZapYokePose04 / ZapYokeStruggle03
	YokePoses[2] = "(Yoke05) Standing, legs spread"				; ZapYokePose05 / ZapYokeStruggle05
	YokePoses[3] = "(Yoke06) Standing on knees"					; ZapYokePose06 / ZapYokeStruggle06
	YokePoses[4] = "(Yoke07) Standing on knees, legs spread"	; ZapYokePose07 / ZapYokeStruggle07
	YokePoses[5] = "(Yoke08) Standing on knees, bent over"		; ZapYokePose08 / ZapYokeStruggle08
	YokePoses[6] = "(Yoke09) Sitting squat"						; ZapYokePose09 / ZapYokeStruggle09
	YokePoses[7] = "(Yoke10) Sitting squat, legs spread"		; ZapYokePose10 / ZapYokeStruggle10
	YokePoses[8] = "(Yoke11) Hogtie"							; ZapYokePose11 / ZapYokeStruggle11
	YokePoses[9] = "(Yoke12) Hogtie, legs spread"				; ZapYokePose12 / ZapYokeStruggle12
	YokePoses[10] = "(Yoke15) Lie on stomach, not sleeping"		; ZapYokePose15 / ZapYokeStruggle15
	ArmPoses = New String[13]
	ArmPoses[0] = "(Armb01) Legs spread"						; ZapArmbPose01 / ZapArmbStruggle01
	ArmPoses[1] = "(Armb04) Standing bend over, legs spread"	; ZapArmbPose04 / ZapArmbStruggle03
	ArmPoses[2] = "(Armb05) Standing, legs spread"				; ZapArmbPose05 / ZapArmbStruggle05
	ArmPoses[3] = "(Armb06) Standing on knees"					; ZapArmbPose06 / ZapArmbStruggle06
	ArmPoses[4] = "(Armb07) Standing on knees, legs spread"		; ZapArmbPose07 / ZapArmbStruggle07
	ArmPoses[5] = "(Armb08) Standing on knees, bent over"		; ZapArmbPose08 / ZapArmbStruggle08
	ArmPoses[6] = "(Armb09) Sitting squat"						; ZapArmbPose09 / ZapArmbStruggle09
	ArmPoses[7] = "(Armb10) Sitting squat, legs spread"			; ZapArmbPose10 / ZapArmbStruggle10
	ArmPoses[8] = "(Armb11) Hogtie"								; ZapArmbPose11 / ZapArmbStruggle11
	ArmPoses[9] = "(Armb12) Hogtie, legs spread"				; ZapArmbPose12 / ZapArmbStruggle12
	ArmPoses[10] = "(Armb13) Hogtie, lie on side"				; ZapArmbPose13 / ZapArmbStruggle13
	ArmPoses[11] = "(Armb14) Lie on side, sleeping position"	; ZapArmbPose14 / ZapArmbStruggle14
	ArmPoses[12] = "(Armb15) Lie on stomach, not sleeping"		; ZapArmbPose15 / ZapArmbStruggle15
	PermaPoses = New String[14]
	PermaPoses[0] = "(APCAO315) Chained Celling hanging" 		; ZazAPCAO315
	PermaPoses[1] = "(APCAO301) Chained Celling 01"				; ZazAPCAO301
	PermaPoses[2] = "(APCAO302) Chained Celling 02" 			; ZazAPCAO302
	PermaPoses[3] = "(APCAO303) Chained Celling 03" 			; ZazAPCAO303
	PermaPoses[4] = "(APCAO304) Chained Celling 04" 			; ZazAPCAO304
	PermaPoses[5] = "(APCAO305) Chained Celling 05" 			; ZazAPCAO305
	PermaPoses[6] = "(APCAO306) Chained Celling 06"				; ZazAPCAO306
	PermaPoses[7] = "(APCAO307) Chained Celling 07"				; ZazAPCAO307
	PermaPoses[8] = "(APCAO308) Chained Celling 08" 			; ZazAPCAO308
	PermaPoses[9] = "(APCAO309) Chained Celling 09" 			; ZazAPCAO309
	PermaPoses[10] = "(APCAO310) Chained Floor 01" 				; ZazAPCAO310
	PermaPoses[11] = "(APCAO312) Chained Floor 02" 				; ZazAPCAO312
	PermaPoses[12] = "(APCAO313) Chained Floor 03"				; ZazAPCAO313
	PermaPoses[13] = "(APCAO314) Chained Floor 04"				; ZazAPCAO314
	Configure()
EndFunction
Function Uninstall()
	UnregisterForAllKeys()
	GoToState("Inactive")
EndFunction
Function Clean()
	FollowerApproach.SetValue(0)
	HKPush = False
	Active = False
	RessConfig.SOCleanUp()
EndFunction
Function Configure()
	Hkrefresh()
	If (GetState() != "Carrying")
		GoToState("Running")
	Endif
EndFunction
Function Hkrefresh()
	UnregisterForAllKeys()
	RegisterForKey(RessConfig.HotKeyInts[2]) ; Action key
EndFunction
State Inactive
EndState

Bool Function MarkTarget(Actor Target)
	Actor MarkedOne = (CommandTarget.GetReference() As Actor)
	If (!MarkedOne || MarkedOne && (MarkedOne != Target))
		CommandTarget.ForceRefTo(Target)
		(CommandTarget as Defeathkactiontarget).Filled()
		If McmConfig.MarkNotification
			ActionMessages[12].Show() ; HKCommandMarkedMess
		Endif
		If McmConfig.MarkHighlight
			MiscEffectShader[0].Play(Target, 0.5) ; MarkFXS
		Endif
		Return True
	Endif
	Return False
EndFunction
Bool Function RegisterFollower(Actor Target)
	Actor TheFollower = (CommandFollower.GetReference() As Actor)
	If (!TheFollower || TheFollower && (TheFollower != Target))
		CommandFollower.ForceRefTo(Target)
		If McmConfig.MarkNotification
			ActionMessages[14].Show() ; HKFollowerRegisteredMess
		Endif
		If McmConfig.MarkHighlight
			MiscEffectShader[1].Play(Target, 0.5) ; RegisterFXS
		Endif
		Return True
	Endif
	Return False
EndFunction

Bool Function IsVampireLord(Actor Target)
	Return (RessConfig.DawnguardOn && (Target.GetRace() == RessConfig.VampireLordRace))
EndFunction
State Running
	Event OnKeyDown(Int KeyCode)
		If (KeyCode == RessConfig.HotKeyInts[2])
			If (!Active && !HKPush && !IsInMenuMode() && !Player.HasKeyWordString("SexLabActive"))
				HKPush = True
				Bool Modifier = Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
				Actor Target = (GetCurrentCrosshairRef() As Actor)
				If Target
					Bool IsFollower = RessConfig.IsFollower(Target)
					If Modifier
						If IsFollower
							RegisterFollower(Target)
						Else
							MarkTarget(Target)
							MiscSpells[1].Cast(Player) ; HKActionFollowerSPL
						Endif
					Else
;						Bool Valid = (Target.HasKeyWordString("ActorTypeNPC") || Target.HasKeyWordString("ActorTypeCreature"))
;						If Valid
							String TheState = RessConfig.VictimState(Target)
							If (TheState == "")
								If (Target.HasKeyWordString("DefeatActive") && (Target.GetFactionRank(RessConfig.DefeatFactions[1]) == 1)) ; Push a NVN aggressor to rescue their victim
									Rescue(Target, Player)
								Elseif (!Target.Haslos(Player) && !IsFollower && Target.HasKeyWordString("ActorTypeNPC") && !Target.IsInCombat())
									Wait(0.5)
									If (Input.IsKeyPressed(RessConfig.HotKeyInts[2]) && Player.IsWeaponDrawn()) ; Action key
										ActorBase VicActorBase = Target.GetLeveledActorBase()
										If VicActorBase.IsEssential()
											VicActorBase.SetEssential(False)
										Endif
										If VicActorBase.IsProtected()
											VicActorBase.SetProtected(False)
										Endif
										If (!VicActorBase.IsEssential() && !VicActorBase.IsProtected())									; Kill
											Int WeaponType = Player.GetEquippedItemType(1)
											Idle TheKillmove
											Bool Succes = False
											Int Attempts = 0
											If (WeaponType == 1)						; Sword 1H back stab & slit throat
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
												If Player.PlayIdleWithTarget(TheKillmove, Target)
													Succes = True
												Endif
												Attempts += 1
											EndWhile
											If !Succes ; If for some reason the killmove does not trigger
												While (!Succes && (Attempts < 5))
													If Player.PlayIdleWithTarget(RessConfig.Killmoves[4], Target)
														Succes = True
													Endif
													Attempts += 1
												EndWhile
											Endif
										Else
											Debug.Notification("$This NPC can't be killed.")
										Endif
									Elseif Player.IsWeaponDrawn()																		; Yield
										Player.Say(RessConfig.TopicToSay[1], Target) ; Attack
										Wait(1.0)
										Target.Say(RessConfig.TopicToSay[3], Player) ; Flee
										RessConfig.Yield(Target, Player)
									Else 																								; Stun
										Target.PlayIdleWithTarget(RessConfig.KillMoves[0], Player)
										Wait(0.3)
										If Player.GetAnimationVariableBool("bIsSynced")
											If WitnessAlarm(Target, Player)
												SendAnimationEvent(Player, "IdleForceDefaultState")
												HKPush = False
												Return
											Endif
											float i = 5.0
											While (Player.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
												Wait(0.2)
												i -= 0.2
											EndWhile
											RessConfig.CastImmune(Player)
											RessConfig.Knockdown(Target, Player, Type = "Player Aggressor")
										Endif
									Endif
								Else
									MiscSpells[0].Cast(Player) ; HKActionSPL
								Endif
							Else
								If (TheState == "Sex")
									If !Player.IsWeaponDrawn()
										If IsFollower
											Cheer(Target, Player)
										Else
											TheShow(Target, Player)
										Endif
									Else
										Rescue(Target, Player)
									Endif
								Elseif ((TheState == "Knockdown") || (TheState == "Bleedout"))
									Stun(Target, Player)
								Elseif (TheState == "Trauma")
									Trauma(Target, Player)
								Elseif (TheState == "Exhausted")
									Trauma(Target, Player, True)
								Elseif (TheState == "Escape")
									Escape(Target, Player)
								Elseif (TheState == "Sleeping")
									Sleeping(Target, Player)
								Elseif (TheState == "Tied")
									Tied(Target, Player)
								Elseif (TheState == "Knockout") 
									Knockout(Target, Player)
								Elseif (TheState == "Dead")
									Necro(Target, Player)
								Endif
							Endif
;						Endif
					Endif
				Else
					MiscSpells[0].Cast(Player) ; HKActionSPL
				Endif
				HKPush = False
			Endif
		Endif
	EndEvent
	Event OnKeyUp(Int KeyCode, Float HoldTime)
		If ((KeyCode == RessConfig.HotKeyInts[2]) && (HoldTime > 1.5)) ; Action key
			If (!Active && !HKPush && !IsInMenuMode() && !Player.HasKeyWordString("DefeatActive"))
				If (!GetCurrentCrosshairRef() as Actor)
					If (Player.IsSneaking() && !Player.IsWeaponDrawn() && !Input.IsKeyPressed(RessConfig.HotKeyInts[1])) ; Modifier key
						Int Button = ActionMessages[11].Show() ; HKMasturbateMess
						If (Button == 1)
							Masturbate(Player)
						Endif
					Endif
				Endif
			Endif
		Endif
	EndEvent
EndState
State Carrying
	Event OnKeyDown(Int KeyCode)
		If (KeyCode == RessConfig.HotKeyInts[2]) ; Action key
			If (!Active && !HKPush && !IsInMenuMode() && !Player.HasKeyWordString("DefeatActive"))
				HKPush = True
				Actor Target = (GetCurrentCrosshairRef() as Actor)
				Bool Modifier = Input.IsKeyPressed(RessConfig.HotKeyInts[1]) ; Modifier key
				If Target
					Bool IsFollower = RessConfig.IsFollower(Target)
					If Modifier
						If IsFollower 
							RegisterFollower(Target)
						Else
							MarkTarget(Target)
							MiscSpells[1].Cast(Player) ; HKActionFollowerSPL
						Endif
					Endif
				Else
					If Modifier
						MiscSpells[0].Cast(Player) ; HKActionSPL
					Else
						Int Button = ActionMessages[13].Show() ; HKBurlapSackMess
						If (Button == 1)
							OptionOutOfBag(Player)
							GoToState("Running")
						Endif
					Endif
				Endif
				HKPush = False
			Endif
		Endif
	EndEvent
EndState

Bool Function WitnessAlarm(Actor Target, Actor Aggressor)
	If McmConfig.WitnessPagg
		RessConfig.DefeatRape.SendStoryEvent(None, Target, Aggressor)
		Wait(0.5)
		Actor TheWitness = RessConfig.AWitness
		If TheWitness
			RessConfig.UILib.ShowNotification("${"+TheWitness.GetLeveledActorBase().GetName()+"} witnesses what is happenning and send the alarm!", "#CD4C4C")
			TheWitness.SendAssaultAlarm()
			RessConfig.AWitness = None
			Return True
		Endif
	Endif
	Return False
EndFunction

Function Taunt(Actor Victim, Actor Aggressor)																			;===== TAUNT
	If !Active
		Active = True
		Bool IsPlayer = (Aggressor == Player)
		If Victim.IsInCombat()
			If IsPlayer
				ForceThirdPerson()
				SendAnimationEvent(Aggressor, "IdleCombatStart")
				Aggressor.Say(RessConfig.TopicToSay[9], Aggressor) ; PowerAttack
				Wait(1.5)
			Else
				Float zOffset = Aggressor.GetHeadingAngle(Victim)
				Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)
				SendAnimationEvent(Aggressor, "IdleCombatStart")
				Aggressor.Say(RessConfig.TopicToSay[5], Victim) ; Taunt
				Wait(1.5)
			Endif
			Actor OriginalTarget = Victim.GetCombatTarget()
			If OriginalTarget
				Victim.GetCombatTarget().StopCombatAlarm()
				Victim.StartCombat(Aggressor)
			Else
				Victim.StartCombat(Aggressor)
			Endif
		Else
			If IsPlayer
				If (RessConfig.VictimState(Victim) == "")
					Int RelationRank = Victim.GetRelationshipRank(Aggressor)
					SendAnimationEvent(Aggressor, "IdleCombatStart")
					ForceThirdPerson()
					Wait(0.50)
					Aggressor.Say(RessConfig.TopicToSay[9], Aggressor) ; PowerAttack
					Wait(1.0)
					If (RelationRank < -1)
						Victim.StartCombat(Aggressor)
					Else
						Victim.Say(RessConfig.TopicToSay[5], Aggressor) ; Taunt
						Victim.SetRelationshipRank(Aggressor, (RelationRank - 1))
					Endif
				Endif
			Endif
		Endif
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function Rescue(Actor Victim, Actor Aggressor)																				;===== RESCUE
	If !Active
		Active = True
		If Victim.HasKeyWordString("SexLabActive")
			Controller = SexLab.GetActorController(Victim)
			If (Controller.VictimRef && (Victim != Controller.VictimRef))
				RessConfig.CastImmune(Controller.VictimRef)
			Endif
			Controller.EndAnimation()
			RessConfig.SoundToPlay[8].Play(Aggressor) ; Rescue
			Aggressor.PushActorAway(Victim, 5.0)
		Else
			RessConfig.CastImmune(Victim)
			RessConfig.SoundToPlay[8].Play(Aggressor) ; Rescue
			Aggressor.PushActorAway(Victim, 5.0)
		Endif
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function Cheer(Actor Victim, Actor Aggressor)																				;===== CHEER		
	If !Active
		Active = True
		ForceThirdPerson()
		SendAnimationEvent(Aggressor, "IdleCivilWarCheer")
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function TheShow(Actor Victim, Actor Aggressor, Bool ByPerk = False)														;===== MASTURBATE
	If !Active
		Active = True
		Float zOffset = Aggressor.GetHeadingAngle(Victim)
		If !ByPerk
			Int Button = 0 
			Button = ActionMessages[11].Show() ; HKMasturbateMess
			If (Button == 1)
				ForceThirdPerson()
				Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)
				Masturbate(Aggressor)
			Endif
		Else
			ForceThirdPerson()
			Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)
			Masturbate(Aggressor)
		Endif
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function Masturbate(Actor Aggressor)
	sslThreadModel Make = SexLab.NewThread()
	sslBAseAnimation[] Anims
	Int Gender = SexLab.GetGender(Aggressor)
	If (Gender == 1)
		Anims = SexLab.GetAnimationsByType(1, Females = 1)
	Elseif (Gender == 0)
		Anims = SexLab.GetAnimationsByType(1, Males = 1)
	Endif
	Make.AddActor(Aggressor)	
	Make.SetAnimations(Anims)
	Make.StartThread()
EndFunction

Function Stun(Actor Victim, Actor Aggressor)																				;===== KNOCKDOWN
	If !Active
		Active = True
		RessConfig.Knockdown(Victim, Aggressor, Type = "Player Aggressor")
		Int Button = 10
		Bool InMenu = True
		Message OptionMessage
		Bool IsPlayer = (Aggressor == Player)
		If IsPlayer
			OptionMessage = ActionMessages[0] ; HKActionMess
		Else
			Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + Aggressor.GetHeadingAngle(Victim))
			OptionMessage = ActionMessages[1] ; HKActionFollowerMess
		Endif
		While InMenu
			If (Button == 10)
				Button = OptionMessage.Show()
				If (Button == 1)													 ; Inventory
					RessConfig.SetEmptyOutfit(Victim)
					Victim.OpenInventory(True)
				Elseif (Button == 2)												 ; Tie up
					Bool IsFollower = RessConfig.IsFollower(Victim)
					If IsFollower
						Button = ActionMessages[17].Show() ; HKOnFollowerYN
						If (Button == 0)
							OptionTieUp(Victim, Aggressor, IsPlayer)
						Else
							Button = 10
						Endif
					Else
						OptionTieUp(Victim, Aggressor, IsPlayer)
					Endif
				Elseif (Button == 3)												 ; Undress
					Button = OptionUndress(Victim, Aggressor, IsPlayer)
				Elseif (Button == 4)												 ; Kill
					OptionKill(Victim, Aggressor, IsPlayer, "Knockdown")
				Elseif (Button == 5)												 ; Rape
					Button = ActionMessages[17].Show() ; HKOnFollowerYN
					If (Button == 0)
						If IsPlayer
							;RessConfig.Knockdown(Victim, Uncalm = False, Enter = False)
							If McmConfig.KDResistPagg
								RessConfig.StruggleSceneTrigger(Aggressor, Victim, "Player Aggressor")
								If WitnessAlarm(Victim, Aggressor)
									RessConfig.StruggleCancel()
								Endif
							Else
								OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
							Endif
						Else
							OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
						Endif
					Else
						Button = 10
					Endif
				Elseif (Button == 6)												 ; Rape With Player
					If Victim.HasKeyWordString("ActorTypeNPC")
						Button = ActionMessages[17].Show() ; HKOnFollowerYN
						If (Button == 0)
							OptionRape(Victim, Aggressor, Player)
						Else
							Button = 10
						Endif
					Else
						Notification("$You can't do this.")
					Endif
				Elseif (Button == 7)												 ; Feed
					OptionFeed(Victim, Aggressor, IsPlayer)
				Elseif (Button == 8)												 ; Revive
					OptionRevive(Victim, Aggressor)
				Endif
			Else
				InMenu = False
			Endif
		EndWhile
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function Knockout(Actor Victim, Actor Aggressor)																				;===== KNOCKED OUT
	If !Active
		Active = True
		RessConfig.Calm(Victim)
		RessConfig.Knockout(Victim)
		Int Button
		Bool IsPlayer = (Aggressor == Player)
		If IsPlayer
			Button = ActionMessages[2].Show() ; HKKnockoutMess
		Else
			Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + Aggressor.GetHeadingAngle(Victim))
			Button = ActionMessages[3].Show() ; HKKnockoutFollowerMess
		Endif
		If (Button == 1) 												; Inventory
			RessConfig.SetEmptyOutfit(Victim)
			Victim.OpenInventory(True)
		Elseif (Button == 2)											; Undress
			Button = OptionUndress(Victim, Aggressor, IsPlayer)
		Elseif (Button == 3)											; Wake and yield
			RessConfig.Knockout(Victim, UnCalm = False, Enter = False)
			int i = 5
			While (Victim.GetAnimationVariableBool("bIsSynced") && (i > 0))
				i -= 1
				Wait(1.0)
			EndWhile
			Victim.Say(RessConfig.TopicToSay[3], Player) ; Flee
			RessConfig.Yield(Victim, Player)
		Elseif (Button == 4) 											; Wake and tie
			RessConfig.Knockout(Victim, UnCalm = False, Enter = False)
			int i = 5
			While (Victim.GetAnimationVariableBool("bIsSynced") && (i > 0))
				i -= 1
				Wait(1.0)
			EndWhile
			Bool IsFollower = RessConfig.IsFollower(Victim)
			If IsFollower
				Button = ActionMessages[17].Show() ; HKOnFollowerYN
				If (Button == 0)
					OptionTieUp(Victim, Aggressor, IsPlayer)
				Else
					Button = 10
				Endif
			Else
				OptionTieUp(Victim, Aggressor, IsPlayer)
			Endif
		Elseif (Button == 5)											; Put in bag
			OptionPutInBag(Victim, Aggressor, IsPlayer)
		Elseif (Button == 6)											; Revive
			OptionRevive(Victim, Aggressor)
		Endif
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function Trauma(Actor Victim, Actor Aggressor, Bool Exhausted = False)															;===== TRAUMA & EXHAUSTED
	If !Active
		Active = True
		SendAnimationEvent(Victim, GetStringValue(Victim, "DefeatStateAnim"))
		Int Button = 10
		Bool InMenu = True
		Message OptionMessage
		Bool IsPlayer = (Aggressor == Player)
		If IsPlayer
			If Exhausted
				OptionMessage = ActionMessages[21] ; HKExhaustedMess
			Else
				OptionMessage = ActionMessages[6] ; HKTraumaMess
			Endif
		Else
			Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + Aggressor.GetHeadingAngle(Victim))
			If Exhausted
				OptionMessage = ActionMessages[22] ; HKExhaustedFollowerMess
			Else
				OptionMessage = ActionMessages[7] ; HKTraumaFollowerMess
			Endif
		Endif
		While InMenu
			If (Button == 10)
				Button = OptionMessage.Show()
				If (Button == 1) 													; Inventory	
					RessConfig.SetEmptyOutfit(Victim)										
					Victim.OpenInventory(True)
				Elseif (Button == 2)												; Tie up
					Bool IsFollower = RessConfig.IsFollower(Victim)
					If IsFollower
						Button = ActionMessages[17].Show() ; HKOnFollowerYN
						If (Button == 0)
							OptionTieUp(Victim, Aggressor, IsPlayer)
						Else
							Button = 10
						Endif
					Else
						OptionTieUp(Victim, Aggressor, IsPlayer)
					Endif
				Elseif (Button == 3)												; Undress
					Button = OptionUndress(Victim, Aggressor, IsPlayer)
				Elseif (Button == 4) 												; Kill
					OptionKill(Victim, Aggressor, IsPlayer, "Trauma")
				Elseif (Button == 5)												; Rape
					Button = ActionMessages[17].Show() ; HKOnFollowerYN
					If (Button == 0)
						OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
					Else
						Button = 10
					Endif
				Elseif (Button == 6)												; Rape With Player
					If Victim.HasKeyWordString("ActorTypeNPC")
						Button = ActionMessages[17].Show() ; HKOnFollowerYN
						If (Button == 0)
							OptionRape(Victim, Aggressor, Player)
						Else
							Button = 10
						Endif
					Else
						Notification("$You can't do this.")
					Endif
				Elseif (Button == 7)												; Feed
					OptionFeed(Victim, Aggressor, IsPlayer)
				Elseif (Button == 8)												; Appease
					OptionRevive(Victim, Aggressor)
				Endif
			Else
				InMenu = False
			Endif
		EndWhile
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function Escape(Actor Victim, Actor Aggressor)		
	If !Active
		Active = True
		Int Button
		Bool IsPlayer = (Aggressor == Player)
		If IsPlayer
			Button = ActionMessages[19].Show() ; HKEscapeMess
		Else
			Button = ActionMessages[20].Show() ; HKEscapeFollowerMess
		Endif
		If (Button == 1)													; Appease
			OptionRevive(Victim, Aggressor)
		Endif
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function Sleeping(Actor Victim, Actor Aggressor)																			;===== SLEEPING
	If !Active
		Active = True
		Int Button = 10
		Bool InMenu = True
		Message OptionMessage
		Bool IsPlayer = (Aggressor == Player)
		If IsPlayer
			OptionMessage = ActionMessages[4] ; HKSleepingMess
		Else
			Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + Aggressor.GetHeadingAngle(Victim))
			OptionMessage = ActionMessages[5] ; HKSleepFollowerMess
		Endif
		While InMenu
			If (Button == 10)
				Button = OptionMessage.Show()
				If (Button == 1)													; Limited undress
					Button = OptionUndress(Victim, Aggressor, IsPlayer, True)
				Elseif (Button == 2) 												; Kill
					OptionKill(Victim, Aggressor, IsPlayer, "Sleeping")
				Elseif (Button == 3)												; Rape
					Button = ActionMessages[17].Show() ; HKOnFollowerYN
					If (Button == 0)
						OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
					Else
						Button = 10
					Endif
				Elseif (Button == 4)												; Rape With Player
					If Victim.HasKeyWordString("ActorTypeNPC")
						Button = ActionMessages[17].Show() ; HKOnFollowerYN
						If (Button == 0)
							OptionRape(Victim, Aggressor, Player)
						Else
							Button = 10
						Endif
					Else
						Notification("$You can't do this.")
					Endif
				Elseif (Button == 5) 												; Put in sack
		 			RessConfig.Knockout(Victim)
					OptionPutInBag(Victim, Aggressor, IsPlayer)
				Endif
			Else
				InMenu = False
			Endif
		EndWhile
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function Tied(Actor Victim, Actor Aggressor)																				;===== TIED
	If !Active
		Active = True
		Int Button = 10
		Bool InMenu = True
		Message OptionMessage
		Bool IsPlayer = (Aggressor == Player)
		If IsPlayer
			OptionMessage = ActionMessages[15] ; HKTiedUpMess
		Else
			Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + Aggressor.GetHeadingAngle(Victim))
			OptionMessage = ActionMessages[16] ; HKTiedUpPartnerMess
		Endif
		While InMenu
			If (Button == 10)
				Button = OptionMessage.Show()
				If (Button == 1) 													; Open inventory
					RessConfig.SetEmptyOutfit(Victim)												
					Victim.OpenInventory(True)
				Elseif (Button == 2) 												; Undress
					Button = OptionUndress(Victim, Aggressor, IsPlayer)
				Elseif (Button == 3) 												; Kill
					OptionKill(Victim, Aggressor, IsPlayer, "Tied")
				Elseif (Button == 4)												; Rape
					Bool IsFollower = RessConfig.IsFollower(Victim)
					DefeatStateMonitoringScr Slot = RessConfig.GetTiedSlot(Victim)
					If IsFollower
						Button = ActionMessages[17].Show() ; HKOnFollowerYN
						If (Button == 0)
							Form Device = Victim.GetWornForm(0x20000000)
							If Device && Device.HasKeyWordString("DefeatWornDevice") || Slot.Permanent
								Button = ActionMessages[29].Show() ; HKTiedRapeLinksMess
								If (Button == 1) ; Bound Rape
									OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
								Elseif (Button == 2) ; Rape
									if Device
										Victim.UnequipItem(Device)
									endif
									OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
								Elseif (Button == 3) ; Untie & Rape
									RessConfig.CastImmune(Victim)
									OptionUntie(Victim, Aggressor, IsPlayer, True)
									OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
								Else
									Button = 10
								Endif
							Endif
						Else
							Button = 10
						Endif
					Else
						Button = ActionMessages[29].Show() ; HKTiedRapeLinksMess
						Form Device = Victim.GetWornForm(0x20000000)
						If Device && Device.HasKeyWordString("DefeatWornDevice") || Slot.Permanent
							If (Button == 1) ; Bound Rape
								OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
							Elseif (Button == 2) ; Rape
								if Device
									Victim.UnequipItem(Device)
								endif
								OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
							Elseif (Button == 3) ; Untie & Rape
								RessConfig.CastImmune(Victim)
								OptionUntie(Victim, Aggressor, IsPlayer, True)
								OptionRape(Victim, Aggressor, IsPlayer = IsPlayer)
							Else
								Button = 10
							Endif
						Endif
					Endif
				Elseif (Button == 5)												; Rape With Player
					If Victim.HasKeyWordString("ActorTypeNPC")
						Button = ActionMessages[17].Show() ; HKOnFollowerYN
						If (Button == 0)
							OptionRape(Victim, Aggressor, Player)
						Else
							Button = 10
						Endif
					Else
						Notification("$You can't do this.")
					Endif
				Elseif (Button == 6)												; Tie up options
					DefeatStateMonitoringScr Slot = RessConfig.GetTiedSlot(Victim)
					RessConfig.TiedPermanent = Slot.Permanent
					Bool InSubMenu = True
					Button = 10
					While InSubMenu
						If (Button == 10)
							Button = ActionMessages[18].Show() ; HKTiedUpOptionMess
							If (Button == 1)												; Pose
								If (Slot.ActiveDevice == "")
									String ThePose
									String StrugglePose
									Int Selected
									If !Slot.Permanent
										Form Device = Victim.GetWornForm(0x20000000)
										If (Device && Device.HasKeyWordString("DefeatWornYoke"))
											Int n = YokePoses.Length
											UIExtensions.InitMenu("UIListMenu")
											UIExtensions.SetMenuPropertyInt("UIListMenu", "totalEntries", n)
											Int i
											While (i < n)
												UIExtensions.SetMenuPropertyIndexString("UIListMenu", "entryName", i, YokePoses[i])
												UIExtensions.SetMenuPropertyIndexInt("UIListMenu", "entryId", i, i)
												i += 1
											EndWhile
											UIExtensions.OpenMenu("UIListMenu")
											Selected = UIExtensions.GetMenuResultInt("UIListMenu")
											If (Selected == 0)
												ThePose = "ZapYokePose01" ; Legs spread
												StrugglePose = "ZapYokeStruggle01"
											Elseif (Selected == 1)
												ThePose = "ZapYokePose04" ; Standing bend over, legs spread
												StrugglePose = "ZapYokeStruggle03"
											Elseif (Selected == 2)
												ThePose = "ZapYokePose05" ; Standing, legs spread
												StrugglePose = "ZapYokeStruggle05"
											Elseif (Selected == 3)
												ThePose = "ZapYokePose06" ; Standing on knees
												StrugglePose = "ZapYokeStruggle06"
											Elseif (Selected == 4)
												ThePose = "ZapYokePose07" ; Standing on knees, legs spread
												StrugglePose = "ZapYokeStruggle07"
											Elseif (Selected == 5)
												ThePose = "ZapYokePose08" ; Standing on knees, bent over
												StrugglePose = "ZapYokeStruggle08"
											Elseif (Selected == 6)
												ThePose = "ZapYokePose09" ; Sitting squat
												StrugglePose = "ZapYokeStruggle09"
											Elseif (Selected == 7)
												ThePose = "ZapYokePose10" ; Sitting squat, legs spread
												StrugglePose = "ZapYokeStruggle10"
											Elseif (Selected == 8)
												ThePose = "ZapYokePose11" ; Hogtie
												StrugglePose = "ZapYokeStruggle11"
											Elseif (Selected == 9)
												ThePose = "ZapYokePose12" ; Hogtie, legs spread
												StrugglePose = "ZapYokeStruggle12"
											Elseif (Selected == 10)
												ThePose = "ZapYokePose15" ; Lie on stomach, not sleeping
												StrugglePose = "ZapYokeStruggle15"
											Endif
											If (Selected != -1)
												Slot.ChangeTiePose(ThePose, StrugglePose)
											Endif
											InSubMenu = False
										Elseif (Device && Device.HasKeyWordString("DefeatWornArmbinder"))
											Int n = ArmPoses.Length
											UIExtensions.InitMenu("UIListMenu")
											UIExtensions.SetMenuPropertyInt("UIListMenu", "totalEntries", n)
											Int i
											While (i < n)
												UIExtensions.SetMenuPropertyIndexString("UIListMenu", "entryName", i, ArmPoses[i])
												UIExtensions.SetMenuPropertyIndexInt("UIListMenu", "entryId", i, i)
												i += 1
											EndWhile
											UIExtensions.OpenMenu("UIListMenu")
											Selected = UIExtensions.GetMenuResultInt("UIListMenu")
											If (Selected == 0)
												ThePose = "ZapArmbPose01" ; Legs spread
												StrugglePose = "ZapArmbStruggle01"
											Elseif (Selected == 1)
												ThePose = "ZapArmbPose04" ; Standing bend over, legs spread
												StrugglePose = "ZapArmbStruggle03"
											Elseif (Selected == 2)
												ThePose = "ZapArmbPose05" ; Standing, legs spread
												StrugglePose = "ZapArmbStruggle05"
											Elseif (Selected == 3)
												ThePose = "ZapArmbPose06" ; Standing on knees
												StrugglePose = "ZapArmbStruggle06"
											Elseif (Selected == 4)
												ThePose = "ZapArmbPose07" ; Standing on knees, legs spread
												StrugglePose = "ZapArmbStruggle07"
											Elseif (Selected == 5)
												ThePose = "ZapArmbPose08" ; Standing on knees, bent over
												StrugglePose = "ZapArmbStruggle08"
											Elseif (Selected == 6)
												ThePose = "ZapArmbPose09" ; Sitting squat
												StrugglePose = "ZapArmbStruggle09"
											Elseif (Selected == 7)
												ThePose = "ZapArmbPose10" ; Sitting squat, legs spread
												StrugglePose = "ZapArmbStruggle10"
											Elseif (Selected == 8)
												ThePose = "ZapArmbPose11" ; Hogtie
												StrugglePose = "ZapArmbStruggle11"
											Elseif (Selected == 9)
												ThePose = "ZapArmbPose12" ; Hogtie, legs spread
												StrugglePose = "ZapArmbStruggle12"
											Elseif (Selected == 10)
												ThePose = "ZapArmbPose13" ; Hogtie, lie on side
												StrugglePose = "ZapArmbStruggle13"
											Elseif (Selected == 11)
												ThePose = "ZapArmbPose14" ; Lie on side, sleeping position
												StrugglePose = "ZapArmbStruggle14"
											Elseif (Selected == 12)
												ThePose = "ZapArmbPose15" ; Lie on stomach, not sleeping
												StrugglePose = "ZapArmbStruggle15"
											Endif
											If (Selected != -1)
												Slot.ChangeTiePose(ThePose, StrugglePose)
											Endif
											InSubMenu = False
										Else
											Int n = WristPoses.Length
											UIExtensions.InitMenu("UIListMenu")
											UIExtensions.SetMenuPropertyInt("UIListMenu", "totalEntries", n)
											Int i
											While (i < n)
												UIExtensions.SetMenuPropertyIndexString("UIListMenu", "entryName", i, WristPoses[i])
												UIExtensions.SetMenuPropertyIndexInt("UIListMenu", "entryId", i, i)
												i += 1
											EndWhile
											UIExtensions.OpenMenu("UIListMenu")
											Selected = UIExtensions.GetMenuResultInt("UIListMenu")
											If (Selected == 0)
												ThePose = "ZapWriPose01" ; Legs spread
												StrugglePose = "ZapWriStruggle01"
											Elseif (Selected == 1)
												ThePose = "ZapWriPose04" ; Standing bend over, legs spread
												StrugglePose = "ZapWriStruggle03"
											Elseif (Selected == 2)
												ThePose = "ZapWriPose05" ; Standing, legs spread
												StrugglePose = "ZapWriStruggle05"
											Elseif (Selected == 3)
												ThePose = "ZapWriPose06" ; Standing on knees
												StrugglePose = "ZapWriStruggle06"
											Elseif (Selected == 4)
												ThePose = "ZapWriPose07" ; Standing on knees, legs spread
												StrugglePose = "ZapWriStruggle07"
											Elseif (Selected == 5)
												ThePose = "ZapWriPose08" ; Standing on knees, bent over
												StrugglePose = "ZapWriStruggle08"
											Elseif (Selected == 6)
												ThePose = "ZapWriPose09" ; Sitting squat
												StrugglePose = "ZapWriStruggle09"
											Elseif (Selected == 7)
												ThePose = "ZapWriPose10" ; Sitting squat, legs spread
												StrugglePose = "ZapWriStruggle10"
											Elseif (Selected == 8)
												ThePose = "ZapWriPose11" ; Hogtie
												StrugglePose = "ZapWriStruggle11"
											Elseif (Selected == 9)
												ThePose = "ZapWriPose12" ; Hogtie, legs spread
												StrugglePose = "ZapWriStruggle12"
											Elseif (Selected == 10)
												ThePose = "ZapWriPose13" ; Hogtie, lie on side
												StrugglePose = "ZapWriStruggle13"
											Elseif (Selected == 11)
												ThePose = "ZapWriPose14" ; Lie on side, sleeping position
												StrugglePose = "ZapWriStruggle14"
											Elseif (Selected == 12)
												ThePose = "ZapWriPose15" ; Lie on stomach, not sleeping
												StrugglePose = "ZapWriStruggle15"
											Endif
											If (Selected != -1)
												Slot.ChangeTiePose(ThePose, StrugglePose)
											Endif
											InSubMenu = False
										Endif
									Else
										Int n = PermaPoses.Length
										UIExtensions.InitMenu("UIListMenu")
										UIExtensions.SetMenuPropertyInt("UIListMenu", "totalEntries", n)
										Int i = 1
										While (i < n)
											UIExtensions.SetMenuPropertyIndexString("UIListMenu", "entryName", i, PermaPoses[i])
											UIExtensions.SetMenuPropertyIndexInt("UIListMenu", "entryId", i, i)
											i += 1
										EndWhile
										UIExtensions.OpenMenu("UIListMenu")
										Selected = UIExtensions.GetMenuResultInt("UIListMenu")
										If (Selected == 0)
											ThePose = "ZazAPCAO315" ; Chained Celling hanging
										Elseif (Selected == 1)
											ThePose = "ZazAPCAO301" ; Chained Celling 01
										Elseif (Selected == 2)
											ThePose = "ZazAPCAO302" ; Chained Celling 02
										Elseif (Selected == 3)
											ThePose = "ZazAPCAO303" ; Chained Celling 03
										Elseif (Selected == 4)
											ThePose = "ZazAPCAO304" ; Chained Celling 04
										Elseif (Selected == 5)
											ThePose = "ZazAPCAO305" ; Chained Celling 05
										Elseif (Selected == 6)
											ThePose = "ZazAPCAO306" ; Chained Celling 06
										Elseif (Selected == 7)
											ThePose = "ZazAPCAO307" ; Chained Celling 07
										Elseif (Selected == 8)
											ThePose = "ZazAPCAO308" ; Chained Celling 08
										Elseif (Selected == 9)
											ThePose = "ZazAPCAO309" ; Chained Celling 09
										Elseif (Selected == 10)
											ThePose = "ZazAPCAO310" ; Chained Floor 01
										Elseif (Selected == 11)
											ThePose = "ZazAPCAO312" ; Chained Floor 02
										Elseif (Selected == 12)
											ThePose = "ZazAPCAO313" ; Chained Floor 03
										Elseif (Selected == 13)
											ThePose = "ZazAPCAO314" ; Chained Floor 04
										Endif
										If (Selected != -1)
											Slot.ChangeTiePose(ThePose, "", True)
										Endif
										InSubMenu = False
									Endif
								Else
									;If Slot.ActiveDevice == "Pillory"
									;Elseif Slot.ActiveDevice == "Other"
									;Else
										Debug.Notification("$No other poses available for this device.")
									;Endif
								Endif
							Elseif (Button == 2)					; Gag/Ungag										
								If !Victim.IsInFaction(RessConfig.GaggedFaction)
									Slot.Gag()
								Else
									Slot.UnGag()
								Endif
								InSubMenu = False
							Elseif (Button == 3)
								Button = ActionMessages[23].Show() 	; HKTiedUpDeviceMess
								If (Button == 1) ; Ropes
									ChangeDevice(Victim, Slot, (MiscFormLists[0].GetAt(2) As Armor), "DefeatTieUpEnter") ; MiscStuff
									InSubMenu = False
								Elseif (Button == 2) ; Yoke
									ChangeDevice(Victim, Slot, (MiscFormLists[0].GetAt(3) As Armor), "DefeatTieUpYoke")
									InSubMenu = False
								Elseif (Button == 3) ; Armbinder
									ChangeDevice(Victim, Slot, (MiscFormLists[0].GetAt(4) As Armor), "DefeatTieUpArmbinder")
									InSubMenu = False
								Elseif (Button == 4) ; Pillory
									Slot.Permanent = True
									Slot.UnregisterForUpdateGameTime()
									Slot.Struggle = False
									Slot.ActiveDevice = "Pillory"
									Slot.ChangeTiePose("ZapPillorySex01_A1_S1")
									InSubMenu = False
								Else
									Button = 10
								Endif
							Elseif (Button == 4)					; Tighten links
								Slot.UnregisterForUpdateGameTime ()
								Slot.RegisterForSingleUpdateGameTime(McmConfig.TiedTime - 1)
								Slot.Struggle = False
								InSubMenu = False
							Elseif (Button == 5)					; Permanently tie
								Slot.Permanent = True
								Slot.UnregisterForUpdateGameTime()
								String ThePose
								Form Device = Victim.GetWornForm(0x20000000)
								If (Device && Device.HasKeyWordString("DefeatWornDevice"))
									Victim.RemoveItem(Device)
								Endif
								Slot.ChangeTiePose("ZazAPCAO310", True);"DefeatTieUpPerma", True)
								InSubMenu = False
							Elseif (Button == 6) ; Loosen links
								Slot.Permanent = False
								ChangeDevice(Victim, Slot, (MiscFormLists[0].GetAt(2) As Armor), "DefeatTieUpEnter") ; MiscStuff
								InSubMenu = False
							Endif
						Else
							Button = 10
							InSubMenu = False
						Endif
					EndWhile

		 		Elseif (Button == 7)
					OptionFeed(Victim, Aggressor, IsPlayer, True)					; Feed
		 		Elseif (Button == 8) 												; Put in sack
					OptionPutInBag(Victim, Aggressor, IsPlayer)
		 		Elseif (Button == 9) 												; Untie
					OptionUntie(Victim, Aggressor, IsPlayer)
				Endif
			Else
				InMenu = False
			Endif
		EndWhile
		Wait(0.50)
		Active = False
	Endif
EndFunction
Function ChangeDevice(Actor Victim, DefeatStateMonitoringScr Slot, Armor TheDevice, String ThePose)
	If Slot.Permanent
		Int Button = ActionMessages[24].Show() 	; HKTiedUpDevChangeMess
		If (Button == 0)
			Return
		Endif
		Slot.Permanent = False
	Endif
	Form WearedDevice = Victim.GetWornForm(0x20000000)
	If (WearedDevice && WearedDevice.HasKeyWordString("DefeatWornDevice"))
		Victim.RemoveItem(WearedDevice)
	Endif
	Victim.AddItem(TheDevice, 1)
	If (Slot.ActiveDevice != "")
		Slot.ActiveDevice = ""
	Endif
	Slot.UnregisterForUpdateGameTime()
	Slot.RegisterForSingleUpdateGameTime(McmConfig.TiedTime - 1)
	Slot.Struggle = False
	Slot.ChangeTiePose(ThePose)
EndFunction
Int Function OptionUndress(Actor Victim, Actor Aggressor, Bool IsPlayer, Bool Limited = False)
	If Victim.HasKeyWordString("ActorTypeNPC")
		Int UndressChoice
		If !Limited
			If IsPlayer
				UndressChoice = ActionMessages[8].Show() ; DefeatRobMess
			Else
				UndressChoice = ActionMessages[9].Show() ; DefeatRobFollowerMess
			Endif
			If (UndressChoice == 1)
				Armor VicArmor = (Victim.GetWornForm(0x00000004) As Armor)
				If VicArmor
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicArmor, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Else
					Notification("$The victim is naked.")
				Endif
			Elseif (UndressChoice == 2)
				Armor VicHead = (Victim.GetWornForm(0x00000001) As Armor)
				Armor VicHair = (Victim.GetWornForm(0x00000002) As Armor)
				If VicHead
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicHead, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Elseif VicHair
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicHair, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Else
					Notification("$The victim doesn't wear any headgear/headwear.")
				Endif
			Elseif (UndressChoice == 3)
				Armor VicHand = (Victim.GetWornForm(0x00000008) As Armor)
				If VicHand
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicHand, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Else
					Notification("$The victim doesn't wear any gauntlet/gloves.")
				Endif
			Elseif (UndressChoice == 4)
				Armor VicBoot = (Victim.GetWornForm(0x00000080) As Armor)
				If VicBoot
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicBoot, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Else
					Notification("$The victim doesn't wear any boots/footwear.")
				Endif
			Else
				UndressChoice = 10			
			Endif
		Else
			UndressChoice = ActionMessages[10].Show() ; HKRobLimitedMess
			If (UndressChoice == 1)
				Armor VicHead = (Victim.GetWornForm(0x00000001) As Armor)
				Armor VicHair = (Victim.GetWornForm(0x00000002) As Armor)
				If VicHead
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicHead, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Elseif VicHair
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicHair, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Else
					Notification("$The victim doesn't wear any headgear/headwear.")
				Endif
			Elseif (UndressChoice == 2)
				Armor VicHand = (Victim.GetWornForm(0x00000008) As Armor)
				If VicHand
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicHand, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Else
					Notification("$The victim doesn't wear any gauntlet/gloves.")
				Endif
			Elseif (UndressChoice == 3)
				Armor VicBoot = (Victim.GetWornForm(0x00000080) As Armor)
				If VicBoot
					Controls(Aggressor, IsPlayer, False)
					Sheath(Aggressor)
					TheUndress(VicBoot, Victim, Aggressor, "DefeatPickUp", 1.0)
					Controls(Aggressor, IsPlayer)
				Else
					Notification("$The victim doesn't wear any boots/footwear.")
				Endif
			Else
				UndressChoice = 10
			Endif
		Endif
		Return UndressChoice
	Else
		Notification("$You can't do this.")
	Endif
	Return 10
EndFunction
Function TheUndress(Form Slot, Actor Victim, Actor Aggressor, String Anim, Float iTime, Int Piece = -1)
	If Slot
		SendAnimationEvent(Aggressor, Anim)
		Wait(iTime)
		If Victim.IsInFaction(RessConfig.GaggedFaction)
			If RessConfig.Zazon
;				zbfUtil.GetMain().PlayGagSound(Victim)
			Endif
		Elseif (!Victim.IsUnconscious() && (Victim.GetSleepState() != 3))
			Victim.Say(RessConfig.TopicToSay[13], Victim) ; Steal
		Endif
		Victim.UnequipItem(Slot)
	Endif
EndFunction	
Function OptionTieUp(Actor Victim, Actor Aggressor, Bool IsPlayer)
	RessConfig.CastImmune(Victim)
	If Victim.HasKeyWordString("ActorTypeNPC")
		Controls(Aggressor, IsPlayer, False)
		Sheath(Aggressor)
		RessConfig.TieUp(Victim, Aggressor, DoAnimation = McmConfig.bTieUpAnim)
		Controls(Aggressor, IsPlayer)
	Else
		Notification("$You can't do this.")
	Endif
EndFunction
Function OptionUntie(Actor Victim, Actor Aggressor, Bool IsPlayer, Bool Rape = False)
	Controls(Aggressor, IsPlayer, False)
	Sheath(Aggressor)
	If !Rape
		RessConfig.TieUp(Victim, Aggressor, DoAnimation = True, Enter = False)
	Else
		RessConfig.TieUp(Victim, Aggressor, DoAnimation = True, UnCalm = False, Enter = False)
	Endif
	Controls(Aggressor, IsPlayer)
EndFunction
Function OptionRape(Actor Victim, Actor Aggressor, Actor TheAdd = None, Bool IsPlayer = False)
	If !IsPlayer
		If !AllowFollower(Aggressor, Victim)
			Return
		Endif
	Endif
	If !Victim.HasKeyWordString("ActorTypeNPC") && !SexLab.AllowedCreature(Victim.GetLeveledActorBase().GetRace())
		Notification("$You can't do this.")
		Return
	Endif
	If WitnessAlarm(Victim, Aggressor)
		RessConfig.RemoveStates(Victim)
		Return
	Endif
	If (IsPlayer || TheAdd)
		CrimeHandle(Victim)
	Endif
	RessConfig.CastImmune(Victim)
	Float zOffset = Aggressor.GetHeadingAngle(Victim)
	Controls(Aggressor, IsPlayer, False)
	Sheath(Aggressor)
	Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)
	Strip(Victim, Aggressor)
	sslBaseAnimation[] Anims
	sslThreadModel TheRape
	If !TheAdd
		If (Victim.HasKeyWordString("ActorTypeNPC") && Aggressor.HasKeyWordString("ActorTypeNPC"))
			String AnimationSet
			If (GetStringValue(Victim, "DefeatStateAnim") == "ZapPillorySex01_A1_S1")
				Anims = SexLab.GetAnimationsByTags(2, "Pillory", RequireAll = True)
			Endif
			If (Anims.length == 0)
				If RessConfig.Tied(Victim)
					Anims = SexLab.GetAnimationsByTags(2, McmConfig.TiedTagPagg, McmConfig.TiedSupressTagPagg, McmConfig.TiedRequireAllTagPagg)
					AnimationSet = "TiedPagg"
				Endif
				If (Anims.length == 0)
					Int GenderCombination = RessConfig.GenderCombination(Victim, Aggressor)
					If (GenderCombination == 2)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoMTagPagg, McmConfig.FoMSupressTagPagg, McmConfig.FoMRequireAllTagPagg)
						AnimationSet = "FoMPagg"
					Elseif (GenderCombination == 3)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoFTagPagg, McmConfig.FoFSupressTagPagg, McmConfig.FoFRequireAllTagPagg)
						AnimationSet = "FoFPagg"
					Endif
				Endif
			Endif
			If (Anims.length == 0)
				AnimationSet = "RapePagg"
			Endif
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.RapeTagPagg, SupressTags = McmConfig.RapeSupressTagPagg, TagsRequireAll = McmConfig.RapeRequireAllTagPagg, FemaleFirst = AnimationSet)
		Else
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPagg, SupressTags = McmConfig.CreatureSupressTagPagg, TagsRequireAll = McmConfig.CreatureRequireAllTagPagg)
		Endif
	Else
		If (TheAdd == Player) && (TheAdd.GetDistance(Victim) > 220.0)
			SetPlayerAIDriven()
			ForceThirdPerson()
			TheAdd.PathToReference(Victim, 1)
			Int i
			While ((TheAdd.GetDistance(Victim) > 220.0) && (i < 5)) ; Loop's break if player near enough or after 5 seconds to avoid the script being stuck
				Wait(1.0)
				i += 1
			EndWhile
			SetPlayerAIDriven(False)
		Endif
		If (Victim.HasKeyWordString("ActorTypeNPC") && Aggressor.HasKeyWordString("ActorTypeNPC"))
			If (GetStringValue(Victim, "DefeatStateAnim") == "ZapPillorySex01_A1_S1")
				Anims = SexLab.GetAnimationsByTags(2, "Pillory", RequireAll = True)
			Endif
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, TheAdd, CustomAnimations = Anims, Tags = McmConfig.MultipleTagPagg, SupressTags = McmConfig.MultipleSupressTagPagg, TagsRequireAll = McmConfig.MultipleRequireAllTagPagg, FemaleFirst = "MultPagg")
		Else
			TheRape = RessConfig.SexLabScene(Victim, Aggressor, TheAdd, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPagg, SupressTags = McmConfig.CreatureSupressTagPagg, TagsRequireAll = McmConfig.CreatureRequireAllTagPagg, FemaleFirst = "MultCreaPagg")
		Endif
	Endif
;	If Victim.IsInFaction(RessConfig.TieUpFaction)
		TheRape.DisableRagdollEnd(Victim)
;	Endif
	If IsPlayer
		RegisterForModEvent("AnimationEnd_Defeat", "EndRPagg")
		TheRape.SetHook("Defeat")
	Else
		RegisterForModEvent("AnimationEnd_DefeatC", "EndRCPagg")
		TheRape.SetHook("DefeatC")
	Endif
	sslThreadController Thread = TheRape.StartThread()
	If Thread
		RessConfig.RemoveStates(Victim, False)
		RessConfig.Calm(Victim)
	Endif
	Controls(Aggressor, IsPlayer)
EndFunction
Function StruggleSuccess(Actor Victim, Actor Aggressor)
	Controls(Aggressor, True, False)
	Sheath(Aggressor)
	Float zOffset = Aggressor.GetHeadingAngle(Victim)
	Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)
	Strip(Victim, Aggressor)
	sslBaseAnimation[] Anims
	sslThreadModel TheRape
	If Victim.HasKeyWordString("ActorTypeNPC")
		String AnimationSet
		If RessConfig.Tied(Victim)
			Anims = SexLab.GetAnimationsByTags(2, McmConfig.TiedTagPagg, McmConfig.TiedSupressTagPagg, McmConfig.TiedRequireAllTagPagg)
			AnimationSet = "TiedPagg"
		Endif
		If (Anims.length == 0)
			Int GenderCombination = RessConfig.GenderCombination(Victim, Aggressor)
			If (GenderCombination == 2)
				Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoMTagPagg, McmConfig.FoMSupressTagPagg, McmConfig.FoMRequireAllTagPagg)
				AnimationSet = "FoMPagg"
			Elseif (GenderCombination == 3)
				Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoFTagPagg, McmConfig.FoFSupressTagPagg, McmConfig.FoFRequireAllTagPagg)
				AnimationSet = "FoFPagg"
			Endif
		Endif
		If (Anims.length == 0)
			AnimationSet = "RapePagg"
		Endif	
		TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.RapeTagPagg, SupressTags = McmConfig.RapeSupressTagPagg, TagsRequireAll = McmConfig.RapeRequireAllTagPagg, FemaleFirst = AnimationSet)
	Else
		TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPagg, SupressTags = McmConfig.CreatureSupressTagPagg, TagsRequireAll = McmConfig.CreatureRequireAllTagPagg)
	Endif
	TheRape.DisableRagdollEnd(Victim)
	RegisterForModEvent("AnimationEnd_Defeat", "EndRPagg")
	TheRape.SetHook("Defeat")
	sslThreadController Thread = TheRape.StartThread()
	If Thread
		RessConfig.RemoveStates(Victim, False)
		RessConfig.Calm(Victim)
	Endif
EndFunction
Function OptionKill(Actor Victim, Actor Aggressor, Bool IsPlayer, Bool TheState)
	If !IsPlayer
		If !AllowFollower(Aggressor, Victim, "Kill")
			Return
		Endif
	Endif
	Draw(Aggressor)
	Float zOffset = Aggressor.GetHeadingAngle(Victim)
	Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)
	ActorBase VicActorBase = Victim.GetLeveledActorBase()
	If VicActorBase.IsEssential()
		VicActorBase.SetEssential(False)
	Endif
	If VicActorBase.IsProtected()
		VicActorBase.SetProtected(False)
	Endif
	If (!VicActorBase.IsEssential() && !VicActorBase.IsProtected())
		Int Attempts
		Bool Succes = False
		If ((TheState == "Knockdown") || (TheState == "Trauma") || (TheState == "Exhausted"))
			Idle TheKillmove
			Int WeaponType = Aggressor.GetEquippedItemType(1)
			If (Aggressor.IsWeaponDrawn() && ((WeaponType == 1) || (WeaponType == 2) || (WeaponType == 5))) 		; Dagger & Sword 1H/2H Bleedout kill
				TheKillmove = RessConfig.Killmoves[5]
			Elseif (Aggressor.IsWeaponDrawn() && ((WeaponType == 3) || (WeaponType == 4) || (WeaponType == 6))) 	; Axe/Mace 1H/2H
				TheKillmove = RessConfig.Killmoves[8] 	; Quick slash
			Else
				TheKillmove = RessConfig.Killmoves[10] 	; Combo 3 punches
			Endif
			While (!Succes && (Attempts < 5))
				If Aggressor.PlayIdleWithTarget(TheKillmove, Victim) ; Bleedout kill
					Succes = True
				Endif
				Attempts += 1
			EndWhile
		Elseif ((TheState == "Tied") || (TheState == "Yield"))
			Int RangeOne
			Int RangeTwo
			Int WeaponType = Aggressor.GetEquippedItemType(1)
			If (WeaponType == 2) || (WeaponType == 1) || (WeaponType == 5)		; Dagger & Sword 1H/2H
				RangeOne = 6
				RangeTwo = 9
			Else
				RangeOne = 10
				RangeTwo = 11
			Endif
			While (!Succes && (Attempts < 5))
				If Aggressor.PlayIdleWithTarget(RessConfig.Killmoves[RandomInt(RangeOne, RangeTwo)], Victim)
					Succes = True
				Endif
				Attempts += 1
			EndWhile
		Endif
		If !Succes ; Fail to play an animation or for Sleeping state
			Float HP = Victim.GetActorValue("Health")
			Victim.DamageActorValue("Health", HP - 1.0)
			SendAnimationEvent(Aggressor, "pa_killmove2HM3Slash")
			Wait(3.0)
			While !Victim.IsDead()
				Victim.Kill(Aggressor)
				Wait(0.5)
			EndWhile
		Endif
	Else
		Notification("$This NPC can't be killed.")
	Endif
EndFunction
Function OptionRevive(Actor Victim, Actor Aggressor)
	RessConfig.RemoveStates(Victim)
	RessConfig.Knockout(Victim, UnCalm = True, Enter = False)
	Victim.SetNoBleedoutRecovery(False)
	Victim.ModAV("Health", (Victim.GetBaseActorValue("Health") * (10 / 100)))
	RessConfig.CastImmune(Victim)
EndFunction
Function OptionFeed(Actor Victim, Actor Aggressor, Bool IsPlayer, Bool IsTied = False)
;	DefeatConfig.Log("(Victim.GetActorValue(Variable07) < 1) (hasbeeneaten) - "+(Victim.GetActorValue("Variable07") < 1))
	If IsPlayer
		If Victim.HasKeyWordString("ActorTypeNPC") ;(Victim.GetActorValue("Variable07") < 1) ; HasBeenEaten
			Controls(Aggressor, IsPlayer, False)
			Sheath(Aggressor)
			If Aggressor.StartVampireFeed(Victim) ; PlayerVampireQuest.VampireFeed2(NPC03 as actor)
				(GetFormFromFile(0xEAFD5, "Skyrim.esm") As PlayerVampireQuestScript).VampireFeed()
				Wait(0.5)
				Float i = 5.0
				While (Aggressor.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
					Wait(0.2)
					i -= 0.2
				EndWhile
				Wait(0.5)
				RessConfig.CastImmune(Victim) ; to avoid redress
				Notification("OptionFeed - Runs the down animation")
				If IsTied
					SendAnimationEvent(Victim, GetStringValue(Victim, "DefeatStateAnim"))
				Else
					RessConfig.Exhausted(Victim, UnCalm = False, Type = "Player Aggressor")
				Endif
				RessConfig.Exhausted(Victim, UnCalm = False, Type = "Player Aggressor")
			Endif
			Controls(Aggressor, IsPlayer)
		Else
			Notification("$You can't do this.")
		Endif
	Else
		If (Victim.HasKeyWordString("ActorTypeNPC") && Aggressor.HasKeyWordString("Vampire"))
			Sheath(Aggressor)
			Idle FeedIdle
			Float Fangle = (Victim.GetHeadingAngle(Aggressor))
			If ((Fangle < 110) && (Fangle > -110))
				FeedIdle = RessConfig.Killmoves[12] ; DefeatPAvampfeedfront
			Else
				FeedIdle = RessConfig.Killmoves[13] ; DefeatPAvampfeedback
			Endif
			SendAnimationEvent(Aggressor, "IdleForceDefaultState")
			If Victim.PlayIdleWithTarget(FeedIdle, Aggressor)
				Wait(0.5)
				Float i = 5.0
				While (Aggressor.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
					Wait(0.2)
					i -= 0.2
				EndWhile
				Wait(0.5)
				RessConfig.CastImmune(Victim) ; ImmunitySPL, to avoid redress
				If IsTied
					SendAnimationEvent(Victim, GetStringValue(Victim, "DefeatStateAnim"))
				Else
					RessConfig.Exhausted(Victim, UnCalm = False, Type = "Player Aggressor")
				Endif
			Endif
		Else
			Aggressor.Say(RessConfig.TopicToSay[15], Player) ; Refusal
		Endif
	Endif
EndFunction
Function OptionPutInBag(Actor Victim, Actor Aggressor, Bool IsPlayer)
	Actor SackVictim = RessConfig.BurlapSackVictim.GetReference() As Actor
	If SackVictim
		Victim.Moveto(RessConfig.MiscReferences[3]) ; BurlapSackWorldMarker
		RessConfig.MiscReferences[4].Delete() ; BurlapSackWorldForm
		RessConfig.Knockout(SackVictim, Enter = False)
		RessConfig.BurlapSackVictim.Clear()
	Endif
	Form Sack = (MiscFormLists[0].GetAt(0) As Form) ; MiscStuff/Sack
	RessConfig.BurlapSackVictim.ForceRefTo(Victim)
	Victim.MoveTo(RessConfig.MiscReferences[2]) ; BurlapSackMarker
	Aggressor.AddItem(Sack, 1, True)
;	DefeatBurlapSackScr GoToState("Carrying")
EndFunction
Function OptionOutOfBag(Actor Aggressor, Bool Drop = False)
	If !Drop
		Form Sack = (MiscFormLists[0].GetAt(0) As Form) ; MiscStuff/Sack
		Actor Victim = (RessConfig.BurlapSackVictim.GetReference() As Actor)
		Float ZAngle = Player.GetAngleZ()
		Victim.Disable()
		If (Victim.IsInFaction(RessConfig.KnockoutFaction) || Victim.IsDead())
			Victim.MoveTo(Player, 100.0 * Math.Sin(ZAngle), 100.0 * Math.Cos(ZAngle), Player.GetHeight() + 150.0)
		Else
			Victim.MoveTo(Player, 100.0 * Math.Sin(ZAngle), 100.0 * Math.Cos(ZAngle))
			Victim.SetAngle(0.0, 0.0, (ZAngle - 180.0))
		Endif
		Player.RemoveItem(Sack, abSilent = True)
		Wait(0.5)
		Victim.Enable()
		Float i = 3.0
		While (!Victim.Is3DLoaded() && (i > 0.0)) ; Prevent crash
			Wait(0.2)
			i -= 0.2
		EndWhile
		If Victim.Is3DLoaded()
			If Victim.IsInFaction(RessConfig.TieUpFaction)
				SendAnimationEvent(Victim, GetStringValue(Victim, "DefeatStateAnim")) ;(RessConfig.TieUpSlotsAliases[Victim.GetFactionRank(RessConfig.TieUpFaction)] As DefeatStateMonitoringScr).PlayTieUpAnimation()
			Endif
			RessConfig.BurlapSackVictim.Clear()
			GoToState("Running")
		Endif
		ReferenceAlias LastInSack = (GetAliasByName("LastInSack") As ReferenceAlias)
		LastInSack.Clear()
		LastInSack.ForceRefTo(Victim)
	Else
		Form Sack = Aggressor.GetWornForm(0x00020000)
		Aggressor.DropObject(Sack)
		; DefeatBurlapSackScr GoToState Running
	Endif
EndFunction

Function Consensual(Actor Victim, Actor Aggressor)
	RessConfig.Yield(Victim, UnCalm = False, Enter = False)
	sslBaseAnimation[] Anims
	sslThreadModel TheScene
	If Aggressor.HasKeyWordString("ActorTypeNPC")
		Int GenderCombination = RessConfig.GenderCombination(Victim, Aggressor)
		If (GenderCombination == 2)
			Anims = SexLab.GetAnimationsByTags(2, McmConfig.ConsFoMTag, McmConfig.ConsFoMSupressTag, McmConfig.ConsFoMRequireAllTag)
		Elseif (GenderCombination == 3)
			Anims = SexLab.GetAnimationsByTags(2, McmConfig.ConsFoFTag, McmConfig.ConsFoFSupressTag, McmConfig.ConsFoFRequireAllTag)
		Endif
		TheScene = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.ConsTag, SupressTags = McmConfig.ConsSupressTag, TagsRequireAll = McmConfig.ConsRequireAllTag, FemaleFirst = "Cons", IsAggressive = False)
	Else
		TheScene = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.ConsCreatureTag, SupressTags = McmConfig.ConsCreatureSupressTag, TagsRequireAll = McmConfig.ConsCreatureRequireAllTag, IsAggressive = False)
	Endif
	TheScene.DisableRagdollEnd(Aggressor)
	RegisterForModEvent("AnimationEnd_DefeatPvic", "EndC")
	TheScene.SetHook("Defeat")
	sslThreadController Thread = TheScene.StartThread()
;	If !Thread
;	Endif
EndFunction
Event EndC(string EventName, string argString, Float argNum, form sender)
	Actor[] Involved = SexLab.HookActors(argString)
	Involved[1].SetRelationshipRank(Involved[0], Involved[1].GetHighestRelationshipRank())
	RessConfig.Calm(Involved[1], Enter = False)
EndEvent
Function Necro(Actor Victim, Actor Aggressor)														;===== NECRO
	If !Active
		Active = True
		Bool IsPlayer = (Aggressor == Player)
		If !IsPlayer
			If !AllowFollower(Aggressor, Victim)
				Active = False
				Return
			Endif
		Endif
		Int Button = 0 
		If IsPlayer
			Button = ActionMessages[25].Show() ; HKNecroMess
		Else
			Button = ActionMessages[26].Show() ; HKNecroFollowerMess
		Endif
		If (Button == 1)		; Necro
			If Victim.HasKeyWordString("ActorTypeNPC")
				Necrophilia(Victim, Aggressor)
			Else
				If SexLab.AllowedCreature(Victim.GetLeveledActorBase().GetRace())
					Necrophilia(Victim, Aggressor)
				Else
					Notification("$You can't do this.")
				Endif
			Endif
		Elseif (Button == 2)	; Put in a sack
			OptionPutInBag(Victim, Aggressor, IsPlayer)
		Endif
		Wait(0.50)
		Active = False
	Endif
EndFunction		
Function Necrophilia(Actor Victim, Actor Aggressor)
;	SendAnimationEvent(Victim, "GetUpBegin")
;	SendAnimationEvent(Victim, "DefeatWounded02Exit")
;	Wait(2.0)
;	SendAnimationEvent(Victim, "IdleForceDefaultState")

;	Victim.RemoveAllItems(NecroChest, abRemoveQuestItems = True) 
;	Victim.Resurrect()
;	Float i = 3.0
;	While (!Victim.Is3DLoaded() && (i > 0.0))
;		Wait(0.2)
;		i -= 0.2
;	EndWhile
;	Victim.RemoveAllItems(abRemoveQuestItems = True) 
;	NecroChest.RemoveAllItems(Victim, abRemoveQuestItems = True) ;abKeepOwnership
;	Victim.AllowPCDialogue(False)
	Sheath(Aggressor)
	Strip(Victim, Aggressor)
	Victim.ForceActorValue("Health", 1)
;	Victim.SetUnconscious()
	RessConfig.Calm(Victim)
	CrimeHandle(Victim)
	sslBaseAnimation[] Anims
	sslThreadModel TheRape
	If Victim.HasKeyWordString("ActorTypeNPC")
		String AnimationSet
		Anims = SexLab.GetAnimationsByTags(2, McmConfig.NecroTagPagg, McmConfig.NecroSupressTagPagg, McmConfig.NecroRequireAllTagPagg)
		AnimationSet = "NecroPagg"
		If (Anims.length == 0)
			AnimationSet = "RapePagg"
		Endif
		TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.RapeTagPagg, SupressTags = McmConfig.RapeSupressTagPagg, TagsRequireAll = McmConfig.RapeRequireAllTagPagg, FemaleFirst = AnimationSet)
	Else
		TheRape = RessConfig.SexLabScene(Victim, Aggressor, CustomAnimations = Anims, Tags = McmConfig.CreatureTagPagg, SupressTags = McmConfig.CreatureSupressTagPagg, TagsRequireAll = McmConfig.CreatureRequireAllTagPagg)
	Endif
	sslBaseVoice ToVoice = SexLab.GetVoice(Victim)
	TheRape.SetVoice(Victim, ToVoice, True)
	TheRape.DisableRagdollEnd(Victim)
	RegisterForModEvent("AnimationEnd_DefeatNecro", "EndNecro")
	TheRape.SetHook("DefeatNecro")
	sslThreadController Thread = TheRape.StartThread()
	If !Thread
		DefeatConfig.Log("Error: Player/Companion aggressor Necro - Animation did not start")
;		Victim.SetUnconscious(False)
		Victim.ForceActorValue("Health", 0)
		Float i = 2.0
		While (!Victim.IsDead() && (i > 0.0))
			Victim.KillSilent()
			Wait(0.5)
			i -= 0.5
		EndWhile
	Endif
EndFunction
Event EndRPagg(string EventName, string argString, Float argNum, form sender)
	Actor SexVictim = SexLab.HookVictim(argString)
	Actor[] Involved = SexLab.HookActors(argString)
	CrimeHandle(SexVictim, True)
	PostAssault(Involved, SexVictim)
;	UnregisterForModEvent("AnimationEnd_Defeat")
EndEvent
Event EndRCPagg(string EventName, string argString, Float argNum, form sender)
	Actor SexVictim = SexLab.HookVictim(argString)
	Actor[] Involved = SexLab.HookActors(argString)
	PostAssault(Involved, SexVictim)
;	UnregisterForModEvent("AnimationEnd_DefeatC")
EndEvent
Event EndNecro(string EventName, string argString, Float argNum, form sender)
	Actor SexVictim = SexLab.HookVictim(argString)
;	Actor[] Involved = SexLab.HookActors(argString)
	RessConfig.Calm(SexVictim, Enter = False)
;	SexVictim.SetUnconscious(False)
	CrimeHandle(SexVictim, True)
	SexVictim.ForceActorValue("Health", 0)
	Float i = 2.0
	While (!SexVictim.IsDead() && (i > 0.0))
		SexVictim.KillSilent()
		Wait(0.5)
		i -= 0.5
	EndWhile
;	UnregisterForModEvent("AnimationEnd_DefeatNecro")
EndEvent
Function PostAssault(Actor[] InvolvedArray, Actor Target)
	Int i = InvolvedArray.Length
	While (i > 0)
		i -= 1
		If (InvolvedArray[i] && (InvolvedArray[i] != Target))
			AdjustIntValue(InvolvedArray[i], "RapedBy"+Target, 1)
		Endif
	EndWhile
	If Target.IsInFaction(RessConfig.TieUpFaction)
		If Target.IsDead()
			RessConfig.TieUp(Target, DoAnimation = True, Enter = False)
			Return
		Endif
		Form Device = Target.GetWornForm(0x20000000)
		If !Device || !Device.HasKeyWordString("DefeatWornDevice")
			Form Cuffs = MiscFormLists[0].GetAt(2) ; MiscStuff
			Form Yoke = MiscFormLists[0].GetAt(3)
			Form Armbinder = MiscFormLists[0].GetAt(4)
			If (Target.GetItemCount(Cuffs) > 0)
				Target.EquipItemEx(Cuffs)
			Elseif (Target.GetItemCount(Yoke) > 0)
				Target.EquipItemEx(Yoke)
			Elseif (Target.GetItemCount(Armbinder) > 0)
				Target.EquipItemEx(Armbinder)
			Endif
		Endif
		SendAnimationEvent(Target, GetStringValue(Target, "DefeatStateAnim"))
	Else
;		If SexLabConfig.RagdollEnd
;			RegisterForAnimationEvent(SexVictim, "GetUpEnd")
;		Else
			Weakenings(Target)
;		Endif
	Endif
	RessConfig.Weakenings(Target, "Player Aggressor")
EndFunction
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If (asEventName == "GetUpEnd")
;		UnregisterForAnimationEvent(akSource, "GetUpEnd")
;		SendAnimationEvent(SexVictim, GetStringValue(SexVictim, "DefeatStateAnim"))
;		Weakenings()
	Endif
EndEvent
Function Weakenings(Actor Target)
	If !Target.IsDead()
		String[] Events = New String[3]
		Int i
		Int n = -1
		If (McmConfig.TraumaPagg > 0)
			i = Events.Find("")
			Events[i] = "Trauma"
			n += 1
		Endif
		If (McmConfig.ExhaustedPagg > 0)
			i = Events.Find("")
			Events[i] = "Exhausted"
			n += 1
		Endif
		If (McmConfig.EscapePagg > 0)
			i = Events.Find("")
			Events[i] = "Escape"
			n += 1
		Endif
		If (n != -1)
			String TheState = Events[RandomInt(0, n)]
			If (TheState == "Trauma")
				RessConfig.Trauma(Target, Player, Type = "Player Aggressor")
			Elseif (TheState == "Exhausted")
				RessConfig.Exhausted(Target, Player, Type = "Player Aggressor")
			Elseif (TheState == "Escape")
				RessConfig.Escape(Target, Player, Type = "Player Aggressor")
			Endif
		Else
			RessConfig.Calm(Target, Enter = False)
			If (Target.GetActorValue("Confidence") > 2)
				Target.StartCombat(Player)
			Endif
		Endif
	Else
		RessConfig.Calm(Target, Enter = False)
	Endif
EndFunction
Bool Function AllowFollower(Actor Follower, Actor Victim, String Option = "Rape")
;	If (RessConfig.SARon && (McmConfig.ArousalSARPagg > 0))
;		Arousal = True
;	;	Arousal = (RandomInt(1, 100) <= (DefeatConfig.GetSAR().GetActorArousal(Follower) * (McmConfig.ArousalSARPagg / 100))))
;	Endif
	Bool Morality = (Follower.GetActorValue("Morality") > 2)
	If (Morality && McmConfig.MoralityPagg)
		Follower.Say(RessConfig.TopicToSay[16], Player) ; Moral Refusal
		RessConfig.UILib.ShowNotification("${"+Follower.GetLeveledActorBase().GetName()+"} refuses. (Morality)", "#CD4C4C")
		Return False
	Elseif ((Option == "Rape") && McmConfig.SexualityPagg && !RessConfig.SexCombination(Follower, Victim, False)) ;(Arousal && SexCombination)
		Follower.Say(RessConfig.TopicToSay[15], Player) ; Refusal
		RessConfig.UILib.ShowNotification("${"+Follower.GetLeveledActorBase().GetName()+"} refuses. (Sexuality)", "#CD4C4C")
		Return False
	Endif
	Return True
EndFunction
Function Controls(Actor Aggressor, Bool IsPlayer, Bool Enable = True)
	If !Enable
		If IsPlayer
			DisablePlayerControls()
		Else
			Aggressor.SetDontMove()
		Endif
		If Aggressor.IsSneaking()
			Aggressor.StartSneaking()
		Endif
	Else
		If IsPlayer
			EnablePlayerControls()
		Else
			Aggressor.SetDontMove(False)
		Endif
	Endif
EndFunction
Function Sheath(Actor Target)
	If Target.IsWeaponDrawn()
		Target.SheatheWeapon()
		Float i = 3.0
		While (Target.IsWeaponDrawn() && (i > 0.0))
			Wait(0.5)
			i -= 0.5
		EndWhile
	Endif
EndFunction
Function Draw(Actor Target)
	If !Target.IsWeaponDrawn()
		Target.DrawWeapon()
		Float i = 3.0
		While (!Target.IsWeaponDrawn() && (i > 0.0))
			Wait(0.5)
			i -= 0.5
		EndWhile
	Endif
EndFunction
Function Strip(Actor Victim, Actor Aggressor) ;===== STRIP
	RessConfig.SetEmptyOutfit(Victim)
	Form BodyArmor = Victim.GetWornForm(0x00000004)
	If (BodyArmor && BodyArmor.HasKeyWordString("BU_Equip"))
		DefeatUtil.BUBreakArmor(Victim, BodyArmor)
	Else
		If McmConfig.bRedressPagg
			Form Clothes
			Int i
			While (i < 5)
				If (McmConfig.SSPaggSet[i+1] == "$UNEQUIP")
					Clothes = Victim.GetWornForm(Armor.GetMaskForSlot(McmConfig.SSPagg[i] As Int))
					If Clothes
						SetFormValue(Victim, "DefeatVictimClothes"+i+1, Clothes)
					Endif
				Endif
				i += 1
			EndWhile
		Endif
		Float zOffset = Aggressor.GetHeadingAngle(Victim)
		Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)
		PieceToStrip(Victim, Aggressor, McmConfig.SSPaggSet[1], Armor.GetMaskForSlot(McmConfig.SSPagg[0] As Int))
		PieceToStrip(Victim, Aggressor, McmConfig.SSPaggSet[2], Armor.GetMaskForSlot(McmConfig.SSPagg[1] As Int))
		PieceToStrip(Victim, Aggressor, McmConfig.SSPaggSet[3], Armor.GetMaskForSlot(McmConfig.SSPagg[2] As Int))
		PieceToStrip(Victim, Aggressor, McmConfig.SSPaggSet[4], Armor.GetMaskForSlot(McmConfig.SSPagg[3] As Int))
		PieceToStrip(Victim, Aggressor, McmConfig.SSPaggSet[5], Armor.GetMaskForSlot(McmConfig.SSPagg[4] As Int))
		If (Victim.GetSleepState() != 3)
			Weapon Equipped = Victim.GetEquippedWeapon()
			PieceToStrip(Victim, Aggressor, McmConfig.SSPaggSet[0], 0, Equipped)
			Equipped = Victim.GetEquippedWeapon(True)
			PieceToStrip(Victim, Aggressor, McmConfig.SSPaggSet[0], 0, Equipped)
			Armor Shield = Victim.GetEquippedShield()
			PieceToStrip(Victim, Aggressor, McmConfig.SSPaggSet[0], 0, Shield)
		Endif
	Endif
EndFunction
Function PieceToStrip(Actor Victim, Actor Aggressor, String Way, Int Slot, Form Weapons = None, Float WaitTime = 1.5, String Animation = "DefeatPickUp")
	Form Equipped
	If Weapons
		Equipped = Weapons
	Else
		Equipped = Victim.GetWornForm(Slot)
	Endif
	If (Equipped && (Way != "$Disabled"))
		If !Equipped.HasKeyWordString("SexLabNoStrip")
			If (Slot == 0x00000004)
				Animation = "DefeatStripAnim"
				WaitTime = 2.5
			Endif
			SendAnimationEvent(Aggressor, Animation)
			Wait(WaitTime)
			If (Way == "$UNEQUIP")
				Victim.UnequipItem(Equipped, False, True)
			Elseif (Way == "$STRIP")
				Victim.UnequipItem(Equipped, False, True)
				Victim.DropObject(Equipped)
			Elseif (Way == "$STEAL")
				Victim.UnequipItem(Equipped, False, True)
				Victim.RemoveItem(Equipped, 1, True, Aggressor)
			Endif
		Endif
	Endif
EndFunction

Int TrespassCurrent
Int TrespassMod = 0
actorBase cellOwner = none
faction factionOwner = none
cell currentCell
Function CrimeHandle(Actor Victim, Bool Restore = False)
	If !Restore
		if Player.IsTrespassing()
			currentCell = Player.GetParentCell()
			cellOwner = currentCell.GetActorOwner()
			if cellOwner
				currentCell.SetActorOwner(Player.GetActorBase())
			else
				factionOwner = currentCell.GetFactionOwner()
				currentCell.SetFactionOwner(GetFormFromFile(0xdb1, "Skyrim.esm") as faction) ; PlayerFaction
			endif
		endif
	Else
		if cellOwner
			currentCell.SetActorOwner(cellOwner)
		elseif factionOwner
			currentCell.SetFactionOwner(factionOwner)
		endif
		cellOwner = none
		factionOwner = none
	Endif
EndFunction
Scriptname DefeatStateMonitoringEFFscr extends ActiveMagicEffect  

DefeatMCMscr property McmConfig auto
DefeatConfig property RessConfig auto

Import Debug
Import StorageUtil

Actor Victim
Actor Perpetrator
Actor Property Player Auto
Weapon Property Unarmed Auto
String Property StateType Auto
Float Time
Float Confidence
Float Assistance
Float Aggression
Bool WasPartner = False
Bool WasentFollower = False
Bool SpamGuard

Function Redress()
	Int i
;	DefeatConfig.Log("Try to redress - "+Victim.GetLeveledActorBase().GetName()+" / Victim.Is3DLoaded() - "+Victim.Is3DLoaded()+" / !RessConfig.IsImmune(Victim) - "+!RessConfig.IsImmune(Victim))
	If (!Victim.IsDead() && Victim.Is3DLoaded() && !RessConfig.IsImmune(Victim)) ; check for other actions done or not and prevent redress until done.
		Form Clothes
		While (i < 5)
			Clothes = GetFormValue(Victim, "DefeatVictimClothes"+i+1)
			If (Clothes && !Victim.GetWornForm(Armor.GetMaskForSlot(McmConfig.SSPagg[i] As Int)))
				Victim.EquipItem(Clothes)
			Endif
			Clothes = GetFormValue(Victim, "DefeatVictimClothesNVN"+i+1)
			If (Clothes && !Victim.GetWornForm(Armor.GetMaskForSlot(McmConfig.SSNVN[i] As Int)))
				Victim.EquipItem(Clothes)
			Endif
			UnsetFormValue(Victim, "DefeatVictimClothes"+i+1)
			UnsetFormValue(Victim, "DefeatVictimClothesNVN"+i+1)
			i += 1
		EndWhile
	Endif
	RessConfig.SetOldOutfit(Victim)
EndFunction
Function Bounty()
	If ((Perpetrator == Player) && RessConfig.HasBeenRapedBy(Victim, Perpetrator) && Victim.GetParentCell() != Perpetrator.GetParentCell() && (Victim.GetBaseObject() as ActorBase).IsUnique()) ; Put a bounty only if the player isn't near the victim
		Faction CrimeFaction = Victim.GetCrimeFaction()
		If CrimeFaction && (Utility.RandomInt(1, 100) <= McmConfig.ChanceOfBountyPagg)
			CrimeFaction.ModCrimeGold(500, True)
			RessConfig.UILib.ShowNotification("${"+Victim.GetLeveledActorBase().GetName()+"} placed a bounty of 500 gold on you for rape!", "#CD4C4C")
		Endif
	Endif
EndFunction

Event OnEffectStart(Actor Target, Actor Caster)
	Time = RessConfig.StateDuration
	Victim = Target
	Perpetrator = RessConfig.Perpetrator
	SpamGuard = False
;	DefeatConfig.Log("DefeatStateMonitoringEFFscr Start // Victim - "+Victim+" / StateType - "+StateType+" / Time - "+Time)
	GoToState(StateType)
EndEvent
State Calm
;	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
;		Actor Aggressor = (akAggressor As Actor)
;		If Aggressor
;			RessConfig.AddCalmList(Aggressor, Victim)
;			Victim.StopCombat()
;			Victim.StopCombatAlarm()
;		Endif
;	EndEvent
	Event OnBeginState()
		RegisterForSingleUpdate(Time)
		If Victim.IsPlayerTeammate()
			WasPartner = True
			If !Victim.IsInFaction(RessConfig.FollowerFactions[0])
				WasentFollower = True
				Victim.AddToFaction(RessConfig.FollowerFactions[0])
			Endif
			Victim.SetPlayerTeammate(False, False)
		Endif
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		If WasPartner
			If WasentFollower
				Victim.RemoveFromFaction(RessConfig.FollowerFactions[0])
			Endif
			Victim.SetPlayerTeammate(True, True)
		Endif
	EndEvent
EndState
State Knockdown
	Event OnBeginState()
		RegisterForSingleUpdate(Time)
		RegisterForAnimationEvent(Victim, "staggerStop")
		RegisterForAnimationEvent(Victim, "GetUpEnd")
		RegisterForAnimationEvent(Victim, "BleedoutStop")
	EndEvent
	Event OnUpdate()
		If (Player.HasKeyWordString("DefeatActive") && Victim.HasKeyWordString("DefeatFollower")) ;|| Victim.HasMagicEffect(RessConfig.NVNAssautEFF)
			; If the player is still in a scene and the knoccked down victim is a follower OR the victim is a NVN victim, extend the knock down state state.
			RegisterForSingleUpdate(Time)
		Else
			Dispel()
		Endif
	EndEvent
	Event OnActivate(ObjectReference akActionRef)
		Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
	EndEvent
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		If !SpamGuard
			SpamGuard = True
			Actor Aggressor = (akAggressor As Actor)
			If ((Aggressor == Player) && abBashAttack)
				RessConfig.Knockout(Victim, Aggressor)
			Else
				Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
			Endif
			Utility.Wait(2)
			SpamGuard = False
		Endif
	EndEvent
;	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
;		Victim.StopCombat()
;		Victim.StopCombatAlarm()
;	EndEvent
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
;		DefeatConfig.Log("Knockdown OnAnimationEvent")
		Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
		RessConfig.DefeatPlayAnimation(Victim, "Bleedout")
;		RessConfig.DefeatPlayAnimation(Victim, "Sit")
;		SetStringValue(Victim, "DefeatStateAnim", "IdleWounded_03")
;		SendAnimationEvent(Victim, "IdleWounded_03")
	EndEvent
	Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
		RessConfig.Knockdown(Victim)
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		Redress()
		RessConfig.Knockdown(Victim, Enter = False)
	EndEvent
EndState
State Trauma
	Event OnBeginState()
		RegisterForSingleUpdate(Time)
		RegisterForAnimationEvent(Victim, "staggerStop")
		RegisterForAnimationEvent(Victim, "GetUpEnd")
	EndEvent
	Event OnUpdate()
		If (Player.HasKeyWordString("DefeatActive") && Victim.HasKeyWordString("DefeatFollower")) ; If the player is still in a scene and the trauma victim is a follower, extend the state.
			RegisterForSingleUpdate(Time)
		Else
			Dispel()
		Endif
	EndEvent
	Event OnActivate(ObjectReference akActionRef)
		Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
		RessConfig.Trauma(Victim)
	EndEvent
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		If !SpamGuard
			SpamGuard = True
			Actor Aggressor = (akAggressor As Actor)
			If ((Aggressor == Player) && abBashAttack)
				RessConfig.Knockout(Victim, Aggressor)
			Else
				Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
			Endif
			Utility.Wait(2)
			SpamGuard = False
		Endif
	EndEvent
;	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
;		Victim.StopCombat()
;		Victim.StopCombatAlarm()
;	EndEvent
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		RessConfig.Trauma(Victim)
	EndEvent
	Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
		Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
		RessConfig.Trauma(Victim)
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		Redress()
		RessConfig.Trauma(Victim, Enter = False)
		Bounty()
	EndEvent
EndState
State Exhausted
	Event OnBeginState()
		RegisterForSingleUpdate(Time)
		RegisterForAnimationEvent(Victim, "staggerStop")
		RegisterForAnimationEvent(Victim, "GetUpEnd")
		Victim.DamageActorValue("Stamina", Victim.GetActorValue("Stamina"))
	EndEvent
	Event OnUpdate()
		If (Player.HasKeyWordString("DefeatActive") && Victim.HasKeyWordString("DefeatFollower")) ; If the player is still in a scene and the exausted victim is a follower, extend the state.
			RegisterForSingleUpdate(Time)
		Else
			Dispel()
		Endif
	EndEvent
	Event OnActivate(ObjectReference akActionRef)
		Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
		RessConfig.Exhausted(Victim)
	EndEvent
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		If !SpamGuard
			SpamGuard = True
			Actor Aggressor = (akAggressor As Actor)
			If ((Aggressor == Player) && abBashAttack)
				RessConfig.Knockout(Victim, Aggressor)
			Else
				Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
			Endif
			Utility.Wait(2)
			SpamGuard = False
		Endif
	EndEvent
;	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
;		Victim.StopCombat()
;		Victim.StopCombatAlarm()
;	EndEvent
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		Victim.Say(RessConfig.TopicToSay[2], Victim) ; Death moan
		RessConfig.Exhausted(Victim)
	EndEvent
	Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
		RessConfig.Exhausted(Victim)
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		Redress()
		RessConfig.Exhausted(Victim, Enter = False)
		Bounty()
	EndEvent
EndState
State Surrender
	Event OnBeginState()
		Utility.Wait(5.0)
		RessConfig.DefeatPlayAnimation(Victim, "Surrender")
		RegisterForSingleUpdate(2)
	EndEvent
	Event OnUpdate()
		If Victim.HasKeyWordString("DefeatCollateral")
			SendAnimationEvent(Victim, "IdleCowering")
		Elseif !Player.HasKeyWordString("DefeatActive")
			Dispel()
			Return
		Endif
		RegisterForSingleUpdate(5)
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		Redress()
		RessConfig.Surrender(Victim, Enter = False)
	EndEvent
EndState
State Yield
	Event OnBeginState()
		RegisterForUpdate(5)
	EndEvent
	Event OnUpdate()
		If (!Player.HasLos(Victim) || Player.IsInCombat() || Player.GetDistance(Victim) > 1000.0)
			Dispel()
		Elseif !Victim.GetAnimationVariableBool("bIsSynced")
			RessConfig.CoverSelf(Victim)
		Endif
	EndEvent
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		If !SpamGuard
			SpamGuard = True
			Actor Aggressor = (akAggressor As Actor)
			If Aggressor
				If ((Aggressor == Player) && abBashAttack)
					RessConfig.Knockdown(Victim)
				Else
					If ((Victim.GetActorValue("Aggression") < 2) || (Victim.GetActorValue("Confidence") < 3))
						Victim.Say(RessConfig.TopicToSay[3], Player) ; Flee
						SendAnimationEvent(Victim, "IdleCowering")
					Else
						Dispel()
					Endif
				Endif
			Endif
			Utility.Wait(2)
			SpamGuard = False
		Endif
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		RessConfig.Yield(Victim, Enter = False)
		Redress()
	EndEvent
EndState
State Escape
	Event OnBeginState()
		RegisterForSingleUpdate(Time)
	EndEvent
	Event OnUpdate()
		If (Player.HasKeyWordString("DefeatActive") && Victim.HasKeyWordString("DefeatFollower")) ; If the player is still in a scene and the trauma victim is a follower, extend the state.
			RegisterForSingleUpdate(Time)
		Else
			Dispel()
		Endif
	EndEvent
	Event OnActivate(ObjectReference akActionRef)
		Victim.Say(RessConfig.TopicToSay[3], Victim) ; Flee
	EndEvent
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		If !SpamGuard
			SpamGuard = True
			Actor Aggressor = (akAggressor As Actor)
			If ((Aggressor == Player) && abBashAttack)
				RessConfig.Knockout(Victim, Aggressor)
			Else
				Victim.Say(RessConfig.TopicToSay[3], Victim) ; Flee
			Endif
			Utility.Wait(2)
			SpamGuard = False
		Endif
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		Redress()
		RessConfig.Escape(Victim, Enter = False)
		Bounty()
	EndEvent
EndState
State Weakenings
	Event OnBeginState()
		RegisterForSingleUpdate(Time)
	EndEvent
	Event OnUpdate()
		Dispel()
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		RessConfig.Weakenings(Victim, RemoveSpl = True)
	EndEvent
EndState
State Satisfied
	Event OnBeginState()
		RegisterForSingleUpdate(Time)
	EndEvent
	Event OnUpdate()
		Dispel()
	EndEvent
	Event OnEffectFinish(Actor Target, Actor Caster)
;		DefeatConfig.Log("DefeatStateMonitoringEFFscr End // Victim - "+Victim+" / StateType - "+StateType)
		RessConfig.SetSatisfied(Victim, Satisfied = False)
;		If Victim.IsInFaction(RessConfig.DefeatFactions[1]) ; AggFaction
;			Victim.SetFactionRank(RessConfig.DefeatFactions[1], 0) ; So the aggressor can be picked as sexual aggressor if a player scene is running
;			RessConfig.PlayerScr.Collateral()
;		Endif
	EndEvent
EndState
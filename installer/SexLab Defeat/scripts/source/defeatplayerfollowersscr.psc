Scriptname DefeatPlayerFollowersScr Extends ReferenceAlias  

DefeatMCMscr Property McmConfig auto
DefeatConfig Property RessConfig auto

Int Property FollowerSlot Auto

Actor Property Player Auto
Actor Victim
Actor Aggressor

Float MaxDist = 1000.0
Bool SpamGuard = False

Function Configure()
	SpamGuard = False
EndFunction

Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If !SpamGuard
		SpamGuard = True
		Aggressor = (akAggressor As Actor)
		Victim = (GetReference() As Actor)
		If (Victim && Aggressor && (Aggressor != Player))
			If ((Aggressor.GetCombatTarget() == Victim) && (Aggressor.GetDistance(Victim) < MaxDist))
				If ((Utility.RandomInt(1, 100) <= McmConfig.COHFollower) && ((Victim.GetActorValuePercentage("Health") * 100) <= McmConfig.ThresholdFollower))
					RessConfig.Knockdown(Victim, Aggressor, 60.0, "Follower")
					DefeatConfig.Log("A follower has been knocked down - DefeatPlayerFollowersScr OnHit - "+Victim)
				Endif
			Endif
		Endif
		Utility.Wait(2.0)
		SpamGuard = False
	Endif
EndEvent
Event OnEnterBleedOut()
	Victim = (GetReference() As Actor)
	RessConfig.Knockdown(Victim, None, 60.0, "Follower", IsBleedout = True)
	DefeatConfig.Log("A follower has been knocked down - DefeatPlayerFollowersScr BleedOut - "+Victim)
EndEvent
Scriptname DefeatStateMonitoringScr extends ReferenceAlias  

DefeatMCMscr Property McmConfig auto
DefeatConfig Property RessConfig auto

Import Game
Import Debug
Import Utility

Actor Victim
Actor Property Player Auto
String Property StateType Auto
Bool Property Permanent Auto
Bool Property Struggle Auto
Float Time
String Pose
String StrugglePose
String Property ActiveDevice Auto Hidden
Weapon Property Unarmed Auto
Bool SpamGuard

Function Enter(Actor Target)
	Time = RessConfig.StateDuration
	Victim = Target
	GoToState(StateType)
EndFunction
Function RegisterAnimEvent(Bool On = True)
	If On
		RegisterForAnimationEvent(Victim, "staggerStop")
		RegisterForAnimationEvent(Victim, "GetUpEnd")
	Else
		UnregisterForAnimationEvent(Victim, "staggerStop")
		UnregisterForAnimationEvent(Victim, "GetUpEnd")
	Endif
EndFunction
State Tied
	Event OnBeginState()
		Permanent = False
		Struggle = False
		ActiveDevice = ""
		Form Cuffs = (RessConfig.MiscFormLists[0].GetAt(2) As Form) ; MiscStuff Cuffs
		Victim.AddItem(Cuffs, 1) ; Cuffs
		ChangeTiePose("DefeatTieUpEnter")
		RegisterAnimEvent()
		RegisterForSingleUpdateGameTime(Time - 1)
	EndEvent
	Event OnUpdateGameTime()
		Actor SackVictim = (RessConfig.BurlapSackVictim.GetReference() As Actor)
		If (SackVictim && (Victim == SackVictim)) ; This is the victim in the sack, let them tied.
			Form Sack = (RessConfig.MiscFormLists[0].GetAt(0) As Form) ; MiscStuff
			If (Player.GetItemCount(Sack) == 0) ; If for some reason the player hasn't the sac on his back, (automatically dropped when raped).
				Victim.Moveto(RessConfig.MiscReferences[3]) ; BurlapSackWorldMarker
				RessConfig.TieUp(Victim, Enter = False)
				If (RessConfig.MiscReferences[4].GetParentCell() == Player.GetParentCell()) ; BurlapSackWorldForm
					While !Victim.Is3DLoaded() ; Prevent crash
						Wait(0.25)
					EndWhile
					PlayTieUpAnimation(False)
				Endif
				RessConfig.MiscReferences[4].Delete() ; BurlapSackWorldForm
			Else
				RegisterForSingleUpdateGameTime(2.0)
			Endif
		Else
			If Struggle
				RessConfig.TieUp(Victim, Enter = False)
			Else
				Struggle = True
				Pose = StrugglePose
				PlayTieUpAnimation()
				RegisterForSingleUpdateGameTime(1.0)
			Endif
		Endif
	EndEvent
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		RessConfig.Calm(Victim)
		PlayTieUpAnimation()
	EndEvent
	Event OnLoad()
		RessConfig.Calm(Victim)
		PlayTieUpAnimation()
	EndEvent
	Event OnActivate(ObjectReference akActionRef)
		If Victim.IsInFaction(RessConfig.GaggedFaction)
			If RessConfig.Zazon
				zbfUtil.GetMain().PlayGagSound(Victim)
			Endif
		Endif
	EndEvent
	Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		If akBaseItem.HasKeyWordString("DefeatWornDevice")
			Victim.EquipItem(akBaseItem, True)
		Else
			PlayTieUpAnimation()
		Endif		
	EndEvent
;	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
;	EndEvent
;	Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
;	EndEvent
	Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
		PlayTieUpAnimation()
	EndEvent
	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		If !SpamGuard
			SpamGuard = True
			Actor Aggressor = (akAggressor As Actor)
			If Aggressor
				If ((Aggressor == Player) && abBashAttack)
					RessConfig.Knockout(Victim, Aggressor)
				Else
					Aggressor.StopCombat()
					If !Victim.IsInFaction(RessConfig.GaggedFaction)
						Victim.Say(RessConfig.TopicToSay[3], Player) ; Flee
					Else
						If RessConfig.Zazon
							zbfUtil.GetMain().PlayGagSound(Victim)
						Endif
					Endif
				Endif
			Endif
			Victim.StopCombat()
			Victim.StopCombatAlarm()
			Utility.Wait(2)
			SpamGuard = False
		Endif
	EndEvent
	Event OnDeath(Actor akKiller)
		UnregisterForUpdateGameTime()
		RessConfig.TieUp(Victim, Enter = False)
	EndEvent
EndState
Function Gag()
	Victim.AddToFaction(RessConfig.GaggedFaction)
	Form Gag = (RessConfig.MiscFormLists[0].GetAt(1) As Form) ; MiscStuff/Gag
	Victim.AddItem(Gag, 1)
EndFunction
Function UnGag()
	Victim.RemoveFromFaction(RessConfig.GaggedFaction)
	Victim.RemoveItem((RessConfig.MiscFormLists[0].GetAt(1) As Form)) ; MiscStuff/Gag
EndFunction
Function ChangeTiePose(String ThePose, String TheStrugglePose = "", Bool Perma = False)
	If (TheStrugglePose != "")
		StrugglePose = TheStrugglePose
	Else
		StrugglePose = ThePose
	Endif
	If (Struggle && !Perma)
		Pose = StrugglePose
		StorageUtil.SetStringValue(Victim, "DefeatStateAnim", StrugglePose)
	Else
		Pose = ThePose
		StorageUtil.SetStringValue(Victim, "DefeatStateAnim", ThePose)
	Endif
	PlayTieUpAnimation()
EndFunction
Function PlayTieUpAnimation(Bool TieUp = True)
	If (Victim.Is3DLoaded() && !Victim.IsDead())
		If TieUp
			SendAnimationEvent(Victim, Pose)
		Else
			SendAnimationEvent(Victim, "DefeatTieUpExit")
		Endif
	Endif
EndFunction





State Knockout
	Event OnBeginState()
;		RegisterAnimEvent()
		RegisterForSingleUpdateGameTime(Time)
	EndEvent
	Event OnUpdateGameTime()
		Actor SackVictim = (RessConfig.BurlapSackVictim.GetReference() As Actor)
		If (SackVictim && (Victim == SackVictim)) ; This is the victim in the sack, let them unconscious.
			Form Sack = (RessConfig.MiscFormLists[0].GetAt(0) As Form) ; MiscStuff
			If (Player.GetItemCount(Sack) == 0) ; If for some reason the player hasn't the sac on his back, (Most of the time because it's automatically dropped when raped).
				Victim.Moveto(RessConfig.MiscReferences[3]) ; BurlapSackWorldMarker
				RessConfig.MiscReferences[4].Delete() ; BurlapSackWorldForm
				RessConfig.Knockout(Victim, Enter = False)
			Else
				RegisterForSingleUpdateGameTime(2.0)
			Endif
		Else
			RessConfig.Knockout(Victim, Enter = False)
		Endif
	EndEvent
;	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
;		Actor Aggressor = (akAggressor As Actor)
;		If (Aggressor && (Aggressor == Player) && (akSrc != Unarmed) && !abBashAttack)
;			If !Victim.IsEssential()
;				Victim.Kill(Aggressor)
;			Endif
;		Endif
;	EndEvent
	Event OnDeath(Actor akKiller)
		UnregisterForUpdateGameTime()
		RessConfig.Knockout(Victim, Enter = False)
	EndEvent
EndState
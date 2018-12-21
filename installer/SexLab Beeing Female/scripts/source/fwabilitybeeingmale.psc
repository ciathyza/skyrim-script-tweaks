Scriptname FWAbilityBeeingMale extends FWAbilityBeeingBase

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if  System.ModEnabled.GetValueInt()!=1
		akTarget.RemoveSpell(System.BeeingMaleSpell)
		akTarget.DispelSpell(System.BeeingMaleSpell)
		return;
	endif

	if (akTarget as form) == none
		Debug.Trace("BeeingMale: OnEffectStart Actor's Form = none : Dispel")
		Self.Dispel()
		return
	endif

	IsPlayer = (akTarget == Game.GetPlayer())
	
	ActorRef = akTarget
	ActorRefBase = akTarget.GetLeveledActorBase()
	
	If System.IsValidateMaleActor(akTarget)<0
		;System.Message("BeeingMale on " + ActorBaseRef.GetName() + " dispelled (#1)", System.MSG_Debug)
		ActorRef.RemoveSpell(System.BeeingMaleSpell)
		ActorRef.DispelSpell(System.BeeingMaleSpell)
		;Dispel()
		Return
	EndIf

	If IsPlayer
		System.PlayerMale = Self
		System.Player = none
	EndIf

	equipChild()
	
	bInitSpell=true
	OnPlayerLoadGame()
EndEvent

function OnPlayerLoadGame()
	if bInit==true && bInitSpell==true && self as ActiveMagicEffect != none
		Utility.WaitMenuMode(1)
		IsFollower = ActorRef.IsInFaction(System.FollowerFaction) && IsPlayer == false
		System.Controller.UpdateParentFaction(ActorRef)
		if !isFormValid() ; ActorRef == None
			Self.Dispel()
			Debug.Trace("BeeingMale: OnPlayerloadgame on None Actor - Dispel")
			return
		else
			if self as FWAbilityBeeingMale != none 
				(self as ActiveMagicEffect).UnregisterForUpdateGameTime() ;***Edit by Bane
				(self as ActiveMagicEffect).RegisterForupdateGameTime(2) ;***Edit by Bane
				(self as ActiveMagicEffect).UnregisterForUpdate() ;***Edit by Bane
				(self as ActiveMagicEffect).RegisterForUpdate(5) ;***Edit by Bane
			endif
		endif
		;parent.OnPlayerLoadGame()
	endif
endfunction

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If Self as ActiveMagicEffect != none && isFormValid()
		If System
			If (System.PlayerMale == Self)
				System.PlayerMale = None
			EndIf
			if ActorRef
				ActorRef.RemoveSpell(System.BeeingMaleSpell)
				ActorRef.DispelSpell(System.BeeingMaleSpell)
			endif
		EndIf
	Else
		Debug.Trace("BeeingFemale: Orphaned BeeingMale OnEffectFinish")
	EndIf
EndEvent

Event OnUpdate()
	if !isFormValid()
		return
	endif
	parent.OnUpdate()
endEvent

Event OnUpdateGameTime()
	if !isFormValid()
		return
	endif
	if ActorRef==none
		Self.Dispel()
		return
	endif
	if System==none
		return
	endif
	if System.Controller == none
		return
	endif
	System.Controller.UpdateParentFaction(ActorRef)
	if ActorRef.GetLeveledActorBase().GetSex()!=0
		if ActorRef.HasSpell(System.BeeingFemaleSpell)==false
			if System.IsValidateActor(ActorRef)>0
				ActorRef.AddSpell(System.BeeingFemaleSpell)
			endif
		endif
		ActorRef.RemoveSpell(System.BeeingMaleSpell)
		ActorRef.DispelSpell(System.BeeingMaleSpell)
	endif
	if IsPlayer
		if System.PlayerMale==none
			System.PlayerMale=self
			System.Player=none
		endif
	endif
endEvent

bool Function isFormValid()
	return (ActorRef as form) != none && (ActorRefBase as ActorBase) != none
endfunction
	

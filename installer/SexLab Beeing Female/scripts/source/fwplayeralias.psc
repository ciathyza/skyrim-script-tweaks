Scriptname FWPlayerAlias extends ReferenceAlias  

FWSystem property System auto
FWTextContents property Contents auto

spell property CloakAbility auto
actor property PlayerRef auto
int property Interval Auto
spell property BeeingFemaleSpell auto
spell property BeeingMaleSpell auto

Globalvariable property CloakingSpellEnabled auto

int oldSex = 0

Event OnInit()
	;RegisterForSingleUpdate(1)
	
	If self && GetActorReference()
		oldSex = GetActorReference().GetActorBase().GetSex()
	EndIf
	OnPlayerLoadGame()
	;RegisterForMenu("RaceSex Menu")
EndEvent

Event OnMenuOpen(string menuName)
	if menuName=="RaceSex Menu"
		oldSex=PlayerRef.GetLeveledActorBase().GetSex()
		;System.Message("Race Menu open",System.MSG_Debug)
		if System.Player!=none
			System.Player.ResetBelly()
		endif
	endIf
endEvent

Event OnMenuClose(string menuName)
	if menuName=="RaceSex Menu"
		;System.Message("Race Menu closed",System.MSG_Debug)
		
		System.CheckPlayerSex()
		
		if System.Player!=none
			System.Player.GetBaseMeasurements(true)
			System.Player.SetBelly()
		endif
	endIf
endEvent

Event OnUpdate()
	;Debug.Trace("FWPlayerAlias::OnUpdate()")
	if CloakingSpellEnabled.GetValueInt()==1 && System.ModEnabled.GetValueInt()==1
		;Debug.Trace("- Do Cloaking - cast spell")
		;Debug.Trace("- Spell is: "+CloakAbility.GetName())
		PlayerRef.AddSpell(CloakAbility, false)
		Utility.WaitMenuMode(2)
		;Debug.Trace("- Remove Cloaking Spell")
		PlayerRef.RemoveSpell(CloakAbility)
	;else
		;Debug.Trace("- Failed to Cloak")
		;if CloakingSpellEnabled.GetValueInt()==0
			;Debug.Trace("- CloakingSpellEnabled is false")
		;endif
		;if System.ModEnabled.GetValueInt()==0
			;Debug.Trace("- ModEnabled is false")
		;endif
	endIf
	
	;Debug.Trace("- Register for single update("+Interval+")")
	RegisterForSingleUpdate(Interval)
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;Debug.Trace("FWPlayerAlias::OnLocationChange()")
	if CloakingSpellEnabled.GetValueInt()==1 && System.ModEnabled.GetValueInt()==1
		;Debug.Trace("- Do Cloaking - cast spell")
		;Debug.Trace("- Spell is: "+CloakAbility.GetName())
		PlayerRef.AddSpell(CloakAbility, false)
		Utility.WaitMenuMode(2)
		;Debug.Trace("- Remove Cloaking Spell")
		PlayerRef.RemoveSpell(CloakAbility)
	;else
		;Debug.Trace("- Failed to Cloak")
		;if CloakingSpellEnabled.GetValueInt()==0
			;Debug.Trace("- CloakingSpellEnabled is false")
		;endif
		;if System.ModEnabled.GetValueInt()==0
			;Debug.Trace("- ModEnabled is false")
		;endif
	endIf
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	System.PantyWidget.UpdateContent()
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	System.PantyWidget.UpdateContent()
EndEvent

Function OnModReset() ;***Added by Bane
	RegisterForSingleUpdate(1)
	UnregisterForAllMenus()
	RegisterForMenu("RaceSex Menu")
EndFunction

Event OnPlayerLoadGame()
	RegisterForSingleUpdate(2)
	;RegisterForUpdate(Interval)
	UnregisterForAllMenus()
	RegisterForMenu("RaceSex Menu")
	Utility.WaitMenuMode(1)
	System.OnGameLoad()
EndEvent

Event OnRaceSwitchComplete()
	System.Message(Contents.RaceSwitchedCompleted,System.MSG_Debug)
	If oldSex != GetActorReference().GetActorBase().GetSex()
		If GetActorReference().GetActorBase().GetSex() == 0
			If (! GetActorReference().HasSpell(BeeingMaleSpell))
				GetActorReference().AddSpell(BeeingMaleSpell)
			EndIf
			If (GetActorReference().HasSpell(BeeingFemaleSpell))
				GetActorReference().RemoveSpell(BeeingFemaleSpell)
			EndIf
		Else
			If (! GetActorReference().HasSpell(BeeingFemaleSpell))
				GetActorReference().AddSpell(BeeingFemaleSpell)
			EndIf
			If (! GetActorReference().HasSpell(BeeingMaleSpell))
				GetActorReference().RemoveSpell(BeeingMaleSpell)
			EndIf
		EndIf
		oldSex = GetActorReference().GetActorBase().GetSex()
	EndIf
EndEvent
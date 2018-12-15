;/ Decompiled by Champollion V1.0.1
Source   : FWPlayerAlias.psc
Modified : 2017-01-13 12:05:16
Compiled : 2017-01-18 08:35:20
User     : admin
Computer : PATRICK
/;
scriptName FWPlayerAlias extends ReferenceAlias

;-- Properties --------------------------------------
spell property BeeingFemaleSpell auto
fwtextcontents property Contents auto
fwsystem property System auto
spell property BeeingMaleSpell auto
globalvariable property CloakingSpellEnabled auto
spell property CloakAbility auto
Int property Interval auto
actor property PlayerRef auto

;-- Variables ---------------------------------------
Int oldSex = 0

;-- Functions ---------------------------------------

function OnLocationChange(Location akOldLoc, Location akNewLoc)

	if CloakingSpellEnabled.GetValueInt() == 1 && System.ModEnabled.GetValueInt() == 1
		PlayerRef.AddSpell(CloakAbility, false)
		utility.WaitMenuMode(2.00000)
		PlayerRef.RemoveSpell(CloakAbility)
	endIf
endFunction

function OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

	System.PantyWidget.UpdateContent()
endFunction

function OnInit()

	if self as Bool && self.GetActorReference() as Bool
		oldSex = self.GetActorReference().GetActorBase().GetSex()
	endIf
	self.OnPlayerLoadGame()
endFunction

function OnUpdate()

	if CloakingSpellEnabled.GetValueInt() == 1 && System.ModEnabled.GetValueInt() == 1
		PlayerRef.AddSpell(CloakAbility, false)
		utility.WaitMenuMode(2.00000)
		PlayerRef.RemoveSpell(CloakAbility)
	endIf
	self.RegisterForSingleUpdate(Interval as Float)
endFunction

function OnMenuClose(String menuName)

	if menuName == "RaceSex Menu"
		System.CheckPlayerSex()
		if System.Player != none
			System.Player.GetBaseMeasurements(true)
			System.Player.SetBelly(false)
		endIf
	endIf
endFunction

function OnPlayerLoadGame()

	self.RegisterForSingleUpdate(2.00000)
	self.UnregisterForAllMenus()
	self.RegisterForMenu("RaceSex Menu")
	utility.WaitMenuMode(1.00000)
	System.OnGameLoad(false)
endFunction

function OnModReset()

	self.RegisterForSingleUpdate(1.00000)
	self.UnregisterForAllMenus()
	self.RegisterForMenu("RaceSex Menu")
endFunction

function OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

	System.PantyWidget.UpdateContent()
endFunction

; Skipped compiler generated GotoState

function OnRaceSwitchComplete()

	System.Message(Contents.RaceSwitchedCompleted, System.MSG_Debug, 0)
	if oldSex != self.GetActorReference().GetActorBase().GetSex()
		if self.GetActorReference().GetActorBase().GetSex() == 0
			if !self.GetActorReference().HasSpell(BeeingMaleSpell as Form)
				self.GetActorReference().AddSpell(BeeingMaleSpell, true)
			endIf
			if self.GetActorReference().HasSpell(BeeingFemaleSpell as Form)
				self.GetActorReference().RemoveSpell(BeeingFemaleSpell)
			endIf
		else
			if !self.GetActorReference().HasSpell(BeeingFemaleSpell as Form)
				self.GetActorReference().AddSpell(BeeingFemaleSpell, true)
			endIf
			if !self.GetActorReference().HasSpell(BeeingMaleSpell as Form)
				self.GetActorReference().RemoveSpell(BeeingMaleSpell)
			endIf
		endIf
		oldSex = self.GetActorReference().GetActorBase().GetSex()
	endIf
endFunction

; Skipped compiler generated GetState

function OnMenuOpen(String menuName)

	if menuName == "RaceSex Menu"
		oldSex = PlayerRef.GetLeveledActorBase().GetSex()
		if System.Player != none
			System.Player.ResetBelly()
		endIf
	endIf
endFunction

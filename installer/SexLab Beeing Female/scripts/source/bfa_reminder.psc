;/ Decompiled by Champollion V1.0.1
Source   : BFA_Reminder.psc
Modified : 2016-12-06 03:52:10
Compiled : 2017-01-15 06:28:36
User     : admin
Computer : PATRICK
/;
scriptName BFA_Reminder extends FWAddOn_Misc

;-- Properties --------------------------------------
fwsystem property System auto

;-- Variables ---------------------------------------
Bool bActive = false

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnGameLoad()

	if System == none
		System = game.GetFormFromFile(3426, "BeeingFemale.esm") as fwsystem
	endIf
	if bActive == true
		self.RegisterForSingleUpdateGameTime(2.00000)
		self.execute()
	else
		self.SetStage(0)
		self.SetObjectiveDisplayed(0, false, false)
		self.SetObjectiveDisplayed(1, false, false)
		self.SetObjectiveDisplayed(2, false, false)
	endIf
endFunction

function OnAddOnActivate()

	if bActive == false
		debug.Trace("Reminder activated", 0)
		bActive = true
		self.RegisterForUpdateGameTime(2.00000)
		self.execute()
	endIf
endFunction

function execute()

	actor PlayerRef = game.GetPlayer()
	if PlayerRef.GetLeveledActorBase().GetSex() == 0 || storageutil.FormListFind(none, "FW.SavedNPCs", PlayerRef as form) < 0
		self.SetStage(0)
		self.SetObjectiveDisplayed(0, false, false)
		self.SetObjectiveDisplayed(1, false, false)
		self.SetObjectiveDisplayed(2, false, false)
		return 
	endIf
	Float Time = utility.GetCurrentGameTime()
	Float cDur = System.GetPillDuration(PlayerRef)
	Float cTime = storageutil.GetFloatValue(PlayerRef as form, "FW.ContraceptionTime", 0.000000)
	Float contraception = System.Controller.getContraceptionTimed(PlayerRef, Time)
	if contraception < 5.00000
		if self.GetStage() != 0
			self.SetStage(0)
			self.SetObjectiveDisplayed(0, false, false)
			self.SetObjectiveDisplayed(1, false, false)
			self.SetObjectiveDisplayed(2, false, false)
		endIf
	elseIf cTime + cDur + 0.200000 < Time
		if self.GetStage() != 2
			self.SetStage(2)
			self.SetObjectiveDisplayed(0, false, false)
			self.SetObjectiveDisplayed(1, false, false)
			self.SetObjectiveDisplayed(2, true, false)
		endIf
	elseIf cTime + cDur * 0.730000 > Time
		if self.GetStage() != 0
			self.SetStage(0)
			self.SetObjectiveDisplayed(0, false, false)
			self.SetObjectiveDisplayed(1, false, false)
			self.SetObjectiveDisplayed(2, false, false)
		endIf
	elseIf self.GetStage() != 1
		self.SetStage(1)
		self.SetObjectiveDisplayed(0, false, false)
		self.SetObjectiveDisplayed(1, true, false)
		self.SetObjectiveDisplayed(2, false, false)
	endIf
endFunction

function OnAddOnDeactivate()

	if bActive == true
		debug.Trace("Reminder deactivated", 0)
		bActive = false
		self.UnregisterForUpdateGameTime()
		self.SetStage(0)
		self.SetObjectiveDisplayed(0, false, false)
		self.SetObjectiveDisplayed(1, false, false)
		self.SetObjectiveDisplayed(2, false, false)
	endIf
endFunction

function OnContraception(actor Woman, Float Amount, Float ValueBefore, Float ValueAfter, Float TimeAgo)

	self.execute()
endFunction

; Skipped compiler generated GetState

function OnUpdateGameTime()

	if self == none
		return 
	endIf
	self.execute()
	if bActive == true
		self.RegisterForSingleUpdateGameTime(2.00000)
	endIf
endFunction

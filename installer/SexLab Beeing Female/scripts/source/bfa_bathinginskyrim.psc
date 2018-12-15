;/ Decompiled by Champollion V1.0.1
Source   : BFA_BathingInSkyrim.psc
Modified : 2017-01-13 11:00:23
Compiled : 2017-01-15 06:28:37
User     : admin
Computer : PATRICK
/;
scriptName BFA_BathingInSkyrim extends FWAddOn_Misc

;-- Properties --------------------------------------
fwsystem property System auto
magiceffect property sBathingEffect auto
magiceffect property sBathingEffectSoap auto

;-- Variables ---------------------------------------
Int TryRegisterCount = 0
Bool bActive = false
Bool bIsInstalled = false

;-- Functions ---------------------------------------

function OnAddOnDeactivate()

	if bActive == true
		bActive = false
	endIf
endFunction

Bool function IsActive()

	if System == none
		self.GetSystem()
		return false
	endIf
	if sBathingEffect == none
		self.RegisterForSingleUpdate(5.00000)
		return false
	endIf
	if sBathingEffectSoap == none
		self.RegisterForSingleUpdate(5.00000)
		return false
	endIf
	return true
endFunction

; Skipped compiler generated GotoState

function OnAddOnActivate()

	if bActive == false
		bActive = true
	endIf
endFunction

function OnMagicEffectApply(Actor akWoman, ObjectReference akCaster, magiceffect akEffect)

	if bIsInstalled as Bool && bActive as Bool
		if akEffect == sBathingEffect
			System.Controller.WashOutSperm(akWoman, 1, 0.600000)
		elseIf akEffect == sBathingEffectSoap
			System.Controller.WashOutSperm(akWoman, 1, 0.800000)
		endIf
	endIf
endFunction

function OnUpdate()

	Int idx = game.GetModCount()
	String modName = ""
	while idx > 0
		idx -= 1
		modName = game.GetModName(idx)
		if modName == "Bathing in Skyrim - Main.esp" || modName == "Bathing in Skyrim - Main.esm"
			sBathingEffect = game.GetFormFromFile(166459, modName) as magiceffect
			sBathingEffectSoap = game.GetFormFromFile(141567, modName) as magiceffect
			bIsInstalled = sBathingEffect != none && sBathingEffectSoap != none
			TryRegisterCount = 0
			return 
		endIf
	endWhile
	if !(TryRegisterCount > 10)
		TryRegisterCount += 1
		self.RegisterForSingleUpdate(5.00000)
	endIf
endFunction

; Skipped compiler generated GetState

function OnGameLoad()

	if System == none
		System = self.GetSystem()
	endIf
	bIsInstalled = false
	sBathingEffect = none
	sBathingEffectSoap = none
	TryRegisterCount = 0
	self.RegisterForSingleUpdate(5.00000)
endFunction

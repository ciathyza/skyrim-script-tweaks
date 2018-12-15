;/ Decompiled by Champollion V1.0.1
Source   : FWAntiSpermEssence.psc
Modified : 2016-12-06 03:53:07
Compiled : 2017-01-18 08:35:50
User     : admin
Computer : PATRICK
/;
scriptName FWAntiSpermEssence extends activemagiceffect

;-- Properties --------------------------------------
Int property UpdateEvery = 10 auto
fwsystem property System auto

;-- Variables ---------------------------------------
Float Strength = 0.000000
actor woman

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnEffectStart(actor akTarget, actor akCaster)

	woman = akTarget
	utility.Wait(0.200000)
	Strength = self.GetMagnitude()
	self.Execute()
	if self.GetDuration() >= UpdateEvery as Float
		self.RegisterForSingleUpdate(UpdateEvery as Float)
	endIf
endFunction

function Execute()

	System.Controller.WashOutSperm(woman, 2, Strength / 100.000)
endFunction

function OnUpdate()

	self.Execute()
	self.RegisterForSingleUpdate(UpdateEvery as Float)
endFunction

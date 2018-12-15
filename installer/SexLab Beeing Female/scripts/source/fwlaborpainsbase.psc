;/ Decompiled by Champollion V1.0.1
Source   : FWLaborPainsBase.psc
Modified : 2017-01-13 12:05:25
Compiled : 2017-01-18 08:35:24
User     : admin
Computer : PATRICK
/;
scriptName FWLaborPainsBase extends activemagiceffect

;-- Properties --------------------------------------
Bool property Silent = false auto
Int property KindOfPains auto
Float property UpdateDelay auto
fwsystem property System auto
Float property DamageBase auto

;-- Variables ---------------------------------------
actor ActorRef

;-- Functions ---------------------------------------

function OnEffectStart(actor akTarget, actor akCaster)

	ActorRef = akTarget
	utility.Wait(2.00000)
	self.RegisterForSingleUpdateGameTime(utility.RandomFloat(UpdateDelay * 0.750000, UpdateDelay * 1.10000))
endFunction

function OnUpdateGameTime()

	Float rnd = utility.RandomFloat(-1.00000, 1.00000)
	if Silent == false
		System.PlayPainSound(ActorRef, (DamageBase + rnd) * 4.00000)
	endIf
	System.DoDamage(ActorRef, (DamageBase + rnd) * System.getDamageScale(3, ActorRef), KindOfPains, 0.000000)
	self.RegisterForSingleUpdateGameTime(utility.RandomFloat(UpdateDelay * 0.750000, UpdateDelay * 1.10000))
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

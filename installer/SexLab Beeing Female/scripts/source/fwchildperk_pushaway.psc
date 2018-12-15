;/ Decompiled by Champollion V1.0.1
Source   : FWChildPerk_PushAway.psc
Modified : 2017-01-05 19:58:45
Compiled : 2017-01-18 08:35:36
User     : admin
Computer : PATRICK
/;
scriptName FWChildPerk_PushAway extends ActiveMagicEffect

;-- Properties --------------------------------------
Int property PushForce auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(actor Target, actor Caster)

	Caster.PushActorAway(Target, PushForce as Float)
endFunction

; Skipped compiler generated GotoState

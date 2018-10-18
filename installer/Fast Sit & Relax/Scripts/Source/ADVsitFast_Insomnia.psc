;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_Insomnia.psc
Modified : 2014-05-16 21:21:20
Compiled : 2014-07-20 00:21:32
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_Insomnia extends ActiveMagicEffect

;-- Properties --------------------------------------
spell property Insomnia auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnUpdate()

	game.getplayer().removeSpell(Insomnia)
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectFinish(Actor akTarget, Actor akCaster)

	self.unRegisterForUpdateGameTime()
endFunction

function OnEffectStart(Actor akTarget, Actor akCaster)

	self.RegisterForSingleUpdateGameTime(1 as Float)
endFunction

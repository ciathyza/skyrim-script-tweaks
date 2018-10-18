;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_UpdateSpeedMult.psc
Modified : 2014-06-27 21:12:12
Compiled : 2014-07-20 00:21:19
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_UpdateSpeedMult extends ActiveMagicEffect

;-- Properties --------------------------------------
spell property SPELLspeed auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnEffectFinish(Actor akTarget, Actor akCaster)

	SPELLspeed.SetNthEffectMagnitude(0, 0 as Float)
	SPELLspeed.SetNthEffectDuration(0, 0)
	SPELLspeed.SetNthEffectDuration(1, 0)
	game.getPlayer().ModActorValue("InventoryWeight", 1 as Float)
	game.getPlayer().ModActorValue("InventoryWeight", -1 as Float)
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	game.getPlayer().ModActorValue("InventoryWeight", 1 as Float)
	game.getPlayer().ModActorValue("InventoryWeight", -1 as Float)
endFunction

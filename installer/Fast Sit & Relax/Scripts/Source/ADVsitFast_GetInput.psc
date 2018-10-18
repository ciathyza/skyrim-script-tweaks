;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_GetInput.psc
Modified : 2014-07-19 17:25:44
Compiled : 2014-07-20 00:21:39
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_GetInput extends ActiveMagicEffect

;-- Properties --------------------------------------
globalvariable property LISTEN02 auto
actor property player auto hidden
spell property SPELLself auto

;-- Variables ---------------------------------------
Bool COOLDOWN
Bool PRESSED
Float DELAYkickin
Int value

;-- Functions ---------------------------------------

function OnEffectFinish(actor akTarget, actor akCaster)

	player.addspell(SPELLself, 0 as Bool)
endFunction

; Skipped compiler generated GotoState

function OnControlDown(String control)

	if !utility.IsInMenuMode()
		if control == "Sneak"
			if LISTEN02.getValue() == 0 as Float
				LISTEN02.setValue(100 as Float)
			endIf
		endIf
	endIf
endFunction

function OnControlUp(String control, Float HoldTime)

	if control == "Sneak"
		if LISTEN02.getValue() != 0 as Float
			LISTEN02.setValue(0 as Float)
		endIf
	endIf
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	self.RegisterForControl("Sneak")
	player = game.getPlayer()
endFunction

; Skipped compiler generated GetState

function OnPlayerLoadGame()

	self.RegisterForControl("Sneak")
endFunction

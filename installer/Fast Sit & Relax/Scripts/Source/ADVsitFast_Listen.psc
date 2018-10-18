;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_Listen.psc
Modified : 2014-07-19 16:10:29
Compiled : 2014-07-20 00:21:28
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_Listen extends ActiveMagicEffect

;-- Properties --------------------------------------
effectshader property PMSGREEN auto
actor property player auto hidden
miscobject property Token auto

;-- Variables ---------------------------------------
Bool COOLDOWN
Bool PRESSED
Float DELAYkicking

;-- Functions ---------------------------------------

function OnControlUp(String control, Float HoldTime)

	if control == "Sneak"
		player.removeItem(Token as form, 1, true, none)
		player.setAv("Variable09", 0 as Float)
		utility.wait(0.100000)
		PRESSED = false
	endIf
endFunction

function OnEffectFinish(actor akTarget, actor akCaster)

	; Empty function
endFunction

; Skipped compiler generated GotoState

function OnControlDown(String control)

	if !utility.IsInMenuMode()
		if control == "Sneak"
			if player.isInCombat() == false
				if PRESSED == false
					PRESSED = true
					player.setAv("Variable09", 1 as Float)
					if player.getItemCount(Token as form) == 0
						player.additem(Token as form, 1, true)
					endIf
				endIf
			endIf
		endIf
	endIf
endFunction

function onupdate()

	if PRESSED == true
		if player.getAv("Variable09") == 1 as Float
			if player.getItemCount(Token as form) == 0
				PMSGREEN.play(player as objectreference, 0.100000)
				player.additem(Token as form, 1, true)
			endIf
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

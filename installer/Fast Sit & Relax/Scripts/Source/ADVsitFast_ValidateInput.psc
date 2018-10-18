;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_ValidateInput.psc
Modified : 2014-07-01 20:01:34
Compiled : 2014-07-20 00:22:49
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_ValidateInput extends ActiveMagicEffect

;-- Properties --------------------------------------
actor property Player auto hidden
spell property SPELLself auto
globalvariable property LISTEN03 auto
magiceffect property MEself auto
imagespacemodifier property IMODsitready auto
referencealias property MASTER auto
effectshader property PMS auto
globalvariable property LISTEN04 auto
globalvariable property LISTEN02 auto
globalvariable property LISTEN01 auto

;-- Variables ---------------------------------------
Float DELAYwait

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(actor akTarget, actor akCaster)

	Player = game.getPlayer()
	if LISTEN04.getValue() == 0 as Float
		if (MASTER as advsitfast_masterquest).HoldCrouch == true
			LISTEN04.setValue(50 as Float)
			DELAYwait = utility.getCurrentRealTime() + (MASTER as advsitfast_masterquest).DELAYkickin
			while utility.getCurrentRealTime() < DELAYwait && LISTEN01.getValue() == 100 as Float && LISTEN02.getValue() == 100 as Float && LISTEN03.getValue() == 100 as Float
				if utility.IsInMenuMode()
					LISTEN01.setValue(0 as Float)
					LISTEN02.setValue(0 as Float)
					LISTEN03.setValue(0 as Float)
					LISTEN04.setValue(0 as Float)
					Player.removeSpell(SPELLself)
				endIf
				while LISTEN01.getValue() == 100 as Float && Player.getAv("Variable05") != 0 as Float
					
				endWhile
			endWhile
			Player.removeSpell(SPELLself)
		elseIf LISTEN04.getValue() == 0 as Float
			LISTEN04.setValue(50 as Float)
			DELAYwait = utility.getCurrentRealTime() + (MASTER as advsitfast_masterquest).delayKickinKey
			while input.IsKeyPressed((MASTER as advsitfast_masterquest).UserKey) && utility.getCurrentRealTime() < DELAYwait
				while utility.IsInMenuMode()
					LISTEN04.setValue(0 as Float)
					Player.removeSpell(SPELLself)
				endWhile
			endWhile
			Player.removeSpell(SPELLself)
		endIf
	else
		LISTEN04.setValue(0 as Float)
		LISTEN01.setValue(0 as Float)
		LISTEN02.setValue(0 as Float)
		LISTEN03.setValue(0 as Float)
	endIf
endFunction

function OnEffectFinish(actor akTarget, actor akCaster)

	if LISTEN04.getValue() != 0 as Float
		if !utility.IsInMenuMode()
			if (MASTER as advsitfast_masterquest).HoldCrouch == true
				if LISTEN01.getValue() == 100 as Float && LISTEN02.getValue() == 100 as Float && LISTEN03.getValue() == 100 as Float && Player.getAv("Variable05") == 0 as Float
					DELAYwait = utility.getCurrentRealTime() + (MASTER as advsitfast_masterquest).delayKickinCrouchLay
					if Player.isInCombat() == false
						IMODsitready.apply(1 as Float)
					endIf
					while utility.getCurrentRealTime() < DELAYwait
						if LISTEN01.getValue() != 100 as Float && LISTEN02.getValue() != 100 as Float && LISTEN03.getValue() != 100 as Float
							LISTEN04.setValue(200 as Float)
							(MASTER as advsitfast_masterquest).Perform("Primary")
							DELAYwait = (-1) as Float
						endIf
					endWhile
					if LISTEN01.getValue() == 100 as Float && LISTEN02.getValue() == 100 as Float && LISTEN03.getValue() == 100 as Float
						if Player.isInCombat() == false
							IMODsitready.apply(1 as Float)
						endIf
						(MASTER as advsitfast_masterquest).Perform("Secondary")
					endIf
				endIf
			elseIf input.IsKeyPressed((MASTER as advsitfast_masterquest).UserKey)
				(MASTER as advsitfast_masterquest).Perform("Secondary")
			else
				LISTEN04.setValue(200 as Float)
				(MASTER as advsitfast_masterquest).Perform("Primary")
			endIf
		endIf
	endIf
	utility.wait(0.100000)
	LISTEN01.setValue(0 as Float)
	LISTEN04.setValue(0 as Float)
	Player.removeSpell(SPELLself)
endFunction

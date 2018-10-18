;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_BuffMePlentySleep.psc
Modified : 2014-07-18 23:45:19
Compiled : 2014-07-20 00:22:16
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_BuffMePlentySleep extends ActiveMagicEffect

;-- Properties --------------------------------------
globalvariable property GLBlastPassive auto
message property MSGresults auto
musictype property MUSstart auto
globalvariable property GLBlastFingerSkill auto
actor property Player auto hidden
spell property SPELLcritical01bonus auto
spell property SPELLpassive01Experimenter auto
spell property SPELLcritical02paralysis auto
spell property SPELLpassive02Physician auto
spell property SPELLfingerSkill02charging auto
quest property SleepQuest auto
spell property SPELLfingerSkill01tempering auto
spell property Insomnia auto
spell property SPELLpassive03Poisons auto
spell property SPELLpassive04Benefactor auto
globalvariable property GLBlastCritical auto

;-- Variables ---------------------------------------
Int RANDOM

;-- Functions ---------------------------------------

function RollPassive()

	RANDOM = utility.RandomInt(1, 4)
	if RANDOM == 1
		if GLBlastPassive.getValue() != 1 as Float
			Player.addspell(SPELLpassive01Experimenter, 0 as Bool)
			GLBlastPassive.setValue(1 as Float)
			self.RollFingerSkill()
		else
			self.RollPassive()
		endIf
	elseIf RANDOM == 2
		if GLBlastPassive.getValue() != 2 as Float
			Player.addspell(SPELLpassive02Physician, 0 as Bool)
			GLBlastPassive.setValue(2 as Float)
			self.RollFingerSkill()
		else
			self.RollPassive()
		endIf
	elseIf RANDOM == 3
		if GLBlastPassive.getValue() != 3 as Float
			Player.addspell(SPELLpassive03Poisons, 0 as Bool)
			GLBlastPassive.setValue(3 as Float)
			self.RollFingerSkill()
		else
			self.RollPassive()
		endIf
	elseIf RANDOM == 4
		if GLBlastPassive.getValue() != 4 as Float
			Player.addspell(SPELLpassive04Benefactor, 0 as Bool)
			GLBlastPassive.setValue(4 as Float)
			self.RollFingerSkill()
		else
			self.RollPassive()
		endIf
	endIf
endFunction

function RollCritical()

	RANDOM = 1
	if RANDOM == 1
		if GLBlastCritical.getValue() != 1 as Float
			Player.addspell(SPELLcritical01bonus, 0 as Bool)
			GLBlastCritical.setValue(1 as Float)
		else
			self.RollCritical()
		endIf
	elseIf RANDOM == 2
		if GLBlastCritical.getValue() != 2 as Float
			Player.addspell(SPELLcritical02paralysis, 0 as Bool)
			GLBlastCritical.setValue(2 as Float)
		else
			self.RollCritical()
		endIf
	endIf
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function RollFingerSkill()

	RANDOM = utility.RandomInt(1, 2)
	if RANDOM == 1
		if GLBlastFingerSkill.getValue() != 1 as Float
			Player.addspell(SPELLfingerSkill01tempering, 0 as Bool)
			GLBlastFingerSkill.setValue(1 as Float)
		else
			self.RollFingerSkill()
		endIf
	elseIf RANDOM == 2
		if GLBlastFingerSkill.getValue() != 2 as Float
			Player.addspell(SPELLfingerSkill02charging, 0 as Bool)
			GLBlastFingerSkill.setValue(2 as Float)
		else
			self.RollFingerSkill()
		endIf
	endIf
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	Player = game.GetPlayer()
	Player.dispelSpell(Insomnia)
	if Player.hasspell(SPELLcritical01bonus as form)
		Player.removeSpell(SPELLcritical01bonus)
	endIf
	if Player.hasspell(SPELLcritical02paralysis as form)
		Player.removeSpell(SPELLcritical02paralysis)
	endIf
	if Player.hasspell(SPELLpassive01Experimenter as form)
		Player.removeSpell(SPELLpassive01Experimenter)
	endIf
	if Player.hasspell(SPELLpassive02Physician as form)
		Player.removeSpell(SPELLpassive02Physician)
	endIf
	if Player.hasspell(SPELLpassive03Poisons as form)
		Player.removeSpell(SPELLpassive03Poisons)
	endIf
	if Player.hasspell(SPELLpassive04Benefactor as form)
		Player.removeSpell(SPELLpassive04Benefactor)
	endIf
	if Player.hasspell(SPELLfingerSkill01tempering as form)
		Player.removeSpell(SPELLfingerSkill01tempering)
	endIf
	if Player.hasspell(SPELLfingerSkill02charging as form)
		Player.removeSpell(SPELLfingerSkill02charging)
	endIf
	utility.wait(0.500000)
	MUSstart.add()
	utility.wait(0.500000)
	debug.notification("You awake exceptionally well rested!")
	self.RollPassive()
endFunction

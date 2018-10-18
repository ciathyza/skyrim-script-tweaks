;/ Decompiled by Champollion V1.0.0
Source   : ADVSitFast_Generic.psc
Modified : 2014-07-19 23:35:18
Compiled : 2014-07-20 21:35:00
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVSitFast_Generic extends Quest

;-- Properties --------------------------------------
Bool property TUTORIALhorse auto hidden
objectreference property HelpGuide auto
sound property SFXtutorial auto
actor property ActiveTarget auto hidden
faction property FACTanalized auto
soulgem property SoulGemCommonFilled auto
soulgem property SoulGemPettyFilled auto
Bool property SetReturn auto hidden
book property REFhelpGuide auto
message property TUTtoggleHud auto
message property TUThorse auto
soulgem property SoulGemLesserFilled auto
soulgem property SoulGemBlackFilled auto
message property TUTcamera auto
globalvariable property LISTEN03 auto
soulgem property SoulGemGrandFilled auto
referencealias property Master auto
soulgem property SoulGemGreaterFilled auto
Bool property BUSY auto hidden

;-- Variables ---------------------------------------
Int MagicNumber
Int PreviousLVL
Int LVLplayer
Int BUTTON
Int CHANCE
Int LVLrange
Int LVLattacker

;-- Functions ---------------------------------------

function OnPlayerLoadGame()
	self.RegisterForControl("Sneak")
endFunction


function OnMenuClose(String getMenu)
	if getMenu == "Book Menu"
		if game.getPlayer().getItemcount(REFhelpGuide as form) > 1
			game.getPlayer().removeItem(REFhelpGuide as form, 1, 1 as Bool, none)
			utility.wait(0.100000)
		elseIf game.getPlayer().getItemcount(REFhelpGuide as form) == 0
			HelpGuide.delete()
		endIf
		self.unRegisterForMenu("Book Menu")
	endIf
endFunction


function OnControlDown(String control)
	if !utility.IsInMenuMode()
		if control == "Sneak"
			if LISTEN03.getValue() == 0 as Float
				LISTEN03.setValue(100 as Float)
			endIf
		endIf
	endIf
endFunction


function OnControlUp(String control, Float HoldTime)
	if control == "Sneak"
		if LISTEN03.getValue() != 0 as Float
			LISTEN03.setValue(0 as Float)
		endIf
	endIf
endFunction


function ShowManual()
	self.RegisterForMenu("Book Menu")
	HelpGuide = game.getPlayer().placeAtme(REFhelpGuide as form, 1, false, false)
	utility.wait(0.100000)
	HelpGuide.activate(game.getPlayer() as objectreference, false)
endFunction


function OnInit()
	self.RegisterForControl("Sneak")
endFunction


; Skipped compiler generated GetState

function Transfer(actor INCOMING)
	if BUSY == false
		BUSY = true
		CHANCE = 0
		MagicNumber = 0
		ActiveTarget = INCOMING
		self.EvaluateLoot()
	endIf
endFunction


; Skipped compiler generated GotoState

function ShowHelp(String HelpTopic)
	SFXtutorial.play(game.getPlayer() as objectreference)
	if HelpTopic == "toggleHud"
		message.ResetHelpMessage("shout")
		TUTtoggleHud.ShowAsHelpMessage("shout", 6 as Float, 6 as Float, 1)
	elseIf HelpTopic == "camera"
		message.ResetHelpMessage("shout")
		TUTcamera.ShowAsHelpMessage("shout", 8 as Float, 8 as Float, 1)
	elseIf HelpTopic == "horse"
		TUTORIALhorse = true
		message.ResetHelpMessage("shout")
		TUThorse.ShowAsHelpMessage("shout", 7 as Float, 7 as Float, 1)
	endIf
endFunction


function EvaluateLoot()
	LVLplayer = game.getPlayer().getLevel()
	LVLattacker = ActiveTarget.getLevel()
	LVLrange = LVLplayer - 3
	if LVLattacker > LVLplayer
		CHANCE += 6
	elseIf LVLattacker == LVLplayer
		CHANCE += 4
	elseIf LVLattacker > LVLrange || LVLattacker == LVLrange
		CHANCE += 2
	elseIf LVLattacker < LVLplayer
		CHANCE -= 2
	endIf
	MagicNumber = utility.randomInt(0, 20)
	MagicNumber += CHANCE
	if MagicNumber > 10

	endIf
	BUSY = false
endFunction


function GetSacrifice()
	PreviousLVL = (Master as advsitfast_masterquest).AlasHappy
	SetReturn = false
	if (Master as advsitfast_masterquest).Alas.getItemcount(SoulGemPettyFilled as form) != 0
		if (Master as advsitfast_masterquest).AlasHappy < 1
			(Master as advsitfast_masterquest).AlasHappy = 1
		else
			game.getPlayer().additem(SoulGemPettyFilled as form, 1, false)
			SetReturn = true
		endIf
	elseIf (Master as advsitfast_masterquest).Alas.getItemcount(SoulGemLesserFilled as form) != 0
		if (Master as advsitfast_masterquest).AlasHappy < 2
			(Master as advsitfast_masterquest).AlasHappy = 2
		else
			game.getPlayer().additem(SoulGemLesserFilled as form, 1, false)
			SetReturn = true
		endIf
	elseIf (Master as advsitfast_masterquest).Alas.getItemcount(SoulGemCommonFilled as form) != 0
		if (Master as advsitfast_masterquest).AlasHappy < 3
			(Master as advsitfast_masterquest).AlasHappy = 3
		else
			game.getPlayer().additem(SoulGemCommonFilled as form, 1, false)
			SetReturn = true
		endIf
	elseIf (Master as advsitfast_masterquest).Alas.getItemcount(SoulGemGreaterFilled as form) != 0
		if (Master as advsitfast_masterquest).AlasHappy < 4
			(Master as advsitfast_masterquest).AlasHappy = 4
		else
			game.getPlayer().additem(SoulGemGreaterFilled as form, 1, false)
			SetReturn = true
		endIf
	elseIf (Master as advsitfast_masterquest).Alas.getItemcount(SoulGemGrandFilled as form) != 0
		if (Master as advsitfast_masterquest).AlasHappy < 5
			(Master as advsitfast_masterquest).AlasHappy = 5
		else
			game.getPlayer().additem(SoulGemGrandFilled as form, 1, false)
			SetReturn = true
		endIf
	elseIf (Master as advsitfast_masterquest).Alas.getItemcount(SoulGemBlackFilled as form) != 0
		if (Master as advsitfast_masterquest).AlasHappy < 6
			(Master as advsitfast_masterquest).AlasHappy = 6
		else
			game.getPlayer().additem(SoulGemBlackFilled as form, 1, false)
			SetReturn = true
		endIf
	endIf
	if (Master as advsitfast_masterquest).AlasHappy > PreviousLVL && PreviousLVL != 0
		debug.notification("The Covenant has grown stronger...")
	elseIf (Master as advsitfast_masterquest).AlasHappy == PreviousLVL && PreviousLVL != 0
		if SetReturn == false
			debug.notification("The Covenant remains...")
		else
			debug.notification("The Covenant remains...")
		endIf
	elseIf (Master as advsitfast_masterquest).AlasHappy != 0 && PreviousLVL == 0
		debug.messagebox("A Covenant has been made...")
	endIf
endFunction

;/ Decompiled by Champollion V1.0.0
Source   : ADVSitFast_ActionScript.psc
Modified : 2014-07-20 21:13:26
Compiled : 2014-07-20 21:35:19
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVSitFast_ActionScript extends ObjectReference

;-- Properties --------------------------------------
globalvariable property PlayerIsVampire auto
Int property Tried auto hidden
imagespacemodifier property IMODsleepAbort auto
message property MSGinfoNoAct auto
referencealias property MASTER auto
Int property Chance auto hidden
Float property ReturnPosX auto hidden
imagespacemodifier property IMODfadeOut auto
imagespacemodifier property IMODpitchBlack auto
globalvariable property GLBSETshakeController auto
Int property UserKey auto hidden
musictype property MUSfail auto
globalvariable property GLBfindBed auto
Float property ReturnPosY auto hidden
quest property SleepQuest auto
Float property TryingToSleep auto hidden
actor property Player auto hidden
globalvariable property GLBcustomSitState auto
Float property ReturnAngleZ auto hidden
Bool property failed auto hidden
globalvariable property GLBmusic auto
actor property Camera auto hidden
imagespacemodifier property IMODsleepStart auto
Bool property ControlPressed auto hidden
Float property ReturnPosZ auto hidden
furniture property REFbed auto
musictype property MUSsleep auto
Float property DELAYkickin auto hidden
sound property SFXabort auto
ObjectReference property SleepPlenty auto hidden
magiceffect property MEInsomnia auto
globalvariable property GLBSETshakeCamera auto
spell property Insomnia auto
imagespacemodifier property IMODsleepElixir auto
magiceffect property SleepWell auto
Bool property ALIVE auto hidden
Bool property HudWasEnabled auto hidden

;-- Variables ---------------------------------------
Int Random
Float TIME
Int LastResponse
Int SleepGo
Bool NightTime

;-- Functions ---------------------------------------

function OnKeyDown(Int keyCode)

	if !utility.IsInMenuMode()
		if keyCode == UserKey && SleepGo != 100
			ControlPressed = true
			utility.wait(0.500000)
			self.Listen()
		endIf
	endIf
endFunction

function terminate()

	if ALIVE == true
		GLBcustomSitState.setValue(0 as Float)
		if (MASTER as advsitfast_masterquest).HoldCrouch == true
			self.unRegisterForControl("Sneak")
		else
			self.unRegisterForKey(UserKey)
		endIf
		Player.BlockActivation(false)
		self.unRegisterForControl("Activate")
		self.unRegisterForControl("Toggle POV")
		MASTER.UnRegisterForSleep()
		Chance = 0
		SleepGo = 0
		Tried = 0
		ControlPressed = false
		if SleepPlenty != none
			SleepPlenty.delete()
			SleepPlenty = none
		endIf
		ALIVE = false
		SleepQuest.RegisterForSleep()
	endIf
endFunction

function OnKeyUp(Int keyCode, Float HoldTime)

	if !utility.IsInMenuMode()
		if keyCode == UserKey
			ControlPressed = false
			if SleepGo == 0
				if (MASTER as advsitfast_masterquest).HoldCrouch == true
					self.unRegisterForControl("Sneak")
				else
					self.unRegisterForKey(UserKey)
				endIf
				(MASTER as advsitfast_masterquest).Wake()
			elseIf SleepGo == 50
				self.abort()
			endIf
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function abort()

	if SleepGo != 100
		if HudWasEnabled == true
			game.SetHudCartMode(false)
			(MASTER as advsitfast_masterquest).TOGGLEhud = 0
		else
			(MASTER as advsitfast_masterquest).TOGGLEhud = 1
		endIf
		DELAYkickin = utility.getCurrentRealTime() + 0.100000
		SFXabort.play(Player as ObjectReference)
		MUSsleep.remove()
		IMODsleepAbort.apply(1.00000)
		IMODpitchBlack.remove()
		IMODsleepStart.remove()
		if GLBSETshakeCamera.getValue() != 0 as Float
			game.ShakeCamera(none, 0.500000, 0.250000)
		endIf
		if GLBSETshakeController.getValue() != 0 as Float
			game.ShakeController(0.150000, 0.150000, 0.500000)
		endIf
		SleepGo = 0
	endIf
endFunction

function OnMenuClose(String menuName)

	if menuName == "Sleep/Wait Menu"
		if Player.getSleepState() == 0 || Player.getSitState() == 0
			(MASTER as advsitfast_masterquest).TranslationCompleted = false
			Player.moveto(Player as ObjectReference, 0.000000, 0.000000, 0.000000, true)
			utility.wait(0.100000)
			Player.setPosition(ReturnPosX, ReturnPosY, Player.getPositionZ())
			self.unRegisterForMenu("Sleep/Wait Menu")
		endIf
	endIf
endFunction

function Initialize()

	Player = game.getPlayer()
	ALIVE = true
	UserKey = (MASTER as advsitfast_masterquest).UserKey
	if (MASTER as advsitfast_masterquest).GetFurniture == "Bed"
		SleepQuest.RegisterForSleep()
	else
		SleepQuest.UnRegisterForSleep()
	endIf
	if (MASTER as advsitfast_masterquest).HoldCrouch == true
		self.RegisterForControl("Sneak")
	else
		self.RegisterForKey(UserKey)
	endIf
	TIME = utility.GetCurrentGameTime()
	TIME -= math.Floor(TIME) as Float
	TIME *= 24 as Float
	if TIME > 5 as Float && TIME < 19 as Float
		NightTime = false
	else
		NightTime = true
	endIf
	Player.BlockActivation(true)
	(MASTER as advsitfast_masterquest).PChasUsedSleepMenu = false
	Camera = (MASTER as advsitfast_masterquest).Camera.getRef() as actor
	ReturnAngleZ = Player.getAngleZ()
	ReturnPosX = Player.getPositionX()
	ReturnPosY = Player.getPositionY()
	ReturnPosZ = Player.getPositionZ()
	self.RegisterForControl("Activate")
	self.RegisterForControl("Toggle POV")
endFunction

function OnMenuOpen(String menuName)

	if menuName == "Sleep/Wait Menu"
		game.FadeOutGame(false, true, 60 as Float, 1000 as Float)
		SleepGo = 0
		MASTER.RegisterForSleep()
	endIf
endFunction

function OnControlDown(String control)

	if !utility.IsInMenuMode()
		if control == "Sneak" && SleepGo != 100
			ControlPressed = true
			utility.wait(0.500000)
			self.Listen()
		elseIf control == "Activate"
			SFXabort.play(Player as ObjectReference)
			IMODsleepAbort.apply(1.00000)
		endIf
	endIf
endFunction

function Listen()

	while ControlPressed == true && (MASTER as advsitfast_masterquest).AllowProcessing == true
		if SleepGo == 0
			if Player.IsTrespassing() == false
				if Player.hasMagicEffect(MEInsomnia) == 0 as Bool || Player.hasMagicEffect(SleepWell) != 0 as Bool || (MASTER as advsitfast_masterquest).GetFurniture == "Bed"
					if Chance != 333
						IMODsleepStart.apply(1.00000)
						if GLBmusic.getValue() != 0 as Float
							MUSsleep.add()
						endIf
						DELAYkickin = utility.getCurrentRealTime() + 4.50000
					endIf
					if (MASTER as advsitfast_masterquest).TOGGLEhud == 1
						HudWasEnabled = false
						(MASTER as advsitfast_masterquest).TOGGLEhud = -1
					else
						HudWasEnabled = true
						;game.SetHudCartMode(true)
						(MASTER as advsitfast_masterquest).TOGGLEhud = -1
					endIf
					SleepGo = 50
				else
					ControlPressed = false
					if Tried == 0
						debug.messagebox("You don't feel like sleeping right now.")
					else
						debug.messagebox("You don't feel like sleeping anymore!")
					endIf
				endIf
			else
				ControlPressed = false
				debug.notification("You cannot sleep while trespassing!")
			endIf
		elseIf SleepGo == 50
			while utility.getCurrentRealTime() < DELAYkickin && (MASTER as advsitfast_masterquest).AllowProcessing == true
				utility.wait(0.100000)
			endWhile
			if (MASTER as advsitfast_masterquest).AllowProcessing == true
				if ControlPressed == true
					if (MASTER as advsitfast_masterquest).HoldCrouch == true
						self.unRegisterForControl("Sneak")
					else
						self.unRegisterForKey(UserKey)
					endIf
					if Chance == 333
						IMODfadeOut.apply(1.00000)
						utility.wait(0.400000)
					endIf
					SleepGo = 100
					ReturnPosZ = Player.getPositionZ()
					IMODpitchBlack.apply(1.00000)
					game.FadeOutGame(false, true, 60 as Float, 1000 as Float)
					failed = false
					IMODsleepStart.remove()
					self.EvaluateSleep()
					ControlPressed = false
				endIf
			else
				game.FadeOutGame(false, true, 0 as Float, 1 as Float)
				failed = false
				IMODsleepStart.remove()
				ControlPressed = false
			endIf
		endIf
	endWhile
endFunction

function ReturnToView()

	if (MASTER as advsitfast_masterquest).GetFurniture == "Bed"
		Player.translateTo(ReturnPosX + 16 as Float * math.sin(Player.getAngleZ()), ReturnPosY + 16 as Float * math.cos(Player.getAngleZ()), Player.getPositionZ(), 0 as Float, 0 as Float, ReturnAngleZ, 1000 as Float, 0.000000)
		while (MASTER as advsitfast_masterquest).TranslationCompleted != true && (MASTER as advsitfast_masterquest).AllowProcessing == true
			utility.wait(0.100000)
		endWhile
	endIf
	utility.wait(0.250000)
	if Player.getSleepState() != 3
		while Player.getSitState() != 3 && (MASTER as advsitfast_masterquest).AllowProcessing == true
			Player.moveto(Player as ObjectReference, 0.000000, 0.000000, 0.000000, true)
			utility.wait(0.350000)
			debug.sendAnimationEvent(Player as ObjectReference, "IdleLayDownEnterInstant")
			utility.wait(0.350000)
		endWhile
	endIf
	Player.setAlpha(1 as Float, false)
	utility.wait(0.100000)
	game.FadeOutGame(false, true, 0 as Float, 3 as Float)
	IMODpitchBlack.remove()
	if (MASTER as advsitfast_masterquest).PCslept == true
		IMODsleepElixir.remove()
		(MASTER as advsitfast_masterquest).PCslept = false
	endIf
	utility.wait(0.250000)
	if HudWasEnabled == true
		game.SetHudCartMode(false)
		(MASTER as advsitfast_masterquest).TOGGLEhud = 0
	else
		;game.SetHudCartMode(true)
		(MASTER as advsitfast_masterquest).TOGGLEhud = 1
	endIf
	game.enableplayercontrols(1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 0)
	if (MASTER as advsitfast_masterquest).HoldCrouch == true
		self.RegisterForControl("Sneak")
	else
		self.RegisterForKey(UserKey)
	endIf
endFunction

function EvaluateSleep()

	if Chance != 333
		if Player.hasMagicEffect(SleepWell) != 0 as Bool
			Chance = 1000
		else
			Chance = utility.RandomInt(0, 100)
		endIf
		if PlayerIsVampire.getValue() == 0 as Float
			if NightTime == false
				Chance -= 20
			else
				Chance += 30
			endIf
		elseIf NightTime == false
			Chance += 30
		else
			Chance -= 20
		endIf
		if Player.IsInInterior() == false
			Chance -= 10
		else
			Chance += 10
		endIf
		if Tried != 0
			Int DecreaseChance = Tried * 10
			Chance -= DecreaseChance
		endIf
		if (MASTER as advsitfast_masterquest).GetFurniture == "Bed"
			Chance += 50
		else
			Chance -= 25
		endIf
		if Player.hasMagicEffect(MEInsomnia) != 0 as Bool
			Chance -= 35
		endIf
	endIf
	if Chance > 50 || Chance == 50
		if Player.hasMagicEffect(SleepWell) == 0 as Bool
			Chance = 333
		endIf
		if SleepPlenty == none
			SleepPlenty = Player.placeAtme(REFbed as form, 1, false, false)
		endIf
		game.DisablePlayerControls(1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 0)
		self.RegisterForMenu("Sleep/Wait Menu")
		GLBcustomSitState.setValue(100 as Float)
		(MASTER as advsitfast_masterquest).PChasUsedSleepMenu = true
		utility.wait(0.200000)
		debug.sendAnimationEvent(Player as ObjectReference, "IdleCartExitInstant")
		utility.wait(0.200000)
		while !utility.IsInMenuMode() && SleepGo == 100 && (MASTER as advsitfast_masterquest).AllowProcessing == true
			Player.moveto(Player as ObjectReference, 0.000000, 0.000000, 0.000000, true)
			(MASTER as advsitfast_masterquest).TranslationCompleted = false
			Player.setAlpha(0 as Float, false)
			SleepPlenty.Activate(Player as ObjectReference, false)
			utility.wait(0.200000)
		endWhile
	else
		failed = true
		utility.wait(1 as Float)
		if GLBmusic.getValue() != 0 as Float
			MUSsleep.remove()
			MUSfail.add()
		endIf
		if GLBSETshakeCamera.getValue() != 0 as Float
			game.ShakeCamera(none, 0.500000, 0.250000)
		endIf
		if GLBSETshakeController.getValue() != 0 as Float
			game.ShakeController(0.150000, 0.150000, 0.500000)
		endIf
		utility.wait(0.300000)
		Random = utility.RandomInt(1, 3)
		while Random == LastResponse
			Random = utility.RandomInt(1, 3)
			utility.wait(0.100000)
		endWhile
		if Random == 1
			if LastResponse != 1
				debug.messagebox("You can't find rest.")
				utility.wait(0.100000)
				debug.notification("You are crumpy...")
				LastResponse = 1
			endIf
		elseIf Random == 2
			if LastResponse != 2
				debug.messagebox("You can't sleep.")
				utility.wait(0.100000)
				debug.notification("You are bored...")
				LastResponse = 2
			endIf
		elseIf Random == 3
			if LastResponse != 3
				debug.messagebox("Alas, nothing happens.")
				utility.wait(0.100000)
				debug.notification("You are confused...")
				LastResponse = 3
			endIf
		endIf
		SFXabort.play(Player as ObjectReference)
		if Tried != 3
			Random = utility.RandomInt(0, 2)
			if Random == 0
				Insomnia.Cast(Player as ObjectReference, none)
			endIf
			Tried += 1
		else
			Insomnia.Cast(Player as ObjectReference, none)
		endIf
		SleepGo = 0
	endIf
	self.ReturnToView()
endFunction

; Skipped compiler generated GotoState

function OnControlUp(String control, Float HoldTime)

	if !utility.IsInMenuMode()
		if control == "Sneak"
			ControlPressed = false
			if SleepGo == 0
				if (MASTER as advsitfast_masterquest).HoldCrouch == true
					self.unRegisterForControl("Sneak")
				else
					self.unRegisterForKey(UserKey)
				endIf
				(MASTER as advsitfast_masterquest).Wake()
			elseIf SleepGo == 50
				self.abort()
			endIf
		endIf
	endIf
endFunction

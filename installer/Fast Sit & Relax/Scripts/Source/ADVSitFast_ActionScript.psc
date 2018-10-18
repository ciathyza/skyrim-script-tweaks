;/ Decompiled by Champollion V1.0.0
Source   : ADVSitFast_ActionScript.psc
Modified : 2014-07-20 21:13:26
Compiled : 2014-07-20 21:35:19
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVSitFast_ActionScript extends ObjectReference

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

furniture          property REFbed                auto
globalvariable     property GLBcustomSitState     auto
globalvariable     property GLBfindBed            auto
globalvariable     property GLBmusic              auto
globalvariable     property GLBSETshakeCamera     auto
globalvariable     property GLBSETshakeController auto
globalvariable     property PlayerIsVampire       auto
imagespacemodifier property IMODfadeOut           auto
imagespacemodifier property IMODpitchBlack        auto
imagespacemodifier property IMODsleepAbort        auto
imagespacemodifier property IMODsleepElixir       auto
imagespacemodifier property IMODsleepStart        auto
magiceffect        property MEInsomnia            auto
magiceffect        property SleepWell             auto
message            property MSGinfoNoAct          auto
musictype          property MUSfail               auto
musictype          property MUSsleep              auto
quest              property SleepQuest            auto
referencealias     property MASTER                auto
sound              property SFXabort              auto
spell              property Insomnia              auto

actor              property Camera                auto hidden
actor              property Player                auto hidden
Bool               property ALIVE                 auto hidden
Bool               property ControlPressed        auto hidden
Bool               property failed                auto hidden
Bool               property HudWasEnabled         auto hidden
Float              property DELAYkickin           auto hidden
Float              property ReturnAngleZ          auto hidden
Float              property ReturnPosX            auto hidden
Float              property ReturnPosY            auto hidden
Float              property ReturnPosZ            auto hidden
Float              property TryingToSleep         auto hidden
Int                property Chance                auto hidden
Int                property Tried                 auto hidden
Int                property UserKey               auto hidden
ObjectReference    property SleepPlenty           auto hidden


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Bool  NightTime
Float TIME
Int   LastResponse
Int   Random
Int   SleepGo


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

function OnMenuOpen(String menuName)
	if menuName == "Sleep/Wait Menu"
		game.FadeOutGame(false, true, 60.0, 1000.0)
		SleepGo = 0
		MASTER.RegisterForSleep()
	endIf
endFunction


function OnMenuClose(String menuName)
	if menuName == "Sleep/Wait Menu"
		if Player.getSleepState() == 0 || Player.getSitState() == 0
			(MASTER as advsitfast_masterquest).TranslationCompleted = false
			Player.moveto(Player as ObjectReference, 0.0, 0.0, 0.0, true)
			utility.wait(0.1)
			Player.setPosition(ReturnPosX, ReturnPosY, Player.getPositionZ())
			self.unRegisterForMenu("Sleep/Wait Menu")
		endIf
	endIf
endFunction


function OnKeyDown(Int keyCode)
	if !utility.IsInMenuMode()
		if keyCode == UserKey && SleepGo != 100
			ControlPressed = true
			utility.wait(0.5)
			self.Listen()
		endIf
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


function OnControlDown(String control)
	if !utility.IsInMenuMode()
		if control == "Sneak" && SleepGo != 100
			ControlPressed = true
			utility.wait(0.5)
			self.Listen()
		elseIf control == "Activate"
			SFXabort.play(Player as ObjectReference)
			IMODsleepAbort.apply(1.0)
		endIf
	endIf
endFunction


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


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

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
	TIME *= 24.0

	if TIME > 5.0 && TIME < 19.0
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


function abort()
	if SleepGo != 100
		if HudWasEnabled == true
			game.SetHudCartMode(false)
			(MASTER as advsitfast_masterquest).TOGGLEhud = 0
		else
			(MASTER as advsitfast_masterquest).TOGGLEhud = 1
		endIf
		DELAYkickin = utility.getCurrentRealTime() + 0.1
		SFXabort.play(Player as ObjectReference)
		MUSsleep.remove()
		IMODsleepAbort.apply(1.0)
		IMODpitchBlack.remove()
		IMODsleepStart.remove()
		if GLBSETshakeCamera.getValue() != 0.0
			game.ShakeCamera(none, 0.5, 0.25)
		endIf
		if GLBSETshakeController.getValue() != 0.0
			game.ShakeController(0.15, 0.15, 0.5)
		endIf
		SleepGo = 0
	endIf
endFunction


function terminate()
	if ALIVE == true
		GLBcustomSitState.setValue(0.0)
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


function Listen()
	while ControlPressed == true && (MASTER as advsitfast_masterquest).AllowProcessing == true
		if SleepGo == 0
			if Player.IsTrespassing() == false
				if Player.hasMagicEffect(MEInsomnia) == 0 as Bool || Player.hasMagicEffect(SleepWell) != 0 as Bool || (MASTER as advsitfast_masterquest).GetFurniture == "Bed"
					if Chance != 333
						IMODsleepStart.apply(1.0)
						if GLBmusic.getValue() != 0.0
							MUSsleep.add()
						endIf
						DELAYkickin = utility.getCurrentRealTime() + 4.5
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
				utility.wait(0.1)
			endWhile
			if (MASTER as advsitfast_masterquest).AllowProcessing == true
				if ControlPressed == true
					if (MASTER as advsitfast_masterquest).HoldCrouch == true
						self.unRegisterForControl("Sneak")
					else
						self.unRegisterForKey(UserKey)
					endIf
					if Chance == 333
						IMODfadeOut.apply(1.0)
						utility.wait(0.4)
					endIf
					SleepGo = 100
					ReturnPosZ = Player.getPositionZ()
					IMODpitchBlack.apply(1.0)
					game.FadeOutGame(false, true, 60.0, 1000.0)
					failed = false
					IMODsleepStart.remove()
					self.EvaluateSleep()
					ControlPressed = false
				endIf
			else
				game.FadeOutGame(false, true, 0.0, 1.0)
				failed = false
				IMODsleepStart.remove()
				ControlPressed = false
			endIf
		endIf
	endWhile
endFunction


function ReturnToView()
	if (MASTER as advsitfast_masterquest).GetFurniture == "Bed"
		Player.translateTo(ReturnPosX + 16.0 * math.sin(Player.getAngleZ()), ReturnPosY + 16.0 * math.cos(Player.getAngleZ()), Player.getPositionZ(), 0.0, 0.0, ReturnAngleZ, 1000.0, 0.0)
		while (MASTER as advsitfast_masterquest).TranslationCompleted != true && (MASTER as advsitfast_masterquest).AllowProcessing == true
			utility.wait(0.1)
		endWhile
	endIf
	utility.wait(0.25)
	if Player.getSleepState() != 3
		while Player.getSitState() != 3 && (MASTER as advsitfast_masterquest).AllowProcessing == true
			Player.moveto(Player as ObjectReference, 0.0, 0.0, 0.0, true)
			utility.wait(0.35)
			debug.sendAnimationEvent(Player as ObjectReference, "IdleLayDownEnterInstant")
			utility.wait(0.35)
		endWhile
	endIf
	Player.setAlpha(1.0, false)
	utility.wait(0.1)
	game.FadeOutGame(false, true, 0.0, 3.0)
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
		if PlayerIsVampire.getValue() == 0.0
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
		GLBcustomSitState.setValue(100.0)
		(MASTER as advsitfast_masterquest).PChasUsedSleepMenu = true
		utility.wait(0.2)
		debug.sendAnimationEvent(Player as ObjectReference, "IdleCartExitInstant")
		utility.wait(0.2)
		while !utility.IsInMenuMode() && SleepGo == 100 && (MASTER as advsitfast_masterquest).AllowProcessing == true
			Player.moveto(Player as ObjectReference, 0.0, 0.0, 0.0, true)
			(MASTER as advsitfast_masterquest).TranslationCompleted = false
			Player.setAlpha(0.0, false)
			SleepPlenty.Activate(Player as ObjectReference, false)
			utility.wait(0.2)
		endWhile
	else
		failed = true
		utility.wait(1.0)
		if GLBmusic.getValue() != 0.0
			MUSsleep.remove()
			MUSfail.add()
		endIf
		if GLBSETshakeCamera.getValue() != 0.0
			game.ShakeCamera(none, 0.5, 0.25)
		endIf
		if GLBSETshakeController.getValue() != 0.0
			game.ShakeController(0.15, 0.15, 0.5)
		endIf
		utility.wait(0.3)
		Random = utility.RandomInt(1, 3)
		while Random == LastResponse
			Random = utility.RandomInt(1, 3)
			utility.wait(0.1)
		endWhile
		if Random == 1
			if LastResponse != 1
				debug.messagebox("You can't find rest.")
				utility.wait(0.1)
				debug.notification("You are crumpy...")
				LastResponse = 1
			endIf
		elseIf Random == 2
			if LastResponse != 2
				debug.messagebox("You can't sleep.")
				utility.wait(0.1)
				debug.notification("You are bored...")
				LastResponse = 2
			endIf
		elseIf Random == 3
			if LastResponse != 3
				debug.messagebox("Alas, nothing happens.")
				utility.wait(0.1)
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

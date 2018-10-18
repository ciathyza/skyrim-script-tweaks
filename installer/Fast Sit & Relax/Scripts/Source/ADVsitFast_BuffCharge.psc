;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_BuffCharge.psc
Modified : 2014-07-21 00:51:59
Compiled : 2014-07-21 00:52:05
User     : Safthanspeter
Computer : HEIKE
/;

scriptName ADVsitFast_BuffCharge extends ActiveMagicEffect

;-- Properties --------------------------------------
Float property DELAYrefreshCameraFX auto hidden
Float property ReturnAVMagickamult auto hidden
Float property ReturnAVMagickarate auto hidden
Float property ReturnAVSTAMINAmult auto hidden
Float property ReturnAVSTAMINArate auto hidden
Float property SoundID01volume auto hidden
Float property SoundID04volume auto hidden
Float property VOLbreath auto hidden
Float property VOLwind auto hidden
Int property IDbreath auto hidden
Int property IDintro auto hidden
Int property IDwind auto hidden
Int property SoundID01 auto hidden
Int property SoundID02 auto hidden
Int property SoundID03 auto hidden
Int property SoundID04 auto hidden
activator property REFpowerUp auto
actor property player auto hidden
globalvariable property GLBallowProcessing auto
globalvariable property GLBmaxSpawn auto
globalvariable property GLBtimerDrain auto
globalvariable property TUTORIALhorse auto
imagespacemodifier property IMODbeat auto
imagespacemodifier property IMODkickIn auto
imagespacemodifier property IMODrunning auto
imagespacemodifier property IMODrunningFade auto
magiceffect property IsMoving auto
message property TUThorse auto
sound property SFXblessing auto
sound property SFXblessingFade auto
sound property SFXcharge auto
sound property SFXheartBeat01 auto
sound property SFXheartBeat02 auto
sound property SFXhorseAttack auto
sound property SFXhorseBreath auto
sound property SFXhorseIdle auto
sound property SFXhorseRearUp auto
sound property SFXhorseShake auto
sound property SFXtutorial auto
sound property SFXwind auto
spell property SELFSPELL auto
visualeffect property CameraFX auto

;-- Variables ---------------------------------------
Bool BLOCKOFF
Bool BLOCKON
Bool INIT
Bool PRESSED
Bool isSET
Float DELAYcount
Float DELAYkickin
Float Drain
Int Beat
Int COUNT

;-- Functions ---------------------------------------

function OnEffectFinish(actor akTarget, actor akCaster)
	if akTarget == game.getPlayer()
		sound.StopInstance(IDbreath)
		self.UnregisterForControl("Forward")
		self.unregisterForUpdate()
		IMODrunningFade.apply(1.00000)
		IMODrunning.remove()
		self.GotoState("NULL")
		if GLBallowProcessing.getValue() != 0 as Float
			debug.notification("The Blessing fades away...")
		endIf
		while VOLwind > 0 as Float
			VOLwind -= 0.0250000
			sound.SetInstanceVolume(IDwind, VOLwind)
		endWhile
		game.enableplayercontrols(true, true, true, true, true, true, true, true, 0)
		if GLBallowProcessing.getValue() != 0 as Float
			SFXblessingFade.play(player as objectreference)
		endIf
		self.UnregisterForControl("Forward")
		SFXhorseShake.play(player as objectreference)
		GLBallowProcessing.setValue(0 as Float)
		sound.StopInstance(SoundID01)
		sound.StopInstance(IDwind)
		player.ModActorValue("InventoryWeight", -1 as Float)
		if Beat == 1
			while SoundID04volume > 0 as Float
				SoundID04volume -= 0.0100000
				sound.SetInstanceVolume(SoundID04, SoundID04volume)
			endWhile
			while SoundID01volume > 0 as Float
				if SoundID01volume > 0.500000
					IMODbeat.apply(0.500000)
					game.ShakeCamera(none, 0.250000, 0.500000)
				elseIf SoundID01volume < 0.500000 && SoundID01volume > 0.250000
					IMODbeat.apply(0.250000)
					game.ShakeCamera(none, 0.150000, 0.500000)
				endIf
				SoundID01volume -= 0.100000
				sound.SetInstanceVolume(SoundID02, SoundID01volume)
				utility.wait(0.850000)
			endWhile
			sound.StopInstance(SoundID02)
		elseIf Beat == 2
			while SoundID04volume > 0 as Float
				SoundID04volume -= 0.250000
				sound.SetInstanceVolume(SoundID04, SoundID04volume)
			endWhile
			while SoundID01volume > 0.500000
				if SoundID01volume > 0.500000
					game.ShakeCamera(none, 0.500000, 0.500000)
					IMODbeat.apply(1 as Float)
				elseIf SoundID01volume < 0.500000 && SoundID01volume > 0.250000
					game.ShakeCamera(none, 0.400000, 0.500000)
					IMODbeat.apply(0.750000)
				elseIf SoundID01volume < 0.250000
					IMODbeat.apply(0.600000)
					game.ShakeCamera(none, 0.300000, 0.500000)
				endIf
				SoundID01volume -= 0.0500000
				utility.wait(0.500000)
			endWhile
			sound.StopInstance(SoundID03)
			SoundID01volume = 1 as Float
			SoundID02 = SFXheartBeat01.play(player as objectreference)
			sound.SetInstanceVolume(SoundID02, SoundID01volume)
			while SoundID01volume > 0 as Float
				if SoundID01volume > 0.500000
					IMODbeat.apply(0.500000)
					game.ShakeCamera(none, 0.250000, 0.500000)
				elseIf SoundID01volume < 0.500000 && SoundID01volume > 0.250000
					IMODbeat.apply(0.250000)
					game.ShakeCamera(none, 0.150000, 0.500000)
				endIf
				SoundID01volume -= 0.100000
				sound.SetInstanceVolume(SoundID02, SoundID01volume)
				utility.wait(0.850000)
			endWhile
		endIf
		sound.StopInstance(SoundID04)
		if GLBallowProcessing.getValue() != 0 as Float
			player.forceActorValue("StaminaRate", ReturnAVSTAMINArate)
			player.forceActorValue("StaminaRateMult", ReturnAVSTAMINAmult)
			player.forceActorValue("MagickaRate", ReturnAVMagickarate)
			player.forceActorValue("MagickaRateMult", ReturnAVMagickamult)
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function OnControlDown(String control)

	if !utility.IsInMenuMode()
		PRESSED = true
		if control == "Forward" && self.GetState() != "START" && self.GetState() == "LISTEN"
			self.GotoState("START")
		endIf
	endIf
endFunction

function OnPlayerLoadGame()

	; Empty function
endFunction

; Skipped compiler generated GotoState

function OnControlUp(String control, Float HoldTime)

	PRESSED = false
	if control == "Forward" && self.GetState() != "END" && self.GetState() != "LISTEN"
		self.GotoState("END")
	endIf
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	if akTarget == game.getPlayer()
		player = game.getPlayer()
		game.FadeOutGame(false, true, 0 as Float, 2 as Float)
		IDintro = SFXcharge.play(player as objectreference)
		self.RegisterForControl("Forward")
		utility.wait(3 as Float)
		while player.getSitState() != 0 && GLBallowProcessing.getValue() != 0 as Float
			utility.wait(0.250000)
		endWhile
		if GLBallowProcessing.getValue() != 0 as Float
			ReturnAVSTAMINArate = player.getActorValue("StaminaRate")
			ReturnAVSTAMINAmult = player.getActorValue("StaminaRateMult")
			player.forceActorValue("StaminaRate", 0 as Float)
			player.forceActorValue("StaminaRateMult", 0 as Float)
			ReturnAVMagickarate = player.getActorValue("MagickaRate")
			ReturnAVMagickamult = player.getActorValue("MagickaRateMult")
			player.forceActorValue("MagickaRate", 0 as Float)
			player.forceActorValue("MagickaRateMult", 0 as Float)
			debug.notification("Blessing of the Steed received!")
			SFXblessing.play(player as objectreference)
			game.ShakeCamera(none, 0.500000, 1 as Float)
			VOLbreath = 1 as Float
			IDbreath = SFXhorseBreath.play(player as objectreference)
			sound.SetInstanceVolume(IDbreath, IDbreath as Float)
			VOLwind = 0 as Float
			IDwind = SFXwind.play(player as objectreference)
			sound.SetInstanceVolume(IDwind, VOLwind)
			self.GotoState("LISTEN")
		else
			sound.StopInstance(IDintro)
			player.dispelSpell(SELFSPELL)
		endIf
	endIf
endFunction

;-- State -------------------------------------------
state END

	function onBeginState()

		if utility.getCurrentRealTime() > DELAYcount
			if COUNT != 0
				COUNT -= 1
			endIf
		endIf
		SFXhorseIdle.play(player as objectreference)
		IMODrunningFade.apply(1.00000)
		IMODrunning.remove()
		player.setAV("variable05", 0 as Float)
		VOLbreath = 1 as Float
		sound.SetInstanceVolume(IDbreath, VOLbreath)
		while VOLwind > 0 as Float
			VOLwind -= 0.0250000
			sound.SetInstanceVolume(IDwind, VOLwind)
		endWhile
		self.GotoState("LISTEN")
	endFunction
endState

;-- State -------------------------------------------
state LISTEN

	function onUPDATE()

		; Empty function
	endFunction

	function onEndState()

		; Empty function
	endFunction

	function onBeginState()

		if INIT == true
			if PRESSED == true
				self.GotoState("START")
			else
				DELAYkickin = utility.getCurrentRealTime() + 5 as Float
				if TUTORIALhorse.getValue() == 0 as Float
					SFXtutorial.play(game.getPlayer() as objectreference)
					message.ResetHelpMessage("shout")
					TUThorse.ShowAsHelpMessage("shout", 7 as Float, 7 as Float, 1)
					TUTORIALhorse.setValue(1 as Float)
				endIf
				while PRESSED == false && utility.getCurrentRealTime() < DELAYkickin && player.isSneaking() == false
					player.setAV("variable05", 0 as Float)
					if Beat == 0
						
					elseIf Beat == 1
						IMODbeat.apply(0.500000)
						game.ShakeCamera(none, 0.500000, 0.500000)
						utility.wait(0.850000)
					elseIf Beat == 2
						IMODbeat.apply(0.850000)
						game.ShakeCamera(none, 1 as Float, 0.500000)
						utility.wait(0.500000)
					endIf
				endWhile
				if PRESSED == false || player.isSneaking() == true
					player.dispelSpell(SELFSPELL)
				endIf
			endIf
		endIf
	endFunction
endState

;-- State -------------------------------------------
state START

	function onUPDATE()

		if utility.getCurrentRealTime() > DELAYcount
			if COUNT != 0
				COUNT -= 1
			endIf
		endIf
		if player.getAv("Stamina") != 0 as Float
			if player.getAvPercentage("Stamina") > 0.200000
				if utility.getCurrentRealTime() > GLBtimerDrain.getValue()
					Drain = player.getAv("Stamina") / 100.000 * 10 as Float
					player.damageAv("Stamina", Drain)
				endIf
				if Beat != 0
					sound.StopInstance(SoundID02)
					player.ModActorValue("InventoryWeight", 1 as Float)
					player.ModActorValue("InventoryWeight", -1 as Float)
					Beat = 0
				endIf
			else
				if Beat == 0
					SoundID01volume = 1 as Float
					SoundID02 = SFXheartBeat01.play(player as objectreference)
					sound.SetInstanceVolume(SoundID02, SoundID01volume)
					player.ModActorValue("InventoryWeight", 1 as Float)
					player.ModActorValue("InventoryWeight", -1 as Float)
					Beat = 1
				endIf
				if utility.getCurrentRealTime() > GLBtimerDrain.getValue()
					player.damageAv("Stamina", 100 as Float)
				endIf
			endIf
		elseIf player.getAv("Magicka") != 0 as Float
			if player.getAvPercentage("Magicka") > 0.100000
				if player.getAvPercentage("Magicka") < 0.400000
					if Beat == 1
						sound.StopInstance(SoundID02)
						SoundID01volume = 1 as Float
						SoundID03 = SFXheartBeat02.play(player as objectreference)
						sound.SetInstanceVolume(SoundID03, SoundID01volume)
						player.ModActorValue("InventoryWeight", 1 as Float)
						player.ModActorValue("InventoryWeight", -1 as Float)
						Beat = 2
					endIf
				endIf
				if utility.getCurrentRealTime() > GLBtimerDrain.getValue()
					Drain = player.getAv("Magicka") / 100.000 * 10 as Float
					player.damageAv("Magicka", Drain)
				endIf
			else
				if utility.getCurrentRealTime() > GLBtimerDrain.getValue()
					player.damageAv("Magicka", 1000 as Float)
				endIf
				player.dispelSpell(SELFSPELL)
			endIf
		endIf
		if Beat == 1
			IMODbeat.apply(0.500000)
			game.ShakeCamera(none, 0.500000, 0.850000)
		elseIf Beat == 2
			IMODbeat.apply(0.850000)
			game.ShakeCamera(none, 1 as Float, 0.500000)
		endIf
		if player.getAvPercentage("Stamina") > 0.200000
			self.registerForSingleUpdate(1.50000)
		elseIf player.getAvPercentage("Magicka") > 0.400000
			self.registerForSingleUpdate(0.850000)
		else
			self.registerForSingleUpdate(0.500000)
		endIf
	endFunction

	function onEndState()

		self.unregisterForUpdate()
	endFunction

	function onBeginState()

		if INIT == false
			player.ModActorValue("InventoryWeight", -1 as Float)
			INIT = true
		endIf
		if player.isSneaking() == true
			game.DisablePlayerControls(0 as Bool, 1 as Bool, 0 as Bool, 0 as Bool, 1 as Bool, 0 as Bool, 0 as Bool, 0 as Bool, 0)
			game.enableplayercontrols(true, true, true, true, true, true, true, true, 0)
		endIf
		if COUNT != 4
			IMODkickIn.apply(1.00000)
			IMODrunning.apply(1.00000)
			SFXhorseRearUp.play(player as objectreference)
			VOLbreath = 0 as Float
			sound.SetInstanceVolume(IDbreath, VOLbreath)
			VOLwind = 1 as Float
			sound.SetInstanceVolume(IDwind, VOLwind)
			self.registerForSingleUpdate(0 as Float)
			COUNT += 1
			DELAYcount = utility.getCurrentRealTime() + 0.500000
		else
			COUNT = 0
			SFXhorseAttack.play(player as objectreference)
			debug.messagebox("Alas! Don't make me angry...")
			player.pushactoraway(player, 3 as Float)
			player.damageAv("Health", 25 as Float)
		endIf
	endFunction
endState

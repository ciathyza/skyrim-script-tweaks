;/ Decompiled by Champollion V1.0.0
Source   : ADVSitFast_Camera.psc
Modified : 2014-07-20 21:07:21
Compiled : 2014-07-20 21:35:03
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVSitFast_Camera extends ReferenceAlias

;-- Properties --------------------------------------
String property IsType auto hidden
imagespacemodifier property IMODdynamicDOFcharge auto
actor property player auto hidden
actorbase property SpawnCamera auto
ReferenceAlias property Master auto
Bool property Reroll auto hidden
Float property GoalZ auto hidden
actor property Checker01 auto hidden
Float property GoalX auto hidden
actor property Checker06 auto hidden
Float property Speed auto hidden
actor property Checker02 auto hidden
Float property SpawnPosZ auto hidden
actor property Checker05 auto hidden
Int property GETcameraFrequency = 0 auto hidden
imagespacemodifier property IMODdynamicDOFInterio auto
Bool property ListenTranslation auto hidden
Bool property LockOn auto hidden
actor property Checker04 auto hidden
actor property Checker03 auto hidden
effectshader property PMSGREEN auto
imagespacemodifier property IMODdynamicDOF auto
Int property TUTORIALcamera auto hidden
Int property RandomRoll auto hidden
imagespacemodifier property IMODcamFadeFull auto
String property IsFurniture auto hidden
Bool property MustUseCamera auto hidden
Bool property Cinematic auto hidden
Bool property UseSwooosh auto hidden
quest property MasterGeneric auto
imagespacemodifier property IMODsitready auto
Float property valueDOFstrength auto hidden
quest property MasterQuest auto
imagespacemodifier property IMODblur auto
imagespacemodifier property IMODcamFadeQuick auto
actor property Camera auto hidden
ReferenceAlias property AliasCamera auto
sound property SFXcameraIN auto
Bool property Ready auto hidden
globalvariable property CameraAction auto
Float property GoalY auto hidden

;-- Variables ---------------------------------------
Float LastPostX
Float LastPostY
Bool initial
Float LastPostZ
Float spawnY
Float spawnX
Bool Aborted
Int Complete
Int Distance
Float COOLDOWN
Int SFXvolume

;-- Functions ---------------------------------------

function CancelTranslation()

	game.ShakeCamera(none, 0.500000, 0.250000)
	Camera.StopTranslation()
	ListenTranslation = false
endFunction

function Intitialize()

	player = game.getPlayer()
endFunction

function Finish()

	self.GotoState("NULL")
	self.unregIsterForControl("Right Attack/Block")
	self.unregIsterForControl("Left Attack/Block")
	if Camera.isDisabled() == true
		Camera.enable(0 as Bool)
		utility.wait(0.250000)
	endIf
	if Cinematic == true
		CameraAction.setValue(-100 as Float)
		if (Master as advsitfast_masterquest).FreeStyle == false
			if IsType == "Lean" || IsType == "Rail"
				Camera.translateTo(player.getPositionX(), player.getPositionY(), player.getPositionZ(), 0 as Float, 0 as Float, Camera.getHeadingAngle(player as objectreference) + Camera.getAngleZ(), 30 as Float, 20 as Float)
			elseIf IsType == "Sit" || IsType == "Ledge" || IsType == "relax"
				if IsFurniture != "Bed"
					Camera.translateTo(player.getPositionX() + 64 as Float * math.sin(player.getAngleZ()), player.getPositionY() + 64 as Float * math.cos(player.getAngleZ()), player.getPositionZ() + 64 as Float, 0 as Float, 0 as Float, Camera.getAngleZ(), 30 as Float, 10 as Float)
				else
					Camera.translateTo(player.getPositionX() + 64 as Float * math.sin(player.getAngleZ()), player.getPositionY() + 64 as Float * math.cos(player.getAngleZ()), player.getPositionZ() + 64 as Float, 0 as Float, 0 as Float, Camera.getAngleZ(), 5 as Float, 0.000000)
				endIf
			elseIf IsType == "Rail"
				Camera.translateTo(player.getPositionX() - 64 as Float * math.sin(player.getAngleZ()), player.getPositionY() - 64 as Float * math.cos(player.getAngleZ()), player.getPositionZ() + 64 as Float, 0 as Float, 0 as Float, Camera.getAngleZ(), 30 as Float, 10 as Float)
			endIf
			if IsType != "relax"
				utility.wait(1 as Float)
			elseIf player.getSleepState() == 0
				utility.wait(2.50000)
			else
				while player.getSleepState() != 0 && (Master as advsitfast_masterquest).AllowProcessing == true
					utility.wait(0.100000)
				endWhile
			endIf
		endIf
		if UseSwooosh == true
			SFXvolume = SFXcameraIN.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, utility.randomFloat(0.150000, 0.250000))
		endIf
		if player.IsInInterior() == true
			IMODdynamicDOFInterio.remove()
		else
			IMODdynamicDOF.remove()
		endIf
		Camera.StopTranslation()
		game.FadeOutGame(false, true, 60 as Float, 0.100000)
		game.setCameraTarget(player)
		Checker01.delete()
		Checker01 = none
		Checker02.delete()
		Checker02 = none
		Checker03.delete()
		Checker03 = none
		Checker04.delete()
		Checker04 = none
		Checker05.delete()
		Checker05 = none
		Checker06.delete()
		Checker06 = none
		if (Master as advsitfast_masterquest).FreeStyle == true
			game.FadeOutGame(false, true, 0 as Float, 1 as Float)
		endIf
	else
		if player.IsInInterior() == true
			IMODdynamicDOFInterio.remove()
		else
			IMODdynamicDOF.remove()
		endIf
		if IsType == "Lean"
			game.FadeOutGame(false, true, 1 as Float, 1 as Float)
		endIf
		CameraAction.setValue(0 as Float)
		Camera.StopTranslation()
		game.setCameraTarget(player)
		utility.wait(0.200000)
		Camera.delete()
	endIf
endFunction

function SilentTranslation()

	ListenTranslation = false
	if IsType == "Lean" || IsType == "Rail"
		Camera.translateTo(player.getPositionX() - 64 as Float * math.sin(player.getAngleZ()), player.getPositionY() - 64 as Float * math.cos(player.getAngleZ()), player.getPositionZ(), 0 as Float, 0 as Float, Camera.getAngleZ(), 1000 as Float, 0.000000)
	else
		Camera.translateTo(player.getPositionX(), player.getPositionY(), player.getPositionZ(), 0 as Float, 0 as Float, Camera.getAngleZ(), 1000 as Float, 0.000000)
	endIf
endFunction

function OnControlDown(String control)

	if !utility.IsInMenuMode() && (Master as advsitfast_masterquest).Crafting == false
		if control == "Right Attack/Block" || control == "Left Attack/Block"
			if (Master as advsitfast_masterquest).WakingUp == false && player.getSleepState() != 0 || player.getSitState() != 0
				if TUTORIALcamera == 50
					TUTORIALcamera = 100
				endIf
				if self.GetState() != "Validating"
					Aborted = false
					Ready = false
					if ListenTranslation == true
						self.CancelTranslation()
						IMODsitready.apply(0.500000)
					elseIf utility.getCurrentRealTime() > COOLDOWN
						COOLDOWN = utility.getCurrentRealTime() + 1 as Float
						UseSwooosh = (Master as advsitfast_masterquest).SETcCamSFX
						if UseSwooosh == true
							SFXvolume = SFXcameraIN.play(player as objectreference)
							sound.SetInstanceVolume(SFXvolume, 0.500000)
						endIf
						if Cinematic == false
							CameraAction.setValue(50 as Float)
							Cinematic = true
						endIf
						self.CinematicAction()
					endIf
				elseIf utility.getCurrentRealTime() > COOLDOWN
					COOLDOWN = utility.getCurrentRealTime() + 1 as Float
					if valueDOFstrength != 0 as Float
						if player.IsInInterior() == true
							IMODdynamicDOFInterio.apply(1 as Float)
						else
							IMODdynamicDOF.apply(1 as Float)
						endIf
					endIf
					Aborted = true
					IMODblur.apply(1.00000)
					Ready = true
					game.setCameraTarget(player)
					game.FadeOutGame(false, true, 0 as Float, 1 as Float)
				endIf
			elseIf (Master as advsitfast_masterquest).WakingUp == true || player.getSleepState() != 0 && player.getSitState() != 0
				self.unregIsterForControl("Right Attack/Block")
				self.unregIsterForControl("Left Attack/Block")
			endIf
		endIf
	endIf
endFunction

function Validate(String GetType, String GetFurniture)

	player = game.getPlayer()
	COOLDOWN = 0 as Float
	Ready = false
	Aborted = false
	MustUseCamera = false
	Cinematic = false
	initial = false
	IsType = GetType
	IsFurniture = GetFurniture
	UseSwooosh = (Master as advsitfast_masterquest).SETcCamSFX
	GETcameraFrequency = (Master as advsitfast_masterquest).SETcameraFrequency
	valueDOFstrength = (Master as advsitfast_masterquest).valueDOFstrength
	if IsType != "Charge" && IsType != "Alas"
		self.regIsterForControl("Right Attack/Block")
		self.regIsterForControl("Left Attack/Block")
	endIf
	ListenTranslation = false
	RandomRoll = -1
	if (Master as advsitfast_masterquest).FreeStyle == false
		if GetType == "Lean" || GetType == "Rail" || GetFurniture != "Ground"
			MustUseCamera = true
		else
			MustUseCamera = false
		endIf
		if GETcameraFrequency == 0
			Cinematic = false
		elseIf GETcameraFrequency == 2
			Cinematic = true
		else
			Int RANDOM = utility.RandomInt(0, 1)
			if RANDOM == 1
				Cinematic = true
			else
				Cinematic = false
			endIf
		endIf
	endIf
	if Cinematic == false && MustUseCamera == true
		Camera.moveTo(player as objectreference, 0 as Float, 0 as Float, 0 as Float, true)
		CameraAction.setValue(25 as Float)
		if GetType == "Lean"
			initial = true
		endIf
	elseIf Cinematic == true
		Camera.moveTo(player as objectreference, 0 as Float, 0 as Float, 0 as Float, true)
		CameraAction.setValue(50 as Float)
	endIf
endFunction

; Skipped compiler generated GetState

function SilentAction()

	if player.isInCombat() == false
		game.FadeOutGame(false, true, 0.850000, 1.50000)
		Camera = player.placeAtme(SpawnCamera as form, 1, false, true) as actor
		Camera.enableAI(false)
		while Camera.isDisabled() && (Master as advsitfast_masterquest).AllowProcessing == true
			Camera.enable(0 as Bool)
			utility.wait(0.100000)
		endWhile
		if (Master as advsitfast_masterquest).AllowProcessing == true
			self.SilentTranslation()
			Camera.setAngle(0 as Float, 0 as Float, player.getAngleZ())
			game.setCameraTarget(Camera)
			Ready = true
		endIf
	endIf
endFunction

function ChargeTranslation()

	Camera.translateTo(player.getPositionX() + 64 as Float * math.sin(player.getAngleZ()), player.getPositionY() + 64 as Float * math.cos(player.getAngleZ()), player.getPositionZ(), 0 as Float, 0 as Float, player.getAngleZ() - 180 as Float, 500 as Float, 0.000000)
endFunction

function CinematicAction()

	PMSGREEN.stop(Camera as objectreference)
	game.FadeOutGame(false, true, 60 as Float, 0.100000)
	game.setCameraTarget(player)
	if Checker01 == none
		Checker01 = player.placeAtme(SpawnCamera as form, 1, false, true) as actor
	else
		Checker01.disable(0 as Bool)
	endIf
	if Checker02 == none
		Checker02 = player.placeAtme(SpawnCamera as form, 1, false, true) as actor
	else
		Checker02.disable(0 as Bool)
	endIf
	if Checker03 == none
		Checker03 = player.placeAtme(SpawnCamera as form, 1, false, true) as actor
	else
		Checker03.disable(0 as Bool)
	endIf
	if Checker04 == none
		Checker04 = player.placeAtme(SpawnCamera as form, 1, false, true) as actor
	else
		Checker04.disable(0 as Bool)
	endIf
	if Checker05 == none
		Checker05 = player.placeAtme(SpawnCamera as form, 1, false, true) as actor
	else
		Checker05.disable(0 as Bool)
	endIf
	if Checker06 == none
		Checker06 = player.placeAtme(SpawnCamera as form, 1, false, true) as actor
	else
		Checker06.disable(0 as Bool)
	endIf
	if player.IsInInterior() == true
		Distance = 256
	else
		Int Far = utility.RandomInt(0, 1)
		if Far == 1
			Distance = 512
		else
			Distance = 256
		endIf
	endIf
	self.ValidateSpawn()
endFunction

function ValidateSpawn()

	self.GotoState("Validating")
	Checker01.moveTo(player as objectreference, utility.RandomInt(-Distance, Distance) as Float, utility.RandomInt(-Distance, Distance) as Float, 0.000000, true)
	Checker02.moveTo(player as objectreference, utility.RandomInt(-Distance, Distance) as Float, utility.RandomInt(-Distance, Distance) as Float, 0.000000, true)
	Checker03.moveTo(player as objectreference, utility.RandomInt(-Distance, Distance) as Float, utility.RandomInt(-Distance, Distance) as Float, 0.000000, true)
	Checker04.moveTo(player as objectreference, utility.RandomInt(-Distance, Distance) as Float, utility.RandomInt(-Distance, Distance) as Float, 0.000000, true)
	Checker05.moveTo(player as objectreference, utility.RandomInt(-Distance, Distance) as Float, utility.RandomInt(-Distance, Distance) as Float, 0.000000, true)
	Checker06.moveTo(player as objectreference, utility.RandomInt(-Distance, Distance) as Float, utility.RandomInt(-Distance, Distance) as Float, 0.000000, true)
	Checker01.enable(0 as Bool)
	Checker02.enable(0 as Bool)
	Checker03.enable(0 as Bool)
	Checker04.enable(0 as Bool)
	Checker05.enable(0 as Bool)
	Checker06.enable(0 as Bool)
	utility.wait(0.100000)
	Checker01.setAngle(0 as Float, 0 as Float, Checker01.getHeadingAngle(player as objectreference) + Checker01.getAngleZ())
	Checker02.setAngle(0 as Float, 0 as Float, Checker02.getHeadingAngle(player as objectreference) + Checker02.getAngleZ())
	Checker03.setAngle(0 as Float, 0 as Float, Checker03.getHeadingAngle(player as objectreference) + Checker03.getAngleZ())
	Checker04.setAngle(0 as Float, 0 as Float, Checker04.getHeadingAngle(player as objectreference) + Checker04.getAngleZ())
	Checker05.setAngle(0 as Float, 0 as Float, Checker05.getHeadingAngle(player as objectreference) + Checker05.getAngleZ())
	Checker06.setAngle(0 as Float, 0 as Float, Checker06.getHeadingAngle(player as objectreference) + Checker06.getAngleZ())
	if Camera != none
		Camera.disable(0 as Bool)
	endIf
	if Checker01.hasLos(player as objectreference) == true
		Camera = Checker01
		self.GoCam()
	elseIf Checker02.hasLos(player as objectreference) == true
		Camera = Checker02
		self.GoCam()
	elseIf Checker03.hasLos(player as objectreference) == true
		Camera = Checker03
		self.GoCam()
	elseIf Checker04.hasLos(player as objectreference) == true
		Camera = Checker04
		self.GoCam()
	elseIf Checker05.hasLos(player as objectreference) == true
		Camera = Checker05
		self.GoCam()
	elseIf Checker06.hasLos(player as objectreference) == true
		Camera = Checker06
		self.GoCam()
	else
		self.ValidateSpawn()
	endIf
endFunction

function OnTranslationAlmostComplete()

	if ListenTranslation == true
		Speed /= 2 as Float
		Camera.translateTo(GoalX, GoalY, player.getPositionZ(), 0 as Float, 0 as Float, Camera.getAngleZ(), Speed, 0.000000)
		if IsFurniture == "Ground"
			Camera.disable(0 as Bool)
		endIf
		ListenTranslation = false
	endIf
endFunction

function OnTranslationComplete()

	LastPostX = Camera.getPositionX()
	LastPostY = Camera.getPositionY()
	LastPostZ = Camera.getPositionZ()
	if TUTORIALcamera != 100
		if (Master as advsitfast_masterquest).TUTORIALtoggleHud == true
			utility.wait(1 as Float)
			(MasterGeneric as advsitfast_generic).ShowHelp("Camera")
			TUTORIALcamera = 50
		endIf
	endIf
endFunction

; Skipped compiler generated GotoState

function GoCam()

	if Checker01 != Camera
		Checker01.disable(0 as Bool)
	endIf
	if Checker02 != Camera
		Checker02.disable(0 as Bool)
	endIf
	if Checker03 != Camera
		Checker03.disable(0 as Bool)
	endIf
	if Checker04 != Camera
		Checker04.disable(0 as Bool)
	endIf
	if Checker05 != Camera
		Checker05.disable(0 as Bool)
	endIf
	if Checker06 != Camera
		Checker06.disable(0 as Bool)
	endIf
	AliasCamera.forceRefTo(Camera as objectreference)
	if Aborted == false
		utility.SetINIFloat("fOverShoulderPosx:Camera", 0 as Float)
		if IsType == "relax" && IsFurniture == "Ground"
			utility.SetINIFloat("fOverShoulderPosz:Camera", -96 as Float)
		endIf
		utility.wait(0.100000)
		game.UpdateThirdPerson()
		Int LooseAngle = utility.RandomInt(0, 3)
		if LooseAngle != 0
			Camera.setAngle(Camera.getAngleX(), Camera.getAngleY(), Camera.getAngleZ() + utility.RandomInt(-80, 80) as Float)
			if IsFurniture == "Ground" && IsType != "Lean"
				Float SetDistance = utility.randomFloat(32.0000, 100.000)
				if IsType != "Rail"
					GoalX = player.getPositionX() + SetDistance * math.sin(player.getAngleZ())
					GoalY = player.getPositionY() + SetDistance * math.cos(player.getAngleZ())
				else
					GoalX = player.getPositionX()
					GoalY = player.getPositionY()
				endIf
			elseIf IsFurniture != "Ground" || IsType == "Lean"
				Float setdistance = utility.randomFloat(32.0000, 100.000)
				if IsType != "Lean" || initial == true
					GoalX = player.getPositionX() + setdistance * math.sin(player.getAngleZ())
					GoalY = player.getPositionY() + setdistance * math.cos(player.getAngleZ())
				elseIf IsType == "Lean" || initial == false
					GoalX = player.getPositionX() - setdistance * math.sin(player.getAngleZ())
					GoalY = player.getPositionY() - setdistance * math.cos(player.getAngleZ())
					initial = true
				endIf
			endIf
		elseIf IsFurniture == "Ground" && IsType != "Lean"
			if IsType != "Rail"
				Complete = utility.RandomInt(0, 1)
			else
				Complete = 1
			endIf
			if Complete == 1
				GoalX = player.getPositionX()
				GoalY = player.getPositionY()
			else
				GoalX = player.getPositionX() + utility.randomFloat(-64.0000, 64.0000)
				GoalY = player.getPositionY() + utility.randomFloat(-64.0000, 64.0000)
			endIf
		elseIf IsFurniture != "Ground" || IsType == "Lean"
			Float setdistance = utility.randomFloat(32.0000, 100.000)
			if IsType != "Lean" || initial == true
				GoalX = player.getPositionX() + setdistance * math.sin(player.getAngleZ())
				GoalY = player.getPositionY() + setdistance * math.cos(player.getAngleZ())
			elseIf IsType == "Lean" || initial == false
				GoalX = player.getPositionX() - setdistance * math.sin(player.getAngleZ())
				GoalY = player.getPositionY() - setdistance * math.cos(player.getAngleZ())
				initial = true
			endIf
		endIf
		if Camera.getDistance(player as objectreference) < 400 as Float
			Speed = utility.RandomInt(6, 10) as Float
		else
			Speed = utility.RandomInt(15, 20) as Float
		endIf
		if IsFurniture == "Ground"
			if IsType != "relax"
				
			endIf
		else
			GoalZ = SpawnPosZ
		endIf
		game.forceThirdPerson()
		game.setCameraTarget(Camera)
		if valueDOFstrength != 0 as Float
			if player.IsInInterior() == true
				IMODdynamicDOFInterio.apply(1 as Float)
			else
				IMODdynamicDOF.apply(1 as Float)
			endIf
		endIf
		IMODblur.apply(1.00000)
		game.FadeOutGame(false, true, 0 as Float, 1 as Float)
		ListenTranslation = true
		Camera.translateTo(GoalX, GoalY, player.getPositionZ(), 0 as Float, 0 as Float, Camera.getHeadingAngle(player as objectreference) + Camera.getAngleZ(), Speed, 10 as Float)
		Camera.enableAI(false)
		if IsFurniture == "Ground"
			
		else
			utility.SetINIFloat("fOverShoulderPosz:Camera", (Master as advsitfast_masterquest).cameraHeight as Float)
			utility.wait(0.100000)
			game.UpdateThirdPerson()
		endIf
		Ready = true
	endIf
	self.GotoState("NULL")
endFunction

function ChargeCam()

	player = game.getPlayer()
	IMODdynamicDOFcharge.apply(1.00000)
	Camera = player.placeAtme(SpawnCamera as form, 1, false, true) as actor
	while Camera.getPositionX() != player.getPositionX() + 64 as Float * math.sin(player.getAngleZ()) && (Master as advsitfast_masterquest).AllowProcessing == true
		Camera.setAngle(0 as Float, 0 as Float, player.getAngleZ() - 180 as Float)
		Camera.SetPosition(player.getPositionX() + 64 as Float * math.sin(player.getAngleZ()), player.getPositionY() + 64 as Float * math.cos(player.getAngleZ()), player.getPositionZ())
	endWhile
	if (Master as advsitfast_masterquest).AllowProcessing == true
		Camera.setAngle(0 as Float, 0 as Float, player.getAngleZ() - 180 as Float)
		game.setCameraTarget(Camera)
	endIf
endFunction

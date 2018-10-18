;/ Decompiled by Champollion V1.0.0
Source   : ADVSitFast_skyUI.psc
Modified : 2014-07-18 19:04:03
Compiled : 2014-07-20 00:21:22
User     : Safthanspeter
Computer : HEIKE
/;

scriptName ADVSitFast_skyUI extends SKI_ConfigBase

;-- Properties --------------------------------------

globalvariable property GLBSETallowVoice auto
globalvariable property GLBSETshakeCamera auto
globalvariable property GLBSETshakeController auto
globalvariable property GLBallowRelax auto
globalvariable property GLBautoChill auto
globalvariable property GLBbuffFollower auto
globalvariable property GLBbuffNotification auto
globalvariable property GLBbuffReady auto
globalvariable property GLBhealthRegen auto
globalvariable property GLBmagickaRegen auto
globalvariable property GLBmusic auto
globalvariable property GLBregenFollower auto
globalvariable property GLBregenMult auto
globalvariable property GLBregenVisuals auto
globalvariable property GLBregisteredFollowers auto
globalvariable property GLBsilentBuff auto
globalvariable property GLBspeechFollower auto
globalvariable property GLBstaminaRegen auto
quest property MASTERQuest auto
referencealias property MASTER auto

String property DisplayCam hidden
	String function get()

		if (MASTER as advsitfast_masterquest).SETcameraFrequency == 0
			return "Never"
		elseIf (MASTER as advsitfast_masterquest).SETcameraFrequency == 1
			return "Random"
		elseIf (MASTER as advsitfast_masterquest).SETcameraFrequency == 2
			return "Always"
		endIf
	endFunction
endproperty

String property DisplayRegenMult hidden
	String function get()

		if GLBregenMult.getValue() == 1.50000
			return "+1.5"
		elseIf GLBregenMult.getValue() == 2.50000
			return "+2.5"
		elseIf GLBregenMult.getValue() == 3.50000
			return "+3.5"
		endIf
	endFunction
endproperty

String property DisplayCurrent hidden
	String function get()

		if (MASTER as advsitfast_masterquest).HoldCrouch
			return "Hold crouch:"
		else
			return "Custom key:"
		endIf
	endFunction
endproperty


;-- Variables ---------------------------------------

Bool UseBuff = true
Bool UseBuffReady = false
Bool UseCameraNot = true
Bool UseClick = false
Bool UseControllerShake = false
Bool UseDof = true
Bool UseFollowerRelax = true
Bool UseFollowerVoice = true
Bool UseFurniture = false
Bool UseKey = false
Bool UseMeditate = true
Bool UseMore = false
Bool UseMusic = false
Bool UseRegenFollower = true
Bool UseRegenHealth = false
Bool UseRegenMagicka = false
Bool UseRegenStamina = false
Bool UseRegenVisuals = true
Bool UseShakeCamera = false
Bool UseSilentBuff = true
Bool UseVoice = true
Bool UseautoChill = true
Bool UsebuffFollower = true
Bool Usebuffnotice = true
Bool UsecamSFX = false
Bool UsepuffOffSmoke = true

Float DelayKickinCrouchLay = 1.00000
Float ValueDOFstrength = 1.00000
Float delayKickin = 2.00000
Float delayKickinKeyx = 0.500000

Int CTRL_key = 35
Int CameraHeight = -64
Int CameraX = 0
Int FreeSlots = 6
Int INDEXmethod = 0
Int Liked

Int OPTFollowerRelax
Int OPTRegenVisuals
Int OPTapplyBuff
Int OPTautoChill
Int OPTbuffFollower
Int OPTbuffReady
Int OPTbuffnotice
Int OPTcam
Int OPTcamSFX
Int OPTcamera
Int OPTcameraHeight
Int OPTcameraRestore
Int OPTcameraX
Int OPTclick
Int OPTdefineSitMethod
Int OPTdelayKickin
Int OPTdelayKickinCrouchLay
Int OPTdelayKickinKey
Int OPTdof
Int OPTfurniture
Int OPTkey
Int OPTmanual
Int OPTmeditate
Int OPTmore
Int OPTmusic
Int OPTpuffOffSmoke
Int OPTregenFollower
Int OPTregenHealth
Int OPTregenMagicka
Int OPTregenMult
Int OPTregenStamina
Int OPTregisterFollower
Int OPTshakeCamera
Int OPTshakeController
Int OPTsilentBuff
Int OPTstart
Int OPTstop
Int OPTtoggleInput
Int OPTuseFollowerVoice
Int OPTuseVoice
String SetEvent
String[] LISTsitMethod

;-- Functions ---------------------------------------

function OnOptionMenuAccept(Int option, Int index)

	if option == OPTdefineSitMethod
		INDEXmethod = index
		self.SetMenuOptionValue(OPTdefineSitMethod, LISTsitMethod[INDEXmethod], false)
		self.ForcePageReset()
		return 
	endIf
endFunction


function OnPageReset(String page)

	if SetEvent == ""
		if page == ""
			self.LoadCustomContent("FastSit/FastSitLogo.dds", 110 as Float, -20 as Float)
			return 
		elseIf page == "[Browse Manual]"
			if (MASTER as advsitfast_masterquest).Running == true
				SetEvent = "OpenManual"
				self.ForcePageReset()
			else
				debug.messagebox("Start Mod first")
			endIf
		else
			self.UnloadCustomContent()
		endIf
	elseIf SetEvent == "RestoreCamera"
		self.LoadCustomContent("FastSit/DSPexit.dds", 120 as Float, 190 as Float)
		(MASTER as advsitfast_masterquest).RestoreCamera()
		SetEvent = ""
		return 
	elseIf SetEvent == "OpenManual"
		self.LoadCustomContent("FastSit/DSPexit.dds", 120 as Float, 190 as Float)
		(MASTER as advsitfast_masterquest).ShowManual()
		SetEvent = ""
		return 
	elseIf SetEvent == "Stand"
		self.LoadCustomContent("FastSit/DSPstand.dds", 120 as Float, 190 as Float)
		SetEvent = ""
		return 
	elseIf SetEvent == "Reboot"
		self.LoadCustomContent("FastSit/DSPexit.dds", 120 as Float, 190 as Float)
		MASTER.forceRefTo(game.getPlayer() as objectreference)
		(MASTER as advsitfast_masterquest).Reboot()
		SetEvent = ""
		return 
	elseIf SetEvent == "RefreshCamera"
		self.LoadCustomContent("FastSit/DSPexit.dds", 120 as Float, 190 as Float)
		(MASTER as advsitfast_masterquest).RefreshCamera()
		SetEvent = ""
		return 
	elseIf SetEvent == "Follower"
		self.LoadCustomContent("FastSit/DSPexit.dds", 120 as Float, 190 as Float)
		(MASTER as advsitfast_masterquest).Register = true
		(MASTER as advsitfast_masterquest).RegisterFollower()
		SetEvent = ""
		return 
	elseIf SetEvent == "Uninstall"
		self.LoadCustomContent("FastSit/DSPexit.dds", 120 as Float, 190 as Float)
		(MASTER as advsitfast_masterquest).Uninstall()
		SetEvent = ""
		return 
	endIf
	if page == "Main"
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		if (MASTER as advsitfast_masterquest).Running == true
			self.AddHeaderOption("How to trigger primary?", 0)
			OPTtoggleInput = self.AddTextOption("Please select:", self.DisplayCurrent, 0)
			if (MASTER as advsitfast_masterquest).HoldCrouch == true
				OPTdelayKickin = self.AddSliderOption("", delayKickin, "for {1} seconds", 0)
			else
				OPTkey = self.AddKeyMapOption("", CTRL_key, 0)
			endIf
			if (MASTER as advsitfast_masterquest).HoldCrouch == true
				self.AddHeaderOption("Hold for how much longer before secondary?", 0)
				OPTdelayKickinCrouchLay = self.AddSliderOption("", DelayKickinCrouchLay, "for {1} seconds", 0)
			else
				self.AddHeaderOption("Hold for how long to fire secondary?", 0)
				OPTdelayKickinKey = self.AddSliderOption("", delayKickinKeyx, "for {1} seconds", 0)
			endIf
			self.AddEmptyOption()
			self.AddHeaderOption("Regenerate while sitting/relaxing?", 0)
			OPTregenHealth = self.AddToggleOption(" Health", UseRegenHealth, 0)
			OPTregenStamina = self.AddToggleOption(" Stamina", UseRegenStamina, 0)
			OPTregenMagicka = self.AddToggleOption(" Magicka", UseRegenMagicka, 0)
			OPTregenFollower = self.AddToggleOption(" Regen on Follower(s)?", UseRegenFollower, 0)
			OPTregenMult = self.AddTextOption(" Regen Strength:", self.DisplayRegenMult, 0)
			self.SetCursorPosition(1)
			self.AddHeaderOption("Lets sit together!", 0)
			OPTregisterFollower = self.AddTextOption("(Un)Register a Follower", "(" + (FreeSlots - GLBregisteredFollowers.getValue() as Int) as String + ") Slots left", 0)
			self.AddEmptyOption()
			self.AddHeaderOption("Cinematic Cam", 0)
			OPTcam = self.AddTextOption("Frequency:", self.DisplayCam, 0)
			OPTdof = self.AddToggleOption("Use Depth of Field Effect?", UseDof, 0)
			self.AddEmptyOption()
			self.AddHeaderOption("Camera Adjustment", 0)
			OPTcameraHeight = self.AddSliderOption(" Vertical", CameraHeight as Float, "{1}", 0)
			OPTcameraX = self.AddSliderOption(" Horizontal", CameraX as Float, "{1}", 0)
			OPTcamera = self.AddToggleOption(" Don't touch my camera!", UseCameraNot, 0)
			OPTcameraRestore = self.AddTextOption("", "Restore Camera", 0)
		else
			OPTstart = self.AddTextOption("Start Mod", "", 0)
		endIf
	elseIf page == "More"
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		if (MASTER as advsitfast_masterquest).Running == true
			self.SetCursorPosition(0)
			self.AddHeaderOption("For the Eye...", 0)
			OPTbuffReady = self.AddToggleOption("Buff maxed effect?", UseBuffReady, 0)
			OPTsilentBuff = self.AddToggleOption("Disable buff-apply effects?", UseSilentBuff, 0)
			OPTshakeCamera = self.AddToggleOption("Shake camera events?", UseShakeCamera, 0)
			OPTRegenVisuals = self.AddToggleOption("Display regen effect?", UseRegenVisuals, 0)
			OPTpuffOffSmoke = self.AddToggleOption("Dust effect on ground sit/relax?", UsepuffOffSmoke, 0)
			self.AddHeaderOption("For the Ear...", 0)
			OPTuseVoice = self.AddToggleOption("Allow player speech?", UseVoice, 0)
			OPTuseFollowerVoice = self.AddToggleOption("And Follower chatter?", UseFollowerVoice, 0)
			OPTcamSFX = self.AddToggleOption("Cinematic Cam 'Swooosh'?", UsecamSFX, 0)
			OPTclick = self.AddToggleOption("Click SFX on toggle hud?", UseClick, 0)
			OPTmusic = self.AddToggleOption("Tune on some Music?", UseMusic, 0)
			self.SetCursorPosition(1)
			self.AddHeaderOption("For the Misc...", 0)
			OPTmeditate = self.AddToggleOption("Free your mind? (Meditate)", UseMeditate, 0)
			OPTapplyBuff = self.AddToggleOption("Apply buffs on you?", UseBuff, 0)
			OPTbuffFollower = self.AddToggleOption("What about buffs on Follower(s)?", UsebuffFollower, 0)
			OPTbuffnotice = self.AddToggleOption("Buff strength/duration notification?", Usebuffnotice, 0)
			OPTFollowerRelax = self.AddToggleOption("Allow Follower(s) to lay down?", UseFollowerRelax, 0)
			OPTfurniture = self.AddToggleOption("Allow player use of furnitures?", UseFurniture, 0)
			OPTautoChill = self.AddToggleOption("Enable Awesome-Auto-Chill(TM)?", UseautoChill, 0)
			OPTshakeController = self.AddToggleOption("Rumble your controller?", UseControllerShake, 0)
			self.AddEmptyOption()
			self.AddEmptyOption()
			OPTstop = self.AddTextOption("", "[Stop Mod]", 0)
		endIf
	elseIf page == "[Open Manual]"
		
	endIf
endFunction


; Skipped compiler generated GetState

function OnOptionHighlight(Int option)
	if option == OPTtoggleInput
		self.SetInfoText("Click to change.")
	endIf
	if option == OPTcamera
		self.SetInfoText("Disables thirdperson camera adjustments.")
	endIf
	if option == OPTregisterFollower
		self.SetInfoText("Allow your Follower(s) to take a break with you.")
	endIf
	if option == OPTmeditate
		self.SetInfoText("Meditate instead of sitting around poking your nose! (Not recommended for Orcs: May cause exploding head!)")
	endIf
	if option == OPTapplyBuff
		self.SetInfoText("Buff duration is based on how long you were sitting/relaxing.")
	endIf
	if option == OPTcameraHeight
		self.SetInfoText("Adjust the camera height to your characters size. Can be modified while sitting.")
	endIf
	if option == OPTcameraRestore
		self.SetInfoText("Use if the camera wasn't restored correctly after sitting.")
	endIf
	if option == OPTcameraX
		self.SetInfoText("Adjust the camera to the left/right (negative values = left). Can be modified while sitting.")
	endIf
	if option == OPTregenFollower
		self.SetInfoText("Followers will regenerate activated pools while sitting.")
	endIf
	if option == OPTbuffReady
		self.SetInfoText("A brief effect will be played if buff duration has reached the maximum.")
	endIf
	if option == OPTsilentBuff
		self.SetInfoText("Disables effects when buff is applied (audio included).")
	endIf
	if option == OPTRegenVisuals
		self.SetInfoText("Tiny magic bits will float around the actor while a pool is regenerating.")
	endIf
	if option == OPTmusic
		self.SetInfoText("Plays short music tracks on certain events.")
	endIf
	if option == OPTpuffOffSmoke
		self.SetInfoText("Will only be applied in an exterior area.")
	endIf
	if option == OPTFollowerRelax
		self.SetInfoText("Followers can't estimate a 'save' lay down position: They may clip through objects/actors.")
	endIf
	if option == OPTfurniture
		self.SetInfoText("Player entity will ignore furnitures. Can also be achieved if weapon is drawn on calling sit/relax.")
	endIf
	if option == OPTautoChill
		self.SetInfoText("Followers will automatically start chilling on entering Inn/Home location.")
	endIf
	if (MASTER as advsitfast_masterquest).HoldCrouch
		if option == OPTdelayKickin
			self.SetInfoText("Values below 1 are only recommended on high performance systems.")
		endIf
	elseIf option == OPTkey
		self.SetInfoText("Define a UNUSED key to sit down. (Won't detect conflicts)")
	endIf
endFunction


function OnOptionKeyMapChange(Int option, Int keyCode, String conflictControl, String conflictName)
	if option == OPTkey
		CTRL_key = keyCode
		self.SetKeymapOptionValue(OPTkey, keyCode, false)
		(MASTER as advsitfast_masterquest).UserKey = keyCode
		(MASTER as advsitfast_masterquest).refresh()
	endIf
endFunction


function OnInit()
	utility.wait(27)
	debug.notification("Activating Fast Sit & Relax ...")
	MASTERQuest.start()
	parent.OnInit()
	UseRegenVisuals = true
	UseRegenMagicka = true
	UseRegenStamina = true
	UseRegenHealth = true
	UseBuffReady = false
	UseMusic = false
	GLBSETshakeController.setValue(0 as Float)
	GLBSETshakeCamera.setValue(0 as Float)
	GLBmusic.setValue(0 as Float)
	GLBbuffReady.setValue(0 as Float)
	GLBSETallowVoice.setValue(1 as Float)
	GLBhealthRegen.setValue(1 as Float)
	GLBmagickaRegen.setValue(1 as Float)
	GLBstaminaRegen.setValue(1 as Float)
	GLBregenVisuals.setValue(1 as Float)
	GLBallowRelax.setValue(100 as Float)
	GLBbuffFollower.setValue(100 as Float)
	GLBspeechFollower.setValue(1 as Float)
	GLBbuffNotification.setValue(1 as Float)
	GLBregenFollower.setValue(100 as Float)
	GLBautoChill.setValue(50 as Float)
	LISTsitMethod = new String[2]
	LISTsitMethod[0] = "Hold crouch"
	LISTsitMethod[1] = "Press Key"
	(MASTER as advsitfast_masterquest).Running = true
	Pages = new String[4]
	Pages[0] = "Main"
	Pages[1] = "More"
	Pages[2] = ""
	Pages[3] = "[Browse Manual]"
endFunction


function OnOptionSliderOpen(Int option)

	if (MASTER as advsitfast_masterquest).HoldCrouch == false
		if option == OPTdelayKickinKey
			self.SetSliderDialogStartValue(delayKickinKeyx)
			self.SetSliderDialogDefaultValue(0.500000)
			self.SetSliderDialogRange(0.500000, 1.00000)
			self.SetSliderDialogInterval(0.100000)
		endIf
	else
		if option == OPTdelayKickin
			self.SetSliderDialogStartValue(delayKickin)
			self.SetSliderDialogDefaultValue(1.00000)
			self.SetSliderDialogRange(0.500000, 2.00000)
			self.SetSliderDialogInterval(0.100000)
		endIf
		if option == OPTdelayKickinCrouchLay
			self.SetSliderDialogStartValue(DelayKickinCrouchLay)
			self.SetSliderDialogDefaultValue(1 as Float)
			self.SetSliderDialogRange(0.500000, 2.00000)
			self.SetSliderDialogInterval(0.100000)
		endIf
	endIf
	if option == OPTcameraHeight
		self.SetSliderDialogStartValue(CameraHeight as Float)
		self.SetSliderDialogDefaultValue(1.00000)
		self.SetSliderDialogRange(-128 as Float, 32 as Float)
		self.SetSliderDialogInterval(2 as Float)
	endIf
	if option == OPTcameraX
		self.SetSliderDialogStartValue(CameraX as Float)
		self.SetSliderDialogDefaultValue(1.00000)
		self.SetSliderDialogRange(-64 as Float, 64 as Float)
		self.SetSliderDialogInterval(2 as Float)
	endIf
endFunction


function OnOptionMenuOpen(Int option)

	if option == OPTdefineSitMethod
		self.SetMenuDialogOptions(LISTsitMethod)
		self.SetMenuDialogStartIndex(INDEXmethod)
		self.SetMenuDialogDefaultIndex(1)
	endIf
endFunction


function OnOptionSelect(Int option)
	if (MASTER as advsitfast_masterquest).Running == true
		if option == OPTtoggleInput
			(MASTER as advsitfast_masterquest).HoldCrouch = !(MASTER as advsitfast_masterquest).HoldCrouch
			self.SetTextOptionValue(OPTtoggleInput, self.DisplayCurrent, false)
			(MASTER as advsitfast_masterquest).refresh()
			self.ForcePageReset()
		elseIf option == OPTbuffFollower
			UsebuffFollower = !UsebuffFollower
			self.SetToggleOptionValue(OPTbuffFollower, UsebuffFollower, false)
			if UsebuffFollower == true
				GLBbuffFollower.setValue(100 as Float)
			else
				GLBbuffFollower.setValue(0 as Float)
			endIf
		elseIf option == OPTsilentBuff
			UseSilentBuff = !UseSilentBuff
			self.SetToggleOptionValue(OPTsilentBuff, UseSilentBuff, false)
			if UseSilentBuff == true
				GLBsilentBuff.setValue(100 as Float)
			else
				GLBsilentBuff.setValue(0 as Float)
			endIf
		elseIf option == OPTFollowerRelax
			UseFollowerRelax = !UseFollowerRelax
			self.SetToggleOptionValue(OPTFollowerRelax, UseFollowerRelax, false)
			if UseFollowerRelax == true
				GLBallowRelax.setValue(100 as Float)
			else
				GLBallowRelax.setValue(0 as Float)
			endIf
		elseIf option == OPTregisterFollower
			if (MASTER as advsitfast_masterquest).Register == 0 as Bool
				if game.getPlayer().getSitState() == 0
					SetEvent = "Follower"
					self.ForcePageReset()
				else
					SetEvent = "Stand"
					self.ForcePageReset()
				endIf
			endIf
		elseIf option == OPTcam
			if (MASTER as advsitfast_masterquest).SETcameraFrequency == 0
				(MASTER as advsitfast_masterquest).SETcameraFrequency = 1
			elseIf (MASTER as advsitfast_masterquest).SETcameraFrequency == 1
				(MASTER as advsitfast_masterquest).SETcameraFrequency = 2
			elseIf (MASTER as advsitfast_masterquest).SETcameraFrequency == 2
				(MASTER as advsitfast_masterquest).SETcameraFrequency = 0
			endIf
			self.SetTextOptionValue(OPTcam, self.DisplayCam, false)
			self.ForcePageReset()
		elseIf option == OPTregenMult
			if GLBregenMult.getValue() == 1.50000
				GLBregenMult.setValue(2.50000)
			elseIf GLBregenMult.getValue() == 2.50000
				GLBregenMult.setValue(3.50000)
			elseIf GLBregenMult.getValue() == 3.50000
				GLBregenMult.setValue(1.50000)
			endIf
			self.SetTextOptionValue(OPTregenMult, self.DisplayRegenMult, false)
			self.ForcePageReset()
		elseIf option == OPTRegenVisuals
			UseRegenVisuals = !UseRegenVisuals
			self.SetToggleOptionValue(OPTRegenVisuals, UseRegenVisuals, false)
			if UseRegenVisuals == true
				GLBregenVisuals.setValue(1 as Float)
			else
				GLBregenVisuals.setValue(0 as Float)
			endIf
		elseIf option == OPTmusic
			UseMusic = !UseMusic
			self.SetToggleOptionValue(OPTmusic, UseMusic, false)
			if UseMusic == true
				GLBmusic.setValue(1 as Float)
			else
				GLBmusic.setValue(0 as Float)
			endIf
		elseIf option == OPTbuffReady
			UseBuffReady = !UseBuffReady
			self.SetToggleOptionValue(OPTbuffReady, UseBuffReady, false)
			if UseBuffReady == true
				GLBbuffReady.setValue(1 as Float)
			else
				GLBbuffReady.setValue(0 as Float)
			endIf
		elseIf option == OPTbuffnotice
			Usebuffnotice = !Usebuffnotice
			self.SetToggleOptionValue(OPTbuffnotice, Usebuffnotice, false)
			if Usebuffnotice == true
				GLBbuffNotification.setValue(1 as Float)
			else
				GLBbuffNotification.setValue(0 as Float)
			endIf
		elseIf option == OPTuseVoice
			UseVoice = !UseVoice
			self.SetToggleOptionValue(OPTuseVoice, UseVoice, false)
			if UseVoice == true
				GLBSETallowVoice.setValue(1 as Float)
			else
				GLBSETallowVoice.setValue(0 as Float)
			endIf
		elseIf option == OPTuseFollowerVoice
			UseFollowerVoice = !UseFollowerVoice
			self.SetToggleOptionValue(OPTuseFollowerVoice, UseFollowerVoice, false)
			if UseFollowerVoice == true
				GLBspeechFollower.setValue(1 as Float)
			else
				GLBspeechFollower.setValue(0 as Float)
			endIf
		elseIf option == OPTcamSFX
			UsecamSFX = !UsecamSFX
			self.SetToggleOptionValue(OPTcamSFX, UsecamSFX, false)
			(MASTER as advsitfast_masterquest).SETcCamSFX = UsecamSFX
		elseIf option == OPTshakeController
			UseControllerShake = !UseControllerShake
			self.SetToggleOptionValue(OPTshakeController, UseControllerShake, false)
			(MASTER as advsitfast_masterquest).SETshakeController = UseControllerShake
			if UseControllerShake == true
				GLBSETshakeController.setValue(1 as Float)
			else
				GLBSETshakeController.setValue(0 as Float)
			endIf
		elseIf option == OPTclick
			UseClick = !UseClick
			self.SetToggleOptionValue(OPTclick, UseClick, false)
			(MASTER as advsitfast_masterquest).SETclickSFX = UseClick
		elseIf option == OPTshakeCamera
			UseShakeCamera = !UseShakeCamera
			self.SetToggleOptionValue(OPTshakeCamera, UseShakeCamera, false)
			(MASTER as advsitfast_masterquest).SETShakeCamera = UseShakeCamera
			if UseShakeCamera == true
				GLBSETshakeCamera.setValue(1 as Float)
			else
				GLBSETshakeCamera.setValue(0 as Float)
			endIf
		elseIf option == OPTpuffOffSmoke
			UsepuffOffSmoke = !UsepuffOffSmoke
			self.SetToggleOptionValue(OPTpuffOffSmoke, UsepuffOffSmoke, false)
			(MASTER as advsitfast_masterquest).SETpuffOffSmoke = UsepuffOffSmoke
		elseIf option == OPTbuffFollower
			UsebuffFollower = !UsebuffFollower
			self.SetToggleOptionValue(OPTbuffFollower, UsebuffFollower, false)
			if UsebuffFollower == true
				GLBbuffFollower.setValue(100 as Float)
			else
				GLBbuffFollower.setValue(0 as Float)
			endIf
		elseIf option == OPTregenFollower
			UseRegenFollower = !UseRegenFollower
			self.SetToggleOptionValue(OPTregenFollower, UseRegenFollower, false)
			if UseRegenFollower == true
				GLBregenFollower.setValue(100 as Float)
			else
				GLBregenFollower.setValue(0 as Float)
			endIf
		elseIf option == OPTapplyBuff
			UseBuff = !UseBuff
			self.SetToggleOptionValue(OPTapplyBuff, UseBuff, false)
			(MASTER as advsitfast_masterquest).SETbuffPlayer = UseBuff
		elseIf option == OPTmeditate
			UseMeditate = !UseMeditate
			self.SetToggleOptionValue(OPTmeditate, UseMeditate, false)
			(MASTER as advsitfast_masterquest).SETmeditate = UseMeditate
		elseIf option == OPTdof
			UseDof = !UseDof
			self.SetToggleOptionValue(OPTdof, UseDof, false)
			if UseDof == false
				(MASTER as advsitfast_masterquest).ValueDOFstrength = 0 as Float
			else
				(MASTER as advsitfast_masterquest).ValueDOFstrength = 1 as Float
			endIf
		elseIf option == OPTfurniture
			UseFurniture = !UseFurniture
			self.SetToggleOptionValue(OPTfurniture, UseFurniture, false)
			if UseFurniture == false
				(MASTER as advsitfast_masterquest).AllowFurniture = false
			else
				(MASTER as advsitfast_masterquest).AllowFurniture = true
			endIf
		elseIf option == OPTcamera
			if game.getPlayer().getSitState() == 0
				UseCameraNot = !UseCameraNot
				self.SetToggleOptionValue(OPTcamera, UseCameraNot, false)
				(MASTER as advsitfast_masterquest).SETdontModCamera = UseCameraNot
			else
				SetEvent = "Stand"
				self.ForcePageReset()
			endIf
		elseIf option == OPTstop
			if game.getPlayer().getSitState() == 0
				SetEvent = "Uninstall"
				self.ForcePageReset()
			else
				SetEvent = "Stand"
				self.ForcePageReset()
			endIf
		elseIf option == OPTmanual
			debug.messagebox("K! Please exit the menu")
			(MASTER as advsitfast_masterquest).ShowManual()
		elseIf option == OPTregenHealth
			UseRegenHealth = !UseRegenHealth
			self.SetToggleOptionValue(OPTregenHealth, UseRegenHealth, false)
			if UseRegenHealth == true
				GLBhealthRegen.setValue(100 as Float)
			else
				GLBhealthRegen.setValue(0 as Float)
			endIf
		elseIf option == OPTregenMagicka
			UseRegenMagicka = !UseRegenMagicka
			self.SetToggleOptionValue(OPTregenMagicka, UseRegenMagicka, false)
			if UseRegenMagicka == true
				GLBmagickaRegen.setValue(100 as Float)
			else
				GLBmagickaRegen.setValue(0 as Float)
			endIf
		elseIf option == OPTautoChill
			UseautoChill = !UseautoChill
			self.SetToggleOptionValue(OPTautoChill, UseautoChill, false)
			if UseautoChill == true
				GLBautoChill.setValue(50 as Float)
			else
				GLBautoChill.setValue(0 as Float)
			endIf
		elseIf option == OPTregenStamina
			UseRegenStamina = !UseRegenStamina
			self.SetToggleOptionValue(OPTregenStamina, UseRegenStamina, false)
			if UseRegenStamina == true
				GLBstaminaRegen.setValue(100 as Float)
			else
				GLBstaminaRegen.setValue(0 as Float)
			endIf
		elseIf option == OPTcameraRestore
			if game.getPlayer().getSitState() == 0
				SetEvent = "RestoreCamera"
				self.ForcePageReset()
			else
				SetEvent = "Stand"
				self.ForcePageReset()
			endIf
		endIf
	elseIf option == OPTstart
		SetEvent = "Reboot"
		self.ForcePageReset()
	endIf
endFunction


function refresh()
	self.ForcePageReset()
endFunction


function OnOptionSliderAccept(Int option, Float value)

	if option == OPTdelayKickin
		delayKickin = value
		self.SetSliderOptionValue(OPTdelayKickin, delayKickin, "for {1} seconds", false)
		(MASTER as advsitfast_masterquest).delayKickin = delayKickin
	endIf
	if option == OPTdelayKickinKey
		if (MASTER as advsitfast_masterquest).HoldCrouch == false
			delayKickinKeyx = value
			self.SetSliderOptionValue(OPTdelayKickinKey, delayKickinKeyx, "for {1} seconds", false)
			(MASTER as advsitfast_masterquest).delayKickinKey = delayKickinKeyx
		endIf
	endIf
	if option == OPTdelayKickinCrouchLay
		if (MASTER as advsitfast_masterquest).HoldCrouch == true
			DelayKickinCrouchLay = value
			self.SetSliderOptionValue(OPTdelayKickinCrouchLay, DelayKickinCrouchLay, "for {1} seconds", false)
			(MASTER as advsitfast_masterquest).DelayKickinCrouchLay = DelayKickinCrouchLay
		endIf
	endIf
	if option == OPTcameraHeight
		if game.getPlayer().getSitState() == 0
			CameraHeight = value as Int
			self.SetSliderOptionValue(OPTcameraHeight, CameraHeight as Float, "{1}", false)
			(MASTER as advsitfast_masterquest).CameraHeight = CameraHeight
		else
			CameraHeight = value as Int
			self.SetSliderOptionValue(OPTcameraHeight, CameraHeight as Float, "{1}", false)
			(MASTER as advsitfast_masterquest).CameraHeight = CameraHeight
			SetEvent = "RefreshCamera"
			self.ForcePageReset()
		endIf
	endIf
	if option == OPTcameraX
		if game.getPlayer().getSitState() == 0
			CameraX = value as Int
			self.SetSliderOptionValue(OPTcameraX, CameraX as Float, "{1}", false)
			(MASTER as advsitfast_masterquest).CameraX = CameraX
		else
			CameraX = value as Int
			self.SetSliderOptionValue(OPTcameraX, CameraX as Float, "{1}", false)
			(MASTER as advsitfast_masterquest).CameraX = CameraX
			SetEvent = "RefreshCamera"
			self.ForcePageReset()
		endIf
	endIf
endFunction

; Skipped compiler generated GotoState

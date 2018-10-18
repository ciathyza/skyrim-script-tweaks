;/ Decompiled by Champollion V1.0.0
Source   : ADVSitFast_MasterQuest.psc
Modified : 2014-07-25 17:12:17
Compiled : 2014-07-25 17:12:24
User     : Safthanspeter
Computer : HEIKE
/;

scriptName ADVSitFast_MasterQuest extends ReferenceAlias

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Bool property AllowFurniture = false auto hidden
Bool property AllowProcessing auto hidden
Bool property BLOCKfurniture auto hidden
Bool property ControlPressed auto hidden
Bool property Crafting auto hidden
Bool property Failsave auto hidden
Bool property FreeStyle auto hidden
Bool property HoldCrouch = true auto hidden
Bool property InfoFollower auto hidden
Bool property Lockon auto hidden
Bool property Online auto hidden
Bool property PChasUsedSleepMenu auto hidden
Bool property PCslept auto
Bool property present auto hidden
Bool property Register auto hidden
Bool property Running auto hidden
Bool property SETbuffPlayer = true auto hidden
Bool property SETbuffSleep = true auto hidden
Bool property SETcCamSFX = false auto hidden
Bool property SETclickSFX = false auto hidden
Bool property SETdontModCamera = true auto hidden
Bool property SETinverseLean = false auto hidden
Bool property SETmeditate = true auto hidden
Bool property SETpuffOffSmoke = true auto hidden
Bool property SETShakeCamera = false auto hidden
Bool property SETshakeController = false auto hidden
Bool property TranslationCompleted auto hidden
Bool property TUTORIALtoggleHud = false auto hidden
Bool property WakingUp auto hidden

Float property delayKickin = 1.0 auto hidden
Float property delayKickinCrouchLay = 1.0 auto hidden
Float property delayKickinKey = 0.5 auto hidden
Float property GoalX auto hidden
Float property GoalY auto hidden
Float property GoalZ auto hidden
Float property ReturnINIsettingX auto hidden
Float property ReturnINIsettingXMaster auto hidden
Float property ReturnINIsettingZ auto hidden
Float property ReturnINIsettingZMaster auto hidden
Float property Speed auto hidden
Float property TIMERrefresh auto hidden
Float property valueDOFstrength = 1.0 auto hidden

Int property AlasHappy auto hidden
Int property CameraHeight = -64 auto hidden
Int property CameraHeightRelaxFurniture = -128 auto hidden
Int property CameraHeightSitFurniture = -32 auto hidden
Int property CameraX = 0 auto hidden
Int property SETcameraFrequency = 0 auto hidden
Int property ThirdPerson auto hidden
Int property TOGGLEhud auto hidden
Int property UserKey = 35 auto hidden

ReferenceAlias property Camera auto
ReferenceAlias property Follower01 auto
ReferenceAlias property Follower02 auto
ReferenceAlias property Follower03 auto
ReferenceAlias property Follower04 auto
ReferenceAlias property Follower05 auto
ReferenceAlias property Follower06 auto

activator property REFActionScript auto
actor property Alas auto hidden
actor property player auto hidden
actorbase property SPAWNalas auto
effectshader property Anti auto
effectshader property PMSGREEN auto
explosion property PuffOffSmoke auto
faction property FACTanalized auto
furniture property FURNactivator auto
String property GetFurniture auto hidden
String property GetType auto hidden

globalvariable property CameraAction auto
globalvariable property GLBAllowProcessing auto
globalvariable property GLBautoChill auto
globalvariable property GLBbuffPlayer auto
globalvariable property GLBfindBed auto
globalvariable property GLBfindChair auto
globalvariable property GLBgetFurniture auto
globalvariable property GLBgetType auto
globalvariable property GLBloadFix auto
globalvariable property GLBSETallowVoice auto
globalvariable property GLBSETshakeCamera auto
globalvariable property GLBSETshakeController auto
globalvariable property LISTEN01 auto
globalvariable property LISTEN02 auto
globalvariable property LISTEN03 auto
globalvariable property LISTEN04 auto

imagespacemodifier property IMODcamFade auto
imagespacemodifier property IMODcamFadeFull auto
imagespacemodifier property IMODdynamicDOF auto
imagespacemodifier property IMODfadeQuick auto
imagespacemodifier property IMODsitready auto

keyword property LocTypeHouse auto
keyword property LOCtypeINN auto

magiceffect property MEcharge auto
magiceffect property MEfollowerRoutine auto
magiceffect property MElistening auto
magiceffect property MEparaStance auto
magiceffect property MEparaStanceFull auto
magiceffect property MEsitbuff auto
magiceffect property MEsleepBuff auto
magiceffect property MEvalidate auto

message property MSGinfoFollower auto
message property MSGinfoFollower02 auto
message property MSGuninstall auto
message property TUTORIALnap auto
message property TUTORIALnapKey auto

musictype property MUSfail auto
musictype property MUSreward auto

objectreference property ActionScript auto hidden
objectreference property SleepPlenty auto hidden

package property PACKfindBed auto
package property PACKfindChair auto
package property PACKuseBed auto
package property PACKuseChair auto

potion property SleepWell auto

quest property Master auto
quest property SkyUi auto

sound property SFXabort auto
sound property SFXexplosion auto
sound property SFXfail auto
sound property SFXlean auto
sound property SFXsit auto
sound property SFXstand auto
sound property SFXtoggleOFF auto
sound property SFXtoggleON auto

spell property BUFFsit auto
spell property BUFFsleep auto
spell property FollowerRoutine auto
spell property SPELLcharge auto
spell property SPELLlisten auto
spell property SPELLparalysis auto
spell property SPELLparalysisFull auto
spell property SpellRegister auto
spell property SPELLvalidate auto

topic property Nope auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Bool ALASONCE
Bool AutoChill
Bool COOLDOWN
Bool SWITCH
Float COOLDOWNpara
Float DELAYfailsave
Float DELAYwait
Float SpawnPosZ
Float dev
Int BUTTON
Int ParaChance
Int SFXvolume
actor Attacker

; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

function OnInit()
	if skse.GetVersion() as Float + skse.GetVersionMinor() as Float * 0.01 + skse.GetVersionBeta() as Float * 0.0001 >= 1.06050
		if game.GetFormFromFile(2050, "SkyUI.esp")
			ReturnINIsettingZMaster = utility.getINIFloat("fOverShoulderPosz:Camera")
			ReturnINIsettingXMaster = utility.getINIFloat("fOverShoulderPosx:Camera")
			player = game.GetPlayer()
			TIMERrefresh = utility.getCurrentRealTime() + 300.0
			MUSreward.add()
			game.SetGameSettingString("sHUDStarted", "Initialized")
			utility.wait(0.5)
			Master.SetObjectiveDisplayed(0, true, false)
			utility.wait(0.25)
			Master.SetObjectiveDisplayed(1, true, false)
			utility.wait(0.25)
			Master.setObjectiveCompleted(0, 0 as Bool)
			Master.setObjectiveCompleted(1, 0 as Bool)
			game.SetGameSettingString("sHUDStarted", "Started")
			IMODsitready.apply(1.0)
			self.RegisterForControl("Sneak")
		else
			debug.messagebox("SkyUI not detected: FastSit & Relax cannot be used!")
		endIf
	else
		debug.messagebox("SKSE 1_06_06 not detected: FastSit & Relax cannot be used!")
	endIf
endFunction


function OnControlDown(String control)
	if !utility.IsInMenuMode()
		if control == "Sneak"
			if self.GetState() != "ListenInput" && self.GetState() != "AutoPilot" && player.getSitState() == 0 && player.getSleepState() == 0 && player.hasMagicEffect(MEcharge) == false
				if LISTEN01.getValue() == 0.0 && player.HasSpell(SPELLvalidate as form) == 0 as Bool && LISTEN04.getValue() == 0.0
					LISTEN01.setValue(100.0)
					player.addSpell(SPELLvalidate, 0 as Bool)
				endIf
			elseIf self.GetState() == "ListenInput"
				self.Wake()
			elseIf self.GetState() == "AutoPilot"
				self.Abort()
			endIf
		elseIf control == "Ready Weapon"
			if player.HasSpell(SpellRegister as form) == 1 as Bool
				player.unequipspell(SpellRegister, 1)
				player.removespell(SpellRegister)
				if self.GetState() != "ListenInput" && (ActionScript as advsitfast_actionscript).ALIVE == false || FreeStyle == false
					self.UnregisterForControl("Ready Weapon")
				endIf
			endIf
		elseIf control == "Toggle POV"
			if self.GetState() == "ListenInput" || (ActionScript as advsitfast_actionscript).ALIVE == true || FreeStyle == true && Crafting == false
				;if TUTORIALtoggleHud == false
				;	TUTORIALtoggleHud = true
				;endIf
				if TOGGLEhud == 0
					;game.SetHudCartMode(true)
					if SETclickSFX == true
						SFXvolume = SFXtoggleOFF.play(player as objectreference)
					endIf
					sound.SetInstanceVolume(SFXvolume, 1.0)
					;TOGGLEhud = 1
				elseIf TOGGLEhud == 1
					game.SetHudCartMode(false)
					IMODsitready.apply(0.25)
					if SETclickSFX == true
						SFXvolume = SFXtoggleON.play(player as objectreference)
					endIf
					sound.SetInstanceVolume(SFXvolume, 1.0)
					TOGGLEhud = 0
				endIf
			endIf
		elseIf control == "Forward" || control == "Back" || control == "Strafe Left" || control == "Strafe Right"
			if self.GetState() == "ListenInput"
				self.Wake()
			endIf
		elseIf control == "Jump"
			if !utility.IsInMenuMode()
				if Online == true
					;debug.notification("Sequence aborted!")
					Failsave = true
					self.Abort()
				endIf
			endIf
		endIf
	endIf
endFunction


function OnControlUp(String control, Float HoldTime)
	if !utility.IsInMenuMode()
		if control == "Sneak"
			if LISTEN01.getValue() != 0.0
				LISTEN01.setValue(0.0)
			endIf
		endIf
	endIf
endFunction


function ONpackageSTART(package akNewPackage)
	if akNewPackage == PACKfindBed
		utility.wait(0.25)
		if GLBfindBed.getValue() == 50.0
			GLBfindBed.setValue(0.0)
			GLBgetFurniture.setValue(0.0)
			GetFurniture = "Ground"
			player.evaluatePackage()
		endIf
	elseIf akNewPackage == PACKfindChair
		utility.wait(0.25)
		if GLBfindChair.getValue() == 50.0
			GLBfindChair.setValue(0.0)
			GLBgetFurniture.setValue(0.0)
			GetFurniture = "Ground"
			player.evaluatePackage()
		endIf
	endIf
endFunction


function ONpackageEND(package akOldPackage)
	if akOldPackage == PACKfindBed
		if GLBfindBed.getValue() == 50.0
			GetFurniture = "Bed"
			GLBgetFurniture.setValue(2.0)
			GLBfindBed.setValue(0.0)
		endIf
	elseIf akOldPackage == PACKfindChair
		if GLBfindChair.getValue() == 50.0
			GetFurniture = "Chair"
			GLBgetFurniture.setValue(1.0)
			GLBfindChair.setValue(0.0)
		endIf
	endIf
endFunction


function OnMenuOpen(String getMenu)
	if getMenu == "Crafting Menu"
		Crafting = true
	endIf
endFunction


function OnMenuClose(String getMenu)
	if getMenu == "Crafting Menu"
		self.unregisterForMenu("Crafting Menu")
		(Camera as advsitfast_camera).UnregisterForControl("Right Attack/Block")
		(Camera as advsitfast_camera).UnregisterForControl("Left Attack/Block")
	endIf
endFunction


function OnKeyDown(Int keyCode)
	if !utility.IsInMenuMode()
		if keyCode == UserKey
			if self.GetState() != "ListenInput" && self.GetState() != "AutoPilot" && player.getSitState() == 0 && player.getSleepState() == 0 && player.hasMagicEffect(MEcharge) == false
				if player.isInCombat() == false
					if LISTEN01.getValue() == 0.0
						LISTEN01.setValue(100.0)
						player.addSpell(SPELLvalidate, 0 as Bool)
					endIf
				else
					debug.notification("You should not sit around while in combat!")
					if GLBSETallowVoice.getValue() != 0.0
						player.say(Nope, none, false)
					endIf
				endIf
			elseIf self.GetState() == "ListenInput"
				self.Wake()
			elseIf self.GetState() == "AutoPilot"
				self.Abort()
			endIf
		endIf
	endIf
endFunction


function OnKeyUp(Int keyCode, Float HoldTime)
	if !utility.IsInMenuMode()
		if keyCode == UserKey
			if LISTEN01.getValue() != 0.0
				LISTEN01.setValue(0.0)
			endIf
		endIf
	endIf
endFunction


function OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)
	game.FadeOutGame(false, true, 60.0, 1000.0)
	PCslept = true
endFunction


function OnSleepStop(Bool abInterrupted)
	if player.hasMagicEffect(MEsleepBuff) == false
		BUFFsleep.Cast(player as objectreference, none)
	endIf
	self.UnRegisterForSleep()
endFunction


function OnSit(objectreference akFurniture)
	if self.GetState() != "ListenInput" && self.GetState() != "AutoPilot"
		self.registerForMenu("Crafting Menu")
		utility.wait(0.25)
		
		if Crafting == false
			FreeStyle = true
			(Camera as advsitfast_camera).Validate("Sit", "Chair")
			ReturnINIsettingZ = utility.getINIFloat("fOverShoulderPosz:Camera")
			ReturnINIsettingX = utility.getINIFloat("fOverShoulderPosx:Camera")
			game.ENABLEPLAYERCONTROLS(true, true, true, true, true, true, true, true, 0)
			game.DisablePlayerControls(0 as Bool, 0 as Bool, 1 as Bool, 0 as Bool, 0 as Bool, 0 as Bool, 1 as Bool, 0 as Bool, 0)
			ThirdPerson = game.GetCameraState()
			game.forceThirdPerson()
			
			if SETdontModCamera == false && CameraAction.getValue() != 50.0
				utility.SetINIFloat("fOverShoulderPosz:Camera", CameraHeightSitFurniture as Float)
				utility.SetINIFloat("fOverShoulderPosx:Camera", CameraX as Float)
				utility.wait(0.1)
				game.UpdateThirdPerson()
			endIf
			
			self.RegisterForControl("Toggle POV")
			;game.SetHudCartMode(true)
			;TOGGLEhud = 1
			
			if player.hasMagicEffect(MEsitbuff) == false
				if SETbuffPlayer == true
					GLBbuffPlayer.setValue(100.0)
				else
					GLBbuffPlayer.setValue(0.0)
				endIf
				BUFFsit.Cast(player as objectreference, none)
			endIf
		endIf
		
		GLBgetType.setValue(1.0)
		GLBgetFurniture.setValue(1.0)
		
		if AutoChill == false
			if Follower01.getRef() != none && (Follower01.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower01.getRef() as actor) as objectreference, none)
			endIf
			if Follower02.getRef() != none && (Follower02.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower02.getRef() as actor) as objectreference, none)
			endIf
			if Follower03.getRef() != none && (Follower03.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower03.getRef() as actor) as objectreference, none)
			endIf
			if Follower04.getRef() != none && (Follower04.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower04.getRef() as actor) as objectreference, none)
			endIf
			if Follower05.getRef() != none && (Follower05.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower05.getRef() as actor) as objectreference, none)
			endIf
			if Follower06.getRef() != none && (Follower06.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower06.getRef() as actor) as objectreference, none)
			endIf
		endIf
	endIf
endFunction


function OnGetUp(objectreference akFurniture)
	if self.GetState() == "ListenInput" || self.GetState() == "AutoPilot"
		if WakingUp == false
			WakingUp = true
			if player.hasMagicEffect(MEsitbuff) == true
				player.dispelSpell(BUFFsit)
			endIf
			while player.getCurrentPackage() == PACKuseChair
				GLBfindChair.setValue(-100.0)
				player.evaluatePackage()
				utility.wait(0.15)
			endWhile
			while player.getCurrentPackage() == PACKuseBed
				GLBfindBed.setValue(-100.0)
				player.evaluatePackage()
				utility.wait(0.15)
			endWhile
			if HoldCrouch == true
				self.UnregisterForControl("Sneak")
			else
				self.UnregisterForKey(UserKey)
			endIf
			self.UnregisterForControl("Toggle POV")
			self.TERMINATE()
		endIf
	elseIf self.GetState() != "ListenInput" && self.GetState() != "AutoPilot" && self.GetState() != "Bed"
		if CameraAction.getValue() == 50.0
			(Camera as advsitfast_camera).Finish()
		endIf
		
		game.ENABLEPLAYERCONTROLS(true, true, true, true, true, true, true, true, 0)
		self.unregisterForMenu("Crafting Menu")
		(Camera as advsitfast_camera).UnregisterForControl("Right Attack/Block")
		(Camera as advsitfast_camera).UnregisterForControl("Left Attack/Block")
		FreeStyle = false
		game.SetHudCartMode(false)
		TOGGLEhud = 0
		
		if Crafting == false
			if player.hasMagicEffect(MEsitbuff) == true
				player.dispelSpell(BUFFsit)
			endIf
		endIf
		
		if ThirdPerson == 0
			debug.sendAnimationEvent(player as objectreference, "IdleCartExitInstant")
			utility.wait(0.15)
			game.FadeOutGame(false, true, 0.0, 0.5)
			game.forceFirstPerson()
		endIf
		
		utility.SetINIFloat("fOverShoulderPosz:Camera", ReturnINIsettingZ)
		utility.SetINIFloat("fOverShoulderPosx:Camera", ReturnINIsettingX)
		utility.wait(0.1)
		game.UpdateThirdPerson()
		Crafting = false
	endIf
endFunction


function OnHit(objectreference akAggressor, form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	Attacker = akAggressor as actor
	if player.hasMagicEffect(MEparaStance) == true || player.hasMagicEffect(MEparaStanceFull) == true
		if utility.getCurrentRealTime() > COOLDOWNpara
			Attacker = akAggressor as actor
			if player.hasMagicEffect(MEparaStanceFull) == true
				ParaChance = utility.randomInt(-2, 1)
				if ParaChance > 0
					SPELLparalysisFull.Cast(Attacker as objectreference, none)
					COOLDOWNpara = utility.getCurrentRealTime() + 15.0
					ParaChance = 0
				endIf
			elseIf player.hasMagicEffect(MEparaStance) == true
				ParaChance = utility.randomInt(-3, 1)
				if ParaChance > 0
					COOLDOWNpara = utility.getCurrentRealTime() + 30.0
					ParaChance = 0
				endIf
			endIf
		endIf
	endIf
	if AlasHappy != 0
		if player.getAvPercentage("Health") < 0.2
			debug.notification("alaslevel: " + AlasHappy as String)
			player.KnockAreaEffect(1.0, 512.0)
			if AlasHappy == 1
				player.restoreAv("Health", player.GetBaseActorValue("Health") / 100.000 * 20.0)
			elseIf AlasHappy == 2
				player.restoreAv("Health", player.GetBaseActorValue("Health") / 100.000 * 40.0)
			elseIf AlasHappy == 3
				player.restoreAv("Health", player.GetBaseActorValue("Health") / 100.000 * 60.0)
			elseIf AlasHappy == 4
				player.restoreAv("Health", player.GetBaseActorValue("Health") / 100.000 * 80.0)
			elseIf AlasHappy == 5
				player.restoreAv("Health", player.GetBaseActorValue("Health") / 100.000 * 100.0)
			elseIf AlasHappy == 6
				
			endIf
			AlasHappy = 0
		endIf
	endIf
	if self.GetState() == "ListenInput" || self.GetState() == "AutoPilot"
		if player.isInCombat()
			if WakingUp == false
				WakingUp = true
				if player.hasMagicEffect(MEsitbuff) == true
					player.dispelSpell(BUFFsit)
				endIf
				while player.getCurrentPackage() == PACKuseChair
					GLBfindChair.setValue(-100.0)
					player.evaluatePackage()
					utility.wait(0.15)
				endWhile
				while player.getCurrentPackage() == PACKuseBed
					GLBfindBed.setValue(-100.0)
					player.evaluatePackage()
					utility.wait(0.15)
				endWhile
				if HoldCrouch == true
					self.UnregisterForControl("Sneak")
				else
					self.UnregisterForKey(UserKey)
				endIf
				self.UnregisterForControl("Forward")
				self.UnregisterForControl("Back")
				self.UnregisterForControl("Strafe Left")
				self.UnregisterForControl("Strafe Right")
				self.TERMINATE()
			endIf
		endIf
	endIf
endFunction


function OnPlayerLoadGame()
	if player.hasMagicEffect(MElistening) == false
		SPELLlisten.Cast(player as objectreference, none)
	endIf
	if AutoChill == true
		GLBloadFix.setValue(1.0)
		if Follower01.getRef() != none && (Follower01.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower01.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			utility.wait(4.0)
			FollowerRoutine.Cast((Follower01.getRef() as actor) as objectreference, none)
		endIf
		if Follower02.getRef() != none && (Follower02.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower02.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower02.getRef() as actor) as objectreference, none)
		endIf
		if Follower03.getRef() != none && (Follower03.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower03.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower03.getRef() as actor) as objectreference, none)
		endIf
		if Follower04.getRef() != none && (Follower04.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower04.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower04.getRef() as actor) as objectreference, none)
		endIf
		if Follower05.getRef() != none && (Follower05.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower05.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower05.getRef() as actor) as objectreference, none)
		endIf
		if Follower06.getRef() != none && (Follower06.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower06.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower06.getRef() as actor) as objectreference, none)
		endIf
	endIf
	WakingUp = true
	TIMERrefresh = 0.0
	COOLDOWNpara = 0.0
	self.RefreshListening()
endFunction


function OnLocationChange(Location akOldLoc, Location akNewLoc)
	if player.GetCurrentLocation().HasKeyword(LOCtypeINN) == true || player.GetCurrentLocation().HasKeyword(LocTypeHouse) == true
		if GLBautoChill.getValue() != 0.0
			AutoChill = true
			GLBautoChill.setValue(100.0)
			utility.wait(0.5)
			if Follower01.getRef() != none && (Follower01.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower01.getRef() as actor) as objectreference, none)
				debug.sendAnimationEvent((Follower01.getRef() as actor) as objectreference, "IdleCartExitInstant")
			endIf
			if Follower02.getRef() != none && (Follower02.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower02.getRef() as actor) as objectreference, none)
				debug.sendAnimationEvent((Follower02.getRef() as actor) as objectreference, "IdleCartExitInstant")
			endIf
			if Follower03.getRef() != none && (Follower03.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower03.getRef() as actor) as objectreference, none)
				debug.sendAnimationEvent((Follower03.getRef() as actor) as objectreference, "IdleCartExitInstant")
			endIf
			if Follower04.getRef() != none && (Follower04.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower04.getRef() as actor) as objectreference, none)
				debug.sendAnimationEvent((Follower04.getRef() as actor) as objectreference, "IdleCartExitInstant")
			endIf
			if Follower05.getRef() != none && (Follower05.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower05.getRef() as actor) as objectreference, none)
				debug.sendAnimationEvent((Follower05.getRef() as actor) as objectreference, "IdleCartExitInstant")
			endIf
			if Follower06.getRef() != none && (Follower06.getRef() as actor).getAV("WaitingForPlayer") == 0.0
				FollowerRoutine.Cast((Follower06.getRef() as actor) as objectreference, none)
				debug.sendAnimationEvent((Follower06.getRef() as actor) as objectreference, "IdleCartExitInstant")
			endIf
		endIf
	elseIf AutoChill == true
		GLBautoChill.setValue(50.0)
		utility.wait(3.0)
		if Follower01.getRef() != none && (Follower01.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower01.getRef() as actor).getDistance(player as objectreference) > 1024.0
			Follower01.getRef().setposition(player.getPositionX() + utility.randomInt(32, 128) as Float * math.sin(player.getAngleZ()), player.getPositionY() + utility.randomInt(32, 128) as Float * math.cos(player.getAngleZ()), player.getPositionZ())
			debug.sendAnimationEvent((Follower01.getRef() as actor) as objectreference, "IdleCartExitInstant")
		endIf
		if Follower02.getRef() != none && (Follower02.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower02.getRef() as actor).getDistance(player as objectreference) > 1024.0
			Follower02.getRef().setposition(player.getPositionX() + utility.randomInt(32, 128) as Float * math.sin(player.getAngleZ()), player.getPositionY() + utility.randomInt(32, 128) as Float * math.cos(player.getAngleZ()), player.getPositionZ())
			debug.sendAnimationEvent((Follower02.getRef() as actor) as objectreference, "IdleCartExitInstant")
		endIf
		if Follower03.getRef() != none && (Follower03.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower03.getRef() as actor).getDistance(player as objectreference) > 1024.0
			Follower03.getRef().setposition(player.getPositionX() + utility.randomInt(32, 128) as Float * math.sin(player.getAngleZ()), player.getPositionY() + utility.randomInt(32, 128) as Float * math.cos(player.getAngleZ()), player.getPositionZ())
			debug.sendAnimationEvent((Follower03.getRef() as actor) as objectreference, "IdleCartExitInstant")
		endIf
		if Follower04.getRef() != none && (Follower04.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower04.getRef() as actor).getDistance(player as objectreference) > 1024.0
			Follower04.getRef().setposition(player.getPositionX() + utility.randomInt(32, 128) as Float * math.sin(player.getAngleZ()), player.getPositionY() + utility.randomInt(32, 128) as Float * math.cos(player.getAngleZ()), player.getPositionZ())
			debug.sendAnimationEvent((Follower04.getRef() as actor) as objectreference, "IdleCartExitInstant")
		endIf
		if Follower05.getRef() != none && (Follower05.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower05.getRef() as actor).getDistance(player as objectreference) > 1024.0
			Follower05.getRef().setposition(player.getPositionX() + utility.randomInt(32, 128) as Float * math.sin(player.getAngleZ()), player.getPositionY() + utility.randomInt(32, 128) as Float * math.cos(player.getAngleZ()), player.getPositionZ())
			debug.sendAnimationEvent((Follower05.getRef() as actor) as objectreference, "IdleCartExitInstant")
		endIf
		if Follower06.getRef() != none && (Follower06.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower06.getRef() as actor).getDistance(player as objectreference) > 1024.0
			Follower06.getRef().setposition(player.getPositionX() + utility.randomInt(32, 128) as Float * math.sin(player.getAngleZ()), player.getPositionY() + utility.randomInt(32, 128) as Float * math.cos(player.getAngleZ()), player.getPositionZ())
			debug.sendAnimationEvent((Follower06.getRef() as actor) as objectreference, "IdleCartExitInstant")
		endIf
		AutoChill = false
	endIf
endFunction


function OnTranslationComplete()
	TranslationCompleted = true
endFunction


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

function Initialize()
	ThirdPerson = game.GetCameraState()
	if CameraAction.getValue() == 50.0
		(Camera as advsitfast_camera).CinematicAction()
	endIf
	self.RegisterForControl("Toggle POV")
	DELAYfailsave = utility.getCurrentRealTime() + 15.0
	utility.wait(0.1)
	if CameraAction.getValue() != 50.0
		game.forceThirdPerson()
	endIf
	if GetFurniture == "Ground" || CameraAction.getValue() == 50.0
		game.ENABLEPLAYERCONTROLS(0 as Bool, 0 as Bool, 0 as Bool, 1 as Bool, 0 as Bool, 0 as Bool, 0 as Bool, 0 as Bool, 0)
	endIf
	if GetType == "Sit" || GetType == "Ledge" || GetType == "Charge" || GetType == "Alas"
		if GetFurniture == "Ground"
			SFXvolume = SFXsit.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 1.0)
			if GetType == "Ledge"
				debug.sendAnimationEvent(player as objectreference, "IdleSitLedgeEnter")
			elseIf GetType == "Sit"
				if SETmeditate == false
					debug.sendAnimationEvent(player as objectreference, "IdleSitCrossLeggedEnter")
				else
					debug.sendAnimationEvent(player as objectreference, "IdleGreybeardMeditateEnter")
				endIf
			elseIf GetType == "Charge"
				debug.sendAnimationEvent(player as objectreference, "IdleBlessingKneelEnter")
			elseIf GetType == "Alas"
				debug.sendAnimationEvent(player as objectreference, "IdlePrayCrouchedEnter")
			endIf
			utility.wait(0.85)
			if SETdontModCamera == false
				if GetType == "Ledge"
					utility.SetINIFloat("fOverShoulderPosz:Camera", (CameraHeight - 32) as Float)
				elseIf GetType == "Sit" || GetType == "Charge" || GetType == "Alas"
					utility.SetINIFloat("fOverShoulderPosz:Camera", CameraHeight as Float)
				endIf
				utility.SetINIFloat("fOverShoulderPosx:Camera", CameraX as Float)
				utility.wait(0.1)
				game.UpdateThirdPerson()
			endIf
			if GetType != "Alas"
				if player.hasMagicEffect(MEsitbuff) == false
					if SETbuffPlayer == true
						GLBbuffPlayer.setValue(100.0)
					else
						GLBbuffPlayer.setValue(0.0)
					endIf
					BUFFsit.Cast(player as objectreference, none)
				endIf
			endIf
			utility.wait(0.25)
			if SETpuffOffSmoke == true
				if player.IsInInterior() == false
					player.placeAtme(PuffOffSmoke as form, 1, false, false)
				endIf
			endIf
			if SETshakeController == true
				game.ShakeController(0.15, 0.15, 0.5)
			endIf
			if SETShakeCamera == true && CameraAction.getValue() != 50.0
				game.ShakeCamera(none, 0.5, 0.25)
			endIf
			while player.getSitState() != 3 && AllowProcessing == true
				if GetType == "Ledge"
					
				elseIf GetType == "Sit"
					if SETmeditate == false
						
					endIf
				elseIf GetType == "Charge"
					
				elseIf GetType == "Alas"
					
				endIf
				utility.wait(0.2)
			endWhile
			if AllowProcessing == true
				if GetType != "Charge" && GetType != "Alas"
					if HoldCrouch == true
						self.RegisterForControl("Sneak")
					else
						self.RegisterForKey(UserKey)
					endIf
					self.RegisterForControl("Forward")
					self.RegisterForControl("Back")
					self.RegisterForControl("Strafe Left")
					self.RegisterForControl("Strafe Right")
					self.GotoState("ListenInput")
					game.ENABLEPLAYERCONTROLS(1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 0)
				else
					if GetType == "Charge"
						utility.wait(3.5)
					elseIf GetType == "Alas"
						utility.wait(1.75000)
						utility.wait(1.75000)
					endIf
					self.Wake()
				endIf
			endIf
		elseIf GetFurniture == "Chair"
			self.GotoState("AutoPilot")
			game.ENABLEPLAYERCONTROLS(1 as Bool, 0 as Bool, 0 as Bool, 0 as Bool, 1 as Bool, 0 as Bool, 0 as Bool, 0 as Bool, 0)
			if HoldCrouch == true
				self.RegisterForControl("Sneak")
			else
				self.RegisterForKey(UserKey)
			endIf
			while CameraAction.getValue() == 50.0 && (Camera as advsitfast_camera).Ready == false && AllowProcessing == true
				utility.wait(0.1)
			endWhile
			while player.getCurrentPackage() != PACKuseChair && AllowProcessing == true
				GLBfindChair.setValue(100.0)
				player.evaluatePackage()
				utility.wait(0.15)
			endWhile
			while player.getSitState() != 2 && AllowProcessing == true
				utility.wait(0.1)
			endWhile
			if AllowProcessing == true
				if SETdontModCamera == false && CameraAction.getValue() != 50.0
					utility.SetINIFloat("fOverShoulderPosz:Camera", CameraHeightSitFurniture as Float)
					utility.SetINIFloat("fOverShoulderPosx:Camera", CameraX as Float)
					utility.wait(0.1)
					game.UpdateThirdPerson()
				endIf
				SFXvolume = SFXsit.play(player as objectreference)
				sound.SetInstanceVolume(SFXvolume, 1.0)
				while player.getSitState() != 3 && AllowProcessing == true
					utility.wait(0.2)
				endWhile
				if AllowProcessing == true
					if CameraAction.getValue() == 25.0
						(Camera as advsitfast_camera).SilentAction()
					endIf
					if player.hasMagicEffect(MEsitbuff) == false
						if SETbuffPlayer == true
							GLBbuffPlayer.setValue(100.0)
						else
							GLBbuffPlayer.setValue(0.0)
						endIf
						BUFFsit.Cast(player as objectreference, none)
					endIf
					self.RegisterForControl("Forward")
					self.RegisterForControl("Back")
					self.RegisterForControl("Strafe Left")
					self.RegisterForControl("Strafe Right")
					self.GotoState("ListenInput")
					game.ENABLEPLAYERCONTROLS(1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 0)
				endIf
			endIf
		endIf
	elseIf GetType == "Relax"
		if GetFurniture == "Ground"
			SFXvolume = SFXsit.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 1.0)
			player.clearlookat()
			debug.sendAnimationEvent(player as objectreference, "IdleLayDownEnter")
			utility.wait(0.85)
			if SETdontModCamera == false && CameraAction.getValue() != 50.0
				utility.SetINIFloat("fOverShoulderPosz:Camera", CameraHeight as Float)
				utility.SetINIFloat("fOverShoulderPosx:Camera", CameraX as Float)
				utility.wait(0.1)
				game.UpdateThirdPerson()
			endIf
			utility.wait(0.25)
			if SETpuffOffSmoke == true
				if player.IsInInterior() == false
					player.placeAtme(PuffOffSmoke as form, 1, false, false)
				endIf
			endIf
			if SETshakeController == true
				game.ShakeController(0.15, 0.15, 0.5)
			endIf
			if SETShakeCamera == true && CameraAction.getValue() != 50.0
				game.ShakeCamera(none, 0.5, 0.25)
			endIf
			while player.getSitState() != 3 && AllowProcessing == true
				utility.wait(0.1)
			endWhile
			if AllowProcessing == true
				if ActionScript == none
					ActionScript = player.placeAtme(REFActionScript as form, 1, true, true)
					(ActionScript as advsitfast_actionscript).Initialize()
				else
					ActionScript.moveTo(player as objectreference, 0.0, 0.0, 0.0, true)
					(ActionScript as advsitfast_actionscript).Initialize()
				endIf
				if player.hasMagicEffect(MEsitbuff) == false
					if SETbuffPlayer == true
						GLBbuffPlayer.setValue(100.0)
					else
						GLBbuffPlayer.setValue(0.0)
					endIf
					BUFFsit.Cast(player as objectreference, none)
				endIf
				self.GotoState("Bed")
				game.ENABLEPLAYERCONTROLS(1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 0)
			endIf
		elseIf GetFurniture == "Bed"
			self.GotoState("AutoPilot")
			game.ENABLEPLAYERCONTROLS(1 as Bool, 0 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 0 as Bool, 0 as Bool, 0)
			if HoldCrouch == true
				self.RegisterForControl("Sneak")
			else
				self.RegisterForKey(UserKey)
			endIf
			while player.getCurrentPackage() != PACKuseBed && AllowProcessing == true
				GLBfindBed.setValue(100.0)
				player.evaluatePackage()
				utility.wait(0.15)
			endWhile
			if AllowProcessing == true
				while player.getSleepState() != 2 && AllowProcessing == true
					utility.wait(0.1)
				endWhile
			endIf
			if AllowProcessing == true
				SFXvolume = SFXsit.play(player as objectreference)
				sound.SetInstanceVolume(SFXvolume, 1.0)
				if SETdontModCamera == false && CameraAction.getValue() != 50.0
					utility.SetINIFloat("fOverShoulderPosz:Camera", CameraHeightSitFurniture as Float)
					utility.SetINIFloat("fOverShoulderPosx:Camera", CameraX as Float)
					utility.wait(0.1)
					game.UpdateThirdPerson()
				endIf
				if HoldCrouch == true
					self.UnregisterForControl("Sneak")
				else
					self.UnregisterForKey(UserKey)
				endIf
				while player.getSleepState() != 3 && player.getCurrentPackage() == PACKuseBed && AllowProcessing == true
					utility.wait(0.2)
				endWhile
				if AllowProcessing == true
					if CameraAction.getValue() == 25.0
						(Camera as advsitfast_camera).SilentAction()
					endIf
					if ActionScript == none
						ActionScript = player.placeAtme(REFActionScript as form, 1, true, true)
						(ActionScript as advsitfast_actionscript).Initialize()
					else
						ActionScript.moveTo(player as objectreference, 0.0, 0.0, 0.0, true)
						(ActionScript as advsitfast_actionscript).Initialize()
					endIf
					if player.hasMagicEffect(MEsitbuff) == false
						if SETbuffPlayer == true
							GLBbuffPlayer.setValue(100.0)
						else
							GLBbuffPlayer.setValue(0.0)
						endIf
						BUFFsit.Cast(player as objectreference, none)
					endIf
					self.GotoState("Bed")
					game.ENABLEPLAYERCONTROLS(1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 0)
				endIf
			endIf
		endIf
	elseIf GetType == "Lean"
		if CameraAction.getValue() == 25.0
			(Camera as advsitfast_camera).SilentAction()
		endIf
		game.forceThirdPerson()
		if SETdontModCamera == false && CameraAction.getValue() != 50.0
			utility.SetINIFloat("fOverShoulderPosx:Camera", 0.0)
			utility.wait(0.1)
			game.UpdateThirdPerson()
		endIf
		utility.wait(0.1)
		debug.sendAnimationEvent(player as objectreference, "IdleWallLeanStart")
		utility.wait(0.25)
		SFXvolume = SFXlean.play(player as objectreference)
		sound.SetInstanceVolume(SFXvolume, 1.0)
		if player.hasMagicEffect(MEsitbuff) == false
			if SETbuffPlayer == true
				GLBbuffPlayer.setValue(100.0)
			else
				GLBbuffPlayer.setValue(0.0)
			endIf
			BUFFsit.Cast(player as objectreference, none)
		endIf
		while player.getSitState() != 3 && AllowProcessing == true
			utility.wait(0.1)
		endWhile
		if AllowProcessing == true
			if HoldCrouch == true
				self.RegisterForControl("Sneak")
			else
				self.RegisterForKey(UserKey)
			endIf
			if player.hasMagicEffect(MEsitbuff) == false
				if SETbuffPlayer == true
					GLBbuffPlayer.setValue(100.0)
				else
					GLBbuffPlayer.setValue(0.0)
				endIf
				BUFFsit.Cast(player as objectreference, none)
			endIf
			self.RegisterForControl("Forward")
			self.RegisterForControl("Back")
			self.RegisterForControl("Strafe Left")
			self.RegisterForControl("Strafe Right")
			self.GotoState("ListenInput")
			game.ENABLEPLAYERCONTROLS(1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 0)
		endIf
	endIf
	if GetType != "Charge" && GetType != "Alas"
		;if TUTORIALtoggleHud == false
		;	utility.wait(2.0)
		;	(Master as advsitfast_generic).ShowHelp("TOGGLEhud")
		;endIf
		
		if Follower01.getRef() != none && (Follower01.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower01.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower01.getRef() as actor) as objectreference, none)
		endIf
		if Follower02.getRef() != none && (Follower02.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower02.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower02.getRef() as actor) as objectreference, none)
		endIf
		if Follower03.getRef() != none && (Follower03.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower03.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower03.getRef() as actor) as objectreference, none)
		endIf
		if Follower04.getRef() != none && (Follower04.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower04.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower04.getRef() as actor) as objectreference, none)
		endIf
		if Follower05.getRef() != none && (Follower05.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower05.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower05.getRef() as actor) as objectreference, none)
		endIf
		if Follower06.getRef() != none && (Follower06.getRef() as actor).getAV("WaitingForPlayer") == 0.0 && (Follower06.getRef() as actor).hasMagicEffect(MEfollowerRoutine) == false
			FollowerRoutine.Cast((Follower06.getRef() as actor) as objectreference, none)
		endIf
	elseIf GetType == "Charge"
		if Follower01.getRef() != none && (Follower01.getRef() as actor).getAV("WaitingForPlayer") == 0.0
			SPELLcharge.Cast((Follower01.getRef() as actor) as objectreference, none)
		endIf
		if Follower02.getRef() != none && (Follower02.getRef() as actor).getAV("WaitingForPlayer") == 0.0
			SPELLcharge.Cast((Follower02.getRef() as actor) as objectreference, none)
		endIf
		if Follower03.getRef() != none && (Follower03.getRef() as actor).getAV("WaitingForPlayer") == 0.0
			SPELLcharge.Cast((Follower03.getRef() as actor) as objectreference, none)
		endIf
		if Follower04.getRef() != none && (Follower04.getRef() as actor).getAV("WaitingForPlayer") == 0.0
			SPELLcharge.Cast((Follower04.getRef() as actor) as objectreference, none)
		endIf
		if Follower05.getRef() != none && (Follower05.getRef() as actor).getAV("WaitingForPlayer") == 0.0
			SPELLcharge.Cast((Follower05.getRef() as actor) as objectreference, none)
		endIf
		if Follower06.getRef() != none && (Follower06.getRef() as actor).getAV("WaitingForPlayer") == 0.0
			SPELLcharge.Cast((Follower06.getRef() as actor) as objectreference, none)
		endIf
	endIf
endFunction


function Abort()
	if player.getSleepState() == 0 && player.getSitState() == 0 || Failsave == true
		Failsave = false
		WakingUp = true
		AllowProcessing = false
		GLBAllowProcessing.setValue(0.0)
		game.DisablePlayerControls(1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0)
		if HoldCrouch == true
			self.UnregisterForControl("Sneak")
		else
			self.UnregisterForKey(UserKey)
		endIf
		if player.hasMagicEffect(MEsitbuff) == true
			player.dispelSpell(BUFFsit)
		endIf
		debug.sendAnimationEvent(player as objectreference, "IdleSurrender")
		SFXvolume = SFXabort.play(player as objectreference)
		sound.SetInstanceVolume(SFXvolume, 1.0)
		SFXvolume = SFXexplosion.play(player as objectreference)
		sound.SetInstanceVolume(SFXvolume, 0.25)
		IMODsitready.apply(2.0)
		if SETshakeController == true
			game.ShakeController(0.15, 0.15, 0.5)
		endIf
		if SETShakeCamera == true
			game.ShakeCamera(none, 0.5, 0.5)
		endIf
		while player.getCurrentPackage() == PACKuseChair
			GLBfindChair.setValue(-100.0)
			player.evaluatePackage()
			utility.wait(0.15)
		endWhile
		while player.getCurrentPackage() == PACKuseBed
			GLBfindBed.setValue(-100.0)
			player.evaluatePackage()
			utility.wait(0.15)
		endWhile
		game.setCameraTarget(player)
		if ThirdPerson != 0
			utility.wait(0.5)
			debug.sendAnimationEvent(player as objectreference, "IdleCartExitInstant")
		endIf
		self.RestoreCamera()
		self.TERMINATE()
	endIf
endFunction


function RestoreCamera()
	while utility.IsInMenuMode()
		utility.wait(0.25)
	endWhile
	while utility.getINIFloat("fOverShoulderPosz:Camera") != ReturnINIsettingZMaster
		utility.SetINIFloat("fOverShoulderPosz:Camera", ReturnINIsettingZMaster)
	endWhile
	while utility.getINIFloat("fOverShoulderPosx:Camera") != ReturnINIsettingXMaster
		utility.SetINIFloat("fOverShoulderPosx:Camera", ReturnINIsettingXMaster)
	endWhile
	game.UpdateThirdPerson()
	;debug.notification("Camera restored")
endFunction


function RefreshCamera()
	utility.SetINIFloat("fOverShoulderPosz:Camera", CameraHeight as Float)
	utility.SetINIFloat("fOverShoulderPosx:Camera", CameraX as Float)
	utility.wait(0.25)
	debug.notification("Vertical: " + CameraHeight as String + " Horizontal: " + CameraX as String)
	game.UpdateThirdPerson()
endFunction


function Uninstall()
	BUTTON = MSGuninstall.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
	if BUTTON == 0
		if Follower01.getRef() != none
			PMSGREEN.play(Follower01.getRef(), 1.0)
			(Follower01 as advsitfast_followerv2).TERMINATE()
			utility.wait(0.1)
			Follower01.clear()
			utility.wait(0.1)
		endIf
		if Follower02.getRef() != none
			PMSGREEN.play(Follower02.getRef(), 1.0)
			(Follower02 as advsitfast_followerv2).TERMINATE()
			utility.wait(0.1)
			Follower02.clear()
			utility.wait(0.1)
		endIf
		if Follower03.getRef() != none
			PMSGREEN.play(Follower03.getRef(), 1.0)
			(Follower03 as advsitfast_followerv2).TERMINATE()
			utility.wait(0.1)
			Follower03.clear()
			utility.wait(0.1)
		endIf
		if Follower04.getRef() != none
			PMSGREEN.play(Follower04.getRef(), 1.0)
			(Follower04 as advsitfast_followerv2).TERMINATE()
			utility.wait(0.1)
			Follower04.clear()
			utility.wait(0.1)
		endIf
		if Follower05.getRef() != none
			PMSGREEN.play(Follower05.getRef(), 1.0)
			(Follower05 as advsitfast_followerv2).TERMINATE()
			utility.wait(0.1)
			Follower05.clear()
			utility.wait(0.1)
		endIf
		if Follower06.getRef() != none
			PMSGREEN.play(Follower06.getRef(), 1.0)
			(Follower06 as advsitfast_followerv2).TERMINATE()
			utility.wait(0.1)
			Follower06.clear()
			utility.wait(0.1)
		endIf
		utility.wait(0.5)
		if player.HasSpell(SpellRegister as form) == 1 as Bool
			player.removespell(SpellRegister)
		endIf
		Running = false
		self.UnregisterForControl("Sneak")
		self.UnregisterForKey(UserKey)
		self.unregisterForUpdate()
		if SETshakeController == true
			game.ShakeController(0.5, 0.5, 0.5)
		endIf
		game.ShakeCamera(none, 0.85, 1.0)
		SFXexplosion.play(player as objectreference)
		utility.wait(1.0)
		debug.notification("FastSit & Relax stopped.")
		Master.stop()
	endIf
endFunction


function TERMINATE()
	self.UnregisterForControl("Toggle POV")
	DELAYwait = 0.0
	if CameraAction.getValue() != 0.0 && player.isInCombat() == true
		(Camera as advsitfast_camera).cinematic = false
		(Camera as advsitfast_camera).Finish()
	endIf
	AllowProcessing = false
	GLBAllowProcessing.setValue(0.0)
	DELAYfailsave = utility.getCurrentRealTime() + 15.0
	game.SetPlayerAIDriven(false)
	GLBfindChair.setValue(0.0)
	GLBfindBed.setValue(0.0)
	player.evaluatePackage()
	if CameraAction.getValue() == 50.0
		(Camera as advsitfast_camera).Finish()
	endIf
	if player.isInCombat() == true
		if player.getSitState() != 0
			debug.sendAnimationEvent(player as objectreference, "IdleCartExitInstant")
		endIf
		if player.getSleepState() != 0
			player.moveTo(player as objectreference, 0.0, 0.0, 0.0, true)
		endIf
	endIf
	if player.HasSpell(SpellRegister as form) == 1 as Bool
		player.removespell(SpellRegister)
		self.UnregisterForControl("Ready Weapon")
	endIf
	if CameraAction.getValue() != 50.0
		while utility.getINIFloat("fOverShoulderPosz:Camera") != ReturnINIsettingZ
			utility.SetINIFloat("fOverShoulderPosz:Camera", ReturnINIsettingZ)
		endWhile
		while utility.getINIFloat("fOverShoulderPosx:Camera") != ReturnINIsettingX
			utility.SetINIFloat("fOverShoulderPosx:Camera", ReturnINIsettingX)
		endWhile
		utility.wait(0.1)
		game.UpdateThirdPerson()
	endIf
	while player.getSitState() != 0 || player.getSleepState() != 0 && utility.getCurrentRealTime() < DELAYfailsave && AllowProcessing == true
		utility.wait(0.2)
	endWhile
	if CameraAction.getValue() == 25.0
		(Camera as advsitfast_camera).Finish()
	endIf
	if utility.getCurrentRealTime() > DELAYfailsave && AllowProcessing == false
		debug.sendAnimationEvent(player as objectreference, "IdleCartExitInstant")
		player.moveTo(player as objectreference, 0.0, 0.0, 0.0, true)
	endIf
	if player.isInCombat() == false && GetFurniture == "Ground"
		utility.wait(0.25)
	endIf
	if ThirdPerson == 0
		debug.sendAnimationEvent(player as objectreference, "IdleCartExitInstant")
		utility.wait(0.15)
		SWITCH = true
		game.forceFirstPerson()
	else
		SWITCH = false
	endIf
	if GetType == "Lean" || GetType == "Ledge"
		player.setAngle(0.0, 0.0, player.getAngleZ())
	endIf
	if CameraAction.getValue() == -100.0 || SWITCH == true
		game.FadeOutGame(false, true, 0.0, 0.5)
		CameraAction.setValue(0.0)
	endIf
	game.ENABLEPLAYERCONTROLS(true, true, true, true, true, true, true, true, 0)
	if player.isInCombat() == true
		utility.wait(0.25)
		player.drawWeapon()
	endIf
	
	(ActionScript as advsitfast_actionscript).TERMINATE()
	game.SetInChargen(false, false, false)
	game.SetHudCartMode(false)
	TOGGLEhud = 0
	
	if HoldCrouch == true
		self.RegisterForControl("Sneak")
	else
		self.RegisterForKey(UserKey)
	endIf
	
	self.UnregisterForControl("Jump")
	Online = false
	self.GotoState("Null")
endFunction


function RefreshListening()
	if utility.getCurrentRealTime() > TIMERrefresh || TIMERrefresh == 0.0
		if player.HasSpell(SpellRegister as form) == 1 as Bool
			player.removespell(SpellRegister)
			self.UnregisterForControl("Ready Weapon")
		endIf
		if HoldCrouch == true
			self.UnregisterForControl("Sneak")
		else
			self.UnregisterForKey(UserKey)
		endIf
		utility.wait(0.1)
		if HoldCrouch == true
			self.RegisterForControl("Sneak")
		else
			self.RegisterForKey(UserKey)
		endIf
		TIMERrefresh = utility.getCurrentRealTime() + 500.0
	else
		Float temp = TIMERrefresh - utility.getCurrentRealTime()
		if temp > 500.0 || temp < 0.0
			TIMERrefresh = 0.0
			self.RefreshListening()
		endIf
	endIf
endFunction


function Reboot()
	while utility.IsInMenuMode()
		utility.wait(0.5)
	endWhile
	Master.reset()
	utility.wait(0.25)
	ReturnINIsettingZMaster = utility.getINIFloat("fOverShoulderPosz:Camera")
	ReturnINIsettingXMaster = utility.getINIFloat("fOverShoulderPosx:Camera")
	Master.start()
	Master.RegisterForControl("Sneak")
	player = game.GetPlayer()
	PMSGREEN.play(player as objectreference, 3.0)
	TIMERrefresh = 0.0
	self.RefreshListening()
	Running = true
	debug.notification("FastSit & Relax re-initialized.")
endFunction


; Skipped compiler generated GotoState

function FindFurniture(String type)
	while player.getCurrentPackage() == PACKuseChair
		GLBfindChair.setValue(-100.0)
		player.evaluatePackage()
		utility.wait(0.15)
	endWhile
	while player.getCurrentPackage() == PACKuseBed
		GLBfindBed.setValue(-100.0)
		player.evaluatePackage()
		utility.wait(0.15)
	endWhile
	GetType = type
	if type == "Sit"
		GLBgetType.setValue(1.0)
	elseIf type == "Relax"
		GLBgetType.setValue(2.0)
	elseIf type == "Ledge"
		GLBgetType.setValue(3.0)
	elseIf type == "Lean"
		GLBgetType.setValue(4.0)
	elseIf type == "Alas"
		GLBgetType.setValue(5.0)
	elseIf type == "Charge"
		GLBgetType.setValue(6.0)
	endIf
	if player.IsWeaponDrawn() == true
		player.SheatheWeapon()
		BLOCKfurniture = true
	endIf
	if AllowFurniture == false
		BLOCKfurniture = true
	endIf
	if type == "Sit"
		if BLOCKfurniture == false
			GLBfindChair.setValue(50.0)
			player.evaluatePackage()
		else
			GLBgetFurniture.setValue(0.0)
			GetFurniture = "Ground"
		endIf
	elseIf type == "Relax"
		if BLOCKfurniture == false
			GLBfindBed.setValue(50.0)
			player.evaluatePackage()
		else
			GLBgetFurniture.setValue(0.0)
			GetFurniture = "Ground"
		endIf
	elseIf type == "Ledge"
		GLBgetFurniture.setValue(0.0)
		GetFurniture = "Ground"
	elseIf type == "Lean"
		GLBgetFurniture.setValue(0.0)
		GetFurniture = "Ground"
	elseIf type == "Alas"
		GLBgetFurniture.setValue(0.0)
		GetFurniture = "Ground"
	elseIf type == "Charge"
		GLBgetFurniture.setValue(0.0)
		GetFurniture = "Ground"
	endIf
	
	;game.SetHudCartMode(true)
	;TOGGLEhud = 1
	player.evaluatePackage()
	Online = true
	self.RegisterForControl("Jump")
	game.DisablePlayerControls(1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0)
	game.SetPlayerAIDriven(true)
	game.SetInChargen(true, false, false)
	
	if SETdontModCamera == false && type != "Charge" && type != "Alas"
		ReturnINIsettingZ = utility.getINIFloat("fOverShoulderPosz:Camera")
		ReturnINIsettingX = utility.getINIFloat("fOverShoulderPosx:Camera")
	endIf
	while GLBfindBed.getValue() == 50.0 || GLBfindChair.getValue() == 50.0
		utility.wait(0.1)
	endWhile
	WakingUp = false
	if type != "Charge" && type != "Alas"
		(Camera as advsitfast_camera).Validate(GetType, GetFurniture)
	endIf
	BLOCKfurniture = false
	while player.IsWeaponDrawn() == true
		utility.wait(0.333000)
		player.SheatheWeapon()
	endWhile
	AllowProcessing = true
	GLBAllowProcessing.setValue(100.0)
	self.Initialize()
endFunction


function Perform(String type)
	if player.isInCombat() == true
		debug.notification("You should not sit around while in combat!")
		if GLBSETallowVoice.getValue() != 0.0
			player.say(Nope, none, false)
		endIf
		LISTEN01.setValue(0.0)
	else
		if type == "Primary"
			if LISTEN04.getValue() == 200.0
				if HoldCrouch == true
					self.UnregisterForControl("Sneak")
				else
					self.UnregisterForKey(UserKey)
				endIf
				if player.getAngleX() > 60.0 || player.getAngleX() == 60.0
					self.FindFurniture("Ledge")
				elseIf player.getAngleX() < -45.0 || player.getAngleX() == -45.0
					self.FindFurniture("Lean")
				else
					self.FindFurniture("Sit")
				endIf
			endIf
		elseIf type == "Secondary"
			if HoldCrouch == true
				if LISTEN01.getValue() == 100.0 && LISTEN02.getValue() == 100.0 && LISTEN03.getValue() == 100.0 && player.getAV("Variable05") == 0.0
					self.UnregisterForControl("Sneak")
					if player.getAngleX() > 60.0 || player.getAngleX() == 60.0
						SPELLcharge.Cast(player as objectreference, none)
						GLBgetType.setValue(6.0)
						game.FadeOutGame(false, true, 0.0, 1.0)
						if SETShakeCamera == true
							game.ShakeCamera(none, 0.25, 5.0)
						endIf
						ReturnINIsettingX = utility.getINIFloat("fOverShoulderPosx:Camera")
						utility.SetINIFloat("fOverShoulderPosx:Camera", 0.0)
						AllowProcessing = true
						game.UpdateThirdPerson()
						(Camera as advsitfast_camera).ChargeCam()
						self.FindFurniture("Charge")
					elseIf player.getAngleX() < -45.0 || player.getAngleX() == -45.0
						game.FadeOutGame(false, true, 0.0, 1.0)
						ReturnINIsettingX = utility.getINIFloat("fOverShoulderPosx:Camera")
						utility.SetINIFloat("fOverShoulderPosx:Camera", 0.0)
						AllowProcessing = true
						game.UpdateThirdPerson()
						(Camera as advsitfast_camera).ChargeCam()
						self.FindFurniture("Alas")
					else
						self.FindFurniture("Relax")
					endIf
				endIf
			else
				self.UnregisterForKey(UserKey)
				if player.getAngleX() > 60.0 || player.getAngleX() == 60.0
					SPELLcharge.Cast(player as objectreference, none)
					GLBgetType.setValue(6.0)
					game.FadeOutGame(false, true, 0.0, 1.0)
					if SETShakeCamera == true
						game.ShakeCamera(none, 0.25, 5.0)
					endIf
					ReturnINIsettingX = utility.getINIFloat("fOverShoulderPosx:Camera")
					utility.SetINIFloat("fOverShoulderPosx:Camera", 0.0)
					game.UpdateThirdPerson()
					(Camera as advsitfast_camera).ChargeCam()
					self.FindFurniture("Charge")
				elseIf player.getAngleX() < -45.0 || player.getAngleX() == -45.0
					game.FadeOutGame(false, true, 0.0, 1.0)
					ReturnINIsettingX = utility.getINIFloat("fOverShoulderPosx:Camera")
					utility.SetINIFloat("fOverShoulderPosx:Camera", 0.0)
					game.UpdateThirdPerson()
					(Camera as advsitfast_camera).ChargeCam()
					self.FindFurniture("Alas")
				else
					self.FindFurniture("Relax")
				endIf
			endIf
		endIf
		LISTEN01.setValue(0.0)
	endIf
	self.RegisterForControl("Ready Weapon")
endFunction


function Wake()
	WakingUp = true
	player.clearlookat()
	PChasUsedSleepMenu = false
	if HoldCrouch == true
		self.UnregisterForControl("Sneak")
	else
		self.UnregisterForKey(UserKey)
	endIf
	(Camera as advsitfast_camera).UnregisterForControl("Right Attack/Block")
	(Camera as advsitfast_camera).UnregisterForControl("Left Attack/Block")
	self.UnregisterForControl("Forward")
	self.UnregisterForControl("Back")
	self.UnregisterForControl("Strafe Left")
	self.UnregisterForControl("Strafe Right")
	if player.hasMagicEffect(MEsitbuff) == true
		player.dispelSpell(BUFFsit)
	endIf
	game.DisablePlayerControls(1 as Bool, 1 as Bool, 1 as Bool, 0 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 1 as Bool, 0)
	if GetType == "Sit" || GetType == "Ledge" || GetType == "Lean"
		if GetFurniture == "Ground"
			if GetType == "Sit" || GetType == "Ledge"
				SFXvolume = SFXstand.play(player as objectreference)
				sound.SetInstanceVolume(SFXvolume, 1.0)
				debug.sendAnimationEvent(player as objectreference, "IdleChairExitStart")
				utility.wait(0.25)
				if SETshakeController == true
					game.ShakeController(0.15, 0.15, 0.5)
				endIf
				if SETShakeCamera == true && CameraAction.getValue() != 50.0
					game.ShakeCamera(none, 0.4, 1.0)
				endIf
			elseIf GetType == "Lean"
				SFXvolume = SFXstand.play(player as objectreference)
				sound.SetInstanceVolume(SFXvolume, 0.25)
				debug.sendAnimationEvent(player as objectreference, "IdleChairExitStart")
			endIf
			utility.wait(0.75)
			self.TERMINATE()
		elseIf GetFurniture == "Chair"
			while player.getSitState() != 0 && player.getSitState() == 3
				GLBfindChair.setValue(-100.0)
				utility.wait(0.5)
				player.evaluatePackage()
			endWhile
			self.TERMINATE()
		endIf
	elseIf GetType == "Relax"
		if GetFurniture == "Ground"
			SFXvolume = SFXstand.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 1.0)
			debug.sendAnimationEvent(player as objectreference, "IdleChairExitStart")
			utility.wait(0.25)
			if SETshakeController == true
				game.ShakeController(0.15, 0.15, 0.5)
			endIf
			if SETShakeCamera == true && CameraAction.getValue() != 50.0
				game.ShakeCamera(none, 0.4, 1.0)
			endIf
			utility.wait(0.75)
			self.TERMINATE()
		elseIf GetFurniture == "Bed"
			if player.getSleepState() != 0
				SFXvolume = SFXstand.play(player as objectreference)
				sound.SetInstanceVolume(SFXvolume, 1.0)
				while player.getSleepState() != 0 && player.getSleepState() == 3
					GLBfindBed.setValue(-100.0)
					player.evaluatePackage()
					utility.wait(0.5)
				endWhile
				self.TERMINATE()
			else
				SFXvolume = SFXstand.play(player as objectreference)
				sound.SetInstanceVolume(SFXvolume, 1.0)
				debug.sendAnimationEvent(player as objectreference, "IdleChairExitStart")
				utility.wait(0.25)
				if SETshakeController == true
					game.ShakeController(0.15, 0.15, 0.5)
				endIf
				if SETShakeCamera == true && CameraAction.getValue() != 50.0
					game.ShakeCamera(none, 0.4, 1.0)
				endIf
				utility.wait(0.75)
				self.TERMINATE()
			endIf
		endIf
	elseIf GetType == "Charge" || GetType == "Alas"
		if GetType == "Alas"
			if AlasHappy != 0
				MUSreward.add()
				BUFFsit.Cast(player as objectreference, none)
			elseIf ALASONCE == false
				MUSreward.add()
				debug.messagebox("This cool feature will be implemented with the next content update... stay tuned!")
				ALASONCE = true
			else
				MUSfail.add()
				debug.messagebox("Alas, nothing happens...")
				SFXfail.play(player as objectreference)
				game.ShakeCamera(none, 1.0, 1.0)
			endIf
			SFXvolume = SFXstand.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 0.25)
			debug.sendAnimationEvent(player as objectreference, "IdleChairExitStart")
			utility.wait(0.5)
		endIf
		while utility.getINIFloat("fOverShoulderPosz:Camera") != ReturnINIsettingZ
			utility.SetINIFloat("fOverShoulderPosz:Camera", ReturnINIsettingZ)
		endWhile
		game.UpdateThirdPerson()
		utility.wait(1.0)
		self.UnregisterForControl("Jump")
		Online = false
		game.setCameraTarget(player)
		game.SetPlayerAIDriven(false)
		GLBfindChair.setValue(0.0)
		GLBfindBed.setValue(0.0)
		player.evaluatePackage()
		if ThirdPerson == 0
			debug.sendAnimationEvent(player as objectreference, "IdleCartExitInstant")
			utility.wait(0.15)
			game.forceFirstPerson()
		else
			debug.sendAnimationEvent(player as objectreference, "IdleCartExitInstant")
		endIf
		
		while utility.getINIFloat("fOverShoulderPosx:Camera") != ReturnINIsettingX
			utility.SetINIFloat("fOverShoulderPosx:Camera", ReturnINIsettingX)
		endWhile
		
		game.UpdateThirdPerson()
		game.SetInChargen(false, false, false)
		game.SetHudCartMode(false)
		TOGGLEhud = 0
		
		if HoldCrouch == true
			self.RegisterForControl("Sneak")
		else
			self.RegisterForKey(UserKey)
		endIf
		game.ENABLEPLAYERCONTROLS(true, true, true, true, true, true, true, true, 0)
		self.GotoState("Null")
	endIf
endFunction


function Refresh()
	if HoldCrouch == true
		self.UnregisterForKey(UserKey)
		self.RegisterForControl("Sneak")
	else
		self.UnregisterForControl("Sneak")
		self.RegisterForKey(UserKey)
	endIf
endFunction


function ShowManual()
	(Master as advsitfast_generic).ShowManual()
endFunction


function RegisterFollower()
	if Register == true
		while utility.IsInMenuMode()
			utility.wait(0.5)
		endWhile
		if InfoFollower == false
			MSGinfoFollower.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			utility.wait(0.25)
			MSGinfoFollower02.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			InfoFollower = true
		endIf
		player.addSpell(SpellRegister, true)
		player.equipspell(SpellRegister, 1)
		utility.wait(0.25)
		player.drawWeapon()
		self.RegisterForControl("Ready Weapon")
		Register = false
	endIf
endFunction


; -------------------------------------------------------------------------------------------------
; States
; -------------------------------------------------------------------------------------------------

state Null

	function OnUpdate()
		self.unregisterForUpdate()
	endFunction

	function onBeginState()
		self.unregisterForUpdate()
	endFunction

endState

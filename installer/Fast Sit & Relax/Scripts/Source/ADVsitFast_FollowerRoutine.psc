;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_FollowerRoutine.psc
Modified : 2014-07-20 00:22:05
Compiled : 2014-07-20 00:22:07
User     : Safthanspeter
Computer : HEIKE
/;
scriptName ADVsitFast_FollowerRoutine extends ActiveMagicEffect

;-- Properties --------------------------------------
globalvariable property GLBgetFurniture auto
faction property Follower auto
effectshader property PMSred auto
topic property CHATTERfollowerLetseGo auto
Float property DELAYtalkedLately auto hidden
globalvariable property GLBallowRelax auto
spell property SpellSelf auto
globalvariable property GLBspeechFollower auto
globalvariable property GLBautoChill auto
topic property CHATTERletseGo auto
sound property SFXstand auto
package property AImoveToPlayer auto
keyword property LocTypeCastle auto
String property IsType auto hidden
globalvariable property GLBgetType auto
worldspace property LOCtamriel auto
globalvariable property GLBregenFollower auto
globalvariable property GLBfollowerCount auto
actor property player auto hidden
keyword property LocTypeGuild auto
sound property SFXsit auto
sound property DEVTICK auto
miscobject property CMDsandbox auto
keyword property LOCtypeINN auto
effectshader property PMSblue auto
miscobject property CMDmoveToPlayer auto
effectshader property PMSGREEN auto
magiceffect property MEsitbuff auto
globalvariable property GLBcustomSitState auto
package property AIsandbox auto
keyword property LocTypeHouse auto
magiceffect property MEself auto
String property IsFurniture auto hidden
globalvariable property GLBloadFix auto
actor property ActiveHost auto hidden
topic property CHATTERweird auto
form property GetShield auto hidden
spell property SpellRegen auto
faction property VanillaFollower auto

;-- Variables ---------------------------------------
Bool ShieldWasEquipped
Int Choice
Bool Started
String GetWeather
Int JustALittleBitLonger
Int SFXvolume
String ActionType
Bool AwesomePlace
String SpecialIdle
Int RandomIdle
String GroundAction
Float Time
Bool IsUsingFurniture
Float MinDistance
Float DELAYupdate
Bool IsSitting
Bool TerminateProcessing
Int SubChoice
Bool FurnitureNear
Int Withdraw
Int Random
Float DELAYkicking
Bool NightTime

;-- Functions ---------------------------------------

function OnUpdate()

	if ActiveHost.getAv("Variable01") == 0 as Float
		if ActiveHost.getSitState() == 0 || IsSitting == true
			if DELAYupdate == 0 as Float
				if IsFurniture == "Ground"
					DELAYupdate = utility.getCurrentRealTime() + 0.0100000
				else
					DELAYupdate = utility.getCurrentRealTime() + 1.50000
				endIf
			elseIf DELAYupdate != -1 as Float
				if utility.getCurrentRealTime() > DELAYupdate
					ActiveHost.setAv("Variable02", 100 as Float)
					ActiveHost.evaluatePackage()
					DELAYupdate = -1 as Float
					self.Evaluate()
				endIf
			elseIf DELAYupdate < 0 as Float
				DELAYupdate = utility.getCurrentRealTime() + 1.50000
			endIf
		endIf
	elseIf ActiveHost.getAv("Variable01") != 0 as Float && ActiveHost.getAv("Variable02") == 0 as Float
		if IsUsingFurniture == true
			IsUsingFurniture = false
		endIf
		if IsSitting == true
			IsSitting = false
			DELAYupdate = utility.getCurrentRealTime() + 15 as Float
		endIf
		if DELAYupdate != 0 as Float
			DELAYupdate = 0 as Float
		endIf
	endIf
	if player.getSitState() == 0 && player.getSleepState() == 0 || ActiveHost.isInCombat() == true || player.isInCombat() == true
		if GLBautoChill.getValue() != 100 as Float && GLBcustomSitState.getValue() == 0 as Float || ActiveHost.isInCombat() == true || player.isInCombat() == true
			if ActiveHost.hasMagicEffect(MEself) == true
				self.GotoState("Null")
				self.unRegisterForUpdate()
				self.Disconnect()
			endIf
		endIf
	endIf
endFunction

function Begin()

	if IsType != "Charge"
		Started = false
		IsSitting = false
		ActionType = "Null"
		FurnitureNear = false
		TerminateProcessing = false
		ActiveHost.setAv("Variable02", 0 as Float)
		if ActiveHost.hasMagicEffect(MEsitbuff) == false
			SpellRegen.Cast(ActiveHost as objectreference, none)
		endIf
		if player.GetCurrentLocation().HasKeyword(LocTypeGuild) == true || player.GetCurrentLocation().HasKeyword(LocTypeHouse) == true || player.GetCurrentLocation().HasKeyword(LocTypeCastle) == true || player.GetCurrentLocation().HasKeyword(LOCtypeINN) == true
			AwesomePlace = true
		else
			AwesomePlace = false
		endIf
		if ActiveHost.getEquippedItemType(0) == 10
			GetShield = ActiveHost.GetEquippedShield() as form
			ActiveHost.unequipItem(GetShield, false, false)
			ShieldWasEquipped = true
		else
			ShieldWasEquipped = false
		endIf
		self.Evaluate()
	else
		ActiveHost.addItem(CMDmoveToPlayer as form, 1, false)
		ActiveHost.evaluatePackage()
	endIf
endFunction

function Evaluate()

	if TerminateProcessing == false
		FurnitureNear = false
		if ActiveHost.getItemCount(CMDsandbox as form) == 0
			ActiveHost.addItem(CMDsandbox as form, 10, false)
		endIf
		Choice = 0
		SpecialIdle = "None"
		DELAYupdate = utility.getCurrentRealTime() + 10 as Float
		ActiveHost.setAv("Variable02", 100 as Float)
		Random = 0
		utility.wait(0.250000)
		ActiveHost.evaluatePackage()
		if player.IsInInterior() == false
			if weather.GetCurrentWeather().GetClassification() == 0
				GetWeather = "Nice"
			elseIf weather.GetCurrentWeather().GetClassification() == 1
				GetWeather = "Cloudy"
			elseIf weather.GetCurrentWeather().GetClassification() == 2
				GetWeather = "Rainy"
			elseIf weather.GetCurrentWeather().GetClassification() == 3
				GetWeather = "Snow"
			endIf
		else
			GetWeather = "None"
		endIf
		Time = utility.GetCurrentGameTime()
		Time -= math.Floor(Time) as Float
		Time *= 24 as Float
		if Time > 5 as Float && Time < 19 as Float
			NightTime = false
		else
			NightTime = true
		endIf
		if IsType == "Sit" || IsType == "Ledge" || IsType == "Rail"
			MinDistance = 60 as Float
		elseIf IsType == "Relax"
			MinDistance = 120 as Float
		elseIf IsType == "Lean" || IsType == "Rail"
			MinDistance = 250 as Float
		endIf
		if player.IsInInterior() == false
			if GetWeather == "Rainy"
				GroundAction = "Refuse"
			elseIf NightTime == true
				Random = utility.RandomInt(1, 3)
			elseIf IsType == "Relax"
				Random = utility.RandomInt(1, 5)
			elseIf GetWeather == "Nice"
				Random = utility.RandomInt(1, 8)
			else
				Random = utility.RandomInt(1, 10)
			endIf
		elseIf player.IsInInterior() == true
			GroundAction = "Sit"
		endIf
		if Random != 0
			if Random == 1
				if player.GetWorldSpace() == LOCtamriel || IsType == "Relax"
					if GLBallowRelax.getValue() != 0 as Float
						GroundAction = "Relax"
					else
						GroundAction = "Sit"
					endIf
				else
					GroundAction = "Sit"
				endIf
			else
				GroundAction = "Sit"
			endIf
		endIf
		if Started == false
			if AwesomePlace == false && IsType != "Lean" && IsType != "Relax" && IsType != "Rail"
				if ActiveHost.getDistance(player as objectreference) > 400 as Float
					if FurnitureNear == false
						if GLBfollowerCount.getValue() > 3 as Float
							Choice = utility.RandomInt(1, 4)
							if Choice == 1
								ActionType = "player"
							elseIf Choice == 2 || Choice == 3 || Choice == 4
								ActionType = "Sit"
							endIf
						else
							Choice = utility.RandomInt(1, 3)
							if Choice == 1 || Choice == 2
								ActionType = "player"
							elseIf Choice == 3
								ActionType = "Sit"
							endIf
						endIf
					else
						ActionType = "Sandbox"
					endIf
				elseIf FurnitureNear == false
					if GLBfollowerCount.getValue() > 3 as Float
						Choice = utility.RandomInt(1, 5)
						if Choice == 1
							ActionType = "player"
						elseIf Choice == 2 || Choice == 3
							ActionType = "Sit"
						elseIf Choice == 4 || Choice == 5
							ActionType = "Sandbox"
						endIf
					else
						Choice = utility.RandomInt(1, 4)
						if Choice == 1 || Choice == 2
							ActionType = "player"
						elseIf Choice == 3
							ActionType = "Sit"
						elseIf Choice == 4
							ActionType = "Sandbox"
						endIf
					endIf
				else
					ActionType = "Sandbox"
				endIf
			elseIf AwesomePlace == true || IsType == "Lean" || IsType == "Relax" || IsType == "Rail"
				if AwesomePlace == false
					if IsType == "Lean" || IsType == "Relax" || IsType == "Rail"
						Choice = utility.RandomInt(1, 4)
						if Choice == 4
							ActionType = "Sit"
						else
							ActionType = "Sandbox"
						endIf
					endIf
				else
					ActionType = "Sandbox"
				endIf
			endIf
			self.registerForUpdate(1 as Float)
			Started = true
			self.EvaluateSandbox()
		elseIf Started == true
			if ActionType != "STOOD"
				self.Perform()
			elseIf ActionType == "STOOD"
				if AwesomePlace == false && FurnitureNear == false
					if player.IsInInterior() == false
						if ActiveHost.getDistance(player as objectreference) < 512 as Float
							Choice = utility.RandomInt(0, 1)
							if Choice == 0
								ActionType = "Idle"
							else
								ActionType = "Sandbox"
							endIf
							self.EvaluateSandbox()
						elseIf ActiveHost.getDistance(player as objectreference) > 512 as Float
							if ActionType != "Relax" && ActionType != "Lean"
								Choice = utility.RandomInt(0, 2)
								if Choice == 0
									ActionType = "Idle"
								elseIf Choice == 1
									ActionType = "Sandbox"
								elseIf Choice == 2
									ActionType = "player"
								endIf
								self.EvaluateSandbox()
							else
								ActionType = "Sandbox"
								self.EvaluateSandbox()
							endIf
						endIf
					elseIf player.IsInInterior() == true && FurnitureNear == false
						if ActiveHost.getDistance(player as objectreference) < 512 as Float
							if IsType == "Sit" || IsType == "Ledge"
								Choice = utility.RandomInt(0, 1)
							else
								Choice = utility.RandomInt(0, 5)
							endIf
							if Choice == 0
								ActionType = "player"
							else
								ActionType = "Sandbox"
							endIf
							self.EvaluateSandbox()
						else
							if IsType == "Sit" || IsType == "Ledge"
								Choice = 0
							else
								Choice = utility.RandomInt(0, 5)
							endIf
							if Choice == 0
								ActionType = "player"
							else
								ActionType = "Sandbox"
							endIf
							self.EvaluateSandbox()
						endIf
					endIf
				elseIf AwesomePlace == true || FurnitureNear == true
					if AwesomePlace == true
						ActionType = "Sandbox"
						self.EvaluateSandbox()
					else
						ActionType = "Sandbox"
						self.EvaluateSandbox()
					endIf
				endIf
			endIf
		endIf
	endIf
endFunction

function OnEffectFinish(actor akTarget, actor akCaster)

	self.unRegisterForUpdate()
	if ActiveHost.getSitState() != 0 || IsSitting == true
		debug.sendAnimationEvent(ActiveHost as objectreference, "IdleChairExitStart")
		utility.wait(0.500000)
		debug.sendAnimationEvent(ActiveHost as objectreference, "IdleChairExitStart")
	endIf
	if ActionType == "Idle"
		debug.sendAnimationEvent(ActiveHost as objectreference, "IdleCartExitInstant")
	endIf
	Withdraw = ActiveHost.getItemCount(CMDmoveToPlayer as form)
	ActiveHost.removeItem(CMDmoveToPlayer as form, Withdraw, false, none)
	Withdraw = ActiveHost.getItemCount(CMDsandbox as form)
	ActiveHost.removeItem(CMDsandbox as form, Withdraw, false, none)
	ActiveHost.evaluatePackage()
endFunction

function EvaluateSandbox()

	if TerminateProcessing == false
		Withdraw = ActiveHost.getItemCount(CMDmoveToPlayer as form)
		ActiveHost.removeItem(CMDmoveToPlayer as form, Withdraw, false, none)
		Withdraw = ActiveHost.getItemCount(CMDsandbox as form)
		ActiveHost.removeItem(CMDsandbox as form, Withdraw, false, none)
		if ActiveHost.getDistance(player as objectreference) > 1024 as Float && AwesomePlace == false
			ActionType = "player"
		endIf
		if ActionType == "player"
			if IsFurniture == "Ground"
				if GetWeather != "Rainy"
					if IsType == "Sit" || IsType == "Ledge"
						ActiveHost.addItem(CMDmoveToPlayer as form, utility.RandomInt(1, 3), false)
						Int Look = utility.RandomInt(0, 1)
						if Look == 0
							ActiveHost.clearLookAt()
						else
							ActiveHost.setLookAt(player as objectreference, false)
						endIf
					else
						ActiveHost.addItem(CMDmoveToPlayer as form, utility.RandomInt(2, 3), false)
						ActiveHost.setLookAt(ActiveHost as objectreference, false)
					endIf
				else
					SubChoice = utility.RandomInt(0, 2)
					if SubChoice == 0
						self.PickIdle()
					else
						ActiveHost.addItem(CMDsandbox as form, 2, false)
					endIf
				endIf
			else
				self.SitState()
			endIf
		elseIf ActionType == "Sit"
			self.SitState()
		elseIf ActionType == "Sandbox"
			ActiveHost.clearLookAt()
			if AwesomePlace == false
				ActiveHost.addItem(CMDsandbox as form, 2, false)
			else
				ActiveHost.addItem(CMDsandbox as form, 3, false)
			endIf
		elseIf ActionType == "SandboxLean"
			ActiveHost.setLookAt(player as objectreference, false)
			ActiveHost.addItem(CMDsandbox as form, 4, false)
		elseIf ActionType == "Sleepbox"
			ActiveHost.setLookAt(ActiveHost as objectreference, false)
			ActiveHost.addItem(CMDsandbox as form, 5, false)
		elseIf ActionType == "Idle"
			self.PickIdle()
		endIf
		if ActionType != "Sit"
			DELAYupdate = utility.getCurrentRealTime() + 6 as Float
			ActiveHost.setAv("Variable02", 0 as Float)
			ActiveHost.evaluatePackage()
		endIf
	endIf
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	ActiveHost = akTarget
	player = game.getPlayer()
	if GLBloadFix.getValue() == 0 as Float
		if GLBgetFurniture.getValue() == 0 as Float
			IsFurniture = "Ground"
		elseIf GLBgetFurniture.getValue() == 1 as Float
			IsFurniture = "Chair"
		elseIf GLBgetFurniture.getValue() == 2 as Float
			IsFurniture = "Bed"
		endIf
		if GLBgetType.getValue() == 1 as Float
			IsType = "Sit"
		elseIf GLBgetType.getValue() == 2 as Float
			IsType = "Relax"
		elseIf GLBgetType.getValue() == 3 as Float
			IsType = "Ledge"
		elseIf GLBgetType.getValue() == 4 as Float
			IsType = "Lean"
		elseIf GLBgetType.getValue() == 5 as Float
			IsType = "Rail"
		elseIf GLBgetType.getValue() == 6 as Float
			IsType = "Charge"
		endIf
		if ActiveHost.isInCombat() == false
			self.Begin()
		else
			self.GotoState("LISTENcombat")
		endIf
	else
		ActiveHost.dispelSpell(SpellSelf)
		GLBloadFix.setValue(0 as Float)
	endIf
endFunction

function SitState()

	if TerminateProcessing == false
		if IsSitting == false
			if ActiveHost.getDistance(player as objectreference) > MinDistance
				DELAYupdate = utility.getCurrentRealTime() + utility.RandomFloat(25.0000, 45.0000)
				if GroundAction != "Refuse"
					IsSitting = true
					ActiveHost.setAv("Variable02", 50 as Float)
				endIf
				if ActiveHost.hasLOS(player as objectreference) == false
					ActiveHost.setLookAt(ActiveHost as objectreference, false)
				endIf
				SFXvolume = SFXsit.play(ActiveHost as objectreference)
				sound.SetInstanceVolume(SFXvolume, 0.750000)
				if GroundAction == "Sit"
					if ActiveHost.getFactionRank(Follower) == 0
						debug.sendAnimationEvent(ActiveHost as objectreference, "IdleSitCrossLeggedEnter")
					elseIf ActiveHost.getFactionRank(Follower) == 1
						debug.sendAnimationEvent(ActiveHost as objectreference, "IdleGreybeardMeditateEnter")
					elseIf ActiveHost.getFactionRank(Follower) == 2
						Random = utility.RandomInt(0, 1)
						if Random == 0
							debug.sendAnimationEvent(ActiveHost as objectreference, "IdleSitCrossLeggedEnter")
						else
							debug.sendAnimationEvent(ActiveHost as objectreference, "IdleGreybeardMeditateEnter")
						endIf
					endIf
				elseIf GroundAction == "Relax"
					ActiveHost.setLookAt(ActiveHost as objectreference, false)
					debug.sendAnimationEvent(ActiveHost as objectreference, "IdleLayDownEnter")
				else
					self.PickIdle()
				endIf
			else
				ActionType = "Sandbox"
				self.EvaluateSandbox()
			endIf
		elseIf IsSitting == true
			if JustALittleBitLonger == 0
				JustALittleBitLonger = utility.RandomInt(1, 3)
			endIf
			if JustALittleBitLonger == 1
				DELAYupdate = utility.getCurrentRealTime() + utility.RandomFloat(10 as Float, 20 as Float)
				JustALittleBitLonger = 2
			else
				JustALittleBitLonger = 0
				IsSitting = false
				SFXvolume = SFXstand.play(ActiveHost as objectreference)
				sound.SetInstanceVolume(SFXvolume, 0.750000)
				ActiveHost.setAv("Variable02", 0 as Float)
				ActiveHost.clearLookAt()
				debug.sendAnimationEvent(ActiveHost as objectreference, "IdleChairExitStart")
				utility.wait(2.50000)
				ActionType = "STOOD"
				self.Evaluate()
			endIf
		endIf
	endIf
endFunction

function ONpackageSTART(package akNewPackage)

	if akNewPackage == AIsandbox
		
	elseIf akNewPackage == AImoveToPlayer
		
	endIf
endFunction

; Skipped compiler generated GetState

function Perform()

	if TerminateProcessing == false
		if ActionType != "Idle" && IsSitting == false
			if IsType != "Lean" && IsType != "Rail"
				Choice = 0
			else
				SpecialIdle = "Lean"
				Choice = 0
			endIf
		elseIf IsSitting == true
			Choice = 1
		elseIf AwesomePlace == false
			Choice = utility.RandomInt(1, 3)
		else
			Choice = 4
			ActionType = "Sandbox"
			self.EvaluateSandbox()
		endIf
		if Choice == 0
			if ActiveHost.getDistance(player as objectreference) < 500 as Float || ActiveHost.hasLOS(player as objectreference) == true
				if IsType != "Relax"
					self.PickIdle()
				else
					SubChoice = utility.RandomInt(0, 2)
					if SubChoice == 0
						self.PickIdle()
					else
						ActionType = "Sit"
						self.EvaluateSandbox()
					endIf
				endIf
			else
				if IsType == "Sit" || IsType == "Ledge"
					SubChoice = utility.RandomInt(0, 1)
				else
					SubChoice = utility.RandomInt(0, 5)
				endIf
				if SubChoice == 0
					ActionType = "player"
				else
					ActionType = "Sandbox"
				endIf
				self.EvaluateSandbox()
			endIf
		elseIf Choice == 1
			if ActionType != "Sit"
				if ActiveHost.getDistance(player as objectreference) < 400 as Float
					if ActiveHost.getDistance(player as objectreference) > MinDistance
						if IsType != "Lean" && IsType != "Rail"
							ActionType = "Sit"
						elseIf IsType == "Lean" || IsType == "Rail"
							if IsType == "Lean"
								SubChoice = utility.RandomInt(1, 3)
								if SubChoice != 1
									ActionType = "Sit"
								else
									ActionType = "SandboxLean"
								endIf
							elseIf AwesomePlace == false
								ActiveHost.addItem(CMDsandbox as form, 2, false)
							else
								ActiveHost.addItem(CMDsandbox as form, 3, false)
							endIf
						endIf
					else
						ActionType = "Sandbox"
					endIf
				else
					if IsType == "Sit" || IsType == "Ledge"
						SubChoice = 0
					else
						SubChoice = utility.RandomInt(0, 5)
					endIf
					if SubChoice == 0
						ActionType = "player"
					else
						ActionType = "Sandbox"
					endIf
					DELAYupdate = utility.getCurrentRealTime() + 10 as Float
				endIf
				self.EvaluateSandbox()
			else
				ActionType = "Sit"
				self.EvaluateSandbox()
			endIf
		elseIf Choice == 2
			ActionType = "Sandbox"
			self.EvaluateSandbox()
			DELAYupdate = utility.getCurrentRealTime() + 10 as Float
		elseIf Choice == 3
			if IsType == "Sit" || IsType == "Ledge"
				SubChoice = 0
			else
				SubChoice = utility.RandomInt(0, 5)
			endIf
			if SubChoice == 0
				ActionType = "player"
			else
				ActionType = "Sandbox"
			endIf
			self.EvaluateSandbox()
			DELAYupdate = utility.getCurrentRealTime() + 10 as Float
		endIf
	endIf
endFunction

function Disconnect()

	TerminateProcessing = true
	self.unRegisterForUpdate()
	if player.isInCombat() == false && IsType != "Charge"
		utility.wait(utility.RandomInt(1, 3) as Float)
	endIf
	if ActiveHost.hasMagicEffect(MEsitbuff) == true
		ActiveHost.dispelSpell(SpellRegen)
	endIf
	if ActiveHost.isInCombat() == false && player.isInCombat() == false && IsType != "Charge"
		if GLBfollowerCount.getValue() == 1 as Float
			Random = utility.RandomInt(0, 1)
		elseIf GLBfollowerCount.getValue() > 1 as Float && GLBfollowerCount.getValue() < 4 as Float
			Random = utility.RandomInt(0, 3)
		elseIf GLBfollowerCount.getValue() > 4 as Float || GLBfollowerCount.getValue() == 4 as Float
			Random = utility.RandomInt(0, 4)
		endIf
		if Random == 1
			utility.wait(utility.RandomFloat(0.500000, 1.00000))
			if ActiveHost.isInFaction(VanillaFollower) == false
				if GLBspeechFollower.getValue() != 0 as Float
					if utility.GetCurrentGameTime() > DELAYtalkedLately
						DELAYtalkedLately = utility.GetCurrentGameTime() + 0.0625000
						ActiveHost.say(CHATTERletseGo, none, false)
					endIf
				endIf
			else
				ActiveHost.setActorValue("WaitingForPlayer", 1 as Float)
				if GLBspeechFollower.getValue() != 0 as Float
					if utility.GetCurrentGameTime() > DELAYtalkedLately
						DELAYtalkedLately = utility.GetCurrentGameTime() + 0.0625000
						ActiveHost.say(CHATTERfollowerLetseGo, none, false)
					endIf
				endIf
				ActiveHost.setActorValue("WaitingForPlayer", 0 as Float)
			endIf
		endIf
	endIf
	Withdraw = ActiveHost.getItemCount(CMDmoveToPlayer as form)
	ActiveHost.removeItem(CMDmoveToPlayer as form, Withdraw, false, none)
	Withdraw = ActiveHost.getItemCount(CMDsandbox as form)
	ActiveHost.removeItem(CMDsandbox as form, Withdraw, false, none)
	if ActiveHost.getSitState() != 0 || IsSitting == true
		debug.sendAnimationEvent(ActiveHost as objectreference, "IdleChairExitStart")
		utility.wait(0.500000)
		debug.sendAnimationEvent(ActiveHost as objectreference, "IdleChairExitStart")
	endIf
	if ShieldWasEquipped == true
		ActiveHost.equipItem(GetShield, false, false)
		ShieldWasEquipped = false
	endIf
	ActiveHost.evaluatePackage()
	if ActiveHost.isInCombat() == true || player.isInCombat() == true
		if player.getSitState() != 0 || player.getSleepState() != 0
			self.GotoState("LISTENcombat")
		else
			ActiveHost.dispelSpell(SpellSelf)
		endIf
	else
		ActiveHost.dispelSpell(SpellSelf)
	endIf
endFunction

; Skipped compiler generated GotoState

function PickIdle()

	if ActiveHost.getAv("Variable01") == 0 as Float
		utility.wait(1 as Float)
		if ActiveHost.getDistance(player as objectreference) > 1024 as Float && AwesomePlace == false
			ActionType = "player"
			self.EvaluateSandbox()
		else
			ActiveHost.setLookAt(ActiveHost as objectreference, false)
			ActionType = "Idle"
			RandomIdle = 0
			if ActiveHost.isWeaponDrawn() == 0 as Bool
				if SpecialIdle == "None"
					if GetWeather == "Rainy"
						Random = utility.RandomInt(0, 3)
						if Random == 0
							RandomIdle = 4
						elseIf Random == 1 || Random == 2
							RandomIdle = 11
						elseIf Random == 3
							RandomIdle = 0
						endIf
					elseIf GetWeather == "Snow"
						Random = utility.RandomInt(0, 2)
						if Random != 0
							RandomIdle = 11
						endIf
					endIf
				elseIf SpecialIdle == "Lean"
					if ActiveHost.getItemCount(CMDsandbox as form) == 4
						Random = utility.RandomInt(1, 3)
						if Random == 1
							RandomIdle = 2
						else
							RandomIdle = 3
						endIf
					elseIf ActiveHost.getDistance(player as objectreference) < 300 as Float
						RandomIdle = 5
					endIf
				endIf
			else
				RandomIdle = 0
			endIf
			if RandomIdle == 0
				if ActiveHost.getEquippedItemType(1) == 9
					if ActiveHost.isWeaponDrawn() != 0 as Bool
						RandomIdle = 15
					else
						RandomIdle = utility.RandomInt(5, 16)
					endIf
				elseIf ActiveHost.isWeaponDrawn() != 0 as Bool
					RandomIdle = 12
				else
					RandomIdle = utility.RandomInt(5, 13)
				endIf
			endIf
			if RandomIdle == 1
				DELAYupdate = utility.getCurrentRealTime() + 5 as Float
			elseIf RandomIdle == 2
				DELAYupdate = utility.getCurrentRealTime() + 6 as Float
			elseIf RandomIdle == 3
				DELAYupdate = utility.getCurrentRealTime() + 4.50000
			elseIf RandomIdle == 4
				debug.sendAnimationEvent(ActiveHost as objectreference, "IdleWipeBrow")
				DELAYupdate = utility.getCurrentRealTime() + 3 as Float
			elseIf RandomIdle == 5
				debug.sendAnimationEvent(ActiveHost as objectreference, "IdleHandsBehindBack")
				DELAYupdate = utility.getCurrentRealTime() + utility.RandomFloat(10.0000, 20.0000)
			elseIf RandomIdle == 6
				if NightTime == false || player.IsInInterior() == true
					debug.sendAnimationEvent(ActiveHost as objectreference, "IdleBook_Read")
					DELAYupdate = utility.getCurrentRealTime() + utility.RandomFloat(15.0000, 30.0000)
				else
					self.PickIdle()
				endIf
			elseIf RandomIdle == 7
				if player.GetWorldSpace() == LOCtamriel
					debug.sendAnimationEvent(ActiveHost as objectreference, "IdleLookFar")
					DELAYupdate = utility.getCurrentRealTime() + 5 as Float
				else
					self.PickIdle()
				endIf
			elseIf RandomIdle == 8
				if NightTime == false || player.IsInInterior() == true
					debug.sendAnimationEvent(ActiveHost as objectreference, "IdleNoteRead")
					DELAYupdate = utility.getCurrentRealTime() + utility.RandomFloat(10.0000, 20.0000)
				else
					self.PickIdle()
				endIf
			elseIf RandomIdle == 9
				debug.sendAnimationEvent(ActiveHost as objectreference, "IdleStudy")
				DELAYupdate = utility.getCurrentRealTime() + utility.RandomFloat(8.00000, 15.0000)
			elseIf RandomIdle == 10
				ActiveHost.addItem(game.getForm(15), 1, false)
				debug.sendAnimationEvent(ActiveHost as objectreference, "IdlePickup_Ground")
				DELAYupdate = utility.getCurrentRealTime() + 6 as Float
			elseIf RandomIdle == 11
				if GetWeather != "Nice" || NightTime == true && AwesomePlace == false
					debug.sendAnimationEvent(ActiveHost as objectreference, "IdleWarmArms")
					DELAYupdate = utility.getCurrentRealTime() + 6 as Float
				else
					self.PickIdle()
				endIf
			elseIf RandomIdle == 12 || RandomIdle == 13
				if ActiveHost.getEquippedItemType(1) == 1 || ActiveHost.getEquippedItemType(1) == 3 || ActiveHost.getEquippedItemType(1) == 4 || ActiveHost.getEquippedItemType(1) == 5
					debug.sendAnimationEvent(ActiveHost as objectreference, "IdleCleanSword")
					DELAYupdate = utility.getCurrentRealTime() + 6 as Float
				endIf
			elseIf RandomIdle > 13 && ActiveHost.getEquippedItemType(1) == 9
				debug.sendAnimationEvent(ActiveHost as objectreference, "IdleMagic_01")
				DELAYupdate = utility.getCurrentRealTime() + 6 as Float
			endIf
		endIf
	endIf
endFunction

function ONpackageEND(package akOldPackage)

	if akOldPackage == AImoveToPlayer
		if IsType != "Charge"
			if ActiveHost.getItemCount(CMDmoveToPlayer as form) > 3
				Withdraw = ActiveHost.getItemCount(CMDmoveToPlayer as form)
				ActiveHost.removeItem(CMDmoveToPlayer as form, Withdraw, false, none)
				ActiveHost.addItem(CMDmoveToPlayer as form, 2, false)
				utility.wait(0.100000)
				ActiveHost.evaluatePackage()
			elseIf TerminateProcessing == false
				if FurnitureNear == false
					if IsType != "Lean" && IsType != "Relax" && IsType != "Rail"
						Choice = utility.RandomInt(0, 2)
						if Choice == 0
							ActionType = "Idle"
							self.EvaluateSandbox()
						else
							ActionType = "Sit"
							self.EvaluateSandbox()
						endIf
					elseIf IsType == "Relax"
						Choice = utility.RandomInt(0, 1)
						if Choice == 0
							ActionType = "Idle"
							self.EvaluateSandbox()
						else
							ActionType = "Sandbox"
							self.EvaluateSandbox()
						endIf
					elseIf IsType == "Lean" || IsType == "Rail"
						Choice = utility.RandomInt(0, 1)
						if Choice == 0
							ActionType = "Idle"
							debug.sendAnimationEvent(ActiveHost as objectreference, "IdleHandsBehindBack")
							DELAYupdate = utility.getCurrentRealTime() + utility.RandomFloat(10.0000, 20.0000)
						else
							ActionType = "Sandbox"
							self.EvaluateSandbox()
						endIf
					endIf
				elseIf player.IsInInterior() == true
					ActionType = "Sandbox"
					self.EvaluateSandbox()
				elseIf IsType != "Lean" && IsType != "Relax" && IsType != "Rail"
					Choice = utility.RandomInt(0, 3)
					if Choice == 0
						ActionType = "Idle"
						self.EvaluateSandbox()
					else
						ActionType = "Sandbox"
						self.EvaluateSandbox()
					endIf
				elseIf IsType == "Relax"
					Choice = utility.RandomInt(0, 3)
					if Choice == 0
						ActionType = "Idle"
						self.EvaluateSandbox()
					else
						ActionType = "Sandbox"
						self.EvaluateSandbox()
					endIf
				elseIf IsType == "Lean" || IsType == "Rail"
					Choice = utility.RandomInt(0, 3)
					if Choice == 0
						ActionType = "Idle"
						debug.sendAnimationEvent(ActiveHost as objectreference, "IdleHandsBehindBack")
						DELAYupdate = utility.getCurrentRealTime() + utility.RandomFloat(10.0000, 20.0000)
					else
						ActionType = "Sandbox"
						self.EvaluateSandbox()
					endIf
				endIf
			endIf
		else
			self.GotoState("Null")
			self.unRegisterForUpdate()
			self.Disconnect()
		endIf
	elseIf akOldPackage == AIsandbox
		if ActiveHost.getItemCount(CMDsandbox as form) == 10
			FurnitureNear = true
		endIf
	endIf
endFunction

;-- State -------------------------------------------
state LISTENcombat

	function onBeginState()

		self.unRegisterForUpdate()
		if ActiveHost.getSitState() != 0 || IsSitting == true
			debug.sendAnimationEvent(ActiveHost as objectreference, "IdleChairExitStart")
			utility.wait(0.500000)
			debug.sendAnimationEvent(ActiveHost as objectreference, "IdleChairExitStart")
		endIf
		self.registerForUpdate(3 as Float)
	endFunction

	function OnUpdate()

		if ActiveHost.isInCombat() == 0 as Bool && player.isInCombat() == 0 as Bool
			if !ActiveHost.isWeaponDrawn()
				self.unRegisterForUpdate()
				self.GotoState("Null")
			else
				if ActiveHost.getEquippedItemType(1) == 1 || ActiveHost.getEquippedItemType(1) == 3 || ActiveHost.getEquippedItemType(1) == 4 || ActiveHost.getEquippedItemType(1) == 5
					debug.sendAnimationEvent(ActiveHost as objectreference, "IdleCleanSword")
				endIf
				if ActiveHost.getEquippedItemType(1) == 9
					debug.sendAnimationEvent(ActiveHost as objectreference, "IdleMagic_01")
				endIf
			endIf
		endIf
		if player.getSitState() == 0 && player.getSleepState() == 0
			self.unRegisterForUpdate()
			self.GotoState("Null")
		endIf
	endFunction

	function onEndState()

		if player.getSitState() == 3 || player.getSleepState() == 3
			self.Begin()
		else
			ActiveHost.dispelSpell(SpellSelf)
		endIf
	endFunction
endState

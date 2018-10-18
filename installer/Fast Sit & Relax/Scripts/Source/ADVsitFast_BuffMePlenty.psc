;/ Decompiled by Champollion V1.0.0
Source   : ADVsitFast_BuffMePlenty.psc
Modified : 2014-07-20 18:46:51
Compiled : 2014-07-20 21:34:47
User     : Safthanspeter
Computer : HEIKE
/;

scriptName ADVsitFast_BuffMePlenty extends ActiveMagicEffect

;-- Properties --------------------------------------
Float property Duration auto hidden
Float property TimeBegin auto hidden
String property IsType auto hidden
actor property player auto hidden
effectshader property PMS auto
effectshader property PMScharge auto
effectshader property PMSchargeReady auto
effectshader property PMSchargeReadyPOS auto
effectshader property PMSpos auto
globalvariable property GLBSETallowVoice auto
globalvariable property GLBSETshakeCamera auto
globalvariable property GLBSETshakeController auto
globalvariable property GLBbuffFollower auto
globalvariable property GLBbuffNotification auto
globalvariable property GLBbuffPlayer auto
globalvariable property GLBbuffReady auto
globalvariable property GLBgetType auto
globalvariable property RegenHealth auto
globalvariable property RegenMagicka auto
globalvariable property RegenStamina auto
globalvariable property SilentBuff auto
magiceffect property ActiveME auto hidden
magiceffect property MEparaStance auto
magiceffect property MEparaStanceFull auto
referencealias property Follower01 auto
referencealias property Follower02 auto
referencealias property Follower03 auto
referencealias property Follower04 auto
referencealias property Follower05 auto
referencealias property Follower06 auto
sound property SFXapply auto
sound property SFXapply2 auto
sound property SFXapply3 auto
sound property SFXapply4 auto
sound property SFXchargeReady auto
sound property SFXchargeReady02 auto
sound property SFXchargeReadyPos auto
sound property SFXchargeReadyPos02 auto
spell property ActiveBuff auto hidden
spell property BUFFcarryweight auto
spell property BUFFcritical auto
spell property BUFFledge auto
spell property BUFFparaStance auto
spell property BUFFparaStanceFull auto
spell property BUFFspeed auto
topic property Yeah auto
visualeffect property VEapply auto
visualeffect property VEapplyPos auto
visualeffect property VEregen auto

;-- Variables ---------------------------------------
Bool Positive
Float DELAYtalkedLately
Int SFXvolume

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function BuffFollower(Bool Full)

	if Follower01.getRef() != none && (Follower01.getRef() as actor).GetAv("WaitingForPlayer") as Bool == false
		if SilentBuff.getValue() == 0 as Float
			if Positive == true
				PMSpos.play((Follower01.getRef() as actor) as objectreference, 3 as Float)
			else
				PMS.play((Follower01.getRef() as actor) as objectreference, 3 as Float)
			endIf
		endIf
		ActiveBuff.Cast((Follower01.getRef() as actor) as objectreference, none)
	endIf
	if Follower02.getRef() != none && (Follower02.getRef() as actor).GetAv("WaitingForPlayer") as Bool == false
		if SilentBuff.getValue() == 0 as Float
			if Positive == true
				PMSpos.play((Follower02.getRef() as actor) as objectreference, 3 as Float)
			else
				PMS.play((Follower02.getRef() as actor) as objectreference, 3 as Float)
			endIf
		endIf
		ActiveBuff.Cast((Follower02.getRef() as actor) as objectreference, none)
	endIf
	if Follower03.getRef() != none && (Follower03.getRef() as actor).GetAv("WaitingForPlayer") as Bool == false
		if SilentBuff.getValue() == 0 as Float
			if Positive == true
				PMSpos.play((Follower03.getRef() as actor) as objectreference, 3 as Float)
			else
				PMS.play((Follower03.getRef() as actor) as objectreference, 3 as Float)
			endIf
		endIf
		ActiveBuff.Cast((Follower03.getRef() as actor) as objectreference, none)
	endIf
	if Follower04.getRef() != none && (Follower04.getRef() as actor).GetAv("WaitingForPlayer") as Bool == false
		if SilentBuff.getValue() == 0 as Float
			if Positive == true
				PMSpos.play((Follower04.getRef() as actor) as objectreference, 3 as Float)
			else
				PMS.play((Follower04.getRef() as actor) as objectreference, 3 as Float)
			endIf
		endIf
		ActiveBuff.Cast((Follower04.getRef() as actor) as objectreference, none)
	endIf
	if Follower05.getRef() != none && (Follower05.getRef() as actor).GetAv("WaitingForPlayer") as Bool == false
		if SilentBuff.getValue() == 0 as Float
			if Positive == true
				PMSpos.play((Follower05.getRef() as actor) as objectreference, 3 as Float)
			else
				PMS.play((Follower05.getRef() as actor) as objectreference, 3 as Float)
			endIf
		endIf
		ActiveBuff.Cast((Follower05.getRef() as actor) as objectreference, none)
	endIf
	if Follower06.getRef() != none && (Follower06.getRef() as actor).GetAv("WaitingForPlayer") as Bool == false
		if SilentBuff.getValue() == 0 as Float
			if Positive == true
				PMSpos.play((Follower06.getRef() as actor) as objectreference, 3 as Float)
			else
				PMS.play((Follower06.getRef() as actor) as objectreference, 3 as Float)
			endIf
		endIf
		ActiveBuff.Cast((Follower06.getRef() as actor) as objectreference, none)
	endIf
endFunction

function OnEffectFinish(actor akTarget, actor akCaster)

	if IsType == "Sit"
		ActiveBuff = BUFFcritical
	elseIf IsType == "Lean"
		ActiveBuff = BUFFparaStance
	elseIf IsType == "Relax"
		ActiveBuff = BUFFcarryweight
	elseIf IsType == "Charge"
		ActiveBuff = BUFFspeed
	elseIf IsType == "Ledge"
		ActiveBuff = BUFFledge
	endIf
	if IsType != "Charge"
		ActiveME = ActiveBuff.GetNthEffectMagicEffect(0)
		self.unregisterForUpdate()
		Duration = utility.getCurrentRealTime() - TimeBegin
		utility.wait(0.500000)
		Duration *= 7 as Float
		if Duration < 300 as Float || Duration == 300 as Float
			if player.hasMagicEffect(ActiveME) != 0 as Bool
				if ActiveBuff.getNthEffectDuration(0) as Float < Duration
					if GLBbuffPlayer.getValue() != 0 as Float
						self.BuffPlayer(false)
					endIf
				endIf
			elseIf GLBbuffPlayer.getValue() != 0 as Float
				self.BuffPlayer(false)
			endIf
		elseIf GLBbuffPlayer.getValue() != 0 as Float
			Duration = 300 as Float
			self.BuffPlayer(true)
		endIf
	endIf
endFunction

function BuffPlayer(Bool Full)

	if Duration > 30 as Float || Duration == 300 as Float
		if Full == false
			ActiveBuff.SetNthEffectDuration(0, Duration as Int)
			if IsType == "Sit"
				ActiveBuff.SetNthEffectMagnitude(0, 25 as Float)
				if GLBbuffNotification.getValue() != 0 as Float
					debug.Notification("+25% Critical hit chance for " + (Duration as Int) as String + " seconds")
				endIf
			elseIf IsType == "Lean"
				if player.hasMagicEffect(MEparaStanceFull) == true
					player.dispelSpell(BUFFparaStanceFull)
				endIf
				ActiveBuff.SetNthEffectMagnitude(0, 25 as Float)
				if GLBbuffNotification.getValue() != 0 as Float
					debug.Notification("Paralyzing Stance for " + (Duration as Int) as String + " seconds")
				endIf
			elseIf IsType == "Relax"
				ActiveBuff.SetNthEffectMagnitude(0, 60 as Float)
				if GLBbuffNotification.getValue() != 0 as Float
					debug.Notification("Carrying capacity increased by 60 for " + (Duration as Int) as String + " seconds")
				endIf
			elseIf IsType == "Ledge"
				ActiveBuff.SetNthEffectMagnitude(0, 25 as Float)
				if GLBbuffNotification.getValue() != 0 as Float
					debug.Notification("Damage resist increased by 25 for " + (Duration as Int) as String + " seconds")
				endIf
			endIf
		else
			ActiveBuff.SetNthEffectDuration(0, 300)
			if IsType == "Sit"
				ActiveBuff.SetNthEffectMagnitude(0, 50.0000)
				if GLBbuffNotification.getValue() != 0 as Float
					debug.Notification("+50% Critical hit chance for 5mins!")
				endIf
			elseIf IsType == "Lean"
				if player.hasMagicEffect(MEparaStance) == true
					player.dispelSpell(BUFFparaStance)
				endIf
				ActiveBuff = BUFFparaStanceFull
				ActiveBuff.SetNthEffectMagnitude(0, 35 as Float)
				ActiveBuff.SetNthEffectDuration(0, 300)
				if GLBbuffNotification.getValue() != 0 as Float
					debug.Notification("Greater Paralyzing Stance for 5 mins!")
				endIf
			elseIf IsType == "Relax"
				ActiveBuff.SetNthEffectMagnitude(0, 120.000)
				if GLBbuffNotification.getValue() != 0 as Float
					debug.Notification("Carrying capacity increased by 120 for 5 mins!")
				endIf
			elseIf IsType == "Ledge"
				ActiveBuff.SetNthEffectMagnitude(0, 50 as Float)
				if GLBbuffNotification.getValue() != 0 as Float
					debug.Notification("Damage resist increased by 50 for 5 mins!")
				endIf
			endIf
		endIf
		if SilentBuff.getValue() == 0 as Float
			if Full == false
				if Positive == false
					SFXvolume = SFXapply.play(player as objectreference)
					sound.SetInstanceVolume(SFXvolume, 0.500000)
					PMS.play(player as objectreference, 6 as Float)
				else
					SFXvolume = SFXapply4.play(player as objectreference)
					sound.SetInstanceVolume(SFXvolume, 1 as Float)
					PMSpos.play(player as objectreference, 6 as Float)
				endIf
			else
				if Positive == false
					PMS.play(player as objectreference, 12 as Float)
					SFXvolume = SFXapply.play(player as objectreference)
					sound.SetInstanceVolume(SFXvolume, 1 as Float)
				else
					PMSpos.play(player as objectreference, 12 as Float)
					SFXvolume = SFXapply4.play(player as objectreference)
					sound.SetInstanceVolume(SFXvolume, 1 as Float)
					PMSpos.play(player as objectreference, 6 as Float)
				endIf
				utility.wait(0.250000)
				SFXvolume = SFXapply3.play(player as objectreference)
				sound.SetInstanceVolume(SFXvolume, 1 as Float)
			endIf
		endIf
		if GLBSETshakeController.getValue() != 0 as Float
			game.ShakeController(0.250000, 0.250000, 0.250000)
		endIf
		if GLBSETshakeCamera.getValue() != 0 as Float
			game.ShakeCamera(none, 0.250000, 0.250000)
		endIf
		if SilentBuff.getValue() == 0 as Float && Full == true
			if Positive == false
				VEapply.play(player as objectreference, -1.00000, none)
			else
				VEapplyPos.play(player as objectreference, -1.00000, none)
			endIf
			SFXvolume = SFXapply2.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 0.850000)
			utility.wait(0.500000)
		endIf
		ActiveBuff.Cast(player as objectreference, none)
		if Full == true
			if GLBSETallowVoice.getValue() != 0 as Float
				if utility.getCurrentGameTime() > DELAYtalkedLately
					Int Random = utility.RandomInt(0, 1)
					if Random == 1
						player.say(Yeah, none, false)
						DELAYtalkedLately = utility.getCurrentGameTime() + 0.0625000
					endIf
				endIf
			endIf
		endIf
		if GLBbuffFollower.getValue() != 0 as Float
			utility.wait(1 as Float)
			self.BuffFollower(false)
		endIf
	endIf
endFunction

function OnUpdate()

	if IsType != "Charge"
		if Positive == false
			PMSchargeReady.play(player as objectreference, -1.00000)
			SFXvolume = SFXchargeReady02.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 0.500000)
			SFXvolume = SFXchargeReady.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 1 as Float)
		else
			PMSchargeReadyPOS.play(player as objectreference, -1.00000)
			SFXvolume = SFXchargeReadyPos02.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 0.500000)
			SFXvolume = SFXchargeReadyPos.play(player as objectreference)
			sound.SetInstanceVolume(SFXvolume, 1 as Float)
		endIf
		if GLBSETshakeCamera.getValue() != 0 as Float
			game.ShakeCamera(none, 0.250000, 0.250000)
		endIf
		if GLBSETshakeController.getValue() != 0 as Float
			game.ShakeController(0.250000, 0.250000, 0.250000)
		endIf
	else
		SFXvolume = SFXapply4.play(player as objectreference)
		sound.SetInstanceVolume(SFXvolume, 1 as Float)
		PMSpos.play(player as objectreference, 6 as Float)
		VEapplyPos.play(player as objectreference, -1.00000, none)
		game.ShakeCamera(none, 0.500000, 1 as Float)
		game.ShakeController(0.250000, 0.250000, 0.250000)
	endIf
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	if akTarget == game.getPlayer()
		TimeBegin = utility.getCurrentRealTime()
		player = game.getPlayer()
		if GLBgetType.getValue() == 1 as Float
			IsType = "Sit"
			Positive = false
		elseIf GLBgetType.getValue() == 2 as Float
			IsType = "Relax"
			Positive = true
		elseIf GLBgetType.getValue() == 3 as Float
			IsType = "Ledge"
			Positive = true
		elseIf GLBgetType.getValue() == 4 as Float
			IsType = "Lean"
			Positive = false
		elseIf GLBgetType.getValue() == 5 as Float
			IsType = "Alas"
			Positive = true
		elseIf GLBgetType.getValue() == 6 as Float
			IsType = "Charge"
			Positive = true
		endIf
		if IsType != "Charge"
			if GLBbuffPlayer.getValue() != 0 as Float && GLBbuffReady.getValue() != 0 as Float
				self.registerForSingleUpdate(45 as Float)
			endIf
		elseIf SilentBuff.getValue() == 0 as Float
			self.registerForSingleUpdate(4 as Float)
		endIf
	endIf
endFunction

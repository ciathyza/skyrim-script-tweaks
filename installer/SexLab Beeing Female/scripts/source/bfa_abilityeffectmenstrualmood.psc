;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectMenstrualMood.psc
Modified : 2016-12-06 03:52:28
Compiled : 2017-01-15 06:28:48
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectMenstrualMood extends activemagiceffect

;-- Properties --------------------------------------
fwsystem property System auto

;-- Variables ---------------------------------------
Bool bUsed = false
actor PlayerRef

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if System.cfg.NPCMenstrualMood || target == game.GetPlayer()
		bUsed = true
	endIf
	if PlayerRef as Bool && bUsed == true
		Int rndMood = utility.RandomInt(0, 4)
		if rndMood == 0 && game.GetPlayer() != target
			PlayerRef.SetExpressionOverride(7, 30)
			PlayerRef.SetExpressionOverride(2, 80)
			PlayerRef.SetExpressionOverride(10, 75)
			PlayerRef.SetExpressionOverride(3, 10)
			PlayerRef.SetExpressionOverride(11, 10)
			PlayerRef.SetExpressionOverride(0, 4)
			PlayerRef.SetExpressionOverride(8, 8)
			PlayerRef.SetExpressionOverride(6, 3)
			PlayerRef.SetExpressionOverride(14, 8)
		elseIf rndMood == 1 && game.GetPlayer() != target
			PlayerRef.SetExpressionOverride(7, 80)
			PlayerRef.SetExpressionOverride(2, 30)
			PlayerRef.SetExpressionOverride(10, 30)
			PlayerRef.SetExpressionOverride(3, 5)
			PlayerRef.SetExpressionOverride(11, 5)
			PlayerRef.SetExpressionOverride(0, 3)
			PlayerRef.SetExpressionOverride(8, 3)
			PlayerRef.SetExpressionOverride(6, 0)
			PlayerRef.SetExpressionOverride(14, 8)
		elseIf rndMood == 2 && game.GetPlayer() != target
			PlayerRef.SetExpressionOverride(7, 20)
			PlayerRef.SetExpressionOverride(2, 10)
			PlayerRef.SetExpressionOverride(10, 20)
			PlayerRef.SetExpressionOverride(3, 80)
			PlayerRef.SetExpressionOverride(11, 80)
			PlayerRef.SetExpressionOverride(0, 20)
			PlayerRef.SetExpressionOverride(8, 25)
			PlayerRef.SetExpressionOverride(6, 10)
			PlayerRef.SetExpressionOverride(14, 10)
		elseIf rndMood == 3 && game.GetPlayer() != target
			PlayerRef.SetExpressionOverride(7, 20)
			PlayerRef.SetExpressionOverride(2, 0)
			PlayerRef.SetExpressionOverride(10, 0)
			PlayerRef.SetExpressionOverride(3, 30)
			PlayerRef.SetExpressionOverride(11, 30)
			PlayerRef.SetExpressionOverride(0, 85)
			PlayerRef.SetExpressionOverride(8, 85)
			PlayerRef.SetExpressionOverride(6, 35)
			PlayerRef.SetExpressionOverride(14, 20)
			if utility.RandomInt(0, 9) > 7 && System.cfg.NPCMenstrualNoTalk == true
				PlayerRef.AllowPCDialogue(false)
			endIf
		elseIf rndMood == 4 && game.GetPlayer() != target
			PlayerRef.SetExpressionOverride(7, 40)
			PlayerRef.SetExpressionOverride(2, 0)
			PlayerRef.SetExpressionOverride(10, 0)
			PlayerRef.SetExpressionOverride(3, 30)
			PlayerRef.SetExpressionOverride(11, 30)
			PlayerRef.SetExpressionOverride(0, 20)
			PlayerRef.SetExpressionOverride(8, 40)
			PlayerRef.SetExpressionOverride(6, 90)
			PlayerRef.SetExpressionOverride(14, 85)
			if utility.RandomInt(0, 9) > 4 && System.cfg.NPCMenstrualNoTalk == true
				PlayerRef.AllowPCDialogue(false)
			endIf
		endIf
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GotoState

function OnEffectFinish(actor target, actor caster)

	if PlayerRef as Bool && bUsed == true
		PlayerRef.ClearExpressionOverride()
		PlayerRef.AllowPCDialogue(PlayerRef.GetRace().AllowPCDialogue())
	endIf
endFunction

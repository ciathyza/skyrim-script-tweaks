;/ Decompiled by Champollion V1.0.1
Source   : BFA_VisualEffects.psc
Modified : 2017-01-03 08:19:44
Compiled : 2017-01-15 06:28:31
User     : admin
Computer : PATRICK
/;
scriptName BFA_VisualEffects extends FWAddOn_Misc

;-- Properties --------------------------------------
imagespacemodifier property Mittelschmerz3 auto
imagespacemodifier property AfterPains1 auto
imagespacemodifier property AfterPains3 auto
imagespacemodifier property FirstStage auto
imagespacemodifier property AfterPains2 auto
imagespacemodifier property MenstrualCamps3 auto
imagespacemodifier property Mittelschmerz1 auto
imagespacemodifier property Premonitory auto
imagespacemodifier property BearingDown2 auto
imagespacemodifier property MenstrualCamps1 auto
imagespacemodifier property BearingDown3 auto
imagespacemodifier property BearingDown1 auto
imagespacemodifier property MenstrualCamps2 auto
imagespacemodifier property Mittelschmerz2 auto

;-- Variables ---------------------------------------
Float ImodPause = 5.00000
Float LastIModTime = 0.000000

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnDoDamageStart(actor a, Float Amount, Int DamageType, Float OptionalArgument)

	if LastIModTime < utility.GetCurrentRealTime() - ImodPause
		return 
	endIf
	if a == game.GetPlayer()
		imagespacemodifier use
		Int rnd = utility.RandomInt(0, 10)
		if DamageType == 1
			if rnd < 4
				use = Mittelschmerz1
			elseIf rnd < 8
				use = Mittelschmerz2
			else
				use = Mittelschmerz3
			endIf
		elseIf DamageType == 3
			if rnd < 4
				use = MenstrualCamps1
			elseIf rnd < 8
				use = MenstrualCamps2
			else
				use = MenstrualCamps3
			endIf
		elseIf DamageType == 7
			use = Premonitory
		elseIf DamageType == 8
			use = FirstStage
		elseIf DamageType == 10
			if rnd < 4
				use = BearingDown1
			elseIf rnd < 8
				use = BearingDown2
			else
				use = BearingDown3
			endIf
		elseIf DamageType == 11
			if rnd < 4
				use = AfterPains1
			elseIf rnd < 8
				use = AfterPains2
			else
				use = AfterPains3
			endIf
		endIf
		if use != none
			LastIModTime = utility.GetCurrentRealTime()
			use.Apply(1.00000)
		endIf
	endIf
endFunction

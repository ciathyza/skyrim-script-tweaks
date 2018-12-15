;/ Decompiled by Champollion V1.0.1
Source   : FWAddOn_MiscBasicPain.psc
Modified : 2016-12-06 03:53:09
Compiled : 2017-01-18 08:36:09
User     : admin
Computer : PATRICK
/;
scriptName FWAddOn_MiscBasicPain extends FWAddOn_Misc

;-- Properties --------------------------------------
imagespacemodifier property LaborPainImodHigh auto
fwsystem property System auto
imagespacemodifier property MiddlePain auto
imagespacemodifier property LaborPainImodMiddle auto
imagespacemodifier property LowerPain auto
imagespacemodifier property HigherPain auto
imagespacemodifier property CriticalPain auto
imagespacemodifier property LaborPainImodLow auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnDoDamageStart(actor a, Float Amount, Int DamageType, Float OptionalArgument)

	if DamageType == 1 || DamageType == 3 && OptionalArgument < 1.80000 || System == none
		return 
	endIf
	if a == game.GetPlayer()
		if DamageType == 7
			System.Blur(0.500000, LowerPain)
		elseIf DamageType == 8
			System.Blur(1.00000, LowerPain)
		elseIf DamageType == 10
			System.Blur(1.00000, LaborPainImodMiddle)
		elseIf DamageType == 9
			System.Blur(1.00000, LaborPainImodHigh)
		elseIf DamageType == 11
			System.Blur(0.500000, LowerPain)
		elseIf DamageType == 1 || Amount >= 2.00000 && Amount < 4.00000
			System.Blur(0.500000, LowerPain)
		elseIf Amount >= 4.00000 && Amount < 5.00000
			System.Blur(1.00000, LowerPain)
		elseIf Amount >= 5.00000 && Amount < 8.00000
			System.Blur(0.500000, MiddlePain)
		elseIf Amount >= 8.00000 && Amount < 10.0000
			System.Blur(1.00000, MiddlePain)
		elseIf Amount >= 10.0000 && Amount < 15.0000
			System.Blur(0.500000, HigherPain)
		elseIf Amount >= 15.0000 && Amount < 30.0000
			System.Blur(1.00000, HigherPain)
		elseIf Amount >= 30.0000 && Amount < 60.0000
			System.Blur(0.500000, CriticalPain)
		else
			System.Blur(1.00000, CriticalPain)
		endIf
	endIf
	if Amount > 12.0000
		System.PlayBleedOut(a)
	endIf
endFunction

function OnDoDamageEnd(actor a, Float Amount, Int DamageType, Float OptionalArgument)

	if Amount > 12.0000 && System != none
		System.StopBleedOut(a)
	endIf
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

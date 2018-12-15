;/ Decompiled by Champollion V1.0.1
Source   : MorSQuestNEW.psc
Modified : 2014-11-08 00:48:46
Compiled : 2014-11-08 00:48:47
User     : Darkfox127
Computer : DARKFOX127-PC
/;
scriptName MorSQuestNEW extends Quest

;-- Properties --------------------------------------
globalvariable property MorGQuest auto
objectreference property MorRefCook auto
objectreference property MorXHMorskom auto
objectreference property MorMapMarker auto
message property MorMQuest1v1 auto
objectreference property StaffRef auto
globalvariable property MorGOwnership auto
objectreference property MorRefGroundsman auto
message property MorMIntroMessage auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnInit()
	if MorGQuest.GetValue() == 1 as Float
		utility.Wait(15 as Float)
		if MorGOwnership.GetValue() == 1 as Float
			MorMQuest1v1.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			utility.Wait(2 as Float)
			if MorRefCook.IsEnabled()
				MorRefCook.MoveTo(StaffRef, 0.000000, 0.000000, 0.000000, true)
			endIf
			if MorRefGroundsman.IsEnabled()
				MorRefGroundsman.MoveTo(StaffRef, 0.000000, 0.000000, 0.000000, true)
			endIf
		endIf
		;elseIf MorGOwnership.GetValue() == 0 as Float
		;	game.PlayBink("MorskomIntro.bik", false, true, true, true)
		;	Int iButton = MorMIntroMessage.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		;	if iButton == 0
		;		
		;	elseIf iButton == 1
		;		game.GetPlayer().MoveTo(MorXHMorskom, 0.000000, 0.000000, 0.000000, true)
		;		game.EnableFastTravel(true)
		;		game.FastTravel(MorXHMorskom)
		;	elseIf iButton == 3
		;		MorMapMarker.AddToMap(true)
		;	endIf
		;endIf
	endIf
endFunction

; Skipped compiler generated GetState

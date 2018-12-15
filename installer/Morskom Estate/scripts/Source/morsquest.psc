;/ Decompiled by Champollion V1.0.1
Source   : MorSQuest.psc
Modified : 2014-10-20 08:28:44
Compiled : 2014-10-20 08:28:46
User     : Darkfox127
Computer : DARKFOX127-PC
/;
scriptName MorSQuest extends Quest

;-- Properties --------------------------------------
message property MorMIntroMessage auto
objectreference property MorMapMarker auto
globalvariable property MorGQuest auto
objectreference property MorXHMorskom auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnInit()
	;if MorGQuest.GetValue() == 1 as Float
	;	utility.Wait(30 as Float)
	;	game.PlayBink("MorskomIntro.bik", false, true, true, true)
	;	Int iButton = MorMIntroMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
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
endFunction

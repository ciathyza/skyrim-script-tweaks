;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname defe_sf_defeatplayerqstescape_030abd69 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
CurrentLocation.GetReference().MoveTo(NecroChest)
SendModEvent("DefeatPostAssault", "EscapeEnd")
PlayerScr.UnregisterForUpdate()
PlayerScr.Restored()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
ThePlayer = Game.GetPlayer()
CurrentLocation.GetReference().MoveTo(ThePlayer)
If McmConfig.bResistQTE	
	PlayerScr.GoToState("Escape")
	SendModEvent("DefeatPostAssault", "EscapeBegin")
Else	
	Utility.Wait(3.0)
	RessConfig.DefeatPlayAnimation(ThePlayer, "Stand")
	Game.SetPlayerAiDriven(False)
	PlayerScr.RegisterForSingleUpdate(10.0)
	PlayerScr.GoToState("Flee")
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatMCMscr Property McmConfig Auto
DefeatConfig Property RessConfig Auto
DefeatPlayer property PlayerScr Auto
Actor ThePlayer
ReferenceAlias Property CurrentLocation Auto
ObjectReference Property NecroChest Auto

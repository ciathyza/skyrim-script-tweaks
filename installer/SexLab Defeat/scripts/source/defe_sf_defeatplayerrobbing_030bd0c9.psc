;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname defe_sf_defeatplayerrobbing_030bd0c9 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SendModEvent("DefeatPostAssault", "RobEnd")
RessConfig.MiscQuests[5].Start() ; RobberQst
RessConfig.MiscQuests[5].SetActive() ; RobberQst
If RessConfig.NoPostAssault ; If the scene is called from DefeatConfig
	RessConfig.NoPostAssault = False
	RessConfig.CalmSPL.Cast(Player, Player)
	PlayerScr.RegisterForSingleUpdate(2)
Else
	PlayerScr.PostAssault()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Aggressor = (AliasLastAgg.GetReference() As Actor)
Victim = (AliasLastVic.GetReference() As Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Debug.SendAnimationEvent(Aggressor, "IdleWarmHandsCrouched")
Utility.Wait(1)
PlayerScr.RobValuable(Victim, Aggressor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatPlayer property PlayerScr Auto
DefeatConfig Property RessConfig Auto
ReferenceAlias Property AliasLastAgg Auto
ReferenceAlias Property AliasLastVic Auto
Actor Property Player Auto
Actor Victim
Actor Aggressor

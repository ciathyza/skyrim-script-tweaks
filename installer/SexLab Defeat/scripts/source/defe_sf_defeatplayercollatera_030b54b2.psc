;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 50
Scriptname defe_sf_defeatplayercollatera_030b54b2 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
PlayerScr.CollateralRape(Victim, Aggressor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
If McmConfig.DialoguesFollower
    Victim.Say(RessConfig.TopicToSay[3], Victim)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Aggressor = (CollaAgg.GetReference() As Actor)
Victim =  (CollaVic.GetReference() As Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
CollaAgg.Clear()
CollaVic.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
RessConfig.MiscSpells[6].Cast(Aggressor, Victim) ; CollateralSafetySPL
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
PlayerScr.StripColla(Victim, Aggressor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property RessConfig Auto
DefeatMCMscr Property McmConfig Auto
DefeatPlayer property PlayerScr Auto
ReferenceAlias Property CollaAgg  Auto  
ReferenceAlias Property CollaVic  Auto 
Actor Victim
Actor Aggressor

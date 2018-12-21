;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname defe_qf_defeatparobber_030c16d7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Robber
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Robber Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0)
If McmConfig.RobTimeLimit
	Robber.RegisterForSingleUpdateGameTime(72.0)
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatPARobberKill Property Robber Auto
DefeatMCMscr Property McmConfig Auto

;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_lalawench_introquest_0520D4C4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Maxy_captured
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maxy_captured Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY kahanne_captured
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_kahanne_captured Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY orianne_captured
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_orianne_captured Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY daphnne_captured
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_daphnne_captured Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jaryra_captured
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jaryra_captured Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bandit_info
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bandit_info Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
lalawench_introquest.UpdateCurrentInstanceGlobal(lalawench_CW_EW_count)
lalawench_introquest.UpdateCurrentInstanceGlobal(lalawench_CW_EW_total)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property lalawench_CW_EW_count Auto
GlobalVariable Property lalawench_CW_EW_total Auto
Quest Property lalawench_introquest Auto

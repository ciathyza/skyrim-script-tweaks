;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DCVR_QF_LVA_BloodthirstContro_0301E37C Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DCVR_LVA_BloodthirstControllerQuest
Quest __temp = self as Quest
DCVR_LVA_BloodthirstControllerQuest kmyQuest = __temp as DCVR_LVA_BloodthirstControllerQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ConsumeBlood()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

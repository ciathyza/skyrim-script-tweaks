;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 229
Scriptname defeatassaultperkfrag Extends Perk Hidden

;BEGIN FRAGMENT Fragment_223
Function Fragment_223(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Trauma(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_215
Function Fragment_215(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Knockout(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Tied(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_134
Function Fragment_134(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Cheer(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_125
Function Fragment_125(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Stun(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_114
Function Fragment_114(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
RessConfig.SLController(akTargetRef as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_145
Function Fragment_145(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Trauma(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_110
Function Fragment_110(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.TheShow(akTargetRef as actor, akActor, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_107
Function Fragment_107(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Necro(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_225
Function Fragment_225(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Escape(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_122
Function Fragment_122(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Rescue(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_153
Function Fragment_153(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ActionQst.Sleeping(akTargetRef as actor, akActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatActionScr Property ActionQst Auto
DefeatConfig Property RessConfig Auto

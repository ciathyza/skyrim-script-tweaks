;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 45
Scriptname PRKF__050AFB70 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_13
Function Fragment_13(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
;TanningRackalt.activate(game.getPlayer())
ObjectReference marker = akTargetRef.PlaceAtMe(TanningRackmarker)
marker.activate(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference property TanningRackAlt auto
Furniture property TanningRackmarker auto

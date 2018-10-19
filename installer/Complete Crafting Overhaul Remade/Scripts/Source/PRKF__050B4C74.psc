;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 40
Scriptname PRKF__050B4C74 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_13
Function Fragment_13(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
;Smelteralt.activate(game.getPlayer())
ObjectReference marker = akTargetRef.PlaceAtMe(Smeltermarker)
marker.activate(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference property SmelterAlt auto
Furniture property Smeltermarker auto

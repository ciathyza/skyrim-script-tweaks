;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SLH_TIF_BimboQuest03 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor PlayerActor = game.GetPlayer()

; PlayerActor.DoCombatSpellApply(PolymorphBimboFX, PlayerActor)
PlayerActor.DoCombatSpellApply(PolymorphBimboOFF, PlayerActor)

; PlayerActor.AddItem( BimboPolymorphToken, 1)
PlayerActor.RemoveItem( DaedraHeart, 1)

self.GetOwningQuest().Setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WEAPON Property BimboPolymorphToken  Auto  

Ingredient Property DaedraHeart  Auto  

SPELL Property PolymorphBimboFX  Auto  

SPELL Property PolymorphBimboOFF  Auto  

;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_changeoutfit Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().RemoveItem(ClothesWenchClothes01, 1)
utility.wait(0.5)
akSpeaker.SetOutFit(ClothesTavernWenchOutfit)
akSpeaker.SetExpressionOverride(2, 40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Outfit Property ClothesTavernWenchOutfit  Auto  
armor Property ClothesWenchClothes01 Auto  

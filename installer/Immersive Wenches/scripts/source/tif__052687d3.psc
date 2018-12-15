;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__052687D3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().RemoveItem(Gold001, 69)
utility.wait(2.0)
game.FadeOutGame(false, true, 10.0, 9.0)
Game.GetPlayer().DispelSpell(lalawench_bless_spell)
utility.wait(1.0)
lalaSound.PlayAndWait(PlayerRef as ObjectReference)
utility.wait(3.0)
lalawench_bless_spell.Cast(PlayerRef,PlayerRef)
lalawench_WenchMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
 
MiscObject Property Gold001  Auto

Spell Property lalawench_bless_spell Auto

ImageSpaceModifier Property lalawench_FadeInOut  Auto

Sound Property lalaSound Auto

Actor Property PlayerRef auto

message property lalawench_WenchMessage auto

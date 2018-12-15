;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_tipreward Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.disablePlayerControls()
Game.getplayer().RemoveItem(Gold001, 35)
Game.getplayer().AddItem(lalawench_reward, 1)
Game.GetPlayer().DispelSpell(lalawench_charm_spell)
utility.wait(1.0)
lalawench_charm_spell.Cast(PlayerRef)
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property lalawench_reward  Auto  

MiscObject Property Gold001  Auto

Spell Property lalawench_charm_spell Auto

Actor Property PlayerRef auto

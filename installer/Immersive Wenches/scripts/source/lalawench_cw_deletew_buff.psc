;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_cw_deleteW_buff Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().DispelSpell(lalawench_CW_bless_capturedW_spell)
lalawench_CW_delete_SPL.Cast(akSpeaker)
utility.wait(1.0)
lalawench_CW_bless_capturedW_spell.Cast(PlayerRef,PlayerRef)
Game.getplayer().RemoveItem(Gold001, 400)
akSpeaker.addtofaction(lalawench_CW_Saved_delete)
Game.GetPlayer().addItem(lalawench_CW_reward, 1)
lalawench_CW_deleteMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

spell property lalawench_CW_delete_SPL auto
MiscObject Property Gold001  Auto
spell property lalawench_CW_bless_capturedW_spell auto
Actor Property PlayerRef auto
faction property lalawench_CW_Saved_delete auto
leveleditem property lalawench_CW_reward auto
message property lalawench_CW_deleteMessage auto

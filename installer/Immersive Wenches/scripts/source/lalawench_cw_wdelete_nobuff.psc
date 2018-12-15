;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_Wdelete_nobuff Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lalawench_CW_delete_SPL.Cast(akSpeaker)
akSpeaker.addtofaction(lalawench_CW_Saved_delete)
lalawench_CW_deleteMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

spell property lalawench_CW_delete_SPL auto
faction property lalawench_CW_Saved_delete auto
message property lalawench_CW_deletemessage auto

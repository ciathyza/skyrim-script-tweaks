;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname EFF_TIF__02007AE9 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;PluginImportance.XFL_Importance(None, 0)
XFLMain.XFL_SendActionEvent(PluginImportance.GetIdentifier(), 0, None)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

EFFPluginImportance Property PluginImportance  Auto  

EFFCore Property XFLMain  Auto  

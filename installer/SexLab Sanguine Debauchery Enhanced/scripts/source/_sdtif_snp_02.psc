;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _sdtif_snp_02 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor slave =  _SDRAP_slave.GetReference() as Actor

	akSpeaker.AddItem( _SDPP_cabbage, 10, True )
	akSpeaker.ShowGiftMenu(false, _SDFL_Food)

While ( Utility.IsInMenuMode() )
EndWhile

If (Utility.RandomInt( 0, 100 ) > 80 )
	_SDKP_sex.SendStoryEvent( akRef1 = _SDRAP_master.GetReference() as ObjectReference, akRef2 =  slave, aiValue1 = 0, aiValue2 = Utility.RandomInt( 0, _SDGV_positions.GetValueInt() )  )

;	Self.GetOwningQuest().ModObjectiveGlobal( -1.0, _SDGVP_demerits, 3, _SDGVP_demerits_join.GetValue() as Float, False, True, _SDGVP_config_verboseMerits.GetValueInt() as Bool )
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property _SDRAP_master  Auto  
ReferenceAlias Property _SDRAP_slave  Auto  
Keyword Property _SDKP_sex  Auto  
Potion Property _SDPP_cabbage  Auto  
GlobalVariable Property _SDGV_positions  Auto  
GlobalVariable Property _SDGVP_demerits  Auto 
GlobalVariable Property _SDGVP_demerits_join  Auto  
GlobalVariable Property _SDGVP_config_verboseMerits  Auto

FormList Property _SDFL_Food  Auto  

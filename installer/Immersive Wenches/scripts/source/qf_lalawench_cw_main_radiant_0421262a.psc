;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_lalawench_CW_Main_Radiant_0421262A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Dirge_Thieves_Guild
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dirge_Thieves_Guild Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY captured_wench
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_captured_wench Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int placeVariable = Utility.RandomInt(1, 25)
if (placeVariable == 1)
Xmarker_Cragslane.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 2)
Xmarker_embermine.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 3)
Xmarker_riverwatch.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 4)
Xmarker_valtheimkeep.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 5)
Xmarker_bilegulchmine.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 6)
Xmarker_UtteringCave.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 7)
Xmarker_snowpointbeacon.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 8)
Xmarker_StonyCreekCave.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 9)
Xmarker_BrokenHelm.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 10)
Xmarker_CrackedTusk.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 11)
Xmarker_FaldarTooth.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 12)
Xmarker_FortFellhammer.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 13)
Xmarker_FourSkull.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 14)
Xmarker_FrostmereCrypt.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 15)
Xmarker_HaltedStream.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 16)
Xmarker_KnifepointRidge.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 17)
Xmarker_LostKnife.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 18)
Xmarker_Mistwatch.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 19)
Xmarker_Orotheim.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 20)
Xmarker_RedoranRetreat.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 21)
Xmarker_RiftWatchtower.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 22)
Xmarker_RobberGorge.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 23)
Xmarker_SilentMoons.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 24)
Xmarker_SwindlerDen.placeAtMe(lalawench_CW_captured_Wench)
elseif (placeVariable == 25)
Xmarker_TrevaWatch.placeAtMe(lalawench_CW_captured_Wench)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
utility.wait(2.0)
       lalawench_CW_Main_Radiant.stop()
utility.wait(1.0)
       lalawench_CW_Main_Radiant.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ACTORBASE PROPERTY lalawench_CW_captured_Wench AUTO
ObjectReference Property Xmarker_Cragslane Auto
ObjectReference Property Xmarker_embermine Auto
ObjectReference Property Xmarker_riverwatch Auto
ObjectReference Property Xmarker_valtheimkeep Auto
ObjectReference Property Xmarker_bilegulchmine Auto
ObjectReference Property Xmarker_UtteringCave Auto
ObjectReference Property Xmarker_snowpointbeacon Auto
ObjectReference Property Xmarker_StonyCreekCave Auto
ObjectReference Property Xmarker_BrokenHelm Auto
ObjectReference Property Xmarker_CrackedTusk Auto
ObjectReference Property Xmarker_FaldarTooth Auto
ObjectReference Property Xmarker_FortFellhammer Auto
ObjectReference Property Xmarker_FourSkull Auto
ObjectReference Property Xmarker_FrostmereCrypt Auto
ObjectReference Property Xmarker_HaltedStream Auto
ObjectReference Property Xmarker_KnifepointRidge Auto
ObjectReference Property Xmarker_LostKnife Auto
ObjectReference Property Xmarker_Mistwatch Auto
ObjectReference Property Xmarker_Orotheim Auto
ObjectReference Property Xmarker_RedoranRetreat Auto
ObjectReference Property Xmarker_RiftWatchtower Auto
ObjectReference Property Xmarker_RobberGorge Auto
ObjectReference Property Xmarker_SilentMoons Auto
ObjectReference Property Xmarker_SwindlerDen Auto
ObjectReference Property Xmarker_TrevaWatch Auto
quest property lalawench_CW_Main_Radiant auto

;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname defe_tif__030d1f1a Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerScr.UnregisterForUpdate()
Defeat.QSTStage = 0
PlayerScr.AliasLastAgg.Clear()
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor Victim = Game.GetPlayer()
Debug.SendAnimationEvent(Victim, "IdleGive")
Utility.Wait(1)
Weapon Equipped = Victim.GetEquippedWeapon()
If Equipped
	PlayerScr.MiscFormLists[1].AddForm(Equipped) ; StrippedStuff
	Victim.DropObject(Equipped)
Endif
Equipped = Victim.GetEquippedWeapon(True)
If Equipped
	PlayerScr.MiscFormLists[1].AddForm(Equipped) ; StrippedStuff
	Victim.DropObject(Equipped)
Endif
Armor Shield = Victim.GetEquippedShield()
If Shield
	PlayerScr.MiscFormLists[1].AddForm(Shield) ; StrippedStuff
	Victim.DropObject(Shield)
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property PlayerVictimQst Auto
DefeatPlayer Property PlayerScr Auto
DefeatConfig Property Defeat Auto

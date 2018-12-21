;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname Defe_SF_DefeatSOProstitute_0313F2C9 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Defeat.SOProstitute(Victim, Aggressor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(GetOwningQuest() as DefeatActionScr).GoToState("")
Victim = LastInSack.GetReference() as actor
Aggressor = LastInSackAggressor.GetReference() as actor
Aggressor.AllowPCDialogue(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Aggressor.AllowPCDialogue(True)
If ((GetOwningQuest() as DefeatActionScr).GetState() != "Carrying")
    (GetOwningQuest() as DefeatActionScr).GoToState("Running")
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DefeatConfig Property Defeat Auto
ReferenceAlias Property LastInSack Auto
ReferenceAlias Property LastInSackAggressor Auto
Actor Victim
Actor Aggressor

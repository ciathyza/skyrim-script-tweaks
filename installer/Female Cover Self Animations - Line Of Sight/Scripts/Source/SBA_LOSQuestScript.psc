Scriptname SBA_LOSQuestScript extends ReferenceAlias

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor Property PlayerRef Auto
SBA_ConfigQuest Property Config Auto
Spell[] Property LOSCloakRadius Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Int Index


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnInit()
	Index = (Config.LOSCloakRadius)
	RegisterForSingleUpdate(1)
EndEvent


Event OnUpdate()
	PlayerRef.AddSpell(LOSCloakRadius[Index], false)
	Utility.Wait(0.5)
	If Index != (Config.LOSCloakIndex)
		PlayerRef.RemoveSpell(LOSCloakRadius[Index])
		Index = (Config.LOSCloakIndex)
	Else
		PlayerRef.RemoveSpell(LOSCloakRadius[Index])
	EndIf

	If Config.IsEnabled
		RegisterForSingleUpdate(Config.LOSCloakRate - 0.5)
	EndIf
EndEvent

Scriptname SBA_NPCQuestScript extends ReferenceAlias

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor Property PlayerRef Auto
SBA_ConfigQuest Property Config Auto
Spell[] Property NPCCloakRadius Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Int Index


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnInit()
	Index = (Config.NPCCloakIndex)
	RegisterForSingleUpdate(1)
EndEvent


Event OnUpdate()
	PlayerRef.AddSpell(NPCCloakRadius[Index], false)
	Utility.Wait(0.5)
	If Index != (Config.NPCCloakIndex)
		PlayerRef.RemoveSpell(NPCCloakRadius[Index])
		Index = (Config.NPCCloakIndex)
	Else
		PlayerRef.RemoveSpell(NPCCloakRadius[Index])
	EndIf

	If Config.IsEnabled
		RegisterForSingleUpdate(Config.NPCCloakRate - 0.5)
	EndIf
EndEvent

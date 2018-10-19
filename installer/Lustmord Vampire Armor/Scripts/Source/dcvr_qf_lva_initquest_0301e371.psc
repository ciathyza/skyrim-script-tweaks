Scriptname DCVR_QF_LVA_InitQuest_0301E371 Extends Quest Hidden

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor          Property PlayerRef        Auto
Perk           Property Bloodthirst      Auto
Perk           Property BonusArmor1      Auto
Perk           Property BonusArmor2      Auto
Perk           Property BonusArmor3      Auto
Perk           Property LVAsmithing      Auto
Perk           Property MatchingSet      Auto
ReferenceAlias Property Alias_Corpse     Auto
SPELL          Property BloodthirstPower Auto
SPELL          Property GarterPouch      Auto


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

Function Fragment_0()
	; Execution Delay.
	Utility.Wait(60.0)

	SetActive()
	PlayerRef.AddSpell(GarterPouch, False)
	PlayerRef.AddSpell(BloodthirstPower, False)
	PlayerRef.AddPerk(Bloodthirst)
	PlayerRef.AddPerk(MatchingSet)
	PlayerRef.AddPerk(BonusArmor1)
	PlayerRef.AddPerk(BonusArmor2)
	PlayerRef.AddPerk(BonusArmor3)
	PlayerRef.AddPerk(LVAsmithing)
	SetObjectiveDisplayed(10)
EndFunction


Function Fragment_2()
	CompleteAllObjectives()
	Stop()
EndFunction

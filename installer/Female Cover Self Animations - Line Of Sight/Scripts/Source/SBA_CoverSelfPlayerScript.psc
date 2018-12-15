;
; Manages the self-covering mechanic on the player character.
;
Scriptname SBA_CoverSelfPlayerScript extends ReferenceAlias

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor               Property PlayerRef                    Auto
GlobalVariable      Property SBA_LOSEnabled               Auto
GlobalVariable      Property SBA_LOSPlayerState           Auto
Keyword             Property ArmorCuirass                 Auto
Keyword             Property ClothingBody                 Auto
SBA_configquest     Property Config                       Auto
SBA_CoverSelfScript Property myMod                        Auto
Spell               Property SBA_CoverTopAndBottomAbility Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Bool IsNude
Bool IsCovered
Bool WaitForUncover


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnPlayerLoadGame()
	myMod.Initialize()
EndEvent


Event OnObjectEquipped(Form akBaseForm, ObjectReference akReference)
	Armor a = akBaseForm as Armor
	If a && (a.HasKeyword(ArmorCuirass) || a.HasKeyword(ClothingBody))
		Utility.Wait(1)
		IsNude = false
	EndIf
EndEvent


Event OnObjectUnequipped(Form akBaseForm, ObjectReference akReference)
	Armor a = akBaseForm as Armor
	If a && (a.HasKeyword(ArmorCuirass) || a.HasKeyword(ClothingBody))
		IsNude = true
	EndIf
EndEvent


Event OnUpdate()
	If (SBA_LOSEnabled.GetValue() as Bool)
		If (SBA_LOSPlayerState.GetValue() as Int > 0)
			If WaitForUncover
				WaitForUncover = false
			EndIf
			If (!IsCovered && IsNude)
				IsCovered = true
				PlayerRef.AddSpell(SBA_CoverTopAndBottomAbility, false)
			ElseIf (IsCovered && !IsNude)
				IsCovered = false
				PlayerRef.RemoveSpell(SBA_CoverTopAndBottomAbility)
				myMod.ResetAnimation(PlayerRef)
			EndIf
		Else
			If (IsCovered && !WaitForUncover)
				WaitForUncover = true
				Uncover()
			EndIf
		EndIf

		If Config.IsEnabled
			RegisterForSingleUpdate(Config.LOSUpdateRate)
		Else
			If (IsCovered)
				WaitForUncover = true
				Uncover()
			EndIf
		EndIf
	EndIf
EndEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

Function Uncover()
	Float Seconds = (Config.LOSUncoverDelay)
	While (Seconds > 0)
		Utility.Wait(0.1)
		Seconds -= 0.1
		If !WaitForUncover
			Return
		EndIf 
	EndWhile
	If IsCovered
		IsCovered = false
		PlayerRef.RemoveSpell(SBA_CoverTopAndBottomAbility)
		myMod.ResetAnimation(PlayerRef)
	EndIf
EndFunction

;
; Manages the self-covering mechanic on any NPCs and follower characters.
;
Scriptname SBA_CoverSelfMonitorEffectScript extends ActiveMagicEffect  

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

GlobalVariable      Property SBA_FollowerEnabled          Auto
GlobalVariable      Property SBA_LOSPlayerState           Auto
Keyword             Property ArmorCuirass                 Auto
Keyword             Property ClothingBody                 Auto
SBA_configquest     Property Config                       Auto
SBA_CoverSelfScript Property myMod                        Auto
Spell               Property SBA_CoverSelfMonitorAbility  Auto
Spell               Property SBA_CoverTopAndBottomAbility Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Actor ActorRef
Bool IsCovered
Bool IsFollower
Bool IsNude
Bool WaitForUncover


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnLoad()
	ChangeAnimation()
EndEvent


Event OnAttachedToCell()
	ChangeAnimation()
EndEvent


Event OnUpdate()
	If (SBA_FollowerEnabled.GetValue() as Bool)
		If (SBA_LOSPlayerState.GetValue() as Int > 0)
			If WaitForUncover
				WaitForUncover = false
			EndIf
			If (!IsCovered && IsNude)
				IsCovered = true
				ActorRef.AddSpell(SBA_CoverTopAndBottomAbility, false)
			ElseIf IsCovered && !IsNude
				IsCovered = false
				ActorRef.RemoveSpell(SBA_CoverTopAndBottomAbility)
				myMod.ResetAnimation(ActorRef)
			EndIf
		Else
			If (IsCovered && !WaitForUncover)
				WaitForUncover = true
				Uncover()
			EndIf
		EndIf
	EndIf

	If Config.IsEnabled
		RegisterForSingleUpdate(Config.LOSUpdateRate)
	Else
		If IsCovered
			WaitForUncover = true
			Uncover()
		EndIf
	EndIf
EndEvent


Event OnEffectStart(Actor akTarget, Actor akCaster)
	ActorRef = akTarget
	If ActorRef.IsPlayerTeammate()
		IsFollower = true
		RegisterForSingleUpdate(1)
	Else
		ChangeAnimation()
	EndIf
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	ActorRef.RemoveSpell(SBA_CoverTopAndBottomAbility)
	myMod.ResetAnimation(ActorRef)
	ActorRef.RemoveSpell(SBA_CoverSelfMonitorAbility)
EndEvent


Event OnObjectEquipped(Form akBaseForm, ObjectReference akReference)
	Armor a = akBaseForm as Armor
	If a && (a.HasKeyword(ArmorCuirass) || a.HasKeyword(ClothingBody))
		Utility.Wait(1)
		If (IsFollower && SBA_FollowerEnabled.GetValue() as Bool)
			IsNude = false
		Else
			ChangeAnimation()
		EndIf
	Endif
EndEvent


Event OnObjectUnequipped(Form akBaseForm, ObjectReference akReference)
	Armor a = akBaseForm as Armor
	If a && (a.HasKeyword(ArmorCuirass) || a.HasKeyword(ClothingBody))
		If (IsFollower && SBA_FollowerEnabled.GetValue() as Bool)
			IsNude = true
		Else
			ChangeAnimation()
		EndIf
	Endif
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
		ActorRef.RemoveSpell(SBA_CoverTopAndBottomAbility)
		myMod.ResetAnimation(ActorRef)
	EndIf
EndFunction


Function ChangeAnimation()
	If !ActorRef.WornHasKeyword(ArmorCuirass) && !ActorRef.WornHasKeyword(ClothingBody)
		If (IsFollower && SBA_FollowerEnabled.GetValue() as Bool)
			IsNude = true
		Else
			ActorRef.AddSpell(SBA_CoverTopAndBottomAbility, false)
		EndIf
	Else
		If (IsFollower && SBA_FollowerEnabled.GetValue() as Bool)
			IsNude = false
		Else
			ActorRef.RemoveSpell(SBA_CoverTopAndBottomAbility)
			myMod.ResetAnimation(ActorRef)
		EndIf
	EndIf
EndFunction

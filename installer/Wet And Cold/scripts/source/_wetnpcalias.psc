Scriptname _WetNPCAlias extends ReferenceAlias   

;====================================================================================

_WetQuestScript Property _WetQuest Auto

Bool Property NPCFX Auto
Bool Property NPCColdFX Auto
Bool Property NPCRainFX Auto
Bool Property NPCAshFX Auto
Bool Property NPCColdDeadFX Auto
Bool Property CreatureFX Auto
Bool Property CreatureColdFX Auto
Bool Property CreatureRainFX Auto
Bool Property GearColdFX Auto
Bool Property GearColdChildFX Auto
Bool Property GearRainFX Auto
Bool Property GearSurvFX Auto
Bool Property GearAshFX Auto

Actor targ

;====================================================================================

Function Clean()
	targ.RemoveSpell(_WetQuest._WetNPCEquipColdChildSpell)
	targ.RemoveSpell(_WetQuest._WetNPCEquipColdSpell)
	targ.RemoveSpell(_WetQuest._WetNPCEquipRainSpell)
	targ.RemoveSpell(_WetQuest._WetNPCEquipSurvivalSpell)
	targ.RemoveSpell(_WetQuest._WetNPCFXColdDeadSpell)
	targ.RemoveSpell(_WetQuest._WetNPCFXColdSpell)
	targ.RemoveSpell(_WetQuest._WetNPCFXRainSpell)
	targ.RemoveSpell(_WetQuest._WetNPCFXAshSpell)
	targ.RemoveSpell(_WetQuest._WetNPCFXGeneralSpell)
	targ.RemoveSpell(_WetQuest._WetCreatureFXColdSpell)
	targ.RemoveSpell(_WetQuest._WetCreatureFXRainSpell)
	targ.RemoveSpell(_WetQuest._WetCreatureFXGeneralSpell)

	targ.RemoveSpell(_WetQuest._WetNPCEquipRainSpell)
	targ.RemoveSpell(_WetQuest._WetNPCEquipColdSpell)
	targ.RemoveSpell(_WetQuest._WetNPCEquipColdChildSpell)
	targ.RemoveSpell(_WetQuest._WetNPCEquipSurvivalSpell)
	targ.RemoveSpell(_WetQuest._WetNPCEquipAshSpell)
	targ.RemoveSpell(_WetQuest._WetNPCSwimWetFeetSpell)
	GoToState("Nothing")
EndFunction

;====================================================================================
 
Event OnInit()
	targ = (GetRef() as Actor)
	If targ
		If !_WetQuest.ModUpdated
			If NPCFX
				GoToState("NPCFX")
			ElseIf NPCColdFX
				GoToState("NPCColdFX")
			ElseIf NPCRainFX
				GoToState("NPCRainFX")
			ElseIf NPCAshFX
				GoToState("NPCAshFX")
			ElseIf CreatureFX
				GoToState("CreatureFX")
			ElseIf CreatureColdFX
				GoToState("CreatureColdFX")
			ElseIf CreatureRainFX
				GoToState("CreatureRainFX")
			ElseIf NPCColdDeadFX
				GoToState("NPCColdDeadFX")
			ElseIf GearColdFX
				GoToState("GearColdFX")
			ElseIf GearColdChildFX
				GoToState("GearColdChildFX")
			ElseIf GearRainFX
				GoToState("GearRainFX")
			ElseIf GearSurvFX
				GoToState("GearSurvFX")
			ElseIf GearAshFX
				GoToState("GearAshFX")
			EndIf
		Else
			Clean()
		EndIf
	EndIf
EndEvent

;====================================================================================

State NPCFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCFXGeneralSpell)
		Utility.Wait(0.5)
		targ.EvaluatePackage()
		GoToState("Nothing")
	EndEvent

EndState

State NPCColdFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCFXColdSpell)
		GoToState("Nothing")
	EndEvent

EndState

State NPCRainFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCFXRainSpell)
		GoToState("Nothing")
	EndEvent

EndState

State NPCAshFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCFXAshSpell)
		GoToState("Nothing")
	EndEvent

EndState

State NPCColdDeadFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCFXColdDeadSpell)
		GoToState("Nothing")
	EndEvent

EndState

State CreatureFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetCreatureFXGeneralSpell)
		Utility.Wait(0.5)
		targ.EvaluatePackage()
		GoToState("Nothing")
	EndEvent

EndState

State CreatureColdFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetCreatureFXColdSpell)
		GoToState("Nothing")
	EndEvent

EndState

State CreatureRainFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetCreatureFXRainSpell)
		GoToState("Nothing")
	EndEvent

EndState

;====================================================================================

State GearColdFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCEquipColdSpell)
		GoToState("Nothing")
	EndEvent

EndState

State GearColdChildFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCEquipColdChildSpell)
		GoToState("Nothing")
	EndEvent

EndState

State GearRainFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCEquipRainSpell)
		GoToState("Nothing")
	EndEvent

EndState

State GearSurvFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCEquipSurvivalSpell)
		GoToState("Nothing")
	EndEvent

EndState

State GearAshFX

	Event OnBeginState()
		targ.AddSpell(_WetQuest._WetNPCEquipAshSpell)
		GoToState("Nothing")
	EndEvent

EndState

State Nothing
EndState
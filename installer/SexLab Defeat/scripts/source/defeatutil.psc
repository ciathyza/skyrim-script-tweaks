Scriptname DefeatUtil Hidden

DefeatConfig Function GetDefeat() Global ; Get Defeat scripts.
	Return (Game.GetFormFromFile(0x4B8D1, "SexLabDefeat.esp") As DefeatConfig)
EndFunction

Bool Function IsDefeatActive(Actor Target) Global ; Check if the target is affected by Defeat stuff.
	Return GetDefeat().IsDefeatActive(Target)
EndFunction

Bool Function StartScene(Actor[] TheActors, Bool ForceSurrender = False, Bool ForceKnockOut = False, Bool ForceAutoResist = False, \ 		
	String ForceScenario = "", 		String ForceEvent = "",		Int ForcePostAssaultOnly = 3,	Int ForceStayDown = 3, 			Int ForceResist = 3, 	Int ForceRob = 3, \
	Int ForceRelation = 3,			Int ForceWitness = 3,		Int ForceCommentary = 3,		Int ForcePlayerCommentary = 3) Global
	DefeatConfig Defeat = GetDefeat()
	If Defeat.StartScene(TheActors, ForceSurrender = ForceSurrender, ForceKnockOut = ForceKnockOut, ForceAutoResist = ForceAutoResist, ForceScenario = ForceScenario, ForceEvent = ForceEvent, ForcePostAssaultOnly = ForcePostAssaultOnly, ForceStayDown = ForceStayDown, ForceResist = ForceResist, ForceRob = ForceRob, ForceRelation = ForceRelation, ForceWitness = ForceWitness, ForceCommentary = ForceCommentary, ForcePlayerCommentary = ForcePlayerCommentary)
		Return True
	Endif
	Return False
	; Will return false if player as victim is disabled in defeat
	; Description of the function in DefeatConfig script.
EndFunction

Actor Function GetLastSceneAggressor() Global
	Return GetDefeat().LastSceneTheLast
EndFunction

Actor[] Function GetLastSceneAggressors() Global
	Return GetDefeat().LastSceneAggressors
EndFunction
Actor[] Function GetLastSceneAccomplices() Global
	Return GetDefeat().LastSceneAccomplices
EndFunction

Actor[] Function GetLastSceneFollowers() Global
	Return GetDefeat().LastSceneFollowers
EndFunction

Bool Function GetLastSceneRaped() Global
	Return GetDefeat().LastSceneRaped
EndFunction

Bool Function GetLastSceneRobbed() Global
	Return GetDefeat().LastSceneRobbed
EndFunction


; Break undies plus support
;Bool Function BUIsNotFullyBroken(Form BodyArmor) Global
;	BU_ArmorStats BodyArmorScript = (BodyArmor As BU_ArmorStats)
;	Return (BodyArmorScript.currentStage < BodyArmorScript.numStages)
;EndFunction
Function BUBreakArmor(Actor Target, Form BodyArmor) Global
	BU_ArmorStats BodyArmorScript = (BodyArmor As BU_ArmorStats)
	BodyArmorScript.BreakArmor(Target)
EndFunction
Function BUAdvanceStage(Actor Target, Form BodyArmor) Global
	BU_ArmorStats BodyArmorScript = (BodyArmor As BU_ArmorStats)
	BodyArmorScript.AdvanceStage(Target)
EndFunction
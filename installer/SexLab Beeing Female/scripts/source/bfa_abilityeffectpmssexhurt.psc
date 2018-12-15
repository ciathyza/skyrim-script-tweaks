;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityEffectPMSSexHurt.psc
Modified : 2016-12-06 03:52:12
Compiled : 2017-01-15 06:28:41
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityEffectPMSSexHurt extends activemagiceffect

;-- Properties --------------------------------------
fwsystem property System auto
sexlabframework property SexLab auto

;-- Variables ---------------------------------------
Float DamageScale
actor PlayerRef
Bool IsPlayer
Float iSexHurt = 0.000000

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectFinish(actor akTarget, actor akCaster)

	; Empty function
endFunction

function OnUpdate()

	if PlayerRef as Bool && IsPlayer as Bool && iSexHurt > 0.000000 && self.isFormValid()
		System.DoDamage(PlayerRef, iSexHurt, 2, 0.000000)
	endIf
	self.RegisterForSingleUpdate(2.00000)
endFunction

Bool function isFormValid()

	return PlayerRef as form != none && PlayerRef.GetLeveledActorBase() != none
endFunction

function SexLabStageExit(String hookName, String argString, Float argNum, form sender)

	iSexHurt = 0.000000
endFunction

function onSexLabOrgasm(String hookName, String argString, Float argNum, form sender)

	if PlayerRef as Bool && self.isFormValid()
		sslthreadcontroller ssl_controller = SexLab.HookController(argString)
		if ssl_controller == none
			return 
		endIf
		sslbaseanimation animation = ssl_controller.animation
		Int NumberOfActors = animation.PositionCount
		if animation.HasTag("Vaginal") && NumberOfActors > 1 && ssl_controller.Positions.find(PlayerRef, 0) >= 0
			if IsPlayer
				PlayerRef.DamageActorValue("Health", PlayerRef.GetBaseActorValue("Health") / 100.000 * 10.0000 * DamageScale)
			endIf
			iSexHurt = 2.00000
			if animation.HasTag("Rough")
				iSexHurt += 2.50000
			endIf
			if animation.HasTag("Aggressive")
				iSexHurt += 2.80000
			endIf
		endIf
	endIf
endFunction

function SexLabStageEnter(String hookName, String argString, Float argNum, form sender)

	if PlayerRef as Bool && self.isFormValid()
		sslthreadcontroller ssl_controller = SexLab.HookController(argString)
		if ssl_controller == none
			return 
		endIf
		sslbaseanimation animation = ssl_controller.animation
		Int NumberOfActors = animation.PositionCount
		if animation.HasTag("Vaginal") && NumberOfActors > 1 && ssl_controller.Positions.find(PlayerRef, 0) >= 0
			if IsPlayer
				PlayerRef.DamageActorValue("Health", PlayerRef.GetBaseActorValue("Health") / 100.000 * 10.0000 * DamageScale)
			endIf
			iSexHurt = 1.10000
			if animation.HasTag("Rough")
				iSexHurt += 1.20000
			endIf
			if animation.HasTag("Aggressive")
				iSexHurt += 1.30000
			endIf
		endIf
	endIf
endFunction

function OnEffectStart(actor target, actor caster)

	PlayerRef = target
	if PlayerRef
		IsPlayer = PlayerRef == game.GetPlayer()
		self.RegisterForModEvent("OrgasmStart", "onSexLabOrgasm")
		self.RegisterForModEvent("StageStart", "SexLabStageEnter")
		self.RegisterForModEvent("PositionChange", "SexLabStageEnter")
		self.RegisterForModEvent("EndThread", "SexLabStageExit")
		self.RegisterForSingleUpdate(2.00000)
	else
		self.Dispel()
	endIf
endFunction

; Skipped compiler generated GetState

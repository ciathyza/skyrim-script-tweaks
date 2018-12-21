Scriptname BFA_AbilityEffectPMSSexHurt extends activemagiceffect  

FWSystem property System Auto
SexLabFramework Property SexLab Auto

float iSexHurt = 0.0
bool IsPlayer
float DamageScale
actor PlayerRef

Event OnEffectStart(Actor target, Actor caster)
	PlayerRef = target
	
	If PlayerRef
		IsPlayer = (PlayerRef == Game.GetPlayer())
		
		RegisterForModEvent("OrgasmStart", "onSexLabOrgasm")
		RegisterForModEvent("StageStart", "SexLabStageEnter")
		RegisterForModEvent("PositionChange", "SexLabStageEnter")
		RegisterForModEvent("EndThread", "SexLabStageExit")
		RegisterForSingleUpdate(2)
	Else
		Dispel()
	EndIf
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;UnregisterForUpdate()
	;UnRegisterForModEvent("OrgasmStart")
	;UnRegisterForModEvent("StageStart")
	;UnRegisterForModEvent("PositionChange")
	;UnRegisterForModEvent("EndThread")
EndEvent

Event onSexLabOrgasm(string hookName, string argString, float argNum, form sender)
	If PlayerRef && isFormValid() ;***Edit by Bane
		sslThreadController ssl_controller = SexLab.HookController(argString) ;***Edit by Bane
		if ssl_controller==none
			return
		endif
		sslBaseAnimation animation = ssl_controller.Animation
		Int NumberOfActors = animation.PositionCount
		If animation.HasTag("Vaginal") && (NumberOfActors > 1) && (ssl_controller.Positions.Find(PlayerRef) >= 0)
			If IsPlayer
				PlayerRef.DamageActorValue("Health", ((PlayerRef.GetBaseActorValue("Health") / 100) * 10) * DamageScale);
			EndIf
			iSexHurt = 2.0
			if animation.HasTag("Rough")
				iSexHurt += 2.5
			endIf
			if animation.HasTag("Aggressive")
				iSexHurt += 2.8
			endIf
		EndIf
	EndIf
EndEvent

Event SexLabStageEnter(string hookName, string argString, float argNum, form sender)
	If PlayerRef && isFormValid() ;***Edit by Bane
		sslThreadController ssl_controller = SexLab.HookController(argString) ;***Edit by Bane
		if ssl_controller==none
			return
		endif
		sslBaseAnimation animation = ssl_controller.Animation
		Int NumberOfActors = animation.PositionCount
		If animation.HasTag("Vaginal") && (NumberOfActors > 1) && (ssl_controller.Positions.Find(PlayerRef) >= 0)
			If IsPlayer
				PlayerRef.DamageActorValue("Health", ((PlayerRef.GetBaseActorValue("Health") / 100) * 10) * DamageScale);
			EndIf
			iSexHurt = 1.1
			if animation.HasTag("Rough")
				iSexHurt += 1.2
			endIf
			if animation.HasTag("Aggressive")
				iSexHurt += 1.3
			endIf
		EndIf
	EndIf
EndEvent

Event SexLabStageExit(string hookName, string argString, float argNum, form sender)
	iSexHurt = 0
EndEvent

Event OnUpdate()
	if PlayerRef && IsPlayer && (iSexHurt > 0) && isFormValid() ;***Edit by Bane
		System.DoDamage(PlayerRef,iSexHurt,2) ; Do PMS Damage
	endIf
	RegisterForSingleUpdate(2)
endEvent

bool Function isFormValid() ;***Added by Bane
	return (PlayerRef as form) != none && (PlayerRef.GetLeveledActorBase() as ActorBase) != none
endfunction
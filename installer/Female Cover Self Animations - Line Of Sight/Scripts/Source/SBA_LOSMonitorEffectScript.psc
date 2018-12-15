Scriptname SBA_LOSMonitorEffectScript extends ActiveMagicEffect  

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor Property PlayerRef Auto
GlobalVariable Property SBA_LOSPlayerState Auto
SBA_configquest Property Config Auto
Spell Property SBA_LOSMonitorAbility Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Actor ActorRef
Bool LOS


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnUpdate()
    If LOS
        RegisterForSingleLOSLost(ActorRef, PlayerRef)
    Else
        RegisterForSingleLOSGain(ActorRef, PlayerRef)
    EndIf
EndEvent


Event OnEffectStart(Actor akTarget, Actor akCaster)
    ActorRef = akTarget
    RegisterForSingleUpdate(Config.LOSMonitorRate)
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
    If LOS
        SBA_LOSPlayerState.SetValue(SBA_LOSPlayerState.GetValue() - 1)
    EndIf
    ActorRef.RemoveSpell(SBA_LOSMonitorAbility)
EndEvent


Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
    akTarget as Actor
    If (akTarget == PlayerRef)
        SBA_LOSPlayerState.SetValue(SBA_LOSPlayerState.GetValue() + 1)
        LOS = true
        RegisterForSingleUpdate(Config.LOSMonitorRate)
    EndIf
EndEvent


Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
    akTarget as Actor
    If (akTarget == PlayerRef)
        SBA_LOSPlayerState.SetValue(SBA_LOSPlayerState.GetValue() - 1)
        LOS = false
        RegisterForSingleUpdate(Config.LOSMonitorRate)
    EndIf
EndEvent

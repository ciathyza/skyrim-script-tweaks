Scriptname SBA_ToggleNpcLOSScript extends ActiveMagicEffect  

SBA_CoverSelfScript Property myMod Auto
SBA_ConfigQuest Property Config Auto
GlobalVariable Property SBA_LOSEnabled Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Bool enabled = !(SBA_LOSEnabled.GetValue() as Bool)
  If Enabled
		Debug.Notification("NPC LOS Detection Enabled")
	Else
		Debug.Notification("NPC LOS Detection Disabled")
	EndIf
	Config.EnableLOS(enabled)
EndEvent

Scriptname SBA_ToggleNpcCoverSelfScript extends ActiveMagicEffect  

SBA_CoverSelfScript Property myMod Auto
SBA_ConfigQuest Property Config Auto
GlobalVariable Property SBA_NpcCoverSelfEnabled Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Bool enabled = !(SBA_NpcCoverSelfEnabled.GetValue() as Bool)
	If enabled
		Debug.Notification("NPC Cover Self Enabled")
	Else
		Debug.Notification("NPC Cover Self Disabled")
	EndIf
	Config.EnableNPC(enabled)
EndEvent

Scriptname SBA_ToggleFacialExpressionScript extends ActiveMagicEffect  

SBA_CoverSelfScript Property myMod Auto
GlobalVariable Property SBA_FacialExpressionEnabled Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Bool enabled = !(SBA_FacialExpressionEnabled.GetValue() as Bool)
	If enabled
		Debug.Notification("Facial Expressions Enabled")
	Else
		Debug.Notification("Facial Expressions Disabled")
	EndIf
	SBA_FacialExpressionEnabled.SetValue(enabled as Int)
EndEvent

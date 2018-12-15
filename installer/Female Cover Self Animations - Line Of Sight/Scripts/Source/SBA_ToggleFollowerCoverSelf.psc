Scriptname SBA_ToggleFollowerCoverSelf extends ActiveMagicEffect  

SBA_CoverSelfScript Property myMod Auto
GlobalVariable Property SBA_FollowerEnabled Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Bool enabled = !(SBA_FollowerEnabled.GetValue() as Bool)
	If enabled
		Debug.Notification("Follower Cover Self Enabled")
	Else
		Debug.Notification("Follower Cover Self Disabled")
	EndIf
	SBA_FollowerEnabled.SetValue(enabled as Int)
EndEvent

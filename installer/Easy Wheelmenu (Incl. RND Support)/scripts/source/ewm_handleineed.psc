Scriptname EWM_HandleINeed extends EWM_HandleModBase 

; 0 : Eat
; 1 : Drink
; 2 : Sit

Event On_EWM_INEED_EAT()
	_SNSkyUIConfig iNeedProxy = Quest.GetQuest("_SNSKConfigQuest") As _SNSkyUIConfig
	Actor targ = iNeedProxy._SNQuest.PlayerRef
	iNeedProxy._SNQuest.AutoEat(targ)
	Utility.Wait(0.75)
EndEvent

Event On_EWM_INEED_DRINK()
	_SNSkyUIConfig iNeedProxy = Quest.GetQuest("_SNSKConfigQuest") As _SNSkyUIConfig
	Actor targ = iNeedProxy._SNQuest.PlayerRef
	iNeedProxy._SNQuest.AutoDrink(targ)
	Utility.Wait(0.75)
EndEvent

Event On_EWM_INEED_SIT()
	_SNSkyUIConfig iNeedProxy = Quest.GetQuest("_SNSKConfigQuest") As _SNSkyUIConfig
	Actor targ = iNeedProxy._SNQuest.PlayerRef
	Game.ForceThirdPerson()
	Debug.SendAnimationEvent(targ, "IdleSitCrossLeggedEnter")
	iNeedProxy._SNQuest.IsSitting = True
	Utility.Wait(0.25)
	If iNeedProxy.FollowerNeedsType > 0
		iNeedProxy.SendModEvent("_SN_PlayerSits")
	EndIf
	iNeedProxy.RegisterForAnimationEvent(iNeedProxy._SNQuest.PlayerRef, "JumpUp")
	Utility.Wait(0.75)
EndEvent

Event OnShowStatus(string eventName, string strArg, float numArg, Form sender)
	_SNSkyUIConfig iNeedProxy = Quest.GetQuest("_SNSKConfigQuest") As _SNSkyUIConfig
	iNeedProxy._SNQuest.CheckStatus()
EndEvent
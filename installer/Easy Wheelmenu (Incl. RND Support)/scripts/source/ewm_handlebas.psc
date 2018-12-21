Scriptname EWM_HandleBAS extends EWM_HandleModBase 

; 0 : Shower
; 1 : Bath

Event On_EWM_BATHING_Shower()
	mzinBatheQuest BathingProxy = Quest.GetQuest("mzinBatheQuest") As mzinBatheQuest
	If BathingProxy.TryShowerActor(Game.GetPlayer(), None) == False
		BathingProxy.ShoweringNeedsWaterMessage.Show()
	EndIf
EndEvent

Event On_EWM_BATHING_Bath()
	mzinBatheQuest BathingProxy = Quest.GetQuest("mzinBatheQuest") As mzinBatheQuest
	BathingProxy.TryBatheActor(Game.GetPlayer(), None)
EndEvent
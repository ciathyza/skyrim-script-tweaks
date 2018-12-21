Scriptname SFL4_Maintenance_Quest extends Quest  

; -----

GlobalVariable Property WCT_VE_Global_By Auto
GlobalVariable Property WCT_VE_Global_To Auto
GlobalVariable Property WCT_E_Global_By Auto
GlobalVariable Property WCT_E_Global_To Auto
GlobalVariable Property WCT_N_Global_By Auto
GlobalVariable Property WCT_N_Global_To Auto
GlobalVariable Property WCT_H_Global_By Auto
GlobalVariable Property WCT_H_Global_To Auto
GlobalVariable Property WCT_VH_Global_By Auto
GlobalVariable Property WCT_VH_Global_To Auto
GlobalVariable Property WCT_L_Global_By Auto
GlobalVariable Property WCT_L_Global_To Auto
GlobalVariable Property WCT_Quest_Global_DifficultyWatchdog Auto
Float Property WCT_UpdateRate Auto
Float Property WCT_UpdateRateInit Auto

; -----

;Event OnInit()

;	Utility.Wait(WCT_UpdateRateInit)
;	RegisterForSingleUpdate(WCT_UpdateRate)

;EndEvent

; -----

Function UGS()

	Utility.Wait(0.5)
	Game.SetGameSettingFloat("fDiffMultHPToPCVE", WCT_VE_Global_To.Value)
	Game.SetGameSettingFloat("fDiffMultHPByPCVE", WCT_VE_Global_By.Value)
	Game.SetGameSettingFloat("fDiffMultHPToPCE",  WCT_E_Global_To.Value)
	Game.SetGameSettingFloat("fDiffMultHPByPCE", WCT_E_Global_By.Value)
	Game.SetGameSettingFloat("fDiffMultHPToPCN", WCT_N_Global_To.Value)
	Game.SetGameSettingFloat("fDiffMultHPByPCN", WCT_N_Global_By.Value)
	Game.SetGameSettingFloat("fDiffMultHPToPCH", WCT_H_Global_To.Value)
	Game.SetGameSettingFloat("fDiffMultHPByPCH", WCT_H_Global_By.Value)
	Game.SetGameSettingFloat("fDiffMultHPToPCVH", WCT_VH_Global_To.Value)
	Game.SetGameSettingFloat("fDiffMultHPByPCVH", WCT_VH_Global_By.Value)
	Game.SetGameSettingFloat("fDiffMultHPToPCL", WCT_L_Global_To.Value)
	Game.SetGameSettingFloat("fDiffMultHPByPCL", WCT_L_Global_By.Value)

EndFunction

; -----

Event OnUpdate()

	If WCT_Quest_Global_DifficultyWatchdog.GetValue() == 1
		UGS()
	EndIf
	RegisterForSingleUpdate(WCT_UpdateRate)

EndEvent

; -----

Function StopPolling()

	UnregisterForUpdate()

EndFunction

; -----

Function StartPolling()

	RegisterForSingleUpdate(1.0)

EndFunction

; -----

Scriptname SFL4_Player_Script extends ReferenceAlias  

; -----
 
SFL4_Maintenance_Quest Property WCT Auto
GlobalVariable Property WCT_Quest_Global_DifficultyWatchdog Auto

; -----
 
Event OnPlayerLoadGame()

	Utility.Wait(1.0)
	If WCT_Quest_Global_DifficultyWatchdog.GetValue() == 1
		WCT.OnUpdate()
	EndIf

EndEvent

; -----
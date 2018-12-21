Scriptname slaResetScr extends activemagiceffect  

Int Property Dummy  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Debug.Notification("SexLab Aroused: trying to reset, please wait for 30 seconds...")
	Debug.Trace(Self+": trying to reset, please wait for 30 seconds...")

	Spell slaCloakSpell = Game.GetFormFromFile(0x0204DE5E, "SexLabAroused.esm") As Spell
	Spell slaDesireSpell = Game.GetFormFromFile(0x02038059, "SexLabAroused.esm") As Spell
	Spell slaResetSpell = Game.GetFormFromFile(0x02083BFD, "SexLabAroused.esm") As Spell
	
	Game.GetPlayer().RemoveSpell(slaResetSpell)
	Game.GetPlayer().RemoveSpell(slaCloakSpell)
	Game.GetPlayer().RemoveSpell(slaDesireSpell)
	
	Utility.Wait(10.0)
	
	Debug.Notification("SexLab Aroused: wait...")
	
	Utility.Wait(15.0)
	
	Debug.Notification("SexLab Aroused: Stopping quests...")
	Debug.Trace(Self + ": Resetting quests...")
	
	slaConfigScr slaConfig = Quest.GetQuest("sla_Config") As slaConfigScr
	slaMainScr slaMain = Quest.GetQuest("sla_Main") As slaMainScr
	slaInternalScr slaInternal = Quest.GetQuest("sla_Internal") As slaInternalScr
	slaFrameworkScr slaFramework = Quest.GetQuest("sla_Framework") As slaFrameworkScr

	slaConfig.ResetToDefault()

	slaMain.Stop()
;	slaConfig.Stop()
	slaInternal.Stop()
	slaFramework.Stop()
	
	Utility.Wait(5.0)
	
	slaMain.Reset()
;	slaConfig.Reset()
	slaInternal.Reset()
	slaFramework.Reset()
	
	slaMain.slaUtil = slaInternal

	Debug.Notification("SexLab Aroused: finished resetting, hit status hotkey to verify success")
	Debug.Trace(Self + ": finished resetting, hit status hotkey to verify success")
EndEvent
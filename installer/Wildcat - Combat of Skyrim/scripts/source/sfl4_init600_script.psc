Scriptname SFL4_Init600_Script extends Quest  

; -----

Spell Property WCT_Ability_Spell_Ab Auto
Spell Property WCT_Ability_Spell_Ab_Player Auto
Spell Property WCT_Ability_Spell_Ab_Legacy Auto
Actor Property PlayerRef Auto
Message Property WCT_Init_Message Auto
Float Property WCT_Delay Auto
Faction Property ForceFullBodyStagger Auto
Spell Property WCT_ConfigurationPower_Spell Auto
Bool Property WCT_AllowConfigSpell Auto
Spell Property WCT_LegacyPlayerAb_Spell_Ab Auto

; ----- 

Event OnInit()

	Utility.Wait(WCT_Delay)
	PlayerRef.RemoveSpell(WCT_Ability_Spell_Ab_Legacy)
	PlayerRef.RemoveSpell(WCT_LegacyPlayerAb_Spell_Ab)
	PlayerRef.AddSpell(WCT_Ability_Spell_Ab,false)
	PlayerRef.AddSpell(WCT_Ability_Spell_Ab_Player,false)
	If WCT_AllowConfigSpell
		PlayerRef.AddSpell(WCT_ConfigurationPower_Spell, false)
	EndIf
	PlayerRef.RemoveFromFaction(ForceFullBodyStagger)
	WCT_Init_Message.Show()

	Stop()

EndEvent

; -----